/*  EQEMu:  Everquest Server Emulator
Copyright (C) 2001-2002  EQEMu Development Team (http://eqemu.org)

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
#include <string>
#include <cctype>
using namespace std;
#include <math.h>
#include "../common/moremath.h"
#include <stdio.h>
#include "../common/packet_dump_file.h"
#include "zone.h"
#ifdef WIN32
#define snprintf	_snprintf
#define strncasecmp	_strnicmp
#define strcasecmp  _stricmp
#else
#include <stdlib.h>
#include <pthread.h>
#endif

#include "npc.h"
#include "map.h"
#include "entity.h"
#include "masterentity.h"
#include "spdat.h"
#include "../common/bodytypes.h"
#include "spawngroup.h"
#include "../common/MiscFunctions.h"
#include "../common/rulesys.h"

//#define SPELLQUEUE //Use only if you want to be spammed by spell testing


extern Zone* zone;
extern volatile bool ZoneLoaded;
extern EntityList entity_list;
#if !defined(NEW_LoadSPDat) && !defined(DB_LoadSPDat)
	extern SPDat_Spell_Struct spells[SPDAT_RECORDS];
#endif

#ifdef EMBPERL
#include "embparser.h"
#endif

NPC::NPC(const NPCType* d, Spawn2* in_respawn, float x, float y, float z, float heading, int iflymode, bool IsCorpse)
: Mob(d->name,
	  d->lastname,
	  d->max_hp,
	  d->max_hp,
	  d->gender,
	  d->race,
	  d->class_,
      (bodyType)d->bodytype,
	  d->deity,
	  d->level,
	  d->npc_id,
	  d->size,
	  d->runspeed,
	  heading,
	  x,
	  y,
	  z,
	  d->light,
	  d->texture,
	  d->helmtexture,
	  d->AC,
	  d->ATK,
	  d->STR,
	  d->STA,
	  d->DEX,
	  d->AGI,
	  d->INT,
	  d->WIS,
	  d->CHA,
	  d->haircolor,
	  d->beardcolor,
	  d->eyecolor1,
	  d->eyecolor2,
	  d->hairstyle,
	  d->luclinface,
	  d->beard,
	  d->drakkin_heritage,
	  d->drakkin_tattoo,
	  d->drakkin_details,
	  (int32*)d->armor_tint,
	  0,
	  d->see_invis,			// pass see_invis/see_ivu flags to mob constructor
	  d->see_invis_undead,
	  d->see_hide,
	  d->see_improved_hide,
	  d->hp_regen,
	  d->mana_regen,
	  d->qglobal,
	  d->slow_mitigation,
	  d->maxlevel,
	  d->scalerate ),
	attacked_timer(CombatEventTimer_expire),
	swarm_timer(100),
	classattack_timer(1000),
	knightattack_timer(1000),
	assist_timer(AIassistcheck_delay),
	sendhpupdate_timer(1000),
	enraged_timer(1000),
	taunt_timer(TauntReuseTime * 1000),
	qglobal_purge_timer(30000)
{
	//What is the point of this, since the names get mangled..
	Mob* mob = entity_list.GetMob(name);
	if(mob != 0)
		entity_list.RemoveEntity(mob->GetID());

	int moblevel=GetLevel();
	
	NPCTypedata = d;
	NPCTypedata_ours = NULL;
	respawn2 = in_respawn;
	swarm_timer.Disable();
	
	taunting = false;
	proximity = NULL;
	copper = 0;
	silver = 0;
	gold = 0;
	platinum = 0;
	max_dmg=d->max_dmg;
	min_dmg=d->min_dmg;
	grid = 0;
	wp_m = 0;
	max_wp=0;
	save_wp = 0;
	spawn_group = 0;
// for quest signal() command
	signaled = false;
	signal_id = 0;
    guard_x = 0;
	guard_y = 0;
	guard_z = 0;
	guard_heading = 0;
	swarmInfoPtr = NULL;

//	SaveSpawnSpot();

	logging_enabled = NPC_DEFAULT_LOGGING_ENABLED;
	
	pAggroRange = d->aggroradius;
	pAssistRange = GetAggroRange();
	findable = d->findable;
	trackable = d->trackable;

    MR = d->MR;
    CR = d->CR;
    DR = d->DR;
    FR = d->FR;
    PR = d->PR;

	STR = d->STR;
	STA = d->STA;
	AGI = d->AGI;
	DEX = d->DEX;
	INT = d->INT;
	WIS = d->WIS;
	CHA = d->CHA;

	//quick fix of ordering if they screwed it up in the DB
	if(max_dmg < min_dmg) {
		int tmp = min_dmg;
		min_dmg = max_dmg;
		max_dmg = tmp;
	}

	// Max Level and Stat Scaling if maxlevel is set
	if(maxlevel > level)
	{
		LevelScale();
		}

	// Set Resists if they are 0 in the DB
	CalcNPCResists();
	
	// Set Mana and HP Regen Rates if they are 0 in the DB
	CalcNPCRegen();
	
	// Set Min and Max Damage if they are 0 in the DB
	if(max_dmg == 0){
		CalcNPCDamage();
	}	
	
	accuracy_rating = d->accuracy_rating;
	ATK = d->ATK;

    CalcMaxMana();
    SetMana(GetMaxMana());

	MerchantType=d->merchanttype; // Yodason: merchant stuff
	adventure_template_id = d->adventure_template;
	org_x = x;
	org_y = y;
	org_z = z;
	flymode = iflymode;
	guard_x = -1;	//just some value we might be able to recongize as "unset"
	guard_y = -1;
	guard_z = -1;
	guard_heading = 0;
	roambox_distance = 0;
	roambox_max_x = -2;
	roambox_max_y = -2;
	roambox_min_x = -2;
	roambox_min_y = -2;
	roambox_movingto_x = -2;
	roambox_movingto_y = -2;
	roambox_delay = 1000;
	org_heading = heading;	
	p_depop = false;
	loottable_id = d->loottable_id;	

	primary_faction = 0;
	SetNPCFactionID(d->npc_faction_id);

	npc_spells_id = 0;
	HasAISpell = false;
	
	pet_spell_id = 0;
	
	delaytimer = false;
	combat_event = false;
	attack_speed = d->attack_speed;

	EntityList::RemoveNumbers(name);
#ifdef IPC
	if(!IsInteractive())
		entity_list.MakeNameUnique(name);
#else

#ifdef EQBOTS
// creates the bot with a clean name
	if (!IsBot())
#endif //EQBOTS

    entity_list.MakeNameUnique(name);
#endif

	npc_aggro = d->npc_aggro;

	AI_Start();

	d_meele_texture1 = d->d_meele_texture1;
	d_meele_texture2 = d->d_meele_texture2;
	memset(equipment, 0, sizeof(equipment));
	prim_melee_type = d->prim_melee_type;
	sec_melee_type = d->sec_melee_type;

	// If Melee Textures are not set, set attack type to Hand to Hand as default
	if(!d_meele_texture1)
		prim_melee_type = 28;
	if(!d_meele_texture2)
		sec_melee_type = 28;
	//give NPCs skill values...
	int r;
	for(r = 0; r <= HIGHEST_SKILL; r++) {
		skills[r] = database.GetSkillCap(GetClass(),(SkillType)r,moblevel);
	}

	if(d->trap_template > 0)
	{
		std::map<uint32,std::list<LDoNTrapTemplate*> >::iterator trap_ent_iter; 
		std::list<LDoNTrapTemplate*> trap_list;

		trap_ent_iter = zone->ldon_trap_entry_list.find(d->trap_template);
		if(trap_ent_iter != zone->ldon_trap_entry_list.end())
		{
			trap_list = trap_ent_iter->second;
			if(trap_list.size() > 0)
			{
				int16 count = MakeRandomInt(0, (trap_list.size()-1));
				std::list<LDoNTrapTemplate*>::iterator trap_list_iter = trap_list.begin();
				for(int x = 0; x < count; ++x)
				{
					trap_list_iter++;
				}
				LDoNTrapTemplate* tt = (*trap_list_iter);
				if(tt)
				{
					if((int8)tt->spell_id > 0)
					{
						ldon_trapped = true;
						ldon_spell_id = tt->spell_id;
					}
					else
					{
						ldon_trapped = false;
						ldon_spell_id = 0;
					}

					ldon_trap_type = (int8)tt->type;
					if(tt->locked > 0)
					{
						ldon_locked = true;
						ldon_locked_skill = tt->skill;
					}
					else
					{
						ldon_locked = false;
						ldon_locked_skill = 0;
					}
					ldon_trap_detected = 0;
				}
			}
			else
			{
				ldon_trapped = false;
				ldon_trap_type = 0;
				ldon_spell_id = 0;
				ldon_locked = false;
				ldon_locked_skill = 0;
				ldon_trap_detected = 0;
			}
		}
		else
		{
			ldon_trapped = false;
			ldon_trap_type = 0;
			ldon_spell_id = 0;
			ldon_locked = false;
			ldon_locked_skill = 0;
			ldon_trap_detected = 0;
		}
	}
	else
	{
		ldon_trapped = false;
		ldon_trap_type = 0;
		ldon_spell_id = 0;
		ldon_locked = false;
		ldon_locked_skill = 0;
		ldon_trap_detected = 0;
	}
	qGlobals = NULL;
	InitializeBuffSlots();
}
	  
NPC::~NPC()
{
	entity_list.RemoveNPC(GetID());
	AI_Stop();

	if(proximity != NULL) {
		entity_list.RemoveProximity(GetID());
		safe_delete(proximity);
	}

	//clear our spawn limit record if we had one.
	entity_list.LimitRemoveNPC(this);
	
	safe_delete(NPCTypedata_ours);
 #ifdef IPC	  
	if(IsInteractive())
	{
	    Group* group = entity_list.GetGroupByMob(this);
		if(group != 0)
		{
		    group->DelMember(this);
	    }
    }
#endif
	
	{
	ItemList::iterator cur,end;
	cur = itemlist.begin();
	end = itemlist.end();
	for(; cur != end; cur++) {
		ServerLootItem_Struct* item = *cur;
		safe_delete(item);
	}
	itemlist.clear();
	}
	
	{
	list<struct NPCFaction*>::iterator cur,end;
	cur = faction_list.begin();
	end = faction_list.end();
	for(; cur != end; cur++) {
		struct NPCFaction* fac = *cur;
		safe_delete(fac);
	}
	faction_list.clear();
	}

	safe_delete(swarmInfoPtr);
	safe_delete(qGlobals);
	UninitializeBuffSlots();
}

void NPC::SetTarget(Mob* mob) {
	if(mob == GetTarget())		//dont bother if they are allready our target
		return;
	
	//our target is already set, do not turn from the course, unless our current target is dead.
	if(GetSwarmInfo() && GetTarget() && (GetTarget()->GetHP() > 0)) {
		Mob *targ = entity_list.GetMob(GetSwarmInfo()->target);
		if(targ != mob){
			return;
		}
	}

	if (mob) {
		SetAttackTimer();
	} else {
		ranged_timer.Disable();
		//attack_timer.Disable();
		attack_dw_timer.Disable();
	}
	//CastToMob()->SetTarget(mob);
	Mob::SetTarget(mob);
}

ServerLootItem_Struct* NPC::GetItem(int slot_id) {
	ItemList::iterator cur,end;
	cur = itemlist.begin();
	end = itemlist.end();
	for(; cur != end; cur++) {
		ServerLootItem_Struct* item = *cur;
		if (item->equipSlot == slot_id) {
			return item;
		}
	}
	return(NULL);
}

#ifdef EQBOTS

uint32 NPC::GetItemID(int slot_id) {
	ItemList::iterator cur,end;
	cur = itemlist.begin();
	end = itemlist.end();
	for(; cur != end; cur++) {
		ServerLootItem_Struct* item = *cur;
		if (item->lootslot == slot_id) {
			return item->item_id;
		}
	}
	return(NULL);
}

#endif //EQBOTS
	  
void NPC::RemoveItem(uint32 item_id, int16 quantity, int16 slot) {
	ItemList::iterator cur,end;
	cur = itemlist.begin();
	end = itemlist.end();
	for(; cur != end; cur++) {
		ServerLootItem_Struct* item = *cur;
		if (item->item_id == item_id && slot <= 0 && quantity <= 0) {
			itemlist.erase(cur);
			return;
		}
		else if (item->item_id == item_id && item->equipSlot == slot  && quantity >= 1) {
			//cout<<"NPC::RemoveItem"<<" equipSlot:"<<iterator.GetData()->equipSlot<<" quantity:"<< quantity<<endl;
			if (item->charges <= quantity)
				itemlist.erase(cur);
			else
				item->charges -= quantity;
			return;
		}
	}
}
	  
void NPC::ClearItemList() {
	ItemList::iterator cur,end;
	cur = itemlist.begin();
	end = itemlist.end();
	for(; cur != end; cur++) {
		ServerLootItem_Struct* item = *cur;
		safe_delete(item);
	}
	itemlist.clear();
}
	  
void NPC::QueryLoot(Client* to) {
	int x = 0;
	to->Message(0, "Coin: %ip %ig %is %ic", platinum, gold, silver, copper);

	ItemList::iterator cur,end;
	cur = itemlist.begin();
	end = itemlist.end();
	for(; cur != end; cur++) {
		const Item_Struct* item = database.GetItem((*cur)->item_id);
		if (item)
			if (to->GetClientVersion() >= EQClientSoF)
			{
				to->Message(0, "  %i: %c%06X00000000000000000000000000000000000000000000%s%c",(int) item->ID,0x12, item->ID, item->Name, 0x12);
			}
			else
			{
				to->Message(0, "  %i: %c%06X000000000000000000000000000000000000000%s%c",(int) item->ID,0x12, item->ID, item->Name, 0x12);
			}
		else
		    LogFile->write(EQEMuLog::Error, "Database error, invalid item");
		x++;
	}
	to->Message(0, "%i items on %s.", x, GetName());
}

void NPC::AddCash(int16 in_copper, int16 in_silver, int16 in_gold, int16 in_platinum) {
	copper = in_copper;
	silver = in_silver;
	gold = in_gold;
	platinum = in_platinum;
}
	  
void NPC::AddCash() {
	copper = (rand() % 100)+1;
	silver = (rand() % 50)+1;
	gold = (rand() % 10)+1;
	platinum = (rand() % 5)+1;
}
	  
void NPC::RemoveCash() {
	copper = 0;
	silver = 0;
	gold = 0;
	platinum = 0;
}

bool NPC::Process()
{
	_ZP(NPC_Process);
	
    adverrorinfo = 1;
	if (IsStunned() && stunned_timer.Check())
    {
        this->stunned = false;
        this->stunned_timer.Disable();
    }

    if (p_depop)
    {
        Mob* owner = entity_list.GetMob(this->ownerid);
        if (owner != 0)
        {
        	//if(GetBodyType() != BT_SwarmPet)
	        //    owner->SetPetID(0);
			this->ownerid = 0;
            this->petid = 0;
        }
        return false;
    }

    adverrorinfo = 2;
    
    SpellProcess();
    
    if (tic_timer.Check()) 
	{
		BuffProcess();
		
		if(curfp)
			ProcessFlee();
		
		int32 bonus = 0;
		
		if(GetAppearance() == eaSitting)
			bonus+=3;
		
		sint32 OOCRegen = 0;
		if(oocregen > 0){ //should pull from Mob class
			OOCRegen += GetMaxHP() * oocregen / 100;
			}
		//Lieka Edit:  Fixing NPC regen.  NPCs should regen to full during a set duration, not based on their HPs.  Increase NPC's HPs by % of total HPs / tick.
		if((GetHP() < GetMaxHP()) && !IsPet()) {
			if(!IsEngaged()) {//NPC out of combat
				if(hp_regen > OOCRegen)
					SetHP(GetHP() + hp_regen);
				else
					SetHP(GetHP() + OOCRegen);
			} else
				SetHP(GetHP()+hp_regen);
		} else if(GetHP() < GetMaxHP() && GetOwnerID() !=0) {
			if(!IsEngaged()) //pet
				SetHP(GetHP()+hp_regen+bonus+(GetLevel()/5));
			else
				SetHP(GetHP()+hp_regen+bonus);
		} else 
			SetHP(GetHP()+hp_regen);

		if(GetMana() < GetMaxMana()) {
			SetMana(GetMana()+mana_regen+bonus);
		}

		Mob *o = GetOwner();
		if(o && o->IsClient())
		{
			if(!p_depop)
			{
				Client *c = o->CastToClient();
				AdventureDetails *ad = c->GetCurrentAdventure();
				if(ad && ad->ai)
				{
					if(ad->ai->type == Adventure_Rescue)
					{
						if(GetNPCTypeID() == ad->ai->type_data)
						{
							float xDiff = ad->ai->dest_x - GetX();
							float yDiff = ad->ai->dest_y - GetY();
							float zDiff = ad->ai->dest_z - GetZ();
							float dist = ((xDiff * xDiff) + (yDiff * yDiff) + (zDiff * zDiff));
							if(dist < RuleR(Adventure, DistanceForRescueComplete))
							{
								zone->UpdateAdventureCount(ad);
								Say("You don't know what this means to me. Thank you so much for finding and saving me from"
									" this wretched place. I'll find my way from here.");
								Depop();
							}
						}
					}
				}
			}
		}
    }

	if (sendhpupdate_timer.Check() && (IsTargeted() || (IsPet() && GetOwner() && GetOwner()->IsClient()))) {
		if(!IsFullHP || cur_hp<max_hp){
			SendHPUpdate();
		}
	}
		  
    if (IsStunned()||IsMezzed())
	    return true;
	
	if (enraged_timer.Check()){
		ProcessEnrage();
	}
	
	//Handle assists...
	if(assist_timer.Check() && !Charmed() && GetTarget() != NULL) {
		entity_list.AIYellForHelp(this, GetTarget());
	}
	
	/// Angelox: This was making the bots walk back to their original spawn spot when Bot Guard was issued.
/*	if(qGlobals)
	{
		if(qglobal_purge_timer.Check())
		{
			qGlobals->PurgeExpiredGlobals();
		}
	}
*/
#ifdef EQBOTS
    //Franck-add: EQoffline. If a bot spawns, it must use a special AI wich differs to standard NPC
	if(IsBot())
		BOT_Process();
	else if(IsPet() && GetOwner() && GetOwner()->IsBot())
		PET_Process();
	else
