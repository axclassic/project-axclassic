/*  EQEMu:  Everquest Server Emulator
Copyright (C) 2001-2004  EQEMu Development Team (http://eqemu.org)

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; version 2 of the License.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY except by those people which sell it, which
	are required to give you total support for your newly bought product;
	without even the implied warranty of MERCHANTABILITY or FITNESS FOR
	A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

	  You should have received a copy of the GNU General Public License
	  along with this program; if not, write to the Free Software
	  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/
#include "../common/debug.h"
#include <iostream>
using namespace std;
#include <iomanip>
using namespace std;
#include <stdlib.h>
#include <math.h>
#include <algorithm>
#include "npc.h"
#include "masterentity.h"
#include "NpcAI.h"
#include "map.h"
#include "../common/moremath.h"
#include "parser.h"
#include "StringIDs.h"
#include "../common/MiscFunctions.h"
#include "../common/rulesys.h"
#include "features.h"

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
const int SpellType_Charm=4096;

const int SpellTypes_Detrimental = SpellType_Nuke|SpellType_Root|SpellType_Lifetap|SpellType_Snare|SpellType_DOT|SpellType_Dispel|SpellType_Mez|SpellType_Charm;
const int SpellTypes_Beneficial = SpellType_Heal|SpellType_Buff|SpellType_Escape|SpellType_Pet|SpellType_InCombatBuff;

#define SpellType_Any		0xFFFF
#ifdef _EQDEBUG
	#define MobAI_DEBUG_Spells	-1
#else
	#define MobAI_DEBUG_Spells	-1
#endif
#define ABS(x) ((x)<0?-(x):(x))

//NOTE: do NOT pass in beneficial and detrimental spell types into the same call here!
bool NPC::AICastSpell(Mob* tar, int8 iChance, int16 iSpellTypes) {
	_ZP(Mob_AICastSpell);
// Faction isnt checked here, it's assumed you wouldnt pass a spell type you wouldnt want casted on the mob
	if (!tar)
		return false;

	if(AI_HasSpells() == false)
		return false;

	if (iChance < 100) {
		if (MakeRandomInt(0, 100) >= iChance)
			return false;
	}
		
	float dist2;

	if (iSpellTypes & SpellType_Escape) {
	    dist2 = 0; //DistNoRoot(*this);	//WTF was up with this...
    } else 
	    dist2 = DistNoRoot(*tar);

	bool checked_los = false;	//we do not check LOS until we are absolutely sure we need to, and we only do it once.
	
	float manaR = GetManaRatio();
	for (int i=AIspells.size()-1; i >= 0; i--) {
		if (AIspells[i].spellid <= 0 || AIspells[i].spellid >= SPDAT_RECORDS) {
			// this is both to quit early to save cpu and to avoid casting bad spells
			// Bad info from database can trigger this incorrectly, but that should be fixed in DB, not here
			//return false;
			continue;
		}
		if (iSpellTypes & AIspells[i].type) {
			// manacost has special values, -1 is no mana cost, -2 is instant cast (no mana)
			sint32 mana_cost = AIspells[i].manacost;
			if (mana_cost == -1)
				mana_cost = spells[AIspells[i].spellid].mana;
			else if (mana_cost == -2)
				mana_cost = 0;
			if (
				((
					(spells[AIspells[i].spellid].targettype==ST_AECaster || spells[AIspells[i].spellid].targettype==ST_AEBard)
					&& dist2 <= spells[AIspells[i].spellid].aoerange*spells[AIspells[i].spellid].aoerange
				 ) ||
				 dist2 <= spells[AIspells[i].spellid].range*spells[AIspells[i].spellid].range
				)
				&& (mana_cost <= GetMana() || GetMana() == GetMaxMana())
				&& (AIspells[i].time_cancast+(rand()%5)) <= Timer::GetCurrentTime() //break up the spelling casting over a period of time.
				) {

#if MobAI_DEBUG_Spells >= 21
				cout << "Mob::AICastSpell: Casting: spellid=" << AIspells[i].spellid
                    << ", tar=" << tar->GetName() 
                    << ", dist2[" << dist2 << "]<=" << spells[AIspells[i].spellid].range *spells[AIspells[i].spellid].range 
                    << ", mana_cost[" << mana_cost << "]<=" << GetMana() 
                    << ", cancast[" << AIspells[i].time_cancast << "]<=" << Timer::GetCurrentTime()
                    << ", type=" << AIspells[i].type << endl;
#endif

				switch (AIspells[i].type) {
					case SpellType_Heal: {
						if (
							(spells[AIspells[i].spellid].targettype == ST_Target || tar == this)
							&& tar->DontHealMeBefore() < Timer::GetCurrentTime()
							&& !(tar->IsPet() && tar->GetOwner()->IsClient())	//no buffing PC's pets
							) {
							
							if(RuleB(NPC, CheckBeneficialSpellLOS))
							{
								if(!checked_los) 
								{
#ifdef EQBOTS
									if(!IsBot() && !CheckLosFN(tar))
										return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
#else
									if(!CheckLosFN(tar))
										return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
#endif // EQBOTS
									checked_los = true;
								}
							}

							int8 hpr = (int8)tar->GetHPRatio();

							if(hpr <= 35 || (!IsEngaged() && hpr <= 50) || (tar->IsClient() && hpr <= 99)) {
								int32 tempTime = 0;
								AIDoSpellCast(i, tar, mana_cost, &tempTime);
								tar->SetDontHealMeBefore(tempTime);
								return true;
							}
						}
						break;
					}
					case SpellType_Root: {
						if (
							!tar->IsRooted() 
							&& dist2 >= 900 
							&& MakeRandomInt(0, 99) < 50
							&& tar->DontRootMeBefore() < Timer::GetCurrentTime()
							&& tar->CanBuffStack(AIspells[i].spellid, GetLevel(), true) >= 0
							) {
							if(!checked_los) {
								if(!CheckLosFN(tar))
									return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
								checked_los = true;
							}
							int32 tempTime = 0;
							AIDoSpellCast(i, tar, mana_cost, &tempTime);
							tar->SetDontRootMeBefore(tempTime);
							return true;
						}
						break;
					}
					case SpellType_Buff: {
						if (
							(spells[AIspells[i].spellid].targettype == ST_Target || tar == this)
							&& tar->DontBuffMeBefore() < Timer::GetCurrentTime()
							&& !tar->IsImmuneToSpell(AIspells[i].spellid, this)
							&& tar->CanBuffStack(AIspells[i].spellid, GetLevel(), true) >= 0
							&& !(tar->IsPet() && tar->GetOwner()->IsClient() && this != tar)	//no buffing PC's pets, but they can buff themself
							) {
							
							if(RuleB(NPC, CheckBeneficialSpellLOS))
							{
								if(!checked_los) 
								{
#ifdef EQBOTS
									if(!IsBot() && !CheckLosFN(tar))
										return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
#else
									if(!CheckLosFN(tar))
										return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
#endif // EQBOTS
									checked_los = true;
								}
							}
							
							int32 tempTime = 0;
							AIDoSpellCast(i, tar, mana_cost, &tempTime);
							tar->SetDontBuffMeBefore(tempTime);
							return true;
						}
						break;
					}

					case SpellType_InCombatBuff: {
						if(MakeRandomInt(0,100) < 50)
						{
                            AIDoSpellCast(i, tar, mana_cost);
							return true;
						}
						break;
					}

					case SpellType_Escape: {
	                #ifdef IPC          
                        if (GetHPRatio() <= 5 || (IsNPC() && CastToNPC()->IsInteractive() && tar != this) )
					#else
                        if (GetHPRatio() <= 5 )	
                    #endif
                    	{
                            AIDoSpellCast(i, tar, mana_cost);
							return true;
						}
						break;
					}
					case SpellType_Nuke: {
						if (
							manaR >= 10 && (rand()%100) < 70
							&& tar->CanBuffStack(AIspells[i].spellid, GetLevel(), true) >= 0
							) {
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
					case SpellType_Dispel: {
						if(MakeRandomInt(0, 100) < 15)
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
					case SpellType_Mez: {
						if(MakeRandomInt(0, 99) < 20)
						{
							Mob * mezTar = NULL;
							mezTar = entity_list.GetTargetForMez(this);

							if(mezTar && mezTar->CanBuffStack(AIspells[i].spellid, GetLevel(), true) >= 0)
							{
								AIDoSpellCast(i, mezTar, mana_cost);
								return true;
							}
						}
						break;
					}
					
					case SpellType_Charm: 
					{
						if(MakeRandomInt(0, 99) < 20)
						{
							Mob * chrmTar = GetHateRandom();
							if(chrmTar && chrmTar->CanBuffStack(AIspells[i].spellid, GetLevel(), true) >= 0)
							{
								AIDoSpellCast(i, chrmTar, mana_cost);
								return true;
							}
							break;
						}
					}

					case SpellType_Pet: {
						 //keep mobs from recasting pets when they have them.
						if (!IsPet() && !GetPetID() && MakeRandomInt(0, 99) < 25) {
							AIDoSpellCast(i, tar, mana_cost);
							return true;
						}
						break;
					}
					case SpellType_Lifetap: {
						if (   GetHPRatio() <= 95
							&& MakeRandomInt(0, 99) < 50
							&& tar->CanBuffStack(AIspells[i].spellid, GetLevel(), true) >= 0
							) {
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
						if (
							   !tar->IsRooted()
							&& MakeRandomInt(0, 99) < 50
							&& tar->DontSnareMeBefore() < Timer::GetCurrentTime()
							&& tar->CanBuffStack(AIspells[i].spellid, GetLevel(), true) >= 0
							) {
							if(!checked_los) {
								if(!CheckLosFN(tar))
									return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
								checked_los = true;
							}
							int32 tempTime = 0;
							AIDoSpellCast(i, tar, mana_cost, &tempTime);
							tar->SetDontSnareMeBefore(tempTime);
							return true;
						}
						break;
					}
					case SpellType_DOT: {
						if (
							MakeRandomInt(0, 99) < 60
							&& tar->DontDotMeBefore() < Timer::GetCurrentTime()
							&& tar->CanBuffStack(AIspells[i].spellid, GetLevel(), true) >= 0
							) {
							if(!checked_los) {
								if(!CheckLosFN(tar))
									return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
								checked_los = true;
							}
							int32 tempTime = 0;
							AIDoSpellCast(i, tar, mana_cost, &tempTime);
							tar->SetDontDotMeBefore(tempTime);
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
#if MobAI_DEBUG_Spells >= 21
			else {
				cout << "Mob::AICastSpell: NotCasting: spellid=" << AIspells[i].spellid << ", tar=" << tar->GetName() << ", dist2[" << dist2 << "]<=" << spells[AIspells[i].spellid].range*spells[AIspells[i].spellid].range << ", mana_cost[" << mana_cost << "]<=" << GetMana() << ", cancast[" << AIspells[i].time_cancast << "]<=" << Timer::GetCurrentTime() << endl;
			}
#endif
		}
	}
	return false;
}

bool NPC::AIDoSpellCast(int8 i, Mob* tar, sint32 mana_cost, int32* oDontDoAgainBefore) {
#if MobAI_DEBUG_Spells >= 1
	cout << "Mob::AIDoSpellCast: spellid=" << AIspells[i].spellid << ", tar=" << tar->GetName() << ", mana=" << mana_cost << ", Name: " << spells[AIspells[i].spellid].name << endl;
#endif
	casting_spell_AIindex = i;
	
	//stop moving if were casting a spell and were not a bard...
	if(!IsBardSong(AIspells[i].spellid)) {
		SetRunAnimSpeed(0);
		SendPosition();
		SetMoving(false);
	}
	
	return CastSpell(AIspells[i].spellid, tar->GetID(), 1, AIspells[i].manacost == -2 ? 0 : -1, mana_cost, oDontDoAgainBefore);
}

bool EntityList::AICheckCloseBeneficialSpells(NPC* caster, int8 iChance, float iRange, int16 iSpellTypes) {
	_ZP(EntityList_AICheckCloseBeneficialSpells);

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

	if(caster->AI_HasSpells() == false)
		return false;

	if (iChance < 100) {
		int8 tmp = MakeRandomInt(0, 99);
		if (tmp >= iChance)
			return false;
	}
	if (caster->GetPrimaryFaction() == 0 )
		return(false); // well, if we dont have a faction set, we're gonna be indiff to everybody

	float iRange2 = iRange*iRange;
	
	float t1, t2, t3;
	

	//Only iterate through NPCs
    LinkedListIterator<NPC*> iterator(npc_list);
    for(iterator.Reset(); iterator.MoreElements(); iterator.Advance()) {
		NPC* mob = iterator.GetData();
		
		//Since >90% of mobs will always be out of range, try to
		//catch them with simple bounding box checks first. These
		//checks are about 6X faster than DistNoRoot on my athlon 1Ghz
		t1 = mob->GetX() - caster->GetX();
		t2 = mob->GetY() - caster->GetY();
		t3 = mob->GetZ() - caster->GetZ();
		//cheap ABS()
		if(t1 < 0)
			t1 = 0 - t1;
		if(t2 < 0)
			t2 = 0 - t2;
		if(t3 < 0)
			t3 = 0 - t3;
		if (   t1 > iRange
			|| t2 > iRange
			|| t3 > iRange
			|| mob->DistNoRoot(*caster) > iRange2
				//this call should seem backwards:
			|| mob->GetReverseFactionCon(caster) >= FACTION_KINDLY
		) {
			continue;
		}

		//since we assume these are beneficial spells, which do not
		//require LOS, we just go for it.
		// we have a winner!
		if((iSpellTypes & SpellType_Buff) && !RuleB(NPC, BuffFriends)){
			if (mob != caster)
				iSpellTypes = SpellType_Heal;
		}

		if (caster->AICastSpell(mob, 100, iSpellTypes))
			return true;
	}
	return false;
}

void Mob::AI_Init() {
	pAIControlled = false;
	AIthink_timer = 0;
	AIwalking_timer = 0;
	AImovement_timer = 0;
	AItarget_check_timer = 0;
	AIfeignremember_timer = NULL;
	AIscanarea_timer = 0;
	minLastFightingDelayMoving = RuleI(NPC, LastFightingDelayMovingMin);
	maxLastFightingDelayMoving = RuleI(NPC, LastFightingDelayMovingMax);

	pDontHealMeBefore = 0;
	pDontBuffMeBefore = 0;
	pDontDotMeBefore = 0;
	pDontRootMeBefore = 0;
	pDontSnareMeBefore = 0;
}

void NPC::AI_Init() {
	Mob::AI_Init();
	
	AIautocastspell_timer = 0;
	casting_spell_AIindex = AIspells.size();

	roambox_max_x = 0;
	roambox_max_y = 0;
	roambox_min_x = 0;
	roambox_min_y = 0;
	roambox_distance = 0;
	roambox_movingto_x = 0;
	roambox_movingto_y = 0;
	roambox_delay = 2500;
}

void Client::AI_Init() {
	Mob::AI_Init();
	minLastFightingDelayMoving = CLIENT_LD_TIMEOUT;
	maxLastFightingDelayMoving = CLIENT_LD_TIMEOUT;
}

void Mob::AI_Start(int32 iMoveDelay) {
	if (pAIControlled)
		return;

	if (iMoveDelay)
		pLastFightingDelayMoving = Timer::GetCurrentTime() + iMoveDelay;
	else
		pLastFightingDelayMoving = 0;

	pAIControlled = true;
	AIthink_timer = new Timer(AIthink_duration);
	AIthink_timer->Trigger();
	AIwalking_timer = new Timer(0);
	AImovement_timer = new Timer(AImovement_duration);
	AItarget_check_timer = new Timer(AItarget_check_duration);
	AIfeignremember_timer = new Timer(AIfeignremember_delay);
	AIscanarea_timer = new Timer(AIscanarea_delay);
#ifdef REVERSE_AGGRO
	if(IsNPC() && !CastToNPC()->WillAggroNPCs())
		AIscanarea_timer->Disable();
#endif

	if (GetAggroRange() == 0)
		pAggroRange = 70;
	if (GetAssistRange() == 0)
		pAssistRange = 70;
	hate_list.Wipe();

	delta_heading = 0;
	delta_x = 0;
	delta_y = 0;
	delta_z = 0;
	pRunAnimSpeed = 0;
	pLastChange = Timer::GetCurrentTime();
}

void Client::AI_Start(int32 iMoveDelay) {
	Mob::AI_Start(iMoveDelay);

	if (!pAIControlled)
		return;
	
	pClientSideTarget = GetTarget() ? GetTarget()->GetID() : 0;
	SendAppearancePacket(AT_Anim, ANIM_FREEZE);	// this freezes the client
	SendAppearancePacket(AT_Linkdead, 1); // Sending LD packet so *LD* appears by the player name when charmed/feared -Kasai
	SetAttackTimer();
	SetFeigned(false);
}

void NPC::AI_Start(int32 iMoveDelay) {
	Mob::AI_Start(iMoveDelay);
	if (!pAIControlled)
		return;
	
	if (AIspells.size() == 0) {
		AIautocastspell_timer = new Timer(1000);
		AIautocastspell_timer->Disable();
	} else {
		AIautocastspell_timer = new Timer(750);
		AIautocastspell_timer->Start(RandomTimer(0, 15000), false);
	}
	
	if (NPCTypedata) {
		AI_AddNPCSpells(NPCTypedata->npc_spells_id);
		NPCSpecialAttacks(NPCTypedata->npc_attacks,0);
	}
	
	SendTo(GetX(), GetY(), GetZ());
	SetChanged();
	SaveGuardSpot();
}

void Mob::AI_Stop() {
	if (!IsAIControlled())
		return;
	pAIControlled = false;
	safe_delete(AIthink_timer);
	safe_delete(AIwalking_timer);
	safe_delete(AImovement_timer);
	safe_delete(AItarget_check_timer)
	safe_delete(AIscanarea_timer);
	safe_delete(AIfeignremember_timer);
	hate_list.Wipe();
}

void NPC::AI_Stop() {

#ifdef EQBOTS

	if(IsBot()) {
		Mob::AI_Stop();					// jadams: Unsure if this is bot code? No comment
	}

#endif //EQBOTS

	Waypoints.clear();
	safe_delete(AIautocastspell_timer);
}

void Client::AI_Stop() {
	Mob::AI_Stop();
	this->Message_StringID(13,PLAYER_REGAIN);

	EQApplicationPacket *app = new EQApplicationPacket(OP_Charm, sizeof(Charm_Struct));
	Charm_Struct *ps = (Charm_Struct*)app->pBuffer;
	ps->owner_id = 0;
	ps->pet_id = this->GetID();
	ps->command = 0;
	entity_list.QueueClients(this, app);
	safe_delete(app);

	SetTarget(entity_list.GetMob(pClientSideTarget));
	SendAppearancePacket(AT_Anim, GetAppearanceValue(GetAppearance()));
	SendAppearancePacket(AT_Linkdead, 0); // Removing LD packet so *LD* no longer appears by the player name when charmed/feared -Kasai
	if (!auto_attack) {
		attack_timer.Disable();
		attack_dw_timer.Disable();
	}
	if (IsLD())
	{
		Save();
		Disconnect();
	}
}

//todo: expand the logic here to cover:
//redundant debuffs
//buffing owner
//certain types of det spells that need special behavior.
void Client::AI_SpellCast()
{
	if(!charm_cast_timer.Check())
		return;

	Mob *targ = GetTarget();
	if(!targ)
		return;

	float dist = DistNoRootNoZ(*targ);

	std::vector<int32> valid_spells;
	std::vector<int32> slots;

	for(uint32 x = 0; x < 9; ++x)
	{
		int32 current_spell = m_pp.mem_spells[x];
		if(!IsValidSpell(current_spell))
			continue;

		if(IsBeneficialSpell(current_spell))
		{
			continue;
		}

		if(dist > spells[current_spell].range*spells[current_spell].range)
		{
			continue;
		}

		if(GetMana() < spells[current_spell].mana)
		{
			continue;
		}

		if(IsEffectInSpell(current_spell, SE_Charm))
		{
			continue;
		}

		if(!GetPTimers().Expired(&database, pTimerSpellStart + current_spell, false)) 
		{
			continue;
		}

		if(targ->CanBuffStack(current_spell, GetLevel(), true) < 0)
		{
			continue;
		}

		//bard songs cause trouble atm
		if(IsBardSong(current_spell))
			continue;

		valid_spells.push_back(current_spell);
		slots.push_back(x);
	}

	int32 spell_to_cast = 0xFFFFFFFF;
	int32 slot_to_use = 10;
	if(valid_spells.size() == 1)
	{
		spell_to_cast = valid_spells[0];
		slot_to_use = slots[0];
	}
	else if(valid_spells.size() == 0)
	{
		return;
	}
	else
	{
		int32 idx = MakeRandomInt(0, (valid_spells.size()-1));
		spell_to_cast = valid_spells[idx];
		slot_to_use = slots[idx];
	}

	if(IsMezSpell(spell_to_cast) || IsFearSpell(spell_to_cast))
	{
		Mob *tar = entity_list.GetTargetForMez(this);
		if(!tar)
		{
			tar = GetTarget();
			if(tar && IsFearSpell(spell_to_cast))
			{
				if(!IsBardSong(spell_to_cast)) 
				{
					SetRunAnimSpeed(0);
					SendPosition();
					SetMoving(false);
				}
				CastSpell(spell_to_cast, tar->GetID(), slot_to_use);
				return;
			}
		}
	}
	else
	{
		Mob *tar = GetTarget();
		if(tar)
		{
			if(!IsBardSong(spell_to_cast)) 
			{
				SetRunAnimSpeed(0);
				SendPosition();
				SetMoving(false);
			}
			CastSpell(spell_to_cast, tar->GetID(), slot_to_use);
			return;
		}
	}


}

void Client::AI_Process()
{
	if (!IsAIControlled())
		return;

	if (!(AIthink_timer->Check() || attack_timer.Check(false)))
		return;

	if (IsCasting())
		return;
	
	bool engaged = IsEngaged();

	Mob *ow = GetOwner();
	if(!engaged)
	{
		if(ow)
		{
			if(ow->IsEngaged())
			{
				Mob *tar = ow->GetTarget();
				if(tar)
				{
					AddToHateList(tar, 1, 0, false);
				}
			}
		}
	}

	if(!ow)
	{
		if(!IsFeared() && !IsLD())
		{
			BuffFadeByEffect(SE_Charm);
			return;
		}
	}

	if(RuleB(Combat, EnableFearPathing)){
		if(curfp) {
			if(IsRooted()) {
				//make sure everybody knows were not moving, for appearance sake
				if(IsMoving())
				{
					if(GetTarget())
						SetHeading(CalculateHeadingToTarget(GetTarget()->GetX(), GetTarget()->GetY()));
					SetRunAnimSpeed(0);
					SendPosition();
					SetMoving(false);
					moved=false;
				}
				//continue on to attack code, ensuring that we execute the engaged code
				engaged = true;
			} else {
				if(AImovement_timer->Check()) {
					animation = GetRunspeed() * 21;
					// Check if we have reached the last fear point
					if((ABS(GetX()-fear_walkto_x) < 0.1) && (ABS(GetY()-fear_walkto_y) <0.1)) {
						// Calculate a new point to run to
						CalculateNewFearpoint();
					}
					if(!RuleB(Pathing, Fear) || !zone->pathing)
						CalculateNewPosition2(fear_walkto_x, fear_walkto_y, fear_walkto_z, GetFearSpeed(), true);
					else
					{
						bool WaypointChanged, NodeReached;

						VERTEX Goal = UpdatePath(fear_walkto_x, fear_walkto_y, fear_walkto_z,
									 GetFearSpeed(), WaypointChanged, NodeReached);

						if(WaypointChanged)
							tar_ndx = 20;

						CalculateNewPosition2(Goal.x, Goal.y, Goal.z, GetFearSpeed());
					}
				}
				return;
			}
		}
	}

	if (engaged) 
	{
		if (IsRooted())
			SetTarget(hate_list.GetClosest(this));
		else
		{
			if(AItarget_check_timer->Check())
			{
				SetTarget(hate_list.GetTop(this));
			}
		}

		if (!GetTarget())
			return;

		if (GetTarget()->IsCorpse()) {
			RemoveFromHateList(this);
			return;
		}
      
		if(DivineAura())
			return;
			
		bool is_combat_range = CombatRange(GetTarget());
		
		if(is_combat_range) {
			if(charm_class_attacks_timer.Check()) {
				DoClassAttacks(GetTarget());
			}

			if (AImovement_timer->Check()) {
				SetRunAnimSpeed(0);
			}
			if(IsMoving()) {
				SetMoving(false);
				moved=false;
				SetHeading(CalculateHeadingToTarget(GetTarget()->GetX(), GetTarget()->GetY()));
				SendPosition();
				tar_ndx =0;
			}

			if(GetTarget() && !IsStunned() && !IsMezzed() && !GetFeigned()) {
				if(attack_timer.Check()) {
					Attack(GetTarget(), 13);
					if(GetTarget()) {
						if(CheckDoubleAttack()) {
							Attack(GetTarget(), 13);
							if(GetTarget()) {
								bool triple_attack_success = false;
								if((((GetClass() == MONK || GetClass() == WARRIOR || GetClass() == RANGER || GetClass() == BERSERKER)
									&& GetLevel() >= 60) || SpecAttacks[SPECATK_TRIPLE])
									&& CheckDoubleAttack(true))
								{
									Attack(GetTarget(), 13, true);
									triple_attack_success = true;
								}

								if(GetTarget())
								{
									int32 flurry_chance = 0;
									int32 RandChance = MakeRandomInt(0, 999);
									switch (GetAA(aaFlurry)) 
									{
									case 1:
										flurry_chance += 10;
										break;
									case 2:
										flurry_chance += 25;
										break;
									case 3:
										flurry_chance += 50;
										break;
									}

									if(triple_attack_success) 
									{
										triple_attack_success = false;
										switch (GetAA(aaRagingFlurry)) 
										{
										case 1:
											flurry_chance += 10;
											break;
										case 2:
											flurry_chance += 25;
											break;
										case 3:
											flurry_chance += 50;
											break;
										}
									}

									if(RandChance < flurry_chance) 
									{
										Message_StringID(MT_Flurry, 128);
										Attack(GetTarget(), 13, true);
										Attack(GetTarget(), 13, true);
									}

									if (GetTarget() && GetAA(aaRapidStrikes))
									{
										int32 chance_xhit1 = 0;
										int32 chance_xhit2 = 0;
										switch (GetAA(aaRapidStrikes))
										{
										case 1:
											chance_xhit1 = 10;
											chance_xhit2 = 2;
											break;
										case 2:
											chance_xhit1 = 12;
											chance_xhit2 = 4;
											break;
										case 3:
											chance_xhit1 = 14;
											chance_xhit2 = 6;
											break;
										case 4:
											chance_xhit1 = 16;
											chance_xhit2 = 8;
											break;
										case 5:
											chance_xhit1 = 20;
											chance_xhit2 = 10;
											break;
										}
										if (RandChance < chance_xhit1)
											Attack(GetTarget(), 13, true);
										if (RandChance < chance_xhit2)
											Attack(GetTarget(), 13, true);
									}

									if(GetTarget() && (GetAA(aaPunishingBlade) > 0 || GetAA(aaSpeedoftheKnight) > 0)) 
									{
										ItemInst *wpn = GetInv().GetItem(SLOT_PRIMARY);
										if(wpn)
										{
											if(wpn->GetItem()->ItemType == ItemType2HS || 
												wpn->GetItem()->ItemType == ItemType2HB ||
												wpn->GetItem()->ItemType == ItemType2HPierce )
											{
												int32 extatk = GetAA(aaPunishingBlade)*5;
												extatk += GetAA(aaSpeedoftheKnight)*5;
												if (RandChance < extatk)
												{
													Attack(GetTarget(), 13, true);
												}
											}
										}
									}

									if (GetClass() == WARRIOR || GetClass() == BERSERKER) 
									{
										if(!dead && !berserk && this->GetHPRatio() < 30) 
										{
											entity_list.MessageClose_StringID(this, false, 200, 0, BERSERK_START, GetName());
											berserk = true;
										}
										else if (berserk && this->GetHPRatio() > 30) 
										{
											entity_list.MessageClose_StringID(this, false, 200, 0, BERSERK_END, GetName());
											berserk = false;
										}
									}
								}
							}
						}
					}
				}
			}

			if(CanThisClassDualWield() && attack_dw_timer.Check())
			{
				if(GetTarget())
				{
					float DualWieldProbability = (GetSkill(DUAL_WIELD) + GetLevel()) / 400.0f; // 78.0 max
					DualWieldProbability += (0.1f * GetAA(aaAmbidexterity));
					DualWieldProbability += ((spellbonuses.DualWeildChance + itembonuses.DualWeildChance) / 100.0f);			

					if(MakeRandomFloat(0.0, 1.0) < DualWieldProbability)
					{
						Attack(GetTarget(), 14);
						if(CheckDoubleAttack())
						{
							Attack(GetTarget(), 14);
						}

					}
				}
			}
		}
		else
		{
			if(!IsRooted())
			{
				animation = 21 * GetRunspeed();
				if(!RuleB(Pathing, Aggro) || !zone->pathing)
					CalculateNewPosition2(GetTarget()->GetX(), GetTarget()->GetY(), GetTarget()->GetZ(), GetRunspeed());
				else
				{
					bool WaypointChanged, NodeReached;
					VERTEX Goal = UpdatePath(GetTarget()->GetX(), GetTarget()->GetY(), GetTarget()->GetZ(),
						GetRunspeed(), WaypointChanged, NodeReached);

					if(WaypointChanged)
						tar_ndx = 20;

					CalculateNewPosition2(Goal.x, Goal.y, Goal.z, GetRunspeed());
				}				
			}
			else if(IsMoving())
			{
				SetHeading(CalculateHeadingToTarget(GetTarget()->GetX(), GetTarget()->GetY()));
				SetRunAnimSpeed(0);
				SendPosition();
				SetMoving(false);
				moved=false;				
			}
		}
		AI_SpellCast();
	}
	else
	{
		if(AIfeignremember_timer->Check()) {
			std::set<int32>::iterator RememberedCharID, tmp;
			RememberedCharID=feign_memory_list.begin();
			bool got_one = false;
			while(RememberedCharID != feign_memory_list.end()) {
				Client* remember_client = entity_list.GetClientByCharID(*RememberedCharID);
				if(remember_client == NULL) {
					//they are gone now...
					tmp = RememberedCharID;
					RememberedCharID++;
					feign_memory_list.erase(tmp);
				} else if (!remember_client->GetFeigned()) {
					AddToHateList(remember_client->CastToMob(),1);
					tmp = RememberedCharID;
					RememberedCharID++;
					feign_memory_list.erase(tmp);
					got_one = true;
					break;
				} else {
					//they are still feigned, carry on...
					RememberedCharID++;
				}
			}
		}

		if(IsPet()) 
		{			
			Mob* owner = GetOwner();
			if(owner == NULL)
				return;
#ifdef EQBOTS		
			if (owner->IsBot())
				return;
#endif
			float dist = DistNoRoot(*owner);
			if (dist >= 100) 
			{
				float speed = dist >= 25 ? GetRunspeed() : GetWalkspeed();
				animation = 21 * speed;
				CalculateNewPosition2(owner->GetX(), owner->GetY(), owner->GetZ(), speed);
			}
			else
			{
				SetHeading(owner->GetHeading());
				if(moved)
				{
					moved=false;
					SetMoving(false);
					SendPosition();
					SetRunAnimSpeed(0);
				}
			}
		}
	}
}

void Mob::AI_Process() {
	_ZP(Mob_AI_Process);

	if (!IsAIControlled())
		return;

	if (!(AIthink_timer->Check() || attack_timer.Check(false)))
		return;

	if (IsCasting())
		return;
	
	bool engaged = IsEngaged();

	// Begin: Additions for Wiz Fear Code
	//
	if(RuleB(Combat, EnableFearPathing)){
		if(curfp) {
			if(IsRooted()) {
				//make sure everybody knows were not moving, for appearance sake
				if(IsMoving())
				{
					if(target)
					    SetHeading(CalculateHeadingToTarget(target->GetX(), target->GetY()));
					
					SetRunAnimSpeed(0);
					SendPosition();
					SetMoving(false);
					moved=false;
				}
				//continue on to attack code, ensuring that we execute the engaged code
				engaged = true;
			} else {
				if(AImovement_timer->Check()) {
					// Check if we have reached the last fear point
					if((ABS(GetX()-fear_walkto_x) < 0.1) && (ABS(GetY()-fear_walkto_y) <0.1)) {
						// Calculate a new point to run to
						CalculateNewFearpoint();
					}
					if(!RuleB(Pathing, Fear) || !zone->pathing)
						CalculateNewPosition2(fear_walkto_x, fear_walkto_y, fear_walkto_z, GetFearSpeed(), true);
					else
					{
						bool WaypointChanged, NodeReached;

						VERTEX Goal = UpdatePath(fear_walkto_x, fear_walkto_y, fear_walkto_z,
									 GetFearSpeed(), WaypointChanged, NodeReached);

						if(WaypointChanged)
							tar_ndx = 20;

						CalculateNewPosition2(Goal.x, Goal.y, Goal.z, GetFearSpeed());
					}
				}
				return;
			}
		}
	}
	
	// trigger EVENT_SIGNAL if required
	if(IsNPC()) {
		CastToNPC()->CheckSignal();
	}
	
	if (engaged) 
	{
		_ZP(Mob_AI_Process_engaged);
		if (IsRooted())
			SetTarget(hate_list.GetClosest(this));
		else
		{
			if(AItarget_check_timer->Check())
			{
				SetTarget(hate_list.GetTop(this));
			}
		}

		if (!target)
			return;

		if (target->IsCorpse())
		{
			RemoveFromHateList(this);
			return;
		}
      
		if(DivineAura())
			return;

		if (GetHPRatio() < 15)
			StartEnrage();
		
		bool is_combat_range = CombatRange(target);
		
	
        if (is_combat_range) 
        {
			if (AImovement_timer->Check()) 
			{
				SetRunAnimSpeed(0);
			}
			if(IsMoving())
			{
				SetMoving(false);
				moved=false;
				SetHeading(CalculateHeadingToTarget(target->GetX(), target->GetY()));
				SendPosition();
				tar_ndx =0;
			}
			
			//casting checked above...
			if(target && !IsStunned() && !IsMezzed() && GetAppearance() != eaDead) {
				
				//we should check to see if they die mid-attacks, previous
				//crap of checking target for null was not gunna cut it
				
				//try main hand first
				if(attack_timer.Check()) {
					Attack(target, 13);
					if (target) 
					{
						//we use this random value in three comparisons with different
						//thresholds, and if its truely random, then this should work
						//out reasonably and will save us compute resources.
						sint32 RandRoll = MakeRandomInt(0, 99);
						if (CanThisClassDoubleAttack()
							//check double attack, this is NOT the same rules that clients use...
							&& RandRoll < (GetLevel() + NPCDualAttackModifier))  
						{
							if (Attack(target, 13)) 
							{
								// lets see if we can do a triple attack with the main hand
								//pets are excluded from triple and quads...
								if (SpecAttacks[SPECATK_TRIPLE]
									&& !IsPet() && RandRoll < (GetLevel()+NPCTripleAttackModifier))
								{
									if (Attack(target, 13)) 
									{	// now lets check the quad attack
										if (SpecAttacks[SPECATK_QUAD]
											&& RandRoll < (GetLevel() + NPCQuadAttackModifier))  
										{
											Attack(target, 13);
										}
									}
								}
							}
						}
					}
	
					if (SpecAttacks[SPECATK_FLURRY]) {
					    // perhaps get the values from the db?
					    if (MakeRandomInt(0, 99) < 20)
							Flurry();
					}

					if (IsPet() && GetOwner()->IsClient()) {
						int aa_chance = 0;
						// Magician AA
						int aa_skill = GetOwner()->CastToClient()->GetAA(aaElementalAlacrity);
						// Necromancer AA
						if (aa_skill < 1) {
							aa_skill = GetOwner()->CastToClient()->GetAA(aaQuickeningofDeath);
						}
						// Beastlord AA
						if (aa_skill < 1) {
							aa_skill = GetOwner()->CastToClient()->GetAA(aaWardersAlacrity);
						}
						switch (aa_skill)
						{
						case 1:
							aa_chance = 2;
							break;
						case 2:
							aa_chance = 4;
							break;
						case 3:
							aa_chance = 6;
							break;
						case 4:
							aa_chance = 8;
							break;
						case 5:
							aa_chance = 10;
							break;
						}
						if (MakeRandomInt(1, 100) < aa_chance)
							Flurry();
					}
	
					if (SpecAttacks[SPECATK_RAMPAGE]) 
					{
					    //simply based off dex for now, probably a better calc
					    if (MakeRandomInt(0, 99) < ((GetDEX()/45) + 20))
							Rampage();
					}

					if (SpecAttacks[SPECATK_AREA_RAMPAGE]) 
					{

						//simply based off dex for now, probably a better calc
					    if (MakeRandomInt(0, 99) < ((GetDEX()/45) + 20))
							AreaRampage();
					}
				}
				
				//now off hand
				if (attack_dw_timer.Check() && CanThisClassDualWield()) 
				{
					int myclass = GetClass();
					//can only dual weild without a weapon if your a monk
					if((GetEquipment(MATERIAL_SECONDARY) != 0 && GetLevel() > 39) || myclass == MONK || myclass == MONKGM) {
						float DualWieldProbability = (GetSkill(DUAL_WIELD) + GetLevel()) / 400.0f;
						DualWieldProbability -= MakeRandomFloat(0, 1);
						if(DualWieldProbability < 0){
							Attack(target, 14);
							if (CanThisClassDoubleAttack()) 
							{
								sint32 RandRoll = rand()%100;
								if (RandRoll < (GetLevel() + 20))  
								{
									if (Attack(target, 14));
								}
							} // if (CanThisClassDoubleAttack())
						}
					}
				}
				
				//now special attacks (kick, etc)
				if(IsNPC())
					CastToNPC()->DoClassAttacks(target);
			}
			AI_EngagedCastCheck();
		}	//end is within combat range
		else {
			//we cannot reach our target...
			// See if we can summon the mob to us
			if (!HateSummon()) 
			{
				//could not summon them, start pursuing...
// TODO: Check here for another person on hate list with close hate value
				if(AI_PursueCastCheck()){
					//we did something, so do not process movement.
				}
				else if (AImovement_timer->Check()) 
				{
					if(!IsRooted()) {
						mlog(AI__WAYPOINTS, "Pursuing %s while engaged.", target->GetName());
						if(!RuleB(Pathing, Aggro) || !zone->pathing)
							CalculateNewPosition2(target->GetX(), target->GetY(), target->GetZ(), GetRunspeed());
						else
						{
							bool WaypointChanged, NodeReached;

							VERTEX Goal = UpdatePath(target->GetX(), target->GetY(), target->GetZ(),
										 GetRunspeed(), WaypointChanged, NodeReached);

							if(WaypointChanged)
								tar_ndx = 20;

							CalculateNewPosition2(Goal.x, Goal.y, Goal.z, GetRunspeed());
						}

					} else if(IsMoving()) {
						SetHeading(CalculateHeadingToTarget(target->GetX(), target->GetY()));
						SetRunAnimSpeed(0);
						SendPosition();
						SetMoving(false);
						moved=false;
					}
				}
			}
		}
	}
	else 
	{
		if(AIfeignremember_timer->Check()) {
			// EverHood - 6/14/06
			// Improved Feign Death Memory
			// check to see if any of our previous feigned targets have gotten up.
			std::set<int32>::iterator RememberedCharID, tmp;
			RememberedCharID=feign_memory_list.begin();
			bool got_one = false;
			while(RememberedCharID != feign_memory_list.end()) {
				Client* remember_client = entity_list.GetClientByCharID(*RememberedCharID);
				if(remember_client == NULL) {
					//they are gone now...
					tmp = RememberedCharID;
					RememberedCharID++;
					feign_memory_list.erase(tmp);
				} else if (!remember_client->GetFeigned()) {
					AddToHateList(remember_client->CastToMob(),1);
					tmp = RememberedCharID;
					RememberedCharID++;
					feign_memory_list.erase(tmp);
					got_one = true;
					break;
				} else {
					//they are still feigned, carry on...
					RememberedCharID++;
				}
			}
		}
		if (AI_IdleCastCheck()) 
		{
			//we processed a spell action, so do nothing else.
		}
		else if (AIscanarea_timer->Check()) 
		{
			/*                                                                              
            * This is where NPCs look around to see if they want to attack anybody.
            *
            * if REVERSE_AGGRO is enabled, then this timer is disabled unless they
            * have the npc_aggro flag on them, and aggro against clients is checked
            * by the clients.
            *
            */
			_ZP(Mob_AI_Process_scanarea);
			
			Mob* tmptar = entity_list.AICheckCloseAggro(this, GetAggroRange(), GetAssistRange());
			if (tmptar) 
				AddToHateList(tmptar);
		}
		else if (AImovement_timer->Check() && !IsRooted()) 
		{
			_ZP(Mob_AI_Process_move);
			SetRunAnimSpeed(0);
			if (IsPet()) 
			{
				_ZP(Mob_AI_Process_pet);
				// we're a pet, do as we're told
				switch (pStandingPetOrder) 
				{
					case SPO_Follow: 
					{
						
						Mob* owner = GetOwner();
						if(owner == NULL)
							break;
						
						//if(owner->IsClient())
						//	printf("Pet start pos: (%f, %f, %f)\n", GetX(), GetY(), GetZ());
						
						float dist = DistNoRoot(*owner);
						if (dist >= 100) 
						{
							float speed = GetWalkspeed();
							if (dist >= 225)
								speed = GetRunspeed();
							CalculateNewPosition2(owner->GetX(), owner->GetY(), owner->GetZ(), speed);
						}
						else
						{
							SetHeading(owner->GetHeading());
							if(moved)
							{
								moved=false;
								SetMoving(false);
								SendPosition();
							}
						}
					
						/*
						//fix up Z
						float zdiff = GetZ() - owner->GetZ();
						if(zdiff < 0)
							zdiff = 0 - zdiff;
						if(zdiff > 2.0f) {
							SendTo(GetX(), GetY(), owner->GetZ());
							SendPosition();
						}
						
						if(owner->IsClient())
							printf("Pet pos: (%f, %f, %f)\n", GetX(), GetY(), GetZ());
						*/
						
						break;
					}
					case SPO_Sit: 
					{
						SetAppearance(eaSitting, false);
						break;
					}
					case SPO_Guard: 
					{
						//only NPCs can guard stuff. (forced by where the guard movement code is in the AI)
						if(IsNPC()) {
							CastToNPC()->NextGuardPosition();
						}
						break;
					}
				}
			}
			else if (GetFollowID()) 
			{
				Mob* follow = entity_list.GetMob(GetFollowID());
				if (!follow) SetFollowID(0);
				else 
				{
					float dist2 = DistNoRoot(*follow);
					int followdist = GetFollowDistance();

					if (dist2 >= followdist)	// Default follow distance is 100
					{
						float speed = GetWalkspeed();
						if (dist2 >= followdist + 150)
							speed = GetRunspeed();
						CalculateNewPosition2(follow->GetX(), follow->GetY(), follow->GetZ(), speed);
					}
					else
					{
						if(moved)
						{
							SendPosition();
							moved=false;
							SetMoving(false);
						}
					}
					
					/*
					//fix up Z proble mssince CalculateNewPosition2 ignores pure-Z-movement now...
					float zdiff = GetZ() - follow->GetZ();
					if(zdiff < 0)
						zdiff = 0 - zdiff;
					if(zdiff > 2.0f) {
						SendTo(GetX(), GetY(), follow->GetZ());
						SendPosition();
					}
					
					if(follow->IsClient())
						printf("Follow pos: (%f, %f, %f)\n", GetX(), GetY(), GetZ());
					*/
					
				}
			}
			else //not a pet, and not following somebody...
			{
				// dont move till a bit after you last fought
				if (pLastFightingDelayMoving < Timer::GetCurrentTime()) 
				{
					if (this->IsClient()) 
					{
						// LD timer expired, drop out of world
						if (this->CastToClient()->IsLD())
							this->CastToClient()->Disconnect();
						return;
					}
					
					if(IsNPC())
					{
						if(RuleB(NPC, SmartLastFightingDelayMoving) && !feign_memory_list.empty())
						{
							minLastFightingDelayMoving = 0;
							maxLastFightingDelayMoving = 0;
						}
						CastToNPC()->AI_DoMovement();
					}
				}
				
         } 
      } // else if (AImovement_timer->Check()) 
   }
}

