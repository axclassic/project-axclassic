/*  EQEMu:  Everquest Server Emulator
Copyright (C) 2001-2004  EQEMu Development Team (http://eqemulator.net)

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

// Test 1

#include "../common/debug.h"
#include "AA.h"
#include "mob.h"
#include "client.h"
#include "groups.h"
#include "raids.h"
#include "spdat.h"
#include "object.h"
#include "doors.h"
#include "beacon.h"
#include "PlayerCorpse.h"
#include "titles.h"
#include "../common/races.h"
#include "../common/classes.h"
#include "../common/eq_packet_structs.h"
#include "../common/packet_dump.h"
#include "../common/MiscFunctions.h"
#include "../common/logsys.h"
#include "zonedb.h"
#include "StringIDs.h"
#if !defined(NEW_LoadSPDat) && !defined(DB_LoadSPDat)
	extern SPDat_Spell_Struct spells[SPDAT_RECORDS];
#endif

//static data arrays, really not big enough to warrant shared mem.
AA_DBAction AA_Actions[aaHighestID][MAX_AA_ACTION_RANKS];	//[aaid][rank]
map<int32,SendAA_Struct*>aas_send;
std::map<uint32, std::map<uint32, AA_Ability> > aa_effects;	//stores the effects from the aa_effects table in memory
std::map<uint32, AALevelCost_Struct> AARequiredLevelAndCost;

/*

Schema:

spell_id is spell to cast, SPELL_UNKNOWN == no spell
nonspell_action is action to preform on activation which is not a spell, 0=none
nonspell_mana is mana that the nonspell action consumes
nonspell_duration is a duration which may be used by the nonspell action
redux_aa is the aa which reduces the reuse timer of the skill
redux_rate is the multiplier of redux_aa, as a percentage of total rate (10 == 10% faster)

CREATE TABLE aa_actions (
	aaid mediumint unsigned not null,
	rank tinyint unsigned not null,
	reuse_time mediumint unsigned not null,
	spell_id mediumint unsigned not null,
	target tinyint unsigned not null,
	nonspell_action tinyint unsigned not null,
	nonspell_mana mediumint unsigned not null,
	nonspell_duration mediumint unsigned not null,
	redux_aa mediumint unsigned not null,
	redux_rate tinyint not null,
	
	PRIMARY KEY(aaid, rank)
);

CREATE TABLE aa_swarmpets (
	spell_id mediumint unsigned not null,
	count tinyint unsigned not null,
	npc_id int not null,
	duration mediumint unsigned not null,
	PRIMARY KEY(spell_id)
);
*/

/*

Credits for this function:
	-FatherNitwit: Structure and mechanism
	-Wiz: Initial set of AAs, original function contents
	-Branks: Much updated info and a bunch of higher-numbered AAs

*/
int Client::GetAATimerID(aaID activate)
{
	SendAA_Struct* aa2 = zone->FindAA(activate);

	if(!aa2)
	{
		for(int i = 1;i < 5; ++i)
		{
			int a = activate - i;

			if(a <= 0)
				break;

			aa2 = zone->FindAA(a);

			if(aa2 != NULL)
				break;
		}
	}

	if(aa2)
		return aa2->spell_type;

	return 0;
}

int Client::CalcAAReuseTimer(const AA_DBAction *caa) {

	if(!caa)
		return 0;

	int ReuseTime = caa->reuse_time;

	if(ReuseTime > 0)
	{
		int ReductionPercentage;

		if(caa->redux_aa > 0 && caa->redux_aa < aaHighestID)
		{
			ReductionPercentage = GetAA(caa->redux_aa) * caa->redux_rate;

			if(caa->redux_aa2 > 0 && caa->redux_aa2 < aaHighestID)
				ReductionPercentage += (GetAA(caa->redux_aa2) * caa->redux_rate2);

			ReuseTime = caa->reuse_time * (100 - ReductionPercentage) / 100;
		}
		
	}
	return ReuseTime;
}

void Client::ActivateAA(aaID activate){
	if(activate < 0 || activate >= aaHighestID)
		return;
	if(IsStunned() || IsFeared() || IsMezzed() || IsSilenced() || IsPet() || IsSitting() || GetFeigned())
		return;

	int AATimerID = GetAATimerID(activate);

	SendAA_Struct* aa2 = NULL;
	aaID aaid = activate;
	uint8 activate_val = GetAA(activate);
	//this wasn't taking into acct multi tiered act talents before...
	if(activate_val == 0){
		aa2 = zone->FindAA(activate);
		if(!aa2){
			int i;
			int a;
			for(i=1;i<5;i++){
				a = activate - i;
				if(a <= 0)
					break;

				aa2 = zone->FindAA(a);
				if(aa2 != NULL)
					break;
			}
		}
		if(aa2){
			aaid = (aaID) aa2->id;
			activate_val = GetAA(aa2->id);
		}
	}

	if (activate_val == 0){
		return;
	}
	
	if(!p_timers.Expired(&database, AATimerID + pTimerAAStart)) {
		const char* aaname = aas_send[activate_val]->name;
		uint32 aaremain = p_timers.GetRemainingTime(AATimerID + pTimerAAStart);
		uint32 aaremain_hr = aaremain / (60 * 60);
		uint32 aaremain_min = (aaremain / 60) % 60;
		uint32 aaremain_sec = aaremain % 60;
		if (aaremain_hr >= 1)	//1 hour or more
			Message_StringID(13, AA_REUSE_MSG, aaname, itoa(aaremain_hr), itoa(aaremain_min), itoa(aaremain_sec));	//You can use the ability %B1(1) again in %2 hour(s) %3 minute(s) %4 seconds.
		else	//less than an hour
			Message_StringID(13, AA_REUSE_MSG2, aaname, itoa(aaremain_min), itoa(aaremain_sec));	//You can use the ability %B1(1) again in %2 minute(s) %3 seconds.
		return;
	}
	
	if(activate_val > MAX_AA_ACTION_RANKS)
		activate_val = MAX_AA_ACTION_RANKS;
	activate_val--;		//to get array index.
	
	//get our current node, now that the indices are well bounded
	const AA_DBAction *caa = &AA_Actions[aaid][activate_val];

	if((aaid == aaImprovedHarmTouch || aaid == aaLeechTouch) && !p_timers.Expired(&database, pTimerHarmTouch)){
		Message(13,"Ability recovery time not yet met.");
		return;
	}
	
	//everything should be configured out now
	
	int16 target_id = 0;
	
	//figure out our target
	switch(caa->target) {
		case aaTargetUser:
			target_id = GetID();
			break;
		case aaTargetCurrent:
			if(GetTarget() == NULL) {
				Message_StringID(0, AA_NO_TARGET);	//You must first select a target for this ability!
				return;
			}
			target_id = GetTarget()->GetID();
			break;
		case aaTargetGroup:
			target_id = GetID();
			break;
		case aaTargetCurrentGroup:
			if(GetTarget() == NULL) {
				Message_StringID(0, AA_NO_TARGET);	//You must first select a target for this ability!
				return;
			}
			target_id = GetTarget()->GetID();
			break;
		case aaTargetPet:
			if(GetPet() == NULL) {
				Message(0, "A pet is required for this skill.");
				return;
			}
			target_id = GetPetID();
			break;
	}
	
	//handle non-spell action
	if(caa->action != aaActionNone) {
		if(caa->mana_cost > 0) {
			if(GetMana() < caa->mana_cost) {
				Message(0, "Not enough mana to use this skill.");
				return;
			}
			SetMana(GetMana() - caa->mana_cost);
		}
		HandleAAAction(aaid);
		if(caa->reuse_time > 0)
		{
			int32 timer_base = CalcAAReuseTimer(caa);
			if(activate == aaImprovedHarmTouch || activate == aaLeechTouch)
			{
				p_timers.Start(pTimerHarmTouch, HarmTouchReuseTime);
			}
			p_timers.Start(AATimerID + pTimerAAStart, timer_base);
			time_t timestamp = time(NULL);
			SendAATimer(AATimerID, timestamp, timestamp);
		}
	}
	
	//cast the spell, if we have one
	if(caa->spell_id > 0 && caa->spell_id < SPDAT_RECORDS) {
		if(caa->reuse_time > 0)
		{
			int32 timer_base = CalcAAReuseTimer(caa);
			if(activate == aaImprovedHarmTouch || activate == aaLeechTouch)
			{
				p_timers.Start(pTimerHarmTouch, HarmTouchReuseTime);
			}
			
			if(!CastSpell(caa->spell_id, target_id, 10, -1, -1, 0, -1, AATimerID + pTimerAAStart, timer_base, 1))
					return;
		}
		else
		{
			if(!CastSpell(caa->spell_id, target_id))
				return;
		}
	}
}

