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
#include <math.h>
#ifndef WIN32
#include <stdlib.h>
#include "../common/unix.h"
#endif
#if !defined(NEW_LoadSPDat) && !defined(DB_LoadSPDat)
	extern SPDat_Spell_Struct spells[SPDAT_RECORDS];
#endif
extern bool spells_loaded;

///////////////////////////////////////////////////////////////////////////////
// spell property testing functions

bool IsTargetableAESpell(int16 spell_id) {
	bool bResult = false;

	if (IsValidSpell(spell_id) && spells[spell_id].targettype == ST_AETarget) {
		bResult = true;
	}

	return bResult;
}

bool IsSacrificeSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_Sacrifice);
}

bool IsLifetapSpell(int16 spell_id)
{
	return
	(
		IsValidSpell(spell_id) &&
		(
			spells[spell_id].targettype == ST_Tap ||
			(
				spell_id == 2115	// Ancient: Lifebane
			)
		)
	);
}

bool IsMezSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_Mez);
}

bool IsStunSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_Stun);
}

bool IsSummonSpell(int16 spellid) {
	for (int o = 0; o < EFFECT_COUNT; o++)
	{
		int32 tid = spells[spellid].effectid[o];
		if(tid == SE_SummonPet || tid == SE_SummonItem || tid == SE_SummonPC)
		{
			return true;
		}
	}
	return false;
}

bool IsEvacSpell(int16 spellid) {
	return IsEffectInSpell(spellid, SE_Succor);
}

bool IsDamageSpell(int16 spellid) {
	for (int o = 0; o < EFFECT_COUNT; o++)
	{
		int32 tid = spells[spellid].effectid[o];
		if((tid == SE_CurrentHPOnce || tid == SE_CurrentHP) && spells[spellid].targettype != ST_Tap && spells[spellid].buffduration < 1 && spells[spellid].base[o] < 0)
		{
			return true;
		}
	}
	return false;
}


bool IsFearSpell(int16 spell_id) {
	return IsEffectInSpell(spell_id, SE_Fear);
}

bool IsSlowSpell(int16 spell_id)
{
	int i;
	const SPDat_Spell_Struct &sp = spells[spell_id];

	for(i = 0; i < EFFECT_COUNT; i++)
	{
		if
		(
			sp.effectid[i] == SE_AttackSpeed			// attack speed effect
			 && sp.base[i] < 100		// less than 100%
		)
			return true;
	}

	return false;
}

bool IsHasteSpell(int16 spell_id)
{
	int i;
	const SPDat_Spell_Struct &sp = spells[spell_id];

	for(i = 0; i < EFFECT_COUNT; i++)
	{
		if(sp.effectid[i] == SE_AttackSpeed)
			return(sp.base[i] < 100);
	}

	return false;
}

bool IsHarmonySpell(int16 spell_id)
{
	return (IsEffectInSpell(spell_id, SE_Harmony) || IsEffectInSpell(spell_id, SE_Lull));
}

bool IsPercentalHealSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_PercentalHeal);
}

bool IsGroupOnlySpell(int16 spell_id)
{
	return IsValidSpell(spell_id) && spells[spell_id].goodEffect == 2;
}

bool IsBeneficialSpell(int16 spell_id)
{
	// EverHood - These spells are actually detrimental
	if(!IsValidSpell(spell_id))
		return false;
	
	if(spells[spell_id].goodEffect == 1){
		SpellTargetType tt = spells[spell_id].targettype;
		if(tt != ST_Self && tt != ST_Pet){
			if(IsEffectInSpell(spell_id, SE_CancelMagic))
				return false;
		}		
		if(tt == ST_Target || tt == ST_AETarget || tt == ST_Animal || tt == ST_Undead || tt == ST_Pet) {
			int16 sai = spells[spell_id].SpellAffectIndex;
			if(spells[spell_id].resisttype == RESIST_MAGIC){
				if(sai == SAI_Calm || sai == SAI_Dispell_Sight || sai == SAI_Memory_Blur || sai == SAI_Calm_Song)
					return false;
			}else{
				// Bind Sight and Cast Sight
				if(sai == SAI_Dispell_Sight && spells[spell_id].skill == 18)
					return false;
			}
		}
	}
	return spells[spell_id].goodEffect != 0 || IsGroupSpell(spell_id);
}

bool IsDetrimentalSpell(int16 spell_id)
{
	return !IsBeneficialSpell(spell_id);
}

bool IsInvulnerabilitySpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_DivineAura);
}

bool IsCHDurationSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_CompleteHeal);
}

bool IsPoisonCounterSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_PoisonCounter);
}

bool IsDiseaseCounterSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_DiseaseCounter);
}

bool IsSummonItemSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_SummonItem);
}