void NPC::AI_DoMovement() {
	float walksp = GetMovespeed();
	if(walksp <= 0.0f)
		return;	//this is idle movement at walk speed, and we are unable to walk right now.
	
	if (roambox_distance > 0) {
		_ZP(Mob_AI_Process_roambox);
		if (
			roambox_movingto_x > roambox_max_x
			|| roambox_movingto_x < roambox_min_x
			|| roambox_movingto_y > roambox_max_y
			|| roambox_movingto_y < roambox_min_y
			) 
		{
			float movedist = roambox_distance*roambox_distance;
			float movex = MakeRandomFloat(0, movedist);
			float movey = movedist - movex;
			movex = sqrtf(movex);
			movey = sqrtf(movey);
//cout << "1: MoveDist: " << roambox_distance << " MoveX: " << movex << " MoveY: " << movey << " MaxX: " << roambox_max_x << " MinX: " << roambox_min_x << " MaxY: " << roambox_max_y << " MinY: " << roambox_min_y << endl;
			movex *= rand()%2 ? 1 : -1;
			movey *= rand()%2 ? 1 : -1;
			roambox_movingto_x = GetX() + movex;
			roambox_movingto_y = GetY() + movey;
//printf("Roambox: Moving to: %1.2f, %1.2f  Move: %1.2f, %1.2f\n", roambox_movingto_x, roambox_movingto_y, movex, movey);
//cout << "2: RoamBox: Moving to: " << roambox_movingto_x << ", " << roambox_movingto_y << "  Move: " << movex << ", " << movey << endl;
			if (roambox_movingto_x > roambox_max_x || roambox_movingto_x < roambox_min_x)
				roambox_movingto_x -= movex * 2;
			if (roambox_movingto_y > roambox_max_y || roambox_movingto_y < roambox_min_y)
				roambox_movingto_y -= movey * 2;
//cout << "3: RoamBox: Moving to: " << roambox_movingto_x << ", " << roambox_movingto_y << "  Move: " << movex << ", " << movey << endl;
			if (roambox_movingto_x > roambox_max_x || roambox_movingto_x < roambox_min_x)
				roambox_movingto_x = roambox_max_x;
			if (roambox_movingto_y > roambox_max_y || roambox_movingto_y < roambox_min_y)
				roambox_movingto_y = roambox_max_y;
//cout << "4: RoamBox: Moving to: " << roambox_movingto_x << ", " << roambox_movingto_y << "  Move: " << movex << ", " << movey << endl;
		}
		
		mlog(AI__WAYPOINTS, "Roam Box: d=%.3f (%.3f->%.3f,%.3f->%.3f): Go To (%.3f,%.3f)", 
			roambox_distance, roambox_min_x, roambox_max_x, roambox_min_y, roambox_max_y, roambox_movingto_x, roambox_movingto_y);
		if (!CalculateNewPosition2(roambox_movingto_x, roambox_movingto_y, GetZ(), walksp, true)) 
		{
			roambox_movingto_x = roambox_max_x + 1; // force update
			pLastFightingDelayMoving = Timer::GetCurrentTime() + RandomTimer(roambox_delay, roambox_delay + 5000);
			SetMoving(false);
			SendPosition();	// makes mobs stop clientside
		}
	}
	else if (roamer) 
	{
		_ZP(Mob_AI_Process_roamer);
		if (AIwalking_timer->Check())
		{
			movetimercompleted=true;
			AIwalking_timer->Disable();
		}

		
		sint16 gridno = CastToNPC()->GetGrid(); 

// handle quest command roamers with no grids too
		if (gridno > 0 || cur_wp==-2)  {
			if (movetimercompleted==true) {  // time to pause at wp is over
// MYRA - Added code to depop at end of grid for wander type 4
				if (wandertype == 4 && cur_wp == CastToNPC()->GetMaxWp()) {
		           CastToNPC()->Depop(); 
				} else {
					movetimercompleted=false; 
					
					mlog(QUESTS__PATHING, "We have reached waypoint %d.", cur_wp);

					if(AggroedAwayFromGrid > 0)
						--AggroedAwayFromGrid;
					
					//if we were under quest control (with no grid), we are done now..
					if(cur_wp == -2) {
						mlog(QUESTS__PATHING, "Non-grid quest mob has reached its quest ordered waypoint. Leaving pathing mode.");
						roamer = false;
						cur_wp = 0;
					}
					
					//not sure why we do this...
					SetAppearance(eaStanding, false);
					
					//kick off event_waypoint
					char temp[16]; 
					sprintf(temp, "%d", cur_wp);
					parse->Event(EVENT_WAYPOINT,this->GetNPCTypeID(), temp, CastToNPC(), NULL); 
					
					entity_list.OpenDoorsNear(CastToNPC());
					//setup our next waypoint, if we are still on our normal grid
					//remember that the quest event above could have done anything it wanted with our grid
					if(gridno > 0)
						CastToNPC()->CalculateNewWaypoint();
                } 
            }	// endif (movetimercompleted==true)     
			else if (!(AIwalking_timer->Enabled()))
			{	// currently moving
				if (cur_wp_x == GetX() && cur_wp_y == GetY()) 
				{	// are we there yet? then stop
					mlog(AI__WAYPOINTS, "We have reached waypoint %d (%.3f,%.3f,%.3f) on grid %d", cur_wp, GetX(), GetY(), GetZ(), GetGrid());
					SetWaypointPause();
					SetAppearance(eaStanding, false);
					SetMoving(false);
					SendPosition();
					
					// EverHood - wipe feign memory since we reached our first waypoint
					if(cur_wp == 1)
						ClearFeignMemory();
				} 
				else
				{	// not at waypoint yet, so keep moving
					if(!RuleB(Pathing, AggroReturnToGrid) || !zone->pathing || (AggroedAwayFromGrid == 0))
						CalculateNewPosition2(cur_wp_x, cur_wp_y, cur_wp_z, walksp, true); 
					else
					{
						bool WaypointChanged;
						bool NodeReached;
						VERTEX Goal = UpdatePath(cur_wp_x, cur_wp_y, cur_wp_z, walksp, WaypointChanged, NodeReached);
						if(WaypointChanged)
							tar_ndx = 20;

						if(NodeReached)
							entity_list.OpenDoorsNear(CastToNPC()); 

						CalculateNewPosition2(Goal.x, Goal.y, Goal.z, walksp, true);
					}

				}
			} 
		}		// endif (gridno > 0) 
// handle new quest grid command processing
		else if (gridno < 0) 
		{	// this mob is under quest control
			if (movetimercompleted==true)    
			{ // time to pause has ended
				SetGrid( 0 - GetGrid()); // revert to AI control
				mlog(QUESTS__PATHING, "Quest pathing is finished. Resuming on grid %d", GetGrid());
				SetAppearance(eaStanding, false); 
				CalculateNewWaypoint();
			}
		}

  } 
  else if (IsGuarding()) 
  {
	_ZP(Mob_AI_Process_guard);

	bool CP2Moved;
	if(!RuleB(Pathing, Guard) || !zone->pathing)
		CP2Moved = CalculateNewPosition2(guard_x, guard_y, guard_z, walksp);
	else
	{
		if(!((x_pos == guard_x) && (y_pos == guard_y) && (z_pos == guard_z)))
		{
			bool WaypointChanged, NodeReached;
			VERTEX Goal = UpdatePath(guard_x, guard_y, guard_z, walksp, WaypointChanged, NodeReached);
			if(WaypointChanged)
				tar_ndx = 20;

			if(NodeReached)
				entity_list.OpenDoorsNear(CastToNPC()); 

			CP2Moved = CalculateNewPosition2(Goal.x, Goal.y, Goal.z, walksp);
		}
		else
			CP2Moved = false;

	}
	if (!CP2Moved)
	{
		if(moved) {
			mlog(AI__WAYPOINTS, "Reached guard point (%.3f,%.3f,%.3f)", guard_x, guard_y, guard_z);
			ClearFeignMemory();
			moved=false;
			SetMoving(false);
			if (GetTarget() == NULL || DistNoRoot(*GetTarget()) >= 5*5 )
			{
				SetHeading(guard_heading); 
			} else { 
				FaceTarget(GetTarget()); 
			}
			SendPosition();			
		}
	 } 
  } 
}

