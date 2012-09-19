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


/*

	solar:	General outline of spell casting process
	
	1.
		a)	Client clicks a spell bar gem, ability, or item.  client_process.cpp
		gets the op and calls CastSpell() with all the relevant info including
		cast time.

		b)  NPC does CastSpell() from AI

	2.
		a)	CastSpell() determines there is a cast time and sets some state keeping
		flags to be used to check the progress of casting and finish it later.

		b)	CastSpell() sees there's no cast time, and calls CastedSpellFinished()
		Go to step 4.

	3.
		SpellProcess() notices that the spell casting timer which was set by
		CastSpell() is expired, and calls CastedSpellFinished()

	4.
		CastedSpellFinished() checks some timed spell specific things, like
		wether to interrupt or not, due to movement or melee.  If successful
		SpellFinished() is called.

	5.
		SpellFinished() checks some things like LoS, reagents, target and
		figures out what's going to get hit by this spell based on its type.

	6.
		a)	Single target spell, SpellOnTarget() is called.

		b)	AE spell, Entity::AESpell() is called.

		c)	Group spell, Group::CastGroupSpell()/SpellOnTarget() is called as
		needed.

	7.
		SpellOnTarget() may or may not call SpellEffect() to cause effects to
		the target

	8.
		If this was timed, CastedSpellFinished() will restore the client's
		spell bar gems.


	Most user code should call CastSpell(), with a 0 casting time if needed,
	and not SpellFinished().

*/



#include "../common/debug.h"
#include "spdat.h"
#include "masterentity.h"
#include "../common/packet_dump.h"
#include "../common/moremath.h"
#include "../common/Item.h"
#include "worldserver.h"
#include "../common/skills.h"
#include "../common/bodytypes.h"
#include "../common/classes.h"
#include "../common/rulesys.h"
#include <math.h>
#include <assert.h>
#ifndef WIN32
//	#include <pthread.h>
#include <stdlib.h>
#include "../common/unix.h"
#endif
#ifdef _GOTFRAGS
	#include "../common/packet_dump_file.h"
#endif

#include "StringIDs.h"

#ifdef EMBPERL
#include "embparser.h"
#endif

extern Zone* zone;
extern volatile bool ZoneLoaded;
#if !defined(NEW_LoadSPDat) && !defined(DB_LoadSPDat)
	extern SPDat_Spell_Struct spells[SPDAT_RECORDS];
#endif
extern bool spells_loaded;
extern WorldServer worldserver;
uchar blah[]={0x0D,0x00,0x00,0x00,0x01,0x00,0x00,0x00};
uchar blah2[]={0x12,0x00,0x00,0x00,0x16,0x01,0x00,0x00};


// solar: this is run constantly for every mob
void Mob::SpellProcess()
{
	// check the rapid recast prevention timer
	if(delaytimer == true && spellend_timer.Check())
	{
		spellend_timer.Disable();
		delaytimer = false;
		return;
	}

	// a timed spell is finished casting
	if (casting_spell_id != 0 && spellend_timer.Check())
	{
		spellend_timer.Disable();
		delaytimer = false;
		CastedSpellFinished(casting_spell_id, casting_spell_targetid, casting_spell_slot, casting_spell_mana, casting_spell_inventory_slot);
	}

}