bool IsSummonSkeletonSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_NecPet);
}

bool IsSummonPetSpell(int16 spell_id)
{
	return
	(
		IsEffectInSpell(spell_id, SE_SummonPet) ||
		IsEffectInSpell(spell_id, SE_SummonBSTPet)
	);
}

bool IsSummonPCSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_SummonPC);
}

bool IsCharmSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_Charm);
}

bool IsBlindSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_Blind);
}

bool IsEffectHitpointsSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_CurrentHP);
}

bool IsReduceCastTimeSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_IncreaseSpellHaste);
}

bool IsIncreaseDurationSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_IncreaseSpellDuration);
}

bool IsReduceManaSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_ReduceManaCost);
}

bool IsExtRangeSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_IncreaseRange);
}

bool IsImprovedHealingSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_ImprovedHeal);
}

bool IsImprovedDamageSpell(int16 spell_id)
{
	return IsEffectInSpell(spell_id, SE_ImprovedDamage);
}

bool IsAEDurationSpell(int16 spell_id)
{
	return IsValidSpell(spell_id) &&
		(spells[spell_id].targettype == ST_AETarget || spells[spell_id].targettype == ST_UndeadAE )
		&& spells[spell_id].AEDuration !=0;
}

bool IsPureNukeSpell(int16 spell_id)
{
	int i, effect_count = 0;

	if(!IsValidSpell(spell_id))
		return false;

	for(i = 0; i < EFFECT_COUNT; i++)
	{
		if(!IsBlankSpellEffect(spell_id, i))
			effect_count++;
	}

	return
	(
		spells[spell_id].effectid[0] == SE_CurrentHP &&
		effect_count == 1
	);
}

bool IsPartialCapableSpell(int16 spell_id)
{
	if(IsPureNukeSpell(spell_id) || IsFearSpell(spell_id) || IsEffectInSpell(spell_id,SE_Charm))
		return true;
	
	return false;
}

bool IsResistableSpell(int16 spell_id)
{
	// solar: for now only detrimental spells are resistable.  later on i will
	// add specific exceptions for the beneficial spells that are resistable
	if(IsDetrimentalSpell(spell_id))
	{
		return true;
	}

	return false;
}

// solar: checks if this spell affects your group
bool IsGroupSpell(int16 spell_id)
{
	return
	(
		IsValidSpell(spell_id) &&
		(
			spells[spell_id].targettype == ST_AEBard ||
			spells[spell_id].targettype == ST_Group || 
			spells[spell_id].targettype == ST_GroupTeleport
		)
	);
}

// solar: checks if this spell can be targeted
bool IsTGBCompatibleSpell(int16 spell_id)
{
	return
	(
		IsValidSpell(spell_id) &&
		(
			!IsDetrimentalSpell(spell_id) &&
			spells[spell_id].buffduration != 0 &&
			!IsBardSong(spell_id) &&
			!IsEffectInSpell(spell_id, SE_Illusion)
		)
	);
}

bool IsBardSong(int16 spell_id)
{
	return
	(
		IsValidSpell(spell_id) &&
		spells[spell_id].classes[BARD - 1] < 255
	);
}

bool IsEffectInSpell(int16 spellid, int effect)
{
	int j;

	if(!IsValidSpell(spellid))
		return false;

	for(j = 0; j < EFFECT_COUNT; j++)
		if(spells[spellid].effectid[j] == effect) 
			return true;

	return false;
}

// solar: arguments are spell id and the index of the effect to check.
// this is used in loops that process effects inside a spell to skip
// the blanks
bool IsBlankSpellEffect(int16 spellid, int effect_index)
{
	int effect, base, formula;

	effect = spells[spellid].effectid[effect_index];
	base = spells[spellid].base[effect_index];
	formula = spells[spellid].formula[effect_index];

	return
	(
		effect == SE_Blank ||	// blank marker
		(	// spacer
			effect == SE_CHA && 
			base == 0 &&
			formula == 100
		)
		||
		effect == SE_StackingCommand_Block ||	// these are only used by stacking code
		effect == SE_StackingCommand_Overwrite
	);
}

// solar: checks some things about a spell id, to see if we can proceed
bool IsValidSpell(int16 spellid)
{
	return
	(
		spells_loaded &&
		spellid != 0 &&
		spellid != 1 &&
		spellid != 0xFFFF &&
		spellid < SPDAT_RECORDS &&
		spells[spellid].player_1[0]
	);
}

//returns the lowest level of any caster which can use the spell
int GetMinLevel(int16 spell_id) {
	int r;
	int min = 255;
	const SPDat_Spell_Struct &spell = spells[spell_id];
	for(r = 0; r < PLAYER_CLASS_COUNT; r++) {
		if(spell.classes[r] < min)
			min = spell.classes[r];
	}
	
	//if we can't cast the spell return 0
	//just so it wont screw up calculations used in other areas of the code
	if(min == 255)
		return 0;
	else
		return(min);
}

