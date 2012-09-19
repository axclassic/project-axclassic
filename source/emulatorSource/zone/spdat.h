/*  EQEMu:  Everquest Server Emulator
    Copyright (C) 2001-2005  EQEMu Development Team (http://eqemulator.net)

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
#ifndef SPDAT_H
#define SPDAT_H

#include "../common/classes.h"
#include "../common/skills.h"

#define SPELL_UNKNOWN 0xFFFF
#define SPELLBOOK_UNKNOWN 0xFFFFFFFF		//player profile spells are 32 bit

//some spell IDs which will prolly change, but are needed
#define SPELL_LEECH_TOUCH 2766
#define SPELL_LAY_ON_HANDS 87
#define SPELL_HARM_TOUCH 88
#define SPELL_HARM_TOUCH2 2821
#define SPELL_IMP_HARM_TOUCH 2774
#define SPELL_NPC_HARM_TOUCH 929


//#define SPDAT_SIZE		1824000
/* 
   solar: look at your spells_en.txt and find the id of the last spell.
   this number has to be 1 more than that.  if it's higher, your zone will
   NOT start up.  gonna autodetect this later..
*/
//#define NEW_LoadSPDat
#define DB_LoadSPDat	//load from DB vs spells_us.txt. for now, we're piggybacking NEW_LoadSPDat, so it will take precedence

#define EFFECT_COUNT 12

enum SpellAffectIndex {
	SAI_Calm			= 12, // Lull and Alliance Spells
	SAI_Dispell_Sight	= 14, // Dispells and Spells like Bind Sight
	SAI_Memory_Blur		= 27,
	SAI_Calm_Song		= 43  // Lull and Alliance Songs
};
enum RESISTTYPE
{
	RESIST_NONE = 0,
	RESIST_MAGIC = 1,
	RESIST_FIRE = 2,
	RESIST_COLD = 3,
	RESIST_POISON = 4,
	RESIST_DISEASE = 5,
	RESIST_CHROMATIC = 6,
	RESIST_PRISMATIC = 7,
	RESIST_PHYSICAL = 8	// see Muscle Shock, Back Swing
};

//Target Type IDs
typedef enum {
  ST_TargetOptional		= 0x01, // Target is used if present, but not required. ex: Flare, Fireworks
  ST_AECaster			= 0x04, // ae centered around caster
  ST_Target				= 0x05, // single targetted
  ST_Self				= 0x06, // self only
  ST_AETarget			= 0x08, // ae around target
  ST_AEBard				= 0x28, // ae friendly around self (ae bard song)
  ST_Group				= 0x29, // group spell
  ST_GroupTeleport		= 0x03, // EverHood - AND Necro Epic 2 Pet Owners Group (Guardian of Blood Recourse - Spell ID=6316)
//  ST_AlterPlane		= 0x3,
  ST_Undead				= 0x0a,
  ST_Tap				= 0x0d,
  ST_Pet				= 0x0e,
  ST_Animal          	= 0x09,
  ST_Plant				= 0x10,
  ST_Dragon				= 0x12,
  ST_Giant				= 0x11,
//  ST_Unknown1			= 0x14,
//  ST_Unknown			= 0x18,
//  ST_Summoned			= 0x19,
  ST_Summoned			= 0x0b, // NEOTOKYO: see spells_en.txt -> seems to be value 11 not 25
  ST_Corpse				= 0x0f,
  ST_UndeadAE			= 0x18,
  ST_LDoNChest_Cursed   = 0x22,
  ST_GroupClient		= 0x2b,
  ST_SummonedPet	= 0x26,
} SpellTargetType;

typedef enum  {
	DS_DECAY = 244,
	DS_CHILLED = 245,
	DS_FREEZING = 246,
	DS_TORMENT = 247,
	DS_BURN = 248,
	DS_THORNS = 249
} DmgShieldType;