void NPC::SpellProcess()
{
	Mob::SpellProcess();
	
	if(GetSwarmInfo()){
		if(!GetSwarmInfo()->owner)
		{
			Depop();
		}

		if(GetSwarmInfo()->duration->Check(false))
		{
			Depop();
		}

		Mob *targMob = entity_list.GetMob(GetSwarmInfo()->target);
		if(GetSwarmInfo()->target != 0)
        {
			if(!targMob || (targMob && targMob->IsCorpse()))
				Depop();
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// functions related to begin/finish casting, fizzling etc

//
// solar: only CastSpell and DoCastSpell should be setting casting_spell_id.
// basically casting_spell_id is only set when casting a triggered spell from
// the spell bar gems, an ability, or an item.  note that it's actually set
// even if it's a 0 cast time, but then the spell is finished right after and
// it's unset.  this is ok, since the 0 cast time spell is still a triggered
// one.
// the rule is you can cast one triggered (usually timed) spell at a time
// but things like SpellFinished() can run concurrent with a triggered cast
// to allow procs to work
bool Mob::CastSpell(int16 spell_id, int16 target_id, int16 slot,
	sint32 cast_time, sint32 mana_cost, int32* oSpellWillFinish, int32 item_slot)
{
	_ZP(Mob_CastSpell);
	
	mlog(SPELLS__CASTING, "CastSpell called for spell %s (%d) on entity %d, slot %d, time %d, mana %d, from item slot %d",
		spells[spell_id].name, spell_id, target_id, slot, cast_time, mana_cost, (item_slot==0xFFFFFFFF)?999:item_slot);
	
	if(casting_spell_id == spell_id)
		ZeroCastingVars();
	

#ifdef EQBOTS

	if(IsBot() && (zone->IsSpellBlocked(spell_id, GetX(), GetY(), GetZ())))
		return false;

	if(IsBot() && (GetClass() == BARD)) {
		// Do Nothing so Bard Bots can sing
	}
	else

#endif //EQBOTS

	if
	(
		!IsValidSpell(spell_id) ||
		casting_spell_id ||
		delaytimer ||
		spellend_timer.Enabled() ||
		IsStunned() ||
		IsFeared() ||
		IsMezzed() ||
		IsSilenced()
	)
	{
		mlog(SPELLS__CASTING_ERR, "Spell casting canceled: not able to cast now. Valid? %d, casting %d, waiting? %d, spellend? %d, stunned? %d, feared? %d, mezed? %d, silenced? %d",
			IsValidSpell(spell_id), casting_spell_id, delaytimer, spellend_timer.Enabled(), IsStunned(), IsFeared(), IsMezzed(), IsSilenced() );
		if(IsSilenced())
			Message_StringID(13, SILENCED_STRING);
		if(IsClient())
			CastToClient()->SendSpellBarEnable(spell_id);
		if(casting_spell_id && IsNPC())
			CastToNPC()->AI_Event_SpellCastFinished(false, casting_spell_slot);
		return(false);
	}
	
	if(IsDetrimentalSpell(spell_id) && !zone->CanDoCombat()){
		Message_StringID(13, SPELL_WOULDNT_HOLD);
		if(IsClient())
			CastToClient()->SendSpellBarEnable(spell_id);
		if(casting_spell_id && IsNPC())
			CastToNPC()->AI_Event_SpellCastFinished(false, casting_spell_slot);
		return(false);
	}

	
	//cannot cast under deivne aura
	if(DivineAura()) {
		mlog(SPELLS__CASTING_ERR, "Spell casting canceled: cannot cast while Divine Aura is in effect.");
		InterruptSpell(173, 0x121, false);
		return(false);
	}
	
	// check for fizzle
	// note that CheckFizzle itself doesn't let NPCs fizzle,
	// but this code allows for it.
	if(slot < MAX_PP_MEMSPELL && !CheckFizzle(spell_id))
	{
		int fizzle_msg = IsBardSong(spell_id) ? MISS_NOTE : SPELL_FIZZLE;
		InterruptSpell(fizzle_msg, 0x121, spell_id);
		
		uint32 use_mana = ((spells[spell_id].mana) / 4);
		mlog(SPELLS__CASTING_ERR, "Spell casting canceled: fizzled. %d mana has been consumed", use_mana);
		
		// fizzle 1/4 the mana away
		SetMana(GetMana() - use_mana);
		return(false);
	}
	
    if (HasActiveSong()) {
    	mlog(SPELLS__BARDS, "Casting a new spell/song while singing a song. Killing old song %d.", bardsong);
    	//Note: this does NOT tell the client
        _StopSong();
    }
	/*------------------------------
	Added to prevent MQ2 
	exploitation of equipping 
	normally-unequippable items 
	with effects and clicking them
	for benefits. - ndnet
	---------------------------------*/
	if(item_slot && IsClient() && ((slot == USE_ITEM_SPELL_SLOT) || (slot == POTION_BELT_SPELL_SLOT)))
	{
		ItemInst *itm = CastToClient()->GetInv().GetItem(item_slot);
		int bitmask = 1;
		bitmask = bitmask << (CastToClient()->GetClass() - 1);
		if( itm && itm->GetItem()->Classes != 65535 && (itm->GetItem()->Click.Type == ET_EquipClick) && !( itm->GetItem()->Classes & bitmask ) ){
			if (CastToClient()->GetClientVersion() < EQClientSoF) {
				// They are casting a spell on an item that requires equipping but shouldn't let them equip it
				LogFile->write(EQEMuLog::Error, "HACKER: %s (account: %s) attempted to click an equip-only effect on item %s (id: %d) which they shouldn't be able to equip!", CastToClient()->GetCleanName(), CastToClient()->AccountName(), itm->GetItem()->Name, itm->GetItem()->ID);
				database.SetHackerFlag(CastToClient()->AccountName(), CastToClient()->GetCleanName(), "Clicking equip-only item with an invalid class");
			}
			return(false);
		}
		if( itm && (itm->GetItem()->Click.Type == ET_EquipClick) && !(item_slot < 22 || item_slot == 9999) ){
			if (CastToClient()->GetClientVersion() < EQClientSoF) {
				// They are attempting to cast a must equip clicky without having it equipped
				LogFile->write(EQEMuLog::Error, "HACKER: %s (account: %s) attempted to click an equip-only effect on item %s (id: %d) without equiping it!", CastToClient()->GetCleanName(), CastToClient()->AccountName(), itm->GetItem()->Name, itm->GetItem()->ID);
				database.SetHackerFlag(CastToClient()->AccountName(), CastToClient()->GetCleanName(), "Clicking equip-only item without equiping it");
			}
			return(false);
		}
	}	
	return(DoCastSpell(spell_id, target_id, slot, cast_time, mana_cost, oSpellWillFinish, item_slot));
}

//
// solar: the order of things here is intentional and important.  make sure you
// understand the whole spell casting process and the flags that are passed
// around if you're gonna modify this
//
// this is the 2nd phase of CastSpell, broken up like this to make it easier
// to repeat a spell for bard songs
//
bool Mob::DoCastSpell(int16 spell_id, int16 target_id, int16 slot,
                    sint32 cast_time, sint32 mana_cost, int32* oSpellWillFinish, int32 item_slot)
{
	_ZP(Mob_DoCastSpell);
	
	Mob* pMob = NULL;
//	float mobDist;
	sint32 orgcasttime;
//	float modrange;
	EQApplicationPacket *outapp = NULL;

	if(!IsValidSpell(spell_id)) {
		InterruptSpell();
		return(false);
	}
	
	const SPDat_Spell_Struct &spell = spells[spell_id];
	
	mlog(SPELLS__CASTING, "DoCastSpell called for spell %s (%d) on entity %d, slot %d, time %d, mana %d, from item %d",
		spell.name, spell_id, target_id, slot, cast_time, mana_cost, item_slot==0xFFFFFFFF?999:item_slot);
	
	
	casting_spell_id = spell_id;
	casting_spell_slot = slot;
	casting_spell_inventory_slot = item_slot;

	SaveSpellLoc();
	mlog(SPELLS__CASTING, "Casting %d Started at (%.3f,%.3f,%.3f)", spell_id, spell_x, spell_y, spell_z);

	// if this spell doesn't require a target, or if it's an optional target
	// and a target wasn't provided, then it's us; unless TGB is on and this
	// is a TGB compatible spell.
	if((IsGroupSpell(spell_id) || 
		spell.targettype == ST_Self ||
		spell.targettype == ST_AECaster ||
		spell.targettype == ST_TargetOptional) && target_id == 0)
	{
		mlog(SPELLS__CASTING, "Spell %d auto-targeted the caster. Group? %d, target type %d", spell_id, IsGroupSpell(spell_id), spell.targettype);
		target_id = GetID();
	}

	if(cast_time <= -1) {
		// save the non-reduced cast time to use in the packet
		cast_time = orgcasttime = spell.cast_time;
		// if there's a cast time, check if they have a modifier for it
		if(cast_time){

#ifdef EQBOTS
			if(IsBot()) {
				cast_time = GetBotActSpellCasttime(spell_id, cast_time);
			}
			else
#endif //EQBOTS

			cast_time = GetActSpellCasttime(spell_id, cast_time);
			
		}
	}
	else
		orgcasttime = cast_time;

	// we checked for spells not requiring targets above
	if(target_id == 0) {
		mlog(SPELLS__CASTING_ERR, "Spell Error: no target. spell=%d\n", GetName(), spell_id);
		if(IsClient()) {
			//clients produce messages... npcs should not for this case
			Message_StringID(13, SPELL_NEED_TAR);
			InterruptSpell();
		} else {
			InterruptSpell(0, 0, 0);	//the 0 args should cause no messages
		}
		return(false);
	}

	// ok now we know the target
	casting_spell_targetid = target_id;

	if (mana_cost == -1) {
		mana_cost = spell.mana;

#ifdef EQBOTS

		if(IsBot()) {
			mana_cost = GetBotActSpellCost(spell_id, mana_cost);
		}
		else

#endif //EQBOTS

		mana_cost = GetActSpellCost(spell_id, mana_cost);
	}

	if(IsClient() && CastToClient()->CheckAAEffect(aaEffectMassGroupBuff) && IsGroupSpell(spell_id))
		mana_cost *= 2;
	
	// neotokyo: 19-Nov-02
	// mana is checked for clients on the frontend. we need to recheck it for NPCs though
	// fix: items dont need mana :-/
	// Quagmire: If you're at full mana, let it cast even if you dont have enough mana

	// we calculated this above, now enforce it
	if(mana_cost > 0 && slot != 10)
	{
		int my_curmana = GetMana();
		int my_maxmana = GetMaxMana();
		if(my_curmana < spell.mana)	// not enough mana
		{
			//this is a special case for NPCs with no mana...
			if(IsNPC() && my_curmana == my_maxmana)
			{
				mana_cost = 0;
			} else {
				mlog(SPELLS__CASTING_ERR, "Spell Error not enough mana spell=%d mymana=%d cost=%d\n", GetName(), spell_id, my_curmana, mana_cost);
				if(IsClient()) {
					//clients produce messages... npcs should not for this case
					Message_StringID(13, INSUFFICIENT_MANA);
					InterruptSpell();
				} else {
					InterruptSpell(0, 0, 0);	//the 0 args should cause no messages
				}
				return(false);
			}
		}
	}

	if(mana_cost > GetMana())
		mana_cost = GetMana();

	// we know our mana cost now
	casting_spell_mana = mana_cost;
	
	mlog(SPELLS__CASTING, "Spell %d: Casting time %d (orig %d), mana cost %d", orgcasttime, cast_time, mana_cost);

#ifdef EQBOTS

	if(IsBot() && (GetClass() == BARD))
	{ // Bard bots casting time is interrupting thier melee
		cast_time = 0;
	}

#endif //EQBOTS

	// cast time is 0, just finish it right now and be done with it
	if(cast_time == 0) {
		CastedSpellFinished(spell_id, target_id, slot, mana_cost, item_slot);
		return(true);
	}

	// ok we know it has a cast time so we can start the timer now
	spellend_timer.Start(cast_time);
	
	if (IsAIControlled())
	{
		SetRunAnimSpeed(0);
		if(this != pMob)
			this->FaceTarget(pMob);
	}
	
#ifdef EQBOTS

	if(IsBot())
	{
		if(oSpellWillFinish)
		{
			*oSpellWillFinish = Timer::GetCurrentTime() + ((spell.recast_time > 20000) ? 10000 : spell.recast_time);
		}
	}
	else

#endif //EQBOTS

	// if we got here we didn't fizzle, and are starting our cast
	if (oSpellWillFinish)
		*oSpellWillFinish = Timer::GetCurrentTime() + cast_time + 100;

	// now tell the people in the area
	outapp = new EQApplicationPacket(OP_BeginCast,sizeof(BeginCast_Struct));
	BeginCast_Struct* begincast = (BeginCast_Struct*)outapp->pBuffer;
	begincast->caster_id = GetID();
	begincast->spell_id = spell_id;
	begincast->cast_time = orgcasttime; // client calculates reduced time by itself
	outapp->priority = 3;
	entity_list.QueueCloseClients(this, outapp, false, 200, 0, true); //IsClient() ? FILTER_PCSPELLS : FILTER_NPCSPELLS);
	safe_delete(outapp);
	outapp = NULL;
	return(true);
}

uint16 Mob::GetSpecializeSkillValue(int16 spell_id) const {
	switch(spells[spell_id].skill) {
	case ABJURE:
		return(GetSkill(SPECIALIZE_ABJURE));
	case ALTERATION:
		return(GetSkill(SPECIALIZE_ALTERATION));
	case CONJURATION:
		return(GetSkill(SPECIALIZE_CONJURATION));
	case DIVINATION:
		return(GetSkill(SPECIALIZE_DIVINATION));
	case EVOCATION:
		return(GetSkill(SPECIALIZE_EVOCATION));
	default:
		//wtf...
		break;
	}
	return(0);
}

void Client::CheckSpecializeIncrease(int16 spell_id) {
	switch(spells[spell_id].skill) {
	case ABJURE:
		CheckIncreaseSkill(SPECIALIZE_ABJURE, NULL);
		break;
	case ALTERATION:
		CheckIncreaseSkill(SPECIALIZE_ALTERATION, NULL);
		break;
	case CONJURATION:
		CheckIncreaseSkill(SPECIALIZE_CONJURATION, NULL);
		break;
	case DIVINATION:
		CheckIncreaseSkill(SPECIALIZE_DIVINATION, NULL);
		break;
	case EVOCATION:
		CheckIncreaseSkill(SPECIALIZE_EVOCATION, NULL);
		break;
	default:
		//wtf...
		break;
	}
}

void Client::CheckSongSkillIncrease(int16 spell_id){
	switch(spells[spell_id].skill)
	{
	case SINGING:
		CheckIncreaseSkill(SINGING, NULL, -15);
		break;
	case PERCUSSION_INSTRUMENTS:
		if(this->itembonuses.percussionMod > 0) {
			if(GetRawSkill(PERCUSSION_INSTRUMENTS) > 0)	// no skill increases if not trained in the instrument
				CheckIncreaseSkill(PERCUSSION_INSTRUMENTS, NULL, -15);
			else
				Message_StringID(13,NO_INSTRUMENT_SKILL);	// tell the client that they need instrument training
		}
		else
			CheckIncreaseSkill(SINGING, NULL, -15);
		break;
	case STRINGED_INSTRUMENTS:
		if(this->itembonuses.stringedMod > 0) {
			if(GetRawSkill(STRINGED_INSTRUMENTS) > 0)
				CheckIncreaseSkill(STRINGED_INSTRUMENTS, NULL, -15);
			else
				Message_StringID(13,NO_INSTRUMENT_SKILL);
		}
		else
			CheckIncreaseSkill(SINGING, NULL, -15);
		break;
	case WIND_INSTRUMENTS:
		if(this->itembonuses.windMod > 0) {
			if(GetRawSkill(WIND_INSTRUMENTS) > 0)
				CheckIncreaseSkill(WIND_INSTRUMENTS, NULL, -15);
			else
				Message_StringID(13,NO_INSTRUMENT_SKILL);
		}
		else
			CheckIncreaseSkill(SINGING, NULL, -15);
		break;
	case BRASS_INSTRUMENTS:
		if(this->itembonuses.brassMod > 0) {
			if(GetRawSkill(BRASS_INSTRUMENTS) > 0)
				CheckIncreaseSkill(BRASS_INSTRUMENTS, NULL, -15);
			else
				Message_StringID(13,NO_INSTRUMENT_SKILL);
		}
		else
			CheckIncreaseSkill(SINGING, NULL, -15);
		break;
	default:
		break;
	}
}

/*
solar: returns true if spell is successful, false if it fizzled.
only works for clients, npcs shouldn't be fizzling..
neotokyo: new algorithm thats closer to live eq (i hope)
kathgar TODO: Add aa skills, item mods, reduced the chance to fizzle
*/
bool Mob::CheckFizzle(int16 spell_id)
{
	return(true);
}

bool Client::CheckFizzle(int16 spell_id)
{
	// GMs don't fizzle
	if (GetGM()) return(true);
	
	int no_fizzle_level = 0;
	if (GetAA(aaMasteryofthePast)) {
		switch (GetAA(aaMasteryofthePast)) {
			case 1:
				no_fizzle_level = 53;
				break;
			case 2:
				no_fizzle_level = 55;
				break;
			case 3:
				no_fizzle_level = 57;
				break;
		}
	} else {
		switch (GetAA(aaSpellCastingExpertise)) {
			case 1:
				no_fizzle_level = 19;
				break;
			case 2:
				no_fizzle_level = 34;
				break;
			case 3:
				no_fizzle_level = 51;
				break;
		}
	}
	if (spells[spell_id].classes[GetClass()-1] <= no_fizzle_level)
		return true;
	
	//is there any sort of focus that affects fizzling?
	
	
	// neotokyo: this is my try to get something going
	int par_skill;
	int act_skill;
	
	par_skill = spells[spell_id].classes[GetClass()-1] * 5 - 10;//IIRC even if you are lagging behind the skill levels you don't fizzle much
	/*par_skill = spells[spell_id].classes[GetClass()-1] * 5 + 5;*/
	if (par_skill > 235)
		par_skill = 235;

	par_skill += spells[spell_id].classes[GetClass()-1]; // maximum of 270 for level 65 spell

	act_skill = GetSkill(spells[spell_id].skill);
	act_skill += GetLevel(); // maximum of whatever the client can cheat
	
	//FatherNitwit: spell specialization
	float specialize = GetSpecializeSkillValue(spell_id);
		//VERY rough success formula, needs research
	if(specialize > 0) {
		switch(GetAA(aaSpellCastingMastery)){
		case 1:
			specialize = specialize * 1.05;
			break;
		case 2:
			specialize = specialize * 1.15;
			break;
		case 3:
			specialize = specialize * 1.3;
			break;
		}
		if(((specialize/6.0f) + 15.0f) < MakeRandomFloat(0, 100)) {
			specialize *= SPECIALIZE_FIZZLE / 200;
		} else {
			specialize = 0.0f;
		}
	}
	
	// == 0 --> on par
	// > 0  --> skill is lower, higher chance of fizzle
	// < 0  --> skill is better, lower chance of fizzle
	// the max that diff can be is +- 235
	float diff = par_skill + spells[spell_id].basediff - act_skill;

	// if you have high int/wis you fizzle less, you fizzle more if you are stupid
	if (GetCasterClass() == 'W')
		diff -= (GetWIS() - 125) / 20.0;
	if (GetCasterClass() == 'I')
		diff -= (GetINT() - 125) / 20.0;

	// base fizzlechance is lets say 5%, we can make it lower for AA skills or whatever
	float basefizzle = 10;
	float fizzlechance = basefizzle - specialize + diff / 5.0;

	// always at least 5% chance to fail or succeed
	fizzlechance = fizzlechance < 5 ? 5 : (fizzlechance > 95 ? 95 : fizzlechance);
	float fizzle_roll = MakeRandomFloat(0, 100);

	mlog(SPELLS__CASTING, "Check Fizzle %s  spell %d  fizzlechance: %0.2f%%   diff: %0.2f  roll: %0.2f", GetName(), spell_id, fizzlechance, diff, fizzle_roll);
	
	if(fizzle_roll > fizzlechance)
		return(true);
	return(false);
}

void Mob::ZeroCastingVars()
{
	// zero out the state keeping vars
	attacked_count = 0;
	spellend_timer.Disable();
	casting_spell_id = 0;
	casting_spell_targetid = 0;
	casting_spell_slot = 0;
	casting_spell_mana = 0;
	casting_spell_inventory_slot = 0;
	delaytimer = false;
}

void Mob::InterruptSpell(int16 spellid)
{
	if (spellid == SPELL_UNKNOWN)
		spellid = casting_spell_id;

	InterruptSpell(0, 0x121, spellid);
}

// solar: color not used right now
void Mob::InterruptSpell(int16 message, int16 color, int16 spellid)
{
	EQApplicationPacket *outapp;
	int16 message_other;

	if (spellid == SPELL_UNKNOWN)
		spellid = casting_spell_id;

	if(casting_spell_id && IsNPC()) {
		CastToNPC()->AI_Event_SpellCastFinished(false, casting_spell_slot);
	}
	
	ZeroCastingVars();	// resets all the state keeping stuff
	
	mlog(SPELLS__CASTING, "Spell %d has been interrupted.", spellid);
	
	if(!spellid)
		return;
	
	if (bardsong || IsBardSong(casting_spell_id))
		_StopSong();
	
	if(!message)
		message = IsBardSong(spellid) ? SONG_ENDS_ABRUPTLY : INTERRUPT_SPELL;

	// clients need some packets
	if (IsClient())
	{
		// the interrupt message
		outapp = new EQApplicationPacket(OP_InterruptCast, sizeof(InterruptCast_Struct));
		InterruptCast_Struct* ic = (InterruptCast_Struct*) outapp->pBuffer;
		ic->messageid = message;
		ic->spawnid = GetID();
		outapp->priority = 5;
		CastToClient()->QueuePacket(outapp);
		safe_delete(outapp);

		SendSpellBarEnable(spellid);
	}

	// notify people in the area

	// first figure out what message others should get
	switch(message)
	{
		case SONG_ENDS:
			message_other = SONG_ENDS_OTHER;
			break;
		case SONG_ENDS_ABRUPTLY:
			message_other = SONG_ENDS_ABRUPTLY_OTHER;
			break;
		case MISS_NOTE:
			message_other = MISSED_NOTE_OTHER;
			break;
		case SPELL_FIZZLE:
			message_other = SPELL_FIZZLE_OTHER;
			break;
		default:
			message_other = INTERRUPT_SPELL_OTHER;
	}

	// this is the actual message, it works the same as a formatted message
	outapp = new EQApplicationPacket(OP_InterruptCast, sizeof(InterruptCast_Struct) + strlen(GetCleanName()) + 1);
	InterruptCast_Struct* ic = (InterruptCast_Struct*) outapp->pBuffer;
	ic->messageid = message_other;
	ic->spawnid = GetID();
	strcpy(ic->message, GetCleanName());
	entity_list.QueueCloseClients(this, outapp, true, 200, 0, true, IsClient() ? FILTER_PCSPELLS : FILTER_NPCSPELLS);
	safe_delete(outapp);

}

// solar: this is called after the timer is up and the spell is finished
// casting.  everything goes through here, including items with zero cast time
// only to be used from SpellProcess
// NOTE: do not put range checking, etc into this function.  this should
// just check timed spell specific things before passing off to SpellFinished
// which figures out proper targets etc
void Mob::CastedSpellFinished(int16 spell_id, int32 target_id, int16 slot, int16 mana_used, int32 inventory_slot)
{
	_ZP(Mob_CastedSpellFinished);
	
	if(IsClient() && slot != USE_ITEM_SPELL_SLOT && slot != POTION_BELT_SPELL_SLOT && spells[spell_id].recast_time > 1000) { // 10 is item
		if(!CastToClient()->GetPTimers().Expired(&database, pTimerSpellStart + spell_id, false)) {
			//should we issue a  message or send them a spell gem packet?
			Message_StringID(13, SPELL_RECAST);
			mlog(SPELLS__CASTING_ERR, "Casting of %d canceled: spell reuse timer not expired", spell_id);
			InterruptSpell();
			return;
		}
	}

	if(IsClient() && ((slot == USE_ITEM_SPELL_SLOT) || (slot == POTION_BELT_SPELL_SLOT)))
	{
		ItemInst *itm = CastToClient()->GetInv().GetItem(inventory_slot);
		if(itm && itm->GetItem()->RecastDelay > 0)
		{
			if(!CastToClient()->GetPTimers().Expired(&database, (pTimerItemStart + itm->GetItem()->RecastType), false)) {
				Message_StringID(13, SPELL_RECAST);
				mlog(SPELLS__CASTING_ERR, "Casting of %d canceled: item spell reuse timer not expired", spell_id);
				InterruptSpell();
				return;
			}
		}
	}
	 
	if(!IsValidSpell(spell_id))
	{
		mlog(SPELLS__CASTING_ERR, "Casting of %d canceled: invalid spell id", spell_id);
		InterruptSpell();
		return;
	}

	// prevent rapid recast - this can happen if somehow the spell gems
	// become desynced and the player casts again.
	if(IsClient())
	{
		if(delaytimer)
		{
			mlog(SPELLS__CASTING_ERR, "Casting of %d canceled: recast too quickly", spell_id);
			Message(13, "You are unable to focus.");
			InterruptSpell();
			return;
		}
	}

	// make sure they aren't somehow casting 2 timed spells at once
	if (casting_spell_id != spell_id)
	{
		mlog(SPELLS__CASTING_ERR, "Casting of %d canceled: already casting", spell_id);
		Message_StringID(13,ALREADY_CASTING);
		InterruptSpell();
		return;
	}

	bool bard_song_mode = false;
	bool regain_conc = false;
	Mob *spell_target = entity_list.GetMob(target_id);
	// here we do different things if this is a bard casting a bard song from
	// a spell bar slot
	if(GetClass() == BARD) // bard's can move when casting any spell...
	{
		if (IsBardSong(spell_id)) {
			if(spells[spell_id].buffduration == 0xFFFF || spells[spell_id].recast_time != 0) {
				mlog(SPELLS__BARDS, "Bard song %d not applying bard logic because duration or recast is wrong: dur=%d, recast=%d", spells[spell_id].buffduration, spells[spell_id].recast_time);
			} else {
				bardsong = spell_id;
				bardsong_slot = slot;
				//NOTE: theres a lot more target types than this to think about...
				if (spell_target == NULL || (spells[spell_id].targettype != ST_Target && spells[spell_id].targettype != ST_AETarget))
					bardsong_target_id = GetID();
				else
					bardsong_target_id = spell_target->GetID();
				bardsong_timer.Start(6000);
				mlog(SPELLS__BARDS, "Bard song %d started: slot %d, target id %d", bardsong, bardsong_slot, bardsong_target_id);
				bard_song_mode = true;
			}
		}
	}
	else // not bard, check movement
	{
		// if has been attacked, or moved while casting
		// check for regain concentration
		if
		(
			attacked_count > 0 ||
			GetX() != GetSpellX() ||
			GetY() != GetSpellY()
		)
		{
			// modify the chance based on how many times they were hit
			// but cap it so it's not that large a factor
			if(attacked_count > 15) attacked_count = 15;
			
			float channelchance, distance_moved, d_x, d_y, distancemod;

			if(IsClient())
			{
				// max 93% chance at 252 skill
				channelchance = 30 + GetSkill(CHANNELING) / 400.0f * 100;
				channelchance -= attacked_count * 2;			
				channelchance += channelchance * (GetAA(aaChanellingFocus)*5) / 100; 
				channelchance += channelchance * (GetAA(aaInternalMetronome)*5) / 100;
			} else {
				// NPCs are just hard to interrupt, otherwise they get pwned
				channelchance = 85;
				channelchance -= attacked_count;
			}
		
			// solar: as you get farther from your casting location,
			// it gets squarely harder to regain concentration
			if(GetX() != GetSpellX() || GetY() != GetSpellY())
			{
				d_x = fabs(fabs(GetX()) - fabs(GetSpellX()));
				d_y = fabs(fabs(GetY()) - fabs(GetSpellY()));
				if(d_x < 5 && d_y < 5)
				{
					//avoid the square root...
					distance_moved = d_x * d_x + d_y * d_y;
					// if you moved 1 unit, that's 25% off your chance to regain.
					// if you moved 2, you lose 100% off your chance
					distancemod = distance_moved * 25;
					channelchance -= distancemod;
				}
				else
				{
					channelchance = 0;
				}
			}
			
			mlog(SPELLS__CASTING, "Checking Interruption: spell x: %f  spell y: %f  cur x: %f  cur y: %f channelchance %f channeling skill %d\n", GetSpellX(), GetSpellY(), GetX(), GetY(), channelchance, GetSkill(CHANNELING));

			if(MakeRandomFloat(0, 100) > channelchance) {
				mlog(SPELLS__CASTING_ERR, "Casting of %d canceled: interrupted.", spell_id);
				InterruptSpell();
				return;
			}
			// if we got here, we regained concentration
			regain_conc = true;
			Message_StringID(MT_Spells,REGAIN_AND_CONTINUE);
			entity_list.MessageClose_StringID(this, true, 200, MT_Spells, OTHER_REGAIN_CAST, this->GetCleanName());
		}
	}
	
	
	// Check for consumables and Reagent focus items
	// first check for component reduction
	if(IsClient()) {
		int reg_focus = CastToClient()->GetFocusEffect(focusReagentCost,spell_id);
		if(MakeRandomInt(0, 100) <= reg_focus) {
			mlog(SPELLS__CASTING, "Spell %d: Reagent focus item prevented reagent consumption (%d chance)", spell_id, reg_focus);
		} else {
			if(reg_focus > 0)
				mlog(SPELLS__CASTING, "Spell %d: Reagent focus item failed to prevent reagent consumption (%d chance)", spell_id, reg_focus);
	    	Client *c = this->CastToClient();
	    	int component, component_count, inv_slot_id;
		    for(int t_count = 0; t_count < 4; t_count++) {
				component = spells[spell_id].components[t_count];
				component_count = spells[spell_id].component_counts[t_count];
	
				if (component == -1)
					continue;

				// bard components are requirements for a certain instrument type, not a specific item
				if(bard_song_mode) {
					bool HasInstrument = true;
					int InstComponent = spells[spell_id].NoexpendReagent[0];
															
					switch (InstComponent) {
						case -1:
							continue;		// no instrument required, go to next component
						
						// percussion songs (13000 = hand drum)
						case 13000:
							if(itembonuses.percussionMod == 0) {			// check for the appropriate instrument type
								HasInstrument = false;
								c->Message_StringID(13, SONG_NEEDS_DRUM);	// send an error message if missing
							}
							break;
												
						// wind songs (13001 = wooden flute)
						case 13001:
							if(itembonuses.windMod == 0) {
								HasInstrument = false;
								c->Message_StringID(13, SONG_NEEDS_WIND);
							}
							break;
						
						// string songs (13011 = lute)
						case 13011:
							if(itembonuses.stringedMod == 0) {
								HasInstrument = false;
								c->Message_StringID(13, SONG_NEEDS_STRINGS);
							}
							break;
						
						// brass songs (13012 = horn)
						case 13012:
							if(itembonuses.brassMod == 0) {
								HasInstrument = false;
								c->Message_StringID(13, SONG_NEEDS_BRASS);
							}
							break;
						
						default:	// some non-instrument component.  Let it go, but record it in the log
							mlog(SPELLS__CASTING_ERR, "Something odd happened: Song %d required component %s", spell_id, component);
					}
					
					if(!HasInstrument) {	// if the instrument is missing, log it and interrupt the song
						mlog(SPELLS__CASTING_ERR, "Song %d: Canceled. Missing required instrument %s", spell_id, component);
						if(c->GetGM())
							c->Message(0, "Your GM status allows you to finish casting even though you're missing a required instrument.");
						else {
							InterruptSpell();
							return;
						}
					}
				}	// end bard component section


				// handle the components for traditional casters
				else {
					if(c->GetInv().HasItem(component, component_count, invWhereWorn|invWherePersonal) == -1) // item not found
					{
						c->Message_StringID(13, MISSING_SPELL_COMP);
	
						const Item_Struct *item = database.GetItem(component);
						if(item) {
							c->Message_StringID(13, MISSING_SPELL_COMP_ITEM, item->Name);
							mlog(SPELLS__CASTING_ERR, "Spell %d: Canceled. Missing required reagent %s (%d)", spell_id, item->Name, component);
						}
						else {
							char TempItemName[64];
							strcpy((char*)&TempItemName, "UNKNOWN");
							mlog(SPELLS__CASTING_ERR, "Spell %d: Canceled. Missing required reagent %s (%d)", spell_id, TempItemName, component);
						}

						if(c->GetGM())
							c->Message(0, "Your GM status allows you to finish casting even though you're missing required components.");
						else {
							InterruptSpell();
							return;
						}
					
					}
					else
					{
						mlog(SPELLS__CASTING_ERR, "Spell %d: Consuming %d of spell component item id %d", spell_id, component, component_count);
						// Components found, Deleteing
						// now we go looking for and deleting the items one by one
						for(int s = 0; s < component_count; s++)
						{
							inv_slot_id = c->GetInv().HasItem(component, 1, invWhereWorn|invWherePersonal);
							if(inv_slot_id != -1)
							{
								c->DeleteItemInInventory(inv_slot_id, 1, true);
							}
							else
							{	// some kind of error in the code if this happens
								c->Message(13, "ERROR: reagent item disappeared while processing?");
							}
						}
					}
				} // end bard/not bard ifs
			} // end reagent loop
		} // end `focus did not help us`
	} // end IsClient() for reagents
	

	// this is common to both bard and non bard

	// if this was cast from an inventory slot, check out the item that's there
	if(IsClient() && ((slot == USE_ITEM_SPELL_SLOT) || (slot == POTION_BELT_SPELL_SLOT))
		&& inventory_slot != 0xFFFFFFFF)	// 10 is an item
	{
		const ItemInst* inst = CastToClient()->GetInv()[inventory_slot];
		if (inst && inst->IsType(ItemClassCommon))
		{
			//const Item_Struct* item = inst->GetItem();
			sint16 charges = inst->GetItem()->MaxCharges;
			if(charges > -1) {	// charged item, expend a charge
				mlog(SPELLS__CASTING, "Spell %d: Consuming a charge from item %s (%d) which had %d/%d charges.", spell_id, inst->GetItem()->Name, inst->GetItem()->ID, inst->GetCharges(), inst->GetItem()->MaxCharges);
				CastToClient()->DeleteItemInInventory(inventory_slot, 1, true);
			} else {
				mlog(SPELLS__CASTING, "Spell %d: Cast from unlimited charge item %s (%d) (%d charges)", spell_id, inst->GetItem()->Name, inst->GetItem()->ID, inst->GetItem()->MaxCharges);
			}
		}
		else
		{
			mlog(SPELLS__CASTING_ERR, "Item used to cast spell %d was missing from inventory slot %d after casting!", spell_id, inventory_slot);
			Message(0, "Error: item not found for inventory slot #%i", inventory_slot);
			InterruptSpell();
			return;
		}
	}
	
	// we're done casting, now try to apply the spell
	if( !SpellFinished(spell_id, spell_target, slot, mana_used, inventory_slot) )
	{
		mlog(SPELLS__CASTING_ERR, "Casting of %d canceled: SpellFinished returned false.", spell_id);
		InterruptSpell();
		return;
	}

	//
	// solar: at this point the spell has successfully been cast
	//

	// if the spell is cast by a client, trigger the EVENT_CAST player quest
	if(this->IsClient()) {
	#ifdef EMBPERL
		if( ((PerlembParser*)parse)->PlayerHasQuestSub("EVENT_CAST") ) {
			char temp[64];
            sprintf(temp, "%d", spell_id);
			((PerlembParser*)parse)->Event(EVENT_CAST, 0, temp, (NPC*)NULL, this->CastToClient());
		}
	#endif
	}

	if(bard_song_mode)
	{
		if(IsClient())
		{
			this->CastToClient()->CheckSongSkillIncrease(spell_id);
		}
		// go again in 6 seconds
//this is handled with bardsong_timer
//		DoCastSpell(casting_spell_id, casting_spell_targetid, casting_spell_slot, 6000, casting_spell_mana);

		mlog(SPELLS__CASTING, "Bard song %d should be started", spell_id);
	}
	else
	{
		if(IsClient())
		{
			Client *c = CastToClient();
			SendSpellBarEnable(spell_id);

			// this causes the delayed refresh of the spell bar gems
			c->MemorizeSpell(slot, spell_id, memSpellSpellbar);

			// this tells the client that casting may happen again
			SetMana(GetMana());

			// skills
			if(slot < MAX_PP_MEMSPELL)
			{
				c->CheckIncreaseSkill(spells[spell_id].skill, NULL);
				
				// increased chance of gaining channel skill if you regained concentration
				c->CheckIncreaseSkill(CHANNELING, NULL, regain_conc ? 5 : 0);
				
				c->CheckSpecializeIncrease(spell_id);
					}				
			}
			
		// there should be no casting going on now
		ZeroCastingVars();

		// set the rapid recast timer for next time around
		delaytimer = true;
		spellend_timer.Start(400,true);
		
		mlog(SPELLS__CASTING, "Spell casting of %d is finished.", spell_id);
	}
	
}

bool Mob::DetermineSpellTargets(uint16 spell_id, Mob *&spell_target, Mob *&ae_center, CastAction_type &CastAction) {
	
/*
	solar: The basic types of spells:
	
	Single target - some might be undead only, self only, etc, but these
	all affect the target of the caster.

	AE around caster - these affect entities close to the caster, and have
	no target.
	
	AE around target - these have a target, and affect the target as well as
	entities close to the target.
	
	AE on location - this is a tricky one that is cast on a mob target but
	has a special AE duration that keeps it recasting every 2.5 sec on the
	same location.  These work the same as AE around target spells, except
	the target is a special beacon that's created when the spell is cast

	Group - the caster is always affected, but there's more
		targetgroupbuffs on - these affect the target and the target's group.
		targetgroupbuffs off - no target, affects the caster's group.

	Group Teleport - the caster plus his group are affected.  these cannot
	be targeted.

	I think the string ID SPELL_NEED_TAR is wrong, it dosent seem to show up.
*/

	// during this switch, this variable gets set to one of these things
	// and that causes the spell to be executed differently
	
	bodyType target_bt = BT_Humanoid;
	SpellTargetType targetType = spells[spell_id].targettype;
	bodyType mob_body = spell_target ? spell_target->GetBodyType() : BT_Humanoid;

	// seveian 2008-09-23
	if(IsPlayerIllusionSpell(spell_id)
		&& spell_target != NULL // null ptr crash safeguard
		&& !spell_target->IsNPC() // still self only if NPC targetted
		&& IsClient()
		&& IsGrouped() // still self only if not grouped
		&& CastToClient()->CheckAAEffect(aaEffectProjectIllusion)){
			mlog(AA__MESSAGE, "Project Illusion overwrote target caster: %s spell id: %d was ON", GetName(), spell_id);
			targetType = ST_GroupClient;
	}

	switch (targetType)
	{
// single target spells
		case ST_Self:
		{
			spell_target = this;
			CastAction = SingleTarget;
			break;
		}

		case ST_TargetOptional:
		{
			if(!spell_target)
				spell_target = this;
			CastAction = SingleTarget;
			break;
		}

		// target required for these
		case ST_Undead: {
			if(!spell_target || (
				spell_target->GetBodyType() != BT_SummonedUndead 
				&& spell_target->GetBodyType() != BT_Undead
				&& spell_target->GetBodyType() != BT_Vampire
				)
			)
			{
				//invalid target
				mlog(SPELLS__CASTING_ERR, "Spell %d canceled: invalid target of body type %d (undead)", spell_id, spell_target->GetBodyType());
				Message_StringID(13,SPELL_NEED_TAR);
				return false;
			}
			CastAction = SingleTarget;
			break;
		}
		
		case ST_Summoned: {
			int8 body_type = spell_target?spell_target->GetBodyType():0;
			if(!spell_target || (body_type != BT_Summoned && body_type != BT_Summoned2 && body_type != BT_Summoned3))
			{
				//invalid target
				mlog(SPELLS__CASTING_ERR, "Spell %d canceled: invalid target of body type %d (summoned)", spell_id, body_type);
				Message_StringID(13,SPELL_NEED_TAR);
				return false;
			}
			CastAction = SingleTarget;
			break;
		}
		
		case ST_SummonedPet:
		{
			int8 body_type = spell_target ? spell_target->GetBodyType() : 0;
			if(!spell_target || (spell_target != GetPet()) ||
			   (body_type != BT_Summoned && body_type != BT_Summoned2 && body_type != BT_Summoned3 && body_type != BT_Animal))
			{
				mlog(SPELLS__CASTING_ERR, "Spell %d canceled: invalid target of body type %d (summoned pet)",
							  spell_id, body_type);

				Message_StringID(13, SPELL_NEED_TAR);

				return false;
			}
			CastAction = SingleTarget;
			break;
		}
		//single body type target spells...
		//this is a little hackish, but better than duplicating code IMO
		case ST_Plant: if(target_bt == BT_Humanoid) target_bt = BT_Plant;
		case ST_Dragon: if(target_bt == BT_Humanoid) target_bt = BT_Dragon;
		case ST_Giant: if(target_bt == BT_Humanoid) target_bt = BT_Giant;
		case ST_Animal: if(target_bt == BT_Humanoid) target_bt = BT_Animal;
		
		// check for special case body types (Velious dragons/giants)
		if(mob_body == BT_RaidGiant) mob_body = BT_Giant;
		if(mob_body == BT_VeliousDragon) mob_body = BT_Dragon;

		{
			if(!spell_target || mob_body != target_bt)
			{
				//invalid target
				mlog(SPELLS__CASTING_ERR, "Spell %d canceled: invalid target of body type %d (want body Type %d)", spell_id, spell_target->GetBodyType(), target_bt);
				if(!spell_target)
				Message_StringID(13,SPELL_NEED_TAR);
				else
					Message_StringID(13,CANNOT_AFFECT_NPC);
				return false;
			}
			CastAction = SingleTarget;
			break;
		}
		
		case ST_Tap:
		case ST_LDoNChest_Cursed:
		case ST_Target: {
			if(IsLDoNObjectSpell(spell_id))
			{
				if(!spell_target)
				{
					mlog(SPELLS__CASTING_ERR, "Spell %d canceled: invalid target (ldon object)", spell_id);
					Message_StringID(13,SPELL_NEED_TAR);
					return false;
				}
				else
				{
					if(!spell_target->IsNPC())
					{
						mlog(SPELLS__CASTING_ERR, "Spell %d canceled: invalid target (normal)", spell_id);
						Message_StringID(13,SPELL_NEED_TAR);
						return false;
					}

					if(spell_target->GetClass() != LDON_TREASURE)
					{
						mlog(SPELLS__CASTING_ERR, "Spell %d canceled: invalid target (normal)", spell_id);
						Message_StringID(13,SPELL_NEED_TAR);
						return false;
					}
				}
			}

			if(!spell_target)
			{
				mlog(SPELLS__CASTING_ERR, "Spell %d canceled: invalid target (normal)", spell_id);
				Message_StringID(13,SPELL_NEED_TAR);
				return false;	// can't cast these unless we have a target
			}
			CastAction = SingleTarget;
			break;
		}

		case ST_Corpse:
		{
			if(!spell_target || !spell_target->IsPlayerCorpse())
			{
				mlog(SPELLS__CASTING_ERR, "Spell %d canceled: invalid target (corpse)", spell_id);
				int32 message = ONLY_ON_CORPSES;
				if(!spell_target) message = SPELL_NEED_TAR;
				else if(!spell_target->IsCorpse()) message = ONLY_ON_CORPSES;
				else if(!spell_target->IsPlayerCorpse()) message = CORPSE_NOT_VALID;
				Message_StringID(13, message);
				return false;
			}
			CastAction = SingleTarget;
			break;
		}
		case ST_Pet:
		{
			spell_target = GetPet();
			if(!spell_target)
			{
				mlog(SPELLS__CASTING_ERR, "Spell %d canceled: invalid target (no pet)", spell_id);
				Message_StringID(13,NO_PET);
				return false;	// can't cast these unless we have a target
			}
			CastAction = SingleTarget;
			break;
		}

// AE spells
		case ST_AEBard:
		case ST_AECaster:
		{
			spell_target = NULL;
			ae_center = this;
			CastAction = AECaster;
			break;
		}

		case ST_UndeadAE:	//should only affect undead...
		case ST_AETarget:
		{
			if(!spell_target)
			{
				mlog(SPELLS__CASTING_ERR, "Spell %d canceled: invalid target (AOE)", spell_id);
				Message_StringID(13,SPELL_NEED_TAR);
				return false;
			}
			ae_center = spell_target;
			CastAction = AETarget;
			break;
		}

// Group spells
		case ST_GroupTeleport:
		case ST_Group:
		{
			if(IsClient() && CastToClient()->TGB() && IsTGBCompatibleSpell(spell_id)) {
				if(!target)	//target the group of our target, if we have a target, else our own
					spell_target = this;
				else
					spell_target = target;
			} else {
				spell_target = this;
			}
			CastAction = GroupSpell;
			break;
		}
		case ST_GroupClient:
		{
			if(!spell_target){
				mlog(SPELLS__CASTING_ERR, "Spell %d canceled: invalid target (Group: Single Target Client Only)", spell_id);
				Message_StringID(13,SPELL_NEED_TAR);
				return false;
			}
			if(spell_target != this){
				if(IsClient() && IsGrouped()){
					Group *g = entity_list.GetGroupByMob(this);
					if(g && g->IsGroupMember(spell_target) && spell_target != this){
						CastAction = SingleTarget;
					}
					else{
						mlog(SPELLS__CASTING_ERR, "Spell %d canceled: Attempted to cast a Single Target Group spell on a member not in the group.", spell_id);
						Message_StringID(13, TARGET_GROUP_MEMBER);
						return false;
					}
				}
				else{

#ifdef EQBOTS

					// This is so PoK NPC Necro/Shd can create essence emeralds for pc's from perl scripts
					if(((spell_id == 1768) && (zone->GetZoneID() == 202)) || (IsBot() && !IsDetrimentalSpell(spell_id))) {
						CastAction = SingleTarget;
						break;
					}

#endif //EQBOTS

					mlog(SPELLS__CASTING_ERR, "Spell %d canceled: Attempted to cast a Single Target Group spell on a member not in the group.", spell_id);
					Message_StringID(13, TARGET_GROUP_MEMBER);
					return false;
				}
			}
			else
				CastAction = SingleTarget;
			break;
		}		

		default:
		{
			mlog(SPELLS__CASTING_ERR, "I dont know Target Type: %d   Spell: (%d) %s", spells[spell_id].targettype, spell_id, spells[spell_id].name);
			Message(0, "I dont know Target Type: %d   Spell: (%d) %s", spells[spell_id].targettype, spell_id, spells[spell_id].name);
			CastAction = CastActUnknown;
			break;
		}
	}
	return(true);
}

// only used from CastedSpellFinished, and procs
// solar: we can't interrupt in this, or anything called from this!
// if you need to abort the casting, return false
bool Mob::SpellFinished(int16 spell_id, Mob *spell_target, int16 slot, int16 mana_used, int32 inventory_slot)
{
	_ZP(Mob_SpellFinished);
	
	//EQApplicationPacket *outapp = NULL;
	Mob *ae_center = NULL;
	
	if(!IsValidSpell(spell_id))
		return false;

	if( spells[spell_id].zonetype == 1 && !zone->CanCastOutdoor()){
		if(IsClient()){
				if(!CastToClient()->GetGM()){
					Message_StringID(13, CAST_OUTDOORS);
					return false;
				}
			}
		}

	if(IsEffectInSpell(spell_id, SE_Levitate) && !zone->CanLevitate()){
			if(IsClient()){
				if(!CastToClient()->GetGM()){
					Message(13, "You can't levitate in this zone.");
					return false;
				}
			}
		}

	if(IsClient() && !CastToClient()->GetGM()){

		if(zone->IsSpellBlocked(spell_id, GetX(), GetY(), GetZ())){
			const char *msg = zone->GetSpellBlockedMessage(spell_id, GetX(), GetY(), GetZ());
			if(msg){
				Message(13, msg);
				return false;
			}
			else{
				Message(13, "You can't cast this spell here.");
				return false;
			}
			
		}
	}

	if
	(
		this->IsClient() && 
		(zone->GetZoneID() == 183 || zone->GetZoneID() == 184) && 	// load
		CastToClient()->Admin() < 80
	)
	{
		if
		(
			IsEffectInSpell(spell_id, SE_Gate) ||
			IsEffectInSpell(spell_id, SE_Translocate) ||
			IsEffectInSpell(spell_id, SE_Teleport)
		)
		{
			Message(0, "The Gods brought you here, only they can send you away.");
			return false;
		}
	}


	//determine the type of spell target we have
	CastAction_type CastAction;
	if(!DetermineSpellTargets(spell_id, spell_target, ae_center, CastAction))
		return(false);
	
	mlog(SPELLS__CASTING, "Spell %d: target type %d, target %s, AE center %s", spell_id, CastAction, spell_target?spell_target->GetName():"NONE", ae_center?ae_center->GetName():"NONE");

	// solar: if a spell has the AEDuration flag, it becomes an AE on target
	// spell that's recast every 2500 msec for AEDuration msec.  There are
	// spells of all kinds of target types that do this, strangely enough
	// TODO: finish this
	if(IsAEDurationSpell(spell_id)) {
		// solar: the spells are AE target, but we aim them on a beacon
		Mob *beacon_loc =  spell_target ? spell_target : this;
		Beacon *beacon = new Beacon(beacon_loc, spells[spell_id].AEDuration);
		entity_list.AddBeacon(beacon);
		mlog(SPELLS__CASTING, "Spell %d: AE duration beacon created, entity id %d", spell_id, beacon->GetName());
		spell_target = NULL;
		ae_center = beacon;
		CastAction = AECaster;
	}

	// solar: check line of sight to target if it's a detrimental spell
	if(spell_target && IsDetrimentalSpell(spell_id) && !CheckLosFN(spell_target) && !IsHarmonySpell(spell_id))
	{
		mlog(SPELLS__CASTING, "Spell %d: cannot see target %s", spell_target->GetName());
		Message_StringID(13,CANT_SEE_TARGET);
		return false;
	}
	
	// WildcardX: check to see if target is a caster mob before performing a mana tap
	if(spell_target && IsManaTapSpell(spell_id)) {
		if(spell_target->GetCasterClass() == 'N') {
			Message_StringID(13, TARGET_NO_MANA);
			return false;
		}
	}
	
	//range check our target, if we have one and it is not us
	float range = spells[spell_id].range;
	if(IsClient() && CastToClient()->TGB() && IsTGBCompatibleSpell(spell_id) && IsGroupSpell(spell_id))
		range = spells[spell_id].aoerange;

#ifdef EQBOTS

	if(IsBot()) {
		range = GetBotActSpellRange(spell_id, range);
	}
	else

#endif //EQBOTS

	range = GetActSpellRange(spell_id, range);
// seveian 2008-09-23
	if(IsPlayerIllusionSpell(spell_id)
		&& IsClient()
		&& CastToClient()->CheckAAEffect(aaEffectProjectIllusion)){
		range = 100;
	}
	if(spell_target != NULL && spell_target != this) {
		//casting a spell on somebody but ourself, make sure they are in range
		float dist2 = DistNoRoot(*spell_target);
		float range2 = range * range;
		if(dist2 > range2) {
			//target is out of range.
			mlog(SPELLS__CASTING, "Spell %d: Spell target is out of range (squared: %f > %f)", spell_id, dist2, range2);
			Message_StringID(13, TARGET_OUT_OF_RANGE);
			return(false);
		}
	}

	//
	// solar: Switch #2 - execute the spell
	//
	switch(CastAction)
	{
		default:
		case CastActUnknown:
		case SingleTarget:
		{

#ifdef EQBOTS

            //EQoffline: force AE buffs
            if(IsBot() && IsGrouped() && (spell_target->IsBot() || spell_target->IsClient()) && RuleB(EQOffline, BotGroupBuffing))
            {
				NPC *bot = this->CastToNPC();
                bool noGroupSpell = false;
				int16 thespell = spell_id;
				for(int i=0; i<bot->BotSpellCount(); i++)
				{
					int j = bot->BotGetSpells(i);
					int spelltype = bot->BotGetSpellType(i);
					bool spellequal = (j == thespell);
					bool spelltypeequal = ((spelltype == 2) || (spelltype == 16) || (spelltype == 32));
					bool spelltypetargetequal = ((spelltype == 8) && (spells[thespell].targettype == ST_Self));
					bool spelltypeclassequal = ((spelltype == 1024) && (GetClass() == SHAMAN));
					bool slotequal = (slot == USE_ITEM_SPELL_SLOT);

					// if it's a targeted heal or escape spell or pet spell or it's self only buff or self buff weapon proc, we only want to cast it once
					if(spellequal || slotequal)
					{
						if((spelltypeequal || spelltypetargetequal) || spelltypeclassequal || slotequal)
						{
							// Don't let the Shaman canni themselves to death
							if(((spells[thespell].effectid[0] == 0) && (spells[thespell].base[0] < 0)) &&
								(spell_target->GetHP() < ((spells[thespell].base[0] * (-1)) + 100)))
							{
								return false;
							}
							SpellOnTarget(thespell, spell_target);
							noGroupSpell = true;
							break;
						}
					}
				}
				if(!noGroupSpell) {
					Group *g = entity_list.GetGroupByMob(this);
					if(g) {
						for(int i=0; i<MAX_GROUP_MEMBERS;i++) {
							if(g->members[i]) {
								if((g->members[i]->GetClass() == NECROMANCER) &&
									(IsEffectInSpell(thespell, SE_AbsorbMagicAtt) || IsEffectInSpell(thespell, SE_Rune)))
								{
									// don't cast this on necro's, their health to mana
									// spell eats up the rune spell and it just keeps
									// getting recast over and over
								}
								else
								{
									SpellOnTarget(thespell, g->members[i]);
								}
								if(g->members[i] && g->members[i]->GetPetID()) {
									SpellOnTarget(thespell, g->members[i]->GetPet());
								}
							}
						}
						SetMana(GetMana() - (GetBotActSpellCost(thespell, spells[thespell].mana) * (g->BotGroupCount() - 1)));
					}
				}
				break;
			}

#endif //EQBOTS

			if(spell_target == NULL) {
				mlog(SPELLS__CASTING, "Spell %d: Targeted spell, but we have no target", spell_id);
				return(false);
			}
			SpellOnTarget(spell_id, spell_target);
// seveian 2008-09-23

			if(IsPlayerIllusionSpell(spell_id)
			&& IsClient()
			&& CastToClient()->CheckAAEffect(aaEffectProjectIllusion)){
				mlog(AA__MESSAGE, "Effect Project Illusion for %s on spell id: %d was ON", GetName(), spell_id);
				CastToClient()->DisableAAEffect(aaEffectProjectIllusion);
			}
			else{
				mlog(AA__MESSAGE, "Effect Project Illusion for %s on spell id: %d was OFF", GetName(), spell_id);
			}
			break;
		}

		case AECaster:
		case AETarget:
		{

#ifdef EQBOTS

			if(IsBot() && (GetClass() == BARD)) {
				if(!ApplyNextBardPulse(bardsong, this, bardsong_slot)) {
					InterruptSpell(SONG_ENDS_ABRUPTLY, 0x121, bardsong);
				}
				break;
			}

#endif //EQBOTS

			// we can't cast an AE spell without something to center it on
			assert(ae_center != NULL);

			if(ae_center->IsBeacon()) {
				// special ae duration spell
				ae_center->CastToBeacon()->AELocationSpell(this, spell_id);
			} else {
				// regular PB AE or targeted AE spell - spell_target is null if PB
				if(spell_target)	// this must be an AETarget spell
				{
					// affect the target too
					SpellOnTarget(spell_id, spell_target);
				}
				if(ae_center && ae_center == this && IsBeneficialSpell(spell_id))
					SpellOnTarget(spell_id, this);
				
				bool affect_caster = !IsNPC();	//NPC AE spells do not affect the NPC caster
				entity_list.AESpell(this, ae_center, spell_id, affect_caster);
			}
			break;
		}

		case GroupSpell:
		{

#ifdef EQBOTS

			//franck-debug
			if(IsBot()) {
				bool isMainGroupMGB = false;
				if(IsBotRaiding()) {
					BotRaids *br = entity_list.GetBotRaidByMob(this);
					if(br) {
						for(int n=0; n<MAX_GROUP_MEMBERS; ++n) {
							if(br->BotRaidGroups[0] && (br->BotRaidGroups[0]->members[n] == this)) {
								if(GetLevel() >= 59) // MGB AA
									isMainGroupMGB = true;
								break;
							}
						}
					}
				}
				if(isMainGroupMGB && (GetClass() != BARD) && !IsSuccorSpell(spell_id) && !IsGateSpell(spell_id) && !IsTeleportSpell(spell_id)) {
					Say("MGB %s", spells[spell_id].name);
					SpellOnTarget(spell_id, this);
					entity_list.AESpell(this, this, spell_id, true);
				}
				else {
					Group *g = entity_list.GetGroupByMob(this);
					if(g) {
						for(int i=0; i<MAX_GROUP_MEMBERS; ++i) {
							if(g->members[i]) {
								SpellOnTarget(spell_id, g->members[i]);
								if(g->members[i] && g->members[i]->GetPetID()) {
									SpellOnTarget(spell_id, g->members[i]->GetPet());
								}
							}
						}
					}
				}
				break;
			}

#endif //EQBOTS

			if(IsClient() && CastToClient()->CheckAAEffect(aaEffectMassGroupBuff)){
				SpellOnTarget(spell_id, this);
				entity_list.AESpell(this, this, spell_id, true);
				CastToClient()->DisableAAEffect(aaEffectMassGroupBuff);
			}
			else
			{
				// at this point spell_target is a member of the other group, or the
				// caster if they're not using TGB
				// NOTE: this will always hit the caster, plus the target's group so
				// it can affect up to 7 people if the targeted group is not our own
				if(spell_target->IsGrouped())
				{
					Group *target_group = entity_list.GetGroupByMob(spell_target);
					if(target_group)
					{
						target_group->CastGroupSpell(this, spell_id);
					}
				}
				else if(spell_target->IsRaidGrouped() && spell_target->IsClient())
				{
					Raid *target_raid = entity_list.GetRaidByClient(spell_target->CastToClient());
					int32 gid = 0xFFFFFFFF;
					if(target_raid){
						gid = target_raid->GetGroup(spell_target->GetName());
						if(gid < 12)
							target_raid->CastGroupSpell(this, spell_id, gid);
						else
							SpellOnTarget(spell_id, spell_target);
					}
				}
				else
				{
					// if target is grouped, CastGroupSpell will cast it on the caster
					// too, but if not then we have to do that here.
					if(spell_target != this){
						SpellOnTarget(spell_id, this);
	#ifdef GROUP_BUFF_PETS
						//pet too
						if (GetPet() && GetAA(aaPetAffinity) && !GetPet()->IsCharmed())
							SpellOnTarget(spell_id, GetPet());
	#endif					
					}

					SpellOnTarget(spell_id, spell_target);
	#ifdef GROUP_BUFF_PETS
					//pet too
					if (spell_target->GetPet() && GetAA(aaPetAffinity) && !spell_target->GetPet()->IsCharmed())
						SpellOnTarget(spell_id, spell_target->GetPet());
	#endif
				}
			}
			break;
		}
	}

	// animation
/*	outapp = new EQApplicationPacket(OP_Animation, sizeof(Animation_Struct));
	Animation_Struct* a = (Animation_Struct*)outapp->pBuffer;
	a->spawn_id = GetID();
	a->animation_speed = 10;
	a->animation = spells[spell_id].CastingAnim;
	outapp->priority = 2;
	entity_list.QueueCloseClients(this, outapp, false, 200, 0, true, IsClient() ? FILTER_PCSPELLS : FILTER_NPCSPELLS);
	safe_delete(outapp);
*/
	DoAnim(spells[spell_id].CastingAnim, 0, true, IsClient() ? FILTER_PCSPELLS : FILTER_NPCSPELLS);
	
	// if this was a spell slot or an ability use up the mana for it
	// CastSpell already reduced the cost for it if we're a client with focus
	if(slot != USE_ITEM_SPELL_SLOT  && slot != POTION_BELT_SPELL_SLOT && mana_used > 0)
	{
		mlog(SPELLS__CASTING, "Spell %d: consuming %d mana", spell_id, mana_used);
		SetMana(GetMana() - mana_used);
	}
	
	//set our reuse timer on long ass reuse_time spells...
	if(IsClient() && spells[spell_id].recast_time > 1000) {
		int recast = spells[spell_id].recast_time/1000;
		if (spell_id == SPELL_LAY_ON_HANDS)	//lay on hands
		{
			recast -= GetAA(aaFervrentBlessing) * 420;
		}
		else if (spell_id == SPELL_HARM_TOUCH || spell_id == SPELL_HARM_TOUCH2)	//harm touch
		{
			recast -= GetAA(aaTouchoftheWicked) * 420;
		}
		mlog(SPELLS__CASTING, "Spell %d: Setting long reuse timer to %d s (orig %d)", spell_id, recast, spells[spell_id].recast_time);
		CastToClient()->GetPTimers().Start(pTimerSpellStart + spell_id, recast);
	}

	if(IsClient() && ((slot == USE_ITEM_SPELL_SLOT) || (slot == POTION_BELT_SPELL_SLOT)))
	{
		ItemInst *itm = CastToClient()->GetInv().GetItem(inventory_slot);
		if(itm && itm->GetItem()->RecastDelay > 0){
			CastToClient()->GetPTimers().Start((pTimerItemStart + itm->GetItem()->RecastType), itm->GetItem()->RecastDelay);
		}
	}
	
	if(IsNPC())
		CastToNPC()->AI_Event_SpellCastFinished(true, slot);

	if (IsClient() && CastToClient()->MelodyIsActive()) {
		Client *c = CastToClient();
		if (IsBardSong(spell_id)) {
			c->InterruptSpell(0, 0, 0);
			c->MelodyAdvanceSong();
			c->MelodyTrySong();
		}
	}

	return true;	
}

/*
 * handle bard song pulses...
 * 
 * we make several assumptions that SpellFinished does not:
 *   - there are no AEDuration (beacon) bard songs
 *   - there are no recourse spells on bard songs
 *   - there is no long recast delay on bard songs
 * 
 * return false to stop the song
 */
bool Mob::ApplyNextBardPulse(int16 spell_id, Mob *spell_target, int16 slot) {
	if(slot == USE_ITEM_SPELL_SLOT) {
		//bard songs should never come from items...
		mlog(SPELLS__BARDS, "Bard Song Pulse %d: Supposidly cast from an item. Killing song.", spell_id);
		return(false);
	}
	
	//determine the type of spell target we have
	Mob *ae_center = NULL;
	CastAction_type CastAction;
	if(!DetermineSpellTargets(spell_id, spell_target, ae_center, CastAction)) {
		mlog(SPELLS__BARDS, "Bard Song Pulse %d: was unable to determine target. Stopping.", spell_id);
		return(false);
	}
	
	if(ae_center != NULL && ae_center->IsBeacon()) {
		mlog(SPELLS__BARDS, "Bard Song Pulse %d: Unsupported Beacon NPC AE spell", spell_id);
		return(false);
	}
	
	//use mana, if this spell has a mana cost
	int mana_used = spells[spell_id].mana;
	if(mana_used > 0) {
		if(mana_used > GetMana()) {
			//ran out of mana... this calls StopSong() for us
			mlog(SPELLS__BARDS, "Ran out of mana while singing song %d", spell_id);
			return(false);
		}
		
		mlog(SPELLS__CASTING, "Bard Song Pulse %d: consuming %d mana (have %d)", spell_id, mana_used, GetMana());
		SetMana(GetMana() - mana_used);
	}
	
	
	// check line of sight to target if it's a detrimental spell
	if(spell_target && IsDetrimentalSpell(spell_id) && !CheckLosFN(spell_target))
	{
		mlog(SPELLS__CASTING, "Bard Song Pulse %d: cannot see target %s", spell_target->GetName());
		Message_StringID(13, CANT_SEE_TARGET);
		return(false);
	}
	
	//range check our target, if we have one and it is not us
	float range = 0.00f;

#ifdef EQBOTS

	if(IsBot()) {
		range = GetBotActSpellRange(spell_id, spells[spell_id].range);
	}
	else

#endif //EQBOTS

	range = GetActSpellRange(spell_id, spells[spell_id].range);
	if(spell_target != NULL && spell_target != this) {
		//casting a spell on somebody but ourself, make sure they are in range
		float dist2 = DistNoRoot(*spell_target);
		float range2 = range * range;
		if(dist2 > range2) {
			//target is out of range.
			mlog(SPELLS__BARDS, "Bard Song Pulse %d: Spell target is out of range (squared: %f > %f)", spell_id, dist2, range2);
			Message_StringID(13, TARGET_OUT_OF_RANGE);
			return(false);
		}
	}
	
	//
	// solar: Switch #2 - execute the spell
	//
	switch(CastAction)
	{
		default:
		case CastActUnknown:
		case SingleTarget:
		{
			if(spell_target == NULL) {
				mlog(SPELLS__BARDS, "Bard Song Pulse %d: Targeted spell, but we have no target", spell_id);
				return(false);
			}
			mlog(SPELLS__BARDS, "Bard Song Pulse: Targeted. spell %d, target %s", spell_id, spell_target->GetName());
			spell_target->BardPulse(spell_id, this);
			break;
		}

		case AECaster:
		{
			if(IsBeneficialSpell(spell_id))
				SpellOnTarget(spell_id, this);
			
			bool affect_caster = !IsNPC();	//NPC AE spells do not affect the NPC caster
			entity_list.AEBardPulse(this, this, spell_id, affect_caster);
			break;		
		}
		case AETarget:
		{
			// we can't cast an AE spell without something to center it on
			if(ae_center == NULL) {
				mlog(SPELLS__BARDS, "Bard Song Pulse %d: AE Targeted spell, but we have no target", spell_id);
				return(false);
			}

			// regular PB AE or targeted AE spell - spell_target is null if PB
			if(spell_target) {	// this must be an AETarget spell
				// affect the target too
				spell_target->BardPulse(spell_id, this);
				mlog(SPELLS__BARDS, "Bard Song Pulse: spell %d, AE target %s", spell_id, spell_target->GetName());
			} else {
				mlog(SPELLS__BARDS, "Bard Song Pulse: spell %d, AE with no target", spell_id);
			}
			bool affect_caster = !IsNPC();	//NPC AE spells do not affect the NPC caster
			entity_list.AEBardPulse(this, ae_center, spell_id, affect_caster);
			break;
		}

		case GroupSpell:
		{
			if(spell_target->IsGrouped()) {
				mlog(SPELLS__BARDS, "Bard Song Pulse: spell %d, Group targeting group of %s", spell_id, spell_target->GetName());
				Group *target_group = entity_list.GetGroupByMob(spell_target);
				if(target_group)
					target_group->GroupBardPulse(this, spell_id);
			}
			else if(spell_target->IsRaidGrouped() && spell_target->IsClient()) {
				mlog(SPELLS__BARDS, "Bard Song Pulse: spell %d, Raid group targeting raid group of %s", spell_id, spell_target->GetName());
				Raid *r = entity_list.GetRaidByClient(spell_target->CastToClient());
				if(r){
					int32 gid = r->GetGroup(spell_target->GetName());
					if(gid < 12){
						r->GroupBardPulse(this, spell_id, gid);
					}
					else{
						BardPulse(spell_id, this);
#ifdef GROUP_BUFF_PETS
						if (GetPet() && GetAA(aaPetAffinity) && !GetPet()->IsCharmed())
							GetPet()->BardPulse(spell_id, this);
#endif
					}
				}
			}
			else {
				mlog(SPELLS__BARDS, "Bard Song Pulse: spell %d, Group target without group. Affecting caster.", spell_id);
				BardPulse(spell_id, this);
#ifdef GROUP_BUFF_PETS
				if (GetPet() && GetAA(aaPetAffinity) && !GetPet()->IsCharmed())
					GetPet()->BardPulse(spell_id, this);
#endif
			}
			break;
		}
	}
	
	//do we need to do this???
	DoAnim(spells[spell_id].CastingAnim, 0, true, IsClient() ? FILTER_PCSPELLS : FILTER_NPCSPELLS);
	if(IsClient())
		CastToClient()->CheckSongSkillIncrease(spell_id);

	return(true);
}

void Mob::BardPulse(uint16 spell_id, Mob *caster) {
	int buffs_i;
	for (buffs_i = 0; buffs_i < BUFF_COUNT; buffs_i++) {
		if(buffs[buffs_i].spellid != spell_id)
			continue;
		if(buffs[buffs_i].casterid != caster->GetID()) {
			mlog(SPELLS__BARDS, "Bard Pulse for %d: found buff from caster %d and we are pulsing for %d... are there two bards playing the same song???", spell_id, buffs[buffs_i].casterid, caster->GetID());
			return;
		}
		//extend the spell if it will expire before the next pulse
		if(buffs[buffs_i].ticsremaining <= 3) {
			buffs[buffs_i].ticsremaining += 3;
			mlog(SPELLS__BARDS, "Bard Song Pulse %d: extending duration in slot %d to %d tics", spell_id, buffs_i, buffs[buffs_i].ticsremaining);
		}
			
		//should we send this buff update to the client... seems like it would
		//be a lot of traffic for no reason...
//this may be the wrong packet...
		if(IsClient()) {
			EQApplicationPacket *packet = new EQApplicationPacket(OP_Action, sizeof(Action_Struct));

			Action_Struct* action = (Action_Struct*) packet->pBuffer;
			action->source = caster->GetID();
			action->target = GetID();
			action->spell = spell_id;
			action->sequence = (int32) (GetHeading() * 2);	// just some random number
			action->instrument_mod = caster->GetInstrumentMod(spell_id);
			action->buff_unknown = 0;
			action->level = buffs[buffs_i].casterlevel;
			action->type = SpellDamageType;
			entity_list.QueueCloseClients(this, packet, false, 200, 0, true, IsClient() ? FILTER_PCSPELLS : FILTER_NPCSPELLS);
			
			action->buff_unknown = 4;

			if(IsEffectInSpell(spell_id, SE_TossUp))
			{
				action->buff_unknown = 0;
			}
			else if(spells[spell_id].pushback > 0 || spells[spell_id].pushup > 0)
			{
				if(IsClient())
				{
					if(HasBuffIcon(caster, this, spell_id) == false)
					{
						CastToClient()->SetKnockBackExemption(true);

						action->buff_unknown = 0;
						EQApplicationPacket* outapp_push = new EQApplicationPacket(OP_ClientUpdate, sizeof(PlayerPositionUpdateServer_Struct));
						PlayerPositionUpdateServer_Struct* spu = (PlayerPositionUpdateServer_Struct*)outapp_push->pBuffer;
						
						double look_heading = caster->CalculateHeadingToTarget(GetX(), GetY());
						look_heading /= 256;
						look_heading *= 360;
						if(look_heading > 360)
							look_heading -= 360;

						//x and y are crossed mkay
						double new_x = spells[spell_id].pushback * sin(double(look_heading * 3.141592 / 180.0));
						double new_y = spells[spell_id].pushback * cos(double(look_heading * 3.141592 / 180.0));

						spu->spawn_id	= GetID();
						spu->x_pos		= FloatToEQ19(GetX());
						spu->y_pos		= FloatToEQ19(GetY());
						spu->z_pos		= FloatToEQ19(GetZ());
						spu->delta_x	= NewFloatToEQ13(new_x);
						spu->delta_y	= NewFloatToEQ13(new_y);
						spu->delta_z	= NewFloatToEQ13(spells[spell_id].pushup);
						spu->heading	= FloatToEQ19(GetHeading());
						spu->padding0002	=0;
						spu->padding0006	=7;
						spu->padding0014	=0x7f;
						spu->padding0018	=0x5df27;
						spu->animation = 0;
						spu->delta_heading = NewFloatToEQ13(0);
						outapp_push->priority = 6;
						entity_list.QueueClients(this, outapp_push, true);
						CastToClient()->FastQueuePacket(&outapp_push);
					}
				}
			}

			if(IsClient() && IsEffectInSpell(spell_id, SE_ShadowStep))
			{
				CastToClient()->SetShadowStepExemption(true);
			}

			if(!IsEffectInSpell(spell_id, SE_BindAffinity))
			{
				CastToClient()->FastQueuePacket(&packet);
			}
			
			EQApplicationPacket *message_packet = new EQApplicationPacket(OP_Damage, sizeof(CombatDamage_Struct));
			CombatDamage_Struct *cd = (CombatDamage_Struct *)message_packet->pBuffer;
			cd->target = action->target;
			cd->source = action->source;
			cd->type = SpellDamageType;
			cd->spellid = action->spell;
			cd->sequence = action->sequence;
			cd->damage = 0;
			if(!IsEffectInSpell(spell_id, SE_BindAffinity))
			{
				entity_list.QueueCloseClients(this, message_packet, false, 200, 0, true, IsClient() ? FILTER_PCSPELLS : FILTER_NPCSPELLS);
			}
			safe_delete(message_packet);
			
		}
		//we are done...
		return;
	}
	mlog(SPELLS__BARDS, "Bard Song Pulse %d: Buff not found, reapplying spell.", spell_id);
	//this spell is not affecting this mob, apply it.
	caster->SpellOnTarget(spell_id, this);
}

///////////////////////////////////////////////////////////////////////////////
// buff related functions

// solar: returns how many _ticks_ the buff will last.
// a tick is 6 seconds
// this is the place to figure out random duration buffs like fear and charm.
// both the caster and target mobs are passed in, so different behavior can
// even be created depending on the types of mobs involved
//
// right now this is just an outline, working on this..
int Mob::CalcBuffDuration(Mob *caster, Mob *target, int16 spell_id, sint32 caster_level_override)
{
	int formula, duration;

	if(!IsValidSpell(spell_id) || (!caster && !target))
		return 0;
	
	if(!caster && !target)
		return 0;
	
	// if we have at least one, we can make do, we'll just pretend they're the same
	if(!caster)
		caster = target;
	if(!target)
		target = caster;

	formula = spells[spell_id].buffdurationformula;
	duration = spells[spell_id].buffduration;

	//add one tic because we seem to fade at least one tic too soon
	int castlevel = caster->GetCasterLevel(spell_id);
	if(caster_level_override > 0)
		castlevel = caster_level_override;

	int res = 1 + CalcBuffDuration_formula(castlevel, formula, duration);
	mlog(SPELLS__CASTING, "Spell %d: Casting level %d, formula %d, base_duration %d: result %d",
		spell_id, castlevel, formula, duration, res);

	// enchanter mesmerization mastery aa
	if (caster->IsClient() && caster->CastToClient()->GetAA(aaMesmerizationMastery) > 0)
		res *= 1.35;

	return(res);
}

// the generic formula calculations
int CalcBuffDuration_formula(int level, int formula, int duration)
{
	int i;	// temp variable

	switch(formula)
	{
		case 0:	// not a buff
			return 0;

		case 1:	// solar: 2/7/04
			i = (int)ceil(level / 2.0f);
			return i < duration ? (i < 1 ? 1 : i) : duration;

		case 2:	// solar: 2/7/04
			i = (int)ceil(duration / 5.0f * 3);
			return i < duration ? (i < 1 ? 1 : i) : duration;

		case 3:	// solar: 2/7/04
			i = level * 30;
			return i < duration ? (i < 1 ? 1 : i) : duration;

		case 4:	// only used by 'LowerElement'
			return ((duration != 0) ? duration : 50);

		case 5:	// solar: 2/7/04
			i = duration;
			return i < 3 ? (i < 1 ? 1 : i) : 3;

		case 6:	// solar: 2/7/04
			i = (int)ceil(level / 2.0f);
			return i < duration ? (i < 1 ? 1 : i) : duration;

		case 7:	// solar: 2/7/04
			i = level;
			return (duration == 0) ? (i < 1 ? 1 : i) : duration;

		case 8:	// solar: 2/7/04
			i = level + 10;
			return i < duration ? (i < 1 ? 1 : i) : duration;

		case 9:	// solar: 2/7/04
			i = level * 2 + 10;
			return i < duration ? (i < 1 ? 1 : i) : duration;

		case 10:	// solar: 2/7/04
			i = level * 3 + 10;
			return i < duration ? (i < 1 ? 1 : i) : duration;

		case 11:	// solar: confirmed 2/7/04
			return duration;

		case 12:	// solar: 2/7/04
			return duration;

		case 50:	// solar: lucy says this is unlimited?
			return 72000;	// 5 days

		case 3600:
			return duration ? duration : 3600;

		default:
			LogFile->write(EQEMuLog::Debug, "CalcBuffDuration_formula: unknown formula %d", formula);
			return 0;
	}
}

// solar: helper function for AddBuff to determine stacking
// spellid1 is the spell already worn, spellid2 is the one trying to be cast
// returns:
// 0 if not the same type, no action needs to be taken
// 1 if spellid1 should be removed (overwrite)
// -1 if they can't stack and spellid2 should be stopped
//currently, a spell will not land if it would overwrite a better spell on any effect
//if all effects are better or the same, we overwrite, else we do nothing
int Mob::CheckStackConflict(int16 spellid1, int caster_level1, int16 spellid2, int caster_level2, Mob* caster1, Mob* caster2)
{
	const SPDat_Spell_Struct &sp1 = spells[spellid1];
	const SPDat_Spell_Struct &sp2 = spells[spellid2];
	
	int i, effect1, effect2, sp1_value, sp2_value;
	int blocked_effect, blocked_below_value, blocked_slot;
	int overwrite_effect, overwrite_below_value, overwrite_slot;

	mlog(SPELLS__STACKING, "Check Stacking on old %s (%d) @ lvl %d (by %s) vs. new %s (%d) @ lvl %d (by %s)", sp1.name, spellid1, caster_level1, (caster1==NULL)?"Nobody":caster1->GetName(), sp2.name, spellid2, caster_level2, (caster2==NULL)?"Nobody":caster2->GetName());

	if(((spellid1 == spellid2) && (spellid1 == 2751)) || //special case spells that will block each other no matter what
		((spellid1 == spellid2) && (spellid1 == 2755)) //manaburn / lifeburn
		){
			mlog(SPELLS__STACKING, "Blocking spell because manaburn/lifeburn does not stack with itself");
			return -1;
		}

	//resurrection effects wont count for overwrite/block stacking
	switch(spellid1)
	{
	case 756:
	case 757:
	case 5249:
		return (0);
	}

	switch (spellid2)
	{
	case 756:
	case 757:
	case 5249:
		return (0);
	}
	
	/*
	One of these is a bard song and one isn't and they're both beneficial so they should stack.
	*/
	if(IsBardSong(spellid1) != IsBardSong(spellid2)) 
	{
		if(!IsDetrimentalSpell(spellid1) && !IsDetrimentalSpell(spellid2))
		{
			mlog(SPELLS__STACKING, "%s and %s are beneficial, and one is a bard song, no action needs to be taken", sp1.name, sp2.name);
			return (0);
		}
	}


	// solar: check for special stacking block command in spell1 against spell2
	for(i = 0; i < EFFECT_COUNT; i++)
	{
		effect1 = sp1.effectid[i];
		if(effect1 == SE_StackingCommand_Block)
		{
			/*
			The logic here is if you're comparing the same spells they can't block each other
			from refreshing
			*/
			if(spellid1 == spellid2)
				continue;

			blocked_effect = sp1.base[i];
			blocked_slot = sp1.formula[i] - 201;	//they use base 1 for slots, we use base 0
			blocked_below_value = sp1.max[i];
			
			if(sp2.effectid[blocked_slot] == blocked_effect)
			{
				sp2_value = CalcSpellEffectValue(spellid2, blocked_slot, caster_level2);
				
				mlog(SPELLS__STACKING, "%s (%d) blocks effect %d on slot %d below %d. New spell has value %d on that slot/effect. %s.",
					sp1.name, spellid1, blocked_effect, blocked_slot, blocked_below_value, sp2_value, (sp2_value < blocked_below_value)?"Blocked":"Not blocked");

				if(sp2_value < blocked_below_value)
				{
					mlog(SPELLS__STACKING, "Blocking spell because sp2_value < blocked_below_value");
					return -1;	// blocked
				}
			} else {
				mlog(SPELLS__STACKING, "%s (%d) blocks effect %d on slot %d below %d, but we do not have that effect on that slot. Ignored.",
					sp1.name, spellid1, blocked_effect, blocked_slot, blocked_below_value);
			}
		}
	}

	// check for special stacking overwrite in spell2 against effects in spell1
	for(i = 0; i < EFFECT_COUNT; i++)
	{
		effect2 = sp2.effectid[i];
		if(effect2 == SE_StackingCommand_Overwrite)
		{
			overwrite_effect = sp2.base[i];
			overwrite_slot = sp2.formula[i] - 201;	//they use base 1 for slots, we use base 0
			overwrite_below_value = sp2.max[i];
			if(sp1.effectid[overwrite_slot] == overwrite_effect)
			{
				sp1_value = CalcSpellEffectValue(spellid1, overwrite_slot, caster_level1);

				mlog(SPELLS__STACKING, "%s (%d) overwrites existing spell if effect %d on slot %d is below %d. Old spell has value %d on that slot/effect. %s.",
					sp2.name, spellid2, overwrite_effect, overwrite_slot, overwrite_below_value, sp1_value, (sp1_value < overwrite_below_value)?"Overwriting":"Not overwriting");
				
				if(sp1_value < overwrite_below_value)
				{
					mlog(SPELLS__STACKING, "Overwrite spell because sp1_value < overwrite_below_value");
					return 1;			// overwrite spell if its value is less
				}
			} else {
				mlog(SPELLS__STACKING, "%s (%d) overwrites existing spell if effect %d on slot %d is below %d, but we do not have that effect on that slot. Ignored.",
					sp2.name, spellid2, overwrite_effect, overwrite_slot, overwrite_below_value);

			}
		}
	}
	
	bool sp1_detrimental = IsDetrimentalSpell(spellid1);
	bool sp2_detrimental = IsDetrimentalSpell(spellid2);
	bool sp_det_mismatch;

	if(sp1_detrimental == sp2_detrimental)
		sp_det_mismatch = false;
	else
		sp_det_mismatch = true;
	
	// now compare matching effects
	// arbitration takes place if 2 spells have the same effect at the same
	// effect slot, otherwise they're stackable, even if it's the same effect
	bool will_overwrite = false;
	for(i = 0; i < EFFECT_COUNT; i++)
	{
		if(IsBlankSpellEffect(spellid1, i) || IsBlankSpellEffect(spellid2, i))
			continue;

		effect1 = sp1.effectid[i];
		effect2 = sp2.effectid[i];

		//Effects which really aren't going to affect stacking.
		if(effect1 == SE_CurrentHPOnce ||
			effect1 == SE_CurseCounter	||
			effect1 == SE_DiseaseCounter ||
			effect1 == SE_PoisonCounter){
			continue;
			}

		/*
		Quick check, are the effects the same, if so then
		keep going else ignore it for stacking purposes.
		*/
		if(effect1 != effect2)
			continue;

		/*
		If target is a npc and caster1 and caster2 exist
		If Caster1 isn't the same as Caster2 and the effect is a DoT then ignore it.
		*/
		if(IsNPC() && caster1 && caster2 && caster1 != caster2) {
			if(effect1 == SE_CurrentHP && sp1_detrimental && sp2_detrimental) {
				continue;
				mlog(SPELLS__STACKING, "Both casters exist and are not the same, the effect is a detrimental dot, moving on");
			}
		}

		if(effect1 == SE_CompleteHeal){ //SE_CompleteHeal never stacks or overwrites ever, always block.
			mlog(SPELLS__STACKING, "Blocking spell because complete heal never stacks or overwries");
			return (-1);
		}

		/*
		If the effects are the same and
		sp1 = beneficial & sp2 = detrimental or
		sp1 = detrimental & sp2 = beneficial
		Then this effect should be ignored for stacking purposes.
		*/
		if(sp_det_mismatch)
		{
			mlog(SPELLS__STACKING, "The effects are the same but the spell types are not, passing the effect");
			continue;
		}
		
		/*
		If the spells aren't the same
		and the effect is a dot we can go ahead and stack it
		*/
		if(effect1 == SE_CurrentHP && spellid1 != spellid2 && sp1_detrimental && sp2_detrimental) {
			mlog(SPELLS__STACKING, "The spells are not the same and it is a detrimental dot, passing");
			continue;
		}

		sp1_value = CalcSpellEffectValue(spellid1, i, caster_level1);
		sp2_value = CalcSpellEffectValue(spellid2, i, caster_level2);
		
		// some spells are hard to compare just on value.  attack speed spells
		// have a value that's a percentage for instance
		if
		(
			effect1 == SE_AttackSpeed ||
			effect1 == SE_AttackSpeed2 ||
			effect1 == SE_AttackSpeed3
		)
		{
			sp1_value -= 100;
			sp2_value -= 100;
		}
		
		if(sp1_value < 0)
			sp1_value = 0 - sp1_value;
		if(sp2_value < 0)
			sp2_value = 0 - sp2_value;
		
		if(sp2_value < sp1_value) {
			mlog(SPELLS__STACKING, "Spell %s (value %d) is not as good as %s (value %d). Rejecting %s.",
				sp2.name, sp2_value, sp1.name, sp1_value, sp2.name);
			return -1;	// can't stack
		}
		//we dont return here... a better value on this one effect dosent mean they are
		//all better...

		mlog(SPELLS__STACKING, "Spell %s (value %d) is not as good as %s (value %d). We will overwrite %s if there are no other conflicts.",
			sp1.name, sp1_value, sp2.name, sp2_value, sp1.name);
		will_overwrite = true;
	}
	
	//if we get here, then none of the values on the new spell are "worse"
	//so now we see if this new spell is any better, or if its not related at all
	if(will_overwrite) {
		mlog(SPELLS__STACKING, "Stacking code decided that %s should overwrite %s.", sp2.name, sp1.name);
		return(1);
	}
	
	mlog(SPELLS__STACKING, "Stacking code decided that %s is not affected by %s.", sp2.name, sp1.name);
	return 0;
}


// returns the slot the buff was added to, -1 if it wasn't added due to
// stacking problems, and -2 if this is not a buff
// if caster is null, the buff will be added with the caster level being
// the level of the mob
int Mob::AddBuff(Mob *caster, int16 spell_id, int duration, sint32 level_override)
{
	
	int buffslot, ret, caster_level, emptyslot = -1;
	bool will_overwrite = false;
	vector<int> overwrite_slots;
	
	if(level_override > 0)
		caster_level = level_override;
	else
		caster_level = caster ? caster->GetCasterLevel(spell_id) : GetCasterLevel(spell_id);
    
	if(duration == 0)
	{
		duration = CalcBuffDuration(caster, this, spell_id);

#ifdef EQBOTS

		if(caster && caster->IsBot()) {
			duration = caster->GetBotActSpellDuration(spell_id, duration);
		}
		else

#endif //EQBOTS

		if(caster)
			duration = caster->GetActSpellDuration(spell_id, duration);
	}

	if(duration == 0) {
		mlog(SPELLS__BUFFS, "Buff %d failed to add because its duration came back as 0.", spell_id);
		return -2;	// no duration? this isn't a buff
	}
	
	mlog(SPELLS__BUFFS, "Trying to add buff %d cast by %s (cast level %d) with duration %d",
		spell_id, caster?caster->GetName():"UNKNOWN", caster_level, duration);

	// solar: first we loop through everything checking that the spell
	// can stack with everything.  this is to avoid stripping the spells
	// it would overwrite, and then hitting a buff we can't stack with.
	// we also check if overwriting will occur.  this is so after this loop
	// we can determine if there will be room for this buff
	for(buffslot = 0; buffslot < BUFF_COUNT; buffslot++)
	{
		const Buffs_Struct &curbuf = buffs[buffslot];

		if(curbuf.spellid != SPELL_UNKNOWN)
		{
			// there's a buff in this slot
			ret = CheckStackConflict(curbuf.spellid, curbuf.casterlevel, spell_id, caster_level, entity_list.GetMobID(curbuf.casterid), caster);
			if(ret == -1) {	// stop the spell
				mlog(SPELLS__BUFFS, "Adding buff %d failed: stacking prevented by spell %d in slot %d with caster level %d", spell_id, curbuf.spellid, buffslot, curbuf.casterlevel);
				return -1;
			}
			if(ret == 1) {	// set a flag to indicate that there will be overwriting
				mlog(SPELLS__BUFFS, "Adding buff %d will overwrite spell %d in slot %d with caster level %d", spell_id, curbuf.spellid, buffslot, curbuf.casterlevel);
				will_overwrite = true;
				overwrite_slots.push_back(buffslot);
			}
		}
		else
		{
			if(emptyslot == -1)
				emptyslot = buffslot;
		}
	}
	
	// we didn't find an empty slot to put it in, and it's not overwriting
	// anything so there must not be any room left.
 	if(emptyslot == -1 && !will_overwrite)
 	//	return -1;
 	{
 		if(IsDetrimentalSpell(spell_id)) //Sucks to be you, bye bye one of your buffs
 		{
 			for(buffslot = 0; buffslot < BUFF_COUNT; buffslot++)
 			{
 				const Buffs_Struct &curbuf = buffs[buffslot];
 				if(IsBeneficialSpell(curbuf.spellid))
 				{
 					mlog(SPELLS__BUFFS, "No slot for detrimental buff %d, so we are overwriting a beneficial buff %d in slot %d", spell_id, curbuf.spellid, buffslot);
 					BuffFadeBySlot(buffslot,false);
 					emptyslot = buffslot;
					break;
 				}
 			}
 			if(emptyslot == -1) {
	 			mlog(SPELLS__BUFFS, "Unable to find a buff slot for detrimental buff %d", spell_id);
				return(-1);
 			}
 		}
 		else {
 			mlog(SPELLS__BUFFS, "Unable to find a buff slot for beneficial buff %d", spell_id);
 			return -1;
 		}
 	}

	// solar: at this point we know that this buff will stick, but we have
	// to remove some other buffs already worn if will_overwrite is true
	if(will_overwrite)
	{
		vector<int>::iterator cur, end;
		cur = overwrite_slots.begin();
		end = overwrite_slots.end();
		for(; cur != end; cur++) {
			// strip spell
			BuffFadeBySlot(*cur, false);

			// if we hadn't found a free slot before, or if this is earlier
			// we use it
			if(emptyslot == -1 || *cur < emptyslot)
				emptyslot = *cur;
		}
	}

	// now add buff at emptyslot
	assert(buffs[emptyslot].spellid == SPELL_UNKNOWN);	// sanity check
	
	buffs[emptyslot].spellid = spell_id;
	buffs[emptyslot].casterlevel = caster_level;
	buffs[emptyslot].casterid = caster ? caster->GetID() : 0;
	buffs[emptyslot].durationformula = spells[spell_id].buffdurationformula;
	buffs[emptyslot].ticsremaining = duration;
	buffs[emptyslot].diseasecounters = 0;
	buffs[emptyslot].poisoncounters = 0;
	buffs[emptyslot].cursecounters = 0;
	buffs[emptyslot].numhits = spells[spell_id].numhits;
	buffs[emptyslot].client = caster ? caster->IsClient() : 0;

	if(level_override > 0)
	{
		buffs[emptyslot].UpdateClient = true;
	}
	else{ 
		if(buffs[emptyslot].ticsremaining > (1+CalcBuffDuration_formula(caster_level, spells[spell_id].buffdurationformula, spells[spell_id].buffduration)))
			buffs[emptyslot].UpdateClient = true;
	}
		
	mlog(SPELLS__BUFFS, "Buff %d added to slot %d with caster level %d", spell_id, emptyslot, caster_level);
	if(IsPet() && GetOwner() && GetOwner()->IsClient()) {
		SendPetBuffsToClient();
	}

	if((IsClient() && !CastToClient()->GetPVP()) || (IsPet() && GetOwner() && GetOwner()->IsClient() && !GetOwner()->CastToClient()->GetPVP()))
	{
		EQApplicationPacket *outapp = MakeTargetBuffsPacket();

		entity_list.QueueClientsByTarget(this, outapp, true, NULL, true, false, BIT_SoDAndLater);

		safe_delete(outapp);
	}
	
	// recalculate bonuses since we stripped/added buffs
	CalcBonuses();

	return emptyslot;
}

// solar: used by some MobAI stuff
// NOT USED BY SPELL CODE
// note that this should not be used for determining which slot to place a 
// buff into
// returns -1 on stack failure, -2 if all slots full, the slot number if the buff should overwrite another buff, or a free buff slot
int Mob::CanBuffStack(int16 spellid, int8 caster_level, bool iFailIfOverwrite)
{
	int i, ret, firstfree = -2;
	
	mlog(AI__BUFFS, "Checking if buff %d cast at level %d can stack on me.%s", spellid, caster_level, iFailIfOverwrite?" failing if we would overwrite something":"");
	
	for (i=0; i < BUFF_COUNT; i++)
	{
		const Buffs_Struct &curbuf = buffs[i];

		// no buff in this slot
		if (curbuf.spellid == SPELL_UNKNOWN)
		{
			// if we haven't found a free slot, this is the first one so save it
			if(firstfree == -2)
				firstfree = i;
			continue;
		}

		if(curbuf.spellid == spellid)
			return(-1);	//do not recast a buff we already have on, we recast fast enough that we dont need to refresh our buffs

		// there's a buff in this slot
		ret = CheckStackConflict(curbuf.spellid, curbuf.casterlevel, spellid, caster_level);
		if(ret == 1) {
			// should overwrite current slot
			if(iFailIfOverwrite) {
				mlog(AI__BUFFS, "Buff %d would overwrite %d in slot %d, reporting stack failure", spellid, curbuf.spellid, i);
				return(-1);
			}
			if(firstfree == -2)
				firstfree = i;
		}	
		if(ret == -1) {
			mlog(AI__BUFFS, "Buff %d would conflict with %d in slot %d, reporting stack failure", spellid, curbuf.spellid, i);
			return -1;	// stop the spell, can't stack it
		}
	}
	
	mlog(AI__BUFFS, "Reporting that buff %d could successfully be placed into slot %d", spellid, firstfree);

	return firstfree;
}

///////////////////////////////////////////////////////////////////////////////
// spell effect related functions

//
// solar:
// this is actually applying a spell cast from 'this' on 'spelltar'
// it performs pvp checking and applies resists, etc then it
// passes it to SpellEffect which causes effects to the target
//
// this is called by these functions:
// Mob::SpellFinished
// Entity::AESpell (called by Mob::SpellFinished)
// Group::CastGroupSpell (called by Mob::SpellFinished)
//
// also note you can't interrupt the spell here. at this point it's going
// and if you don't want effects just return false.  interrupting here will
// break stuff
//
bool Mob::SpellOnTarget(int16 spell_id, Mob* spelltar)
{
	EQApplicationPacket *action_packet, *message_packet;
	float spell_effectiveness;

	if(!IsValidSpell(spell_id))
		return false;

	// well we can't cast a spell on target without a target
	if(!spelltar)
	{
		mlog(SPELLS__CASTING_ERR, "Unable to apply spell %d without a target", spell_id);
		Message(13, "SOT: You must have a target for this spell.");
		return false;
	}

#ifdef EQBOTS

	if(spelltar->IsBot() && (spells[spell_id].targettype == ST_GroupTeleport)) {
		// So I made this check because teleporting a group of bots tended to crash the zone
		// It seems several group spells also show up as ST_GroupTeleport for some
		// reason so I now have to check by spell id. These appear to be Group v1 spells and
		// Heal over Time spells.
		switch(spell_id) {
			// Paladin
			case 3577: // Wave of Life
			case 4065: // Blessing of Austerity
			case 1455: // Wave of Healing
			case 2589: // Healing Wave of Prexus
			case 3427: // Wave of Marr
			case 3683: // Ethereal Cleansing
			case 1283: // Celestial Cleansing
			case 3485: // Supernal Cleansing
			case 5293: // Pious Cleansing
			case 4893: // Wave of Trushar
			case 5295: // Jeron's Mark
			case 5296: // Wave of Piety
			// Bard
			case 4085: // Forpar's Aria of Affliction
			case 4083: // Rizlona's Embers
			case 4086: // Forpar's Psalm of Pain
			case 4084: // Rizlona's Fire
			case 6734: // Song of the Storm
			case 3651: // Wind of Marr
			case 4087: // Forpar's Verse of Venom
			case 3362: // Rizlona's Call of Flame
			case 4112: // Call of the Muse
			case 4872: // Echo of the Trusik
			case 4873: // Dark Echo
			case 5377: // Cantata of Life
			case 5380: // Yelhun's Mystic Call
			case 5382: // Eriki's Psalm of Power
			case 6666: // Storm Blade
			case 5388: // Ancient Call of Power
			// Cleric
			case 134: // Word of Health
			case 136: // Word of Healing
			case 1520: // Word of Vigor
			case 1521: // Word of Restoration
			case 1523: // Word of Redemption
			case 3471: // Word of Replenishment
			case 5270: // Word of Vivification
			case 2502: // Celestial Remedy
			case 2175: // Celestial Health
			case 1444: // Celestial Healing
			case 1522: // Celestial Elixir
			case 2180: // Etherial Elixir
			case 3047: // Kazad's Mark
			case 3475: // Supernal Elixir
			case 4053: // Blessing of Temperance
			case 4108: // Aura of Reverence
			case 4882: // Holy Elixir
			case 5259: // Pious Elixir
			case 5272: // Aura of Devotion
			case 5277: // Balikor's Mark
			// Enchanter
			case 5517: // Circle of Alendar
			case 6671: // Rune of Rikkukin
			case 6739: // Rune of the Scale
			// Shaman
			case 2521: // Talisman of the Beast
			case 4055: // Pack Shrew
			case 3842: // Blood of Nadox
			case 5417: // Champion
			// Druid
			case 4058: // Feral Pack
			case 2520: // Natures Recovery
				break;
			default:
				return false;
		}
	}

	if ((IsClient()) && (zone->IsClassic()) && (this->GetLevel() >= 50)){
	  if(spelltar->GetLevel() <= 49){
	    Message(13, "SOT: Trivial target in a classic zone.");
		return false;
	  }
	}
	if ((zone->IsClassic()) && (IsBot()) && (this->GetLevel() >= 50)){
	  if(spelltar->GetLevel() <= 49){
	    //CastToClient()->Message(13, "This is a trivial target in a classic zone.");
		return false;
	  }
	}	
	//Franck-add: can't detrimental spell on bots and bots can't detriment on you or the others bots
	if((IsBot() && IsDetrimentalSpell(spell_id) && spelltar->IsBot()) ||
		(IsBot() && IsDetrimentalSpell(spell_id) && spelltar->IsClient()) ||
		(IsClient() && IsDetrimentalSpell(spell_id) && spelltar->IsBot()))
		return false;

	if(IsBot() && spelltar->IsPet())
	{
		for(int i=0; i<EFFECT_COUNT; ++i)
		{
			if(spells[spell_id].effectid[i] == SE_Illusion)
				return false;
		}
	}

#endif //EQBOTS

	int16 caster_level = GetCasterLevel(spell_id);
	
	mlog(SPELLS__CASTING, "Casting spell %d on %s with effective caster level %d", spell_id, spelltar->GetName(), caster_level);
	
	// Actual cast action - this causes the caster animation and the particles
	// around the target
	// solar: we do this first, that way we get the particles even if the spell
	// doesn't land due to pvp protection
	// note: this packet is sent again if the spell is successful, with a flag
	// set
	action_packet = new EQApplicationPacket(OP_Action, sizeof(Action_Struct));
	Action_Struct* action = (Action_Struct*) action_packet->pBuffer;

	// select source
	if(IsClient() && CastToClient()->GMHideMe())
	{
		action->source = spelltar->GetID();
	}
	else
	{
		action->source = GetID();
		// solar: this is a hack that makes detrimental buffs work client to client
		// TODO figure out how to do this right
		if
		(
			IsDetrimentalSpell(spell_id) &&
			IsClient() &&
			spelltar->IsClient()
		)
		{
			action->source = spelltar->GetID();
		}
	}

	// select target
	if	// Bind Sight line of spells 
	(
		spell_id == 500 || 	// bind sight
		spell_id == 407 		// cast sight
	)
	{ 
		action->target = GetID(); 
	} 
	else
	{ 
		action->target = spelltar->GetID(); 
	} 

	action->level = caster_level;	// caster level, for animation only
	action->type = 231;	// 231 means a spell
	action->spell = spell_id;
	action->sequence = (int32) (GetHeading() * 2);	// just some random number
	action->instrument_mod = GetInstrumentMod(spell_id);
	action->buff_unknown = 0;

	if(spelltar->IsClient())	// send to target
		spelltar->CastToClient()->QueuePacket(action_packet);
	if(IsClient())	// send to caster
		CastToClient()->QueuePacket(action_packet);
	// send to people in the area, ignoring caster and target
#ifdef EQBOTS
	int32 HasBuffs; //Angelox: Send to bots if not zoning
	HasBuffs = spelltar->CheckBotBuffs(spelltar->GetNPCTypeID());
	if((spelltar->IsBot()) && (HasBuffs == 0))
	  entity_list.QueueCloseClients(spelltar, action_packet, true, 200, this, true, spelltar->IsClient() ? FILTER_PCSPELLS : FILTER_NPCSPELLS);
	if(!spelltar->IsBot())
#endif
	  entity_list.QueueCloseClients(spelltar, action_packet, true, 200, this, true, spelltar->IsClient() ? FILTER_PCSPELLS : FILTER_NPCSPELLS); 
        // end of action packet

       /* Send the EVENT_CAST_ON event */
       if(spelltar->IsNPC())
       {       char temp1[100];
               sprintf(temp1, "%d", spell_id);
               parse->Event(EVENT_CAST_ON, spelltar->GetNPCTypeID(), temp1, spelltar->CastToNPC(), this);
       }

	// solar: now check if the spell is allowed to land
	
	// invuln mobs can't be affected by any spells, good or bad
	if(spelltar->GetInvul() || spelltar->DivineAura()) {
		mlog(SPELLS__CASTING_ERR, "Casting spell %d on %s aborted: they are invulnerable.", spell_id, spelltar->GetName());
		safe_delete(action_packet);
		return false;
	}
	
	//cannot hurt untargetable mobs
	bodyType bt = spelltar->GetBodyType();
	if(bt == BT_NoTarget || bt == BT_NoTarget2) {
		mlog(SPELLS__CASTING_ERR, "Casting spell %d on %s aborted: they are untargetable", spell_id, spelltar->GetName());
		safe_delete(action_packet);
		return(false);
	}

	// Prevent double invising, which made you uninvised
	// Not sure if all 3 should be stacking
	if(IsEffectInSpell(spell_id, SE_Invisibility))
	{
		if(spelltar->invisible)
		{
			spelltar->Message_StringID(MT_Shout, ALREADY_INVIS, GetCleanName());
			safe_delete(action_packet);
			return false;
		}
	}

	if(IsEffectInSpell(spell_id, SE_InvisVsUndead))
	{
		if(spelltar->invisible_undead)
		{
			spelltar->Message_StringID(MT_Shout, ALREADY_INVIS, GetCleanName());
			safe_delete(action_packet);
			return false;
		}
	}

	if(IsEffectInSpell(spell_id, SE_InvisVsAnimals))
	{
		if(spelltar->invisible_animals)
		{
			spelltar->Message_StringID(MT_Shout, ALREADY_INVIS, GetCleanName());
			safe_delete(action_packet);
			return false;
		}
	}

	if(!(IsClient() && CastToClient()->GetGM()) && !IsHarmonySpell(spell_id))	// GMs can cast on anything
	{
		// Beneficial spells check
		if(IsBeneficialSpell(spell_id))
		{
			if
			(
				IsClient() &&	//let NPCs do beneficial spells on anybody if they want, should be the job of the AI, not the spell code to prevent this from going wrong
				spelltar != this &&
				(
					!IsBeneficialAllowed(spelltar) ||
					(
						IsGroupOnlySpell(spell_id) &&
						!(
							(entity_list.GetGroupByMob(this) &&
							entity_list.GetGroupByMob(this)->IsGroupMember(spelltar)) ||
							(spelltar == GetPet()) //should be able to cast grp spells on self and pet despite grped status.
						)
					)
				)
			)
			{
				mlog(SPELLS__CASTING_ERR, "Beneficial spell %d can't take hold %s -> %s, IBA? %d", spell_id, GetName(), spelltar->GetName(), IsBeneficialAllowed(spelltar));
				Message_StringID(MT_Shout, SPELL_NO_HOLD);
				safe_delete(action_packet);
				return false;
			}
		}
		else if	( !IsAttackAllowed(spelltar, true) && !IsResurrectionEffects(spell_id)) // Detrimental spells - PVP check
		{
			mlog(SPELLS__CASTING_ERR, "Detrimental spell %d can't take hold %s -> %s", spell_id, GetName(), spelltar->GetName());
			spelltar->Message_StringID(MT_Shout, YOU_ARE_PROTECTED, GetCleanName());
			safe_delete(action_packet);
			return false;
		}
	}

	// solar: ok at this point the spell is permitted to affect the target,
	// but we need to check special cases and resists


	// check immunities
	if(spelltar->IsImmuneToSpell(spell_id, this))
	{
		//the above call does the message to the client if needed
		mlog(SPELLS__RESISTS, "Spell %d can't take hold due to immunity %s -> %s", spell_id, GetName(), spelltar->GetName());
		safe_delete(action_packet);
		return false;
	}

	//check for AE_Undead
	if(spells[spell_id].targettype == ST_UndeadAE){
		if(spelltar->GetBodyType() != BT_SummonedUndead && 
			spelltar->GetBodyType() != BT_Undead && 
			spelltar->GetBodyType() != BT_Vampire)
		{
			return false;
		}
	}


	// solar: resist check - every spell can be resisted, beneficial or not
	// add: ok this isn't true, eqlive's spell data is fucked up, buffs are
	// not all unresistable, so changing this to only check certain spells
	if(IsResistableSpell(spell_id))
	{
		spell_effectiveness = spelltar->ResistSpell(spells[spell_id].resisttype, spell_id, this);
		if(spell_effectiveness < 100)
		{
			if(spell_effectiveness == 0 || !IsPartialCapableSpell(spell_id) )
			{
				mlog(SPELLS__RESISTS, "Spell %d was completely resisted by %s", spell_id, spelltar->GetName());
				Message_StringID(MT_Shout, TARGET_RESISTED, spells[spell_id].name);
				spelltar->Message_StringID(MT_Shout, YOU_RESIST, spells[spell_id].name);

				if(spelltar->IsAIControlled()){
					sint32 aggro = CheckAggroAmount(spell_id);
					if(aggro > 0) {
						if(!IsHarmonySpell(spell_id))
						spelltar->AddToHateList(this, aggro);
						else
							if(!PassCharismaCheck(this, spelltar, spell_id))
								spelltar->AddToHateList(this, aggro);
					}
					else{
						sint32 newhate = spelltar->GetHateAmount(this) + aggro;
						if (newhate < 1) {
							spelltar->SetHate(this,1);
						} else {
							spelltar->SetHate(this,newhate);
						}
					}
				}

				safe_delete(action_packet);
				return false;
			}
		}
	}
	else
	{
		spell_effectiveness = 100;
	}

		// Recourse means there is a spell linked to that spell in that the recourse spell will
		// be automatically casted on the casters group or the caster only depending on Targettype
		// solar: this is for things like dark empathy, shadow vortex
		int recourse_spell=0;
		recourse_spell = spells[spell_id].RecourseLink;
		if(recourse_spell)
		{
			if(spells[recourse_spell].targettype == ST_Group || spells[recourse_spell].targettype == ST_GroupTeleport)
			{
				if(IsGrouped())
				{
					Group *g = entity_list.GetGroupByMob(this);
					if(g)
					g->CastGroupSpell(this, recourse_spell);
					else{
						SpellOnTarget(recourse_spell, this);
#ifdef GROUP_BUFF_PETS
						if (GetPet())
							SpellOnTarget(recourse_spell, GetPet());
#endif
					}
				}
				else if(IsRaidGrouped() && IsClient())
				{
					Raid *r = entity_list.GetRaidByClient(CastToClient());
					int32 gid = 0xFFFFFFFF;
					if(r)
					gid = r->GetGroup(GetName());
					else
						gid = 13;	// Forces ungrouped spell casting

					if(gid < 12)
					{
						r->CastGroupSpell(this, recourse_spell, gid);
					}
					else{
						SpellOnTarget(recourse_spell, this);
#ifdef GROUP_BUFF_PETS
						if (GetPet())
							SpellOnTarget(recourse_spell, GetPet());
#endif
					}
				}
				else if(HasOwner())
				{
					if(GetOwner()->IsGrouped())
					{
						Group *g = entity_list.GetGroupByMob(GetOwner());
						if(g)
						g->CastGroupSpell(this, recourse_spell);
						else{
							SpellOnTarget(recourse_spell, GetOwner());
							SpellOnTarget(recourse_spell, this);
						}
					}
					else if(GetOwner()->IsRaidGrouped() && GetOwner()->IsClient())
					{
						Raid *r = entity_list.GetRaidByClient(GetOwner()->CastToClient());
						int32 gid = 0xFFFFFFFF;
						if(r)
							gid = r->GetGroup(GetOwner()->GetName());
						else
							gid = 13;	// Forces ungrouped spell casting

						if(gid < 12)
						{
							r->CastGroupSpell(this, recourse_spell, gid);
						}
						else
						{
							SpellOnTarget(recourse_spell, GetOwner());
							SpellOnTarget(recourse_spell, this);
						}
					}
					else
					{
						SpellOnTarget(recourse_spell, GetOwner());
						SpellOnTarget(recourse_spell, this);
					}
				}
				else
				{
					SpellOnTarget(recourse_spell, this);
#ifdef GROUP_BUFF_PETS
					if (GetPet())
						SpellOnTarget(recourse_spell, GetPet());
#endif
				}	

			}
			else
			{
				SpellOnTarget(recourse_spell, this);
			}
		}


	if(spell_id == 982)	// Cazic Touch, hehe =P
	{
		char target_name[64];
		strcpy(target_name, spelltar->GetCleanName());
		strupr(target_name);
		Shout("%s!", target_name);
	}

	if (spelltar->IsAIControlled() && IsDetrimentalSpell(spell_id) && !IsHarmonySpell(spell_id)) {
		sint32 aggro_amount = CheckAggroAmount(spell_id);
		mlog(SPELLS__CASTING, "Spell %d cast on %s generated %d hate", spell_id, spelltar->GetName(), aggro_amount);
		if(aggro_amount > 0)
			spelltar->AddToHateList(this, aggro_amount);
		else{
			sint32 newhate = spelltar->GetHateAmount(this) + aggro_amount;
			if (newhate < 1) {
				spelltar->SetHate(this,1);
			} else {
				spelltar->SetHate(this,newhate);
			}
		}
	}
	else if (IsBeneficialSpell(spell_id) && !IsSummonPCSpell(spell_id))
		entity_list.AddHealAggro(spelltar, this, CheckHealAggroAmount(spell_id, (spelltar->GetMaxHP() - spelltar->GetHP())));

	// cause the effects to the target
	if(!spelltar->SpellEffect(this, spell_id, spell_effectiveness))
	{
		// solar: if SpellEffect returned false there's a problem applying the
		// spell.  It's most likely a buff that can't stack.
		mlog(SPELLS__CASTING_ERR, "Spell %d could not apply its effects %s -> %s\n", spell_id, GetName(), spelltar->GetName());
		Message_StringID(MT_Shout, SPELL_NO_HOLD);
		safe_delete(action_packet);
		return false;
	}

	// solar: send the action packet again now that the spell is successful
	// NOTE: this is what causes the buff icon to appear on the client, if
	// this is a buff - but it sortof relies on the first packet.
	// the complete sequence is 2 actions and 1 damage message
	action->buff_unknown = 0x04;	// this is a success flag

	if(IsEffectInSpell(spell_id, SE_TossUp))
	{
		action->buff_unknown = 0;
	}
	else if(spells[spell_id].pushback > 0 || spells[spell_id].pushup > 0)
	{
		if(spelltar->IsClient())
		{
			if(HasBuffIcon(this, spelltar, spell_id) == false)
			{
				spelltar->CastToClient()->SetKnockBackExemption(true);

				action->buff_unknown = 0;
				EQApplicationPacket* outapp_push = new EQApplicationPacket(OP_ClientUpdate, sizeof(PlayerPositionUpdateServer_Struct));
				PlayerPositionUpdateServer_Struct* spu = (PlayerPositionUpdateServer_Struct*)outapp_push->pBuffer;

				double look_heading = CalculateHeadingToTarget(spelltar->GetX(), spelltar->GetY());
				look_heading /= 256;
				look_heading *= 360;
				if(look_heading > 360)
					look_heading -= 360;

				//x and y are crossed mkay
				double new_x = spells[spell_id].pushback * sin(double(look_heading * 3.141592 / 180.0));
				double new_y = spells[spell_id].pushback * cos(double(look_heading * 3.141592 / 180.0));

				spu->spawn_id	= spelltar->GetID();
				spu->x_pos		= FloatToEQ19(spelltar->GetX());
				spu->y_pos		= FloatToEQ19(spelltar->GetY());
				spu->z_pos		= FloatToEQ19(spelltar->GetZ());
				spu->delta_x	= NewFloatToEQ13(new_x);
				spu->delta_y	= NewFloatToEQ13(new_y);
				spu->delta_z	= NewFloatToEQ13(spells[spell_id].pushup);
				spu->heading	= FloatToEQ19(spelltar->GetHeading());
				spu->padding0002	=0;
				spu->padding0006	=7;
				spu->padding0014	=0x7f;
				spu->padding0018	=0x5df27;
				spu->animation = 0;
				spu->delta_heading = NewFloatToEQ13(0);
				outapp_push->priority = 6;
				entity_list.QueueClients(this, outapp_push, true);
				spelltar->CastToClient()->FastQueuePacket(&outapp_push);
			}
		}
	}

	if(spelltar->IsClient() && IsEffectInSpell(spell_id, SE_ShadowStep))
	{
		spelltar->CastToClient()->SetShadowStepExemption(true);
	}

	if(!IsEffectInSpell(spell_id, SE_BindAffinity))
	{
		if(spelltar->IsClient())	// send to target
			spelltar->CastToClient()->QueuePacket(action_packet);
		if(IsClient())	// send to caster
			CastToClient()->QueuePacket(action_packet);
	}
	// send to people in the area, ignoring caster and target
	//live dosent send this to anybody but the caster
	//entity_list.QueueCloseClients(spelltar, action_packet, true, 200, this, true, spelltar->IsClient() ? FILTER_PCSPELLS : FILTER_NPCSPELLS);

	// solar: TEMPORARY - this is the message for the spell.
	// double message on effects that use ChangeHP - working on this
	message_packet = new EQApplicationPacket(OP_Damage, sizeof(CombatDamage_Struct));
	CombatDamage_Struct *cd = (CombatDamage_Struct *)message_packet->pBuffer;
	cd->target = action->target;
	cd->source = action->source;
	cd->type = action->type;
	
#ifdef EQBOTS //Angelox: Send to bots if not zoning
	if((spelltar->IsBot()) && (HasBuffs == 0))
	  cd->spellid = action->spell;
	if(!spelltar->IsBot())
#endif	  
	  cd->spellid = action->spell;
	
	cd->sequence = action->sequence;
	cd->damage = 0;

	if(!IsEffectInSpell(spell_id, SE_BindAffinity))
	{
		entity_list.QueueCloseClients(spelltar, message_packet, false, 200, 0, true, spelltar->IsClient() ? FILTER_PCSPELLS : FILTER_NPCSPELLS);
	}
	safe_delete(action_packet);
	safe_delete(message_packet);
	
	mlog(SPELLS__CASTING, "Cast of %d by %s on %s complete successfully.", spell_id, GetName(), spelltar->GetName());
		
	return true;
}

void Corpse::CastRezz(int16 spellid, Mob* Caster){

	_log(SPELLS__REZ, "Corpse::CastRezz spellid %i, Rezzed() is %i, rezzexp is %i", spellid,Rezzed(),rezzexp);

	if(Rezzed()){
		if(Caster && Caster->IsClient())
			Caster->Message(13,"This character has already been resurrected.");
		return;
	}

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_RezzRequest, sizeof(Resurrect_Struct));
	Resurrect_Struct* rezz = (Resurrect_Struct*) outapp->pBuffer;
      // Why are we truncating these names to 30 characters ?
	memcpy(rezz->your_name,this->orgname,30);
	memcpy(rezz->corpse_name,this->name,30);
	memcpy(rezz->rezzer_name,Caster->GetName(),30);
	rezz->zone_id = zone->GetZoneID();
	rezz->instance_id = zone->GetInstanceID();
	rezz->spellid = spellid;
	rezz->x = this->x_pos;
	rezz->y = this->y_pos;
	rezz->z = this->z_pos;
	rezz->unknown000 = 0x00000000;
	rezz->unknown020 = 0x00000000;
	rezz->unknown088 = 0x00000000;
	// We send this to world, because it needs to go to the player who may not be in this zone.
	worldserver.RezzPlayer(outapp, rezzexp, OP_RezzRequest);
	_pkt(SPELLS__REZ, outapp);
	safe_delete(outapp);
}

bool Mob::FindBuff(int16 spellid)
{
	int i;

	for(i = 0; i < BUFF_COUNT; i++)
		if(buffs[i].spellid == spellid)
			return true;

	return false;
}

// solar: removes all buffs
void Mob::BuffFadeAll()
{
	for (int j = 0; j < BUFF_COUNT; j++) {
		if(buffs[j].spellid != SPELL_UNKNOWN)
			BuffFadeBySlot(j, false);
	}
	//we tell BuffFadeBySlot not to recalc, so we can do it only once when were done
	CalcBonuses();
}

void Mob::BuffFadeDetrimental() {
	for (int j = 0; j < BUFF_COUNT; j++) {
		if(buffs[j].spellid != SPELL_UNKNOWN) {
			if(IsDetrimentalSpell(buffs[j].spellid))
				BuffFadeBySlot(j, false);
		}
	}
}

void Mob::BuffFadeDetrimentalByCaster(Mob *caster)
{
	if(!caster)
		return;

	for (int j = 0; j < BUFF_COUNT; j++) {
		if(buffs[j].spellid != SPELL_UNKNOWN) {
			if(IsDetrimentalSpell(buffs[j].spellid))
			{
				//this is a pretty terrible way to do this but 
				//there really isn't another way till I rewrite the basics
				Mob * c = entity_list.GetMob(buffs[j].casterid);
				if(c && c == caster)
					BuffFadeBySlot(j, false);
			}
		}
	}
}

// solar: removes the buff matching spell_id
void Mob::BuffFadeBySpellID(int16 spell_id)
{
	for (int j = 0; j < BUFF_COUNT; j++)
	{
		if (buffs[j].spellid == spell_id)
			BuffFadeBySlot(j, false);
	}

	//we tell BuffFadeBySlot not to recalc, so we can do it only once when were done
	CalcBonuses();
}

// solar: removes buffs containing effectid, skipping skipslot
void Mob::BuffFadeByEffect(int effectid, int skipslot)
{
	int i;

	for(i = 0; i < BUFF_COUNT; i++)
	{
		if(buffs[i].spellid == SPELL_UNKNOWN)
			continue;
		if(IsEffectInSpell(buffs[i].spellid, effectid) && i != skipslot)
			BuffFadeBySlot(i, false);
	}

	//we tell BuffFadeBySlot not to recalc, so we can do it only once when were done
	CalcBonuses();
}

// solar: checks if 'this' can be affected by spell_id from caster
// returns true if the spell should fail, false otherwise
bool Mob::IsImmuneToSpell(int16 spell_id, Mob *caster)
{
	_ZP(Mob_IsImmuneToSpell);
	int effect_index;

	if(caster == NULL)
		return(false);
	
	//TODO: this function loops through the effect list for 
	//this spell like 10 times, this could easily be consolidated
	//into one loop through with a switch statement.
	
	mlog(SPELLS__RESISTS, "Checking to see if we are immune to spell %d cast by %s", spell_id, caster->GetName());
	
	if(!IsValidSpell(spell_id))
		return true;

	if(IsMezSpell(spell_id))
	{
		if(SpecAttacks[UNMEZABLE]) {
			mlog(SPELLS__RESISTS, "We are immune to Mez spells.");
			caster->Message_StringID(MT_Shout, CANNOT_MEZ);
			AddToHateList(caster);
			return true;
		}

		// check max level for spell
		effect_index = GetSpellEffectIndex(spell_id, SE_Mez);
		assert(effect_index >= 0);
		if(GetLevel() > spells[spell_id].max[effect_index])
		{
			mlog(SPELLS__RESISTS, "Our level (%d) is higher than the limit of this Mez spell (%d)", GetLevel(), spells[spell_id].max[effect_index]);
			caster->Message_StringID(MT_Shout, CANNOT_MEZ_WITH_SPELL);
			return true;
		}
	}

	// slow and haste spells
	if(SpecAttacks[UNSLOWABLE] && IsEffectInSpell(spell_id, SE_AttackSpeed))
	{
		mlog(SPELLS__RESISTS, "We are immune to Slow spells.");
		caster->Message_StringID(MT_Shout, IMMUNE_ATKSPEED);
		return true;
	}

	// client vs client fear
	if(IsEffectInSpell(spell_id, SE_Fear))
	{
		effect_index = GetSpellEffectIndex(spell_id, SE_Fear);
		if(SpecAttacks[UNFEARABLE]) {
			mlog(SPELLS__RESISTS, "We are immune to Fear spells.");
			caster->Message_StringID(MT_Shout, IMMUNE_FEAR);
			return true;
		} else if(IsClient() && caster->IsClient() && (caster->CastToClient()->GetGM() == false))
		{
			mlog(SPELLS__RESISTS, "Clients cannot fear eachother!");
			caster->Message_StringID(MT_Shout, IMMUNE_FEAR);
			return true;
		}
		else if(GetLevel() > spells[spell_id].max[effect_index] && spells[spell_id].max[effect_index] != 0)
		{
			mlog(SPELLS__RESISTS, "Level is %d, cannot be feared by this spell.", GetLevel());
			caster->Message_StringID(MT_Shout, SPELL_NO_EFFECT);
			return true;
		}
	}

	if(IsCharmSpell(spell_id))
	{
		if(SpecAttacks[UNCHARMABLE])
		{
			mlog(SPELLS__RESISTS, "We are immune to Charm spells.");
			caster->Message_StringID(MT_Shout, CANNOT_CHARM);
			return true;
		}

		if(this == caster)
		{
			mlog(SPELLS__RESISTS, "You are immune to your own charms.");
			caster->Message(MT_Shout, "You cannot charm yourself!");
			return true;
		}
		if(IsPet())//Angelox
		{
			mlog(SPELLS__RESISTS, "Pets are imune to charms.");
			caster->Message(MT_Shout, "You cannot charm pets!");
			return true;
		}
		//let npcs cast whatever charm on anyone
		if(!caster->IsNPC())
		{
			// check level limit of charm spell
			effect_index = GetSpellEffectIndex(spell_id, SE_Charm);
			assert(effect_index >= 0);
			if(GetLevel() > spells[spell_id].max[effect_index] && spells[spell_id].max[effect_index] != 0)
			{
				mlog(SPELLS__RESISTS, "Our level (%d) is higher than the limit of this Charm spell (%d)", GetLevel(), spells[spell_id].max[effect_index]);
				caster->Message_StringID(MT_Shout, CANNOT_CHARM_YET);
				return true;
			}
		}
	}

	if
	(
		IsEffectInSpell(spell_id, SE_Root) ||
		IsEffectInSpell(spell_id, SE_MovementSpeed)
	)
	{
		if(SpecAttacks[UNSNAREABLE]) {
			mlog(SPELLS__RESISTS, "We are immune to Snare spells.");
			caster->Message_StringID(MT_Shout, IMMUNE_MOVEMENT);
			return true;
		}
	}

	if(IsLifetapSpell(spell_id))
	{
		if(this == caster)
		{
			mlog(SPELLS__RESISTS, "You cannot lifetap yourself.");
			caster->Message_StringID(MT_Shout, CANT_DRAIN_SELF);
			return true;
		}
	}

	if(IsSacrificeSpell(spell_id))
	{

#ifdef EQBOTS

		if((zone->GetZoneID() == 202) && (this == caster)) {
			// do nothing
		}
		else

#endif //EQBOTS

		if(this == caster)
		{
			mlog(SPELLS__RESISTS, "You cannot sacrifice yourself.");
			caster->Message_StringID(MT_Shout, CANNOT_SAC_SELF);
			return true;
		}
	}
	

#ifdef EQBOTS

	if(caster->IsBot()) {
		if(spells[spell_id].targettype == ST_Undead) {
			if((GetBodyType() != BT_SummonedUndead)
				&& (GetBodyType() != BT_Undead)
				&& (GetBodyType() != BT_Vampire)
				) {
					mlog(SPELLS__RESISTS, "Bot's target is not an undead.");
					return true;
			}
		}
		if(spells[spell_id].targettype == ST_Summoned) {
			if((GetBodyType() != BT_SummonedUndead)
				&& (GetBodyType() != BT_Summoned)
				&& (GetBodyType() != BT_Summoned2)
				&& (GetBodyType() != BT_Summoned3)
				) {
					mlog(SPELLS__RESISTS, "Bot's target is not a summoned creature.");
					return true;
			}
		}
	}

#endif //EQBOTS

	mlog(SPELLS__RESISTS, "No immunities to spell %d found.", spell_id);
	
	return false;
}

//
// solar: spell resists:
// returns an effectiveness index from 0 to 100.  for most spells, 100 means
// it landed, and anything else means it was resisted; however there are some
// spells that can be partially effective, and this value can be used there.
//
float Mob::ResistSpell(int8 resist_type, int16 spell_id, Mob *caster)
{
	int caster_level, target_level, resist;
	float roll, fullchance, resistchance;
	
	if(spell_id != 0 && !IsValidSpell(spell_id))
	{
		return 0;
	}
	
	//this is checked here instead of in the Immune code so it only applies to detrimental spells
	if(SpecAttacks[IMMUNE_MAGIC]) {
		mlog(SPELLS__RESISTS, "We are immune to magic, so we fully resist the spell %d", spell_id);
		return(0);
	}
	
	if(resist_type == RESIST_NONE) {
		//unresistable...
		mlog(SPELLS__RESISTS, "The spell %d is unresistable (type %d)", spell_id, resist_type);
		return(100);
	}

	if(SpecAttacks[IMMUNE_CASTING_FROM_RANGE])
	{
		if(caster)
		{
			if(!caster->CombatRange(this))
				return(0);
		}
	}

	target_level = GetLevel();
	
	if(spell_id == 0) {
		caster_level = caster->GetLevel();
	} else {
		caster_level = caster ? caster->GetCasterLevel(spell_id) : target_level;
	}

	// if NPC target and more than X levels above caster, it's always resisted
	if(IsNPC() && target_level - caster_level > RuleI(Spells, AutoResistDiff)) {
		mlog(SPELLS__RESISTS, "We are %d levels above the caster, which is higher than the %d level auto-resist gap. Fully resisting.",  target_level - caster_level, RuleI(Spells, AutoResistDiff));
 		return 0;
	}
	
	//check for buff/item/aa based fear moditifers
	//still working on this...
	if (spell_id != 0 && IsFearSpell(spell_id)) {
		sint16 rchance = 0;
		switch (GetAA(aaFearResistance))
		{
			case 1:
				rchance += 5;
				break;
			case 2:
				rchance += 15;
				break;
			case 3:
				rchance += 25;
				break;
		}
		rchance += itembonuses.ResistFearChance + spellbonuses.ResistFearChance;
		
		if(GetAA(aaFearless) || (IsClient() && CastToClient()->CheckAAEffect(aaEffectWarcry)))
			rchance = 100;
		
		//I dont think these should get factored into standard spell resist...
		if(MakeRandomInt(0, 99) < rchance) {
			mlog(SPELLS__RESISTS, "Had a %d chance of resisting the fear spell %d, and succeeded.", rchance, spell_id);
			return(0);
		}
		mlog(SPELLS__RESISTS, "Had a %d chance of resisting the fear spell %d, and failed.", rchance, spell_id);
	}

	switch(resist_type) {
	case RESIST_MAGIC:
		resist = GetMR();
		break;

	case RESIST_FIRE:
		resist = GetFR();
		break;
	
	case RESIST_COLD:
		resist = GetCR();
		break;
	
	case RESIST_POISON:
		resist = GetPR();
		break;
	
	case RESIST_DISEASE:
		resist = GetDR();
		break;
	
	// Hvitrev: Primsatic = average of all resists
	case RESIST_PRISMATIC:
		resist = (GetDR()+GetMR()+GetFR()+GetCR()+GetPR())/5;
		break;
	
	// Hvitrev: Chromatic = lowest of all resists
	case RESIST_CHROMATIC: {
		sint16 tempresist = GetMR();
		sint16 tempresist2 = GetFR();
		
		if ( tempresist < tempresist2 )
			resist = tempresist;
		else
			resist = tempresist2;
		tempresist = GetCR();
		if ( tempresist < resist )
			resist = tempresist;
		tempresist = GetDR();
		if ( tempresist < resist )
			resist = tempresist;
		tempresist = GetPR();
		if ( tempresist < resist )
			resist = tempresist;
		break;
	}
	
	// solar: I don't know how to calculate this stuff
	case RESIST_PHYSICAL:
	default:
		resist = GetMR();
		break;
	}

	// value in spell to adjust base resist by
	if(spell_id != 0)
		resist += spells[spell_id].ResistDiff;
		
	//This is our base resist chance given no resists and no level diff, set to a modest 2% by default
	resistchance = RuleR(Spells, ResistChance); 
	
	//changed this again, just straight 8.5 resist points per level above you
	float lvldiff = caster_level - target_level;
	resist += (RuleI(Spells, ResistPerLevelDiff) * (-lvldiff) / 10);

	/*The idea is we come up with 3 ranges of numbers and a roll between 0 and 100
	[[[Empty Space above the resistchance line]]] - If the roll lands up here the spell wasn't resisted, the lower the resist chance the larger this range is
	[[[Space between resistchance line and full resist chance line]]] - If the roll ends up here then the spell is resisted but only partially, we take the roll in porportion to where it landed in this range to det how
	high the partial should be, for example if we rolled barely over the full resist chance line then it would result in a low partial but if we barely missed the spell not resisting then it would result in a very high partial
	The higher the resist the larger this range will be.
	[[[Space below the full resist chance line]]] - If the roll ends up down here then the spell was resisted fully, the higher the resist the larger this range will be.
	*/

	//default 0.40: 500 resist = 200% Base resist while 40 resist = 16% resist base.
	//Set ResistMod lower to require more resist points per percentage point of resistance.
	resistchance += resist * RuleR(Spells, ResistMod); 
	resistchance += spellbonuses.ResistSpellChance + itembonuses.ResistSpellChance;

	if(caster && caster->IsClient())
	{
		if(IsValidSpell(spell_id))
		{
			sint32 focusResist = caster->CastToClient()->GetFocusEffect(focusResistRate, spell_id);
			resistchance = (resistchance * (100-focusResist) / 100);
		}
	}

#ifdef EQBOTS

	if(caster && caster->IsBot())
	{
		if(IsValidSpell(spell_id))
		{
			sint32 focusResist = caster->GetBotFocusEffect(botfocusResistRate, spell_id);
			resistchance = (resistchance * (100-focusResist) / 100);
		}
	}

#endif //EQBOTS

	//Resist chance makes up the upper limit of our partial range
	//Fullchance makes up the lower limit of our partial range
	if(!IsFearSpell(spell_id))
		fullchance = (resistchance * (1 - RuleR(Spells, PartialHitChance))); //default 0.7
	else
		fullchance = (resistchance * (1 - RuleR(Spells, PartialHitChanceFear))); //default 0.25

	roll = MakeRandomFloat(0, 100);

	mlog(SPELLS__RESISTS, "Spell %d: Resist Amount: %d, ResistChance: %.2f, Resist Bonuses: %.2f", 
		spell_id, resist, resistchance, (spellbonuses.ResistSpellChance + itembonuses.ResistSpellChance));	
	
	if (roll > resistchance)
	{
		mlog(SPELLS__RESISTS, "Spell %d: Roll of %.2f > resist chance of %.2f, no resist", spell_id, roll, resistchance);
		return(100);
	}
	else
	{
		if (roll <= fullchance)
 		{
			mlog(SPELLS__RESISTS, "Spell %d: Roll of %.2f <= fullchance %.2f, fully resisted", spell_id, roll, fullchance);
			return(0);
		}
		else
		{
			mlog(SPELLS__RESISTS, "Spell %d: Roll of %.2f > fullchance %.2f, partially resisted, returned %.2f", spell_id, roll, fullchance, (100 * ((roll-fullchance)/(resistchance-fullchance))));
			//Remove the lower range so it doesn't throw off the proportion.
			return(100 * ((roll-fullchance)/(resistchance-fullchance)));
		}
	}
}

float Mob::GetAOERange(uint16 spell_id) {
	float range;
	
	range = spells[spell_id].aoerange;
	if(range == 0)	//for TGB spells, they prolly do not have an aoe range
		range = spells[spell_id].range;
	if(range == 0)
		range = 10;	//something....
	
	float mod = 0;
	if (IsClient()) {
		if(IsBardSong(spell_id)) {
			switch (GetAA(aaExtendedNotes) + GetAA(aaExtendedNotes2))
			{
				case 1:
					mod += range * 0.10;
					break;
				case 2:
					mod += range * 0.15;
					break;
				case 3:
				case 4:
				case 5:
				case 6:
					mod += range * 0.25;
					break;
			}
			switch (GetAA(aaSionachiesCrescendo)+GetAA(aaSionachiesCrescendo2))
			{
				case 1:
					mod += range * 0.05;
					break;
				case 2:
					mod += range * 0.10;
					break;
				case 3:
				case 4:
				case 5:
				case 6:
					mod += range * 0.15;
					break;
			}
			range += mod;
		}
		
		range = CastToClient()->GetActSpellRange(spell_id, range);
	}

#ifdef EQBOTS

	else if(IsBot()) {
		if(IsBardSong(spell_id)) {
			if(GetLevel() >= 61) { // Extended Notes AA
				mod += range * 0.25;
			}
			else if(GetLevel() == 60) {
				mod += range * 0.15;
			}
			else if(GetLevel() == 59) {
				mod += range * 0.10;
			}

			if(GetLevel() >= 65) { // Sionachies Crescendo AA
				mod += range * 0.15;
			}
			else if(GetLevel() == 64) {
				mod += range * 0.10;
			}
			else if(GetLevel() == 63) {
				mod += range * 0.05;
			}
			range += mod;
		}
		
		range = GetBotActSpellRange(spell_id, range);
	}

#endif //EQBOTS
	
	return(range);
}

///////////////////////////////////////////////////////////////////////////////
// 'other' functions

void Mob::Spin() {
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_Action, sizeof(Action_Struct));
	outapp->pBuffer[0] = 0x0B;
	outapp->pBuffer[1] = 0x0A;
	outapp->pBuffer[2] = 0x0B;
	outapp->pBuffer[3] = 0x0A;
	outapp->pBuffer[4] = 0xE7;
	outapp->pBuffer[5] = 0x00;
	outapp->pBuffer[6] = 0x4D;
	outapp->pBuffer[7] = 0x04;
	outapp->pBuffer[8] = 0x00;
	outapp->pBuffer[9] = 0x00;
	outapp->pBuffer[10] = 0x00;
	outapp->pBuffer[11] = 0x00;
	outapp->pBuffer[12] = 0x00;
	outapp->pBuffer[13] = 0x00;
	outapp->pBuffer[14] = 0x00;
	outapp->pBuffer[15] = 0x00;
	outapp->pBuffer[16] = 0x00;
	outapp->pBuffer[17] = 0x00;
	outapp->pBuffer[18] = 0xD4;
	outapp->pBuffer[19] = 0x43;
	outapp->pBuffer[20] = 0x00;
	outapp->pBuffer[21] = 0x00;
	outapp->pBuffer[22] = 0x00;
	outapp->priority = 5;
	CastToClient()->QueuePacket(outapp);
	safe_delete(outapp);
}

void Mob::SendSpellBarDisable()
{
	if (!IsClient())
		return;
	
	CastToClient()->MemorizeSpell(0, SPELLBAR_UNLOCK, memSpellSpellbar);
}

// solar: this puts the spell bar back into a usable state fast
void Mob::SendSpellBarEnable(int16 spell_id)
{
	if(!IsClient())
		return;

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_ManaChange, sizeof(ManaChange_Struct));
	ManaChange_Struct* manachange = (ManaChange_Struct*)outapp->pBuffer;
	manachange->new_mana = GetMana();
	manachange->spell_id = spell_id;
	manachange->stamina = CastToClient()->GetEndurance();
	outapp->priority = 6;
	CastToClient()->QueuePacket(outapp);
	safe_delete(outapp);
}