void Client::HandleAAAction(aaID activate) {
	if(activate < 0 || activate >= aaHighestID)
		return;
	
	uint8 activate_val = GetAA(activate);
	
	if (activate_val == 0)
		return;
	
	if(activate_val > MAX_AA_ACTION_RANKS)
		activate_val = MAX_AA_ACTION_RANKS;
	activate_val--;		//to get array index.
	
	//get our current node, now that the indices are well bounded
	const AA_DBAction *caa = &AA_Actions[activate][activate_val];
	
	uint16 timer_id = 0;
	uint16 timer_duration = caa->duration;
	aaTargetType target = aaTargetUser;
	
	int16 spell_id = SPELL_UNKNOWN;	//gets cast at the end if not still unknown
	
	switch(caa->action) {
		case aaActionAETaunt:
			entity_list.AETaunt(this);
			break;
			
		case aaActionMassBuff:
			EnableAAEffect(aaEffectMassGroupBuff, 3600); 
			Message_StringID(10, MGB_STRING);	//The next group buff you cast will hit all targets in range.
			break;
		
		case aaActionFlamingArrows:
			//toggle it
			if(CheckAAEffect(aaEffectFlamingArrows))
				EnableAAEffect(aaEffectFlamingArrows);
			else
				DisableAAEffect(aaEffectFlamingArrows);
			break;
		
		case aaActionFrostArrows:
			if(CheckAAEffect(aaEffectFrostArrows))
				EnableAAEffect(aaEffectFrostArrows);
			else
				DisableAAEffect(aaEffectFrostArrows);
			break;
		
		case aaActionRampage: 
			EnableAAEffect(aaEffectRampage, 10);
			break;
		
		case aaActionSharedHealth:
			if(CheckAAEffect(aaEffectSharedHealth))
				EnableAAEffect(aaEffectSharedHealth);
			else
				DisableAAEffect(aaEffectSharedHealth);
			break;
		
		case aaActionCelestialRegen: {
			//special because spell_id depends on a different AA
			switch (GetAA(aaCelestialRenewal)) {
				case 1:
					spell_id = 3250;
					break;
				case 2:
					spell_id = 3251;
					break;
				default:
					spell_id = 2740;
					break;
			}
			target = aaTargetCurrent;
			break;
		}
		
		case aaActionDireCharm: {
			//special because spell_id depends on class
			switch (GetClass())
			{
				case DRUID:
					spell_id = 2760; 	//2644?
					break;
				case NECROMANCER:
					spell_id = 2759;	//2643?
					break;
				case ENCHANTER:
					spell_id = 2761;	//2642?
					break;
			}
			target = aaTargetCurrent;
			break;
		}
		
		case aaActionImprovedFamiliar: {
			//Spell IDs might be wrong...
			if (GetAA(aaAllegiantFamiliar))
				spell_id = 3264;	//1994?
			else
				spell_id = 2758;	//2155?
			break;
		}
		
		case aaActionActOfValor:
			if(GetTarget() != NULL) {
				int curhp = GetTarget()->GetHP();
				target = aaTargetCurrent;
				GetTarget()->HealDamage(curhp, this);
				Death(this,0,SPELL_UNKNOWN,HAND_TO_HAND);
			}
			break;
		
		case aaActionSuspendedMinion:
			if (GetPet()) {
				target = aaTargetPet;
				switch (GetAA(aaSuspendedMinion)) {
					case 1:
						spell_id = 3248;
						break;
					case 2:
						spell_id = 3249;
						break;
				}
				//do we really need to cast a spell?
				
				Message(0,"You call your pet to your side.");
				GetPet()->WipeHateList();
				GetPet()->GMMove(GetX(),GetY(),GetZ());
				if (activate_val > 1)
					entity_list.ClearFeignAggro(GetPet());
			} else {
				Message(0,"You have no pet to call.");
			}
			break;

           // seveian 2008-09-23
		case aaActionProjectIllusion:
			EnableAAEffect(aaEffectProjectIllusion, 3600);
			Message(10, "The power of your next illusion spell will flow to your grouped target in your place.");
			break;
            
		
		case aaActionEscape:
			Escape();
			break;
			
		case aaBeastialAlignment:
			switch(GetBaseRace()) {
				case BARBARIAN:
					spell_id = AA_Choose3(activate_val, 4521, 4522, 4523);
					break;
				case TROLL:
					spell_id = AA_Choose3(activate_val, 4524, 4525, 4526);
					break;
				case OGRE:
					spell_id = AA_Choose3(activate_val, 4527, 4527, 4529);
					break;
				case IKSAR:
					spell_id = AA_Choose3(activate_val, 4530, 4531, 4532);
					break;
				case VAHSHIR:
					spell_id = AA_Choose3(activate_val, 4533, 4534, 4535);
					break;
			}
			
		case aaActionLeechTouch:
			target = aaTargetCurrent;
			spell_id = SPELL_HARM_TOUCH2;
			EnableAAEffect(aaEffectLeechTouch, 1000);
			break;

		default:
			LogFile->write(EQEMuLog::Error, "Unknown AA nonspell action type %d", caa->action);
			return;
	}
	
	
	int16 target_id = 0;
	
	//figure out our target
	switch(target) {
		case aaTargetUser:
			target_id = GetID();
			break;
		case aaTargetCurrent:
			if(GetTarget() == NULL) {
				Message_StringID(0, AA_NO_TARGET);	//You must first select a target for this ability!
				return;
			}
			target_id = GetTarget()->GetID();
			break;
		case aaTargetGroup:
			target_id = GetID();
			break;
		case aaTargetCurrentGroup:
			if(GetTarget() == NULL) {
				Message_StringID(0, AA_NO_TARGET);	//You must first select a target for this ability!
				return;
			}
			target_id = GetTarget()->GetID();
			break;
		case aaTargetPet:
			if(GetPet() == NULL) {
				Message(0, "A pet is required for this skill.");
				return;
			}
			target_id = GetPetID();
			break;
	}
	
	//cast the spell, if we have one
	if(spell_id > 0 && spell_id < SPDAT_RECORDS) {
		//I dont know when we need to mem and when we do not, if ever...
		//MemorizeSpell(8, spell_id, 3);
		CastSpell(spell_id, target_id);
	}
	
	//handle the duration timer if we have one.   
	if(timer_id > 0 && timer_duration > 0) {
		p_timers.Start(pTimerAAEffectStart + timer_id, timer_duration);
	}
}


//Originally written by Branks
//functionality rewritten by Father Nitwit
void Mob::TemporaryPets(int16 spell_id, Mob *targ, const char *name_override, uint32 duration_override) {
	
	//It might not be a bad idea to put these into the database, eventually..
	
	//Dook- swarms and wards 
	
	PetRecord record;
	if(!database.GetPetEntry(spells[spell_id].teleport_zone, &record))
	{
		LogFile->write(EQEMuLog::Error, "Unknown swarm pet spell id: %d, check pets table", spell_id);
		Message(13, "Unable to find data for pet %s", spells[spell_id].teleport_zone);
		return;
	}
	
	AA_SwarmPet pet;
	pet.count = 1;
	pet.duration = 1;

	for(int x = 0; x < 12; x++)
	{
		if(spells[spell_id].effectid[x] == SE_TemporaryPets)
		{
			pet.count = spells[spell_id].base[x];
			pet.duration = spells[spell_id].max[x];
		}
	}
	pet.npc_id = record.npc_type;

	NPCType *made_npc = NULL;
	
	const NPCType *npc_type = database.GetNPCType(pet.npc_id);
	if(npc_type == NULL) {
		//log write
		LogFile->write(EQEMuLog::Error, "Unknown npc type for swarm pet spell id: %d", spell_id);
		Message(0,"Unable to find pet!");
		return;
	}
	
	if(name_override != NULL) {
		//we have to make a custom NPC type for this name change
		made_npc = new NPCType; 
		memcpy(made_npc, npc_type, sizeof(NPCType));
		strcpy(made_npc->name, name_override);
		npc_type = made_npc;
	}
	
	int summon_count = 0;
	summon_count = pet.count;
	
	if(summon_count > MAX_SWARM_PETS)
		summon_count = MAX_SWARM_PETS;
	
	static const float swarm_pet_x[MAX_SWARM_PETS] = { 	5, -5, 5, -5, 
														10, -10, 10, -10,
														8, -8, 8, -8 };
	static const float swarm_pet_y[MAX_SWARM_PETS] = { 	5, 5, -5, -5, 
														10, 10, -10, -10,
														8, 8, -8, -8 };
	TempPets(true);

	while(summon_count > 0) {
		int pet_duration = pet.duration;
		if(duration_override > 0)
			pet_duration = duration_override;
		
		//this is a little messy, but the only way to do it right
		//it would be possible to optimize out this copy for the last pet, but oh well
		NPCType *npc_dup = NULL;
		if(made_npc != NULL) {
			npc_dup = new NPCType;
			memcpy(npc_dup, made_npc, sizeof(NPCType));
		}
		
		NPC* npca = new NPC(
				(npc_dup!=NULL)?npc_dup:npc_type,	//make sure we give the NPC the correct data pointer
				0, 
				GetX()+swarm_pet_x[summon_count], GetY()+swarm_pet_y[summon_count], 
				GetZ(), GetHeading(), FlyMode3);

		if((spell_id == 6882) || (spell_id == 6884))
			npca->SetFollowID(GetID());

		if(!npca->GetSwarmInfo()){
			AA_SwarmPetInfo* nSI = new AA_SwarmPetInfo;
			npca->SetSwarmInfo(nSI);
			npca->GetSwarmInfo()->duration = new Timer(pet_duration*1000);
		}
		else{
			npca->GetSwarmInfo()->duration->Start(pet_duration*1000);
		}

		npca->GetSwarmInfo()->owner = this;

		//give the pets somebody to "love"
		if(targ != NULL){
			npca->AddToHateList(targ, 1000, 1000);
			npca->GetSwarmInfo()->target = targ->GetID();
		}
		
		//we allocated a new NPC type object, give the NPC ownership of that memory
		if(npc_dup != NULL)
			npca->GiveNPCTypeData(npc_dup);
		
		entity_list.AddNPC(npca);
		summon_count--;
	}

	//the target of these swarm pets will take offense to being cast on...
	if(targ != NULL)
		targ->AddToHateList(this, 1, 0);
}