#endif //EQBOTS
	AI_Process();
	
    return true;
}

int32 NPC::CountLoot() {
	return(itemlist.size());
}

void NPC::DumpLoot(int32 npcdump_index, ZSDump_NPC_Loot* npclootdump, int32* NPCLootindex) {
	ItemList::iterator cur,end;
	cur = itemlist.begin();
	end = itemlist.end();
	for(; cur != end; cur++) {
		ServerLootItem_Struct* item = *cur;
		npclootdump[*NPCLootindex].npc_dump_index = npcdump_index;
		npclootdump[*NPCLootindex].itemid = item->item_id;
		npclootdump[*NPCLootindex].charges = item->charges;
		npclootdump[*NPCLootindex].equipSlot = item->equipSlot;
		(*NPCLootindex)++;
	}
	ClearItemList();
}

void NPC::Depop(bool StartSpawnTimer) {
	p_depop = true;
	if (StartSpawnTimer) {
		if (respawn2 != 0) {
			respawn2->Reset();
		}
	}
}

bool NPC::DatabaseCastAccepted(int spell_id) {
	for (int i=0; i < 12; i++) {
		switch(spells[spell_id].effectid[i]) {
		case SE_Stamina: {
			if(IsEngaged() && GetHPRatio() < 100)
				return true;
			else
				return false;
			break;
						 }
		case SE_CurrentHPOnce:
		case SE_CurrentHP: {
			if(this->GetHPRatio() < 100 && spells[spell_id].buffduration == 0)
				return true;
			else
				return false;
			break;
						   }
			
		case SE_HealOverTime: {
			if(this->GetHPRatio() < 100)
				return true;
			else
				return false;
			break;
							  }
		case SE_DamageShield: {
			return true;
							  }
		case SE_NecPet:
		case SE_SummonPet: {
			if(GetPet()){
#ifdef SPELLQUEUE
				printf("%s: Attempted to make a second pet, denied.\n",GetName());
#endif
				return false;
			}
			break;
						   }
		case SE_LocateCorpse:
		case SE_SummonCorpse: {
			return false; //Pfft, npcs don't need to summon corpses/locate corpses!
			break;
						}
		default:
			if(spells[spell_id].goodEffect == 1 && !(spells[spell_id].buffduration == 0 && this->GetHPRatio() == 100) && !IsEngaged())
				return true;
			return false;
		}
	}
	return false;
}

