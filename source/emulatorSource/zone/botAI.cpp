/*	EQEMu EQBOTS:	Everquest Server Emulator
Copyright (C) 2008 EQBOTS  EQEMu AXCLASSIC Development Team (http://www.axclassic.com)

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; version 2 of the License.
	
		This program is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY except by those people which sell it, which
	are required to give you total support for your newly bought product;
	without even the implied warranty of MERCHANTABILITY or FITNESS FOR
	A PARTICULAR PURPOSE.	See the GNU General Public License for more details.
	
		You should have received a copy of the GNU General Public License
		along with this program; if not, write to the Free Software
		Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA	02111-1307	USA

	EQBOTS Custom file coded for the AXClassic project 

 Franck-: EQoffline
 This file was added to the EQEMu project to custom the Bot AI process  
 It's based on MobAI.cpp for the most part but there are a lot of changes/tweaks
 for the bots..
*/

#ifdef EQBOTS

#include "../common/debug.h"
#include <iostream>
using namespace std;
#include <iomanip>
using namespace std;
#include <stdlib.h>
#include <math.h>
#include "npc.h"
#include "masterentity.h"
#include "NpcAI.h"
#include "map.h"
#include "../common/moremath.h"
#include "parser.h"
#include "StringIDs.h"
#include "../common/MiscFunctions.h"

#ifdef WIN32
#define strncasecmp	_strnicmp
#define strcasecmp  _stricmp
#endif

#if !defined(NEW_LoadSPDat) && !defined(DB_LoadSPDat)
	extern SPDat_Spell_Struct spells[SPDAT_RECORDS];
#endif

extern EntityList entity_list;

extern Zone *zone;
extern Parser * parse;

const int Z_AGGRO=10;

const int MobAISpellRange=100; // max range of buffs
const int SpellType_Nuke=1;
const int SpellType_Heal=2;
const int SpellType_Root=4;
const int SpellType_Buff=8;
const int SpellType_Escape=16;
const int SpellType_Pet=32;
const int SpellType_Lifetap=64;
const int SpellType_Snare=128;
const int SpellType_DOT=256;
const int SpellType_Dispel=512;
const int SpellType_InCombatBuff=1024;
const int SpellType_Mez=2048;

const int SpellTypes_Detrimental = SpellType_Nuke|SpellType_Root|SpellType_Lifetap|SpellType_Snare|SpellType_DOT|SpellType_Dispel|SpellType_Mez;
const int SpellTypes_Beneficial = SpellType_Heal|SpellType_Buff|SpellType_Escape|SpellType_Pet|SpellType_InCombatBuff;

#define SpellType_Any		0xFFFF
#ifdef _EQDEBUG
	#define MobAI_DEBUG_Spells	-1
#else
	#define MobAI_DEBUG_Spells	-1
#endif

void Mob::BOT_Process() {
    _ZP(Mob_BOT_Process);
    
    if(!IsAIControlled())
        return;

    if(!(AIthink_timer->Check() || attack_timer.Check(false)))
        return;

	int8 botClass = GetClass();
	uint8 botLevel = GetLevel();

    if(IsCasting() && (botClass != BARD))
        return;
    // A bot wont start its AI if not grouped
	if(IsBot() && !IsGrouped()) {
		SetAppearance(eaSitting);
		if ((!GetNpcMode()) && (!IsBotRaiding())){
		  SendPosUpdate();
		}
		
		if(check_grouped_timer.Enabled()) {
			if(check_grouped_timer.Check(false)) {
				BotDepop();
			}
		} else {
			// Set the timer for something like two minutes
			check_grouped_timer.Start(90000, false);
		}
		return;
	}

	// We must be grouped now
	check_grouped_timer.Disable();

	// The bots need an owner
	if(!BotOwner || BotOwner->qglobal || (GetAppearance() == eaDead) || BotOwner->AmIaBot)
		return;

	if(!IsEngaged()) {
		if(GetFollowID()) {
			// fez_ajer: Allow bot to auto-defend owner
			Mob* target = 0;

			// XXX: Could we use GetAggroCount instead of GetHateAmount?  (it's a little faster)
			// or wrap the whole thing in a test for AggroCount
			if (BotOwner->CastToClient()->AutoAttackEnabled() && BotOwner->GetTarget() &&
				BotOwner->GetTarget()->IsNPC() && BotOwner->GetTarget()->GetHateAmount(BotOwner)) {
				target = BotOwner->GetTarget();
			} else if ((GetBotAutoDefend()) && (BotOwner->CastToClient()->GetAggroCount()) && (IsMoving())) {
				target = BotGetDefensiveTarget(BotOwner);
			}

			if (target) {
				BotOwner->CastToClient()->SetOrderBotAttack(true);
				AddToHateList(target, 1);
				BotOwner->CastToClient()->SetOrderBotAttack(false);
			}
		}
	}

    if(IsEngaged()) { //Ditto


		_ZP(Mob_BOT_Process_IsEngaged);
		if ((!GetNpcMode()) && (!IsBotRaiding())){
		    SendPosUpdate();
		}

		if(IsRooted())
			CastToNPC()->SetTarget(hate_list.GetClosest(this));
		else
			CastToNPC()->SetTarget(hate_list.GetTop(this));

		if(!target)
			return;

		FaceTarget(target);

		// Stop attacking if the target is enraged
		if(!IsBotArcher() && !BehindMob(target, GetX(), GetY()) && target->IsEnraged())
			return;

		if(DivineAura())
			return;
		//Angelox:Node Pathing
		float dist2 = DistNoRoot(*target);
		if ((zone->pathing) && (dist2 > 50)){
		     if ((target) && (!target->IsClient())&&(IsEngaged())){
		        if (((botClass == WARRIOR) || (botClass == RANGER) || (botClass == SHADOWKNIGHT) ||
			  (botClass == BERSERKER) || (botClass == PALADIN) || (botClass == ROGUE) ||
			  (botClass == MONK) || (botClass == BEASTLORD)|| (botClass == BARD))  && (!IsBotArcher())){
				float speed = GetBaseRunspeed()-1.5;
				bool WaypointChanged, NodeReached;
				//SetRunAnimSpeed(speed);
				animation = 21 * GetBaseRunspeed();
				VERTEX Goal = UpdatePath(GetTarget()->GetX(), GetTarget()->GetY(), GetTarget()->GetZ(),
					 speed, WaypointChanged, NodeReached);
				
				if (dist2 < MakeRandomInt(30, 50))
					NodeReached = true;
				
				if(WaypointChanged)
					tar_ndx = 20;

				CalculateNewPosition2(Goal.x, Goal.y, Goal.z, speed);
		       }
		   }
		}//End Angelox

		// Lets see if we can let the main tank build a little aggro.  Let healers and slowers in though
		if((botClass == CLERIC) || (botClass == SHAMAN) || (botClass == ENCHANTER) || (botClass == DRUID))
		{
			// do nothing
		}
		else if(GetBotRaidID())
		{
			BotRaids *br = entity_list.GetBotRaidByMob(this);
			if(br)
			{
				if(br->GetBotMainTank() && (br->GetBotMainTank() != this))
				{
					if(br->GetBotMainTarget() && (br->GetBotMainTarget()->GetHateAmount(br->GetBotMainTank()) < 5000))
					{
						if(target == br->GetBotMainTarget())
						{
							return;
						}
					}
				}
				else {
					if((br->GetBotMainTank() == this) && br->GetBotMainTarget()) {
						// lets turn the targets back to the rest of the raid to help with riposte damage
						if(!IsBackTurned() && br->GetBotMainTarget()->IsEngaged() && (br->GetBotMainTarget()->GetHateAmount(br->GetBotMainTank()) > 500)) {
							float newX = GetX();
							float newY = GetY();
							float newZ = GetZ();
							while(!BehindMob(br->GetBotMainTarget(), GetX(), GetY())) {
								PlotPositionAroundTarget(br->GetBotMainTarget(), newX, newY, newZ);
								CalculateNewPosition2(newX, newY, newZ, GetBaseRunspeed());
							}
							SetBackTurned(true);
						}
					}
				}
			}
		}

		if(GetHPRatio() < 15)
			StartEnrage();

		// Let's check if we have a los with our target.
		// If we don't, our hate_list is wiped.
		// Else, it was causing the bot to aggro behind wall etc... causing massive trains.
		// Angelox: fix for rounding corners
		if(!CheckLosFN(target)){
		    int randmove = MakeRandomInt(-2, 2);
		    if (!zone->pathing){
			InterruptSpell();
			Warp(BotOwner->GetX() + randmove, BotOwner->GetY() + randmove, BotOwner->GetZ());
		    }
		    else if (target){
			float speed = GetBaseRunspeed()-1.5;
			bool WaypointChanged, NodeReached;
			//SetRunAnimSpeed(speed);
			animation = 21 * GetBaseRunspeed();
			VERTEX Goal = UpdatePath(GetTarget()->GetX(), GetTarget()->GetY(), GetTarget()->GetZ(),
				speed, WaypointChanged, NodeReached);

			if(WaypointChanged)
				tar_ndx = 20;

			CalculateNewPosition2(Goal.x, Goal.y, Goal.z, speed);
		   }
		}
		if(!zone->pathing){
		    if((!CheckLosFN(target) && !BotOwner->CheckLosFN(GetTarget()))){
			if (botClass == CLERIC){
			  InterruptSpell();
			     if ((MakeRandomInt(1, 5)) && (SetChat()))
				BotSay("You need to have line of sight with your target.");
			   WipeHateList();	    
			   CastToNPC()->SetTarget(BotOwner);
			}
			InterruptSpell();
			WipeHateList();
			CastToNPC()->SetTarget(BotOwner);
			return;
		    }
		   else if (target){  //Angelox: fixes Z for bouncing or underground bots
		   float zdiff = GetZ() - target->GetZ();
		     if((zdiff != 0)&&(DistNoRootNoZ(*target) < 20)){
			  SendTo(GetX(), GetY(), target->GetZ() - zdiff);
		     }
 		   }
		}
		if((target->IsMezzed()) || (!IsAttackAllowed(target))){
			if (botClass == CLERIC){
				// fez_ajer: We get it, it's mezzed... Just shut up about it.
				//BotSay("We can't do this, target is mezzed or not allowed.");
				WipeHateList();	     
			}
			WipeHateList();
			CastToNPC()->SetTarget(BotOwner);
			return;
		}
		bool is_combat_range = CombatRange(target);
		if(IsBotArcher()) {
			float range = GetBotArcheryRange() + 5.0; //Fudge it a little, client will let you hit something at 0 0 0 when you are at 205 0 0
			mlog(COMBAT__RANGED, "Calculated bow range to be %.1f", range);
			range *= range;
			if(DistNoRootNoZ(*target) > range) {
				mlog(COMBAT__RANGED, "Ranged attack out of range... client should catch this. (%f > %f).\n", DistNoRootNoZ(*target), range);
				//target is out of range, client does a message
				is_combat_range = false;
			}
			else if(DistNoRootNoZ(*target) < (RuleI(Combat, MinRangedAttackDist)*RuleI(Combat, MinRangedAttackDist))) {
				is_combat_range = false;
				AImovement_timer->Check();
				if(IsMoving())
				{
					SetRunAnimSpeed(0);
					SetHeading(target->GetHeading());
					if(moved) {
						moved=false;
						SetMoving(false);
						SendPosUpdate();
					}
					tar_ndx = 0;
				}
			}
			else {
				is_combat_range = true;
			}
		}

        // We're engaged, each class type has a special AI
        // Only melee class will go to melee. Casters and healers will stop and stay behind.
        // We 're a melee or any other class lvl<12. Yes, because after it becomes hard to go into melee for casters.. even for bots..
		if((botLevel <= 12) || (botClass == WARRIOR) || (botClass == PALADIN) || (botClass == RANGER) || (botClass == SHADOWKNIGHT) || (botClass == MONK) || (botClass == ROGUE) || (botClass == BEASTLORD) || (botClass == BERSERKER) || (botClass == BARD))
		{
			cast_last_time = true;
		}
        if(is_combat_range && cast_last_time)
        {
			cast_last_time = false;
            AImovement_timer->Check();
            if(IsMoving())
            {
				SetRunAnimSpeed(0);
				SetHeading(target->GetHeading());
				if(moved) {
					moved=false;
					SetMoving(false);
					SendPosUpdate();
				}
                tar_ndx = 0;
            }

			if(IsBotArcher() && ranged_timer.Check(false)) {
				if(MakeRandomInt(1, 100) > 95) {
					Bot_AI_EngagedCastCheck();
					BotMeditate(false);
				}
				else {
					if(target->GetHPRatio() < 98)
						BotRangedAttack(target);
				}
			}

            // we can't fight if we don't have a target, are stun/mezzed or dead..
            ///TODO Angelox: Might be a split ms here where the mob dies and bot-caster thinks it is not dead, causing zone crash.
            if(!IsBotArcher() && target && !IsStunned() && !IsMezzed() && (GetAppearance() != eaDead))
            {
                // First, special attack per class (kick, backstab etc..)
                CastToNPC()->DoClassAttacks(target);

                //try main hand first
                if(attack_timer.Check())
                {
                    BotAttackMelee(target, SLOT_PRIMARY);
					bool tripleSuccess = false;
                    if(BotOwner && target && CanThisClassDoubleAttack()) {

						if(BotOwner && CheckBotDoubleAttack()) {
							BotAttackMelee(target, SLOT_PRIMARY, true);
						}
						if(BotOwner && target && SpecAttacks[SPECATK_TRIPLE] && CheckBotDoubleAttack(true)) {
							tripleSuccess = true;
							BotAttackMelee(target, SLOT_PRIMARY, true);
						}
						//quad attack, does this belong here??
						if(BotOwner && target && SpecAttacks[SPECATK_QUAD] && CheckBotDoubleAttack(true)) {
							BotAttackMelee(target, SLOT_PRIMARY, true);
						}
                    }

					// Handle Flurrys
					if((botClass == WARRIOR) && (botLevel >= 59)) {
						int flurrychance = 0;
						if(botLevel >= 61) { // Flurry AA's
							flurrychance += 50;
						}
						else if(botLevel == 60) {
							flurrychance += 25;
						}
						else if(botLevel == 59) {
							flurrychance += 10;
						}
						if(tripleSuccess) {
							tripleSuccess = false;
							if(botLevel >= 65) { // Raging Flurry AA's
								flurrychance += 50;
							}
							else if(botLevel == 64) {
								flurrychance += 25;
							}
							else if(botLevel == 63) {
								flurrychance += 10;
							}
						}
						if(MakeRandomInt(0, 999) < flurrychance) {
							Message_StringID(MT_Flurry, 128);
							BotAttackMelee(target, SLOT_PRIMARY, true);
							BotAttackMelee(target, SLOT_PRIMARY, true);
						}
					}

					if(target && (botClass == MONK)) { // Rapid Strikes AA
						int chance_xhit1 = 0;
						int chance_xhit2 = 0;
						if(botLevel >= 69) {
							chance_xhit1 = 20;
							chance_xhit2 = 10;
						}
						else if(botLevel == 68) {
							chance_xhit1 = 16;
							chance_xhit2 = 8;
						}
						else if(botLevel == 67) {
							chance_xhit1 = 14;
							chance_xhit2 = 6;
						}
						else if(botLevel == 66) {
							chance_xhit1 = 12;
							chance_xhit2 = 4;
						}
						else if(botLevel == 65) {
							chance_xhit1 = 10;
							chance_xhit2 = 2;
						}
						if(MakeRandomInt(1,100) < chance_xhit1)
							BotAttackMelee(target, SLOT_PRIMARY, true);
						if(target && (MakeRandomInt(1,100) < chance_xhit2))
							BotAttackMelee(target, SLOT_PRIMARY, true);
					}

					// Handle Punishing Blade and Speed of the Knight and Wicked Blade
                    if(target && ((botClass == MONK)||(botClass == RANGER)||(botClass == WARRIOR)||(botClass == PALADIN)||(botClass == SHADOWKNIGHT))) {
						if(botLevel >= 61) {
							ItemInst* weapon = NULL;
							const Item_Struct* botweapon = NULL;
							botweapon = database.GetItem(CastToNPC()->GetEquipment(MATERIAL_PRIMARY));
							if(botweapon != NULL) {
								weapon = new ItemInst(botweapon);
							}
							if(weapon) {
								if( weapon->GetItem()->ItemType == ItemType2HS ||
									weapon->GetItem()->ItemType == ItemType2HB ||
									weapon->GetItem()->ItemType == ItemType2HPierce )
								{
									int extatk = 0;
									if(botLevel >= 61) {
										extatk += 5;
									}
									if(botLevel >= 63) {
										extatk += 5;
									}
									if(botLevel >= 65) {
										extatk += 5;
									}
									if(botLevel >= 70) {
										extatk += 15;
									}
									if(MakeRandomInt(0, 100) < extatk) {
										BotAttackMelee(target, SLOT_PRIMARY, true);
									}
								}
							}
						}
					}
				}
				
                //now off hand
                if(target && attack_dw_timer.Check() && CanThisClassDualWield())
                {
                    //can only dual weild without a weapon if you're a monk
                    if((GetEquipment(MATERIAL_SECONDARY) != 0) || (botClass == MONK))
                    {
						const Item_Struct* weapon = NULL;
						weapon = database.GetItem(CastToNPC()->GetEquipment(MATERIAL_PRIMARY));
						int weapontype = NULL;
						bool bIsFist = true;
						if(weapon != NULL) {
							weapontype = weapon->ItemType;
							bIsFist = false;
						}
						if(bIsFist || ((weapontype != ItemType2HS) && (weapontype != ItemType2HPierce) && (weapontype != ItemType2HB))) {
							float DualWieldProbability = (GetSkill(DUAL_WIELD) + botLevel) / 400.0f;
							if(botLevel >= 59) { // AA Ambidexterity
								DualWieldProbability += 0.1f;
							}
							//discipline effects:
							DualWieldProbability += (spellbonuses.DualWeildChance + itembonuses.DualWeildChance) / 100.0f;

							float random = MakeRandomFloat(0, 1);
							if (random < DualWieldProbability) { // Max 78% of DW
								BotAttackMelee(target, SLOT_SECONDARY);
								if(target && CanThisClassDoubleAttack() && CheckBotDoubleAttack()) {
									BotAttackMelee(target, SLOT_SECONDARY);
								}
							}
						}
                    }
                }

                //Bard, rangers, SKs, Paladin can cast also
				if(botClass == BARD || botClass == RANGER || botClass == SHADOWKNIGHT || botClass == PALADIN || botClass == BEASTLORD) {
                    Bot_AI_EngagedCastCheck();
					BotMeditate(false);
					if(!hate_list.IsEmpty())
					{
						CastToNPC()->SetTarget(hate_list.GetTop(this));
					}
				}
            }
        } //end is within combat range
        // Now, if we re casters, we have a particular AI.
        if((botClass == CLERIC) || (botClass == DRUID) || (botClass == SHAMAN) || (botClass == NECROMANCER) || (botClass == WIZARD) || (botClass == MAGICIAN) || (botClass == ENCHANTER))
        {
			cast_last_time = true;
            // First, let's make them stop
            AImovement_timer->Check();
            if(IsMoving())
            {
				SetRunAnimSpeed(0);
				SetHeading(target->GetHeading());
				if(moved) {
					moved=false;
					SetMoving(false);
					SendPosUpdate();
				}
                tar_ndx = 0;
            }

			BotMeditate(false);

            // Then, use their special engaged AI.
			Bot_AI_EngagedCastCheck();
        } //end is within combat range
        else {
            //we cannot reach our target...
            // See if we can summon the mob to us
            if(!HateSummon() && !IsBotArcher())
            {
                //could not summon them, start pursuing...
                // TODO: Check here for another person on hate list with close hate value
                if(target && Bot_AI_PursueCastCheck())
                {}
                else if(target && AImovement_timer->Check())
                {
                    if(!IsRooted()) {
                        mlog(AI__WAYPOINTS, "Pursuing %s while engaged.", target->GetName());
                        CalculateNewPosition2(target->GetX(), target->GetY(), target->GetZ(), GetRunspeed(), false);
                    } else {
						SetHeading(target->GetHeading());
						if(moved) {
							moved=false;
							SetMoving(false);
							SendPosUpdate();
						}
                    }
                }
            }
        }
    }
    else {
        // Franck: EQoffline
        // Ok if we're not engaged, what's happening..
		if (GetNpcMode()){
		  if(IsBackTurned()) 
		     SetBackTurned(false);
		}
		else{
		  FaceTarget(entity_list.GetMob(GetFollowID()));
		}
		
		if (!dont_moveYet_timer.Enabled()){ //Angelox: So bots won't jump at every mov you make while following.
		   dont_moveYet_timer.Start(6000, false);
		}
		
		if (!check_Moved_timer.Enabled()){ //Angelox: Start the movement checks - this makes sure they are stopped and not lagged, also keeps them from trying to cast or med while moving.
		   check_Moved_timer.Start(6000, false);
		}
		CastToNPC()->SetTarget(entity_list.GetMob(GetFollowID()));
		if(!IsMoving()) {
		    if (check_Moved_timer.Enabled()){
			if(check_Moved_timer.Check(false)) {
			BotMeditate(true);
			Bot_AI_IdleCastCheck(); // let's rebuff, heal, etc..
			}
		    }
		}
		
	    // now the followID: that's what happening as the bots follow their leader.
	    if/*(*/(GetFollowID()) /*&& (dont_moveYet_timer.Check(false)))*/
	    {
			int randmove = MakeRandomInt(-2, 2);
			if(!target) {
				SetFollowID(0);
			}
			else if ((AImovement_timer->Check()) && (target)){
				float dist2 = DistNoRoot(*target);
				SetRunAnimSpeed(0);
				int zoNe = zone->GetZoneID();
				bool outDoor = zone->CanCastOutdoor();
				if (IsBotRaiding()){
				  if (dist2 > 5000){ //Angelox: We need to avoid lag so, if the bot falls too far behind, warp'm
				    InterruptSpell();
				    Warp(target->GetX(), target->GetY(), target->GetZ());
				    CalculateNewPosition2(target->GetX(), target->GetY(), target->GetZ(), GetBaseRunspeed(), false);
				  }
				}
				
				else {
				  if (dist2 > 20000){
				    InterruptSpell();
				    Warp(target->GetX(), target->GetY(), target->GetZ());
				    CalculateNewPosition2(target->GetX(), target->GetY(), target->GetZ(), GetBaseRunspeed(), false);
				  }
				}
				
				if ((!target->IsClient()) && (dist2>30)){
				  if (!zone->pathing){
				   CalculateNewPosition2(target->GetX(), target->GetY(), target->GetZ(), GetBaseRunspeed(), false);
				  }
				  else { //Angelox Node pathing
				    float speed = GetBaseRunspeed();
				    //animation = 21 * speed;
				    bool WaypointChanged, NodeReached;
				    VERTEX Goal = UpdatePath(GetTarget()->GetX(), GetTarget()->GetY(), GetTarget()->GetZ(),
					    speed, WaypointChanged, NodeReached);

				    if(WaypointChanged)
					    tar_ndx = 20;

				    CalculateNewPosition2(Goal.x, Goal.y, Goal.z, speed);
				  } //Node Patheng end
				   
				   if ((!IsBotRaiding()) && (SetChat())){
				      if (MakeRandomInt(1,1000) < 2){
					if (zoNe == 58)
					  SayRandomBotMessage(17);
					else if (zoNe == 44)
					  SayRandomBotMessage(18);
					else if (zoNe == 54)
					  SayRandomBotMessage(21);
					else if (zoNe == 56)
					  SayRandomBotMessage(22);
					else if(GetClass() == BARD)
					  SayRandomBotMessage(20);
					else if (outDoor)
					  SayRandomBotMessage(23);
					else if (!outDoor)
					  SayRandomBotMessage(19);
				      }
				   }
					
					if (check_Moved_timer.Enabled()) {
					  check_Moved_timer.Start(4000, false);
					}
				 }
				 
				else if (dist2>150) {
				  if (!zone->pathing){
				    CalculateNewPosition2(target->GetX(), target->GetY(), target->GetZ(), GetBaseRunspeed(), false);
				  }
				  else { //Angelox Node pathing
				    //animation = 21 * speed;
				    float speed = GetBaseRunspeed();
				    bool WaypointChanged, NodeReached;
				    VERTEX Goal = UpdatePath(GetTarget()->GetX(), GetTarget()->GetY(), GetTarget()->GetZ(),
					    speed, WaypointChanged, NodeReached);

				    if(WaypointChanged)
					    tar_ndx = 20;

				    CalculateNewPosition2(Goal.x, Goal.y, Goal.z, speed);
				  } //Node Patheng end
				  
				     if ((!IsBotRaiding()) && (SetChat())){
				      if (MakeRandomInt(1,1000) < 2){
					if (zoNe == 58)
					  SayRandomBotMessage(17);
					else if (zoNe == 44)
					  SayRandomBotMessage(18);
					else if (zoNe == 54)
					  SayRandomBotMessage(21);
					else if (zoNe == 56)
					  SayRandomBotMessage(22);
					else if(GetClass() == BARD)
					  SayRandomBotMessage(20);
					else if (outDoor)
					  SayRandomBotMessage(23);
					else if (!outDoor)
					  SayRandomBotMessage(19);
				      }
				     }
					
					if (check_Moved_timer.Enabled()) {
					  check_Moved_timer.Start(4000, false);
					}
				}
				
				else {
					SetHeading(target->GetHeading());
					if(moved) {
						
					    moved=false;
					    SetMoving(false);
						
						if (!IsEngaged())
						    FaceTarget(target);
						  
						//Angelox: spread out the bots a little, and make sure they're in the right position.
						if (dont_moveYet_timer.Check(false)) { 
						    InterruptSpell();
						    Warp(this->GetX() + randmove, this->GetY() + randmove, this->GetZ());
						      if(dont_moveYet_timer.Enabled())
							dont_moveYet_timer.Start(MakeRandomInt(500,1500), false);
						}
						//Angelox: fixes Z for bouncing or underground bots.
						if (!zone->pathing){
						    if (!IsEngaged()){
						    float zdiff = GetZ() - target->GetZ();
							if(zdiff != 0){
							  SendTo(GetX(), GetY(), target->GetZ() - zdiff);
							}
						    }
						}
					    SendPosUpdate();
					}
				}
			}
		}
    }
}