// Note: Mob that caused this may not get added to the hate list until after this function call completes
void Mob::AI_Event_Engaged(Mob* attacker, bool iYellForHelp) {
	if (!IsAIControlled())
		return;
	if (iYellForHelp) {
		if(IsPet()) {
			GetOwner()->AI_Event_Engaged(attacker, iYellForHelp);
		} else {
			entity_list.AIYellForHelp(this, attacker);
		}
	}

	if(IsNPC())
	{
		if(attacker && !attacker->IsCorpse())
		{
			//Because sometimes the AIYellForHelp triggers another engaged and then immediately a not engaged
			//if the target dies before it goes off
			if(attacker->GetHP() > 0)
			{
				if(!CastToNPC()->GetCombatEvent() && GetHP() > 0)
				{
					parse->Event(EVENT_COMBAT, CastToNPC()->GetNPCTypeID(), "1", CastToNPC(), GetTarget());
					CastToNPC()->SetCombatEvent(true);
				}
			}
		}
	}
}

// Note: Hate list may not be actually clear until after this function call completes
void Mob::AI_Event_NoLongerEngaged() {
	if (!IsAIControlled())
		return;
	this->AIwalking_timer->Start(RandomTimer(3000,20000));
	pLastFightingDelayMoving = Timer::GetCurrentTime();
	if (minLastFightingDelayMoving == maxLastFightingDelayMoving)
		pLastFightingDelayMoving += minLastFightingDelayMoving;
	else
		pLastFightingDelayMoving += (rand() % (maxLastFightingDelayMoving-minLastFightingDelayMoving)) + minLastFightingDelayMoving;
	// EverHood - So mobs don't keep running as a ghost until AIwalking_timer fires
	// if they were moving prior to losing all hate
	if(IsMoving()){
		SetRunAnimSpeed(0);
		SetMoving(false);
		SendPosition();
	}
	ClearRampage();

	if(IsNPC())
	{
		if(CastToNPC()->GetCombatEvent() && GetHP() > 0)
		{
			parse->Event(EVENT_COMBAT, CastToNPC()->GetNPCTypeID(), "0", CastToNPC(), NULL);
			CastToNPC()->SetCombatEvent(false);
		}

		if(CastToNPC()->GetGrid() > 0)
		{
			AggroedAwayFromGrid = 2;
		}
	}
}