//Spell Effect IDs
#define SE_CurrentHP				0	// Heals and nukes, repeates every tic if in a buff
#define SE_ArmorClass				1
#define SE_ATK						2
#define SE_MovementSpeed			3	// SoW, SoC, etc
#define SE_STR						4
#define SE_DEX						5
#define SE_AGI						6
#define SE_STA						7
#define SE_INT						8
#define SE_WIS						9
#define SE_CHA						10	// Often used as a spacer, who knows why
#define SE_AttackSpeed				11
#define SE_Invisibility				12
#define SE_SeeInvis					13
#define SE_WaterBreathing			14
#define SE_CurrentMana				15
//#define SE_Unknown16				16	//not used
//#define SE_Unknown17				17	//not used
#define SE_Lull						18	// see SE_Harmony
#define SE_AddFaction				19	// Alliance line
#define SE_Blind					20
#define SE_Stun						21
#define SE_Charm					22
#define SE_Fear						23
#define SE_Stamina					24	// Invigor and such
#define SE_BindAffinity				25
#define SE_Gate						26	// Gate to bind point
#define SE_CancelMagic				27
#define SE_InvisVsUndead			28
#define SE_InvisVsAnimals			29
#define SE_ChangeFrenzyRad			30
#define SE_Mez						31
#define SE_SummonItem				32
#define SE_SummonPet				33
//#define SE_Unknown34				34	//not used
#define SE_DiseaseCounter			35
#define SE_PoisonCounter			36
//#define SE_Unknown37				37	//not used
//#define SE_Unknown38				38	//not used
//#define SE_Unknown39				39	//not used
#define SE_DivineAura				40
#define SE_Destroy					41	// Disintegrate, Banishment of Shadows
#define SE_ShadowStep				42
//#define SE_Unknown43				43	//not used
#define SE_Lycanthropy				44
//#define SE_Unknown45				45	//not used
#define SE_ResistFire				46
#define SE_ResistCold				47
#define SE_ResistPoison				48
#define SE_ResistDisease			49
#define SE_ResistMagic				50
//#define SE_Unknown51				51	//not used
#define SE_SenseDead				52
#define SE_SenseSummoned			53
#define SE_SenseAnimals				54
#define SE_Rune						55
#define SE_TrueNorth				56
#define SE_Levitate					57
#define SE_Illusion					58
#define SE_DamageShield				59
//#define SE_Unknown60				60	//not used
#define SE_Identify					61
//#define SE_Unknown62				62	//not used
#define SE_WipeHateList				63
#define SE_SpinTarget				64
#define SE_InfraVision				65
#define SE_UltraVision				66
#define SE_EyeOfZomm				67
#define SE_ReclaimPet				68
#define SE_TotalHP					69
//#define SE_Unknown70				70	//not used
#define SE_NecPet					71
//#define SE_Unknown72				72	//not used
#define SE_BindSight				73
#define SE_FeignDeath				74
#define SE_VoiceGraft				75
#define SE_Sentinel					76
#define SE_LocateCorpse				77
#define SE_AbsorbMagicAtt			78	// rune for spells
#define SE_CurrentHPOnce			79	// Heals and nukes, non-repeating if in a buff
//#define SE_Unknown80				80	//not used
#define SE_Revive					81	//resurrect
#define SE_SummonPC					82
#define SE_Teleport					83
#define SE_TossUp					84	// Gravity Flux
#define SE_WeaponProc				85	// i.e. Call of Fire
#define SE_Harmony					86	// what is SE_Lull??,. "Reaction Radius"
#define SE_MagnifyVision			87	// Telescope
#define SE_Succor					88	// Evacuate/Succor lines?
#define SE_ModelSize				89	// Shrink, Growth
#define SE_Cloak					90	// some kind of focus effect?
#define SE_SummonCorpse				91
#define SE_Calm						92	// Hate modifier. Enrageing blow
#define SE_StopRain					93	// Wake of Karana
#define SE_NegateIfCombat			94	// Component of Spirit of Scale
#define SE_Sacrifice				95
#define SE_Silence					96	// Cacophony
#define SE_ManaPool					97
#define SE_AttackSpeed2				98	// Melody of Ervaj
#define SE_Root						99
#define SE_HealOverTime				100
#define SE_CompleteHeal				101
#define SE_Fearless					102	// Valiant Companion
#define SE_CallPet					103	// Summon Companion
#define SE_Translocate				104
#define SE_AntiGate					105	// Translocational Anchor
#define SE_SummonBSTPet				106	// neotokyo: added BST pet support
//#define SE_Unknown107				107	//not used
#define SE_Familiar					108
#define SE_SummonItemIntoBag		109	// Summon Jewelry Bag - summons stuff into container
//#define SE_Unknown110				110	//not used
#define SE_ResistAll				111
#define SE_CastingLevel				112
#define	SE_SummonHorse				113
#define SE_ChangeAggro				114	// chanter spells Horrifying Visage ...
#define SE_Hunger					115	// Song of Sustenance
#define SE_CurseCounter				116
#define SE_MagicWeapon				117	// Magical Monologue
#define SE_SingingSkill				118	// Amplification
#define SE_AttackSpeed3				119	// Frenzied Burnout
#define SE_HealRate					120	// Packmaster's Curse - not sure what this is
#define SE_ReverseDS				121
//#define SE_Unknown122				122	//not used
#define SE_Screech					123	// Form of Defense
#define SE_ImprovedDamage			124
#define SE_ImprovedHeal				125
#define SE_SpellResistReduction		126 //not implemented
#define SE_IncreaseSpellHaste		127
#define SE_IncreaseSpellDuration	128
#define SE_IncreaseRange			129
#define SE_SpellHateMod				130
#define SE_ReduceReagentCost		131
#define SE_ReduceManaCost			132
//#define SE_Unknown133				133	//stun time half mod (mod to reduce stun time by some val?)
#define SE_LimitMaxLevel			134
#define SE_LimitResist				135
#define SE_LimitTarget				136
#define SE_LimitEffect				137
#define SE_LimitSpellType			138
#define SE_LimitSpell				139
#define SE_LimitMinDur				140
#define SE_LimitInstant				141
#define SE_LimitMinLevel			142
#define SE_LimitCastTime			143
//#define SE_Unknown144				144	//not used
#define SE_Teleport2				145	// Banishment of the Pantheon
//#define SE_Unknown146				146	//not used
#define SE_PercentalHeal			147
// solar: 
// base is the effectid the command applies to
// max is the value to check against.. not sure if there's a formula for this
// calc is the effect slot number plus 200
#define SE_StackingCommand_Block	148
#define SE_StackingCommand_Overwrite 149
#define SE_DeathSave				150
#define SE_SuspendPet				151	//not implemented. Suspend Minion. base1: 0 = lose buffs & equip, 1 = keep buffs & equip
#define SE_TemporaryPets			152	// Swarm of Fear III
#define SE_BalanceHP				153	// Divine Arbitration
#define SE_DispelDetrimental		154
//#define SE_Unknown155				155	//not used
#define SE_IllusionCopy				156	// Deception
#define SE_SpellDamageShield		157	// Petrad's Protection
#define SE_Reflect					158
#define SE_AllStats					159	// Aura of Destruction
#define SE_MakeDrunk				160
#define SE_MitigateSpellDamage		161	//not implemented rune type, with max value
#define SE_MitigateMeleeDamage		162	//not implemented rune type, with max value
#define SE_NegateAttacks			163	//not implemented pet targeted, seems to negate `base` number of melee or spells
#define SE_AppraiseLDonChest		164
#define SE_DisarmLDoNTrap			165
#define SE_UnlockLDoNChest			166
#define SE_PetPowerIncrease			167	
#define SE_MeleeMitigation			168	//not implemented, unlimited for duration
#define SE_CriticalHitChance		169
#define SE_SpellCritChance			170	//not implemented, +% to crit
#define SE_CrippBlowChance			171
#define SE_AvoidMeleeChance			172
#define SE_RiposteChance			173
#define SE_DodgeChance				174
#define SE_ParryChance				175
#define SE_DualWeildChance			176
#define SE_DoubleAttackChance		177
#define SE_MeleeLifetap				178
#define SE_AllInstrunmentMod		179
#define SE_ResistSpellChance		180
#define SE_ResistFearChance			181
#define SE_HundredHands				182
#define SE_MeleeSkillCheck			183
#define SE_HitChance				184
#define SE_DamageModifier			185
#define SE_MinDamageModifier		186
//#define SE_Unknown187				187	//not used
#define SE_IncreaseBlockChance		188	//not implemented
#define SE_CurrentEndurance			189
#define SE_EndurancePool			190	//not implemented
#define SE_Amnesia					191	//Amnesia (Silence vs Melee Effect)
#define SE_Hate2					192	//not implemented
#define SE_SkillAttack				193
#define SE_FadingMemories			194
#define SE_StunResist				195
#define SE_Strikethrough			196
#define SE_SkillDamageTaken			197
#define SE_CurrentEnduranceOnce		198
#define SE_Taunt					199	//Flutter Flight (9480). % chance to taunt the target
#define SE_ProcChance				200
#define SE_RangedProc				201
#define SE_IllusionOther			202	
#define SE_MassGroupBuff			203	
#define SE_GroupFearImmunity		204
#define SE_Rampage					205
#define SE_AETaunt					206
#define SE_FleshToBone				207
//#define SE_Unknown208				208	//not used
#define SE_FadingMemories2			209
#define SE_PetShield				210	//per lucy, not implemented
#define SE_AEMelee					211	//per lucy, not implemented
#define SE_ProlongedDestruction		212	//per lucy, not implemented
//#define SE_Unknown213				213	//not used
#define SE_MaxHPChange 				214	//Grace of the Order, Plague of Hulcror, not implemented
//#define SE_Unknown215				215	//not used
#define SE_Accuracy					216	//not implemented
//#define SE_Unknown217				217	//not used
#define SE_PetCriticalHit			218 //aa effect
#define SE_SlayUndead				219	//not implemented
#define SE_SkillDamageAmount		220	//not implemented
#define SE_Packrat					221 //aa effect
//#define SE_Unknown222				222	//not used
//#define SE_Unknown223				223	//not used
#define	SE_GiveDoubleRiposte		224 //aa effect
#define SE_GiveDoubleAttack			225	//not implemented
#define SE_TwoHandBash				226 //aa effect, bash with a 2h sword
#define SE_ReduceSkillTimer			227	//not implemented
//#define SE_Unknown228				228	//not used
#define SE_PersistantCasting		229 //aa effect
//#define SE_Unknown230				230	//not used
//#define SE_Unknown231				231	//not used
#define SE_DivineSave				232	//not implemented (base == % chance on death to insta-res)
//#define SE_Unknown233				233	//not used
//#define SE_Unknown234				234	//not used
#define	SE_ChannelingChance			235 //Appears to only be used in AAs
//#define SE_Unknown236				236	//not used
#define SE_GivePetGroupTarget		237 //aaeffect, makes pets targetable by group spells
//#define SE_Unknown238				238	//not used
//#define SE_Unknown239				239	//not used
//#define SE_Unknown240				240	//not used
//#define SE_Unknown241				241	//not used
//#define SE_Unknown242				242	//not used
//#define SE_Unknown243				243	//not used
//#define SE_Unknown244				244	//not used
//#define SE_Unknown245				245	//not used
#define SE_SetBreathLevel			246 //aa effect
//#define SE_Unknown247				247	//not used
#define SE_SecondaryForte			248 //aa effect, lets you gain a 2nd forte, gives you a 2nd specialize skill that can go past 50 to 100
#define SE_SecondaryDmgInc			249 //aa effect, sinister strikes
//#define SE_Unknown250				250	//not used
//#define SE_Unknown251				251	//not used
//#define SE_Unknown252				252	//not used
//#define SE_Unknown253				253	//not used
#define SE_Blank					254
//#define SE_Unknown255				255	//not used
//#define SE_Unknown256				256	//not used
#define SE_PetDiscipline			257 //aa effect /pet hold
#define SE_TripleBackstab			258 //not implemented
#define SE_CombatStability			259 //aa effect
#define SE_AddInstrumentMod			260
//#define SE_Unknown261				261	//not used
#define SE_RaiseStatCap				262 //added 10/21/08
#define	SE_TradeSkillMastery		263	//lets you raise more than one tradeskill above master.
#define SE_HastenedAASkill			264 //aa skill
#define SE_MasteryofPast			265 //aa skill, makes impossible to fizzle spell of base[x] level
#define SE_ExtraAttackChance		266 //not implemented
#define SE_PetDiscipline2			267 //aa effect /pet focus, /pet no cast
#define SE_ReduceTradeskillFail		268 //aa effect, reduces chance to fail with given tradeskill by a percent chance
//#define SE_Unknown269				269	//not used
//#define SE_Unknown270				270	//not used
#define SE_BaseMovementSpeed		271 //mods basemove speed, doesn't stack with other move mods, aa effect
#define SE_CastingLevel2			272
#define SE_CriticalDoTChance		273	//not implemented
#define SE_CriticalHealChance		274	//not implemented
//#define SE_Unknown275				275	//not used
#define SE_Ambidexterity			276 //aa effect
//#define SE_Unknown277				277	//not used
#define	SE_FinishingBlow			278 //aa effect
#define SE_Flurry					279	//not implemented
#define SE_PetFlurry				280
//#define SE_Unknown281				281	//not used
//#define SE_Unknown282				282	//not used
//#define SE_Unknown283				283	//not used
//#define SE_Unknown284				284	//not used
//#define SE_Unknown285				285	//not used
#define SE_SpellDamage				286	//not implemented. adds direct spell damage
#define SE_FocusCombatDurationMod	287
//#define SE_Unknown288				288	//not used
#define SE_ImprovedSpellEffect		289 //This effect turns into this? base1 = new spell id, happens when spell wears off
//#define SE_Unknown290				290	//not used
#define SE_Purify					291 //not implemented
//#define SE_Unknown292				292	//not used
//#define SE_Unknown293				293	//not used
#define SE_CriticalSpellChance		294 //not implemented
//#define SE_Unknown295				295	//not used
#define SE_SpellVulnerability		296	//not implemented, base % increase in incoming spell damage
#define SE_Empathy					297 //some kind of damage focus effect, maybe defensive?
#define SE_ChangeHeight				298	//not implemented
#define SE_WakeTheDead				299
#define SE_Doppelganger				300
//#define SE_Unknown301				301	//not used
//#define SE_Unknown302				302	//not used
//#define SE_Unknown303				303	//not used
#define SE_OffhandRiposteFail		304 //aa effect, enemy cannot riposte offhand attacks
#define SE_MitigateDamageShield		305 //not implemented
#define SE_WakeTheDead2				306 //not implemented
#define SE_Appraisal				307 //not implemented
#define SE_SuspendMinion			308 //not implemented
#define SE_YetAnotherGate			309 //not implemented, spell 5953
#define SE_ReduceReuseTimer			310 //not implemented
#define SE_NoCombatSkills			311 //not implemented
#define SE_Sanctuary				312 //not implemented
//#define SE_Unknown313				313	//not used
#define SE_Invisibility2			314 //not implemented
#define SE_InvisVsUndead2			315 //not implemented
//#define SE_Unknown316				316	//not used
//#define SE_Unknown317				317	//not used
#define SE_ItemManaRegenCapIncrease	318 //aa effect increases amount of mana regen you can gain via items
#define SE_CriticalHealOverTimer	319 //not implemented
//#define SE_Unknown320				320	//not used
#define SE_ReduceHate				321 //not implemented
#define SE_GateToHomeCity			322
#define SE_DefensiveProc			323
#define SE_HPToMana					324 //not implemented
//#define SE_Unknown325				325	//not used
#define SE_SpellSlotIncrease		326 //aa effect, increases your spell slot availability
#define SE_MysticalAttune			327 //AA effect, increases amount of buffs that a player can have
#define SE_DelayDeath				328 //AA effect, increases how far you can fall below 0 hp before you die
#define SE_ManaAbsorbPercentDamage	329 //not implemented
#define SE_CriticalDamageMob		330	//not implemented
#define SE_Salvage					331 //chance to recover items that would be destroyed in failed tradeskill combine
#define SE_SummonToCorpse			332 //not implemented
#define SE_EffectOnFade				333 //not implemented
#define SE_BardAEDot				334	//needs a better name (spell id 703 and 730)
#define SE_Unknown335				335	//not implemented. blocks next spell base1 times, then the spell fades after it reaches 0 (like Rune, but for spell types). Puratus (8494), Influence of Rage (8762) & Atta's Depuration (9815)
//#define SE_Unknown336				336	//not used
#define SE_PercentXPIncrease		337	//not implemented
#define SE_SummonAndResAllCorpses	338	//not implemented
#define SE_TriggerOnCast			339	//not implemented
#define SE_LifeshardChance			340	//chance to create lifeshard
//#define SE_Unknown341				341	//not used
#define SE_ImmuneFleeing			342	//not implemented
#define SE_InterruptCasting			343	//not implemented. % chance to interrupt spells being cast every tic. Cacophony (8272)
//#define SE_Unknown344				344	//not used
//#define SE_Unknown345				345	//not used
//#define SE_Unknown346				346	//not used
//#define SE_Unknown347				347	//not used
#define SE_Unknown348				348	//not implemented. looks like a rune based on how many times you cast a spell (cast a spell, decrease by 1. 0 = buff wears off)
//#define SE_Unknown349				349	//not used
#define SE_ManaBurn					350	//not implemented. no idea on the calculation
										//from http://everquest.allakhazam.com/db/spell.html?spell=8452;page=1;howmany=50#m1184016444141306266 for Mana Blaze (base1 = 9000):
										//"As a wizard with 1k AA's (all damage) and 13k mana, I always land this AA for 36k. It only seems to use about 10k mana."