void Mob::WakeTheDead(int16 spell_id, Mob *target, uint32 duration)
{
	Corpse *CorpseToUse = NULL;
	CorpseToUse = entity_list.GetClosestCorpse(this, NULL);

	if(!CorpseToUse)
		return;

	//assuming we have pets in our table; we take the first pet as a base type.
	const NPCType *base_type = database.GetNPCType(500);
	NPCType *make_npc = new NPCType;
	memcpy(make_npc, base_type, sizeof(NPCType));
	
	//combat stats
	make_npc->AC = ((GetLevel() * 7) + 550);
	make_npc->ATK = GetLevel();
	make_npc->max_dmg = (GetLevel() * 4) + 2;
	make_npc->min_dmg = 1;

	//base stats
	make_npc->cur_hp = (GetLevel() * 55);
	make_npc->max_hp = (GetLevel() * 55);
	make_npc->STR = 85 + (GetLevel() * 3);
	make_npc->STA = 85 + (GetLevel() * 3);
	make_npc->DEX = 85 + (GetLevel() * 3);
	make_npc->AGI = 85 + (GetLevel() * 3);
	make_npc->INT = 85 + (GetLevel() * 3);
	make_npc->WIS = 85 + (GetLevel() * 3);
	make_npc->CHA = 85 + (GetLevel() * 3);
	make_npc->MR = 25;
	make_npc->FR = 25;
	make_npc->CR = 25;
	make_npc->DR = 25;
	make_npc->PR = 25;

	//level class and gender
	make_npc->level = GetLevel(); 
	make_npc->class_ = CorpseToUse->class_;
	make_npc->race = CorpseToUse->race;
	make_npc->gender = CorpseToUse->gender;
	make_npc->loottable_id = 0;
	//name
	char NewName[64];
	sprintf(NewName, "%s`s Animated Corpse", GetCleanName());
	strcpy(make_npc->name, NewName);

	//appearance
	make_npc->beard = CorpseToUse->beard;
	make_npc->beardcolor = CorpseToUse->beardcolor;
	make_npc->eyecolor1 = CorpseToUse->eyecolor1;
	make_npc->eyecolor2 = CorpseToUse->eyecolor2;
	make_npc->haircolor = CorpseToUse->haircolor;
	make_npc->hairstyle = CorpseToUse->hairstyle;
	make_npc->helmtexture = CorpseToUse->helmtexture;
	make_npc->luclinface = CorpseToUse->luclinface;
	make_npc->size = CorpseToUse->size;
	make_npc->texture = CorpseToUse->texture;

	//cast stuff.. based off of PEQ's if you want to change 
	//it you'll have to mod this code, but most likely
	//most people will be using PEQ style for the first 
	//part of their spell list; can't think of any smooth
	//way to do this
	//some basic combat mods here too since it's convienent
	switch(CorpseToUse->class_)
	{
	case CLERIC:
		make_npc->npc_spells_id = 1;
		break;
	case WIZARD:
		make_npc->npc_spells_id = 2;
		break;
	case NECROMANCER:
		make_npc->npc_spells_id = 3;
		break;
	case MAGICIAN:
		make_npc->npc_spells_id = 4;
		break;
	case ENCHANTER:
		make_npc->npc_spells_id = 5;
		break;
	case SHAMAN:
		make_npc->npc_spells_id = 6;
		break;
	case DRUID:
		make_npc->npc_spells_id = 7;
		break;
	case PALADIN:
		make_npc->npc_attacks[0] = 'T';
		make_npc->cur_hp = make_npc->cur_hp * 150 / 100;
		make_npc->max_hp = make_npc->max_hp * 150 / 100;
		make_npc->npc_spells_id = 8;
		break;
	case SHADOWKNIGHT:
		make_npc->npc_attacks[0] = 'T';
		make_npc->cur_hp = make_npc->cur_hp * 150 / 100;
		make_npc->max_hp = make_npc->max_hp * 150 / 100;
		make_npc->npc_spells_id = 9;
		break;
	case RANGER:
		make_npc->npc_attacks[0] = 'Q';
		make_npc->cur_hp = make_npc->cur_hp * 135 / 100;
		make_npc->max_hp = make_npc->max_hp * 135 / 100;
		make_npc->npc_spells_id = 10;
		break;
	case BARD:
		make_npc->npc_attacks[0] = 'T';
		make_npc->cur_hp = make_npc->cur_hp * 110 / 100;
		make_npc->max_hp = make_npc->max_hp * 110 / 100;
		make_npc->npc_spells_id = 11;
		break;
	case BEASTLORD:
		make_npc->npc_attacks[0] = 'Q';
		make_npc->cur_hp = make_npc->cur_hp * 110 / 100;
		make_npc->max_hp = make_npc->max_hp * 110 / 100;
		make_npc->npc_spells_id = 12;
		break;
	case ROGUE:
		make_npc->npc_attacks[0] = 'Q';
		make_npc->max_dmg = make_npc->max_dmg * 150 /100;
		make_npc->cur_hp = make_npc->cur_hp * 110 / 100;
		make_npc->max_hp = make_npc->max_hp * 110 / 100;
		break;
	case MONK:
		make_npc->npc_attacks[0] = 'Q';
		make_npc->max_dmg = make_npc->max_dmg * 150 /100;
		make_npc->cur_hp = make_npc->cur_hp * 135 / 100;
		make_npc->max_hp = make_npc->max_hp * 135 / 100;
		break;
	case WARRIOR:
	case BERSERKER:
		make_npc->npc_attacks[0] = 'Q';
		make_npc->max_dmg = make_npc->max_dmg * 150 /100;
		make_npc->cur_hp = make_npc->cur_hp * 175 / 100;
		make_npc->max_hp = make_npc->max_hp * 175 / 100;
		break;
	default:
		make_npc->npc_spells_id = 0;
		break;
	}
	
	make_npc->loottable_id = 0;
	make_npc->merchanttype = 0;
	make_npc->d_meele_texture1 = 0;
	make_npc->d_meele_texture2 = 0;

	TempPets(true);

	NPC* npca = new NPC(make_npc, 0, GetX(), GetY(), GetZ(), GetHeading(), FlyMode3);

	if(!npca->GetSwarmInfo()){
		AA_SwarmPetInfo* nSI = new AA_SwarmPetInfo;
		npca->SetSwarmInfo(nSI);
		npca->GetSwarmInfo()->duration = new Timer(duration*1000);
	}
	else{
		npca->GetSwarmInfo()->duration->Start(duration*1000);
	}

	npca->GetSwarmInfo()->owner = this;

	//give the pet somebody to "love"
	if(target != NULL){
		npca->AddToHateList(target, 100000);
		npca->GetSwarmInfo()->target = target->GetID();
	}

	//gear stuff, need to make sure there's
	//no situation where this stuff can be duped
	for(int x = 0; x < 21; x++)
	{
		uint32 sitem = 0;
		sitem = CorpseToUse->GetWornItem(x);
		if(sitem){
			const Item_Struct * itm = database.GetItem(sitem);
			npca->AddLootDrop(itm, &npca->itemlist, 1, true, true);
		}
	}

	//we allocated a new NPC type object, give the NPC ownership of that memory
	if(make_npc != NULL)
		npca->GiveNPCTypeData(make_npc);

	entity_list.AddNPC(npca);

	//the target of these swarm pets will take offense to being cast on...
	if(target != NULL)
		target->AddToHateList(this, 1, 0);
}

//turn on an AA effect
//duration == 0 means no time limit, used for one-shot deals, etc..
void Client::EnableAAEffect(aaEffectType type, int32 duration) {
	if(type > 32)
		return;	//for now, special logic needed.
	m_epp.aa_effects |= 1 << (type-1);
	
	if(duration > 0) {
		p_timers.Start(pTimerAAEffectStart + type, duration);
	} else {
		p_timers.Clear(&database, pTimerAAEffectStart + type);
	}
}

void Client::DisableAAEffect(aaEffectType type) {
	if(type > 32)
		return;	//for now, special logic needed.
	uint32 bit = 1 << (type-1);
	if(m_epp.aa_effects & bit) {
		m_epp.aa_effects ^= bit;
	}
	p_timers.Clear(&database, pTimerAAEffectStart + type);
}

/*
By default an AA effect is a one shot deal, unless
a duration timer is set.
*/
bool Client::CheckAAEffect(aaEffectType type) {
	if(type > 32)
		return(false);	//for now, special logic needed.
	if(m_epp.aa_effects & (1 << (type-1))) {	//is effect enabled?
		//has our timer expired?
		if(p_timers.Expired(&database, pTimerAAEffectStart + type)) {
			DisableAAEffect(type);
			return(false);
		}
		return(true);
	}
	return(false);
}

void Client::SendAAStats() {
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_AAExpUpdate, sizeof(AltAdvStats_Struct));
	AltAdvStats_Struct *aps = (AltAdvStats_Struct *)outapp->pBuffer;
	aps->experience = m_pp.expAA;
	aps->experience = (int32)(((float)330.0f * (float)m_pp.expAA) / (float)max_AAXP);
	aps->unspent = m_pp.aapoints;
	aps->percentage = m_epp.perAA;
	QueuePacket(outapp);
	safe_delete(outapp);
}