//this gets called from InterruptSpell() for failure or SpellFinished() for success
void NPC::AI_Event_SpellCastFinished(bool iCastSucceeded, int8 slot) {
	if (slot == 1) {
		int32 recovery_time = 0;
		if (iCastSucceeded) {
			if (casting_spell_AIindex < AIspells.size()) {
					recovery_time += spells[AIspells[casting_spell_AIindex].spellid].recovery_time;
					if (AIspells[casting_spell_AIindex].recast_delay >= 0)
					{
						if (AIspells[casting_spell_AIindex].recast_delay < 10000)
							AIspells[casting_spell_AIindex].time_cancast = Timer::GetCurrentTime() + (AIspells[casting_spell_AIindex].recast_delay*1000);
					}
					else
						AIspells[casting_spell_AIindex].time_cancast = Timer::GetCurrentTime() + spells[AIspells[casting_spell_AIindex].spellid].recast_time;
			}
			if (recovery_time < AIautocastspell_timer->GetSetAtTrigger())
				recovery_time = AIautocastspell_timer->GetSetAtTrigger();
			AIautocastspell_timer->Start(recovery_time, false);
		}
		else
			AIautocastspell_timer->Start(800, false);
		casting_spell_AIindex = AIspells.size();
	}
}


bool NPC::AI_EngagedCastCheck() {
	if (AIautocastspell_timer->Check(false)) {
		_ZP(Mob_AI_Process_engaged_cast);
		AIautocastspell_timer->Disable();	//prevent the timer from going off AGAIN while we are casting.
		
		mlog(AI__SPELLS, "Engaged autocast check triggered. Trying to cast healing spells then maybe offensive spells.");
		
		// try casting a heal or gate
		if (!AICastSpell(this, 100, SpellType_Heal | SpellType_Escape | SpellType_InCombatBuff)) {
			// try casting a heal on nearby
			if (!entity_list.AICheckCloseBeneficialSpells(this, 25, MobAISpellRange, SpellType_Heal)) {
				//nobody to heal, try some detrimental spells.
				if(!AICastSpell(GetTarget(), 20, SpellType_Nuke | SpellType_Lifetap | SpellType_DOT | SpellType_Dispel | SpellType_Mez)) {
					//no spell to cast, try again soon.
					AIautocastspell_timer->Start(RandomTimer(500, 1000), false);
				}
			} //else, spell casting finishing will reset the timer.
		}
		return(true);
	}
	
	return(false);
}