// franck: EQoffline
// This function is reworked for the caster bots, when engaged.
// Depending of the class:
// -- Cleric, Druid, Shaman, Paladin will first check if there is someone to heal.
// -- Wizard, Mage, Necro will start the nuke.  
// -- TODO : Enchanter will nuke until it it sees if there is an add. 
bool NPC::Bot_AI_EngagedCastCheck() {
	if (target && AIautocastspell_timer->Check(false)) {
		_ZP(Bot_AI_Process_engaged_cast);
		AIautocastspell_timer->Disable();	//prevent the timer from going off AGAIN while we are casting.
		
		int8 botClass = GetClass();
		uint8 botLevel = GetLevel();

		mlog(AI__SPELLS, "Engaged autocast check triggered. Trying to cast healing spells then maybe offensive spells.");

        BotRaids *br = entity_list.GetBotRaidByMob(this);
		if(botClass == CLERIC)
        {
			if(br && IsBotRaiding()) {
				// try to heal the raid main tank
				if(br->GetBotMainTank() && (br->GetBotMainTank()->GetHPRatio() < 80)) {
					if(!Bot_AICastSpell(br->GetBotMainTank(), 80, SpellType_Heal)) {
						if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 70, MobAISpellRange, SpellType_Heal)) {
							if(!Bot_AICastSpell(this, 80, SpellType_Heal)) {
								AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
								return true;
							}
						}
					}
				}
				// try to heal the raid secondary tank
				else if(br->GetBotSecondTank() && (br->GetBotSecondTank()->GetHPRatio() < 80)) {
					if(!Bot_AICastSpell(br->GetBotSecondTank(), 70, SpellType_Heal)) {
						if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 70, MobAISpellRange, SpellType_Heal)) {
							if(!Bot_AICastSpell(this, 70, SpellType_Heal)) {
								AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
								return true;
							}
						}
					}
				}
			}
            if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 70, MobAISpellRange, SpellType_Heal)) {
				if(!Bot_AICastSpell(this, 70, SpellType_Escape)) {
					if(!Bot_AICastSpell(this, 70, SpellType_Heal)) {
						if(!Bot_AICastSpell(target, 5, SpellType_DOT | SpellType_Nuke | SpellType_Lifetap | SpellType_Dispel)) {
							AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
							return true;
						}
					}
				}
			}
		}
        else if((botClass == DRUID) || (botClass == SHAMAN))
        {
            if (!Bot_AICastSpell(this, 70, SpellType_Escape | SpellType_Pet)) {
				if (!Bot_AICastSpell(this, 70, SpellType_Heal)) {
					if (!entity_list.Bot_AICheckCloseBeneficialSpells(this, 70, MobAISpellRange, SpellType_Heal)) {
						if(!Bot_AICastSpell(target, 100, SpellType_Root | SpellType_Snare | SpellType_DOT | SpellType_Nuke | SpellType_Lifetap | SpellType_Dispel)) {
							if(!Bot_AICastSpell(this, 100, SpellType_InCombatBuff)) {
								AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
								return true;
							}
						}
					}
				}
			}
        }
		else if((botClass == PALADIN) || (botClass == SHADOWKNIGHT) || (botClass == BEASTLORD) || (botClass == RANGER)) {
            if (!Bot_AICastSpell(this, 60, SpellType_Escape | SpellType_Pet)) {
				if (!Bot_AICastSpell(this, 30, SpellType_Heal | SpellType_InCombatBuff)) {
					if (!entity_list.Bot_AICheckCloseBeneficialSpells(this, 30, MobAISpellRange, SpellType_Heal)) {
						if(!Bot_AICastSpell(target, 60, SpellType_Root | SpellType_Snare | SpellType_DOT | SpellType_Nuke | SpellType_Lifetap | SpellType_Dispel)) {
							AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
							return true;
						}
					}
				}
			}
		}
		
		// TODO: Make enchanter to be able to mez
		else if(botClass == ENCHANTER) {
			// fez_ajer: Automatically mez incoming mobs
			if (GetBotAutoMez()) {
				Mob *mezMob = BotGetMobToMez(1,0,0);
				if (mezMob && CastToNPC()->Bot_Command_MezzTarget(mezMob,1,0,0)) {
				   mezMob->SetDontMezMeBefore(Timer::GetCurrentTime() + 2000);
				   
				   if ((!IsBotRaiding()) && (SetChat())){
				      if (MakeRandomInt(1,100) < 40){
					SayRandomBotMessage(32);
				      } 
				   }
				   else{
				     BotSay("Mezzing << %s >>", mezMob->GetCleanName());
				   }
				   return false;
				}
			}
			if (!Bot_AICastSpell(this, 60, SpellType_Escape | SpellType_Pet | SpellType_InCombatBuff) | SpellType_Mez) {
				if(!Bot_AICastSpell(target, 60, SpellType_DOT | SpellType_Nuke | SpellType_Dispel) | SpellType_Mez) {
					// fez_ajer: With enchanter auto-mez, we may need to lower the time between cast checks
					AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
					return true;
				}
			}
		}
		else if(botClass == NECROMANCER) {
			// fez_ajer: Automatically mez incoming mobs
		      SetBotAutoMez(false); // TODO: Necro not working yet, crashes the zone (remove this line for testing).
			if (GetBotAutoMez()) {
			  Mob *mezMob = BotGetMobToMez(0,0,1);
			  if (mezMob->GetBodyType() == 3){
				if (mezMob && CastToNPC()->Bot_Command_MezzTarget(mezMob,0,0,1)){
				   mezMob->SetDontMezMeBefore(Timer::GetCurrentTime() + 2000);
				   if ((!IsBotRaiding()) && (SetChat())){
				      if (MakeRandomInt(1,100) < 40){
					SayRandomBotMessage(32); //TODO This is for chanter - need necro.
				      } 
				   }
				   else{
				     BotSay("Mezzing << %s >>", mezMob->GetCleanName());
				   }
				   return false;
				}
			}
			}
			if (!Bot_AICastSpell(this, 60, SpellType_Escape | SpellType_Pet | SpellType_InCombatBuff | SpellType_Mez)) {
				if(!Bot_AICastSpell(target, 60, SpellType_Root | SpellType_Snare | SpellType_DOT | SpellType_Nuke | SpellType_Lifetap | SpellType_Dispel | SpellType_Mez)) {
					//no spell to cast, try again soon.
					AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
					return true;
				}
			
			}
		}
		else if(botClass == BARD) {
			// Angelox:fez_ajer's Automatic mez incoming mobs for Bards
			if (GetBotAutoMez()) {
				Mob *mezMob = BotGetMobToMez(0,1,0);
				if (mezMob && CastToNPC()->Bot_Command_MezzTarget(mezMob,0,1,0)) {
				   mezMob->SetDontMezMeBefore(Timer::GetCurrentTime() + 2000);
				   
				   if ((!IsBotRaiding()) && (SetChat())){
				      if (MakeRandomInt(1,100) < 40){
					SayRandomBotMessage(33);
				      } 
				   }
				   else{
				     BotSay("Mezzing << %s >>", mezMob->GetCleanName());
				   }
				   return false;
				}
			}		  
			if(!Bot_AICastSpell(this, 100, SpellType_Buff | SpellType_InCombatBuff | SpellType_Mez)) {
				if(!Bot_AICastSpell(target, 100, SpellType_Nuke | SpellType_Dispel | SpellType_Escape | SpellType_Mez)) {// Bards will use their debuff songs
					AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
					return true;
				}					
			}
		}
		else if((botClass == WIZARD) || (botClass == MAGICIAN)) {
			if (!Bot_AICastSpell(this, 60, SpellType_Escape | SpellType_Pet | SpellType_InCombatBuff)) {
				if(!Bot_AICastSpell(target, 60, SpellType_Root | SpellType_Snare | SpellType_DOT | SpellType_Nuke | SpellType_Lifetap | SpellType_Dispel)) {
					//no spell to cast, try again soon.
					AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
					return true;
				}
			}
		}

		// And for all the others classes..
		else {
            if(!Bot_AICastSpell(this, 70, SpellType_Heal | SpellType_Escape | SpellType_InCombatBuff)) {	// heal itself
				if (!entity_list.Bot_AICheckCloseBeneficialSpells(this, 30, MobAISpellRange, SpellType_Heal)) {	// heal others
					if(!Bot_AICastSpell(target, 60, SpellTypes_Detrimental)) {		// nuke..
						AIautocastspell_timer->Start(RandomTimer(500, 2000), false);							// timer 5 t 20 seconds
						return true;
					}
				}
			}
		}
		if(botClass != BARD) {
			AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
		}
		return true;
	}
	return false;
}