// solar: this will find the first occurance of effect.  this is handy
// for spells like mez and charm, but if the effect appears more than once
// in a spell this will just give back the first one.
int GetSpellEffectIndex(int16 spell_id, int effect)
{
	int i;

	if(!IsValidSpell(spell_id))
		return -1;

	for(i = 0; i < EFFECT_COUNT; i++)
	{
		if(spells[spell_id].effectid[i] == effect)
			return i;
	}

	return -1;
}

// solar: returns the level required to use the spell if that class/level
// can use it, 0 otherwise
// note: this isn't used by anything right now
int CanUseSpell(int16 spellid, int classa, int level)
{
	int level_to_use;
	
	if(!IsValidSpell(spellid) || classa >= PLAYER_CLASS_COUNT)
		return 0;

	level_to_use = spells[spellid].classes[classa - 1];

	if
	(
		level_to_use &&
		level_to_use != 255 &&
		level >= level_to_use
	)
		return level_to_use;

	return 0;
}



bool BeneficialSpell(int16 spell_id)
{
	if (spell_id <= 0 || spell_id >= SPDAT_RECORDS 
		/*|| spells[spell_id].stacking == 27*/ )
	{
		return true;
	}
	switch (spells[spell_id].goodEffect)
	{
		case 1:
		case 3:
			return true;
	}
	return false;
}

bool GroupOnlySpell(int16 spell_id)
{
	switch (spells[spell_id].goodEffect)
	{
		case 2:
		case 3:
			return true;
	}
	switch (spell_id)
	{
		case 1771:
			return true;
	}
	return false;
}

sint32 CalculatePoisonCounters(int16 spell_id){
	if(!IsValidSpell(spell_id))
		return 0;

	sint32 Counters = 0;
	for(int i = 0; i < EFFECT_COUNT; i++)
	{
		if(spells[spell_id].effectid[i] == SE_PoisonCounter && spells[spell_id].base[i] > 0){
			Counters += spells[spell_id].base[i];
		}
	}
    return Counters;
}

sint32 CalculateDiseaseCounters(int16 spell_id){
	if(!IsValidSpell(spell_id))
		return 0;

	sint32 Counters = 0;
	for(int i = 0; i < EFFECT_COUNT; i++)
	{
		if(spells[spell_id].effectid[i] == SE_DiseaseCounter && spells[spell_id].base[i] > 0){
			Counters += spells[spell_id].base[i];
		}
	}
    return Counters;
}

sint32 CalculateCurseCounters(int16 spell_id){
	if(!IsValidSpell(spell_id))
		return 0;

	sint32 Counters = 0;
	for(int i = 0; i < EFFECT_COUNT; i++)
	{
		if(spells[spell_id].effectid[i] == SE_CurseCounter && spells[spell_id].base[i] > 0){
			Counters += spells[spell_id].base[i];
		}
	}
    return Counters;
}

bool IsDiscipline(int16 spell_id)
{
	if(!IsValidSpell(spell_id))
		return false;

	if(spells[spell_id].mana == 0 && (spells[spell_id].EndurCost || spells[spell_id].EndurUpkeep))
	{
		return true;
	}
	return false;
}

bool IsResurrectionEffects(int16 spell_id) {
	bool Result = false;

	if(IsValidSpell(spell_id) && spell_id == 756)		// spell id 756 is Resurrection Effects spell
		Result = true;

	return Result;
}

bool IsRuneSpell(int16 spell_id) {
	bool Result = false;

	if(IsValidSpell(spell_id)) {
		for(int i = 0; i < EFFECT_COUNT; i++) {
			if(spells[spell_id].effectid[i] == SE_Rune) {
				Result = true;
				break;
			}
		}
	}

	return Result;
}

bool IsMagicRuneSpell(int16 spell_id) {
	bool Result = false;

	if(IsValidSpell(spell_id)) {
		for(int i = 0; i < EFFECT_COUNT; i++) {
			if(spells[spell_id].effectid[i] == SE_AbsorbMagicAtt) {
				Result = true;
				break;
			}
		}
	}

	return Result;
}

bool IsManaTapSpell(int16 spell_id) {
	bool Result = false;

	if(IsValidSpell(spell_id)) {
		for(int i = 0; i < EFFECT_COUNT; i++) {
			if(spells[spell_id].effectid[i] == SE_CurrentMana && spells[spell_id].targettype == ST_Tap) {
				Result = true;
				break;
			}
		}
	}

	return Result;
}