NPC* NPC::SpawnNPC(const char* spawncommand, float in_x, float in_y, float in_z, float in_heading, Client* client) {
	if(spawncommand == 0 || spawncommand[0] == 0) {
		return 0;
	}
	else {
		Seperator sep(spawncommand);
		//Lets see if someone didn't fill out the whole #spawn function properly 
		if (!sep.IsNumber(1))
			sprintf(sep.arg[1],"1"); 
		if (!sep.IsNumber(2))
			sprintf(sep.arg[2],"1"); 
		if (!sep.IsNumber(3))
			sprintf(sep.arg[3],"0");
		if (atoi(sep.arg[4]) > 2100000000 || atoi(sep.arg[4]) <= 0)
			sprintf(sep.arg[4]," ");
		if (!strcmp(sep.arg[5],"-"))
			sprintf(sep.arg[5]," "); 
		if (!sep.IsNumber(5))
			sprintf(sep.arg[5]," "); 
		if (!sep.IsNumber(6))
			sprintf(sep.arg[6],"1");
		if (!sep.IsNumber(8))
			sprintf(sep.arg[8],"0");
		if (!sep.IsNumber(9))
			sprintf(sep.arg[9], "0");
		if (!sep.IsNumber(7))
			sprintf(sep.arg[7],"0");
		if (!strcmp(sep.arg[4],"-"))
			sprintf(sep.arg[4]," "); 
		if (!sep.IsNumber(10))	// bodytype
			sprintf(sep.arg[10], "0");
		//Calc MaxHP if client neglected to enter it...
		if (!sep.IsNumber(4)) {
			//Stolen from Client::GetMaxHP...
			int8 multiplier = 0;
			int tmplevel = atoi(sep.arg[2]);
			switch(atoi(sep.arg[5]))
			{
			case WARRIOR:
				if (tmplevel < 20)
					multiplier = 22;
				else if (tmplevel < 30)
					multiplier = 23;
				else if (tmplevel < 40)
					multiplier = 25;
				else if (tmplevel < 53)
					multiplier = 27;
				else if (tmplevel < 57)
					multiplier = 28;
				else 
					multiplier = 30;
				break;
				
			case DRUID:
			case CLERIC:
			case SHAMAN:
				multiplier = 15;
				break;
				
			case PALADIN:
			case SHADOWKNIGHT:
				if (tmplevel < 35)
					multiplier = 21;
				else if (tmplevel < 45)
					multiplier = 22;
				else if (tmplevel < 51)
					multiplier = 23;
				else if (tmplevel < 56)
					multiplier = 24;
				else if (tmplevel < 60)
					multiplier = 25;
				else
					multiplier = 26;
				break;
				
			case MONK:
			case BARD:
			case ROGUE:
				//		case BEASTLORD:
				if (tmplevel < 51)
					multiplier = 18;
				else if (tmplevel < 58)
					multiplier = 19;
				else
					multiplier = 20;				
				break;
				
			case RANGER:
				if (tmplevel < 58)
					multiplier = 20;
				else
					multiplier = 21;			
				break;
				
			case MAGICIAN:
			case WIZARD:
			case NECROMANCER:
			case ENCHANTER:
				multiplier = 12;
				break;
				
			default:
				if (tmplevel < 35)
					multiplier = 21;
				else if (tmplevel < 45)
					multiplier = 22;
				else if (tmplevel < 51)
					multiplier = 23;
				else if (tmplevel < 56)
					multiplier = 24;
				else if (tmplevel < 60)
					multiplier = 25;
				else
					multiplier = 26;
				break;
			}
			sprintf(sep.arg[4],"%i",5+multiplier*atoi(sep.arg[2])+multiplier*atoi(sep.arg[2])*75/300);
		}
		
		// Autoselect NPC Gender... (Scruffy)
		if (sep.arg[5][0] == 0) {
			sprintf(sep.arg[5], "%i", (int) Mob::GetDefaultGender(atoi(sep.arg[1])));
		}
		
		if (client) {
			// Well we want everyone to know what they spawned, right? 
			client->Message(0, "New spawn:");
			client->Message(0, "Name: %s",sep.arg[0]);
			client->Message(0, "Race: %s",sep.arg[1]);
			client->Message(0, "Level: %s",sep.arg[2]);
			client->Message(0, "Material: %s",sep.arg[3]);
			client->Message(0, "Current/Max HP: %s",sep.arg[4]);
			client->Message(0, "Gender: %s",sep.arg[5]);
			client->Message(0, "Class: %s",sep.arg[6]);
			
			client->Message(0, "Weapon Item Number: %s/%s",sep.arg[7],sep.arg[8]);
			client->Message(0, "MerchantID: %s",sep.arg[9]);
			client->Message(0, "Bodytype: %s",sep.arg[10]);
		}
		//Time to create the NPC!! 
		NPCType* npc_type = new NPCType;
		memset(npc_type, 0, sizeof(NPCType));
		
		strcpy(npc_type->name,sep.arg[0]);
		npc_type->cur_hp = atoi(sep.arg[4]); 
		npc_type->max_hp = atoi(sep.arg[4]); 
		npc_type->race = atoi(sep.arg[1]);
		npc_type->gender = atoi(sep.arg[5]); 
		npc_type->class_ = atoi(sep.arg[6]); 
		npc_type->deity= 1;
		npc_type->level = atoi(sep.arg[2]);
		npc_type->npc_id = 0;
		npc_type->loottable_id = 0;
		npc_type->texture = atoi(sep.arg[3]);
		npc_type->light = 0;
		npc_type->runspeed = 1.25;
		npc_type->d_meele_texture1 = atoi(sep.arg[7]);
		npc_type->d_meele_texture2 = atoi(sep.arg[8]);
		npc_type->merchanttype = atoi(sep.arg[9]);	
		npc_type->bodytype = atoi(sep.arg[10]);
		
		npc_type->STR = 150;
		npc_type->STA = 150;
		npc_type->DEX = 150;
		npc_type->AGI = 150;
		npc_type->INT = 150;
		npc_type->WIS = 150;
		npc_type->CHA = 150;

		npc_type->prim_melee_type = 28;
		npc_type->sec_melee_type = 28;

		NPC* npc = new NPC(npc_type, 0, in_x, in_y, in_z, in_heading/8, FlyMode3);
		npc->GiveNPCTypeData(npc_type);
		//safe_delete(npc_type);
		
		entity_list.AddNPC(npc);
		return npc;
	}
}