bool MobCompareHP(Mob* mobA, Mob* mobB)
{
	if (!mobB)
		return false;
	return (!mobA) ? true : (mobA->GetHPRatio() < mobB->GetHPRatio());
}

bool MobComparePetHP(Mob* mobA, Mob* mobB)
{
	if (!mobB)
		return false;
	return (!mobA) ? true : MobCompareHP(mobA->GetPet(), mobB->GetPet());
}

// franck: EQoffline
// This function has been reworked for the caster bots, when engaged.
// Healers bots must heal thoses who loose HP.
bool EntityList::Bot_AICheckCloseBeneficialSpells(NPC* caster, int8 iChance, float iRange, int16 iSpellTypes) {
	_ZP(EntityList_Bot_AICheckCloseBeneficialSpells);

	if((iSpellTypes&SpellTypes_Detrimental) != 0) {
		//according to live, you can buff and heal through walls...
		//now with PCs, this only applies if you can TARGET the target, but
		// according to Rogean, Live NPCs will just cast through walls/floors, no problem..
		//
		// This check was put in to address an idle-mob CPU issue
		_log(AI__ERROR, "Error: detrimental spells requested from AICheckCloseBeneficialSpells!!");
		return(false);
	}
	
	if(!caster)
		return false;

	if(!caster->AI_HasSpells())
		return false;
	
	if (iChance < 100) {
		int8 tmp = MakeRandomInt(1, 100);
		if (tmp > iChance)
			return false;
	}

	// Franck: EQoffline.
	// Ok, Beneficial spells depend of the class of the caster also..
	int8 botCasterClass = caster->GetClass();;

	// Heal and buffs spells might have a different chance, that's why I separate them .
	if( botCasterClass == CLERIC || botCasterClass == DRUID || botCasterClass == SHAMAN || botCasterClass == PALADIN
	  || botCasterClass == BEASTLORD || botCasterClass == RANGER || botCasterClass == NECROMANCER)
	{
		//If AI_EngagedCastCheck() said to the healer that he had to heal
		if( iSpellTypes == SpellType_Heal )	// 
		{
			// check raids
			if( caster->CastToMob()->IsGrouped() && caster->CastToMob()->IsBotRaiding() && (entity_list.GetBotRaidByMob(caster) != NULL))
			{
				BotRaids *br = entity_list.GetBotRaidByMob(caster);
				// boolean trying to ai the heal rotation, prolly not working well.
				if(br) {
					if(br->GetBotMainTank() && (br->GetBotMainTank()->GetHPRatio() < 80))
					{
						if(caster->Bot_AICastSpell(br->GetBotMainTank(), 70, SpellType_Heal)) {
							return true;
						}
					}
					else if(br->GetBotSecondTank() && (br->GetBotSecondTank()->GetHPRatio() < 80))
					{
						if(caster->Bot_AICastSpell(br->GetBotSecondTank(), 70, SpellType_Heal)) {
							return true;
						}
					}
				}
			}
			// Angelox4
			// check in group
			if(caster->IsGrouped())
			{
				Group *g = entity_list.GetGroupByMob(caster);
				if(g) {
					// Take a copy of the group list for sorting
					int CurMana = caster->GetMana();
					Mob* GroupMemberByHP[MAX_GROUP_MEMBERS];
					for(int i = 0; i < MAX_GROUP_MEMBERS; i++) {
						GroupMemberByHP[i] = g->members[i];
					}
					// Try healing players in reverse order of HP ratio
					std::sort(GroupMemberByHP, GroupMemberByHP + (sizeof(GroupMemberByHP) / sizeof(GroupMemberByHP[0])), MobCompareHP);
					for(int i = 0; i < MAX_GROUP_MEMBERS; i++) {
						//Angelox If Cleric is dieing, DivineAura is attempted.
						if ((GroupMemberByHP[i])&& (!GroupMemberByHP[i]->qglobal && botCasterClass == CLERIC)&&
						   (caster->CastToMob()->GetClass() == CLERIC) && (caster->GetHPRatio() < 20)){
						     if (!caster->CastToClient()->divine_aura_timer.Enabled()){
						       	 caster->InterruptSpell();
							 if (caster->CastToClient()->SetChat())
							    caster->BotSay("<< I'm dieing here! Trying DivineAura.. >>");
							   if(caster->Bot_Command_HealTarget (5,caster)){
							    return true;
							  }
						      }
						 }
						//Angelox: If HP Drops under 36, Clerics/Druids/Necros/Shamans focus on that bot with quick heals.						 
						if ((GroupMemberByHP[i]) && (!GroupMemberByHP[i]->CastToMob()->DivineAura()) && (!GroupMemberByHP[i]->qglobal) && ((GroupMemberByHP[i]->GetHPRatio() > 1) 
						  && (GroupMemberByHP[i]->GetHPRatio() < 36)) && ((botCasterClass == CLERIC) || (botCasterClass == DRUID)
						  || (botCasterClass == NECROMANCER) || (botCasterClass == SHAMAN))) {
						  //caster->InterruptSpell();
						   if ((botCasterClass == DRUID)&&(!caster->CastToClient()->evac_hold_timer.Enabled())){
						     if (caster->CastToClient()->SetChat())
							caster->BotSay("<< Quick heal for %s >>", GroupMemberByHP[i]->GetName());
						    caster->InterruptSpell();
						     if(caster->Bot_Command_HealTarget (2,GroupMemberByHP[i]))
						               return true;}
						   else if (botCasterClass == NECROMANCER){
						     if (caster->CastToClient()->SetChat())
							caster->BotSay("<< Shadow heal for %s >>", GroupMemberByHP[i]->GetName());
						    caster->InterruptSpell();
						     if(caster->Bot_Command_HealTarget (4,GroupMemberByHP[i]))
						               return true;}
						   else if (botCasterClass == SHAMAN){
						     if (caster->CastToClient()->SetChat())
							caster->BotSay("<< Quick heal for %s >>", GroupMemberByHP[i]->GetName());
						    caster->InterruptSpell();
						     if(caster->Bot_Command_HealTarget (1,GroupMemberByHP[i]))
						               return true;}
						   else if (botCasterClass == CLERIC){
						     if (caster->CastToClient()->SetChat())
							caster->BotSay("<< Quick heal for %s >>", GroupMemberByHP[i]->GetName());
						    caster->InterruptSpell();
						     if(caster->Bot_Command_HealTarget (3,GroupMemberByHP[i]))
						               return true;}
						}
						if ((!caster->CastToClient()->evac_hold_timer.Enabled()) && (GroupMemberByHP[i]) && 
						   (!GroupMemberByHP[i]->CastToMob()->DivineAura()) && (!GroupMemberByHP[i]->qglobal) && 
						   ((GroupMemberByHP[i]->GetHPRatio() > 25) && (GroupMemberByHP[i]->GetHPRatio() < 80)) && 
						   ((botCasterClass == CLERIC) || (botCasterClass == DRUID) || (botCasterClass == SHAMAN))){
						  //if (battleID == 2){ //BattleHeal routine
						    int SayCheck = MakeRandomInt(0,100);
						    uint8 botLevel = GroupMemberByHP[i]->GetLevel();
						  if (botLevel > 38){
						    if ((botCasterClass == CLERIC) && (GroupMemberByHP[i]->GetClass() == WARRIOR)){
						      if (CurMana < 400){
							if ((SayCheck < 25) && (caster->CastToClient()->SetChat()))
							caster->BotSay("Not enough mana for CHeal!");
							       return true;}
						    if (caster->CastToClient()->SetChat())
						      caster->BotSay("<< Attempting CHeal on %s >>", GroupMemberByHP[i]->GetName());
						      //caster->InterruptSpell();
						        if(caster->Bot_Command_HealTarget (8,GroupMemberByHP[i]))
						               return true;}
						    else if ((botCasterClass == CLERIC) && (GroupMemberByHP[i]->GetClass() != WARRIOR)){
						      if ((((CurMana < 600) && (botLevel > 62)) || ((CurMana < 490) && (botLevel > 57)) ||
							  ((CurMana < 355) && (botLevel > 52)) || ((CurMana < 167) && (botLevel > 50)) ||
							  ((CurMana < 185) && (botLevel > 29)) || ((CurMana < 115) && (botLevel > 19)) ||
							  ((CurMana < 65) && (botLevel > 9)) || ((CurMana < 28) && (botLevel > 3)) ||
							  ((CurMana < 10) && (botLevel > 0))) && ((caster->CastToClient()->SetChat()) && (SayCheck < 26))){
							    caster->BotSay("Not enough mana for a Heal!");
							       return true;}
							if (GroupMemberByHP[i]->GetHPRatio() < 55) {
							  if (caster->CastToClient()->SetChat())
							    caster->BotSay("<< Healing %s >>", GroupMemberByHP[i]->GetName());
						         caster->InterruptSpell();
						         if(caster->Bot_Command_HealTarget (3,GroupMemberByHP[i]))
						               return true;}
						      }
						    if ((botCasterClass == DRUID)&&(!caster->CastToClient()->evac_hold_timer.Enabled()) && (GroupMemberByHP[i]->GetHPRatio() < 50)){
						      if ((((CurMana < 600) && (botLevel > 63)) || ((CurMana < 560) && (botLevel > 62)) ||
							  ((CurMana < 600) && (botLevel > 57)) || ((CurMana < 185) && (botLevel > 50)) ||
							  ((CurMana < 115) && (botLevel > 28)) || ((CurMana < 65) && (botLevel > 18)) ||
							  ((CurMana < 28) && (botLevel > 8)) || ((CurMana < 10) && (botLevel > 0))) && ((SayCheck < 26) && (caster->CastToClient()->SetChat()))){
							    caster->BotSay("Not enough mana for a Heal!");
							       return true;}
							 if (caster->CastToClient()->SetChat())
							    caster->BotSay("<< Healing %s >>", GroupMemberByHP[i]->GetName());
						     caster->InterruptSpell();
						      if(caster->Bot_Command_HealTarget (2,GroupMemberByHP[i]))
						               return true;}
						    else if (botCasterClass == NECROMANCER){
						      if (caster->CastToClient()->SetChat())
							caster->BotSay("<< Shadow heal for %s >>", GroupMemberByHP[i]->GetName());
						     caster->InterruptSpell();
						      if(caster->Bot_Command_HealTarget (4,GroupMemberByHP[i]))
						               return true;}
						    else if ((botCasterClass == SHAMAN) && (GroupMemberByHP[i]->GetHPRatio() < 50)){
						      if ((((CurMana < 331) && (botLevel > 54)) || ((CurMana < 185) && (botLevel > 50)) ||
							  ((CurMana < 115) && (botLevel > 28)) || ((CurMana < 65) && (botLevel > 18)) ||
							  ((CurMana < 28) && (botLevel > 8)) || ((CurMana < 10) && (botLevel > 0))) && ((SayCheck < 26) && (caster->CastToClient()->SetChat()))){
							    caster->BotSay("Not enough mana for a Heal!");
							       return true;}
							if (caster->CastToClient()->SetChat())
							  caster->BotSay("<< Healing %s >>", GroupMemberByHP[i]->GetName());
						     caster->InterruptSpell();
						      if(caster->Bot_Command_HealTarget (1,GroupMemberByHP[i]))
						               return true;}
						  }
						  //else if (battleID < 2){
						  else if (botLevel < 39){
							if(caster->Bot_AICastSpell(GroupMemberByHP[i], 70, SpellType_Heal))
								return true;
						  }
						}
						if ((GroupMemberByHP[i]) && (!GroupMemberByHP[i]->CastToMob()->DivineAura()) && (!GroupMemberByHP[i]->qglobal) && (GroupMemberByHP[i]->GetHPRatio() < 80)
						   && ((botCasterClass != CLERIC) || (botCasterClass != DRUID) || (botCasterClass != NECROMANCER) || (botCasterClass != SHAMAN))){
							if(caster->Bot_AICastSpell(GroupMemberByHP[i], 70, SpellType_Heal))
								return true;
						}
					}

					// Try healing pets in reverse order of HP ratio
					std::sort(GroupMemberByHP, GroupMemberByHP + (sizeof(GroupMemberByHP) / sizeof(GroupMemberByHP[0])), MobComparePetHP);
					for(int i = 0; i < MAX_GROUP_MEMBERS; i++) {
						//Angelox Quick heal for pet
						if ((GroupMemberByHP[i]) && (!GroupMemberByHP[i]->qglobal) && (GroupMemberByHP[i]->GetPetID()) &&
						    (GroupMemberByHP[i]->GetPet()->GetHPRatio() < 30)){
						  //caster->InterruptSpell();
						   if ((botCasterClass == DRUID)&&(!caster->CastToClient()->evac_hold_timer.Enabled())){
						     if (caster->CastToClient()->SetChat())
						      caster->BotSay("<< Quick heal for %s >>", GroupMemberByHP[i]->GetName());
						    caster->InterruptSpell();
						     if(caster->Bot_Command_HealTarget (2,GroupMemberByHP[i]->GetPet()))
						               return true;}
						   else if (botCasterClass == NECROMANCER){
						     if (caster->CastToClient()->SetChat())
						      caster->BotSay("<< Shadow heal for %s >>", GroupMemberByHP[i]->GetName());
						    caster->InterruptSpell();
						     if(caster->Bot_Command_HealTarget (4,GroupMemberByHP[i]->GetPet()))
						               return true;}
						   else if (botCasterClass == SHAMAN){
						     if (caster->CastToClient()->SetChat())
						      caster->BotSay("<< Quick heal for %s >>", GroupMemberByHP[i]->GetName());
						    caster->InterruptSpell();
						     if(caster->Bot_Command_HealTarget (1,GroupMemberByHP[i]->GetPet()))
						               return true;}
						   else if (botCasterClass == CLERIC){
						     if (caster->CastToClient()->SetChat())
						      caster->BotSay("<< Quick heal for %s >>", GroupMemberByHP[i]->GetName());
						    caster->InterruptSpell();
						     if(caster->Bot_Command_HealTarget (3,GroupMemberByHP[i]->GetPet()))
						               return true;}
						  }
						if ((GroupMemberByHP[i]) && (!GroupMemberByHP[i]->qglobal) &&( GroupMemberByHP[i]->GetPetID()) && 
						   (botCasterClass != CLERIC) && (GroupMemberByHP[i]->GetPet()->GetHPRatio() < 80)) {
							//caster->BotSay("Trying to heal %s's pet (HP=%2.1f)", GroupMemberByHP[i]->GetName(), GroupMemberByHP[i]->GetPet()->GetHPRatio());
							if(caster->Bot_AICastSpell(GroupMemberByHP[i]->GetPet(), 40, SpellType_Heal))
								return true;
						}
					}
				}
			}
		}
	}
	//Ok for the buffs..
	if( iSpellTypes == SpellType_Buff)
	{
		// Let's try to make Bard working...
		if(botCasterClass == BARD)
		{
			if(caster->Bot_AICastSpell(caster, 100, SpellType_Buff))
				return true;
			else
				return false;
		}
		else
		{
			Group *g = entity_list.GetGroupByMob(caster);
			if(g)/* && (!caster->IsBotRaiding()))*/ {
				for( int i = 0; i<MAX_GROUP_MEMBERS; i++)
				{
					if(g->members[i]) {
						if(caster->Bot_AICastSpell(g->members[i], 100, SpellType_Buff)) {
							return true;
						}
					}
				}
			}

/*			else if(caster->IsBotRaiding()) //Angelox: Idle buffing during raids
			{
				BotRaids* br = entity_list.GetBotRaidByMob(caster);
				if(br)
				{
					for(int i=0; i<MAX_BOT_RAID_GROUPS; ++i)
					{
						if(br->BotRaidGroups[i])
						{
							for(int j=0; j<MAX_GROUP_MEMBERS; ++j)
							{
								if(br->BotRaidGroups[i]->members[j])
								{
								(caster->Bot_AICastSpell(br->BotRaidGroups[i]->members[j], 100, SpellType_Buff));
								}
							}
						}
					}
				return true;
				}
			}*/
		}
	}
	return false;
}