void Mob::Stun(int duration)
{
	//make sure a shorter stun does not overwrite a longer one.
	if(stunned && stunned_timer.GetRemainingTime() > uint32(duration))
		return;
	
	if(casting_spell_id)
		InterruptSpell();

	if(duration > 0)
	{
		stunned = true;
		stunned_timer.Start(duration);
	}
}
		
void Mob::UnStun() {
	if(stunned && stunned_timer.Enabled()) {
		stunned = false;
		stunned_timer.Disable();
	}
}
		
// Hogie - Stuns "this"
void Client::Stun(int duration)
{
	Mob::Stun(duration);

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_Stun, sizeof(Stun_Struct));
	Stun_Struct* stunon = (Stun_Struct*) outapp->pBuffer;
	stunon->duration = duration;
	outapp->priority = 5;
	QueuePacket(outapp);
	safe_delete(outapp);
}

void Client::UnStun() {
	Mob::UnStun();

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_Stun, sizeof(Stun_Struct));
	Stun_Struct* stunon = (Stun_Struct*) outapp->pBuffer;
	stunon->duration = 0;
	outapp->priority = 5;
	QueuePacket(outapp);
	safe_delete(outapp);
}

void NPC::Stun(int duration) {
	Mob::Stun(duration);
	SetRunAnimSpeed(0);
	SendPosition();
}