bool NPC::AI_PursueCastCheck() {
	if (AIautocastspell_timer->Check(false)) {
		_ZP(Mob_AI_Process_pursue_cast);
		AIautocastspell_timer->Disable();	//prevent the timer from going off AGAIN while we are casting.
		
		mlog(AI__SPELLS, "Engaged (pursuing) autocast check triggered. Trying to cast offensive spells.");
		if(!AICastSpell(GetTarget(), 90, SpellType_Root | SpellType_Nuke | SpellType_Lifetap | SpellType_Snare | SpellType_DOT | SpellType_Dispel | SpellType_Mez)) {
			//no spell cast, try again soon.
			AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
		} //else, spell casting finishing will reset the timer.
		return(true);
	}
	return(false);
}

bool NPC::AI_IdleCastCheck() {
	if (AIautocastspell_timer->Check(false)) {
		_ZP(Mob_AI_Process_autocast);
#if MobAI_DEBUG_Spells >= 25
		cout << "Non-Engaged autocast check triggered: " << this->GetName() << endl;
#endif
		AIautocastspell_timer->Disable();	//prevent the timer from going off AGAIN while we are casting.
		if (!AICastSpell(this, 100, SpellType_Heal | SpellType_Buff | SpellType_Pet)) {
			if(!entity_list.AICheckCloseBeneficialSpells(this, 33, MobAISpellRange, SpellType_Heal | SpellType_Buff)) {
				//if we didnt cast any spells, our autocast timer just resets to the 
				//last duration it was set to... try to put up a more reasonable timer...
				AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
			}	//else, spell casting finishing will reset the timer.
		}	//else, spell casting finishing will reset the timer.
		return(true);
	}
	return(false);
}