void Client::BuyAA(AA_Action* action)
{
	mlog(AA__MESSAGE, "Starting to buy AA %d", action->ability);
		
	//find the AA information from the database
	SendAA_Struct* aa2 = zone->FindAA(action->ability);
	if(!aa2) {
		//hunt for a lower level...
		int i;
		int a;
		for(i=1;i<15;i++){
			a = action->ability - i;
			if(a <= 0)
				break;
			mlog(AA__MESSAGE, "Could not find AA %d, trying potential parent %d", action->ability, a);
			aa2 = zone->FindAA(a);
			if(aa2 != NULL)
				break;
		}
	}
	if(aa2 == NULL)
		return;	//invalid ability...
	
	int32 cur_level = GetAA(aa2->id);
	if((aa2->id + cur_level) != action->ability) { //got invalid AA
		mlog(AA__ERROR, "Unable to find or match AA %d (found %d + lvl %d)", action->ability, aa2->id, cur_level);
		return;
	}
	
	int real_cost;
	
	std::map<uint32, AALevelCost_Struct>::iterator RequiredLevel = AARequiredLevelAndCost.find(action->ability);

	if(RequiredLevel != AARequiredLevelAndCost.end())
	{
		real_cost = RequiredLevel->second.Cost;
	}
	else
		real_cost = aa2->cost + (aa2->cost_inc * cur_level);

	if(m_pp.aapoints >= real_cost && cur_level < aa2->max_level) {
		SetAA(aa2->id, cur_level+1);

		mlog(AA__MESSAGE, "Set AA %d to level %d", aa2->id, cur_level+1);
		
		m_pp.aapoints -= real_cost;

		Save();

		SendAA(aa2->id);
		SendAATable();

		//we are building these messages ourself instead of using the stringID to work around patch discrepencies
		//these are AA_GAIN_ABILITY	(410) & AA_IMPROVE (411), respectively, in both Titanium & SoF. not sure about 6.2
		if(cur_level<1)
			Message(15,"You have gained the ability \"%s\" at a cost of %d ability %s.", aa2->name, real_cost, (real_cost>1)?"points":"point");
		else
			Message(15,"You have improved %s %d at a cost of %d ability %s.", aa2->name, cur_level, real_cost, (real_cost>1)?"points":"point");

		
		SendAAStats();
		
		CalcBonuses();
		if(title_manager.IsNewAATitleAvailable(m_pp.aapoints_spent, GetBaseClass()))
			NotifyNewTitlesAvailable();
	}
}

void Client::SendAATimer(int32 ability, int32 begin, int32 end) {
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_AAAction,sizeof(UseAA_Struct));
	UseAA_Struct* uaaout = (UseAA_Struct*)outapp->pBuffer;
	uaaout->ability = ability;
	uaaout->begin = begin;
	uaaout->end = end;
	QueuePacket(outapp);
	safe_delete(outapp);
}

//sends all AA timers.
void Client::SendAATimers() {
	//we dont use SendAATimer because theres no reason to allocate the EQApplicationPacket every time
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_AAAction,sizeof(UseAA_Struct));
	UseAA_Struct* uaaout = (UseAA_Struct*)outapp->pBuffer;
	
	PTimerList::iterator c,e;
	c = p_timers.begin();
	e = p_timers.end();
	for(; c != e; c++) {
		PersistentTimer *cur = c->second;
		if(cur->GetType() < pTimerAAStart || cur->GetType() > pTimerAAEnd)
			continue;	//not an AA timer
		//send timer
		uaaout->begin = cur->GetStartTime();
		uaaout->end = time(NULL);
		uaaout->ability = cur->GetType() - pTimerAAStart; // uuaaout->ability is really a shared timer number
		QueuePacket(outapp);
	}
	
	safe_delete(outapp);
}

void Client::SendAATable() {
    EQApplicationPacket* outapp = new EQApplicationPacket(OP_RespondAA, sizeof(AATable_Struct));
    
    AATable_Struct* aa2 = (AATable_Struct *)outapp->pBuffer;
	aa2->aa_spent = GetAAPointsSpent();
    uint32 i;
	for(i=0;i < MAX_PP_AA_ARRAY;i++){
		aa2->aa_list[i].aa_skill = aa[i]->AA;
		aa2->aa_list[i].aa_value = aa[i]->value;
		aa2->aa_list[i].unknown08 = 0;
	}
    QueuePacket(outapp);
    safe_delete(outapp);
}

void Client::SendPreviousAA(int32 id, int seq){
	uint32 value=0;
	SendAA_Struct* saa2 = NULL;
	if(id==0)
		saa2 = zone->GetAABySequence(seq);
	else
		saa2 = zone->FindAA(id);
	if(!saa2)
		return;
	int size=sizeof(SendAA_Struct)+sizeof(AA_Ability)*saa2->total_abilities;
	uchar* buffer = new uchar[size];
	SendAA_Struct* saa=(SendAA_Struct*)buffer;
	value = GetAA(saa2->id);
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_SendAATable);
	outapp->size=size;
	outapp->pBuffer=(uchar*)saa;
	value--;
	memcpy(saa,saa2,size);
	if(value>0){
		if(saa->spellid==0)
			saa->spellid=0xFFFFFFFF;
		saa->id+=value;
		saa->next_id=saa->id+1;
		if(value==1)
			saa->last_id=saa2->id;
		else
			saa->last_id=saa->id-1;
		saa->current_level=value+1;
		saa->cost2 = 0; //cost 2 is what the client uses to calc how many points we've spent, so we have to add up the points in order
		for(int i=0;i<(value+1);i++){
			saa->cost2 += saa->cost + (saa->cost_inc * i);
		}
	}
	database.FillAAEffects(saa);
	QueuePacket(outapp);
	safe_delete(outapp);
}

void Client::SendAA(int32 id, int seq) {
	uint32 value=0;
	SendAA_Struct* saa2 = NULL;
	if(id==0)
		saa2 = zone->GetAABySequence(seq);
	else
		saa2 = zone->FindAA(id);
	if(!saa2)
		return;

	int16 classes = saa2->classes;
	if(!(classes & (1 << GetClass())) && (GetClass()!=BERSERKER || saa2->berserker==0)){
		return;
	}
	
	int size=sizeof(SendAA_Struct)+sizeof(AA_Ability)*saa2->total_abilities;
	uchar* buffer = new uchar[size];
	SendAA_Struct* saa=(SendAA_Struct*)buffer;
	memcpy(saa,saa2,size);
	
	if(saa->spellid==0)
		saa->spellid=0xFFFFFFFF;
	
	value=GetAA(saa->id);
	int32 orig_val = value;
	bool dump = false;
	if(value){
		dump = true;
		if(value < saa->max_level){
			saa->id+=value;
			saa->next_id=saa->id+1;
			value++;
		}
		else{
			saa->id+=value-1;
			saa->next_id=0xFFFFFFFF;
		}
		saa->last_id=saa->id-1;
		saa->current_level=value;
		saa->cost = saa2->cost + (saa2->cost_inc*(value-1));
		saa->cost2 = 0;
		for(int i=0;i<value;i++){
			saa->cost2 += saa2->cost + (saa2->cost_inc * i);
		}
	}
	database.FillAAEffects(saa);

	if(value > 0)
	{
		const AA_DBAction *caa = &AA_Actions[saa->id][value - 1];

		if(caa && caa->reuse_time > 0)
			saa->spell_refresh = CalcAAReuseTimer(caa);
	}
	std::map<uint32, AALevelCost_Struct>::iterator RequiredLevel = AARequiredLevelAndCost.find(saa->id);
 
	if(RequiredLevel != AARequiredLevelAndCost.end())
	{
		saa->class_type = RequiredLevel->second.Level;
		saa->cost = RequiredLevel->second.Cost;
	}

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_SendAATable);
	outapp->size=size;
	outapp->pBuffer=(uchar*)saa;
	if(id==0 && value && (orig_val < saa->max_level)) //send previous AA only on zone in
		SendPreviousAA(id, seq);
	//if(dump)
		//DumpPacket(outapp);
	QueuePacket(outapp);
	safe_delete(outapp);
	//will outapp delete the buffer for us even though it didnt make it?  --- Yes, it should
}

void Client::SendAAList(){
	int total = zone->GetTotalAAs();
	for(int i=0;i < total;i++){
		SendAA(0,i);
	}
}

int32 Client::GetAA(int32 aa_id) const {
	map<int32,int8>::const_iterator res;
	res = aa_points.find(aa_id);
	if(res != aa_points.end()) {
		return(res->second);
	}
	return(0);
}

bool Client::SetAA(int32 aa_id, int32 new_value) {
	aa_points[aa_id] = new_value;
	uint32 cur;
	for(cur=0;cur < MAX_PP_AA_ARRAY;cur++){
		if((aa[cur]->value > 1) && ((aa[cur]->AA - aa[cur]->value + 1)== aa_id)){
			aa[cur]->value = new_value;
			aa[cur]->AA++;
			return true;
		}
		else if((aa[cur]->value == 1) && (aa[cur]->AA == aa_id)){
			aa[cur]->value = new_value;
			aa[cur]->AA++;
			return true;
		}
		else if(aa[cur]->AA==0){ //end of list
			aa[cur]->AA = aa_id;
			aa[cur]->value = new_value;
			return true;
		}
	}
	return false;
}

SendAA_Struct* Zone::FindAA(int32 id) {
	return aas_send[id];
}

void Zone::LoadAAs() {
	LogFile->write(EQEMuLog::Status, "Loading AA information...");
	totalAAs = database.CountAAs();
	if(totalAAs == 0) {
		LogFile->write(EQEMuLog::Error, "Failed to load AAs!");
		aas = NULL;
		return;
	}
	aas = new SendAA_Struct *[totalAAs];
	
	database.LoadAAs(aas);
	
	int i;
	for(i=0; i < totalAAs; i++){
		SendAA_Struct* aa = aas[i];
		aas_send[aa->id] = aa;
	}

	//load AA Effects into aa_effects
	LogFile->write(EQEMuLog::Status, "Loading AA Effects...");
	if (database.LoadAAEffects2())
		LogFile->write(EQEMuLog::Status, "Loaded %d AA Effects.", aa_effects.size());
	else
		LogFile->write(EQEMuLog::Error, "Failed to load AA Effects!");
}