#define SE_PersistentEffect			351	//not implemented. creates a trap/totem that casts a spell (spell id + base1?) when anything comes near it. can probably make a beacon for this
#define SE_Unknown352				352	//not sure. looks to be some type of invulnerability? Test ITC (8755)
#define SE_Unknown353				353	//not sure. looks to be some type of invulnerability? Test ISC (8756)
#define SE_Unknown354				354	//not sure. looks to be some type of invulnerability? Test DAT (8757)
#define SE_Unknown355				355	//not sure. looks to be some type of invulnerability? Test LT (8758)
//#define SE_Unknown356				356	//not used
//#define SE_Unknown357				357	//not used
#define SE_CurrentManaOnce			358	//not implemented. increase/decrease mana once, like SE_CurrentHPOnce & SE_CurrentEnduranceOnce
//#define SE_Unknown359				359	//not used
#define SE_SpellOnKill				360	//not implemented. has a base1 % to cast spell base2 when you kill a "challenging foe" (>= max?)
#define SE_Unknown361				361	//not sure. looks to be same as SpellOnKill, except for detrimental spells only? Test Proc 2 (9407)
//#define SE_Unknown362				362	//not used
//#define SE_Unknown363				363	//not used
//#define SE_Unknown364				364	//not used
#define SE_SpellOnDeath				365	//not implemented. casts base2 spell on the originator of the spell base1 % of the time when the person it was cast on dies. have to be >= max (level) for it to work?
#define SE_Unknown366				366	//not sure. assume it has something to do with Corruption, maybe counters? wasn't implemented until Serpent's Spine, so not a big deal right now. Corr Test 1 (9428)
#define SE_AddBodyType				367	//not implemented. adds body type of base1 so it can be affected by spells that are limited to that type (Plant, Animal, Undead, etc)
#define SE_FactionMod				368	//not implemented. increases faction with base1 (faction id, live won't match up w/ ours) by base2
#define SE_CorruptionCounter		369	//not implemented. wasn't added until Serpent's Spine, so we can't really do much w/ it
#define SE_ResistCorruption			370	//not implemented. ditto
#define SE_InhibitMeleeAttacks		371 //some type of melee slow
//#define SE_Unknown372				372	//not used
#define SE_CastOnWearoff			373 //Casts this spell on target when the buff wears off the target
#define SE_ApplyEffect				374 //Also casts these spells on the target when this spell lands
//#define SE_Unknown375				375	//not used
//#define SE_Unknown376				376	//not used, some sort of movement spell?
#define SE_BossSpellTrigger			377	//some sort of boss encounter effect, spell is cast if something happens
//#define SE_Unknown372				378	//not used
#define SE_ShadowStepDirectional	379 //Shadowstep in a certain direction
#define SE_Knockdown				380 //small knock back + stun or feign?
//#define SE_Unknown381				381	//not used
#define SE_BlockDS					382 //something to do with blocking a % of certain ds?
#define SE_Leap						383 //used to leap forward? probably something like a small knock back reverse to push you forward
//#define SE_Unknown384				384	//not used
//#define SE_Unknown385				385	//not used
//last effect