// Franck-add: EQoffline
// This function was reworked a bit for bots.
bool NPC::Bot_AI_IdleCastCheck() {
	if ((AIautocastspell_timer->Check(false)) && (!IsMoving())) {
		_ZP(NPC_Bot_AI_IdleCastCheck);
#if MobAI_DEBUG_Spells >= 25
		cout << "Non-Engaged autocast check triggered: " << this->GetName() << endl;
#endif
		AIautocastspell_timer->Disable();	//prevent the timer from going off AGAIN while we are casting.
		
		//Ok, IdleCastCheck depends of class. 
		// Healers will check if a heal is needed before buffing.
		int8 botClass = GetClass();
		if(botClass == CLERIC || botClass == PALADIN || botClass == RANGER)
		{
			if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 60, MobAISpellRange, SpellType_Buff))
			{
				if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 50, MobAISpellRange, SpellType_Heal))
				{
					if(!Bot_AICastSpell(this, 50, SpellType_Heal | SpellType_Buff))
					{
						if(IsGrouped())
						{
							Group *g = entity_list.GetGroupByMob(this);
							if(g) {
								for(int i=0; i<MAX_GROUP_MEMBERS; ++i)
								{
									if(g->members[i] && !g->members[i]->qglobal && (g->members[i]->GetHPRatio() < 99))
									{
										if(Bot_AICastSpell(g->members[i], 60, SpellType_Heal))
										{
											AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
											return true;
										}
									}
									if(g->members[i] && !g->members[i]->qglobal && g->members[i]->GetPetID())
									{
										if(Bot_AICastSpell(g->members[i]->GetPet(), 60, SpellType_Heal))
										{
											AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
											return true;
										}
									}
								}
							}
						}
						AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
						return(true);
					}
				}
			}
		}
		// Pets class will first cast their pet, then buffs
		else if(botClass == DRUID || botClass == MAGICIAN || botClass == SHADOWKNIGHT || botClass == SHAMAN || botClass == NECROMANCER || botClass == ENCHANTER || botClass == BEASTLORD  || botClass == WIZARD)
		{
			if (!Bot_AICastSpell(this, 100, SpellType_Pet))
			{
				if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 100, MobAISpellRange, SpellType_Buff)) // then buff the group
				{
					if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 40, MobAISpellRange, SpellType_Heal))
					{
						if(!Bot_AICastSpell(this, 40, SpellType_Heal | SpellType_Buff))
						{
							if(IsGrouped())
							{
								Group *g = entity_list.GetGroupByMob(this);
								if(g) {
									for(int i=0; i<MAX_GROUP_MEMBERS; ++i)
									{
										if(g->members[i] && !g->members[i]->qglobal && (g->members[i]->GetHPRatio() < 99))
										{
											if(Bot_AICastSpell(g->members[i], 60, SpellType_Heal))
											{
												AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
												return true;
											}
										}
										if(g->members[i] && !g->members[i]->qglobal && g->members[i]->GetPetID())
										{
											if(Bot_AICastSpell(g->members[i]->GetPet(), 40, SpellType_Heal))
											{
												AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
												return true;
											}
										}
									}
								}
							}
							AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
							return(true);
						}
					}
				}
			}
		}		
		// bard bots
		else if(botClass == BARD)
		{
			Bot_AICastSpell(this, 100, SpellType_Heal);
			AIautocastspell_timer->Start(1000, false);
			return true;
		}

		// and standard buffing for others..
		else {
			if (!Bot_AICastSpell(this, 60, SpellType_Heal | SpellType_Buff | SpellType_Pet))
			{
				if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 40, MobAISpellRange, SpellType_Heal | SpellType_Buff)) {
					AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
					return true;
				}
			}
		}
		AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
		return true;
	}
	return false;
}