void Mob::StartEnrage()
{
    // dont continue if already enraged
    if (bEnraged)
        return;
    if (SpecAttackTimers[SPECATK_ENRAGE] && !SpecAttackTimers[SPECATK_ENRAGE]->Check())
        return;
    // see if NPC has possibility to enrage
    if (!SpecAttacks[SPECATK_ENRAGE])
        return;
    // check if timer exists (should be true at all times)
    if (SpecAttackTimers[SPECATK_ENRAGE])
    {
		safe_delete(SpecAttackTimers[SPECATK_ENRAGE]);
        SpecAttackTimers[SPECATK_ENRAGE] = NULL;
    }

    if (!SpecAttackTimers[SPECATK_ENRAGE])
    {
        SpecAttackTimers[SPECATK_ENRAGE] = new Timer(EnragedDurationTimer);
    }
    // start the timer. need to call IsEnraged frequently since we dont have callback timers :-/
    SpecAttackTimers[SPECATK_ENRAGE]->Start();
    bEnraged = true;
	entity_list.MessageClose(this, true, 200, 13, "%s has become ENRAGED.", GetCleanName());
}

void Mob::ProcessEnrage(){
	if(IsEnraged()){
		if(SpecAttackTimers[SPECATK_ENRAGE] && SpecAttackTimers[SPECATK_ENRAGE]->Check()){
			entity_list.MessageClose(this, true, 200, 13, "%s is no longer enraged.", GetCleanName());
			SpecAttackTimers[SPECATK_ENRAGE]->Start(EnragedTimer);
			bEnraged = false;
		}
	}
}