void NPC::UnStun() {
	Mob::UnStun();
	SetRunAnimSpeed(this->GetRunspeed());
	SendPosition();
}

void Mob::Mesmerize()
{
	mezzed = true;

	if (casting_spell_id)
		InterruptSpell();
	
	SendPosition();
/* this stuns the client for max time, with no way to break it -solar
	if (this->IsClient()){
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_Stun, sizeof(Stun_Struct));
		Stun_Struct* stunon = (Stun_Struct*) outapp->pBuffer;
		stunon->duration = 0xFFFF;
		this->CastToClient()->QueuePacket(outapp);
		safe_delete(outapp);
    } else {
		SetRunAnimSpeed(0);
	}
*/
}

void Client::MakeBuffFadePacket(int16 spell_id, int slot_id, bool send_message)
{
	EQApplicationPacket* outapp;
	
	outapp = new EQApplicationPacket(OP_Buff, sizeof(SpellBuffFade_Struct));
	SpellBuffFade_Struct* sbf = (SpellBuffFade_Struct*) outapp->pBuffer;

	sbf->entityid=GetID();
	// solar: i dont know why but this works.. for now
	sbf->slot=2;
//	sbf->slot=m_pp.buffs[slot_id].slotid;
//	sbf->level=m_pp.buffs[slot_id].level;
//	sbf->effect=m_pp.buffs[slot_id].effect;
	sbf->spellid=spell_id;
	sbf->slotid=slot_id;
	sbf->bufffade = 1;
#if EQDEBUG >= 11
	printf("Sending SBF 1 from server:\n");
	DumpPacket(outapp);
#endif
	QueuePacket(outapp);

/*
	sbf->effect=0;
	sbf->level=0;
	sbf->slot=0;
*/
	sbf->spellid=0xffffffff;
#if EQDEBUG >= 11
	printf("Sending SBF 2 from server:\n");
	DumpPacket(outapp);
#endif
	QueuePacket(outapp);
	safe_delete(outapp);
	
	if(send_message)
	{
		const char *fadetext = spells[spell_id].spell_fades;
		outapp = new EQApplicationPacket(OP_BuffFadeMsg, sizeof(BuffFadeMsg_Struct) + strlen(fadetext));
		BuffFadeMsg_Struct *bfm = (BuffFadeMsg_Struct *) outapp->pBuffer;
		bfm->color = MT_Spells;
		memcpy(bfm->msg, fadetext, strlen(fadetext));
		QueuePacket(outapp);
		safe_delete(outapp);
	}
}