// Franck-add: EQoffline
// This function was reworked a bit for bots.
bool NPC::Bot_AICastSpell(Mob* tar, int8 iChance, int16 iSpellTypes) {
	_ZP(NPC_Bot_AICastSpell);

    if (!tar)
		return false;
	
	if(!AI_HasSpells())
		return false;

	if(tar->GetAppearance() == eaDead) {
		if(!(tar->IsClient() && tar->CastToClient()->GetFeigned()))
			return false;
	}

	if (iChance < 100)
		if (MakeRandomInt(0, 100) > iChance)
			return false;
	
	int8 botClass = GetClass();
	uint8 botLevel = GetLevel();

	float dist2;

	if (iSpellTypes & SpellType_Escape)
	    dist2 = 0; 
    else 
	    dist2 = DistNoRoot(*tar);

	bool checked_los = false;	//we do not check LOS until we are absolutely sure we need to, and we only do it once.
	
	float manaR = GetManaRatio();
	for (int i=AIspells.size()-1; i >= 0; i--) {
		if (AIspells[i].spellid <= 0 || AIspells[i].spellid >= SPDAT_RECORDS) {
			// this is both to quit early to save cpu and to avoid casting bad spells
			// Bad info from database can trigger this incorrectly, but that should be fixed in DB, not here
			continue;
		}
		if (iSpellTypes & AIspells[i].type) {
			// manacost has special values, -1 is no mana cost, -2 is instant cast (no mana)
			sint32 mana_cost = AIspells[i].manacost;
			if (mana_cost == -1)
				mana_cost = spells[AIspells[i].spellid].mana;
			else if (mana_cost == -2)
				mana_cost = 0;
			bool extraMana = false;
			sint32 hasMana = GetMana();
			if(RuleB(EQOffline, BotFinishBuffing)) {
				if(mana_cost > hasMana) {
					// Let's have the bots complete the buff time process
					if(iSpellTypes & SpellType_Buff) {
						SetMana(mana_cost);
						extraMana = true;
					}
				}
			}
			if (((((spells[AIspells[i].spellid].targettype==ST_GroupTeleport && AIspells[i].type==2)
				|| spells[AIspells[i].spellid].targettype==ST_AECaster
				|| spells[AIspells[i].spellid].targettype==ST_Group
				|| spells[AIspells[i].spellid].targettype==ST_AEBard)
				&& dist2 <= spells[AIspells[i].spellid].aoerange*spells[AIspells[i].spellid].aoerange)
				|| dist2 <= spells[AIspells[i].spellid].range*spells[AIspells[i].spellid].range) && (mana_cost <= GetMana() || GetMana() == GetMaxMana())) {
					switch (AIspells[i].type) {
					case SpellType_Heal: {
						int8 hpr = (int8)tar->GetHPRatio();
						if (((spells[AIspells[i].spellid].targettype==ST_GroupTeleport || spells[AIspells[i].spellid].targettype == ST_Target || tar == this)
							&& (tar->DontHealMeBefore() < Timer::GetCurrentTime() || hpr < 30)
							&& tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0))
						{
							if (botClass == BARD) {
								int Id = (AIspells[i].spellid);
								if(IsEffectInSpell(AIspells[i].spellid, SE_MovementSpeed) && !zone->CanCastOutdoor())
									break;
								else if(IsEffectInSpell(AIspells[i].spellid, SE_MovementSpeed) && IsBotRaiding())
									break;
								else if (((Id == 717) || (Id == 2605) || (Id == 2007) || (Id == 1330) || (Id == 1750)) && (SetSelos())) //Angelox: Active Selos spells
									break;
							}
							if (hpr <= 80 || ( (tar->IsClient() || tar->IsPet()) && (hpr <= 98) ) || (botClass == BARD))
							{
								if (tar->GetClass() == NECROMANCER && 
									(hpr > 80 || (tar-IsEngaged() && hpr > 60))) {
									// Necro bots use too much cleric mana with thier
									// mana for life spells... give them a chance
									// to lifetap something
									break;
								}

								if(tar->FindType(SE_HealOverTime)) {
									// Let the heal over time buff do it's thing ...
									if(!tar->IsEngaged() || hpr >= 70)
										break;
								}

								int32 TempDontHealMeBeforeTime = tar->DontHealMeBefore();

								if (botClass != BARD)
								      if (SetChat())
									BotSay("<< Healing %s (%i%%%%) >>", tar->GetCleanName(), hpr);

								if (AIDoSpellCast(i, tar, mana_cost, &TempDontHealMeBeforeTime))
								{

									if(TempDontHealMeBeforeTime != tar->DontHealMeBefore())
										tar->SetDontHealMeBefore(TempDontHealMeBeforeTime);

									// For non-HoT heals, do a 4 second delay
									// TODO: Replace this code with logic that calculates the delay based on number of clerics in rotation
									//			and ignores heals for anyone except the main tank
									//if(!IsHealOverTimeSpell(AIspells[i].spellid)) {
										if(IsCompleteHealSpell(AIspells[i].spellid)) { 
											// Complete Heal 4 second rotation
											tar->SetDontHealMeBefore(Timer::GetCurrentTime() + 4000);
										}
										else {
											tar->SetDontHealMeBefore(Timer::GetCurrentTime() + 1000);
										}
									//}
								}

								return true;
							}
						}
						break;
										 }
					case SpellType_Root: {
					  if (!IsBotRaiding()){
						if (
							!tar->IsRooted() && SetRoot() 
							&& tar->DontRootMeBefore() < Timer::GetCurrentTime()
							&& tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0
							) {
								if(!checked_los) {
									if(!CheckLosFN(tar))
										return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
									checked_los = true;
								}
								int32 TempDontRootMeBefore = tar->DontRootMeBefore();
								if (AIDoSpellCast(i, tar, mana_cost, &TempDontRootMeBefore))
									if(TempDontRootMeBefore != tar->DontRootMeBefore())
										tar->SetDontRootMeBefore(TempDontRootMeBefore);
								return true;
						}
						break;
										 }
					  else {
						if (
							!tar->IsRooted() 
							&& tar->DontRootMeBefore() < Timer::GetCurrentTime()
							&& tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0
							) {
								if(!checked_los) {
									if(!CheckLosFN(tar))
										return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
									checked_los = true;
								}
								int32 TempDontRootMeBefore = tar->DontRootMeBefore();
								if (AIDoSpellCast(i, tar, mana_cost, &TempDontRootMeBefore))
									if(TempDontRootMeBefore != tar->DontRootMeBefore())
										tar->SetDontRootMeBefore(TempDontRootMeBefore);
								return true;
						}
						break;
					  }
					}
					case SpellType_Buff: {
						if (
							(spells[AIspells[i].spellid].targettype == ST_Target || tar == this)
							&& tar->DontBuffMeBefore() < Timer::GetCurrentTime()
							&& !tar->IsImmuneToSpell(AIspells[i].spellid, this)
							&& (tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0)
							&&  !(tar->IsPet() && tar->GetOwner()->IsClient() && this != tar)	//no buffing PC's pets, but they can buff themself

							) {
								// Put the zone levitate and movement check here since bots are able to bypass the client casting check
								if(	(IsEffectInSpell(AIspells[i].spellid, SE_Levitate) && !zone->CanLevitate()) ||
									(IsEffectInSpell(AIspells[i].spellid, SE_MovementSpeed) && !zone->CanCastOutdoor())) {
										break;
								}
								// when a pet class buffs its pet, it only needs to do it once
								if(spells[AIspells[i].spellid].targettype == ST_Pet) {
									Mob* newtar = GetPet();
									if(newtar) {
										if(!(newtar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0)) {
											break;
										}
									}
									else {
										break;
									}
								}
								//Angelox: Fix to save gem slots 
								int tClass = tar->GetClass();
								//Only Group spells when MGB starts.
								/*if ((botLevel >58) && ((botClass == CLERIC)||(botClass == SHAMAN)||(botClass == DRUID))){ 
								    if ((IsBotRaiding()) && (spells[AIspells[i].spellid].targettype==ST_Target))
								    //(!spells[AIspells[i].spellid].targettype==ST_Group))
									    break;
								  }*/

								if ((botClass == ENCHANTER) ||(botClass == SHAMAN)||(botClass == DRUID)||(botClass == BEASTLORD)){
								    //No mind spells for melee types
								    if (((tClass == RANGER)||(tClass == WARRIOR)||(tClass == MONK)||
									(tClass == BERSERKER)||(tClass == ROGUE))){
									 if (IsEffectInSpell(AIspells[i].spellid, SE_ManaPool)){
									     break;
									 }
								     }
								    //No haste or stat spells for caster types
								     else if ((tClass == ENCHANTER )||(tClass == DRUID )||(tClass == CLERIC)||
									(tClass == MAGICIAN)||(tClass == NECROMANCER)||(tClass == WIZARD)){
									if ((IsEffectInSpell(AIspells[i].spellid, SE_AttackSpeed))||
									   (IsEffectInSpell(AIspells[i].spellid, SE_STR))||
									   (IsEffectInSpell(AIspells[i].spellid, SE_ATK))||
									   (IsEffectInSpell(AIspells[i].spellid, SE_AGI))||
									   (IsEffectInSpell(AIspells[i].spellid, SE_DEX))||
									   (IsEffectInSpell(AIspells[i].spellid, SE_STA))){
									      break;
									 }
								      }
								  }
								// Don't allow Hybrid buffing during raids to help avoid lag.
								/*if (((botClass == PALADIN)||(botClass == RANGER)||(botClass == SHADOWKNIGHT)||
								    (botClass == BEASTLORD))&&(IsBotRaiding())){
								   if ((tClass==RANGER)||(tClass==WARRIOR)||(tClass==MONK)||(tClass==PALADIN)||
								      (tClass==SHADOWKNIGHT)||(tClass==BEASTLORD)||(tClass==ROGUE)||(tClass==BERSERKER)){
									if ((spells[AIspells[i].spellid].targettype==ST_Target)||
									   (spells[AIspells[i].spellid].targettype==ST_Self)){
									  break;
									}
								   }
								   break;
								}*/
								int32 TempDontBuffMeBefore = tar->DontBuffMeBefore();
								if (AIDoSpellCast(i, tar, mana_cost, &TempDontBuffMeBefore))
									if(TempDontBuffMeBefore != tar->DontBuffMeBefore())
										tar->SetDontBuffMeBefore(TempDontBuffMeBefore);

								if(extraMana) {
									// If the bot is just looping through spells and not casting
									// then don't let them keep the extra mana we gave them during
									// buff time
									SetMana(0);
									extraMana = false;
								}
								return true;
						}
						break;
										 }
					case SpellType_Escape: {
						int8 hpr = (int8)GetHPRatio();
#ifdef IPC          
						if (hpr <= 5 || (IsNPC() && CastToNPC()->IsInteractive() && tar != this) )
#else
						if ((hpr <= 15) && (tar == this))
#endif
						{
							AIDoSpellCast(i, this, mana_cost);
							return true;
						}
						break;
										   }
					case SpellType_Nuke: {
						if(((MakeRandomInt(1, 100) < 50) || ((botClass == BARD) || (botClass == SHAMAN) || (botClass == ENCHANTER)))
							&& ((tar->GetHPRatio() <= 95.0f) || ((botClass == BARD) || (botClass == SHAMAN) || (botClass == ENCHANTER)))
							&& !tar->IsImmuneToSpell(AIspells[i].spellid, this)
							&& (tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0))
						{
							if(!checked_los) {
								if(!CheckLosFN(tar))
									return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
								checked_los = true;
							}
							if (((botClass == SHAMAN) || (botClass ==DRUID)) && (GetManaRatio() < 50)){ //Don't nuke if mana under 50%
							      continue;
							}
							// AI Spell Quests  Angelox
							// Tash
							if (botClass == ENCHANTER) {
							     // if (!IsBotRaiding()){
								int randsay = MakeRandomInt(0,100);
								int Id = (AIspells[i].spellid);
								if((Id == 676)||(Id ==  677)||(Id == 678)||(Id == 1702)||(Id == 3342)||(Id == 10608)) {
									int TashID = (GetBotTashLevel());
									int MaxTashID = 0;	
									if (botLevel >= 72) MaxTashID = 6;
									else if (botLevel >= 61) MaxTashID = 5;
									else if (botLevel >= 57) MaxTashID = 4;
									else if (botLevel >= 41) MaxTashID = 3;
									else if (botLevel >= 18) MaxTashID = 2;
									if (TashID < 1) {
										if ((randsay == 1)&& (!IsBotRaiding()) && (SetChat())) {
											BotSay("We need to see the spell scriber for my Tash spell.");
											continue;
										}
										continue;
									}
									if ((TashID >= 1) && (TashID < MaxTashID)) {
										if ((randsay == 1)&& (!IsBotRaiding()) && (SetChat())) {
											BotSay("I have a newer Tash spell available, we need to see the spell scriber...");
											continue;
										}
									continue;
									}
								}
							      //}
								//AI Spells End
								else if (IsManaTapSpell(AIspells[i].spellid)) {
									// Only tap mana from mobs that have mana
									if (tar->GetMana() <= 0)
										return false;
								}
								else if (!IsEffectInSpell(AIspells[i].spellid, SE_Mez) && GetManaRatio() < 40) {
									// If it's not a tash, mana tap or mez, don't nuke below 40%
									return false;
								}
							}
							
							if(IsFearSpell(AIspells[i].spellid))
							{ // don't let fear cast if the npc isn't snared or rooted
								if(tar->GetSnaredAmount() == -1)
								{
									if(!tar->IsRooted())
										return false;
								}
							}

							AIDoSpellCast(i, tar, mana_cost);
							return true;
						}
						break;
										 }
					case SpellType_Dispel: {
						if(tar->GetHPRatio() > 95.0f)
						{
							if(!checked_los) {
								if(!CheckLosFN(tar))
									return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
								checked_los = true;
							}
							if(tar->CountDispellableBuffs() > 0)
							{
								AIDoSpellCast(i, tar, mana_cost);
								return true;
							}
						}
						break;
										   }
					case SpellType_Pet:
						{
							//keep mobs from recasting pets when they have them.
							if (!IsPet() && !GetPetID() && !IsBotCharmer())
							{	// SK wastes too much time recasting his wimpy pet during a fight.
								if((botClass == SHADOWKNIGHT) && (IsEngaged())){
								  if (IsEffectInSpell(AIspells[i].spellid, SE_NecPet))
								    continue;
								}
								if(botClass == MAGICIAN)
								{
									if(IsPetChooser())
									{
										bool ChoosePet = true;
										while(ChoosePet)
										{
											switch(GetPetChooserID())
											{
											case 1:
												if(!strncmp(spells[AIspells[i].spellid].teleport_zone, "SumWater", 8))
												{
													ChoosePet = false;
												}
												break;
											case 2:
												if(!strncmp(spells[AIspells[i].spellid].teleport_zone, "SumFire", 7))
												{
													ChoosePet = false;
												}
												break;
											case 3:
												if(!strncmp(spells[AIspells[i].spellid].teleport_zone, "SumAir", 6) || !strncmp(spells[AIspells[i].spellid].teleport_zone, "SumMage", 7))
												{
													ChoosePet = false;
												}
												break;
											case 4:
												if(!strncmp(spells[AIspells[i].spellid].teleport_zone, "SumEarth", 8))
												{
													ChoosePet = false;
												}
												break;
											default:
												if(!strncmp(spells[AIspells[i].spellid].teleport_zone, "MonsterSum", 10))
												{
													ChoosePet = false;
												}
												break;
											}
											if(ChoosePet)
											{
												--i;
												if(i < 0)
												{
													i = (AIspells.size() - 1);
												}
											}
										}
									}
									else
									{
										// have the magician bot randomly summon
										// the air, earth, fire or water pet
										// include monster summoning after they
										// become level 30 magicians
										int randpets;
										if(botLevel >= 30)
										{
											randpets = 4;
										}
										else
										{
											randpets = 3;
										}
										if(GetLevel() == 2)
										{
											// Do nothing
										}
										else if(GetLevel() == 3)
										{
											i = MakeRandomInt(i-1, i);
										}
										else if(GetLevel() == 4)
										{
											i = MakeRandomInt(i-2, i);
										}
										else
										{
											i = MakeRandomInt(i-randpets, i);
										}
									}
								}
								AIDoSpellCast(i, tar, mana_cost);
								return true;
							}
							break;
						}
					case SpellType_Lifetap: {
						if ((tar->GetHPRatio() <= 90.0f)
							&& !tar->IsImmuneToSpell(AIspells[i].spellid, this)
							&& (tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0))
						{
							if(!checked_los) {
								if(!CheckLosFN(tar))
									return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
								checked_los = true;
							}
							AIDoSpellCast(i, tar, mana_cost);
							return true;
						}
						break;
					
					}
					case SpellType_Snare: {
					    if (!IsBotRaiding()){
						if (
							(!tar->IsRooted()) && (SetSnare())
							&& (!tar->IsImmuneToSpell(AIspells[i].spellid, this))
							&& (tar->DontSnareMeBefore() < Timer::GetCurrentTime())
							&& (tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0)
							) {
								if(!checked_los) {
									if(!CheckLosFN(tar))
										return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
									checked_los = true;
								}
								int32 TempDontSnareMeBefore = tar->DontSnareMeBefore();
								if (AIDoSpellCast(i, tar, mana_cost, &TempDontSnareMeBefore))
									if(TempDontSnareMeBefore != tar->DontSnareMeBefore())
										tar->SetDontSnareMeBefore(TempDontSnareMeBefore);
								return true;
						}
						break;
										  }
					    else{
						if (
							!tar->IsRooted()
							&& !tar->IsImmuneToSpell(AIspells[i].spellid, this)
							&& tar->DontSnareMeBefore() < Timer::GetCurrentTime()
							&& tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0
							) {
								if(!checked_los) {
									if(!CheckLosFN(tar))
										return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
									checked_los = true;
								}
								int32 TempDontSnareMeBefore = tar->DontSnareMeBefore();
								if (AIDoSpellCast(i, tar, mana_cost, &TempDontSnareMeBefore))
									if(TempDontSnareMeBefore != tar->DontSnareMeBefore())
										tar->SetDontSnareMeBefore(TempDontSnareMeBefore);
								return true;
						}
						break;
					    }
					 }
					case SpellType_DOT: {
						if (((botClass == SHAMAN) || (botClass ==DRUID)) && (GetManaRatio() < 50)){ //Don't Dot if mana under 50%
						      continue;
						}

						if (
							((tar->GetHPRatio()<=80.0f)||(!IsBotRaiding()))
							&& !tar->IsImmuneToSpell(AIspells[i].spellid, this)
							&& tar->DontDotMeBefore() < Timer::GetCurrentTime()
							&& tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0
							) {
								if(!checked_los) {
									if(!CheckLosFN(tar))
										return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
									checked_los = true;
								}
								int32 TempDontDotMeBefore = tar->DontDotMeBefore();
								if (AIDoSpellCast(i, tar, mana_cost, &TempDontDotMeBefore))
									if(TempDontDotMeBefore != tar->DontDotMeBefore())
										tar->SetDontDotMeBefore(TempDontDotMeBefore);

								return true;
						}
						break;
										}
					case SpellType_InCombatBuff: {
						if(tar->GetHPRatio() > 15.0f)
						{
							AIDoSpellCast(i, tar, mana_cost);
							return true;
						}
						break;
												 }
					default: {
						cout<<"Error: Unknown spell type in AICastSpell. caster:"<<this->GetName()<<" type:"<<AIspells[i].type<<" slot:"<<i<<endl;
						break;
					}
				}
			}
			if(extraMana) {
				// If the bot is just looping through spells and not casting
				// then don't let them keep the extra mana we gave them during
                // buff time
				SetMana(hasMana);
				extraMana = false;
			}
		}
	}
	return false;
}

bool NPC::Bot_AI_PursueCastCheck() {
	if (AIautocastspell_timer->Check(false)) {
		_ZP(Bot_AI_Process_pursue_cast);
		AIautocastspell_timer->Disable();	//prevent the timer from going off AGAIN while we are casting.
		
		mlog(AI__SPELLS, "Bot Engaged (pursuing) autocast check triggered. Trying to cast offensive spells.");
		if(!Bot_AICastSpell(target, 90, SpellType_Root | SpellType_Nuke | SpellType_Lifetap | SpellType_Snare | SpellType_DOT | SpellType_Dispel)) {
			//no spell cast, try again soon.
			AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
		} //else, spell casting finishing will reset the timer.
		return(true);
	}
	return(false);
}

bool NPC::BotRaidSpell(int16 spellID)
{
	if(IsBotRaiding())
	{
		BotRaids* br = entity_list.GetBotRaidByMob(this);
		if(br)
		{
			for(int i=0; i<MAX_BOT_RAID_GROUPS; ++i)
			{
				if(br->BotRaidGroups[i])
				{
					for(int j=0; j<MAX_GROUP_MEMBERS; ++j)
					{
						if(br->BotRaidGroups[i]->members[j])
						{
							SpellOnTarget(spellID, br->BotRaidGroups[i]->members[j]);
							if(br->BotRaidGroups[i]->members[j] && br->BotRaidGroups[i]->members[j]->GetPetID())
							{
								SpellOnTarget(spellID, br->BotRaidGroups[i]->members[j]->GetPet());
							}
						}
					}
				}
			}
			return true;
		}
	}
	else
	{
		Group* g = entity_list.GetGroupByMob(this);
		if(g)
		{
			for(int k=0; k<MAX_GROUP_MEMBERS; ++k)
			{
				if(g->members[k])
				{
					SpellOnTarget(spellID, g->members[k]);
					if(g->members[k] && g->members[k]->GetPetID())
					{
						SpellOnTarget(spellID, g->members[k]->GetPet());
					}
				}
			}
			return true;
		}
	}
	return false;
}

bool NPC::Bot_Command_Cure(int curetype, int level) {
	int cureid = 0;
	switch(curetype) {
		case 1: // Poison
			if(level >= 58) {
				cureid = 1525;
			}
			else if(level >= 48) {
				cureid = 97;
			}
			else if(level >= 22) {
				cureid = 95;
			}
			else if(level >= 1) {
				cureid = 203;
			}
			break;
		case 2: // Disease
			if(level >= 51) {
				cureid = 3693;
			}
			else if(level >= 28) {
				cureid = 96;
			}
			else if(level >= 4) {
				cureid = 213;
			}
			break;
		case 3: // Curse
			if(level >= 54) {
				cureid = 2880;
			}
			else if(level >= 38) {
				cureid = 2946;
			}
			else if(level >= 23) {
				cureid = 4057;
			}
			else if(level >= 8) {
				cureid = 4056;
			}
			break;
		case 4: // Blindness
			if(level >= 3) {
				cureid = 212;
			}
			break;
		case 5:
			if(level >= 69) {
				cureid = 5410;
			}
			break;
		default:
			cureid = 0;
			break;
	}
	if(cureid > 0) {
		if(IsBotRaiding()) {
			BotRaids* br = entity_list.GetBotRaidByMob(this);
			if(br) {
				for(int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
					Group* gr = br->BotRaidGroups[i];
					if(gr) {
						for(int j=0; j<MAX_GROUP_MEMBERS; j++) {
							if(gr->members[j]) {
								SpellOnTarget(cureid, gr->members[j]);
							}
						}
					}
				}
			}
		}
		else {
			Group* g = entity_list.GetGroupByMob(this);
			if(g) {
				for(int k=0; k<MAX_GROUP_MEMBERS; k++) {
					if(g->members[k]) {
						SpellOnTarget(cureid, g->members[k]);
					}
				}
				return true;
			}
		}
	}
	return false;
}