bool Mob::IsEnraged() 
{
    return bEnraged;
}

bool Mob::Flurry()
{
    // attack the most hated target, regardless of range or whatever
    Mob *target = GetHateTop();
	if (target) {
		entity_list.MessageClose(this, true, 200, 13, "%s executes a FLURRY of attacks on %s!", GetCleanName(), target->GetCleanName());
		for (int i = 0; i < RuleI(Combat, MaxFlurryHits); i++)
			Attack(target);
	}
    return true;
}

bool Mob::AddRampage(Mob *mob)
{
	if(!mob)
		return false;

    if (!SpecAttacks[SPECATK_RAMPAGE])
        return false;

    for (unsigned int i = 0; i < RampageArray.size(); i++)
    {
        // if name is already on the list dont add it again
        if (strcasecmp(mob->GetName(), RampageArray[i].c_str()) == 0)
            return false;
	}
	std::string r_name = mob->GetName();
	RampageArray.push_back(r_name);
    return true;
}

void Mob::ClearRampage(){
	RampageArray.clear();
}

bool Mob::Rampage()
{
	int index_hit = 0;
	entity_list.MessageClose(this, true, 200, 13, "%s goes on a RAMPAGE!", GetCleanName());
    for (unsigned int i = 0; i < RampageArray.size(); i++)
    {
		if(index_hit >= RuleI(Combat, MaxRampageTargets))
			break;	
        // range is important
		Mob *m_target = entity_list.GetMob(RampageArray[i].c_str());
        if(m_target)
        {
			if(m_target == GetTarget())
				continue;
            if (CombatRange(m_target))
			{
                Attack(m_target);
				index_hit++;
			}
        }
    }
	if(index_hit < RuleI(Combat, MaxRampageTargets))
		Attack(GetTarget());
    return true;
}

void Mob::AreaRampage()
{
	int index_hit = 0;
	entity_list.MessageClose(this, true, 200, 13, "%s goes on a RAMPAGE!", GetCleanName());
	index_hit = hate_list.AreaRampage(this, GetTarget());

	if(index_hit == 0)
		Attack(GetTarget());
}