// solar: add/update a spell in the client's spell bar
void Client::MemSpell(int16 spell_id, int slot, bool update_client)
{
	if(slot >= MAX_PP_MEMSPELL || slot < 0)
		return;

	if(update_client)
	{
		if(m_pp.mem_spells[slot] != 0xFFFFFFFF)
			UnmemSpell(slot, update_client);
	}

	m_pp.mem_spells[slot] = spell_id;
	mlog(CLIENT__SPELLS, "Spell %d memorized into slot %d", spell_id, slot);

	if(update_client)
	{
		MemorizeSpell(slot, spell_id, memSpellMemorize);
	}
}

// solar: remove a spell from the client's spell bar
void Client::UnmemSpell(int slot, bool update_client)
{
	if(slot > MAX_PP_MEMSPELL || slot < 0)
		return;

	mlog(CLIENT__SPELLS, "Spell %d forgotten from slot %d", m_pp.mem_spells[slot], slot);
	m_pp.mem_spells[slot] = 0xFFFFFFFF;

	if(update_client)
	{
		MemorizeSpell(slot, m_pp.mem_spells[slot], memSpellForget);
	}
}

void Client::UnmemSpellAll(bool update_client)
{
	int i;
	
	for(i = 0; i < MAX_PP_MEMSPELL; i++)
		if(m_pp.mem_spells[i] != 0xFFFFFFFF)
			UnmemSpell(i, update_client);
}