#define DF_Permanent		50

//
// solar: note this struct is historical, we don't actually need it to be
// aligned to anything, but for maintaining it it is kept in the order that
// the fields in the text file are.  the numbering is not offset, but field
// number.  note that the id field is counted as 0, this way the numbers
// here match the numbers given to sep in the loading function net.cpp
//
struct SPDat_Spell_Struct
{
/* 000 */	int			id;	// not used
/* 001 */	char		name[32]; // Name of the spell
/* 002 */	char		player_1[32]; // "PLAYER_1"
/* 003 */	char		teleport_zone[32];	// Teleport zone, pet name summoned, or item summoned
/* 004 */	char		you_cast[64]; // Message when you cast
/* 005 */	char		other_casts[64]; // Message when other casts
/* 006 */	char		cast_on_you[64]; // Message when spell is cast on you 
/* 007 */	char		cast_on_other[64]; // Message when spell is cast on someone else
/* 008 */	char		spell_fades[64]; // Spell fades
/* 009 */	float		range;
/* 010 */	float		aoerange;
/* 011 */	float		pushback;
/* 012 */	float		pushup;
/* 013 */	int32		cast_time; // Cast time
/* 014 */	int32		recovery_time; // Recovery time
/* 015 */	int32		recast_time; // Recast same spell time
/* 016 */	int32		buffdurationformula;
/* 017 */	int32		buffduration;
/* 018 */	int32		AEDuration;	// sentinel, rain of something
/* 019 */	int16		mana; // Mana Used
/* 020 */	sint32		base[EFFECT_COUNT];	//various purposes
/* 032 */	int			base2[EFFECT_COUNT]; //various purposes
/* 044 */	sint16		max[EFFECT_COUNT];
/* 056 */	int16		icon; // Spell icon
/* 057 */	int16		memicon; // Icon on membarthing
/* 058 */	sint32		components[4]; // reagents
/* 062 */	int			component_counts[4]; // amount of regents used
/* 066 */	signed		NoexpendReagent[4];	// focus items (Need but not used; Flame Lick has a Fire Beetle Eye focus.)
											// If it is a number between 1-4 it means components[number] is a focus and not to expend it
											// If it is a valid itemid it means this item is a focus as well
/* 070 */	int16		formula[EFFECT_COUNT]; // Spell's value formula
/* 082 */	int			LightType; // probaly another effecttype flag
/* 083 */	int			goodEffect; //0=detrimental, 1=Beneficial, 2=Beneficial, Group Only
/* 084 */	int			Activated; // probaly another effecttype flag	
/* 085 */	int			resisttype;
/* 086 */	int			effectid[EFFECT_COUNT];	// Spell's effects
/* 098 */	SpellTargetType	targettype;	// Spell's Target
/* 099 */	int			basediff; // base difficulty fizzle adjustment
/* 100 */	SkillType	skill;
/* 101 */	sint16		zonetype;	// 01=Outdoors, 02=dungeons, ff=Any 
/* 102 */	int16		EnvironmentType;
/* 103 */	int			TimeOfDay;
/* 104 */	int8		classes[PLAYER_CLASS_COUNT]; // Classes, and their min levels
/* 120 */	int8		CastingAnim;
/* 121 */	int8		TargetAnim;
/* 122 */	int32		TravelType;
/* 123 */	int16		SpellAffectIndex;
/* 124 */ int spacing124[2];	// 124: high-end Yaulp spells (V, VI, VII, VIII [Rk 1, 2, & 3], & Gallenite's Bark of Fury
								// 125: Words of the Skeptic
/* 126 */	sint8		deities[16];	// Deity check. 201 - 216 per http://www.eqemulator.net/wiki/wikka.php?wakka=DeityList
										// -1: Restrict to Deity; 1: Restrict to Deity, but only used on non-Live (Test Server "Blessing of ...") spells; 0: Don't restrict
/* 142 */ int spacing142[2];	// 142: between 0 & 100
								// 143: always set to 0
/* 144 */	sint16		new_icon;	// Spell icon used by the client in uifiles/default/spells??.tga, both for spell gems & buff window. Looks to depreciate icon & memicon
/* 145 */	sint16		spellanim;	// Doesn't look like it's the same as #doanim, so not sure what this is
/* 146 */	sint8		uninterruptable;	// Looks like anything != 0 is uninterruptable. Values are mostly -1, 0, & 1 (Fetid Breath = 90?)
/* 147 */	sint16		ResistDiff; 
/* 148 */   int			dot_stacking_exempt;
/* 149 */   int			deletable;
/* 150 */	int16		RecourseLink;
/* 151 */ int spacing151[3];	// 151: -1, 0, or 1
								// 152 & 153: all set to 0
/* 154 */	sint8		short_buff_box;	// != 0, goes to short buff box. Not really supported in the server code
/* 155 */   int			descnum; // eqstr of description of spell
/* 156 */   int			typedescnum; // eqstr of type description
/* 157 */   int			effectdescnum; // eqstr of effect description
/* 158 */ int spacing158[4];
/* 162 */   int			bonushate;
/* 163 */ int spacing163[3];
/* 166 */   int			EndurCost;
/* 167 */   int			EndurTimerIndex;
/* 168 */ int spacing168[5];
/* 173 */   int			HateAdded;
/* 174 */   int			EndurUpkeep;
/* 175 */ int spacing175;
/* 176 */ int numhits;
/* 177 */   int			pvpresistbase;
/* 178 */   int			pvpresistcalc;
/* 179 */   int			pvpresistcap;
/* 180 */   int			spell_category;
/* 181 */ int spacing181[4];
/* 185 */   int			can_mgb;	// 0=no, -1 or 1 = yes
/* 186 */	// last field is 185.


//shared memory errors
/* 186 */	/*sint8		nodispell;*/	// 0=can be dispelled, -1=can't be dispelled at all, 1=most can be cancelled w/ a cure but not dispelled
/* 187 */	/*uint8		npc_category;*/	// 0=not used, 1=AoE Detrimental, 2=DD, 3=Buffs, 4=Pets, 5=Healing, 6=Gate, 7=Debuff, 8=Dispell
/* 188 */	/*uint32		npc_usefulness;*/	// higher number = more useful, lower number = less useful
/* 189 */ /*int spacing189[18];*/
/* 207 */	/*uint32		spellgroup;*/
/* 208 */ /*int spacing208[7];*/
// Might be newer fields in the live version, which is what some of the last fields are