bool ZoneDatabase::LoadAAEffects2() {
	aa_effects.clear();	//start fresh

	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT aaid, slot, effectid, base1, base2 FROM aa_effects ORDER BY aaid ASC, slot ASC"), errbuf, &result)) {
		int count = 0;
		while((row = mysql_fetch_row(result))!= NULL) {
			int aaid = atoi(row[0]);
			int slot = atoi(row[1]);
			int effectid = atoi(row[2]);
			int base1 = atoi(row[3]);
			int base2 = atoi(row[4]);
			aa_effects[aaid][slot].skill_id = effectid;
			aa_effects[aaid][slot].base1 = base1;
			aa_effects[aaid][slot].base2 = base2;
			aa_effects[aaid][slot].slot = slot;	//not really needed, but we'll populate it just in case
			count++;
		}
		mysql_free_result(result);
		if (count < 1)	//no results
			LogFile->write(EQEMuLog::Error, "Error loading AA Effects, none found in the database.");
	} else {
		LogFile->write(EQEMuLog::Error, "Error in ZoneDatabase::LoadAAEffects2 query: '%s': %s", query, errbuf);
		return false;
	}
	safe_delete_array(query);
	return true;
}
void Client::ResetAA(){
	uint32 i;
	for(i=0;i<MAX_PP_AA_ARRAY;i++){
		aa[i]->AA = 0;
		aa[i]->value = 0;
	}
	map<int32,int8>::iterator itr;
	for(itr=aa_points.begin();itr!=aa_points.end();itr++)
		aa_points[itr->first] = 0;

        for(int i = 0; i < _maxLeaderAA; ++i)
		m_pp.leader_abilities.ranks[i] = 0;

	m_pp.group_leadership_points = 0;
	m_pp.raid_leadership_points = 0;
	m_pp.group_leadership_exp = 0;
	m_pp.raid_leadership_exp = 0;
}

int Client::GroupLeadershipAAHealthEnhancement()
{
	Group *g = GetGroup();

	if(!g || (g->GroupCount() < 3))
		return 0;

	switch(g->GetLeadershipAA(groupAAHealthEnhancement))
	{
		case 0:
			return 0;
		case 1:
			return 30;
		case 2:
			return 60;
		case 3:
			return 100;
	}

	return 0;
}

int Client::GroupLeadershipAAManaEnhancement()
{
	Group *g = GetGroup();

	if(!g || (g->GroupCount() < 3))
		return 0;

	switch(g->GetLeadershipAA(groupAAManaEnhancement))
	{
		case 0:
			return 0;
		case 1:
			return 30;
		case 2:
			return 60;
		case 3:
			return 100;
	}

	return 0;
}

int Client::GroupLeadershipAAHealthRegeneration()
{
	Group *g = GetGroup();

	if(!g || (g->GroupCount() < 3))
		return 0;

	switch(g->GetLeadershipAA(groupAAHealthRegeneration))
	{
		case 0:
			return 0;
		case 1:
			return 4;
		case 2:
			return 6;
		case 3:
			return 8;
	}

	return 0;
}

int Client::GroupLeadershipAAOffenseEnhancement()
{
	Group *g = GetGroup();

	if(!g || (g->GroupCount() < 3))
		return 0;

	switch(g->GetLeadershipAA(groupAAOffenseEnhancement))
	{
		case 0:
			return 0;
		case 1:
			return 10;
		case 2:
			return 19;
		case 3:
			return 28;
		case 4:
			return 34;
		case 5:
			return 40;
	}
	return 0;
}

void Client::InspectBuffs(Client* Inspector, int Rank)
{
	if(!Inspector || (Rank == 0)) return;

	Inspector->Message_StringID(0, CURRENT_SPELL_EFFECTS, GetName());

	uint32 buff_count = GetMaxTotalSlots();
	for (uint32 i = 0; i < buff_count; ++i)
	{
		if (buffs[i].spellid != SPELL_UNKNOWN)
		{
			if(Rank == 1)
				Inspector->Message(0, "%s", spells[buffs[i].spellid].name);
			else
			{
				if (buffs[i].durationformula == DF_Permanent)
					Inspector->Message(0, "%s (Permanent)", spells[buffs[i].spellid].name);
				else {
					char *TempString = NULL;
					MakeAnyLenString(&TempString, "%.1f", static_cast<float>(buffs[i].ticsremaining) / 10.0f);
					Inspector->Message_StringID(0, BUFF_MINUTES_REMAINING, spells[buffs[i].spellid].name, TempString);
					safe_delete_array(TempString);
				}
			}
		}
	}
}

//this really need to be renamed to LoadAAActions()
bool ZoneDatabase::LoadAAEffects() {
	char errbuf[MYSQL_ERRMSG_SIZE];
    MYSQL_RES *result;
    MYSQL_ROW row;
	
	memset(AA_Actions, 0, sizeof(AA_Actions));	//I hope the compiler is smart about this size...
	
	const char *query = "SELECT aaid,rank,reuse_time,spell_id,target,nonspell_action,nonspell_mana,nonspell_duration,"
			    "       redux_aa,redux_rate,redux_aa2,redux_rate2 FROM aa_actions";

	if (RunQuery(query, strlen(query), errbuf, &result)) {
		//safe_delete_array(query);
		int r;
		while ((row = mysql_fetch_row(result))) {
			r = 0;
			int aaid = atoi(row[r++]);
			int rank = atoi(row[r++]);
			if(aaid < 0 || aaid >= aaHighestID || rank < 0 || rank >= MAX_AA_ACTION_RANKS)
				continue;
			AA_DBAction *caction = &AA_Actions[aaid][rank];
			
			caction->reuse_time = atoi(row[r++]);
			caction->spell_id = atoi(row[r++]);
			caction->target = (aaTargetType) atoi(row[r++]);
			caction->action = (aaNonspellAction) atoi(row[r++]);
			caction->mana_cost = atoi(row[r++]);
			caction->duration = atoi(row[r++]);
			caction->redux_aa = (aaID) atoi(row[r++]);
			caction->redux_rate = atoi(row[r++]);
			caction->redux_aa2 = (aaID) atoi(row[r++]);
			caction->redux_rate2 = atoi(row[r++]);
				
		}
		mysql_free_result(result);
	}
	else {
		LogFile->write(EQEMuLog::Error, "Error in LoadAAEffects query '%s': %s", query, errbuf);;
		//safe_delete_array(query);
		return false;
	}

	return true;
}

//Returns the number effects an AA has when we send them to the client
//For the purposes of sizing a packet because every skill does not
//have the same number effects, they can range from none to a few depending on AA.
//counts the # of effects by counting the different slots of an AAID in the DB.

//AndMetal: this may now be obsolete since we have Zone::GetTotalAALevels()
int8 ZoneDatabase::GetTotalAALevels(int32 skill_id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	int total=0;
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT count(slot) from aa_effects where aaid=%i", skill_id), errbuf, &result)) {
		safe_delete_array(query);
		if (mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			total=atoi(row[0]);
		}
		mysql_free_result(result);
	} else {
		LogFile->write(EQEMuLog::Error, "Error in GetTotalAALevels '%s: %s", query, errbuf);
		safe_delete_array(query);
	}
	return total;
}

//this will allow us to count the number of effects for an AA by pulling the info from memory instead of the database. hopefully this will same some CPU cycles
uint8 Zone::GetTotalAALevels(uint32 skill_id) {
	return aa_effects[skill_id].size();	//will return 0 if the skill_id isn't loaded
}

/*
Every AA can send the client effects, which are purely for client side effects.
Essentially it's like being able to attach a very simple version of a spell to
Any given AA, it has 4 fields:
skill_id = spell effect id
slot = ID slot, doesn't appear to have any impact on stacking like real spells, just needs to be unique.
base1 = the base field of a spell
base2 = base field 2 of a spell, most AAs do not utilize this
example:
	skill_id = SE_STA
	slot = 1
	base1 = 15
	This would if you filled the abilities struct with this make the client show if it had
	that AA an additional 15 stamina on the client's stats
*/
void ZoneDatabase::FillAAEffects(SendAA_Struct* aa_struct){
	if(!aa_struct)
		return;

	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT effectid, base1, base2, slot from aa_effects where aaid=%i order by slot asc", aa_struct->id), errbuf, &result)) {
		int ndx=0;
		while((row = mysql_fetch_row(result))!=NULL) {
			aa_struct->abilities[ndx].skill_id=atoi(row[0]);
			aa_struct->abilities[ndx].base1=atoi(row[1]);
			aa_struct->abilities[ndx].base2=atoi(row[2]);
			aa_struct->abilities[ndx].slot=atoi(row[3]);
			ndx++;
		}
		mysql_free_result(result);
	} else {
		LogFile->write(EQEMuLog::Error, "Error in Client::FillAAEffects query: '%s': %s", query, errbuf);			
	}
	safe_delete_array(query);
}

int32 ZoneDatabase::CountAAs(){
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	int count=0;
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT count(title_sid) from altadv_vars"), errbuf, &result)) {
		if((row = mysql_fetch_row(result))!=NULL)
			count = atoi(row[0]);
		mysql_free_result(result);
	} else {
		LogFile->write(EQEMuLog::Error, "Error in ZoneDatabase::CountAAs query '%s': %s", query, errbuf);		
	}
	safe_delete_array(query);
	return count;
}