// solar: add a spell to client's spellbook
void Client::ScribeSpell(int16 spell_id, int slot, bool update_client)
{
	if(slot >= MAX_PP_SPELLBOOK || slot < 0)
		return;

	if(update_client)
	{
		if(m_pp.spell_book[slot] != 0xFFFFFFFF)
			UnscribeSpell(slot, update_client);
	}

	m_pp.spell_book[slot] = spell_id;
	mlog(CLIENT__SPELLS, "Spell %d scribed into spell book slot %d", spell_id, slot);

	if(update_client)
	{
		MemorizeSpell(slot, spell_id, memSpellScribing);
	}
}

// solar: remove a spell from client's spellbook
void Client::UnscribeSpell(int slot, bool update_client)
{
	if(slot >= MAX_PP_SPELLBOOK || slot < 0)
		return;

	mlog(CLIENT__SPELLS, "Spell %d erased from spell book slot %d", m_pp.spell_book[slot], slot);
	m_pp.spell_book[slot] = 0xFFFFFFFF;

	if(update_client)
	{
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_DeleteSpell, sizeof(DeleteSpell_Struct));
		DeleteSpell_Struct* del = (DeleteSpell_Struct*)outapp->pBuffer;
		del->spell_slot = slot;
		del->success = 1;
		QueuePacket(outapp);
		safe_delete(outapp);
	}
}