bool NPC::Bot_Command_Resist(int resisttype, int level) {
	int resistid = 0;
	switch(resisttype) {
		case 1: // Poison Cleric
			if(level >= 30) {
				resistid = 62;
			}
			else if(level >= 6) {
				resistid = 227;
			}
			break;
		case 2: // Disease Cleric
			if(level >= 36) {
				resistid = 63;
			}
			else if(level >= 11) {
				resistid = 226;
			}
			break;
		case 3: // Fire Cleric
			if(level >= 33) {
				resistid = 60;
			}
			else if(level >= 8) {
				resistid = 224;
			}
			break;
		case 4: // Cold Cleric
			if(level >= 38) {
				resistid = 61;
			}
			else if(level >= 13) {
				resistid = 225;
			}
			break;
		case 5: // Magic Cleric
			if(level >= 43) {
				resistid = 64;
			}
			else if(level >= 16) {
				resistid = 228;
			}
			break;
		case 6: // Magic Enchanter
			if(level >= 37) {
				resistid = 64;
			}
			else if(level >= 17) {
				resistid = 228;
			}
			break;
		case 7: // Poison Druid
			if(level >= 44) {
				resistid = 62;
			}
			else if(level >= 19) {
				resistid = 227;
			}
			break;
		case 8: // Disease Druid
			if(level >= 44) {
				resistid = 63;
			}
			else if(level >= 19) {
				resistid = 226;
			}
			break;
		case 9: // Fire Druid
			if(level >= 20) {
				resistid = 60;
			}
			else if(level >= 1) {
				resistid = 224;
			}
			break;
		case 10: // Cold Druid
			if(level >= 30) {
				resistid = 61;
			}
			else if(level >= 9) {
				resistid = 225;
			}
			break;
		case 11: // Magic Druid
			if(level >= 49) {
				resistid = 64;
			}
			else if(level >= 34) {
				resistid = 228;
			}
			break;
		case 12: // Poison Shaman
			if(level >= 35) {
				resistid = 62;
			}
			else if(level >= 20) {
				resistid = 227;
			}
			break;
		case 13: // Disease Shaman
			if(level >= 30) {
				resistid = 63;
			}
			else if(level >= 8) {
				resistid = 226;
			}
			break;
		case 14: // Fire Shaman
			if(level >= 27) {
				resistid = 60;
			}
			else if(level >= 5) {
				resistid = 224;
			}
			break;
		case 15: // Cold Shaman
			if(level >= 24) {
				resistid = 61;
			}
			else if(level >= 1) {
				resistid = 225;
			}
			break;
		case 16: // Magic Shaman
			if(level >= 43) {
				resistid = 64;
			}
			else if(level >= 19) {
				resistid = 228;
			}
			break;
	}
	if(resistid > 0) {
		if(IsBotRaiding()) {
			BotRaids* br = entity_list.GetBotRaidByMob(this);
			if(br) {
				for(int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
					Group* gr = br->BotRaidGroups[i];
					if(gr) {
						for(int j=0; j<MAX_GROUP_MEMBERS; j++) {
							if(gr->members[j]) {
								SpellOnTarget(resistid, gr->members[j]);
							}
						}
					}
				}
			}
		}
		else {
			Group* g = entity_list.GetGroupByMob(this);
			if(g) {
				for(int k=0; k<MAX_GROUP_MEMBERS; k++) {
					if(g->members[k]) {
						SpellOnTarget(resistid, g->members[k]);
					}
				}
				return true;
			}
		}
	}
	return false;
}


bool NPC::Bot_Command_MezzTarget(Mob *target, int32 chanter, int32 bard, int32 necro) {
	if(target) {
		int mezid = 0;
		int mezlevel = GetLevel();
		if (mezlevel >= 69){
		      if(chanter == 1)
			mezid = 5520;
		      if(necro == 1)
			mezid = 5429;
		}
		else if (mezlevel == 68){ 
		      if (chanter == 1)
			mezid = 8035;
		      if (bard == 1)
			mezid = 8031;
		}
		else if (mezlevel == 67){
		      if(chanter == 1)
			mezid = 5503;
		      if(bard == 1)
			mezid = 5373;
		}
		else if ((mezlevel == 65) && (bard == 1)) {
			mezid = 3376;
		}
		else if (mezlevel >= 64) {
		      if (chanter == 1)
			mezid = 3358;
		      if (bard == 1)
			mezid = 3369;
		}
		else if (mezlevel == 63){
		      if (chanter == 1)
			mezid = 3354;
		      if (necro == 1)
			mezid = 3308;
		}
		else if ((mezlevel == 62) && (bard == 1)) {
			mezid = 3030;
		}
		else if ((mezlevel >= 61) && (chanter == 1)) {
			mezid = 3341;
		}
		else if (mezlevel == 60) {
			if (chanter == 1)
			mezid = 2120;
			if (bard == 1)
			  mezid = 1197;
		}
		else if ((mezlevel == 59) && (chanter == 1)){
			mezid = 1692;
		}
		else if ((mezlevel >= 58) && (bard == 1)){
			mezid = 1100;
		}
		else if ((mezlevel >= 54) && (chanter == 1)){
			mezid = 1691;
		}
		else if ((mezlevel >= 53) && (bard == 1)){
			mezid = 1753;
		}
		else if ((mezlevel >= 47) && (chanter == 1)){
			mezid = 190;
		}
		else if ((mezlevel >= 40) && (bard == 1)){
			mezid = 868;
		}
		else if ((mezlevel >= 30) && (chanter == 1)){
			mezid = 188;
		}
		else if ((mezlevel >= 28) && (bard == 1)){
			mezid = 741;
		}
		else if ((mezlevel >= 22) && (necro == 1)){
			mezid = 549;
		}
		else if ((mezlevel >= 15) && (bard == 1)){
			mezid = 724;
		}
		else if ((mezlevel >= 13) && (chanter == 1)){
			mezid = 187;
		}
		else if ((mezlevel >= 2) && (chanter == 1)){
			mezid = 292;
		}
		if(mezid > 0) {
			CastSpell(mezid, target->GetID(), 1, -1, -1);
			return true;
		}
	}
	return false;
}

bool NPC::Bot_Command_RezzTarget(Mob *target) {
	if(target) {
		int rezid = 0;
		int rezlevel = GetLevel();
		if(rezlevel >= 56) {
			rezid = 1524;
		}
		else if(rezlevel >= 47) {
			rezid = 392;
		}
		else if(rezlevel >= 42) {
			rezid = 2172;
		}
		else if(rezlevel >= 37) {
			rezid = 388;
		}
		else if(rezlevel >= 32) {
			rezid = 2171;
		}
		else if(rezlevel >= 27) {
			rezid = 391;
		}
		else if(rezlevel >= 22) {
			rezid = 2170;
		}
		else if(rezlevel >= 18) {
			rezid = 2169;
		}
		if(rezid > 0) {
			CastSpell(rezid, target->GetID(), 1, -1, -1);
			return true;
		}
	}
	return false;
}