int32 ZoneDatabase::CountAAEffects(){
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	int count=0;
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT count(id) from aa_effects"), errbuf, &result)) {
		if((row = mysql_fetch_row(result))!=NULL){
			count = atoi(row[0]);
		}
		mysql_free_result(result);
	} else {
		LogFile->write(EQEMuLog::Error, "Error in ZoneDatabase::CountAALevels query '%s': %s", query, errbuf);		
	}
	safe_delete_array(query);
	return count;
}

int32 ZoneDatabase::GetSizeAA(){
	int size=CountAAs()*sizeof(SendAA_Struct);
	if(size>0)
		size+=CountAAEffects()*sizeof(AA_Ability);
	return size;
}

void ZoneDatabase::LoadAAs(SendAA_Struct **load){
	if(!load)
		return;
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT skill_id from altadv_vars order by skill_id"), errbuf, &result)) {
		int skill=0,ndx=0;
		while((row = mysql_fetch_row(result))!=NULL) {
			skill=atoi(row[0]);
			load[ndx] = GetAASkillVars(skill);
			load[ndx]->seq = ndx+1;
			ndx++;
		}
		mysql_free_result(result);
	} else {
		LogFile->write(EQEMuLog::Error, "Error in ZoneDatabase::LoadAAs query '%s': %s", query, errbuf);		
	}
	safe_delete_array(query);

	AARequiredLevelAndCost.clear();

	if (RunQuery(query, MakeAnyLenString(&query, "SELECT skill_id, level, cost from aa_required_level_cost order by skill_id"), errbuf, &result))
	{
		AALevelCost_Struct aalcs;
		while((row = mysql_fetch_row(result))!=NULL)
		{
			aalcs.Level = atoi(row[1]);
			aalcs.Cost = atoi(row[2]);
			AARequiredLevelAndCost[atoi(row[0])] = aalcs;
		}		
		mysql_free_result(result);
	}
	else
		LogFile->write(EQEMuLog::Error, "Error in ZoneDatabase::LoadAAs query '%s': %s", query, errbuf);

	safe_delete_array(query);
}

SendAA_Struct* ZoneDatabase::GetAASkillVars(int32 skill_id)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	SendAA_Struct* sendaa = NULL;
	uchar* buffer;
	if (RunQuery(query, MakeAnyLenString(&query, "SET @row = 0"), errbuf)) {	//initialize "row" variable in database for next query
		safe_delete_array(query);
		MYSQL_RES *result;	//we don't really need these unless we get to this point, so why bother?
		MYSQL_ROW row;

		if (RunQuery(query, MakeAnyLenString(&query, 
			"SELECT "
				"a.cost, "
				"a.max_level, "
				"a.hotkey_sid, "
				"a.hotkey_sid2, "
				"a.title_sid, "
				"a.desc_sid, "
				"a.type, "
				"COALESCE("	//so we can return 0 if it's null
					"("	//this is our derived table that has the row # that we can SELECT from, because the client is stupid
					"SELECT "
						"p.prereq_index_num "
					"FROM "
						"("
						"SELECT "
							"a2.skill_id, "
							"@row := @row + 1 AS prereq_index_num "
						"FROM "
							"altadv_vars a2"
						") AS p "
					"WHERE "
						"p.skill_id = a.prereq_skill"
					"), "
					"0)  AS prereq_skill_index, "
				"a.prereq_minpoints, "
				"a.spell_type, "
				"a.spell_refresh, "
				"a.classes, "
				"a.berserker, "
				"a.spellid, "
				"a.class_type, "
				"a.name, "
				"a.cost_inc, "
				"a.aa_expansion, "
				"a.special_category, "
				"a.sof_type, "
				"a.sof_cost_inc, "
				"a.sof_max_level, "
				"a.sof_next_skill, "
				"a.clientver, "	// Client Version 0 = None, 1 = All, 2 = Titanium/6.2, 3 = SoF
				"a.account_time_required "
			" FROM altadv_vars a WHERE skill_id=%i", skill_id), errbuf, &result)) {
			safe_delete_array(query);
			if (mysql_num_rows(result) == 1) {
				int total_abilities = GetTotalAALevels(skill_id);	//eventually we'll want to use zone->GetTotalAALevels(skill_id) since it should save queries to the DB
				int totalsize = total_abilities * sizeof(AA_Ability) + sizeof(SendAA_Struct);
				
				buffer = new uchar[totalsize];
				memset(buffer,0,totalsize);
				sendaa = (SendAA_Struct*)buffer;
				
				row = mysql_fetch_row(result);
				
				//ATOI IS NOT UNISGNED LONG-SAFE!!!
				
				sendaa->cost = atoul(row[0]);
				sendaa->cost2 = sendaa->cost;
				sendaa->max_level = atoul(row[1]);
				sendaa->hotkey_sid = atoul(row[2]);
				sendaa->id = skill_id;
				sendaa->hotkey_sid2 = atoul(row[3]);
				sendaa->title_sid = atoul(row[4]);
				sendaa->desc_sid = atoul(row[5]);
				sendaa->type = atoul(row[6]);
				sendaa->prereq_skill = atoul(row[7]);
				sendaa->prereq_minpoints = atoul(row[8]);
				sendaa->spell_type = atoul(row[9]);
				sendaa->spell_refresh = atoul(row[10]);
				sendaa->classes = atoul(row[11]);
				sendaa->berserker = atoul(row[12]);
				sendaa->last_id = 0xFFFFFFFF;
				sendaa->current_level=1;
				sendaa->spellid = atoul(row[13]);
				sendaa->class_type = atoul(row[14]);
				strcpy(sendaa->name,row[15]);
				
				sendaa->total_abilities=total_abilities;
				if(sendaa->max_level > 1)
					sendaa->next_id=skill_id+1;
				else
					sendaa->next_id=0xFFFFFFFF;
				
				sendaa->cost_inc = atoi(row[16]);
				// Begin SoF Specific/Adjusted AA Fields
				sendaa->aa_expansion = atoul(row[17]);
				sendaa->special_category = atoul(row[18]);
				sendaa->sof_type = atoul(row[19]);
				sendaa->sof_cost_inc = atoi(row[20]);
				sendaa->sof_max_level = atoul(row[21]);
				sendaa->sof_next_skill = atoul(row[22]);
				sendaa->clientver = atoul(row[23]);
			}
			mysql_free_result(result);
		} else {
			LogFile->write(EQEMuLog::Error, "Error in GetAASkillVars '%s': %s", query, errbuf);
			safe_delete_array(query);
		}
	} else {
		LogFile->write(EQEMuLog::Error, "Error in GetAASkillVars '%s': %s", query, errbuf);
		safe_delete_array(query);
	}
	return sendaa;
}

/*
Update the player alternate advancement table for the given account "account_id" and character name "name"
Return true if the character was found, otherwise false.
False will also be returned if there is a database error.
*/
/*bool ZoneDatabase::SetPlayerAlternateAdv(int32 account_id, char* name, PlayerAA_Struct* aa)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
    char query[256+sizeof(PlayerAA_Struct)*2+1];
	char* end = query;
	
	//if (strlen(name) > 15)
	//	return false;
	
	for (int i=0; i< 'a' || name[i] > 'z') && 
	(name[i] < 'A' || name[i] > 'Z') && 
	(name[i] < '0' || name[i] > '9'))
	return 0;
}
	
	
	end += sprintf(end, "UPDATE character_ SET alt_adv=\'");
	end += DoEscapeString(end, (char*)aa, sizeof(PlayerAA_Struct));
	*end++ = '\'';
	end += sprintf(end," WHERE account_id=%d AND name='%s'", account_id, name);
	
	int32 affected_rows = 0;
    if (!RunQuery(query, (int32) (end - query), errbuf, 0, &affected_rows)) {
        LogFile->write(EQEMuLog::Error, "Error in SetPlayerAlternateAdv query '%s': %s", query, errbuf);
		return false;
    }
	
	if (affected_rows == 0) {
		return false;
	}
	
	return true;
}
*/
/*
Update the player alternate advancement table for the given account "account_id" and character name "name"
Return true if the character was found, otherwise false.
False will also be returned if there is a database error.
*/
/*bool ZoneDatabase::SetPlayerAlternateAdv(int32 account_id, char* name, PlayerAA_Struct* aa)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
    char query[256+sizeof(PlayerAA_Struct)*2+1];
	char* end = query;
	
	end += sprintf(end, "UPDATE character_ SET alt_adv=\'");
	end += DoEscapeString(end, (char*)aa, sizeof(PlayerAA_Struct));
	*end++ = '\'';
	end += sprintf(end," WHERE account_id=%d AND name='%s'", account_id, name);
	
	int32 affected_rows = 0;
    if (!RunQuery(query, (int32) (end - query), errbuf, 0, &affected_rows)) {
        LogFile->write(EQEMuLog::Error, "Error in SetPlayerAlternateAdv query: %s", errbuf);
		return false;
    }
	
	if (affected_rows == 0) {
		return false;
	}
	
	return true;
}*/