void Client::UnscribeSpellAll(bool update_client)
{
	int i;

	for(i = 0; i < MAX_PP_SPELLBOOK; i++)
	{
		if(m_pp.spell_book[i] != 0xFFFFFFFF)
			UnscribeSpell(i, update_client);
	}
}

int Client::GetNextAvailableSpellBookSlot(int starting_slot) {
	for (int i = starting_slot; i < MAX_PP_SPELLBOOK; i++) {	//using starting_slot should help speed this up when we're iterating through a bunch of spells
		if (!IsValidSpell(GetSpellByBookSlot(i)))
			return i;
	}

	return -1;	//default
}

int Client::FindSpellBookSlotBySpellID(int16 spellid) {
	for(int i = 0; i < MAX_PP_SPELLBOOK; i++) {
		if(m_pp.spell_book[i] == spellid)
			return i;
	}

	return -1;	//default
}

bool Client::SpellGlobalCheck(int16 Spell_ID, int16 Char_ID) {

	std::string Spell_Global_Name;
	int Spell_Global_Value;
	int Global_Value;

	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if (database.RunQuery(query,MakeAnyLenString(&query, "SELECT qglobal, value FROM spell_globals WHERE spellid=%i", Spell_ID), errbuf, &result)) {
		safe_delete_array(query);

		if (mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			Spell_Global_Name = row[0];
			Spell_Global_Value = atoi(row[1]);

			mysql_free_result(result); 

			if (Spell_Global_Name.empty()) {   // If the entry in the spell_globals table has nothing set for the qglobal name
				return true;
			}
			else if (database.RunQuery(query,MakeAnyLenString(&query, "SELECT value FROM quest_globals WHERE charid=%i AND name='%s'", Char_ID, Spell_Global_Name.c_str()), errbuf, &result)) {
				safe_delete_array(query);
			   
				if (mysql_num_rows(result) == 1) {
					row = mysql_fetch_row(result);

					Global_Value = atoi(row[0]);
					mysql_free_result(result);
					if (Global_Value == Spell_Global_Value) {   // If the values match from both tables, allow the spell to be scribed
						return true;
					}
					else if (Global_Value > Spell_Global_Value) {   // Check if the qglobal value is greater than the require spellglobal value
						return true;
					}
					else   // If no matching result found in qglobals, don't scribe this spell
					{
						LogFile->write(EQEMuLog::Error, "Char ID: %i Spell_globals Name: '%s' Value: '%i' did not match QGlobal Value: '%i' for Spell ID %i", Char_ID, Spell_Global_Name.c_str(), Spell_Global_Value, Global_Value, Spell_ID);
						return false;
					}
				}
				else
					LogFile->write(EQEMuLog::Error, "Char ID: %i does not have the Qglobal Name: '%s' for Spell ID %i", Char_ID, Spell_Global_Name.c_str(), Spell_ID);
					safe_delete_array(query);
			}
			else
				LogFile->write(EQEMuLog::Error, "Spell ID %i query of spell_globals with Name: '%s' Value: '%i' failed", Spell_ID, Spell_Global_Name.c_str(), Spell_Global_Value);
		}
		else {
			return true;   // Spell ID isn't listed in the spells_global table, so it is not restricted from scribing
		}
		mysql_free_result(result); 
	}
	else {
		LogFile->write(EQEMuLog::Error, "Error while querying Spell ID %i spell_globals table query '%s': %s", Spell_ID, query,  errbuf);
		safe_delete_array(query);
		return false;   // Query failed, so prevent spell from scribing just in case
	}
	return false;   // Default is false
}