void EntityList::ShowSpawnWindow(Client* client, int Distance, bool NamedOnly) {

	const char *WindowTitle = "Bot Tracking Window";

	string WindowText;
	int LastCon = -1;
	int CurrentCon = 0;
	
	int32 array_counter = 0;
	
	LinkedListIterator<Mob*> iterator(mob_list);
	iterator.Reset();

	while(iterator.MoreElements())
	{
		if (iterator.GetData() && (iterator.GetData()->DistNoZ(*client)<=Distance))
		{
			if((iterator.GetData()->IsTrackable())&& (!iterator.GetData()->IsBot()) && 
			  (!iterator.GetData()->IsPet()) && (!iterator.GetData()->IsFamiliar()) && 
			  (!iterator.GetData()->IsClient()) && (!iterator.GetData()->IsFindable())){
				Mob* cur_entity = iterator.GetData();
				//int  Extras = (cur_entity->IsBot() || cur_entity->IsPet() || cur_entity->IsFamiliar() || cur_entity->IsClient());
				const char *const MyArray[] = {
					"a_","an_","Innkeep_","Barkeep_",
					"Guard_","Merchant_","Lieutenant_",
					"Banker_","Centaur_","Aviak_","Baker_",
					"Sir_","Armorer_","Deathfist_","Deputy_",
					"Sentry_","Sentinel_","Leatherfoot_",
					"Corporal_","goblin_","Bouncer_","Captain_",
					"orc_","fire_","inferno_","young_","cinder_",
					"flame_","gnomish_","CWG_","sonic_","greater_",
					"ice_","dry_","Priest_","dark-boned_",
					"Tentacle_","Basher_","Dar_","Greenblood_",
					"clockwork_","guide_","rogue_","minotaur_",
					"brownie_","Teir'","dark_","tormented_",
					"mortuary_","lesser_","giant_","infected_",
					"wharf_","Apprentice_","Scout_","Recruit_",
					"Spiritist_","Pit_","Royal_","scalebone_",
					"carrion_","Crusader_","Trooper_","hunter_",
					"decaying_","iksar_","klok_","templar_","lord_",
					"froglok_","war_","large_","charbone_","icebone_",
					"Vicar_","Cavalier_","Heretic_","Reaver_","venomous_",
					"Sheildbearer_","pond_","mountain_","plaguebone_","Brother_",
					"great_","strathbone_","briarweb_","strathbone_","skeletal_",
					"minion_","spectral_","myconid_","spurbone_","sabretooth_",
					"Tin_","Iron_","Erollisi_","Petrifier_","Burynai_",
					"undead_","decayed_","You_","smoldering_","gyrating_",
					"lumpy_","Marshal_","Sheriff_","Chief_","Risen_",
					"lascar_","tribal_","fungi_","Xi_","Legionnaire_",
					"Centurion_","Zun_","Diabo_","Scribe_","Defender_","Capt_",
					"blazing_","Solusek_","imp_","hexbone_","elementalbone_",
					"stone_","lava_","_",""
				};
				unsigned int MyArraySize;
				 for ( MyArraySize = 0; true; MyArraySize++) {   //Find empty string & get size
				   if (!(*(MyArray[MyArraySize]))) break;   //Checks for null char in 1st pos
				};
				if (NamedOnly) {
				   bool ContinueFlag = false;
				   const char *CurEntityName = cur_entity->GetName();  //Call function once
				   for (int Index = 0; Index < MyArraySize; Index++) {
				      if (!strncasecmp(CurEntityName, MyArray[Index], strlen(MyArray[Index]))) {
				         iterator.Advance();
				         ContinueFlag = true;
				         break;   //From Index for
				       };
				   };
				  if (ContinueFlag) continue; //Moved here or would apply to Index for
				};

				CurrentCon = client->GetLevelCon(cur_entity->GetLevel());
				if(CurrentCon != LastCon) {

					if(LastCon != -1)
						WindowText += "</c>";

					LastCon = CurrentCon;

					switch(CurrentCon) {

						case CON_GREEN: {
							WindowText += "<c \"#00FF00\">";
							break;
						}

						case CON_LIGHTBLUE: {
							WindowText += "<c \"#8080FF\">";
							break;
						}
						case CON_BLUE: {
							WindowText += "<c \"#2020FF\">";
							break;
						}

						case CON_YELLOW: {
							WindowText += "<c \"#FFFF00\">";
							break;
						}
						case CON_RED: {
							WindowText += "<c \"#FF0000\">";
							break;
						}
						default: {
							WindowText += "<c \"#FFFFFF\">";
							break;
						}
					}
				}

				WindowText += cur_entity->GetCleanName();
				WindowText += "<br>";

				if(strlen(WindowText.c_str()) > 4000) {
					// Popup window is limited to 4096 characters.
					WindowText += "</c><br><br>List truncated ... too many mobs to display";
					break;
				}
			}
		}

		iterator.Advance();
	}
	WindowText += "</c>";

	client->SendPopupToClient(WindowTitle, WindowText.c_str());

	return; 
}
//BotHelp
void EntityList::BotHelpWindow(Client* client, int MobClass) {

	const char *WindowTitle = "Bot Help Window";
	string WindowText;

	if (MobClass == 1){        //NewB Help
	WindowText += "</c><br> &nbsp; &nbsp; &nbsp; &nbsp; Welcome to the &nbsp; </c><a href=\"http://forums.axclassic.com\">World of AX CLASSIC!</a><br>";
	WindowText += "</c><br> &nbsp; Bots are helpers that will group with you and act as other players.";
	WindowText += "</c><br> &nbsp; Aediles Thrall will grant you bots, if you do his quests.";
	WindowText += "</c><br> &nbsp; Use the commands \"#bot help\" and \"#bot help create\" for basic bot orders and creation.";
	WindowText += "</c><br> &nbsp; For general commands listing type \"#bot help\".";
	WindowText += "</c><br> &nbsp; For class-specific commands type #bot and the class (example; #bot cleric).";
	WindowText += "</c><br> &nbsp; For a full list of available bot commands, visit &nbsp; </c><a href=\"http://www.axclassic.com/botcommands\">axclassic.com</a><br>.";

	}
	else if (MobClass == 2){ //Cleric Help
	WindowText += "</c><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Additional Cleric Commands";
	WindowText += "</c><br> &nbsp; #bot heal - Heals your target.";
	WindowText += "</c><br> &nbsp; #bot cheal - Complete heals your target, group or raid.";
	WindowText += "</c><br> &nbsp; #bot sheal - Heals your target, group or raid";
	WindowText += "</c><br> &nbsp; #bot petheal - Heals your pet, group or raid";
	WindowText += "</c><br> &nbsp; #bot healme - Heals yourself.";
	WindowText += "</c><br> &nbsp; #bot gheal - Heals all of your group.";
	WindowText += "</c><br> &nbsp; #bot resurrectme - Revives your dead character.";
	WindowText += "</c><br> &nbsp; #bot temperance - Buffs your target.";
	WindowText += "</c><br> &nbsp; #bot pacify - Calms your target.";
	WindowText += "</c><br> &nbsp; #bot bindme - Binds your target. ";
	WindowText += "</c><br> &nbsp; #bot cure - Cures your target.";
	WindowText += "</c><br> &nbsp; #bot resist - Buffs your target with resist of choice.";
	WindowText += "</c><br> &nbsp; #bot summon food/drink - Food or drink to target.";
	
	}
	else if (MobClass == 3){ //Wizard
	WindowText += "</c><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Additional Wizard Commands";
	WindowText += "</c><br> &nbsp; #bot invis - Will make you invisible";
	WindowText += "</c><br> &nbsp; #bot gate - Port you to certain areas.";
	WindowText += "</c><br> &nbsp; #bot levitate - Provides levitation for your target.";
	WindowText += "</c><br> &nbsp; #bot lore - Cast Identify on the item on your mouse pointer.";
	}
	else if (MobClass == 4){ //Ranger
	WindowText += "</c><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Additional Ranger Commands";
	WindowText += "</c><br> &nbsp; #bot sow - Will buff any target with SoW.";
	WindowText += "</c><br> &nbsp; #bot track - Opens up a tracking window.";
	WindowText += "</c><br> &nbsp; #bot archery - Causes the ranger to swap to his bow (if he has one)";
	WindowText += "</c><br> &nbsp; #bot endureb - Can breathe under water";
	WindowText += "</c><br> &nbsp; #bot levitate - Provides levitation for your target.";
	}
	else if (MobClass == 5){ //Druid
	WindowText += "</c><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Additional Druid Commands";
	WindowText += "</c><br> &nbsp; #bot gate - Port you to certain areas.";
	WindowText += "</c><br> &nbsp; #bot sow - Will buff any target with SoW";
	WindowText += "</c><br> &nbsp; #bot endureb - Can breathe under water";
	WindowText += "</c><br> &nbsp; #bot invis - Will make you invisible";
	WindowText += "</c><br> &nbsp; #bot track - Opens up a tracking window.";
	WindowText += "</c><br> &nbsp; #bot heal - Heals your target.";
	WindowText += "</c><br> &nbsp; #bot sheal - Heals your target, group or raid";
	WindowText += "</c><br> &nbsp; #bot petheal - Heals your pet, group or raid";
	WindowText += "</c><br> &nbsp; #bot healme - Heals yourself.";
	WindowText += "</c><br> &nbsp; #bot evac - Evacuates you to a safespot in the zone";
	WindowText += "</c><br> &nbsp; #bot cure - cures your target.";
	WindowText += "</c><br> &nbsp; #bot resist - Buffs your target with resist of choice.";
	WindowText += "</c><br> &nbsp; #bot charm - Turns your target into the bots pet.";
	WindowText += "</c><br> &nbsp; #bot levitate - Provides levitation for your target.";
	WindowText += "</c><br> &nbsp; #bot skin - Buffs target with hitpoints and more and more.";
	WindowText += "</c><br> &nbsp; #bot summon food/drink - Food or drink to target.";	
	}
	else if (MobClass == 6){ //Shaman
	WindowText += "</c><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Additional Shaman Commands";
	WindowText += "</c><br> &nbsp; #bot sow - Will buff any target with SoW";
	WindowText += "</c><br> &nbsp; #bot invis - Will make you invisible";
	WindowText += "</c><br> &nbsp; #bot heal - Heals your target.";
	WindowText += "</c><br> &nbsp; #bot sheal - Heals your target, group or raid";
	WindowText += "</c><br> &nbsp; #bot petheal - Heals your pet, group or raid";
	WindowText += "</c><br> &nbsp; #bot healme - Heals yourself.";
	WindowText += "</c><br> &nbsp; #bot endureb - Can breathe under water";
	WindowText += "</c><br> &nbsp; #bot cure - cures your target.";
	WindowText += "</c><br> &nbsp; #bot resist - Buffs your target with resist of choice.";
	WindowText += "</c><br> &nbsp; #bot slow - Slows your targets attack rate.";
	WindowText += "</c><br> &nbsp; #bot shrink - Shrinks your target.";
	WindowText += "</c><br> &nbsp; #bot levitate - Provides levitation for your target.";
	WindowText += "</c><br> &nbsp; #bot summon food/drink - Food or drink to target.";	
	}
	else if (MobClass == 7){ //Necromancer
	WindowText += "</c><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Additional Necromancer Commands";
	WindowText += "</c><br> &nbsp; #bot levitate - Provides levitation for your target.";
	WindowText += "</c><br> &nbsp; #bot invis - Will make you invisible";
	WindowText += "</c><br> &nbsp; #bot charm - Turns your target into the bots pet.";
	WindowText += "</c><br> &nbsp; #bot summon corpse - Summons your targets characters corpse to your feet.";
	WindowText += "</c><br> &nbsp; #bot lore - cast Identify on the item on your mouse pointer.";
	WindowText += "</c><br> &nbsp; #bot subvent - replenish mana to your target.";	
	}
	else if (MobClass == 8){ //Rogue
	WindowText += "</c><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Additional Rogue Commands";
	WindowText += "</c><br> &nbsp; #bot picklock - opens locked doors.";
	WindowText += "</c><br> &nbsp; #bot archery - Causes the Rogue to swap to his bow (if he has one)";
	}
	else if (MobClass == 9){ //Enchanter
	WindowText += "</c><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Additional Enchanter Commands";
	WindowText += "</c><br> &nbsp; #bot endureb - Can breathe under water";
	WindowText += "</c><br> &nbsp; #bot levitate - Provides levitation for your target.";
	WindowText += "</c><br> &nbsp; #bot slow - Slows your targets attack rate.";
	WindowText += "</c><br> &nbsp; #bot pacify - Calms your target.";
	WindowText += "</c><br> &nbsp; #bot rune - Buffs your target with the Run shield.";
	WindowText += "</c><br> &nbsp; #bot charm - Turns your target into the bots pet.";
	WindowText += "</c><br> &nbsp; #bot dire charm - Turns your target into the bots permanent pet. ";
	WindowText += "</c><br> &nbsp; #bot tash - Cast Tashan types spell on target";
	WindowText += "</c><br> &nbsp; #bot windtash - Cast AE Wind of Tashani types on target";
	WindowText += "</c><br> &nbsp; #bot ai mez - Will stop attacks for a short time";
	WindowText += "</c><br> &nbsp; #bot auto mez on/off - Automatically stops incoming adds";	
	}
	else if (MobClass == 10){ //Beastlord
	WindowText += "</c><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Additional Beastlord Commands";
	WindowText += "</c><br> &nbsp; #bot slow - Slows your targets attack rate.";
	WindowText += "</c><br> &nbsp; #bot sow - Will buff any target with SoW";
	WindowText += "</c><br> &nbsp; #bot levitate - Provides levitation for your target.";
	WindowText += "</c><br> &nbsp; #bot shrink - Shrinks your target.";
	WindowText += "</c><br> &nbsp; #bot summon food/drink - Food or drink to target.";	
	}
	else if (MobClass == 11){ //Bard
	WindowText += "</c><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Additional Bard Commands";
	WindowText += "</c><br> &nbsp; #bot track - Opens up a tracking window.";
	WindowText += "</c><br> &nbsp; #bot auto mez on/off - Automatically stops incoming adds";
	WindowText += "</c><br> &nbsp; #bot selos on/off - Will automatically start or stop Bard speed.";	
	}
	else if (MobClass == 12){ //Magician
	WindowText += "</c><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Additional Magician Commands";
	WindowText += "</c><br> &nbsp; #bot invis - Will make you invisible";
	WindowText += "</c><br> &nbsp; #bot magepet - Select which pet type you want.";
	WindowText += "</c><br> &nbsp; #bot levitate - Provides levitation for your target.";
	WindowText += "</c><br> &nbsp; #bot lore - cast Identify on the item on your mouse pointer.";
	WindowText += "</c><br> &nbsp; #bot summon food/drink - Food or drink to target.";	
	}
      client->SendPopupToClient(WindowTitle, WindowText.c_str());
      return; 
}
//Pacify
bool NPC::Bot_Command_CalmTarget(Mob *target) {
	if(target) {
		int calmid = 0;
		int calmlevel = GetLevel();
		if((calmlevel >= 67) && (calmlevel <= 75)) {
			// Use Pacification until Placate is fixed
			calmid = 3197;
			//calmid = 5274;
		}
		else if((calmlevel >= 62) && (calmlevel <= 66)) {
			calmid = 3197;
		}
		else if((calmlevel >= 35) && (calmlevel <= 61)) {
			calmid = 45;
		}
		else if((calmlevel >= 18) && (calmlevel <= 34)) {
			calmid = 47;
		}
		else if((calmlevel >= 6) && (calmlevel <= 17)) {
			calmid = 501;
		}
		else if((calmlevel >= 1) && (calmlevel <= 5)) {
			calmid = 208;
		}
	if(calmid > 0) {
		SpellOnTarget(calmid, target);
		//CastSpell(calmid, target->GetID(), 1, -1, -1);
		return true;
		} 
	}
	return false;
}
//Charm
bool NPC::Bot_Command_CharmTarget(int charmtype, Mob *target) {
		int charmid = 0;
		int charmlevel = GetLevel();
	if(target) {
		switch(charmtype) {
			case 1: // Enchanter
				if((charmlevel >= 64) && (charmlevel <= 75)) {
					charmid = 3355;
				}
				else if((charmlevel >= 62) && (charmlevel <= 63)) {
					charmid = 3347;
				}
				else if((charmlevel >= 60) && (charmlevel <= 61)) {
					charmid = 1707;
				}
				else if((charmlevel >= 53) && (charmlevel <= 59)) {
					charmid = 1705;
				}
				else if((charmlevel >= 37) && (charmlevel <= 52)) {
					charmid = 183;
				}
				else if((charmlevel >= 23) && (charmlevel <= 36)) {
					charmid = 182;
				}
				else if((charmlevel >= 11) && (charmlevel <= 22)) {
					charmid = 300;
				}
				break;
			case 2: // Necromancer
				if((charmlevel >= 60) && (charmlevel <= 75)) {
					charmid = 1629;
				}
				else if((charmlevel >=47) && (charmlevel <= 59)) {
					charmid = 198;
				}
				else if((charmlevel >= 31) && (charmlevel <= 46)) {
					charmid = 197;
				}
				else if((charmlevel >= 18) && (charmlevel <= 30)) {
					charmid = 196;
				}
				break;
			case 3: // Druid
				if((charmlevel >= 63) && (charmlevel <= 75)) {
					charmid = 3445;
				}
				else if((charmlevel >= 55) && (charmlevel <= 62)) {
					charmid = 1556;
				}
				else if((charmlevel >= 52) && (charmlevel <= 54)) {
					charmid = 1553;
				}
				else if((charmlevel >= 43) && (charmlevel <= 51)) {
					charmid = 142;
				}
				else if((charmlevel >= 33) && (charmlevel <= 42)) {
					charmid = 141;
				}
				else if((charmlevel >= 23) && (charmlevel <= 32)) {
					charmid = 260;
				}
				else if((charmlevel >= 13) && (charmlevel <= 22)) {
					charmid = 242;
				}
				break;
			}
	if(charmid > 0) {
		CastSpell(charmid, target->GetID(), 1, -1, -1);
		return true;
		} 
	}
	return false;
}
//Dire Charm
bool NPC::Bot_Command_DireTarget(int diretype, Mob *target) {
	int direid = 0;
	int direlevel = GetLevel();
	if(target) {
		switch(diretype) {
			case 1: // Enchanter
			if(direlevel >= 60) {
					direid = 5874;
				}
				else if(direlevel >= 55) {
					direid = 2761;
				}
				break;
			case 2: // Necromancer
					if(direlevel >= 60) {
					direid = 5876;
				}
				else if(direlevel >= 55) {
					direid = 2759;
				}
				break;
			case 3: // Druid
				if(direlevel >= 60) {
					direid = 5875;
				}
				else if(direlevel >= 55) {
					direid = 2760;
				}
				break;
			}
	if(direid > 0) {
		CastSpell(direid, target->GetID(), 1, -1, -1);
		return true;
		}
	}
	return false;
}
//Angelox2
//Heal
bool NPC::Bot_Command_HealTarget(int healtype, Mob *target) {
	if(target) {
		int healid = 0;
		int heallevel = GetLevel();
		int8 botClass = GetClass();
	switch(healtype) {
		case 1: // Shaman
		if((heallevel >= 55) && (heallevel <= 75)) {//Chloroblast - 331 mana
			healid = 1290;
		}
		else if((heallevel >= 51) && (heallevel <= 54)) {//Superior Healing - 185 mana
			healid = 9;
		}
		else if((heallevel >= 29) && (heallevel <= 50)) {//Greater Healing - 115 mana
			healid = 15;
		}
		else if((heallevel >= 19) && (heallevel <= 28)) {//Healing - 65 mana
			healid = 12;
		}
		else if((heallevel >= 9) && (heallevel <= 18)) {//Light Healing - 28 mana
			healid = 17;
		}
		else if((heallevel >= 1) && (heallevel <= 8)) {//Minor Healing - 10 mana
			healid = 200;
		}
			break;

		case 2: // Druid
		if((heallevel >= 64) && (heallevel <= 75)) {//Karana's Renewal- 600 mana
			healid = 3232;
		}
		else if((heallevel >= 63) && (heallevel <= 63)) {//Nature's Infusion - 560 mana
			healid = 3443;
		}
		else if((heallevel >= 58) && (heallevel <= 62)) {//Regrowth of the Grove - 600 mana
			healid = 2179;
		}
		else if((heallevel >= 51) && (heallevel <= 57)) {//Superior Healing - 185 mana
			healid = 9;
		}
		else if((heallevel >= 29) && (heallevel <= 50)) {//Greater Healing - 115 mana
			healid = 15;
		}
		else if((heallevel >= 19) && (heallevel <= 28)) { //Healing - 65 mana
			healid = 12;
		}
		else if((heallevel >= 9) && (heallevel <= 18)) { //Light Healing - 28 mana
			healid = 17;
		}
		else if((heallevel >= 1) && (heallevel <= 8)) {	 //Minor Healing - 10 mana
			healid = 200;
		}
			break;

		case 3: // Cleric
		if((heallevel >= 63) && (heallevel <= 75)) { //Supernal Light - 600 mana
			healid = 3480;
		}
		else if((heallevel >= 58) && (heallevel <= 62)) { //Ethereal Light - 490 mana
			healid = 2182;
		}		
		else if((heallevel >= 53) && (heallevel <= 57)) { //Divine Light - 355 mana
			healid = 1519;
		}
		else if((heallevel >= 51) && (heallevel <= 52)) { //Remedy - 167 mana
			healid = 1518;
		}
		else if((heallevel >= 39) && (heallevel <= 50)) { //Superior Healing
			healid = 9;				//Angelox: should be Complete Heal but this is quick heal?
		}
		else if((heallevel >= 30) && (heallevel <= 38)) { //Superior Healing - 185 mana
			healid = 9;
		}
		else if((heallevel >= 20) && (heallevel <= 29)) { //Greater Healing - 115 mana
			healid = 15;
		}
		else if((heallevel >= 10) && (heallevel <= 19)) { //Healing - 65 mana
			healid = 12;
		}
		else if((heallevel >= 4) && (heallevel <= 9)) { //Light Healing - 28 mana
			healid = 17;
		}
		else if((heallevel >= 1) && (heallevel <= 3)) {	 //Minor Healing - 10 mana
			healid = 200;
		}
			break;
			
		case 4: // Necro
		/*if((heallevel >= 64) && (heallevel <= 75)) {//Touch of Death
			healid = 3312;// Spell doesn't work
		}  
		else*/ if((heallevel >= 54) && (heallevel <= 75)) {//Shadowbond
			healid = 1717;
		}
		else if((heallevel >= 44) && (heallevel <= 53)) { //Pact of Shadow
			healid = 694;
		}
		else if((heallevel >= 17) && (heallevel <= 43)) { //Shadow Compact
			healid = 1510;
		}
		else if((heallevel >= 6) && (heallevel <= 16)) { //Dark Empathy  
			healid = 357;
		}
			break;
		case 5: // Cleric's DivineAura
		if((heallevel >= 1) && (heallevel <= 75)) {
		    if (!divine_aura_timer.Enabled()) {
			healid = 207;
			divine_aura_timer.Start(120000);
		    }
		}
			break;
		case 6: // Necro's Mana Subvention
		if((heallevel >= 56) && (heallevel <= 75)) { //Sedulous Subversion
			healid = 1718;
		}
		else if((heallevel >= 43) && (heallevel <= 55)) { //Covetous Subversion
			healid = 1515;
		}
		else if((heallevel >= 21) && (heallevel <= 42)) { //Rapacious Subvention
			healid = 1514;
		}
			break;
		case 7: // Druids's Evac
		if((heallevel >= 1) && (heallevel <= 75)) {
		    if (!evac_hold_timer.Enabled()) {
			//healid = 2183; // Lesser Succor 
			//healid = 1567; //Succor
			evac_hold_timer.Start(15);
		    }
		}
			break;
		case 8: // Cleric Battle Heals for Warrior or other specified tank
		if((heallevel >= 63) && (heallevel <= 75)) {
			  healid = 13; //CHeal for Warrior
			  //cheal_hold_timer.Start(5);  
		}
		else if((heallevel >= 58) && (heallevel <= 62)) {
			  healid = 13; //CHeal for Warrior
			  //cheal_hold_timer.Start(5);
		}		
		else if((heallevel >= 53) && (heallevel <= 57)) { 
			  healid = 13; //CHeal for Warrior
			  //cheal_hold_timer.Start(5);
		}
		else if((heallevel >= 51) && (heallevel <= 52)) { 
			  healid = 13; //CHeal for Warrior
			  //cheal_hold_timer.Start(5);
		}
		else if((heallevel >= 39) && (heallevel <= 50)) { 
			  healid = 13; //CHeal for Warrior
			  //cheal_hold_timer.Start(5);
		}
		else if((heallevel >= 30) && (heallevel <= 38)) { //Superior Healing - 185 mana
			healid = 9;
		}
		else if((heallevel >= 20) && (heallevel <= 29)) { //Greater Healing - 115 mana
			healid = 15;
		}
		else if((heallevel >= 10) && (heallevel <= 19)) { //Healing - 65 mana
			healid = 12;
		}
		else if((heallevel >= 4) && (heallevel <= 9)) { //Light Healing - 28 mana
			healid = 17;
		}
		else if((heallevel >= 1) && (heallevel <= 3)) {	 //Minor Healing - 10 mana
			healid = 200;
		}
			break;
	        }			
		if(healid > 0) {
			/*int32 DontHealMeBeforeTime = 0;
			CastSpell(healid, target->GetID(), 1, -1, -1, &DontHealMeBeforeTime);
			target->SetDontHealMeBefore(DontHealMeBeforeTime); */
			CastSpell(healid, target->GetID(), 1, -1, -1);
			return true;
		} 
	}
	return false;
}