			int8		DamageShieldType; // This field does not exist in spells_us.txt
};

#if defined(NEW_LoadSPDat) || defined(DB_LoadSPDat)
	extern const SPDat_Spell_Struct* spells; 
	extern sint32 SPDAT_RECORDS;
#else
	#define SPDAT_RECORDS	3602
#endif

bool IsTargetableAESpell(int16 spell_id);
bool IsSacrificeSpell(int16 spell_id);
bool IsLifetapSpell(int16 spell_id);
bool IsMezSpell(int16 spell_id);
bool IsStunSpell(int16 spell_id);
bool IsSlowSpell(int16 spell_id);
bool IsHasteSpell(int16 spell_id);
bool IsHarmonySpell(int16 spell_id);
bool IsPercentalHealSpell(int16 spell_id);
bool IsGroupOnlySpell(int16 spell_id);
bool IsBeneficialSpell(int16 spell_id);
bool IsDetrimentalSpell(int16 spell_id);
bool IsInvulnerabilitySpell(int16 spell_id);
bool IsCHDurationSpell(int16 spell_id);
bool IsPoisonCounterSpell(int16 spell_id);
bool IsDiseaseCounterSpell(int16 spell_id);
bool IsSummonItemSpell(int16 spell_id);
bool IsSummonSkeletonSpell(int16 spell_id);
bool IsSummonPetSpell(int16 spell_id);
bool IsSummonPCSpell(int16 spell_id);
bool IsCharmSpell(int16 spell_id);
bool IsBlindSpell(int16 spell_id);
bool IsEffectHitpointsSpell(int16 spell_id);
bool IsReduceCastTimeSpell(int16 spell_id);
bool IsIncreaseDurationSpell(int16 spell_id);
bool IsReduceManaSpell(int16 spell_id);
bool IsExtRangeSpell(int16 spell_id);
bool IsImprovedHealingSpell(int16 spell_id);
bool IsImprovedDamageSpell(int16 spell_id);
bool IsAEDurationSpell(int16 spell_id);
bool IsPureNukeSpell(int16 spell_id);
bool IsPartialCapableSpell(int16 spell_id);
bool IsResistableSpell(int16 spell_id);
bool IsGroupSpell(int16 spell_id);
bool IsTGBCompatibleSpell(int16 spell_id);
bool IsBardSong(int16 spell_id);
bool IsEffectInSpell(int16 spellid, int effect);
bool IsBlankSpellEffect(int16 spellid, int effect_index);
bool IsValidSpell(int16 spellid);
bool IsSummonSpell(int16 spellid);
bool IsEvacSpell(int16 spellid);
bool IsDamageSpell(int16 spellid);
bool IsFearSpell(int16 spellid);
bool BeneficialSpell(int16 spell_id);
bool GroupOnlySpell(int16 spell_id);
int GetSpellEffectIndex(int16 spell_id, int effect);
int CanUseSpell(int16 spellid, int classa, int level);
int GetMinLevel(int16 spell_id);
int CalcBuffDuration_formula(int level, int formula, int duration);
sint32 CalculatePoisonCounters(int16 spell_id);
sint32 CalculateDiseaseCounters(int16 spell_id);
sint32 CalculateCurseCounters(int16 spell_id);
bool IsDiscipline(int16 spell_id);
bool IsResurrectionEffects(int16 spell_id);
bool IsRuneSpell(int16 spell_id);
bool IsMagicRuneSpell(int16 spell_id);
bool IsManaTapSpell(int16 spell_id);
bool IsAllianceSpellLine(int16 spell_id);
bool IsDeathSaveSpell(int16 spell_id);
bool IsFullDeathSaveSpell(int16 spell_id);
bool IsPartialDeathSaveSpell(int16 spell_id);
bool IsShadowStepSpell(int16 spell_id);
bool IsSuccorSpell(int16 spell_id);
bool IsTeleportSpell(int16 spell_id);
bool IsGateSpell(int16 spell_id);
bool IsPlayerIllusionSpell(int16 spell_id); // seveian 2008-09-23
bool IsLDoNObjectSpell(int16 spell_id);
sint32 GetSpellResistType(int16 spell_id);
sint32 GetSpellTargetType(int16 spell_id);
bool IsHealOverTimeSpell(int16 spell_id);
bool IsCompleteHealSpell(int16 spell_id);
bool IsFastHealSpell(int16 spell_id);
bool IsRegularSingleTargetHealSpell(int16 spell_id);

int CalcPetHp(int levelb, int classb, int STA = 75);
const char *GetRandPetName();
int GetSpellEffectDescNum(int16 spell_id);
DmgShieldType GetDamageShieldType(int16 spell_id);

#endif