//this is one nasty function... FindType and FindSpell are rather complex operations...
/*void Mob::CheckBuffs() {
	if (!IsCasting()) {
		
		//try to summon a pet if we havent yet
		CheckPet();
		
		int8 newtype[15] = { SE_ArmorClass, SE_STR, SE_DEX, SE_AGI, SE_WIS,
                             SE_INT, SE_CHA, SE_AttackSpeed, SE_MovementSpeed,
                             SE_DamageShield, SE_ResistFire, SE_ResistCold,
                             SE_ResistMagic, SE_ResistPoison, SE_ResistDisease };
		for (int h=0; h<15; h++) {
			if (!this->FindType(newtype[h])) {
				int16 buffid = FindSpell(this->class_, this->level,
                                         newtype[h], SPELLTYPE_SELF, 0,
                                         GetMana());
				if (buffid != 0) {
					this->CastSpell(buffid, this->GetID());
				}
			}
		}
	}
}

void Mob::CheckPet() {
	if(HasPet())
		return;
	int16 buffid = 0;
	if ((GetClass() == NECROMANCER || GetClass() == MAGICIAN)) {
		if (this->GetClass() == MAGICIAN) {
			buffid = FindSpell(class_, level,
                               SE_SummonPet, SPELLTYPE_OTHER, 0,
                               GetMana());
        } else if (GetClass() == NECROMANCER) {
			buffid = FindSpell(class_, level,
                               SE_NecPet, SPELLTYPE_OTHER, 0,
                               GetMana());
		}
		if (buffid != 0) {
			CastSpell(buffid, GetID());
		}
	}
}

int16 Mob::FindSpell(int16 classp, int16 level, int type,
                     FindSpellType spelltype, float distance,
                     sint32 mana_avail) {
    int i,j;

    int bestvalue = -1;
    int bestid = 0;

    if (classp < 1)
        return 0;
    if (level < 1)
        return 0;
	classp = GetEQArrayEQClass(classp);

    // purpose: find a suited spell for a class and level and type
    // the if's are here to filter out anything which isnt normal.
    // its possible that we miss some valid spells, but who cares.
    //  - neotokyo 19-Nov-02

	for (i = 0; i < SPDAT_RECORDS; i++) {
				if(!IsValidSpell(i))
					continue;
        // Filter all spells that should never be used
        if (spells[i].effectid[0] == SE_NegateIfCombat)
            continue;
        if (spells[i].targettype == ST_Group)
            continue;
        if (i == 2632)  // neotokyo: fix for obsolete BST pet summon spell
            continue;
        if (i == 1576)  // neotokyo: fix for torpor
            continue;
        if (spells[i].cast_time < 11)
            continue;
        if (spells[i].mana == 0)
            continue;

        // now for closer checks
        if (spelltype == SPELLTYPE_SELF) {
            if ( i == 357)  // fix for dark empathy
                continue;
            // check buffs 12 would be max, but 90% of all effects are in the first 4 slots
            for (j = 0; j < 5; j++) {
                // neotokyo: fix for pets
                if ( spells[i].effectid[j] == SE_Illusion &&
                     type != SE_Illusion)  // only let illusions thru if explicitly requested
                    continue;
                if ( spells[i].effectid[j] == type &&
                     spells[i].goodEffect != 0 &&
                     spells[i].classes[classp] <= level &&
                     spells[i].classes[classp] <= 65 &&
                     (spells[i].recast_time < 10000 ||
                      type == SE_SummonPet ||
                      type == SE_SummonBSTPet) && // neotokyo: fix for druid pets
                     (type == SE_AbsorbMagicAtt || type == SE_Rune ||
                      type == SE_NecPet || type == SE_SummonPet ||
                      spells[i].components[0] == -1 ) &&
                     spells[i].targettype != ST_Undead &&   // neotokyo: for  necro mend series
                     spells[i].targettype != ST_Group &&    // neotokyo: fix for group spells
                     spells[i].targettype != ST_Pet &&      // neotokyo: fix for beastlords casting pet heals on self
                     spells[i].targettype != ST_Summoned && // neotokyo: fix for vs. summoned spells on normal npcs
                     spells[i].targettype != ST_AETarget && // neotokyo: dont let em cast AEtarget spells
                     spells[i].mana <= mana_avail &&
                     spells[i].range >= distance) {
                    sint32 spellvalue;

                    // lets assume pet is always better if higher, so no formula needed
                    if (type == SE_NecPet ||
                        type == SE_SummonPet ||
                        type == SE_SummonBSTPet) {
                        spellvalue = spells[i].classes[classp];
                    } else {
											spellvalue = CalcSpellEffectValue_formula(spells[i].formula[j],
                                                    spells[i].base[j],
                                                    spells[i].max[j],
                                                    level, i);
                    }

                    if (abs(spellvalue) > bestvalue) {
                        bestvalue = abs(spellvalue);
                        bestid = i;
                    }
                }
            }
        } else if (spelltype == SPELLTYPE_OFFENSIVE) {
            // check offensive spells
            for (j = 0; j < 5; j++) {
                if (spells[i].effectid[j] == SE_Illusion &&
                    type != SE_Illusion)  // only let illusions thru if explicitly requested
                    continue;
                if (spells[i].effectid[j] == type &&
                    spells[i].goodEffect == 0 &&
                    spells[i].classes[classp] <= level &&
                    spells[i].classes[classp] <= 65 &&
                    spells[i].recast_time < 10000 &&
                    spells[i].components[0] == -1 &&
                    spells[i].mana <= mana_avail &&
                    spells[i].targettype != ST_Undead &&   // neotokyo: thats for the necro mend series
                    spells[i].targettype != ST_Group &&    // neotokyo: fix for group spells
                    spells[i].targettype != ST_Pet &&      // neotokyo: fix for beastlords casting pet heals on self
                    spells[i].targettype != ST_Summoned && // neotokyo: fix for vs. summoned spells on normal npcs
                    spells[i].targettype != ST_AETarget && // neotokyo: dont let em cast AEtarget spells
                    spells[i].range >= distance) {
                    sint32 spellvalue = CalcSpellEffectValue_formula(spells[i].formula[j],
                                                       spells[i].base[j],
                                                       spells[i].max[j],
                                                       level, i);
                    if ( abs(spellvalue) > bestvalue ) {
                        bestvalue = abs(spellvalue);
                        bestid = i;
                    }
                }
            }
        } else if (spelltype == SPELLTYPE_OTHER) {
            if ( i == 357)  // fix for dark empathy
                continue;
            // healing and such
            for (j = 0; j < 5; j++) {
                if (spells[i].effectid[j] == SE_Illusion &&
                    type != SE_Illusion)  // only let illusions thru if explicitly requested
                    continue;
                if (spells[i].effectid[j] == type &&
                    spells[i].targettype != ST_Self &&
                    spells[i].goodEffect != 0 &&
                    spells[i].classes[classp] <= level &&
                    spells[i].classes[classp] <= 65 &&
                    spells[i].recast_time < 10000 &&
                    spells[i].components[0] == -1 &&
                    spells[i].targettype != ST_Undead &&   // neotokyo: thats for the necro mend series
                    spells[i].targettype != ST_Group &&    // neotokyo: fix for group spells
                    spells[i].targettype != ST_Pet &&      // neotokyo: fix for beastlords casting pet heals on self
                    spells[i].targettype != ST_Summoned && // neotokyo: fix for vs. summoned spells on normal npcs
                    spells[i].targettype != ST_AETarget && // neotokyo: dont let em cast AEtarget spells
                    spells[i].mana <= mana_avail &&
                    spells[i].range >= distance) {
                    sint32 spellvalue = CalcSpellEffectValue_formula(spells[i].formula[j],
                                                       spells[i].base[j],
                                                       spells[i].max[j],
                                                       level, i);
                    if ( abs(spellvalue) > bestvalue ) {
                        bestvalue = abs(spellvalue);
                        bestid = i;
                    }
                }
            }
        }
    } // for i

//    g_LogFile.write("for combination [class %02d][level %02d][SE_type %02d][type %02d] i selected the spell: %s",
//        classp, level, (int16)type, int16(spelltype), spells[bestid].name);
    return bestid;
}

#if 0
int16 Mob::FindSpell(int16 classp, int16 level, int8 type, int8 spelltype) {
	if (this->casting_spell_id != 0)
		return 0;

	if (spelltype == 2) // for future use
		spelltype = 0;

	//int count=0;
	int16 bestsofar = 0;
	int16 bestspellid = 0;
	for (int i = 0; i < SPDAT_RECORDS; i++) {
		if ((IsLifetapSpell(i) && spelltype == 1) || (spells[i].targettype != ST_Group && spells[i].targettype != ST_Undead && spells[i].targettype != ST_Summoned && spells[i].targettype != ST_Pet && strstr(spells[i].name,"Summoning") == NULL)) {
			int Canuse = CanUseSpell(i, classp, level);
			if (Canuse != 0) {
				for (int z=0; z < 12; z++) {
					int spfo = CalcSpellValue(spells[i].formula[z], spells[i].base[z], spells[i].max[z], this->GetLevel());
					if (spells[i].effectid[z] == SE_ArmorClass && type == SE_ArmorClass && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}
					if (spells[i].effectid[z] == SE_TotalHP && type == SE_TotalHP && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}
					if (spells[i].effectid[z] == SE_STR && type == SE_STR && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;

							bestspellid = i;
						}
					}
					if (spells[i].effectid[z] == SE_DEX && type == SE_DEX && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}

					if (spells[i].effectid[z] == SE_AGI && type == SE_AGI && !FindBuff(i)) {

						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {

							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}

					if (spells[i].effectid[z] == SE_WIS && type == SE_WIS && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}

					if (spells[i].effectid[z] == SE_INT && type == SE_INT && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}
					if (spells[i].effectid[z] == SE_CHA && type == SE_CHA && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}

					if (spells[i].effectid[z] == SE_MovementSpeed && type == SE_MovementSpeed && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}

					if (spells[i].effectid[z] == SE_AttackSpeed && type == SE_AttackSpeed && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}
					if (spells[i].effectid[z] == SE_ResistFire && type == SE_ResistFire && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}
					if (spells[i].effectid[z] == SE_ResistCold && type == SE_ResistCold && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}
					if (spells[i].effectid[z] == SE_ResistMagic && type == SE_ResistMagic && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}
					if (spells[i].effectid[z] == SE_ResistDisease && type == SE_ResistDisease && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;

						}
					}
					if (spells[i].effectid[z] == SE_ResistPoison && type == SE_ResistPoison && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}
					if (spells[i].effectid[z] == SE_DamageShield && type == SE_DamageShield && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}
					if (spells[i].effectid[z] == SE_CurrentHPOnce && type == SE_CurrentHPOnce && !FindBuff(i)) {
						if (spfo > 0 && (spfo + spells[i].buffduration) > bestsofar) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}
					}
					if (spells[i].effectid[z] == SE_SummonPet && type == SE_SummonPet && !FindBuff(i)) {
						if (Canuse > bestsofar) {
							bestsofar = Canuse;
							bestspellid = i;
						}
					}
					if (spells[i].effectid[z] == SE_NecPet && type == SE_NecPet && !FindBuff(i)) {
						if (Canuse > bestsofar) {
							bestsofar = Canuse;
							bestspellid = i;
						}
					}
					if (spells[i].effectid[z] == SE_CurrentHP && type == SE_CurrentHP && !FindBuff(i)) {
						if (spfo < 0 && (spells[i].buffduration + spfo) < bestsofar && spelltype == 1) {
							bestsofar = ((spells[i].buffduration * -1) + spfo);
							bestspellid = i;
						}
						if ((spfo + spells[i].buffduration) > bestsofar && spfo > 0 && spelltype == 0) {
							bestsofar = spfo + spells[i].buffduration;
							bestspellid = i;
						}

					}
				}
			}
		}
	}

	return bestspellid;
}
#endif
*/

// solar: TODO get rid of this
sint8 Mob::GetBuffSlotFromType(int8 type) {
	for (int i = 0; i < BUFF_COUNT; i++) {
		if (buffs[i].spellid != SPELL_UNKNOWN) {
			for (int j = 0; j < EFFECT_COUNT; j++) {
				if (spells[buffs[i].spellid].effectid[j] == type )
					return i;
			}
		}
	}
    return -1;
}


bool Mob::FindType(int8 type, bool bOffensive, int16 threshold) {
	for (int i = 0; i < BUFF_COUNT; i++) {
		if (buffs[i].spellid != SPELL_UNKNOWN) {

			for (int j = 0; j < EFFECT_COUNT; j++) {
                // adjustments necessary for offensive npc casting behavior
                if (bOffensive) {
				    if (spells[buffs[i].spellid].effectid[j] == type) {
                        sint16 value = 
                                CalcSpellEffectValue_formula(buffs[i].durationformula,
                                               spells[buffs[i].spellid].base[j],
                                               spells[buffs[i].spellid].max[j],
                                               buffs[i].casterlevel, buffs[i].spellid);
                        LogFile->write(EQEMuLog::Normal, 
                                "FindType: type = %d; value = %d; threshold = %d",
                                type, value, threshold);
                        if (value < threshold)
                            return true;
                    }
                } else {
				    if (spells[buffs[i].spellid].effectid[j] == type )
					    return true;
                }
			}
		}
	}
	return false;
}

bool Mob::AddProcToWeapon(int16 spell_id, bool bPerma, int16 iChance) {
	if(spell_id == SPELL_UNKNOWN)
		return(false);

	int i;
	if (bPerma) {
 		for (i = 0; i < MAX_PROCS; i++) {
			if (PermaProcs[i].spellID == SPELL_UNKNOWN) {
				PermaProcs[i].spellID = spell_id;
				PermaProcs[i].chance = iChance;
				PermaProcs[i].pTimer = NULL;
				mlog(SPELLS__PROCS, "Added permanent proc spell %d with chance %d to slot %d", spell_id, iChance, i);

				return true;
			}
		}
		mlog(SPELLS__PROCS, "Too many perma procs for %s", GetName());
    } else {
		for (i = 0; i < MAX_PROCS; i++) {
			if (SpellProcs[i].spellID == SPELL_UNKNOWN) {
				SpellProcs[i].spellID = spell_id;
				SpellProcs[i].chance = iChance;
				SpellProcs[i].pTimer = NULL;
				mlog(SPELLS__PROCS, "Added spell-granted proc spell %d with chance %d to slot %d", spell_id, iChance, i);
				return true;
			}
		}
		mlog(SPELLS__PROCS, "Too many procs for %s", GetName());
	}
    return false;
}

bool Mob::RemoveProcFromWeapon(int16 spell_id, bool bAll) {
	for (int i = 0; i < MAX_PROCS; i++) {
		if (bAll || SpellProcs[i].spellID == spell_id) {
			SpellProcs[i].spellID = SPELL_UNKNOWN;
			SpellProcs[i].chance = 0;
			SpellProcs[i].pTimer = NULL;
			mlog(SPELLS__PROCS, "Removed proc %d from slot %d", spell_id, i);
		}
	}
    return true;
}

bool Mob::AddDefensiveProc(int16 spell_id, int16 iChance)
{
	if(spell_id == SPELL_UNKNOWN)
		return(false);
	
	int i;
	for (i = 0; i < MAX_PROCS; i++) {
		if (DefensiveProcs[i].spellID == SPELL_UNKNOWN) {
			DefensiveProcs[i].spellID = spell_id;
			DefensiveProcs[i].chance = iChance;
			DefensiveProcs[i].pTimer = NULL;
			mlog(SPELLS__PROCS, "Added spell-granted defensive proc spell %d with chance %d to slot %d", spell_id, iChance, i);
			return true;
		}
	}

    return false;
}

bool Mob::RemoveDefensiveProc(int16 spell_id, bool bAll)
{
	for (int i = 0; i < MAX_PROCS; i++) {
		if (bAll || DefensiveProcs[i].spellID == spell_id) {
			DefensiveProcs[i].spellID = SPELL_UNKNOWN;
			DefensiveProcs[i].chance = 0;
			DefensiveProcs[i].pTimer = NULL;
			mlog(SPELLS__PROCS, "Removed defensive proc %d from slot %d", spell_id, i);
		}
	}
    return true;
}

bool Mob::AddRangedProc(int16 spell_id, int16 iChance)
{
	if(spell_id == SPELL_UNKNOWN)
		return(false);
	
	int i;
	for (i = 0; i < MAX_PROCS; i++) {
		if (RangedProcs[i].spellID == SPELL_UNKNOWN) {
			RangedProcs[i].spellID = spell_id;
			RangedProcs[i].chance = iChance;
			RangedProcs[i].pTimer = NULL;
			mlog(SPELLS__PROCS, "Added spell-granted ranged proc spell %d with chance %d to slot %d", spell_id, iChance, i);
			return true;
		}
	}

    return false;
}

bool Mob::RemoveRangedProc(int16 spell_id, bool bAll)
{
	for (int i = 0; i < MAX_PROCS; i++) {
		if (bAll || RangedProcs[i].spellID == spell_id) {
			RangedProcs[i].spellID = SPELL_UNKNOWN;
			RangedProcs[i].chance = 0;
			RangedProcs[i].pTimer = NULL;
			mlog(SPELLS__PROCS, "Removed ranged proc %d from slot %d", spell_id, i);
		}
	}
    return true;
}

// solar: this is checked in a few places to decide wether special bard
// behavior should be used.
bool Mob::UseBardSpellLogic(int16 spell_id, int slot)
{
	if(spell_id == SPELL_UNKNOWN)
		spell_id = casting_spell_id;

	if(slot == -1)
		slot = casting_spell_slot;

	// should we treat this as a bard singing?
	return
	(
		spell_id != 0 &&
		spell_id != SPELL_UNKNOWN &&
		slot != -1 &&
		GetClass() == BARD &&
		slot <= MAX_PP_MEMSPELL &&
		IsBardSong(spell_id)
	);
}

int Mob::GetCasterLevel(int16 spell_id) {
	int level = GetLevel();
	level += spellbonuses.effective_casting_level;
	level += itembonuses.effective_casting_level;
	level += GetAA(aaJamFest);
	mlog(SPELLS__CASTING, "Determined effective casting level %d+%d+%d=%d", GetLevel(), spellbonuses.effective_casting_level, itembonuses.effective_casting_level, level);
	return(level);
}


//this method does NOT tell the client to stop singing the song.
//this is NOT the right way to stop a mob from singing, use InterruptSpell
//you should really know what your doing before you call this
void Mob::_StopSong()
{
	if (IsClient() && (bardsong || IsBardSong(casting_spell_id)))
	{
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_ManaChange, sizeof(ManaChange_Struct));
		ManaChange_Struct* manachange = (ManaChange_Struct*)outapp->pBuffer;
		manachange->new_mana = cur_mana;
		if (!bardsong)
			manachange->spell_id = casting_spell_id;
		else
			manachange->spell_id = bardsong;
		manachange->stamina = CastToClient()->GetEndurance();
		if (CastToClient()->Hungry())
			manachange->stamina = 0;
		CastToClient()->QueuePacket(outapp);
		delete outapp;
	}
	bardsong = 0;
	bardsong_target_id = 0;
	bardsong_slot = 0;
	bardsong_timer.Disable();
}

//This member function sets the buff duration on the client
//however it does not work if sent quickly after an action packets, which is what one might perfer to do
//Thus I use this in the buff process to update the correct duration once after casting
//this allows AAs and focus effects that increase buff duration to work correctly, but could probably
//be used for other things as well
void Client::SendBuffDurationPacket(int16 spell_id, int duration, int inlevel)
{
	EQApplicationPacket* outapp;
	outapp = new EQApplicationPacket(OP_Buff, sizeof(SpellBuffFade_Struct));
	SpellBuffFade_Struct* sbf = (SpellBuffFade_Struct*) outapp->pBuffer;

	sbf->entityid = GetID();
	sbf->slot=2;
	sbf->spellid=spell_id;
	sbf->slotid=0;
	sbf->effect = inlevel > 0 ? inlevel : GetLevel();
	sbf->level = inlevel > 0 ? inlevel : GetLevel();
	sbf->bufffade = 0;
	sbf->duration = duration;
	FastQueuePacket(&outapp);
}

void Mob::SendPetBuffsToClient()
{
	// Don't really need this check, as it should be checked before this method is called, but it doesn't hurt
	// too much to check again.
	if(!(GetOwner() && GetOwner()->IsClient())) return;

	int PetBuffCount = 0;


	EQApplicationPacket* outapp = new EQApplicationPacket(OP_PetBuffWindow,sizeof(PetBuff_Struct));
	PetBuff_Struct* pbs=(PetBuff_Struct*)outapp->pBuffer;
	memset(outapp->pBuffer,0,outapp->size);
	pbs->petid=GetID();

	for(int buffslot = 0; buffslot < BUFF_COUNT; buffslot++) {
		if(buffs[buffslot].spellid != SPELL_UNKNOWN) {
			pbs->spellid[PetBuffCount] = buffs[buffslot].spellid;
			pbs->ticsremaining[PetBuffCount] = buffs[buffslot].ticsremaining;
			PetBuffCount++;
		}
	}

	pbs->buffcount=PetBuffCount;
	GetOwner()->CastToClient()->QueuePacket(outapp);
	safe_delete(outapp);
}

void Mob::SendBuffsToClient(Client *c)
{
	if(!c)
		return;

	EQApplicationPacket *outapp = MakeTargetBuffsPacket();

	c->FastQueuePacket(&outapp);
}

EQApplicationPacket *Mob::MakeTargetBuffsPacket()
{
	int BuffCount = 0;

	for(unsigned int i = 0; i < BUFF_COUNT; ++i)
		if(buffs[i].spellid != SPELL_UNKNOWN)
			++BuffCount;

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_TargetBuffs, 6 + (BuffCount * 13));

	char *Buffer = (char *)outapp->pBuffer;

	VARSTRUCT_ENCODE_TYPE(uint32, Buffer, GetID());
	VARSTRUCT_ENCODE_TYPE(uint16, Buffer, BuffCount);

	for(unsigned int i = 0; i < BUFF_COUNT; ++i)
		if(buffs[i].spellid != SPELL_UNKNOWN)
		{
			VARSTRUCT_ENCODE_TYPE(uint32, Buffer, i);
			VARSTRUCT_ENCODE_TYPE(uint32, Buffer, buffs[i].spellid);
			VARSTRUCT_ENCODE_TYPE(uint32, Buffer, buffs[i].ticsremaining);
			VARSTRUCT_ENCODE_TYPE(uint8, Buffer, 0);	// This is a string
		}
	
	return outapp;
}

void Mob::BuffModifyDurationBySpellID(int16 spell_id, sint32 newDuration)
{
	for(int i = 0; i < BUFF_COUNT; ++i)
	{
		if (buffs[i].spellid == spell_id)
		{
			buffs[i].ticsremaining = newDuration;
			if(IsClient())
			{
				CastToClient()->SendBuffDurationPacket(buffs[i].spellid, buffs[i].ticsremaining, buffs[i].casterlevel);
			}
		}
	}
}

void Mob::UpdateRuneFlags()
{

	bool Has_SE_Rune = false, Has_SE_AbsorbMagicAtt = false, Has_SE_NegateAttacks = false;

	for (unsigned int i = 0; i < BUFF_COUNT; ++i)
	{
		if (buffs[i].spellid != SPELL_UNKNOWN)
		{
			for (int j = 0; j < EFFECT_COUNT; ++j)
			{
				switch(spells[buffs[i].spellid].effectid[j])
				{
					case SE_Rune:
					{
						Has_SE_Rune = true;
						break;
					}
					case SE_AbsorbMagicAtt:
					{
						Has_SE_AbsorbMagicAtt = true;
						break;
					}
					case SE_NegateAttacks:
					{
						Has_SE_NegateAttacks = true;
						break;
					}

					default:
						break;
				}
						
			}
		}
	}

	SetHasRune(Has_SE_Rune || Has_SE_NegateAttacks);

	SetHasSpellRune(Has_SE_AbsorbMagicAtt || Has_SE_NegateAttacks);
}