//Slow
bool NPC::Bot_Command_SlowTarget(int slowtype, Mob *target) {
	if(target) {
		int slowid = 0;
		int slowlevel = GetLevel();
	switch(slowtype) {
		case 1: // Beastlord - slows nice after level 50 seems
		if((slowlevel >= 70) && (slowlevel <= 75)) {
			slowid = 6828 ; //Sha's Legacy
		}
		else if((slowlevel >= 65) && (slowlevel <= 69)) {
			slowid = 3462; //Sha's Revenge
		}
		else if((slowlevel >= 60) && (slowlevel <= 64)) {
			slowid = 2942; //Sha's Advantage
		}
		else if((slowlevel >= 50) && (slowlevel <= 59)) {
			slowid = 2634; //Sha's Lethargy
		}
		else if((slowlevel >= 20) && (slowlevel <= 49)) {
			slowid = 270; //Drowsy
		}
			break;

		case 2: // Shaman - best slower
		if((slowlevel >= 70) && (slowlevel <= 75)) {
			slowid = 8017; //Hungry Plague
		}
		else if((slowlevel >= 61) && (slowlevel <= 69)) {
			slowid = 3380; //Cloud of Grummus
		}
		else if((slowlevel >= 58) && (slowlevel <= 60)) {
			slowid = 1589; //Tigir's Insects
		}
		else if((slowlevel >= 51) && (slowlevel <= 57)) {
			slowid = 1588; //Turgur's Insects
		}
		else if((slowlevel >= 38) && (slowlevel <= 50)) {
			slowid = 507; //Togor's Insects
		}
		else if((slowlevel >= 27) && (slowlevel <= 37)) {
			slowid = 506; //Tagar's Insects
		}
		else if((slowlevel >= 13) && (slowlevel <= 26)) {
			slowid = 505; //Walking Sleep
		}
		else if((slowlevel >= 5) && (slowlevel <= 12)) {
			slowid = 270; //Drowsy
		}
			break;

		case 3: // Enchanter - next best slower
		if((slowlevel >= 69) && (slowlevel <= 75)) {
			slowid = 6826; //Desolate Deeds
		}
		/*else if((slowlevel >= 65) && (slowlevel <= 68)) {
			slowid = ??; //Dreary Deeds Not in Spell database
		} */ 
		else if((slowlevel >= 57) && (slowlevel <= 68)) {
			slowid = 1712; //Forlorn Deeds
		}
		else if((slowlevel >= 41) && (slowlevel <= 56)) {
			slowid = 186; //Shiftless Deeds
		}
		else if((slowlevel >= 23) && (slowlevel <= 40)) {
			slowid = 185; // Tepid Deeds
		}
		else if((slowlevel >= 9) && (slowlevel <= 22)) {
			slowid = 302; // Languid Pace
		}
			break;
		}
		if(slowid > 0) {
			/*int32 DontslowMeBeforeTime = 0;
			CastSpell(slowid, target->GetID(), 1, -1, -1, &DontslowMeBeforeTime);
			target->SetDontslowMeBefore(DontslowMeBeforeTime); */
			CastSpell(slowid, target->GetID(), 1, -1, -1);
			return true;
		} 
	}
	return false;
}

// Retrieves all the inventory records from the database for this bot.
void Mob::GetBotItems(NPC* bot, std::string* errorMessage) {
	if(bot->GetNPCTypeID() > 0) {
		char errbuf[MYSQL_ERRMSG_SIZE];
		char* query = 0;
		MYSQL_RES* DatasetResult;
		MYSQL_ROW DataRow;

		if(database.RunQuery(query, MakeAnyLenString(&query, "SELECT botslotid,itemid,charges,color,augslot1,augslot2,augslot3,augslot4,augslot5,instnodrop "
			"FROM botinventory WHERE npctypeid=%i order by botslotid", bot->GetNPCTypeID()), errbuf, &DatasetResult)) {
			while(DataRow = mysql_fetch_row(DatasetResult)) {
				sint16 slot_id	= atoi(DataRow[0]);
				uint32 item_id	= atoi(DataRow[1]);
				int16 charges	= atoi(DataRow[2]);
				uint32 color	= atoul(DataRow[3]);
				uint32 aug[5];
				aug[0] = (uint32)atoul(DataRow[4]);
				aug[1] = (uint32)atoul(DataRow[5]);
				aug[2] = (uint32)atoul(DataRow[6]);
				aug[3] = (uint32)atoul(DataRow[7]);
				aug[4] = (uint32)atoul(DataRow[8]);
				bool instnodrop	= (DataRow[9] && (int16)atoi(DataRow[9])) ? true : false;

				ItemInst* inst = database.CreateItem(item_id, charges, aug[0], aug[1], aug[2], aug[3], aug[4]);
				if(inst) {
					sint16 put_slot_id = SLOT_INVALID;
					if(instnodrop || ((slot_id >= 0) && (slot_id <= 21) && inst->GetItem()->Attuneable))
						inst->SetInstNoDrop(true);
					if(color > 0)
						inst->SetColor(color);
					if(charges==255)
						inst->SetCharges(-1);
					else
						inst->SetCharges(charges);
					if((slot_id >= 8000) && (slot_id <= 8999)) {
						// do nothing
					}
					else {
						put_slot_id = bot->GetBotInv().PutItem(slot_id, *inst);
					}
					safe_delete(inst);

					// Save ptr to item in inventory
					if (put_slot_id == SLOT_INVALID) {
						LogFile->write(EQEMuLog::Error,
							"Warning: Invalid slot_id for item in inventory: botid=%i, item_id=%i, slot_id=%i",
							bot->GetNPCTypeID(), item_id, slot_id);
					}
				}
				else {
					LogFile->write(EQEMuLog::Error,
						"Warning: botid %i has an invalid item_id %i in inventory slot %i",
						bot->GetNPCTypeID(), item_id, slot_id);
				}
			}
			mysql_free_result(DatasetResult);
		}
		else 
			*errorMessage = std::string(errbuf);

		safe_delete_array(query);
	}
}

ItemInst* Mob::GetBotItem(NPC* bot, uint32 slotID) {
	ItemInst* item = bot->GetBotInv().GetItem(slotID);
	if(item){
		return item;
	}

	return NULL;
}

void Mob::EquipBot(NPC* bot, std::string* errorMessage) {
	GetBotItems(bot, errorMessage);

	const ItemInst* inst = 0;
	const Item_Struct* item = 0;
	for(int i=0; i<=21; ++i) {
		inst = GetBotItem(bot, i);
		if(inst) {
			item = inst->GetItem();
			Client::BotTradeAddItem(inst, inst->GetCharges(), item->Slots, i, errorMessage, bot, false);
			if(!errorMessage->empty())
				return;
		}
	}
}

// Processes a client request to inspect a bot's equipment. 
void Mob::ProcessBotInspectionRequest(Mob* inspectedBot, Client* client) {
	if(inspectedBot && client) {
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_InspectAnswer, sizeof(InspectResponse_Struct));
		InspectResponse_Struct* insr = (InspectResponse_Struct*) outapp->pBuffer;
		insr->TargetID = inspectedBot->GetNPCTypeID();
		insr->playerid = inspectedBot->GetID();
		const Item_Struct* item = 0;
		const ItemInst* item1 = 0;
		
		for(uint32 L=0; L<=21; ++L) {
			item1 = inspectedBot->GetBotItem(inspectedBot->CastToNPC(), L);
			if(item1) {
				item = item1->GetItem();
				if(item) {
					strcpy(insr->itemnames[L], item->Name);
					insr->itemicons[L] = item->Icon;
				}
				else
					insr->itemicons[L] = 0xFFFFFFFF;
			}
		}

		client->QueuePacket(outapp); // Send answer to requester
	}
}

// fez_ajer: Pick a target to mez
Mob* Mob::BotGetMobToMez(int32 chanter, int32 bard, int32 necro) {
	Mob* result = 0;

	// We need to have an owner and a group
	if (!BotOwner || !IsGrouped()) {
		return result;
	}

	// Select our mez spell now
	int mezid = 0;
	int mezlevel = GetLevel();
	if (mezlevel >= 69){
	      if(chanter == 1)
		mezid = 5520;
	      if(necro == 1)
		mezid = 5429;
	}
	else if (mezlevel == 68){ 
	      if (chanter == 1)
		mezid = 8035;
	      if (bard == 1)
		mezid = 8031;
	}
	else if (mezlevel == 67){
	      if(chanter == 1)
		mezid = 5503;
	      if(bard == 1)
		mezid = 5373;
	}
	else if ((mezlevel == 65) && (bard == 1)) {
		mezid = 3376;
	}
	else if (mezlevel >= 64) {
	      if (chanter == 1)
		mezid = 3358;
	      if (bard == 1)
		mezid = 3369;
	}
	else if (mezlevel == 63){
	      if (chanter == 1)
		mezid = 3354;
	      if (necro == 1)
		mezid = 3308;
	}
	else if ((mezlevel == 62) && (bard == 1)) {
		mezid = 3030;
	}
	else if ((mezlevel >= 61) && (chanter == 1)) {
		mezid = 3341;
	}
	else if (mezlevel == 60) {
		if (chanter == 1)
		mezid = 2120;
		if (bard == 1)
		  mezid = 1197;
	}
	else if ((mezlevel == 59) && (chanter == 1)){
		mezid = 1692;
	}
	else if ((mezlevel >= 58) && (bard == 1)){
		mezid = 1100;
	}
	else if ((mezlevel >= 54) && (chanter == 1)){
		mezid = 1691;
	}
	else if ((mezlevel >= 53) && (bard == 1)){
		mezid = 1753;
	}
	else if ((mezlevel >= 47) && (chanter == 1)){
		mezid = 190;
	}
	else if ((mezlevel >= 40) && (bard == 1)){
		mezid = 868;
	}
	else if ((mezlevel >= 30) && (chanter == 1)){
		mezid = 188;
	}
	else if ((mezlevel >= 28) && (bard == 1)){
		mezid = 741;
	}
	else if ((mezlevel >= 22) && (necro == 1)){
		mezid = 549;
	}
	else if ((mezlevel >= 15) && (bard == 1)){
		mezid = 724;
	}
	else if ((mezlevel >= 13) && (chanter == 1)){
		mezid = 187;
	}
	else if ((mezlevel >= 2) && (chanter == 1)){
		mezid = 292;
	}
	// We couldn't find a spell...
	if (!mezid) {
		return result;
	}

	// Get a pointer to our group
	Group* g = entity_list.GetGroupByMob(this);
	if (!g)
		return result;

	// Get a list of everyone actively attacking our group
	list<Mob*> aggro_list = entity_list.GetGroupAggroList(g);

	// If we have more than one mob, find the one with the most HP
	if (aggro_list.size() > 1) {
		float hpRatio = 0.0;

		list<Mob*>::iterator it;
		for (it = aggro_list.begin(); it != aggro_list.end(); it++) {
			if (*it == NULL)
				continue;

			Mob* curMob = *it;

			// XXX: Don't keep spamming mez if you've failed before... Just move on
			if (curMob->DontMezMeBefore() > Timer::GetCurrentTime())
				continue;

			// Skip this mob if there is one less damaged
			if (curMob->GetHPRatio() <= hpRatio)
				continue;

			// Don't bother trying to mez mobs that are immune or are mezzed with a different effect
			if(!(!curMob->IsImmuneToSpell(mezid, this) && curMob->CanBuffStack(mezid, GetLevel(), true) >= 0))
				continue;

			// Finally, check line of sight
			if (!CheckLosFN(curMob)){
				continue;
			}

			// We have a winner
			hpRatio = curMob->GetHPRatio();
			result = curMob;
		}
	}

	return result;
}

// fez_ajer: Get a target to defend specified mob
Mob* Mob::BotGetDefensiveTarget(Mob* protect) {
	Mob* target = 0;

	list<Mob*> attackers = entity_list.GetMobAggroList(protect);
	if (attackers.size()) {
		uint8 level = 0;

		list<Mob*>::iterator it;
		for (it = attackers.begin(); it != attackers.end(); it++) {
			if (*it == NULL)
				continue;

			Mob* curMob = *it;

			// Skip this mob if there is a higher level one
			if (curMob->GetLevel() <= level)
				continue;

			// We have a winner
			level = curMob->GetLevel();
			target = curMob;
		}
	}

	return target;
}

void Mob::SetSpellState(Mob* botMember){
      if (database.BotSnareLookup(database.GetBotOwner(GetNPCTypeID())) > 1)
        this->SetBotSnare(false);
      else 
	this->SetBotSnare(true);
      
      if (database.BotSelosLookup(database.GetBotOwner(GetNPCTypeID())) > 1)
        this->SetBotSelos(false);
      else 
	this->SetBotSelos(true);
      
      if (database.BotRootLookup(database.GetBotOwner(GetNPCTypeID())) > 1)
        this->SetBotRoot(false);
      else 
	this->SetBotRoot(true);
      
      if (database.BotLock1Lookup(database.GetBotOwner(GetNPCTypeID())) > 1)
        SetBotLock1(false);
      else 
	this->SetBotLock1(true);
      
      if (database.BotSpamLookup(database.GetBotOwner(GetNPCTypeID())) > 1)
        this->SetBotChat(false);
      else 
	this->SetBotChat(true);

      if (database.BotClientModeLookup(database.GetBotOwner(GetNPCTypeID())) > 1)
        this->SetbotNpcMode(false);
      else 
	this->SetbotNpcMode(true);

      this->SetBotTashLevel(database.BotTashrLookup(database.GetBotOwner(GetNPCTypeID())));
      this->SetBotTauntLevel(database.BotTauntLookup(database.GetBotOwner(GetNPCTypeID())));
      //this->SetBotMezzer(false);
      //this->SetBotTaunter(false);
      //this->SetBotAutoDefend(false);
}

#endif //EQBOTS