bool IsAllianceSpellLine(int16 spell_id) {
	bool Result = false;

	if(IsValidSpell(spell_id))
		Result = IsEffectInSpell(spell_id, SE_AddFaction);

	return Result;
}

bool IsDeathSaveSpell(int16 spell_id) {
	bool Result = false;

	if(IsValidSpell(spell_id))
		Result = IsEffectInSpell(spell_id, SE_DeathSave);

	return Result;
}

bool IsPartialDeathSaveSpell(int16 spell_id) {
	bool Result = false;

	// Death Pact
	if(spell_id == 1547)
		Result = true;

	return Result;
}

bool IsFullDeathSaveSpell(int16 spell_id) {
	bool Result = false;

	// Divine Intervention
	if(spell_id == 1546)
		Result = true;

	return Result;
}

bool IsShadowStepSpell(int16 spell_id) {
	if (IsEffectInSpell(spell_id, SE_ShadowStep)){
		return true;

	}
	else {
		return false;
	}
}

bool IsSuccorSpell(int16 spell_id) {
	if (IsEffectInSpell(spell_id, SE_Succor)){
		return true;
	}
	else {
		return false;
	}
}

bool IsTeleportSpell(int16 spell_id) {
	if (IsEffectInSpell(spell_id, SE_Teleport)){
		return true;
	}
	else {
		return false;
	}
}

bool IsGateSpell(int16 spell_id) {
	if (IsEffectInSpell(spell_id, SE_Gate)){
		return true;
	}
	else {
		return false;
	}
}
// seveian 2008-09-23
bool IsPlayerIllusionSpell(int16 spell_id) {
	if(IsEffectInSpell(spell_id, SE_Illusion) && spells[spell_id].targettype == ST_Self)
		return true;
	else
		return false;

}

int GetSpellEffectDescNum(int16 spell_id)
{
	if( (spell_id > 0) && (spell_id < SPDAT_RECORDS) ){
		return spells[spell_id].effectdescnum;
	} else {
		return -1;
	}
}

DmgShieldType GetDamageShieldType(int16 spell_id) 
{

	// If we have a DamageShieldType for this spell from the damageshieldtypes table, return that,
	// else, make a guess, based on the resist type. Default return value is DS_THORNS
	//
	if( (spell_id > 0) && (spell_id < SPDAT_RECORDS) ){

		_log(SPELLS__EFFECT_VALUES, "DamageShieldType for spell %i (%s) is %X\n", spell_id, 
			spells[spell_id].name, spells[spell_id].DamageShieldType); 

		if(spells[spell_id].DamageShieldType)
			return (DmgShieldType) spells[spell_id].DamageShieldType;

		switch(spells[spell_id].resisttype) {
			case RESIST_COLD:
				return DS_TORMENT;
			case RESIST_FIRE:
				return DS_BURN;
			case RESIST_DISEASE:
				return DS_DECAY;
			default:
				return DS_THORNS;
		}
	}

	return DS_THORNS;
}

bool IsLDoNObjectSpell(int16 spell_id) 
{
	if(IsEffectInSpell(spell_id, SE_AppraiseLDonChest) || 
		IsEffectInSpell(spell_id, SE_DisarmLDoNTrap) || 
		IsEffectInSpell(spell_id, SE_UnlockLDoNChest))
	{
		return true;
	}
	else
	{
		return false;
	}

}

sint32 GetSpellResistType(int16 spell_id)
{
	return spells[spell_id].resisttype;
}

sint32 GetSpellTargetType(int16 spell_id)
{
	return (sint32)spells[spell_id].targettype;
}

bool IsHealOverTimeSpell(int16 spell_id) {
	if(IsEffectInSpell(spell_id, SE_HealOverTime))
		return true;
	else
		return false;
}

bool IsCompleteHealSpell(int16 spell_id) {
	if(spell_id == 13 || IsEffectInSpell(spell_id, SE_CompleteHeal) || IsEffectInSpell(spell_id, SE_PercentalHeal))
		return true;
	else
		return false;
}

bool IsFastHealSpell(int16 spell_id) {
	const int MaxFastHealCastingTime = 2000;

	if(spells[spell_id].cast_time <= MaxFastHealCastingTime && spells[spell_id].effectid[0] == 0 && spells[spell_id].base[0] > 0)
		return true;
	else
		return false;
}

bool IsRegularSingleTargetHealSpell(int16 spell_id) {
	bool result = false;

	if(spells[spell_id].effectid[0] == 0 && spells[spell_id].base[0] > 0 && spells[spell_id].targettype == ST_Target
		&& !IsFastHealSpell(spell_id) && !IsCompleteHealSpell(spell_id) && !IsHealOverTimeSpell(spell_id)) {
		result = true;
	}

	return result;
}