int32 Mob::GetLevelCon(int8 mylevel, int8 iOtherLevel) {
    sint16 diff = iOtherLevel - mylevel;
	int32 conlevel=0;
	
    if (diff == 0)
        return CON_WHITE;
    else if (diff >= 1 && diff <= 2)
        return CON_YELLOW;
    else if (diff >= 3)
        return CON_RED;

    if (mylevel <= 8)
    {
        if (diff <= -4)
            conlevel = CON_GREEN;
        else
            conlevel = CON_BLUE;
    }
    else if (mylevel <= 9)
	{
        if (diff <= -6)
            conlevel = CON_GREEN;
        else if (diff <= -4)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
    else if (mylevel <= 13)
	{
        if (diff <= -7)
            conlevel = CON_GREEN;
        else if (diff <= -5)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	else if (mylevel <= 15)
	{
        if (diff <= -7)
            conlevel = CON_GREEN;
        else if (diff <= -5)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	else if (mylevel <= 17)
	{
        if (diff <= -8)
            conlevel = CON_GREEN;
        else if (diff <= -6)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	else if (mylevel <= 21)
	{
        if (diff <= -9)
            conlevel = CON_GREEN;
        else if (diff <= -7)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	else if (mylevel <= 25)
	{
        if (diff <= -10)
            conlevel = CON_GREEN;
        else if (diff <= -8)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	else if (mylevel <= 29)
	{
        if (diff <= -11)
            conlevel = CON_GREEN;
        else if (diff <= -9)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	else if (mylevel <= 31)
	{
        if (diff <= -12)
            conlevel = CON_GREEN;
        else if (diff <= -9)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	else if (mylevel <= 33)
	{
        if (diff <= -13)
            conlevel = CON_GREEN;
        else if (diff <= -10)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	else if (mylevel <= 37)
	{
        if (diff <= -14)
            conlevel = CON_GREEN;
        else if (diff <= -11)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	else if (mylevel <= 41)
	{
        if (diff <= -16)
            conlevel = CON_GREEN;
        else if (diff <= -12)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	else if (mylevel <= 45)
	{
        if (diff <= -17)
            conlevel = CON_GREEN;
        else if (diff <= -13)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	else if (mylevel <= 49)
	{
        if (diff <= -18)
            conlevel = CON_GREEN;
        else if (diff <= -14)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	else if (mylevel <= 53)
	{
        if (diff <= -19)
            conlevel = CON_GREEN;
        else if (diff <= -15)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	else if (mylevel <= 55)
	{
        if (diff <= -20)
            conlevel = CON_GREEN;
        else if (diff <= -15)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	else
	{
        if (diff <= -21)
            conlevel = CON_GREEN;
        else if (diff <= -16)
            conlevel = CON_LIGHTBLUE;
        else
            conlevel = CON_BLUE;
	}
	return conlevel;
}

void NPC::CheckSignal() {
	if (signaled) {
		char buf[32];
		snprintf(buf, 31, "%d", signal_id);
		buf[31] = '\0';
		parse->Event(EVENT_SIGNAL, GetNPCTypeID(), buf, this, NULL);
		signaled=false;
	}
}



/*
alter table npc_types drop column usedspells;
alter table npc_types add column npc_spells_id int(11) unsigned not null default 0 after merchant_id;
Create Table npc_spells (
	id int(11) unsigned not null auto_increment primary key,
	name tinytext,
	parent_list int(11) unsigned not null default 0,
	attack_proc smallint(5) not null default -1,
	proc_chance tinyint(3) not null default 3
	);
create table npc_spells_entries (
	id int(11) unsigned not null auto_increment primary key,
	npc_spells_id int(11) not null,
	spellid smallint(5) not null default 0,
	type smallint(5) unsigned not null default 0,
	minlevel tinyint(3) unsigned not null default 0,
	maxlevel tinyint(3) unsigned not null default 255,
	manacost smallint(5) not null default '-1',
	recast_delay int(11) not null default '-1',
	priority smallint(5) not null default 0,
	index npc_spells_id (npc_spells_id)
	);
*/ 

bool IsSpellInList(DBnpcspells_Struct* spell_list, sint16 iSpellID);
bool Compare_AI_Spells(AISpells_Struct i, AISpells_Struct j);

bool NPC::AI_AddNPCSpells(int32 iDBSpellsID) {
	// ok, this function should load the list, and the parent list then shove them into the struct and sort
	npc_spells_id = iDBSpellsID;
	AIspells.clear();
	if (iDBSpellsID == 0) {
		AIautocastspell_timer->Disable();
		return false;
	}
	DBnpcspells_Struct* spell_list = database.GetNPCSpells(iDBSpellsID);
	if (!spell_list) {
		AIautocastspell_timer->Disable();
		return false;
	}
	DBnpcspells_Struct* parentlist = database.GetNPCSpells(spell_list->parent_list);
	uint32 i;
#if MobAI_DEBUG_Spells >= 10
	cout << "Loading NPCSpells onto " << this->GetName() << ": dbspellsid=" << iDBSpellsID;
	if (spell_list) {
		cout << " (found, " << spell_list->numentries << "), parentlist=" << spell_list->parent_list;
		if (spell_list->parent_list) {
			if (parentlist) {
				cout << " (found, " << parentlist->numentries << ")";
			}
			else
				cout << " (not found)";
		}
	}
	else
		cout << " (not found)";
	cout << endl;
#endif
	sint16 attack_proc_spell = -1;
	sint8 proc_chance = 3;
	if (parentlist) {
		attack_proc_spell = parentlist->attack_proc;
		proc_chance = parentlist->proc_chance;
		for (i=0; i<parentlist->numentries; i++) {
			if (GetLevel() >= parentlist->entries[i].minlevel && GetLevel() <= parentlist->entries[i].maxlevel && parentlist->entries[i].spellid > 0) {
				if (!IsSpellInList(spell_list, parentlist->entries[i].spellid))
				{
					AddSpellToNPCList(parentlist->entries[i].priority, parentlist->entries[i].spellid, parentlist->entries[i].type, parentlist->entries[i].manacost, parentlist->entries[i].recast_delay);
				}
			}
		}
	}
	if (spell_list->attack_proc >= 0) {
		attack_proc_spell = spell_list->attack_proc;
		proc_chance = spell_list->proc_chance;
	}
	for (i=0; i<spell_list->numentries; i++) {
		if (GetLevel() >= spell_list->entries[i].minlevel && GetLevel() <= spell_list->entries[i].maxlevel && spell_list->entries[i].spellid > 0) {
			AddSpellToNPCList(spell_list->entries[i].priority, spell_list->entries[i].spellid, spell_list->entries[i].type, spell_list->entries[i].manacost, spell_list->entries[i].recast_delay);
		}
	}
	std::sort(AIspells.begin(), AIspells.end(), Compare_AI_Spells);
	
	if (attack_proc_spell > 0)
		AddProcToWeapon(attack_proc_spell, true, proc_chance);

	if (AIspells.size() == 0)
		AIautocastspell_timer->Disable();
	else
		AIautocastspell_timer->Trigger();
	return true;
}

bool IsSpellInList(DBnpcspells_Struct* spell_list, sint16 iSpellID) {
	for (uint32 i=0; i < spell_list->numentries; i++) {
		if (spell_list->entries[i].spellid == iSpellID)
			return true;
	}
	return false;
}

bool Compare_AI_Spells(AISpells_Struct i, AISpells_Struct j) 
{ 
	return(i.priority > j.priority); 
}

// adds a spell to the list, taking into account priority and resorting list as needed.
void NPC::AddSpellToNPCList(sint16 iPriority, sint16 iSpellID, uint16 iType, sint16 iManaCost, sint32 iRecastDelay) {
	
	if(!IsValidSpell(iSpellID))
		return;

	HasAISpell = true;
	AISpells_Struct t;
	
	t.priority = iPriority;
	t.spellid = iSpellID;
	t.type = iType;
	t.manacost = iManaCost;
	t.recast_delay = iRecastDelay;
	t.time_cancast = 0;

	AIspells.push_back(t);
}


DBnpcspells_Struct* ZoneDatabase::GetNPCSpells(int32 iDBSpellsID) {
	if (iDBSpellsID == 0)
		return 0;
	if (!npc_spells_cache) {
		npc_spells_maxid = GetMaxNPCSpellsID();
		npc_spells_cache = new DBnpcspells_Struct*[npc_spells_maxid+1];
		npc_spells_loadtried = new bool[npc_spells_maxid+1];
		for (uint32 i=0; i<=npc_spells_maxid; i++) {
			npc_spells_cache[i] = 0;
			npc_spells_loadtried[i] = false;
		}
	}
	if (iDBSpellsID > npc_spells_maxid)
		return 0;
	if (npc_spells_cache[iDBSpellsID]) { // it's in the cache, easy =)
		return npc_spells_cache[iDBSpellsID];
	}
	else if (!npc_spells_loadtried[iDBSpellsID]) { // no reason to ask the DB again if we have failed once already
		npc_spells_loadtried[iDBSpellsID] = true;
		char errbuf[MYSQL_ERRMSG_SIZE];
		char *query = 0;
		MYSQL_RES *result;
		MYSQL_ROW row;
		
		if (RunQuery(query, MakeAnyLenString(&query, "SELECT id, parent_list, attack_proc, proc_chance from npc_spells where id=%d", iDBSpellsID), errbuf, &result)) {
			safe_delete_array(query);
			if (mysql_num_rows(result) == 1) {
				row = mysql_fetch_row(result);
				int32 tmpparent_list = atoi(row[1]);
				sint16 tmpattack_proc = atoi(row[2]);
				int8 tmpproc_chance = atoi(row[3]);
				mysql_free_result(result);
				if (RunQuery(query, MakeAnyLenString(&query, "SELECT spellid, type, minlevel, maxlevel, manacost, recast_delay, priority from npc_spells_entries where npc_spells_id=%d ORDER BY minlevel", iDBSpellsID), errbuf, &result)) {
					safe_delete_array(query);
					int32 tmpSize = sizeof(DBnpcspells_Struct) + (sizeof(DBnpcspells_entries_Struct) * mysql_num_rows(result));
					npc_spells_cache[iDBSpellsID] = (DBnpcspells_Struct*) new uchar[tmpSize];
					memset(npc_spells_cache[iDBSpellsID], 0, tmpSize);
					npc_spells_cache[iDBSpellsID]->parent_list = tmpparent_list;
					npc_spells_cache[iDBSpellsID]->attack_proc = tmpattack_proc;
					npc_spells_cache[iDBSpellsID]->proc_chance = tmpproc_chance;
					npc_spells_cache[iDBSpellsID]->numentries = mysql_num_rows(result);
					int j = 0;
					while ((row = mysql_fetch_row(result))) {
						npc_spells_cache[iDBSpellsID]->entries[j].spellid = atoi(row[0]);
						npc_spells_cache[iDBSpellsID]->entries[j].type = atoi(row[1]);
						npc_spells_cache[iDBSpellsID]->entries[j].minlevel = atoi(row[2]);
						npc_spells_cache[iDBSpellsID]->entries[j].maxlevel = atoi(row[3]);
						npc_spells_cache[iDBSpellsID]->entries[j].manacost = atoi(row[4]);
						npc_spells_cache[iDBSpellsID]->entries[j].recast_delay = atoi(row[5]);
						npc_spells_cache[iDBSpellsID]->entries[j].priority = atoi(row[6]);
						j++;
					}
					mysql_free_result(result);
					return npc_spells_cache[iDBSpellsID];
				}
				else {
					cerr << "Error in AddNPCSpells query1 '" << query << "' " << errbuf << endl;
					safe_delete_array(query);
					return 0;
				}
			}
			else {
				mysql_free_result(result);
			}
		}
		else {
			cerr << "Error in AddNPCSpells query1 '" << query << "' " << errbuf << endl;
			safe_delete_array(query);
			return 0;
		}
		
		return 0;	
	}
	return 0;
}

int32 ZoneDatabase::GetMaxNPCSpellsID() {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT max(id) from npc_spells"), errbuf, &result)) {
		safe_delete_array(query);
		if (mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			int32 ret = 0;
			if (row[0])
				ret = atoi(row[0]);
			mysql_free_result(result);
			return ret;
		}
		mysql_free_result(result);
	}
	else {
		cerr << "Error in GetMaxNPCSpellsID query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return 0;
	}
	
	return 0;	
}