/*
Get the player alternate advancement table for the given account "account_id" and character name "name"
Return true if the character was found, otherwise false.
False will also be returned if there is a database error.
*/
/*int32 ZoneDatabase::GetPlayerAlternateAdv(int32 account_id, char* name, PlayerAA_Struct* aa)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	
	unsigned long* lengths;
	unsigned long len = 0;
	
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT alt_adv FROM character_ WHERE account_id=%i AND name='%s'", account_id, name), errbuf, &result)) {
		safe_delete_array(query);
		if (mysql_num_rows(result) == 1) {	
			row = mysql_fetch_row(result);
			lengths = mysql_fetch_lengths(result);
			len = result->lengths[0];
			//if (lengths[0] == sizeof(PlayerAA_Struct)) {
			if(row[0] && lengths[0] >= sizeof(PlayerAA_Struct)) {
				memcpy(aa, row[0], sizeof(PlayerAA_Struct));
			} else { // let's support ghetto-ALTERed databases that don't contain any data in the alt_adv column
				memset(aa, 0, sizeof(PlayerAA_Struct));
				len = sizeof(PlayerAA_Struct);
			}
			//}
			//else {
			//cerr << "Player alternate advancement table length mismatch in GetPlayerAlternateAdv" << endl;
			//mysql_free_result(result);
			//return false;
			//}
		}
		else {
			mysql_free_result(result);
			return 0;
		}
		mysql_free_result(result);
		//		unsigned long len=result->lengths[0];
		return len;
	}
	else {
		LogFile->write(EQEMuLog::Error, "Error in GetPlayerAlternateAdv '%s': %s", query, errbuf);
		safe_delete_array(query);
		return 0;
	}
	
	//return true;
}*/