int32 ZoneDatabase::NPCSpawnDB(int8 command, const char* zone, Client *c, NPC* spawn, int32 extra) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
    MYSQL_ROW row;
	int32 tmp = 0;
	int32 tmp2 = 0;
    int32 last_insert_id = 0;
	switch (command) {
		case 0: { // add spawn with new npc_type - khuong
			int32 npc_type_id, spawngroupid;
			char tmpstr[64];
			//char tmpstr2[64];
			EntityList::RemoveNumbers(strn0cpy(tmpstr, spawn->GetName(), sizeof(tmpstr)));
			if (!RunQuery(query, MakeAnyLenString(&query, "INSERT INTO npc_types (name, level, race, class, hp, gender, texture, helmtexture, size, loottable_id, merchant_id, face, runspeed, prim_melee_type, sec_melee_type) values(\"%s\",%i,%i,%i,%i,%i,%i,%i,%f,%i,%i,%i,%f,%i,%i)", tmpstr, spawn->GetLevel(), spawn->GetRace(), spawn->GetClass(), spawn->GetMaxHP(), spawn->GetGender(), spawn->GetTexture(), spawn->GetHelmTexture(), spawn->GetSize(), spawn->GetLoottableID(), spawn->MerchantType, 0, spawn->GetRunspeed(), 28, 28), errbuf, 0, 0, &npc_type_id)) {
				safe_delete(query);
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			snprintf(tmpstr, sizeof(tmpstr), "%s-%s", zone, spawn->GetName());
			if (!RunQuery(query, MakeAnyLenString(&query, "INSERT INTO spawngroup (id, name) values(%i, '%s')", tmp, tmpstr), errbuf, 0, 0, &spawngroupid)) {
				safe_delete(query);
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			if (!RunQuery(query, MakeAnyLenString(&query, "INSERT INTO spawn2 (zone, x, y, z, respawntime, heading, spawngroupID) values('%s', %f, %f, %f, %i, %f, %i)", zone, spawn->GetX(), spawn->GetY(), spawn->GetZ(), 1200, spawn->GetHeading(), spawngroupid), errbuf, 0, 0, &tmp)) {
				safe_delete(query);
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			if (!RunQuery(query, MakeAnyLenString(&query, "INSERT INTO spawnentry (spawngroupID, npcID, chance) values(%i, %i, %i)", spawngroupid, npc_type_id, 100), errbuf, 0)) {
				safe_delete(query);
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			return true;
			break;
		}
		case 1:{
			tmp2 = spawn->GetNPCTypeID();
			char tmpstr[64];
			//char tmpstr2[64];
			snprintf(tmpstr, sizeof(tmpstr), "%s%s%i", zone, spawn->GetName(),Timer::GetCurrentTime());
			if (!RunQuery(query, MakeAnyLenString(&query, "INSERT INTO spawngroup (name) values('%s')", tmpstr), errbuf, 0, 0, &last_insert_id)) {
				printf("ReturnFalse: spawngroup query in NPCSpawnDB() (query: %s)\n",query);
				safe_delete(query);
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			
			int32 respawntime = 0;
			int32 spawnid = 0;
			if (extra)
				respawntime = extra;
			else if(spawn->respawn2 && spawn->respawn2->RespawnTimer() != 0)
				respawntime = spawn->respawn2->RespawnTimer();
			else
				respawntime = 1200;
			if (!RunQuery(query, MakeAnyLenString(&query, "INSERT INTO spawn2 (zone, x, y, z, respawntime, heading, spawngroupID) values('%s', %f, %f, %f, %i, %f, %i)", zone, spawn->GetX(), spawn->GetY(), spawn->GetZ(), respawntime, spawn->GetHeading(), last_insert_id), errbuf, 0, 0, &spawnid)) {
				safe_delete(query);
				printf("ReturnFalse: spawn2 query in NPCSpawnDB()\n");
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			
			if (!RunQuery(query, MakeAnyLenString(&query, "INSERT INTO spawnentry (spawngroupID, npcID, chance) values(%i, %i, %i)", last_insert_id, tmp2, 100), errbuf, 0)) {
				safe_delete(query);
				printf("ReturnFalse: spawnentry query in NPCSpawnDB()\n");
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			return spawnid;
			break;
		}
		case 2: { // update npc_type from target spawn - khuong
			if (!RunQuery(query, MakeAnyLenString(&query, "UPDATE npc_types SET name=\"%s\", level=%i, race=%i, class=%i, hp=%i, gender=%i, texture=%i, helmtexture=%i, size=%i, loottable_id=%i, merchant_id=%i, face=%i, WHERE id=%i", spawn->GetName(), spawn->GetLevel(), spawn->GetRace(), spawn->GetClass(), spawn->GetMaxHP(), spawn->GetGender(), spawn->GetTexture(), spawn->GetHelmTexture(), spawn->GetSize(), spawn->GetLoottableID(), spawn->MerchantType, spawn->GetNPCTypeID()), errbuf, 0)) {
				if(c) c->LogSQL(query);
				safe_delete_array(query);
				return true;
			}
			else {
				safe_delete_array(query);
				return false;
			}
			break;
		}
		case 3: { // delete spawn from spawning - khuong
			if (!RunQuery(query, MakeAnyLenString(&query, "SELECT id,spawngroupID from spawn2 where zone='%s' AND spawngroupID=%i", zone, spawn->GetSp2()), errbuf, &result)) {
				safe_delete_array(query);
				return 0;
			}
			safe_delete_array(query);
			
			row = mysql_fetch_row(result);
			if (row == NULL) return false;
			if (row[0]) tmp = atoi(row[0]);
			if (row[1]) tmp2 = atoi(row[1]);
			
			if (!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM spawn2 WHERE id='%i'", tmp), errbuf,0)) {
				safe_delete(query);
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			if (!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM spawngroup WHERE id='%i'", tmp2), errbuf,0)) {
				safe_delete(query);
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			if (!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM spawnentry WHERE spawngroupID='%i'", tmp2), errbuf,0)) {
				safe_delete(query);
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			return true;


			break;
		}
		case 4: { //delete spawn from DB (including npc_type) - khuong
			if (!RunQuery(query, MakeAnyLenString(&query, "SELECT id,spawngroupID from spawn2 where zone='%s' AND spawngroupID=%i", zone, spawn->GetSp2()), errbuf, &result)) {
				safe_delete_array(query);
				return(0);
			}
			safe_delete_array(query);
			
			row = mysql_fetch_row(result);
			if (row == NULL) return false;
			if (row[0]) tmp = atoi(row[0]);
			if (row[1]) tmp2 = atoi(row[1]);
			mysql_free_result(result);
			
			if (!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM spawn2 WHERE id='%i'", tmp), errbuf,0)) {
				safe_delete(query);
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			if (!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM spawngroup WHERE id='%i'", tmp2), errbuf,0)) {
				safe_delete(query);
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			if (!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM spawnentry WHERE spawngroupID='%i'", tmp2), errbuf,0)) {
				safe_delete(query);
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			if (!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM npc_types WHERE id='%i'", spawn->GetNPCTypeID()), errbuf,0)) {
				safe_delete(query);
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			return true;
			break;
		}
		case 5: { // add a spawn from spawngroup - Ailia
			if (!RunQuery(query, MakeAnyLenString(&query, "INSERT INTO spawn2 (zone, x, y, z, respawntime, heading, spawngroupID) values('%s', %f, %f, %f, %i, %f, %i)", zone, c->GetX(), c->GetY(), c->GetZ(), 120, c->GetHeading(), extra), errbuf, 0, 0, &tmp)) {
				safe_delete(query);
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);

			return true;
			break;
			}
		case 6: { // add npc_type - Ailia
			int32 npc_type_id;
			char tmpstr[64];
			//char tmpstr2[64];
			EntityList::RemoveNumbers(strn0cpy(tmpstr, spawn->GetName(), sizeof(tmpstr)));
			if (!RunQuery(query, MakeAnyLenString(&query, "INSERT INTO npc_types (name, level, race, class, hp, gender, texture, helmtexture, size, loottable_id, merchant_id, face, runspeed, prim_melee_type, sec_melee_type) values(\"%s\",%i,%i,%i,%i,%i,%i,%i,%f,%i,%i,%i,%f,%i,%i)", tmpstr, spawn->GetLevel(), spawn->GetRace(), spawn->GetClass(), spawn->GetMaxHP(), spawn->GetGender(), spawn->GetTexture(), spawn->GetHelmTexture(), spawn->GetSize(), spawn->GetLoottableID(), spawn->MerchantType, 0, spawn->GetRunspeed(), 28, 28), errbuf, 0, 0, &npc_type_id)) {
				safe_delete(query);
				return false;
			}
			if(c) c->LogSQL(query);
			safe_delete_array(query);
			c->Message(0, "%s npc_type ID %i created successfully!", tmpstr, npc_type_id);
			return true;
			break;
		}
	}
	return false;
}

sint32 NPC::GetEquipmentMaterial(int8 material_slot) const
{
	if(equipment[material_slot] == 0) {
		switch(material_slot) {
		case MATERIAL_HEAD:
			return helmtexture;
		case MATERIAL_CHEST:
			return texture;
		case MATERIAL_PRIMARY:
			return d_meele_texture1;
		case MATERIAL_SECONDARY:
			return d_meele_texture2;
		default:
			//they have nothing in the slot, and its not a special slot... they get nothing.
			return(0);
		}
	}
	
	//they have some loot item in this slot, pass it up to the default handler
	return(Mob::GetEquipmentMaterial(material_slot));
}

int32 NPC::GetMaxDamage(int8 tlevel)
{
	int32 dmg = 0;
	if (tlevel < 40)
		dmg = tlevel*2+2;
	else if (tlevel < 50)
		dmg = level*25/10+2;
	else if (tlevel < 60)
		dmg = (tlevel*3+2)+((tlevel-50)*30);
	else
		dmg = (tlevel*3+2)+((tlevel-50)*35);
	return dmg;
}

void NPC::PickPocket(Client* thief) {
	
	thief->CheckIncreaseSkill(PICK_POCKETS, NULL, 5);
	
	//make sure were allowed to targte them:
	int olevel = GetLevel();
	if(olevel > (thief->GetLevel() + THIEF_PICKPOCKET_OVER)) {
		thief->Message(13, "You are too inexperienced to pick pocket this target");
		thief->SendPickPocketResponse(this, 0, PickPocketFailed);
		//should we check aggro
		return;
	}
	
	if(MakeRandomInt(0, 100) > 95){
		AddToHateList(thief, 50);
		Say("Stop thief!");
		thief->Message(13, "You are noticed trying to steal!");
		thief->SendPickPocketResponse(this, 0, PickPocketFailed);
		return;
	}
	
	int steal_skill = thief->GetSkill(PICK_POCKETS);
	int stealchance = steal_skill*100/(5*olevel+5);
	ItemInst* inst = 0;
	int x = 0;
	int slot[50];
	int steal_items[50];
	int charges[50];
	int money[4];
	money[0] = GetPlatinum();
	money[1] = GetGold();
	money[2] = GetSilver();
	money[3] = GetCopper();
	if (steal_skill < 125)
		money[0] = 0;
	if (steal_skill < 60)
		money[1] = 0;
	memset(slot,0,50);
	memset(steal_items,0,50);
	memset(charges,0,50);
	//Determine wheter to steal money or an item.
	bool no_coin = ((money[0] + money[1] + money[2] + money[3]) == 0);
	bool steal_item = (rand()%100 < 50 || no_coin);
	if (steal_item)
	{
		ItemList::iterator cur,end;
		cur = itemlist.begin();
		end = itemlist.end();
		for(; cur != end && x < 49; cur++) {
			ServerLootItem_Struct* citem = *cur;
			const Item_Struct* item = database.GetItem(citem->item_id);
			if (item)
			{
				inst = database.CreateItem(item, citem->charges);
				bool is_arrow = (item->ItemType == ItemTypeArrow) ? true : false;
				int slot_id = thief->GetInv().FindFreeSlot(false, true, inst->GetItem()->Size, is_arrow);
				if (/*!Equipped(item->ID) &&*/
					 !item->LoreFlag && !item->Magic && item->NoDrop != 0 && !inst->IsType(ItemClassContainer) && slot_id != SLOT_INVALID 
					/*&& steal_skill > item->StealSkill*/ )
				{
					slot[x] = slot_id;
					steal_items[x] = item->ID;
					if (inst->IsStackable())
						charges[x] = 1;
					else
						charges[x] = citem->charges;
					x++;
				}
			}
		}
		if (x > 0)
		{
			int random = MakeRandomInt(0, x-1);
			inst = database.CreateItem(steal_items[random], charges[random]);
			const Item_Struct* item = inst->GetItem();

			if (/*item->StealSkill || */steal_skill >= stealchance)
			{
				thief->PutItemInInventory(slot[random], *inst);
				thief->SendItemPacket(slot[random], inst, ItemPacketTrade);
				RemoveItem(item->ID);
				thief->SendPickPocketResponse(this, 0, PickPocketItem, item);
			}
			else
				steal_item = false;
		}
		else if (!no_coin)
		{
			steal_item = false;
		}
		else
		{
			thief->Message(0, "This target's pockets are empty");
			thief->SendPickPocketResponse(this, 0, PickPocketFailed);
		}
	}
	if (!steal_item) //Steal money
	{
		uint32 amt = (rand()%((steal_skill/25)+1))+1;
		int steal_type = 0;
		if (!money[0])
		{
			steal_type = 1;
			if (!money[1])
			{
				steal_type = 2;
				if (!money[2])
				{
					steal_type = 3;
				}
			}
		}

		if (MakeRandomInt(0, 100) <= stealchance)
		{
			switch (steal_type)
			{
			case 0:{
					if (amt > GetPlatinum())
						amt = GetPlatinum();
					SetPlatinum(GetPlatinum()-amt);
					thief->AddMoneyToPP(0,0,0,amt,false);
					thief->SendPickPocketResponse(this, amt, PickPocketPlatinum);
					break;
				   }
			case 1:{
					if (amt > GetGold())
						amt = GetGold();
					SetGold(GetGold()-amt);
					thief->AddMoneyToPP(0,0,amt,0,false);
					thief->SendPickPocketResponse(this, amt, PickPocketGold);
					break;
				   }
			case 2:{
					if (amt > GetSilver())
						amt = GetSilver();
					SetSilver(GetSilver()-amt);
					thief->AddMoneyToPP(0,amt,0,0,false);
					thief->SendPickPocketResponse(this, amt, PickPocketSilver);
					break;
				   }
			case 3:{
					if (amt > GetCopper())
						amt = GetCopper();
					SetCopper(GetCopper()-amt);
					thief->AddMoneyToPP(amt,0,0,0,false);
					thief->SendPickPocketResponse(this, amt, PickPocketCopper);
					break;
				   }
			}
		}
		else
		{
			thief->SendPickPocketResponse(this, 0, PickPocketFailed);
		}
	}
	safe_delete(inst);
}

void Mob::NPCSpecialAttacks(const char* parse, int permtag) {
    for(int i = 0; i < SPECATK_MAXNUM; i++)
	{
	    SpecAttacks[i] = false;
        SpecAttackTimers[i] = NULL;
    }
	
	const char* orig_parse = parse;
    while (*parse)
    {
        switch(*parse)
        {
	    case 'E':
    	    SpecAttacks[SPECATK_ENRAGE] = true;
    		break;
	    case 'F':
    	    SpecAttacks[SPECATK_FLURRY] = true;
    		break;
	    case 'R':
    	    SpecAttacks[SPECATK_RAMPAGE] = true;
    		break;
		case 'r':
			SpecAttacks[SPECATK_AREA_RAMPAGE] = true;
			break;
	    case 'S':
    	    SpecAttacks[SPECATK_SUMMON] = true;
            SpecAttackTimers[SPECATK_SUMMON] = new Timer(6000);
            SpecAttackTimers[SPECATK_SUMMON]->Start();
    		break;
	    case 'T':
            SpecAttacks[SPECATK_TRIPLE] = true;
            break;
	    case 'Q':
	    	//quad requires triple to work properly
            SpecAttacks[SPECATK_TRIPLE] = true;
            SpecAttacks[SPECATK_QUAD] = true;
            break;
	    case 'b':
            SpecAttacks[SPECATK_BANE] = true;
            break;
		case 'm':
            SpecAttacks[SPECATK_MAGICAL] = true;
            break;
		case 'U':
			SpecAttacks[UNSLOWABLE] = true;
			break;
		case 'M':
			SpecAttacks[UNMEZABLE] = true;
			break;
		case 'C':
			SpecAttacks[UNCHARMABLE] = true;
			break;
		case 'N':
			SpecAttacks[UNSTUNABLE] = true;
			break;
		case 'I':
			SpecAttacks[UNSNAREABLE] = true;
			break;
		case 'D':
			SpecAttacks[UNFEARABLE] = true;
			break;
		case 'A':
			SpecAttacks[IMMUNE_MELEE] = true;
			break;
		case 'B':
			SpecAttacks[IMMUNE_MAGIC] = true;
			break;
		case 'f':
			SpecAttacks[IMMUNE_FLEEING] = true;
			break;
		case 'O':
			SpecAttacks[IMMUNE_MELEE_EXCEPT_BANE] = true;
			break;
		case 'W':
			SpecAttacks[IMMUNE_MELEE_NONMAGICAL] = true;
			break;
		case 'H':
			SpecAttacks[IMMUNE_AGGRO] = true;
			break;
		case 'G':
			SpecAttacks[IMMUNE_TARGET] = true;
			break;
		case 'g':
			SpecAttacks[IMMUNE_CASTING_FROM_RANGE] = true;
			break;
		case 'd':
			SpecAttacks[IMMUNE_FEIGN_DEATH] = true;
			break;
		case 'Y':
			SpecAttacks[SPECATK_RANGED_ATK] = true;
			break;

        default:
            break;
        }
        parse++;
    }
	
	if(permtag == 1 && this->GetNPCTypeID() > 0){
		if(database.SetSpecialAttkFlag(this->GetNPCTypeID(), orig_parse)) {
			LogFile->write(EQEMuLog::Normal, "NPCTypeID: %i flagged to '%s' for Special Attacks.\n",this->GetNPCTypeID(),orig_parse);
		}
	}
}

void NPC::FillSpawnStruct(NewSpawn_Struct* ns, Mob* ForWho) {
	Mob::FillSpawnStruct(ns, ForWho);
	
	if(GetOwnerID()) {
		ns->spawn.is_pet = 1;
	} else {
		ns->spawn.is_pet = 0;
	}
	ns->spawn.is_npc = 1;
	
	//not sure what this is, but all 'useable' npcs seem to have it set to 3 on live
//temp disabled until we find this again
/*	if(GetClass() >= WARRIORGM) {
		ns->spawn.unknown0167 = 3;
	}
*/
}

void NPC::SetLevel(uint8 in_level, bool command)
{
	if(in_level > level)
		SendLevelAppearance();
	level = in_level;
	SendAppearancePacket(AT_WhoLevel, in_level);
}

void NPC::ModifyNPCStat(const char *identifier, const char *newValue)
{
	std::string id = identifier;
	std::string val = newValue;
	for(int i = 0; i < id.length(); ++i)
	{
		id[i] = std::tolower(id[i]);
	}

	if(id == "ac")
	{
		AC = atoi(val.c_str());
		return;
	}
	if(id == "str")
	{
		STR = atoi(val.c_str());
		return;
	}
	if(id == "sta")
	{
		STA = atoi(val.c_str());
		return;
	}
	if(id == "agi")
	{
		AGI = atoi(val.c_str());
		return;
	}
	if(id == "dex")
	{
		DEX = atoi(val.c_str());
		return;
	}
	if(id == "wis")
	{
		WIS = atoi(val.c_str());
		CalcMaxMana();
		return;
	}
	if(id == "int" || id == "_int")
	{
		INT = atoi(val.c_str());
		CalcMaxMana();
		return;
	}
	if(id == "cha")
	{
		CHA = atoi(val.c_str());
		return;
	}
	if(id == "max_hp")
	{
		base_hp = atoi(val.c_str());
		CalcMaxHP();
		if(cur_hp > max_hp)
			cur_hp = max_hp;
		return;
	}
	if(id == "mr")
	{
		MR = atoi(val.c_str());
		return;
	}
	if(id == "fr")
	{
		FR = atoi(val.c_str());
		return;
	}
	if(id == "cr")
	{
		CR = atoi(val.c_str());
		return;
	}
	if(id == "pr")
	{
		PR = atoi(val.c_str());
		return;
	}
	if(id == "dr")
	{
		DR = atoi(val.c_str());
		return;
	}
	if(id == "runspeed")
	{
		runspeed = (float)atof(val.c_str());
		CalcBonuses();
		return;
	}
	if(id == "special_attacks")
	{
		NPCSpecialAttacks(val.c_str(), 0);
		return;
	}
	if(id == "attack_speed")
	{
		attack_speed = (float)atof(val.c_str());
		CalcBonuses();
		return;
	}
	if(id == "atk")
	{
		ATK = atoi(val.c_str());
		return;
	}
	if(id == "accuracy")
	{
		accuracy_rating = atoi(val.c_str());
		return;
	}
	if(id == "trackable")
	{
		trackable = atoi(val.c_str());
		return;
	}
	if(id == "min_hit")
	{
		min_dmg = atoi(val.c_str());
		return;
	}
	if(id == "max_hit")
	{
		max_dmg = atoi(val.c_str());
		return;
	}
	if(id == "see_invis")
	{
		see_invis = atoi(val.c_str());
		return;
	}
	if(id == "see_invis_undead")
	{
		see_invis_undead = atoi(val.c_str());
		return;
	}
	if(id == "see_hide")
	{
		see_hide = atoi(val.c_str());
		return;
	}
	if(id == "see_improved_hide")
	{
		see_improved_hide = atoi(val.c_str());
		return;
	}
	if(id == "hp_regen")
	{
		hp_regen = atoi(val.c_str());
		return;
	}
	if(id == "mana_regen")
	{
		mana_regen = atoi(val.c_str());
		return;
	}
	if(id == "level")
	{
		SetLevel(atoi(val.c_str()));
		return;
	}

	if(id == "aggro")
	{
		pAggroRange = atof(val.c_str());
		return;
	}

	if(id == "assist")
	{
		pAssistRange = atof(val.c_str());
		return;
	}

	if(id == "slow_mitigation")
	{
		slow_mitigation = atof(val.c_str());
		return;
	}
}

void NPC::LevelScale() {

	int8 random_level = (MakeRandomInt(level, maxlevel));

	float scaling = (((random_level / (float)level) - 1) * (scalerate / 100.0f));
	
	// Compensate for scale rates at low levels so they don't add too much
	int8 scale_adjust = 1;
	if(level > 0 && level <= 5)
		scale_adjust = 10;
	if(level > 5 && level <= 10)
		scale_adjust = 5;
	if(level > 10 && level <= 15)
		scale_adjust = 3;
	if(level > 15 && level <= 25)
		scale_adjust = 2;

	base_hp += (int)(base_hp * scaling);
	max_hp += (int)(max_hp * scaling);
	cur_hp = max_hp;
	STR += (int)(STR * scaling / scale_adjust);
	STA += (int)(STA * scaling / scale_adjust);
	AGI += (int)(AGI * scaling / scale_adjust);
	DEX += (int)(DEX * scaling / scale_adjust);
	INT += (int)(INT * scaling / scale_adjust);
	WIS += (int)(WIS * scaling / scale_adjust);
	CHA += (int)(CHA * scaling / scale_adjust);
	if (MR)
		MR += (int)(MR * scaling / scale_adjust); 
	if (CR)
		CR += (int)(CR * scaling / scale_adjust);
	if (DR)
		DR += (int)(DR * scaling / scale_adjust);
	if (FR)
		FR += (int)(FR * scaling / scale_adjust);
	if (PR)
		PR += (int)(PR * scaling / scale_adjust);

	if (max_dmg)
	{
		max_dmg += (int)(max_dmg * scaling / scale_adjust);
		min_dmg += (int)(min_dmg * scaling / scale_adjust);
	}

	level = random_level;

	return;
}

void NPC::CalcNPCResists() {

    if (!MR)
        MR = (GetLevel() * 11)/10;
    if (!CR)
        CR = (GetLevel() * 11)/10;
    if (!DR)
        DR = (GetLevel() * 11)/10;
    if (!FR)
        FR = (GetLevel() * 11)/10;
    if (!PR)
        PR = (GetLevel() * 11)/10;

	return;
}

void NPC::CalcNPCRegen() {

    // Fix for lazy db-updaters (regen values left at 0)
    if (GetCasterClass() != 'N' && mana_regen == 0)
        mana_regen = (GetLevel() / 10) + 4;
	else if(mana_regen < 0)
		mana_regen = 0;
	else
		mana_regen = mana_regen;
	
	// Gives low end monsters no regen if set to 0 in database. Should make low end monsters killable
	// Might want to lower this to /5 rather than 10.
	if(hp_regen == 0)
	{
		if(GetLevel() <= 6)  
            hp_regen = 1;  
       else if(GetLevel() > 6 && GetLevel() <= 10)  
            hp_regen = 2;  
       else if(GetLevel() > 10 && GetLevel() <= 15)  
            hp_regen = 3;  
       else if(GetLevel() > 15 && GetLevel() <= 20)  
            hp_regen = 5;  
       else if(GetLevel() > 20 && GetLevel() <= 30)  
            hp_regen = 7;  
       else if(GetLevel() > 30 && GetLevel() <= 35)  
            hp_regen = 9;  
       else if(GetLevel() > 35 && GetLevel() <= 40)  
            hp_regen = 12;  
       else if(GetLevel() > 40 && GetLevel() <= 45)  
            hp_regen = 18;  
       else if(GetLevel() > 45 && GetLevel() <= 50)  
            hp_regen = 21;  
       else
            hp_regen = 30;
	} else if(hp_regen < 0) {
		hp_regen = 0;
	} else
		hp_regen = hp_regen;

	return;
}

void NPC::CalcNPCDamage() {

	int AC_adjust=12;

	if (GetLevel() >= 66) {
		if (min_dmg==0)
			min_dmg = 220;
		if (max_dmg==0)
			max_dmg = ((((99000)*(GetLevel()-64))/400)*AC_adjust/10);
	}
	else if (GetLevel() >= 60 && GetLevel() <= 65){
	    if(min_dmg==0)
			min_dmg = (GetLevel()+(GetLevel()/3));
	    if(max_dmg==0)
	    	max_dmg = (GetLevel()*3)*AC_adjust/10;
	}
	else if (GetLevel() >= 51 && GetLevel() <= 59){
	    if(min_dmg==0)
	    	min_dmg = (GetLevel()+(GetLevel()/3));
	    if(max_dmg==0)
	    	max_dmg = (GetLevel()*3)*AC_adjust/10;
	}
	else if (GetLevel() >= 40 && GetLevel() <= 50) {
		if (min_dmg==0)
			min_dmg = GetLevel();
		if(max_dmg==0)
			max_dmg = (GetLevel()*3)*AC_adjust/10;
	}
	else if (GetLevel() >= 28 && GetLevel() <= 39) {
	    if (min_dmg==0)
			min_dmg = GetLevel() / 2;
	    if (max_dmg==0)
			max_dmg = ((GetLevel()*2)+2)*AC_adjust/10;
	}
	else if (GetLevel() <= 27) {
	    if (min_dmg==0)
			min_dmg=1;
	    if (max_dmg==0)
			max_dmg = (GetLevel()*2)*AC_adjust/10;
	}
	
	int clfact = GetClassLevelFactor();
	min_dmg = (min_dmg * clfact) / 220;
	max_dmg = (max_dmg * clfact) / 220;	

	return;
}


int32 NPC::GetSpawnPointID() const
{
	if(respawn2)
	{
		return respawn2->GetID();
	}
	return 0;
}