/*

this is here because theres a ton of information init,
and I am not sure that it is all in the DB yet.

	switch(activate){
		case aaMassGroupBuff:
			EnableAAEffect(aaEffectMassGroupBuff);
			timer_base = 4320;
			target = aaTargetCurrentGroup;
			break;
			
		case aaDivineResurrection: //Divine Res
			spell_id = 2738;
			timer_base = 64800;
			target = aaTargetCurrent;
			break;
			
		case aaInnateInvisToUndead: //Innate Undead Invis
			spell_id = 1047;
			timer_base = 7;
			break;
			
		case aaCelestialRegeneration: //Celestial Regen
			switch (GetAA(aaCelestialRenewal))
			{
				case 1:
					spell_id = 3250;
					break;
				case 2:
					spell_id = 3251;
					break;
				default:
					spell_id = 2740;
					break;
			}
			target = aaTargetCurrent;
			timer_base = 900;
			break;
			
		case aaBestowDivineAura: //Bestow DA
			dedux = 10*GetAA(aaHastenedDivinity);
			spell_id = 2690;
//MISSING timer value, this is wrong:
			timer_base = 8640;
			target = aaTargetCurrent;
			break;
			
		case aaTurnUndead: //Turn Undead
			dedux = 10*GetAA(aaHastenedTurning);
			spell_id = AA_Choose3(activate_val, 2776, 2777, 2778);
			timer_base = 4320;
			target = aaTargetCurrent;
			break;
			
		case aaPurifySoul: //Purify Soul
			dedux = 10*GetAA(aaHastenedPurificationofSoul);
			spell_id = 2742;	//1473?
			timer_base = 1800;
			target = aaTargetCurrent;
			break;
			
		case aaExodus: //Exodus
			spell_id = 2771;
			dedux = 10*GetAA(aaHastenedExodus);
			timer_base = 4320;
			break;
			
		case aaDireCharm: //Dire Charm
			switch (GetClass())
			{
				case DRUID:
					spell_id = 2760; 	//2644?
					break;
				case NECROMANCER:
					spell_id = 2759;	//2643?
					break;
				case ENCHANTER:
					spell_id = 2761;	//2642?
					break;
			}
			timer_base = 4320;
			target = aaTargetCurrent;
			break;
			
		case aaCannibalization: //Canni V
			spell_id = 2749;
			timer_base = 180;
			break;
			
		case aaRabidBear: 
			spell_id = 2750;
			timer_base = 7200;
			dedux = 10*GetAA(aaHastenedRabidity);
			target = aaTargetCurrent;
			break;
			
		case aaManaBurn:
			spell_id = 2751;
			timer_base = 112;
			target = aaTargetCurrent;	//?
			break;
			
		case aaImprovedFamiliar:
			//Spell IDs might be wrong...
			if (GetAA(aaAllegiantFamiliar))
				spell_id = 3264;	//1994?
			else
				spell_id = 2758;	//2155?
			timer_base = 420;
			break;
			
		case aaNexusGate: //Nexus Gate
			spell_id = 2734;	//864?
			timer_base = 4320;	//2160?
			break;
//aaPermanentIllusion
			
		case aaGatherMana: //Gather Mana
			//not sure which is better:
			//SetMana(GetMaxMana());
			//or:
			spell_id = 2753;
			
			dedux = 10*GetAA(aaHastenedGathering);
			timer_base = 8640;	//4320?
			break;
			
		case aaMendCompanion: //Mend Companion
			dedux = 10*GetAA(aaHastenedMending);
			if (GetPet()) {
				spell_id = 2752;	//2654?
				timer_base = 2160;
			}
			break;
			
		case aaFrenziedBurnout: //Frenzied Burnout
			spell_id = 2754;
			timer_base = 4320;	//2160?
			break;
			
		case aaElementalFormFire: //Ele Form Fire
			spell_id = AA_Choose3(activate_val, 2795, 2796, 2797);
			timer_base = 900;
			break;
			
		case aaElementalFormWater: //Ele Form Water
			spell_id = AA_Choose3(activate_val, 2798, 2799, 2800);
			//MemorizeSpell(8,spell_id,3);
			timer_base = 900;
			break;
			
		case aaElementalFormEarth: //Ele Form Earth
			spell_id = AA_Choose3(activate_val, 2792, 2793, 2794);
			timer_base = 900;
			break;
			
		case aaElementalFormAir: //Ele Form Air
			spell_id = AA_Choose3(activate_val, 2789, 2790, 2791);
			timer_base = 900;
			break;
//aaImprovedReclaimEnergy
			
		case aaTurnSummoned: //Turn Summoned
			spell_id = AA_Choose3(activate_val, 2779, 2780, 2781);
			//On WR was: spell_id = AA_Choose3(activate_val, 2692, 2693, 2694);
			timer_base = 4320;	//2160?
			target = aaTargetCurrent;
			break;
			
		case aaLifeBurn: //Lifeburn
			spell_id = 2755;
			timer_base = 8640;	//4320?
			target = aaTargetCurrent;
			break;
			
		case aaDeadMesmerization: //Dead Mez
			spell_id = 2756;	//2706?
			timer_base = 4320;	//2160?
			target = aaTargetCurrent;
			break;
			
		case aaFearstorm: //Fearstorm
			spell_id = 2757;	//2707?
			timer_base = 4320;	//2160?
			target = aaTargetCurrent;	//?
			break;
			
		case aaFleshToBone:
			spell_id = 2772;	//3452?
			timer_base = 7;
			break;
			
		case aaCallToCorpse:
			spell_id = 2764;
			timer_base = 4320;	//2160?
			target = aaTargetCurrent;
			break;
			
		case aaDivineStun: //Divine Stun
			//is this really supposed to be spell based?
			spell_id = 2190;	//3284?
			timer_base = 30;
			target = aaTargetCurrent;
			dedux = GetAA(aaRushtoJudgement)*23;
			break;
//aaSlayUndead
			
		case aaActOfValor: //Act of Valor
			spell_id = 2775;
			timer_base = 4320;
			
			target = aaTargetCurrent;
			
			//does the spell do this for us?
			if(GetTarget() != NULL) {
				int heal = GetHP();
				int curhp = GetTarget()->GetHP();
				GetTarget()->SetHP(heal+curhp);
				Death(this,0,0,0);
			}
			
			break;
			
		case aaHolySteed: 
			spell_id = 2871;
			timer_base = 0;
			break;
			
		case aaInnateCamouflage: //Innate Camo
			spell_id = 2765;
			timer_base = 7;
			break;
			
		case aaUnholySteed: 
			spell_id = 2918;
			timer_base = 0;
			break;
			
		case aaImprovedHarmTouch:
			Message(0,"Sorry Improved harmtouch not working YET");
			timer_base = 4320;
			target = aaTargetCurrent;
			break;
			
		case aaLeechTouch: //Leech Touch
			spell_id = 2766;	//610?
			timer_base = 4320;
			target = aaTargetCurrent;
			break;
//aaDeathPeace
//aaSoulAbrasion
//aaJamFest
//aaSonicCall
//aaCriticalMend
			
		case aaPurifyBody: //Purify Body
			dedux = 10*GetAA(aaHastenedPurificationoftheBody);
			spell_id = 2190;	//1470?
			timer_base = 4320;
			break;
			
		case aaEscape: //Escape
			dedux = 10*(GetAA(aaHastyExit) + GetAA(aaImprovedHastyExit));
			timer_base = 4320;
			//I dont know which is better:
			//Escape();
			//or:
			spell_id = 5244;
			break;
			
		case aaPurgePoison:
			dedux = 10*GetAA(aaHastenedPurification);
			//m_pp.aa_active[0] = 1;	//WR method...
			spell_id = 5232;
			timer_base = 4320;
			break;
			
		case aaRampage:
			EnableAAEffect(aaEffectRampage, 1000);
			act_timer = 10000;
			timer_base = 600;
			dedux = 10*GetAA(aaFuriousRampage);
			//I dont think this is complete... attack needs to check aaEffectRampage
			//or something else needs to be done.
			if(GetTarget() == NULL) {
				Message(0, "A target is required for this skill.");
				return;
			}
			Attack(GetTarget(), 13, false);
			break;
			
		case aaAreaTaunt: //AE Taunt
//			entity_list.AETaunt(this);
			timer_base = 900;
			dedux = 10*GetAA(aaHastenedInstigation);
			break;
			
		case aaWarcry: //Warcry
			spell_id = AA_Choose3(activate_val, 5229, 5230, 5231);
			//On WR was: spell_id = AA_Choose3(activate_val, 1930, 1931, 1932);
			timer_base = 2160;
			target = aaTargetGroup;
			break;
			
		case aaStrongRoot:
			dedux = 10*GetAA(aaHastenedRoot);
			spell_id = 2748;
			timer_base = 2160;
			target = aaTargetCurrent;
			break;
			
		case aaHobbleofSpirits: //Hobble of Spirits
			spell_id = 3290;
			timer_base = 300;
			target = aaTargetPet;
			break;
			
		case aaFrenzyofSpirit: //Frenzy of Spirit
			spell_id = 3289;
			timer_base = 720;
			target = aaTargetPet;
			break;
			
		case aaParagonofSpirit: //Paragon of Spirit
			spell_id = 3291;
			timer_base = 900;
			target = aaTargetPet;
			break;
			
		case aaRadiantCure:
			spell_id = AA_Choose3(activate_val, 3297, 3298, 3299);
			//On WR was: spell_id = AA_Choose3(activate_val, 1982, 1983, 1984);
			dedux = 10*GetAA(aaQuickenedCuring);
			timer_base = 180;
			target = aaTargetCurrent;
			break;
			
		case aaDivineArbitration: //Divine Arbitration
			spell_id = AA_Choose3(activate_val, 3252, 3253, 3254);
			//On WR was: spell_id = AA_Choose3(activate_val, 2014, 2015, 2017);
			timer_base = 180;
			target = aaTargetCurrent;
			break;
			
		case aaWrathoftheWild:
			spell_id = AA_Choose3(activate_val, 3255, 3256, 3257);
			//On WR was: spell_id = AA_Choose3(activate_val, 2264, 2265, 2267);
			timer_base = 240;
			break;
			
		case aaVirulentParalysis:
			spell_id = AA_Choose3(activate_val, 3274, 3275, 3276);
			timer_base = 120;
			target = aaTargetCurrent;
			break;
			
		case aaHarvestofDruzzil:
			spell_id = 3338;	//2747?
			timer_base = 480;
			break;
			
		case aaEldritchRune: //Guarding Rune
			spell_id = AA_Choose3(activate_val, 3258, 3259, 3260);
			target = aaTargetCurrent;
			timer_base = 600;
			break;
			
		case aaDeathPeace:
			spell_id = 611;		//wrong
			timer_base = 4320;
			target = aaTargetCurrent;
			break;
		
		case aaServantofRo:
			spell_id = AA_Choose3(activate_val, 3265, 3266, 3267);
			timer_base = 540;
			break;
		
		case aaWaketheDead:
			spell_id = AA_Choose3(activate_val, 3268, 3269, 3270);
			timer_base = 540;
			break;
			
//I dunno about this one...
		case aaSuspendedMinion:	
			if (GetPet()) {
				
				target = aaTargetPet;
				//dunno if we need to cast a spell..
				switch (activate_val) {
					case 1:
						spell_id = 3248;
						break;
					case 2:
						spell_id = 3249;
						break;
				}
				
				Message(0,"You call your pet to your side.");
				GetPet()->WipeHateList();
				GetPet()->GMMove(GetX(),GetY(),GetZ());
				if (activate_val > 1)
					entity_list.ClearFeignAggro(GetPet());
			} else {
				Message(0,"You have no pet to call.");
			}
			timer_base = 1;
			break;
		
		case aaSpiritCall:
			spell_id = AA_Choose3(activate_val, 3283, 3284, 3285);
			timer_base = 720;
			break;
			
		case aaHandofPiety: //Hand of Piety
			spell_id = AA_Choose3(activate_val, 3261, 3262, 3263);
			timer_base = 2160;
			dedux = 10*GetAA(aaHastenedPiety);
			target = aaTargetCurrentGroup;
			break;
			
		case aaGuardianoftheForest: //Guardian of the Forest
			spell_id = AA_Choose3(activate_val, 3271, 3272, 3273);
			timer_base = 900;	//2160?
			break;
			
		case aaSpiritoftheWood:
			spell_id = AA_Choose3(activate_val, 3277, 3278, 3279);
			timer_base = 1320;
			target = aaTargetCurrent;
			break;
			
		case aaBoastfulBellow:
			spell_id = 3282;
			timer_base = 18;
			target = aaTargetCurrent;
			break;
			
		case aaHostoftheElements:
			spell_id = AA_Choose3(activate_val, 3286, 3287, 3288);
			timer_base = 1320;
			break;
			
		case aaCallofXuzl:
			spell_id = AA_Choose3(activate_val, 3292, 3293, 3294);
			timer_base = 900;
			break;
		
		case aaFadingMemories:
			Message(0,"Sorry Fading Memories not working YET");
			use_mana = 900;
			spell_id = 5243;	//?
			//Escape();
			timer_base = 1;
			break;
			
		case aaProjectIllusion:
			Message(0,"Sorry, Project Illusion not working YET");
			timer_base = 1;
			break;
			
		case aaEntrap:
			spell_id = 3614;
			timer_base = 5;
			target = aaTargetCurrent;
			break;
			
		case aaManaBurn2:	//another mana burn?
			spell_id = 2751;
			timer_base = 8640;
			break;
			
		case aaBeastialAlignment:
			switch(GetBaseRace()) {
				case BARBARIAN:
					spell_id = AA_Choose3(activate_val, 4521, 4522, 4523);
					break;
				case TROLL:
					spell_id = AA_Choose3(activate_val, 4524, 4525, 4526);
					break;
				case OGRE:
					spell_id = AA_Choose3(activate_val, 4527, 4527, 4529);
					break;
				case IKSAR:
					spell_id = AA_Choose3(activate_val, 4530, 4531, 4532);
					break;
				case VAHSHIR:
					spell_id = AA_Choose3(activate_val, 4533, 4534, 4535);
					break;
			}
			timer_base = 4320;
			Message(0,"Sorry Bestial Alignment not working YET");
			break;
			
		case aaFeralSwipe:
			Message(0,"Sorry, Feral Swipe not working YET");
			spell_id = 4788;
			timer_base = 60;
			break;
			
		case aaDivineAvatar:
			spell_id = AA_Choose3(activate_val, 4549, 4550, 4551);
			Message(0,"Sorry, Divine Avatar not working YET");
			timer_base = 7200;
			break;
			
		case aaExquisiteBenediction:
			spell_id = AA_Choose5(activate_val, 4790, 4791, 4792, 4793, 4794);
			Message(0,"Sorry Equisite Benediction not working YET");
			timer_base = 1800;
			break;
			
		case aaNaturesBoon:
			spell_id = AA_Choose5(activate_val, 4796, 4797, 4798, 4799, 4800);
			Message(0,"Sorry Natures Boon not working YET");
			timer_base = 1800;
			break;
			
		case aaDoppelganger:
			spell_id = AA_Choose3(activate_val, 4552, 4553, 4554);
			Message(0,"Sorry Doppelganer not working YET");
			timer_base = 4320;
			break;
			
		case aaSharedHealth:
			Message(0,"Sorry Shared Health not working YET");
			timer_base = 900;
			target = aaTargetPet;
			break;
			
		case aaDestructiveForce:
			Message(0,"Sorry Destructive Force not working YET");  
			timer_base = 3600;
			target = aaTargetCurrent;
			break;
			
		case aaSwarmofDecay:
			spell_id = AA_Choose3(activate_val, 4564, 4565, 4566);
			Message(0,"Sorry Swarm of Decay not working YET");
			timer_base = 1800;
			break;
			
		case aaRadiantCure2:	//dont know whats different about this one...
			spell_id = AA_Choose3(activate_val, 3297, 3298, 3299);
			//was spell_id = AA_Choose3(activate_val, 1982, 1983, 1984);
			dedux = 10*GetAA(aaQuickenedCuring);
			timer_base = 180;
			target = aaTargetCurrent;
			break;
			
		case aaPurification:
			spell_id = 2742;	//wrong
			timer_base = 4320;
			Message(0,"Sorry, Purification not working, enjoy your self only purify soul");
			break;
			
		case aaFlamingArrows:
			timer_base = 4320;
			Message(0,"Sorry Flaming Arrows not working YET");
			break;
			
		case aaFrostArrows:
			timer_base = 4320;
			Message(0,"Sorry Frost Arrows not working YET");
			break;
			
		case aaCalloftheAncients:
			spell_id = AA_Choose5(activate_val, 4828, 4829, 4830, 4831, 4832);
			Message(0,"Sorry Call of the Ancients not working YET");
			timer_base = 1800;
			break;
			
		case aaWarlordsTenacity:
			spell_id = AA_Choose3(activate_val, 4925, 4926, 4927);
			timer_base = 3600;
			break;
			
		case aaRosFlamingFamiliar:
			spell_id = 4833;
			timer_base = 60;
			Message(0,"Sorry Ro's Flaming Familiar not working YET");
			break;
			
		case aaEcisIcyFamiliar:
			spell_id = 4834;
			timer_base = 60;
			Message(0,"Sorry Eci's Icy Familiar not working YET");
			break;
			
		case aaDruzzilsMysticalFamiliar:
			spell_id = 4835;
			timer_base = 60;
			Message(0,"Sorry Druzzil's Mystical Familiar not working YET");
			break;
			
		case aaWardofDestruction:
			spell_id = AA_Choose5(activate_val, 4836, 4837, 4838, 4839, 4840);
			timer_base = 1800;
			Message(0,"Sorry Ward of Destruction not working YET");
			break;
			
		case aaFrenziedDevistation:
			spell_id = AA_Choose3(activate_val, 5245, 5246, 5247);
			timer_base = 4320;
			Message(0,"Sorry Frenzied Devastation not working YET");
			break;
*/
