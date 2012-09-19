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
#ifndef MOB_H
#define MOB_H

#include "features.h"


/* solar: macros for IsAttackAllowed, IsBeneficialAllowed */
#define _CLIENT(x) (x && x->IsClient() && !x->CastToClient()->IsBecomeNPC())
#define _NPC(x) (x && x->IsNPC() && !x->CastToMob()->GetOwnerID())
#define _BECOMENPC(x) (x && x->IsClient() && x->CastToClient()->IsBecomeNPC())
#define _CLIENTCORPSE(x) (x && x->IsCorpse() && x->CastToCorpse()->IsPlayerCorpse() && !x->CastToCorpse()->IsBecomeNPCCorpse())
#define _NPCCORPSE(x) (x && x->IsCorpse() && (x->CastToCorpse()->IsNPCCorpse() || x->CastToCorpse()->IsBecomeNPCCorpse()))
#define _CLIENTPET(x) (x && x->CastToMob()->GetOwner() && x->CastToMob()->GetOwner()->IsClient())
#define _NPCPET(x) (x && x->IsNPC() && x->CastToMob()->GetOwner() && x->CastToMob()->GetOwner()->IsNPC())
#define _BECOMENPCPET(x) (x && x->CastToMob()->GetOwner() && x->CastToMob()->GetOwner()->IsClient() && x->CastToMob()->GetOwner()->CastToClient()->IsBecomeNPC())

//Spell specialization parameters, not sure of a better place for them
#define SPECIALIZE_FIZZLE 11		//% fizzle chance reduce at 200 specialized
#define SPECIALIZE_MANA_REDUCE 12	//% mana cost reduction at 200 specialized

#define MAX_SHIELDERS 2		//I dont know if this is based on a client limit

#define APPEAR_VISIBLE	0x0003
#define APPEAR_ANIM		0x000e
#define APPEAR_SNEAK	0x000f
#define	APPEAR_AFK		0x0018
#define	APPEAR_ANON		0x0015
#define	APPEAR_SPLIT	0x001c
#define APPEAR_HEIGHT	0x001d
#define	APPEAR_HP_TIC	0x0011

#define CON_GREEN		2
#define CON_LIGHTBLUE	18
#define CON_BLUE		4
#define CON_WHITE		20
#define CON_YELLOW		15
#define CON_RED			13

//LOS Parameters:
#define HEAD_POSITION 0.9f	//ratio of GetSize() where NPCs see from
#define SEE_POSITION 0.5f	//ratio of GetSize() where NPCs try to see for LOS
#define CHECK_LOS_STEP 1.0f

#include "../common/logsys.h"
#include "entity.h"
#include "spdat.h"
#include "event_codes.h"
#include "hate_list.h"
#include "../common/Kaiyodo-LList.h"
#include "../common/skills.h"
#include "../common/bodytypes.h"
#include "pathing.h"
#include "map.h"
#include <set>
#include <vector>
#include <string>

/*enum FindSpellType {
	SPELLTYPE_SELF,
	SPELLTYPE_OFFENSIVE,
	SPELLTYPE_OTHER
};*/

enum {
	SPECATK_NONE = 0,
	SPECATK_SUMMON,		//S
	SPECATK_ENRAGE,		//E
	SPECATK_RAMPAGE,	//R
	SPECATK_AREA_RAMPAGE,	//r
	SPECATK_FLURRY,		//F
	SPECATK_TRIPLE,		//T
	SPECATK_QUAD,		//Q
	SPECATK_BANE,		//b
	SPECATK_MAGICAL,	//m
	SPECATK_RANGED_ATK,	//Y
	UNSLOWABLE,			//U
	UNMEZABLE,			//M
	UNCHARMABLE,		//C
	UNSTUNABLE,			//N
	UNSNAREABLE,		//I
	UNFEARABLE,			//D
	IMMUNE_MELEE,		//A
	IMMUNE_MAGIC,		//B
	IMMUNE_FLEEING,		//f
	IMMUNE_MELEE_EXCEPT_BANE,	//O
	IMMUNE_MELEE_NONMAGICAL,	//W
	IMMUNE_AGGRO, //H, wont aggro, ever.
	IMMUNE_TARGET, //G, can't be aggroed, ever
	IMMUNE_CASTING_FROM_RANGE, //g
	IMMUNE_FEIGN_DEATH, //d
	SPECATK_MAXNUM
};

typedef enum {	//fear states
	fearStateNotFeared = 0,
	fearStateRunning,		//I am running, hoping to find a grid at my WP
	fearStateRunningForever,	//can run straight until spell ends
	fearStateGrid,			//I am allready on a fear grid
	fearStateStuck			//I cannot move somehow...
} FearState;

enum { FlyMode0 = 0, FlyMode1 = 1, Flymode2 = 2, FlyMode3 = 3 };

struct TradeEntity;
class Trade;
enum TradeState {
	TradeNone,
	Trading,
	TradeAccepted,
	TradeCompleting
};

//this is our internal representation of the BUFF struct, can put whatever we want in it
struct Buffs_Struct {
	int32	spellid;
	int8		casterlevel;
	int16	casterid;		// Maybe change this to a pointer sometime, but gotta make sure it's 0'd when it no longer points to anything
	int8		durationformula;
	sint32		ticsremaining;
	sint32	poisoncounters;
	sint32	diseasecounters;
	sint32	cursecounters;
	bool	persistant_buff;
	uint32	numhits; //the number of physical hits this buff can take before it fades away, lots of druid armor spells take advantage of this mixed with powerful effects
	bool	client;  //True if the caster is a client
	bool	UpdateClient;
	int16	melee_rune;
	int16	magic_rune;
	int8	deathSaveSuccessChance;
	int8	casterAARank;				// The idea here is if you need to know what the caster AA rank was for a buff long after is has been casted.
	//todo: dot stacking?
};

struct StatBonuses {
	sint16	AC;
	sint32	HP;
	sint32	HPRegen;
	sint32	MaxHP;
	sint32	ManaRegen;
	sint32	EnduranceRegen;
	sint16	Mana;
	sint32	Endurance;
	sint16	ATK;
	//would it be worth it to create a Stat_Struct?
	sint16	STR;
	sint16	STRCapMod;
	sint16	STA;
	sint16	STACapMod;
	sint16	DEX;
	sint16	DEXCapMod;
	sint16	AGI;
	sint16	AGICapMod;
	sint16	INT;
	sint16	INTCapMod;
	sint16	WIS;
	sint16	WISCapMod;
	sint16	CHA;
	sint16	CHACapMod;
	sint16	MR;
	sint16	MRCapMod;
	sint16	FR;
	sint16	FRCapMod;
	sint16	CR;
	sint16	CRCapMod;
	sint16	PR;
	sint16	PRCapMod;
	sint16	DR;
	sint16	DRCapMod;
	uint16	DamageShieldSpellID;
	int		DamageShield; // this is damage done to mobs that attack this
	DmgShieldType	DamageShieldType;
	int		SpellDamageShield;
	int		ReverseDamageShield; // this is damage done to the mob when it attacks
	uint16	ReverseDamageShieldSpellID;
	DmgShieldType	ReverseDamageShieldType;
	int		movementspeed;
	sint8		haste;
	sint8	hastetype2;
	sint8	hastetype3;
	float	AggroRange; // when calculate just replace original value with this
	float	AssistRange;
	sint16	skillmod[HIGHEST_SKILL+1];
	int		effective_casting_level;
	int		reflect_chance;	// chance to reflect incoming spell
	int16	singingMod;
	int16	brassMod;
	int16	percussionMod;
	int16	windMod;
	int16	stringedMod;
	sint8	hatemod;
	sint32	EnduranceReduction;

	//PoP effects:
	sint16   StrikeThrough;          // PoP: Strike Through %
//	sint16   CombatEffects; //AFAIK: Combat Effects == ProcChance
//	sint16   Shielding;     //AFAIK, Shielding == MeleeMitigation
//	sint16   Avoidance;		//AFAIK: Avoidance == AvoidMeleeChance
//	sint16   Accuracy;      //AFAIK: Accuracy == HitChance


	//discipline and PoP effects
	//everything is a straight percent increase unless noted.
	sint16 MeleeMitigation;	//i
	sint16 CriticalHitChance;	//i
	sint16 CrippBlowChance;
	sint16 AvoidMeleeChance;	//AvoidMeleeChance/10 == % chance i
	sint16 RiposteChance;	//i
	sint16 DodgeChance;		//i
	sint16 ParryChance;		//i
	sint16 DualWeildChance;		//i
	sint16 DoubleAttackChance;	//i
	sint16 ResistSpellChance;	//i
	sint16 ResistFearChance;	//i
	sint16 StunResist;		//i
	sint16 MeleeSkillCheck;	//i
	uint8  MeleeSkillCheckSkill;
	sint16 HitChance;			//HitChance/15 == % increase i
	uint8  HitChanceSkill;
	sint16 DamageModifier;		//needs to be thought about more and implemented
	uint8  DamageModifierSkill;
	sint16 MinDamageModifier;   //i
	sint16 ProcChance;			// ProcChance/10 == % increase i
	sint16 ExtraAttackChance;
	sint16 DoTShielding;

	sint8 HundredHands;		//extra haste, stacks with all other haste  i
	bool MeleeLifetap;  //i
	int XPRateMod;

	sint8	Packrat;	//weight reduction for items, 1 point = 10%
};

typedef struct
{
    int16 spellID;
    int16 chance;
    Timer *pTimer;
} tProc;

struct Shielders_Struct {
	int32   shielder_id;
	int16   shielder_bonus;
};

//eventually turn this into a typedef and
//make DoAnim take it instead of int, to enforce its use.
enum {	//type arguments to DoAnim
	animKick				= 1,
	animPiercing			= 2,	//might be piercing?
	anim2HSlashing			= 3,
	anim2HWeapon			= 4,
	anim1HWeapon			= 5,
	animDualWield			= 6,
	animTailRake			= 7,	//slam & Dpunch too
	animHand2Hand			= 8,
	animShootBow			= 9,
	animRoundKick			= 11,
	animSwarmAttack			= 20,	//dunno about this one..
	animFlyingKick			= 45,
	animTigerClaw			= 46,
	animEagleStrike			= 47,

};


typedef enum {
	petFamiliar,		//only listens to /pet get lost
	petAnimation,		//does not listen to any commands
	petOther,
	petCharmed,
	petNPCFollow
} PetType;

class AA_SwarmPetInfo {
public:
	AA_SwarmPetInfo() { target = 0; owner = NULL; duration = NULL;}
	~AA_SwarmPetInfo() { target = 0; owner = NULL; safe_delete(duration); }
	Timer *duration;
	int32 target; //the target ID
	Mob *owner;
};

typedef enum {
	SingleTarget,	// causes effect to spell_target
	AETarget,			// causes effect in aerange of target + target
	AECaster,			// causes effect in aerange of 'this'
	GroupSpell,		// causes effect to caster + target's group
	CastActUnknown
} CastAction_type;

class EGNode;
class MobFearState;

class Mob : public Entity {
public:
	bool logpos;
	enum CLIENT_CONN_STATUS { CLIENT_CONNECTING, CLIENT_CONNECTED, CLIENT_LINKDEAD,
                          CLIENT_KICKED, DISCONNECTED, CLIENT_ERROR, CLIENT_CONNECTINGALL };
	enum eStandingPetOrder { SPO_Follow, SPO_Sit, SPO_Guard };

#ifdef EQBOTS
	typedef std::map<uint32, uint32> BotInventory;
	typedef std::pair<uint32, uint32> BotInventoryItem;
#endif //EQBOTS

	//all of this shit is public due to #pf:
	float	tarx;
	float	tary;
	float	tarz;
	int8	tar_ndx;
	float	tar_vector;
	float	tar_vx;
	float	tar_vy;
	float	tar_vz;
	float	test_vector;


	int32	GetPRange(float x, float y, float z);
	static	int32	RandomTimer(int min, int max);
	static	int8	GetDefaultGender(int16 in_race, int8 in_gender = 0xFF);
	static	void	CreateSpawnPacket(EQApplicationPacket* app, NewSpawn_Struct* ns);
//	static	int		CheckEffectIDMatch(int8 effectindex, int16 spellid1, int8 caster_level1, int16 spellid2, int8 caster_level2);


	virtual void	RogueBackstab(Mob* other, bool min_damage = false);
	virtual void	RogueAssassinate(Mob* other); // solar
	bool	BehindMob(Mob* other = 0, float playerx = 0.0f, float playery = 0.0f) const;

	void	TriggerDefensiveProcs(Mob *on);

	Mob(const char*   in_name,
	    const char*   in_lastname,
	    sint32  in_cur_hp,
	    sint32  in_max_hp,
	    int8    in_gender,
	    uint16	in_race,
	    int8    in_class,
        bodyType    in_bodytype,
	    int8    in_deity,
	    int8    in_level,
		int32   in_npctype_id,
		float	in_size,
		float	in_runspeed,
	    float   in_heading,
	    float	in_x_pos,
	    float	in_y_pos,
	    float	in_z_pos,
	    int8    in_light,
		int8	in_texture,
		int8	in_helmtexture,
		int16	in_ac,
		int16	in_atk,
		int16	in_str,
		int16	in_sta,
		int16	in_dex,
		int16	in_agi,
		int16	in_int,
		int16	in_wis,
		int16	in_cha,
		int8	in_haircolor,
		int8	in_beardcolor,
		int8	in_eyecolor1, // the eyecolors always seem to be the same, maybe left and right eye?
		int8	in_eyecolor2,
		int8	in_hairstyle,
		int8	in_luclinface,
		int8	in_beard,
		int32	in_drakkin_heritage,
		int32	in_drakkin_tattoo,
		int32	in_drakkin_details,
		int32	in_armor_tint[MAX_MATERIALS],
		int8	in_aa_title,
		int8	in_see_invis,			// see through invis
		int8	in_see_invis_undead,		// see through invis vs. undead
		int8	in_see_hide,
		int8	in_see_improved_hide,
		sint16	in_hp_regen,
		sint16	in_mana_regen,
		int8	in_qglobal,
		float	in_slow_mitigation,	// Allows for mobs to mitigate how much they are slowed.
		int8	in_maxlevel,
		int32	in_scalerate
	);
	virtual ~Mob();

	inline virtual bool IsMob() const { return true; }
	inline virtual bool InZone() const { return true; }
	void	BuffProcess();
	virtual void SetLevel(uint8 in_level, bool command = false) { level = in_level; }
	void	SendLevelAppearance();
	void	SendAppearanceEffect(int32 parm1, int32 parm2, int32 parm3, int32 parm4, int32 parm5);

	virtual inline sint32 GetPrimaryFaction() const { return 0; }
	virtual uint16 GetSkill(SkillType skill_num) const { return 0; } //overloaded by things which actually have skill (NPC|client)
	virtual void SendWearChange(int8 material_slot);
	virtual void SendTextureWC(int8 slot, int16 texture);
	virtual int32 GetEquipment(int8 material_slot) const { return(0); }
	virtual sint32 GetEquipmentMaterial(int8 material_slot) const;
	virtual uint32 GetEquipmentColor(int8 material_slot) const;

	void Warp( float x, float y, float z );
	inline bool IsMoving() const { return moving; }
	virtual void SetMoving(bool move) { moving = move; delta_x=0; delta_y=0; delta_z=0; delta_heading=0; }
	virtual void GoToBind(uint8 bindnum = 0) {}
	virtual void Gate();
	virtual void	RangedAttack(Mob* other) { }
	virtual void	ThrowingAttack(Mob* other) { }
	uint16  GetThrownDamage(sint16 wDmg, sint32& TotalDmg, int& minDmg);
	bool	AffectedExcludingSlot(int slot, int effect);
	// abstract methods
	virtual void Death(Mob* killerMob, sint32 damage, int16 spell_id, SkillType attack_skill) = 0;
	virtual void Damage(Mob* from, sint32 damage, int16 spell_id, SkillType attack_skill, bool avoidable = true, sint8 buffslot = -1, bool iBuffTic = false) = 0;
	virtual bool Attack(Mob* other, int Hand = 13, bool FromRiposte = false) = 0;	// 13 = Primary (default), 14 = secondary
	virtual bool HasRaid() = 0;
	virtual bool HasGroup() = 0;
	virtual Raid* GetRaid() = 0;
	virtual Group* GetGroup() = 0;

#ifdef EQBOTS
	//EQoffline-adds
	//#include "botStructs.h"
	int32				character_id;
	inline int32	CharacterID()	const { return character_id; }
	virtual bool BotAttackMelee(Mob* other, int Hand = 13, bool FromRiposte = false) { return false; }
	virtual bool BotRangedAttack(Mob* other) { return false; }
	bool BotRaiding;
	bool botNpcMode;
	bool OrderBotAttack;
	bool BotArchery;
	bool BotCharmer;
	bool PetChooser;
	bool BotTaunter;
	bool BotMezZzer;
	bool CasterEngaged;
	bool BotPrimary;
	bool BotSnare;
	bool BotRoot;
	bool BotChat;
	bool BotSelos;
	bool BotLock1;
	bool BotBattleHeal;
	bool Back_Turned;
	int8 PetChooserID;
	uint32 BotArcheryRange;
	uint32 BotTashLevel;
	uint32 BotTauntLevel;
	void SetBotArcheryRange(uint32 r) { BotArcheryRange = r; }
	void SetBotTashLevel(uint32 tashLevel) { BotTashLevel = tashLevel; }
	void SetBotTauntLevel(uint32 tauntLevel) { BotTauntLevel = tauntLevel; }
	void SetPetChooserID(int8 id) { PetChooserID = id; }
	int8 GetPetChooserID() { return PetChooserID; }
	uint32 GetBotArcheryRange() { return BotArcheryRange; }
	uint32 GetBotTashLevel() { return BotTashLevel; }
	uint32 GetBotTauntLevel() { return BotTauntLevel; }
	void SetBotArcher(bool a) { BotArchery = a; }
	void SetBotCharmer(bool c) { BotCharmer = c; }
	void SetBotRaiding(bool v) { BotRaiding = v; }
	void SetBotTaunter(bool d) { BotTaunter = d; }
	void SetBotPrimary(bool f) { BotPrimary = f; }
	void SetBotMezzer(bool useMezzer) { BotMezZzer = useMezzer; }
	void SetCasterEngaged(bool BotCaster) { CasterEngaged = BotCaster; }
	void SetBotSnare(bool useSnare) { BotSnare = useSnare; }
	void SetBotRoot(bool h) { BotRoot = h; }
	void SetBotChat(bool i) { BotChat = i; }
	void SetBotSelos(bool useSelos ) { BotSelos = useSelos; }
	void SetBotLock1(bool setLock1) { BotLock1 = setLock1; }
	void SetBotBattleHeal(bool k) { BotBattleHeal = k; }
	void SetbotNpcMode(bool NpcMode) { botNpcMode = NpcMode; }
	void SetPetChooser(bool p) { PetChooser = p; }
	void SetOrderBotAttack(bool v) { OrderBotAttack = v; }
	void SetBackTurned(bool b) { Back_Turned = b; }
	bool IsBackTurned() const { return Back_Turned; }
	bool IsBotRaiding() const { return BotRaiding; }
	bool GetNpcMode() const { return botNpcMode; }
	bool IsPetChooser() const { return PetChooser; }
	bool IsBotArcher() const { return BotArchery; }
	bool IsBotCharmer() const { return BotCharmer; }
	bool SetPrimary() const { return BotPrimary; }
	bool SetSnare() const { return BotSnare; }
	bool SetRoot() const { return BotRoot; }
	bool SetChat() const { return BotChat; }
	bool SetSelos() const { return BotSelos; }
	bool SetLock1() const { return BotLock1; }
	bool SetBattleheal() const { return BotBattleHeal; }
	bool IsCasterEngaged() const { return CasterEngaged; }
	bool IsATaunter() const { return BotTaunter; }
	bool IsAMezzer() const { return BotMezZzer; }
	bool IsOrderBotAttack() const { return OrderBotAttack; }
	bool CheckBotDoubleAttack(bool Triple = false);
	static void SpawnBotTemp(int32 groupId, Client* botOwner);
	static void SpawnBotBank(int32 groupId, Client* botOwner);
	static void SaveBotGroup(int32 GroupID, Client* botOwner);
	static void CheckBotTemp(Client* botOwner);
	static void ProcessBotInspectionRequest(Mob* inspectedBot, Client* client); 
	static void EquipBot(NPC* bot, std::string* errorMessage);
	static void GetBotItems(NPC* bot, std::string* errorMessage);
	void SummonBotPetGear(NPC* pet);
	void SayRandomBotMessage(int Table);
	//void SayRandomMessage();
	//void ManaSayFunction(char *Message);
	void CalculateChatListMetrics();
	void RestoreBotBuffs(NPC* bot);
	void BotAddEquipItem(int slot, uint32 id);
	void UpdateBotStats(int32 hp, int32 mana, int32 botid);
	void UpdateBotBuffs(int32 botid);
	void DeleteBotBuffs(int32 botid);
	int GetBotHP(int32 botid);
	int GetBotMana(int32 botid);
	int CheckBotBuffs(int32 botid);
	static ItemInst* GetBotItem(NPC* bot, uint32 slotID);
#endif //EQBOTS

	// methods with implementation
	virtual void Heal();
	virtual void HealDamage(uint32 ammount, Mob* caster = NULL);
	virtual void SetMaxHP() { cur_hp = max_hp; }
	static int32 GetLevelCon(int8 mylevel, int8 iOtherLevel);
	inline int32 GetLevelCon(int8 iOtherLevel) const { return(this?GetLevelCon(GetLevel(), iOtherLevel):CON_GREEN); }
	virtual void AddToHateList(Mob* other, sint32 hate = 0, sint32 damage = 0, bool iYellForHelp = true, bool bFrenzy = false, bool iBuffTic = false);

	inline virtual void SetHP(sint32 hp) { if (hp >= max_hp) cur_hp = max_hp; else cur_hp = hp;}
	bool ChangeHP(Mob* other, sint32 amount, int16 spell_id = 0, sint8 buffslot = -1, bool iBuffTic = false);
	inline void SetOOCRegen(sint32 newoocregen) {oocregen = newoocregen;}
	int MonkSpecialAttack(Mob* other, int8 skill_used);
	virtual void TryBackstab(Mob *other);
	void DoAnim(const int animnum, int type=0, bool ackreq = true, eqFilterType filter = FilterNone);
	void ProjectileAnimation(Mob* to, int16 item_id, bool IsArrow = false, float speed = 0, float angle = 0, float tilt = 0, float arc = 0);

	void ChangeSize(float in_size, bool bNoRestriction = false);
	virtual void GMMove(float x, float y, float z, float heading = 0.01, bool SendUpdate = true);
	void SetDeltas(float delta_x, float delta_y, float delta_z, float delta_h);
	void SendPosUpdate(int8 iSendToSelf = 0);
	void MakeSpawnUpdateNoDelta(PlayerPositionUpdateServer_Struct* spu);
	void MakeSpawnUpdate(PlayerPositionUpdateServer_Struct* spu);
	void SendPosition();

	void CreateDespawnPacket(EQApplicationPacket* app, bool Decay);
	void CreateHorseSpawnPacket(EQApplicationPacket* app, const char* ownername, uint16 ownerid, Mob* ForWho = 0);
	void CreateSpawnPacket(EQApplicationPacket* app, Mob* ForWho = 0);
	virtual void FillSpawnStruct(NewSpawn_Struct* ns, Mob* ForWho);
	void CreateHPPacket(EQApplicationPacket* app);
	void SendHPUpdate();

	bool AddRangedProc(int16 spell_id, int16 iChance = 3);
	bool RemoveRangedProc(int16 spell_id, bool bAll = false);
	bool HasRangedProcs() const;

	bool AddDefensiveProc(int16 spell_id, int16 iChance = 3);
	bool RemoveDefensiveProc(int16 spell_id, bool bAll = false);
	bool HasDefensiveProcs() const;

	bool AddProcToWeapon(int16 spell_id, bool bPerma = false, int16 iChance = 3);
	bool RemoveProcFromWeapon(int16 spell_id, bool bAll = false);
	bool HasProcs() const;

	inline bool SeeInvisible() const { return see_invis; }				// Mongrel: Now using the flags
	inline bool SeeInvisibleUndead() const { return see_invis_undead; }   // Mongrel: Now using the flags
	inline bool SeeHide() const { return see_hide; }
	inline bool SeeImprovedHide() const { return see_improved_hide; }

	bool CheckLos(Mob* other);
	bool CheckLosFN(Mob* other);
	bool CheckLosFN(float posX, float posY, float posZ, float mobSize);
	inline bool GetQglobal() const {return qglobal;}		// SCORPIOUS2K - return quest global flag

	bool IsInvisible(Mob* other = 0) const;
	void SetInvisible(bool state);

	bool AttackAnimation(SkillType &skillinuse, int Hand, const ItemInst* weapon);
	virtual bool AvoidDamage(Mob* attacker, sint32 &damage);
	virtual bool CheckHitChance(Mob* attacker, SkillType skillinuse, int Hand);
	virtual void TryCriticalHit(Mob *defender, int16 skill, sint32 &damage);
	void TryPetCriticalHit(Mob *defender, int16 skill, sint32 &damage);
	virtual bool TryFinishingBlow(Mob *defender, SkillType skillinuse);
	virtual bool TryHeadShot(Mob* defender, SkillType skillInUse);
	virtual void DoRiposte(Mob* defender);
	void ApplyMeleeDamageBonus(int16 skill, sint32 &damage);
	virtual void MeleeMitigation(Mob *attacker, sint32 &damage, sint32 minhit);

	void	DamageShield(Mob* other);
	bool	FindBuff(int16 spellid);
	bool	FindType(int8 type, bool bOffensive = false, int16 threshold = 100);
	sint8	GetBuffSlotFromType(int8 type);
	int		CountDispellableBuffs();
	bool	HasBuffIcon(Mob* caster, Mob* target, int16 spell_id);

	virtual void MakePet(int16 spell_id, const char* pettype, const char *petname = NULL);
//	inline void	MakePetType(int16 spell_id, const char* pettype, const char *petname = NULL) { MakePet(spell_id, pettype, petname); }	//for perl
//	void	MakePet(int16 spell_id, int8 in_level, int8 in_class, int16 in_race, int8 in_texture = 0, int8 in_pettype = 0, float in_size = 0, int8 type = 0, int32 min_dmg = 0, int32 max_dmg = 0, const char *petname = NULL);

	bool	CombatRange(Mob* other);
//	int8	flag[60];		//this is for quests or something...

	virtual inline int16	GetBaseRace()	const { return base_race; }
	virtual inline int8	GetBaseGender()		const { return base_gender; }
	virtual inline int8	GetDeity()			const { return deity; }
	inline int16	GetRace()				const { return race; }
	inline int8	GetGender()					const { return gender; }
	inline int8	GetTexture()				const { return texture; }
	inline int8	GetHelmTexture()			const { return helmtexture; }
	inline int8	GetHairColor()				const { return haircolor; }
	inline int8	GetBeardColor()				const { return beardcolor; }
	inline int8	GetEyeColor1()				const { return eyecolor1; }
	inline int8	GetEyeColor2()				const { return eyecolor2; }
	inline int8	GetHairStyle()				const { return hairstyle; }
	inline int8	GetLuclinFace()				const { return luclinface; }
	inline int8	GetBeard()					const { return beard; }
	inline int8	GetDrakkinHeritage()		const { return drakkin_heritage; }
	inline int8	GetDrakkinTattoo()			const { return drakkin_tattoo; }
	inline int8	GetDrakkinDetails()			const { return drakkin_details; }
	inline int32  GetArmorTint(int8 i)		const { return armor_tint[(i < MAX_MATERIALS) ? i : 0]; }
	inline int8	GetClass()					const { return class_; }
	inline uint8	GetLevel()				const { return level; }
	inline const char*	GetName()			const { return name; }
	inline const char*	GetLastName()			const { return lastname; }
	const char *GetCleanName();
	inline Mob*			GetTarget()			const { return target; }
	virtual void SetTarget(Mob* mob);
	virtual inline float		GetHPRatio() const { return max_hp == 0 ? 0 : ((float)cur_hp/max_hp*100); }

	bool IsLoggingEnabled() const { return(logging_enabled); }
	void EnableLogging() { logging_enabled = true; }
	void DisableLogging() { logging_enabled = false; }
	bool IsWarriorClass() const;
	virtual bool IsAttackAllowed(Mob *target, bool isSpellAttack = false);
	bool IsBeneficialAllowed(Mob *target);

	inline sint32	GetHP()			const { return cur_hp; }
	inline sint32	GetMaxHP()		const { return max_hp; }
	virtual inline sint32	CalcMaxHP()		{ return max_hp = (base_hp  + itembonuses.HP + spellbonuses.HP); }
	float GetWalkspeed() const { return(_GetMovementSpeed(-47)); }
	float GetRunspeed() const { return(_GetMovementSpeed(0)); }
	float GetBaseRunspeed() const { return runspeed; }
	float GetMovespeed() const {
		if(IsRunning())
		{
			return GetRunspeed();
		}
		else
		{
			return GetWalkspeed();
		}
	}
	bool IsRunning() const { return m_is_running; }
	void SetRunning(bool val) { m_is_running = val; }

	virtual int GetCasterLevel(int16 spell_id);
	void ApplySpellsBonuses(int16 spell_id, int8 casterlevel, StatBonuses* newbon, int16 casterID = 0);

	inline sint32	GetMaxMana()	const { return max_mana; }
	inline sint32	GetMana()		const { return cur_mana; }
	virtual const sint32& SetMana(sint32 amount);
	inline float	GetManaRatio()	const { return max_mana == 0 ? 100 : (((float)cur_mana/max_mana)*100); }
	void			SetZone(int32 zone_id, int32 instance_id);

	// neotokyo: moved from client to use in NPC too
	char GetCasterClass() const;
	virtual sint32 CalcMaxMana();

	inline virtual sint16	GetAC()		const { return AC + itembonuses.AC + spellbonuses.AC; } // Quagmire - this is NOT the right math
	inline virtual sint16	GetATK()	const { return ATK + itembonuses.ATK + spellbonuses.ATK + (GetSTR() * 9 / 10); }
	inline virtual sint16	GetATKBonus()	const { return itembonuses.ATK + spellbonuses.ATK; }
	inline virtual sint16	GetSTR()	const { return STR + itembonuses.STR + spellbonuses.STR; }
	inline virtual sint16	GetSTA()	const { return STA + itembonuses.STA + spellbonuses.STA; }
	inline virtual sint16	GetDEX()	const { return DEX + itembonuses.DEX + spellbonuses.DEX; }
	inline virtual sint16	GetAGI()	const { return AGI + itembonuses.AGI + spellbonuses.AGI; }
	inline virtual sint16	GetINT()	const { return INT + itembonuses.INT + spellbonuses.INT; }
	inline virtual sint16	GetWIS()	const { return WIS + itembonuses.WIS + spellbonuses.WIS; }
	inline virtual sint16	GetCHA()	const { return CHA + itembonuses.CHA + spellbonuses.CHA; }
	inline virtual sint16	GetMR() const { return MR + itembonuses.MR + spellbonuses.MR; }
	inline virtual sint16	GetFR()	const { return FR + itembonuses.FR + spellbonuses.FR; }
	inline virtual sint16	GetDR()	const { return DR + itembonuses.DR + spellbonuses.DR; }
	inline virtual sint16	GetPR()	const { return PR + itembonuses.PR + spellbonuses.PR; }
	inline virtual sint16	GetCR() const { return CR + itembonuses.CR + spellbonuses.CR; }

	inline StatBonuses GetItemBonuses() const { return itembonuses; }
	inline StatBonuses GetSpellBonuses() const { return spellbonuses;}
	inline StatBonuses GetAABonuses() const { return aabonuses; }
	
#ifdef EQBOTS
	typedef enum {	//focus types
		botfocusSpellHaste = 1,
		botfocusSpellDuration,
		botfocusRange,
		botfocusReagentCost,
		botfocusManaCost,
		botfocusImprovedHeal,
		botfocusImprovedDamage,
		botfocusImprovedDOT,		//i dont know about this...
		botfocusImprovedCritical,
		botfocusImprovedUndeadDamage,
		botfocusPetPower,
		botfocusResistRate,
		botfocusHateReduction,
	} botfocusType;
	void CalcBotStats(bool showtext = true);
	sint16 GetBotFocusEffect(botfocusType bottype, int16 spell_id);
	sint16 CalcBotFocusEffect(botfocusType bottype, int16 focus_id, int16 spell_id);
	sint32 GetBotActSpellCasttime(int16 spell_id, sint32 casttime);
	sint32 GetBotActSpellCost(int16 spell_id, sint32 cost);
	float GetBotActSpellRange(int16 spell_id, float range);
	sint32 GetBotActSpellDuration(int16 spell_id, sint32 duration);
#endif //EQBOTS	
	
	inline virtual sint16  GetMaxSTR() const { return GetSTR(); }
	inline virtual sint16  GetMaxSTA() const { return GetSTA(); }
	inline virtual sint16  GetMaxDEX() const { return GetDEX(); }
	inline virtual sint16  GetMaxAGI() const { return GetAGI(); }
	inline virtual sint16  GetMaxINT() const { return GetINT(); }
	inline virtual sint16  GetMaxWIS() const { return GetWIS(); }
	inline virtual sint16  GetMaxCHA() const { return GetCHA(); }
	inline virtual sint16  GetMaxMR() const { return 255; }
	inline virtual sint16  GetMaxPR() const { return 255; }
	inline virtual sint16  GetMaxDR() const { return 255; }
	inline virtual sint16  GetMaxCR() const { return 255; }
	inline virtual sint16  GetMaxFR() const { return 255; }

	virtual float GetActSpellRange(int16 spell_id, float range){ return range;}
	virtual sint32  GetActSpellDamage(int16 spell_id, sint32 value) { return value; }
	virtual sint32  GetActSpellHealing(int16 spell_id, sint32 value) { return value; }
	virtual sint32 GetActSpellCost(int16 spell_id, sint32 cost){ return cost;}
	virtual sint32 GetActSpellDuration(int16 spell_id, sint32 duration){ return duration;}
	virtual sint32 GetActSpellCasttime(int16 spell_id, sint32 casttime);
	float ResistSpell(int8 resist_type, int16 spell_id, Mob *caster);
	uint16 GetSpecializeSkillValue(int16 spell_id) const;

	void ShowStats(Client* client);

#ifdef EQBOTS
	void BotEffect(Client* client); //Angelox
	void BuffReport(Client* client);
#endif //EQBOTS	

	void ShowBuffs(Client* client);
	void ShowBuffList(Client* client);
	int32 GetNPCTypeID()			const { return npctype_id; } // rembrant, Dec. 20, 2001

	float Dist(const Mob &) const;
	float DistNoZ(const Mob &) const;
	float DistNoRoot(const Mob &) const;
	float DistNoRoot(float x, float y, float z) const;
	float DistNoRootNoZ(float x, float y) const;
	float DistNoRootNoZ(const Mob &) const;

	static float GetReciprocalHeading(Mob* target);
	bool PlotPositionAroundTarget(Mob* target, float &x_dest, float &y_dest, float &z_dest, bool lookForAftArc = true);

	bool IsTargeted() const { return (targeted > 0); }
	inline void IsTargeted(int in_tar) { targeted += in_tar; if(targeted < 0) targeted = 0;}

	inline void		Teleport(VERTEX NewPosition) { x_pos = NewPosition.x; y_pos = NewPosition.y; z_pos = NewPosition.z; };
	inline const float	GetX() const		{ return x_pos; }
	inline const float	GetY() const		{ return y_pos; }
	inline const float	GetZ() const		{ return z_pos; }
	inline const float	GetHeading() const	{ return heading; }
	inline const float	GetSize() const		{ return size; }
	inline const float	GetBaseSize() const		{ return base_size; }
	inline void			SetChanged()		{ pLastChange = Timer::GetCurrentTime(); }
	inline const int32	LastChange() const	{ return pLastChange; }

	void	SetFollowID(int32 id) { follow = id; }
	void	SetFollowDistance(int32 dist) { follow_dist = dist; }
	int32	GetFollowID()		  const { return follow; }
	int32	GetFollowDistance()		  const { return follow_dist; }

	virtual void	Message(int32 type, const char* message, ...) {} // fake so dont have to worry about typecasting
	virtual void	Message_StringID(int32 type, int32 string_id, int32 distance = 0) {}
	virtual void	Message_StringID(int32 type, int32 string_id, const char* message,const char* message2=0,const char* message3=0,const char* message4=0,const char* message5=0,const char* message6=0,const char* message7=0,const char* message8=0, const char* message9=0, int32 distance = 0) {}
	void Say(const char *format, ...);
	void Say_StringID(int32 string_id, const char *message3 = 0, const char *message4 = 0, const char *message5 = 0, const char *message6 = 0, const char *message7 = 0, const char *message8 = 0, const char *message9 = 0);
	void Shout(const char *format, ...);
	void Emote(const char *format, ...);
	void QuestJournalledSay(Client *QuestInitiator, const char *str);
	int32 GetItemStat(int32 itemid, const char *identifier);

	virtual void SpellProcess();
	virtual bool CheckFizzle(int16 spell_id);
	void ZeroCastingVars();
	bool UseBardSpellLogic(int16 spell_id = 0xffff, int slot = -1);
	void InterruptSpell(int16 spellid = SPELL_UNKNOWN);
	void InterruptSpell(int16, int16, int16 spellid = SPELL_UNKNOWN);
	virtual bool CastSpell(int16 spell_id, int16 target_id, int16 slot = 10, sint32 casttime = -1, sint32 mana_cost = -1, int32* oSpellWillFinish = 0, int32 item_slot = 0xFFFFFFFF);
	virtual bool DoCastSpell(int16 spell_id, int16 target_id, int16 slot = 10, sint32 casttime = -1, sint32 mana_cost = -1, int32* oSpellWillFinish = 0, int32 item_slot = 0xFFFFFFFF);
	void	CastedSpellFinished(int16 spell_id, int32 target_id, int16 slot, int16 mana_used, int32 inventory_slot = 0xFFFFFFFF);
	bool	SpellFinished(int16 spell_id, Mob *target, int16 slot = 10, int16 mana_used = 0, int32 inventory_slot = 0xFFFFFFFF);
	virtual bool SpellOnTarget(int16 spell_id, Mob* spelltar);
	bool	ApplyNextBardPulse(int16 spell_id, Mob *spell_target, int16 slot);
	void	BardPulse(uint16 spell_id, Mob *caster);
	virtual bool DetermineSpellTargets(uint16 spell_id, Mob *&spell_target, Mob *&ae_center, CastAction_type &CastAction);
	int		CalcBuffDuration(Mob *caster, Mob *target, int16 spell_id, sint32 caster_level_override = -1);
	void	SendPetBuffsToClient();
	void	SendBuffsToClient(Client *c);
	EQApplicationPacket *MakeTargetBuffsPacket();
//	int		CheckAddBuff(Mob* caster, const int16& spell_id, const int& caster_level, int* buffdur, int ticsremaining = -1);
	int		AddBuff(Mob *caster, const int16 spell_id, int duration = 0, sint32 level_override = -1);
	virtual bool SpellEffect(Mob* caster, int16 spell_id, float partial = 100);
	virtual bool IsImmuneToSpell(int16 spell_id, Mob *caster);
	virtual void DoBuffTic(int16 spell_id, int32 ticsremaining, int8 caster_level, Mob* caster = 0);
	void	BuffFadeBySpellID(int16 spell_id);
	void	BuffFadeByEffect(int effectid, int skipslot = -1);
	void	BuffFadeAll();
	void	BuffFadeDetrimental();
	void	BuffFadeBySlot(int slot, bool iRecalcBonuses = true);
	void	BuffFadeDetrimentalByCaster(Mob *caster);
	void	BuffModifyDurationBySpellID(int16 spell_id, sint32 newDuration);
	int		CanBuffStack(int16 spellid, int8 caster_level, bool iFailIfOverwrite = false);
	inline	bool	IsCasting() const { return((casting_spell_id != 0)); }
	int16	CastingSpellID() const { return casting_spell_id; }
	virtual float GetAOERange(uint16 spell_id);
	void	TemporaryPets(int16 spell_id, Mob *target, const char *name_override = NULL, uint32 duration_override = 0);
	void	WakeTheDead(int16 spell_id, Mob *target, uint32 duration);
	void	TryDotCritical(int16 spell_id, Mob *caster, int &damage);

	void	SendIllusionPacket(int16 in_race, int8 in_gender = 0xFF, int8 in_texture = 0xFF, int8 in_helmtexture = 0xFF, int8 in_haircolor = 0xFF, int8 in_beardcolor = 0xFF, int8 in_eyecolor1 = 0xFF, int8 in_eyecolor2 = 0xFF, int8 in_hairstyle = 0xFF, int8 in_luclinface = 0xFF, int8 in_beard = 0xFF, int8 in_aa_title = 0xFF, int32 in_drakkin_heritage = 0xFFFFFFFF, int32 in_drakkin_tattoo = 0xFFFFFFFF, int32 in_drakkin_details = 0xFFFFFFFF, float in_size = 0xFFFFFFFF);
	
	static	int32	GetAppearanceValue(EmuAppearance iAppearance);
	void	SendAppearancePacket(int32 type, int32 value, bool WholeZone = true, bool iIgnoreSelf = false, Client *specific_target=NULL);
	void	SetAppearance(EmuAppearance app, bool iIgnoreSelf = true);
	inline EmuAppearance	GetAppearance()	const { return _appearance; }
	inline const int8	GetRunAnimSpeed()	const { return pRunAnimSpeed; }
	inline void			SetRunAnimSpeed(sint8 in)	{ if (pRunAnimSpeed != in) { pRunAnimSpeed = in; pLastChange = Timer::GetCurrentTime(); } }

	Mob*	GetPet();
	void	SetPet(Mob* newpet);
	virtual Mob* GetOwner();
	virtual Mob* GetOwnerOrSelf();
	void	SetPetID(int16 NewPetID);
	inline int16	GetPetID()		const			{ return petid;  }
	inline PetType GetPetType() const { return typeofpet; }
	void SetPetType(PetType p) { typeofpet = p; } 
	bool IsFamiliar() const { return(typeofpet == petFamiliar); }
	bool IsAnimation() const { return(typeofpet == petAnimation); }
	bool IsCharmed() const { return(typeofpet == petCharmed); }
	void SetOwnerID(int16 NewOwnerID);
	inline int16 GetOwnerID()	const			{ return ownerid; }
	inline virtual bool HasOwner() { if(GetOwnerID()==0){return false;} return( entity_list.GetMob(GetOwnerID()) != 0); }
	inline virtual bool IsPet() { return(HasOwner()); }
	inline bool HasPet() const { if(GetPetID()==0){return false;} return (entity_list.GetMob(GetPetID()) != 0);}
	bool HadTempPets() const { return(hasTempPet); }
	void TempPets(bool i) { hasTempPet = i; }

    inline const	bodyType	GetBodyType() const	{ return bodytype; }
//    int16   FindSpell(int16 classp, int16 level, int type, FindSpellType spelltype, float distance, sint32 mana_avail);
//	void	CheckBuffs();
//	bool	CheckSelfBuffs();
//	void	CheckPet();

 	void    SendSpellBarDisable();
 	void    SendSpellBarEnable(int16 spellid);
 	virtual void    Stun(int duration);
	virtual void	UnStun();
	inline void Silence(bool newval) { silenced = newval; }

	bool	invulnerable;
	bool	invisible, invisible_undead, invisible_animals, sneaking, hidden, improved_hidden;
	bool	see_invis, see_invis_undead, see_hide, see_improved_hide;   // Mongrel: See Invis and See Invis vs. Undead
	bool	qglobal;		// SCORPIOUS2K - qglobal flag

	void	Spin();
	void	Kill();

	virtual void SetAttackTimer();
	inline void	SetInvul(bool invul) { invulnerable=invul; }
	inline bool	GetInvul(void) { return invulnerable; }
	inline void	SetExtraHaste(int Haste) { ExtraHaste = Haste; }
	virtual int GetHaste();

	int8	GetWeaponDamageBonus(const Item_Struct* Weapon);
	int16	GetDamageTable(SkillType skillinuse);
	virtual int GetMonkHandToHandDamage(void);

	bool	CanThisClassDoubleAttack(void) const;
	bool	CanThisClassDualWield(void) const;
	bool	CanThisClassRiposte(void) const;
	bool	CanThisClassDodge(void) const;
	bool	CanThisClassParry(void) const;
	bool	CanThisClassBlock(void) const;

	int	GetMonkHandToHandDelay(void);
	int16	GetClassLevelFactor();
	void	Mesmerize();
	inline bool	IsMezzed() const { return mezzed; }
	inline bool	IsStunned() const { return stunned; }
	inline bool	IsSilenced() const { return silenced; }
	inline int16	GetErrorNumber() const {return adverrorinfo;}

	sint32	ReduceDamage(sint32 damage);
	sint32  ReduceMagicalDamage(sint32 damage);

    bool Flurry();
    bool Rampage();
    bool AddRampage(Mob*);
	void ClearRampage();
	void AreaRampage();

    void StartEnrage();
	void ProcessEnrage();
    bool IsEnraged();
	void Taunt(NPC* who, bool always_succeed);

	virtual void		AI_Init();
	virtual void		AI_Start(int32 iMoveDelay = 0);
	virtual void		AI_Stop();
	virtual void		AI_Process();

	const char* GetEntityVariable(int32 id);
	void SetEntityVariable(int32 id, const char *m_var);
	bool EntityVariableExists(int32 id);

#ifdef EQBOTS

	/*Franck-add: EQoffline  */
	void				BOT_Process();
	void				PET_Process();
	void				BotKill();
	void				BotDepop();
	void				BotZoned();
	//void				SpawnBotGroup();
	/*-----------------------*/
	
#endif //EQBOTS

	void				AI_Event_Engaged(Mob* attacker, bool iYellForHelp = true);
	void				AI_Event_NoLongerEngaged();

	FACTION_VALUE		GetSpecialFactionCon(Mob* iOther);
	inline const bool	IsAIControlled() const { return pAIControlled; }
	inline const float GetAggroRange() const { return (spellbonuses.AggroRange == -1) ? pAggroRange : spellbonuses.AggroRange; }
	inline const float GetAssistRange() const { return (spellbonuses.AssistRange == -1) ? pAssistRange : spellbonuses.AssistRange; }


	inline void			SetPetOrder(eStandingPetOrder i) { pStandingPetOrder = i; }
	inline const eStandingPetOrder GetPetOrder() const { return pStandingPetOrder; }
	inline void			SetHeld(bool nState) { held = nState; }
	inline const bool	IsHeld() const { return held; }
	inline const bool	IsRoamer() const { return roamer; }
	inline const bool   IsRooted() const { return rooted || permarooted; }
	int					GetSnaredAmount();

	bool				RemoveFromHateList(Mob* mob);
	void				SetHate(Mob* other, sint32 hate = 0, sint32 damage = 0) {hate_list.Set(other,hate,damage);}
	int32				GetHateAmount(Mob* tmob, bool is_dam = false)  {return hate_list.GetEntHate(tmob,is_dam);}
	int32				GetDamageAmount(Mob* tmob)  {return hate_list.GetEntHate(tmob, true);}
	Mob*				GetHateTop()  {return hate_list.GetTop(this);}
	Mob*				GetHateDamageTop(Mob* other)  {return hate_list.GetDamageTop(other);}
	Mob*				GetHateRandom()  {return hate_list.GetRandom();}
	//this is diff from GetHateTop as it does not account for things like frenzy, just the person with the most hate
	Mob*				GetHateMost()	{return hate_list.GetMostHate();}
	bool				IsEngaged()   {return(!hate_list.IsEmpty()); }
	bool				HateSummon();
	void				FaceTarget(Mob* MobToFace = 0);
	void				SetHeading(float iHeading) { if (heading != iHeading) { pLastChange = Timer::GetCurrentTime(); heading = iHeading; } }
	void				WipeHateList();
	// EverHood 6/14/06
	// Mobs need to be able to remember more than one feigned attacker
	void				AddFeignMemory(Client* attacker);
	void				RemoveFromFeignMemory(Client* attacker);
	void				ClearFeignMemory();
	void				PrintHateListToClient(Client *who) { hate_list.PrintToClient(who); }

	std::list<tHateEntry*> GetHateList() { return hate_list.GetHateList(); }


	int					GetCurWp(){ return cur_wp; }

	//old fear function
	//void SetFeared(Mob *caster, int32 duration, bool flee = false);
	float GetFearSpeed();
	bool IsFeared() { return curfp; } // This returns true if the mob is feared or fleeing due to low HP
	//old fear: inline void StartFleeing() { SetFeared(GetHateTop(), FLEE_RUN_DURATION, true); }
	inline void StartFleeing() { flee_mode = true; CalculateNewFearpoint(); }
	void ProcessFlee();
	void CheckFlee();

	inline bool			CheckAggro(Mob* other) {return hate_list.IsOnHateList(other);}
    float				CalculateHeadingToTarget(float in_x, float in_y);
    bool				CalculateNewPosition(float x, float y, float z, float speed, bool checkZ = false);
	virtual bool		CalculateNewPosition2(float x, float y, float z, float speed, bool checkZ = true);
    float				CalculateDistance(float x, float y, float z);
	float				GetGroundZ(float new_x, float new_y, float z_offset=0.0);
	void				SendTo(float new_x, float new_y, float new_z);
	void				SendToFixZ(float new_x, float new_y, float new_z);
	void				NPCSpecialAttacks(const char* parse, int permtag);
	inline int32		DontHealMeBefore() const { return pDontHealMeBefore; }
	inline int32		DontBuffMeBefore() const { return pDontBuffMeBefore; }
	inline int32		DontDotMeBefore() const { return pDontDotMeBefore; }
	inline int32		DontRootMeBefore() const { return pDontRootMeBefore; }
	inline int32		DontSnareMeBefore() const { return pDontSnareMeBefore; }
	inline int32		DontMezMeBefore() const { return pDontMezMeBefore; }

	void				SetDontRootMeBefore(int32 time) { pDontRootMeBefore = time; }
	void				SetDontHealMeBefore(int32 time) { pDontHealMeBefore = time; }
	void				SetDontBuffMeBefore(int32 time) { pDontBuffMeBefore = time; }
	void				SetDontDotMeBefore(int32 time) { pDontDotMeBefore = time; }
	void				SetDontSnareMeBefore(int32 time) { pDontSnareMeBefore = time; }
	void				SetDontMezMeBefore(int32 time) { pDontMezMeBefore = time; }

	// calculate interruption of spell via movement of mob
	void SaveSpellLoc() {spell_x = x_pos; spell_y = y_pos; spell_z = z_pos; }
	inline float GetSpellX() const {return spell_x;}
	inline float GetSpellY() const {return spell_y;}
	inline float GetSpellZ() const {return spell_z;}
	inline bool	IsGrouped()	 const { return isgrouped; }
	void SetGrouped(bool v) { isgrouped = v; }
	inline bool IsRaidGrouped() const { return israidgrouped; }
	void SetRaidGrouped(bool v) { israidgrouped = v; }

	bool CheckWillAggro(Mob *mob);

	void	InstillDoubt(Mob *who);
	sint16	GetResist(int8 type) const;
	Mob*	GetShieldTarget()			const { return shield_target; }
	void	SetShieldTarget(Mob* mob)	{ shield_target = mob; }
//	Mob*	GetSongTarget()			{ return bardsong_target; }
//	void	SetSongTarget(Mob* mob)	{ bardsong_target = mob; }
	bool	HasActiveSong() const { return(bardsong != 0); }
	bool	Charmed() const { return charmed; }
	static int32	GetLevelHP(int8 tlevel);
	int32	GetZoneID() const;	//for perl
	virtual sint32 CheckAggroAmount(int16 spellid);
	virtual sint32 CheckHealAggroAmount(int16 spellid, int32 heal_possible = 0);
	virtual int32 GetAA(int32 aa_id) const { return(0); }

	int16	GetInstrumentMod(int16 spell_id) const;
	int CalcSpellEffectValue(int16 spell_id, int effect_id, int caster_level = 1, Mob *caster = NULL, int ticsremaining = 0);
	int CalcSpellEffectValue_formula(int formula, int base, int max, int caster_level, int16 spell_id, int ticsremaining = 0);
	virtual int CheckStackConflict(int16 spellid1, int caster_level1, int16 spellid2, int caster_level2, Mob* caster1 = NULL, Mob* caster2 = NULL);
	int32 GetCastedSpellInvSlot() const { return casting_spell_inventory_slot; }

//	inline EGNode *GetEGNode() { return(_egnode); }
//	inline void SetEGNode(EGNode *s) { _egnode = s; }


  // HP Event
   inline int GetNextHPEvent() const { return nexthpevent; }
   void SetNextHPEvent( int hpevent );
	void SendItemAnimation(Mob *to, const Item_Struct *item, SkillType skillInUse);
	inline int& GetNextIncHPEvent() { return nextinchpevent; }
	void SetNextIncHPEvent( int inchpevent );

	bool DivineAura() const;
    bool SpecAttacks[SPECATK_MAXNUM];
	bool HasNPCSpecialAtk(const char* parse);
	Shielders_Struct shielder[MAX_SHIELDERS];
	Trade* trade;

	//temporary:
	bool fix_pathing;
	float rewind_x; //Lieka:  Used for storing /rewind values
	float rewind_y; //Lieka:  Used for storing /rewind values
	float rewind_z; //Lieka:  Used for storing /rewind values
	Timer rewind_timer; //Lieka:  Used for measuring how long a player stays in one spot
	inline float GetCWPX() const { return(cur_wp_x); }
	inline float GetCWPY() const { return(cur_wp_y); }
	inline float GetCWPZ() const { return(cur_wp_z); }
	inline float GetCWPP() const { return(cur_wp_pause); }
	inline int GetCWP() const { return(cur_wp); }
	virtual FACTION_VALUE GetReverseFactionCon(Mob* iOther) { return FACTION_INDIFFERENT; }
	
#ifdef EQBOTS

    //franck-add: EQoffline
	bool AmIaBot;
	bool cast_last_time;
	bool IsBot() const { return AmIaBot; }
	int32 GetBotLeader();
	sint32 GetBotActSpellDamage(int16 spell_id, sint32 value);
	sint32 GetBotActSpellHealing(int16 spell_id, sint32 value);
	void SendBotArcheryWearChange(int8 material_slot, uint32 material, uint32 color);
	void BotMeditate(bool isSitting);
	Mob *BotOwner;
	//Mob *botOwner;
	int BotRaidID;
	void SetBotRaidID( int rId ) { BotRaidID = rId; }
	int GetBotRaidID() { return BotRaidID; }
	Timer check_grouped_timer; //Checks to see if bot is grouped yet
	Timer check_botOwner_timer; //Gives time for client to log in or zone
	Timer battle_rez_timer; //Allows for simulated battle rezzing
	Timer divine_aura_timer; //For Cleric Divine Aura AI
	Timer cheal_hold_timer; //For Cleric CHeal		
	Timer evac_hold_timer; //For Druid Evac	
	Timer check_Moved_timer; //Checks to see if bot is grouped yet
	Timer dont_moveYet_timer; //holds them back some so they don't move evertime you do 

	// fez_ajer: Bot behavior
	bool botAutoMez;
	void SetBotAutoMez( bool autoMez ) { botAutoMez = autoMez; }
	bool GetBotAutoMez() const { return botAutoMez; }
	bool botAutoDefend;
	void SetBotAutoDefend( bool autoDefend ) { botAutoDefend = autoDefend; }
	bool GetBotAutoDefend() const { return botAutoDefend; }

	// fez_ajer: Find a suitable targets for bots
	Mob* BotGetMobToMez(int32 chanter, int32 bard, int32 necro);
	Mob* BotGetDefensiveTarget(Mob *protect);

	// fez_ajer: Shortcut for bot group communication
	void BotSay(const char *format, ...);
	bool GetBotHealer(Client *client, uint32 id);
	void SetBotArchery();
	void SetSpellState(Mob* botMember);
	
#endif //EQBOTS

	inline bool IsTrackable() const { return(trackable); }
	inline bool HasRune() const { return m_hasRune; }
	inline bool HasSpellRune() const { return m_hasSpellRune; }
	inline void SetHasRune(bool hasRune) { m_hasRune = hasRune; }
	inline void SetHasSpellRune(bool hasSpellRune) { m_hasSpellRune = hasSpellRune; }
	inline bool HasDeathSaveChance() const { return m_hasDeathSaveChance; }
	inline void SetDeathSaveChance(bool hasDeathSaveChance) { m_hasDeathSaveChance = hasDeathSaveChance; }
	bool PassCharismaCheck(Mob* caster, Mob* spellTarget, int16 spell_id);
	bool TryDeathSave();
	Timer* GetAIThinkTimer() { return AIthink_timer; }
	Timer* GetAIMovementTimer() { return AImovement_timer; }
	Timer GetAttackTimer() { return attack_timer; }
	Timer GetAttackDWTimer() { return attack_dw_timer; }
	inline bool IsFindable() { return findable; }
	inline uint8 GetManaPercent() { return (uint8)((float)cur_mana / (float)max_mana * 100.0f); }
	virtual uint8 GetEndurancePercent() { return 0; }

protected:
	void CommonDamage(Mob* other, sint32 &damage, const uint16 spell_id, const SkillType attack_skill, bool &avoidable, const sint8 buffslot, const bool iBuffTic);
	static uint16 GetProcID(uint16 spell_id, uint8 effect_index);
	float _GetMovementSpeed(int mod) const;
	virtual bool MakeNewPositionAndSendUpdate(float x, float y, float z, float speed, bool checkZ);

	virtual bool AI_EngagedCastCheck() { return(false); }
	virtual bool AI_PursueCastCheck() { return(false); }
	virtual bool AI_IdleCastCheck() { return(false); }
	
#ifdef EQBOTS

	//franck-add:EQoffline
	virtual bool Bot_AI_IdleCastCheck() { return(false); }
	virtual bool Bot_AI_EngagedCastCheck() { return(false); }
	virtual bool Bot_AI_PursueCastCheck() { return(false); }
	virtual bool Bot_Command_MezzTarget(Mob *target) { return(false); }
	virtual bool Bot_Command_RezzTarget(Mob *target) { return(false); }
	virtual bool Bot_Command_Cure(int curetype, int level) { return(false); }
	virtual bool BotRaidSpell(int16 spellID) { return(false); }
	virtual bool Bot_Command_CalmTarget(Mob *target) { return(false); }
	virtual bool Bot_Command_CharmTarget(int charmtype, Mob *target) { return(false); }
	virtual bool Bot_Command_HealTarget(int diretype, Mob *target) { return(false); }
	virtual bool Bot_Command_DireTarget(int healtype, Mob *target) { return(false); } //Angelox2
	virtual bool Bot_Command_SlowTarget(int slowtype, Mob *target) { return(false); } //Angelox2
	//virtual bool Bot_Command_SpawnGroup() { return(false); } //Angelox2
	virtual bool Bot_Command_Resist(int resisttype, int level) { return(false); } 
#endif //EQBOTS
	
	//used by mlog() for VC6
	#ifdef NO_VARIADIC_MACROS
	void mob_log(LogType type, const char *fmt, ...);
	void mob_hex(LogType type, const char *data, unsigned long length, unsigned char padding=4);
	#endif

	bool	IsFullHP;
	bool	moved;

	std::vector<std::string> RampageArray;
	std::map<int32, std::string> m_EntityVariables;

	bool	isgrouped; //These meant to be private?
	bool	israidgrouped;
	bool	pendinggroup;
	int8	texture;
	int8	helmtexture;

	int	AC;
	sint16	ATK;
	sint16	STR;
	sint16	STA;
	sint16	DEX;
	sint16	AGI;
	sint16	INT;
	sint16	WIS;
	sint16	CHA;
	sint16 MR;
	sint16 CR;
	sint16 FR;
	sint16 DR;
	sint16 PR;
	bool moving;
	int targeted;
	bool findable;
	bool trackable;
	sint32  cur_hp;
	sint32  max_hp;
	sint32	base_hp;
	sint32	cur_mana;
	sint32	max_mana;
	sint16	hp_regen;
	sint16	mana_regen;
	sint32	oocregen; //Out of Combat Regen, % per tick
	float 	slow_mitigation;	//Allows for a slow mitigation based on a % in decimal form.  IE, 1 = 100% mitigation, .5 is 50%
	int8	maxlevel;
	int32	scalerate;
	Buffs_Struct	buffs[BUFF_COUNT];
	StatBonuses		itembonuses;
	StatBonuses		spellbonuses;
	StatBonuses		aabonuses;
	int16			petid;
	int16			ownerid;
	PetType			typeofpet;

	int32			follow;
	int32			follow_dist;

	int8    gender;
	int16	race;
	int8	base_gender;
	int16	base_race;
	int8    class_;
	bodyType    bodytype;
	int16	deity;
	uint8    level;
	int32   npctype_id;
	float	x_pos;
	float	y_pos;
	float	z_pos;
	float	heading;
	uint16	animation;
	float	base_size;
	float	size;
	float	runspeed;
	int32 pLastChange;
	bool held;
	void CalcSpellBonuses(StatBonuses* newbon);
	virtual void CalcBonuses();
	void TryDefensiveProc(Mob *on);
	void TryWeaponProc(const Item_Struct* weapon, Mob *on, int16 hand = 13);
	void TryWeaponProc(const ItemInst* weapon, Mob *on, int16 hand = 13);
	void ExecWeaponProc(uint16 spell_id, Mob *on);
	virtual float GetProcChances(float &ProcBonus, float &ProcChance, uint16 weapon_speed = 30);
	int GetWeaponDamage(Mob *against, const Item_Struct *weapon_item);
	int GetWeaponDamage(Mob *against, const ItemInst *weapon_item, int32 *hate = NULL);
	int GetKickDamage() const;
	int GetBashDamage() const;
public:
	virtual void DoSpecialAttackDamage(Mob *who, SkillType skill, sint32 max_damage, sint32 min_damage = 1, sint32 hate_override = -1);
protected:
	bool HasDied();
	void CalculateNewFearpoint();
	float FindGroundZ(float new_x, float new_y, float z_offset=0.0);
	VERTEX UpdatePath(float ToX, float ToY, float ToZ, float Speed, bool &WaypointChange, bool &NodeReached);
	void PrintRoute();
	void UpdateRuneFlags();

	enum {MAX_PROCS = 4};
	tProc PermaProcs[MAX_PROCS];
	tProc SpellProcs[MAX_PROCS];
	tProc DefensiveProcs[MAX_PROCS];
	tProc RangedProcs[MAX_PROCS];

	char    name[64];
	char		clean_name[64];
	char    lastname[32];

    bool bEnraged;
    Timer *SpecAttackTimers[SPECATK_MAXNUM];

	sint32	delta_heading;
    float	delta_x;
	float	delta_y;
	float	delta_z;
//	uint32	guildeqid; // guild's EQ ID, 0-511, 0xFFFFFFFF = none

	int8    light;

	float	fixedZ;
	EmuAppearance    _appearance;
	int8	pRunAnimSpeed;
	bool	m_is_running;

	Mob*	target;
	Timer	attack_timer;
	Timer	attack_dw_timer;
	Timer	ranged_timer;
	float	attack_speed;		//% increase/decrease in attack speed (not haste)
	Timer	tic_timer;
	Timer	mana_timer;

	//spell casting vars
	Timer spellend_timer;
	int16	casting_spell_id;
    float spell_x, spell_y, spell_z;
	int	attacked_count;
	bool	delaytimer;
	int16 casting_spell_targetid;
	int16 casting_spell_slot;
	int16 casting_spell_mana;
	int32 casting_spell_inventory_slot;
	int16	bardsong;
	int8	bardsong_slot;
//	Mob*	bardsong_target;
	int32	bardsong_target_id;


	int8	haircolor;
	int8	beardcolor;
	int8	eyecolor1; // the eyecolors always seem to be the same, maybe left and right eye?
	int8	eyecolor2;
	int8	hairstyle;
	int8	luclinface; // 
	int8	beard;
	int32	drakkin_heritage;
	int32	drakkin_tattoo;
	int32	drakkin_details;
	int32	armor_tint[MAX_MATERIALS];

	int8	aa_title;

	Mob*	shield_target;

	int ExtraHaste;	// for the #haste command
	bool	mezzed;
	bool	stunned;
	bool	charmed;	//this isnt fully implemented yet
	bool	rooted;
	bool	silenced;
	bool	inWater;	// Set to true or false by Water Detection code if enabled by rules
//	Timer mezzed_timer;
	Timer  stunned_timer;
	Timer	bardsong_timer;
	int16	adverrorinfo;

	// MobAI stuff
	eStandingPetOrder pStandingPetOrder;
	int32	minLastFightingDelayMoving;
	int32	maxLastFightingDelayMoving;
	float	pAggroRange;
	float	pAssistRange;
	Timer*	AIthink_timer;
	Timer*	AImovement_timer;
	Timer*	AItarget_check_timer;
	bool	movetimercompleted;
	bool   permarooted;
	Timer*	AIscanarea_timer;
	Timer*	AIwalking_timer;
	Timer*	AIfeignremember_timer;
	int32	pLastFightingDelayMoving;
	HateList hate_list;
	std::set<int32> feign_memory_list;
	// EverHood - This is to keep track of mobs we cast faction mod spells on
	std::map<uint32,sint32> faction_bonuses; // Primary FactionID, Bonus
	void	AddFactionBonus(uint32 pFactionID,sint32 bonus);
	sint32	GetFactionBonus(uint32 pFactionID);

	void CalculateFearPosition();
	int32 move_tic_count;
	//bool FearTryStraight(Mob *caster, int32 duration, bool flee, VERTEX &hit, VERTEX &fv);
//	VERTEX fear_vector;
	//FearState fear_state;
	//MobFearState *fear_path_state;
	bool flee_mode;
	Timer flee_timer;

	bool	pAIControlled;
	bool	roamer;
	bool	logging_enabled;

	int		wandertype;
	int		pausetype;

	int		cur_wp;
	float		cur_wp_x;
	float		cur_wp_y;
	float		cur_wp_z;
	int		cur_wp_pause;

	int		patrol;
	float fear_walkto_x;
	float fear_walkto_y;
	float fear_walkto_z;
	bool curfp;

	// Pathing
	//
	VERTEX PathingDestination;
	VERTEX PathingLastPosition;
	int PathingLoopCount;
	int PathingLastNodeVisited;
	list<int> Route;
	LOSType PathingLOSState;
	Timer *PathingLOSCheckTimer;
	Timer *PathingRouteUpdateTimerShort;
	Timer *PathingRouteUpdateTimerLong;
	int AggroedAwayFromGrid;
	int PathingTraversedNodes;

	int32	pDontHealMeBefore;
	int32	pDontBuffMeBefore;
	int32	pDontDotMeBefore;
public:
	int32	pDontRootMeBefore;
	int32	pDontSnareMeBefore;
	int32	pDontMezMeBefore;

	// Bind wound
	Timer  bindwound_timer;
	Mob*    bindwound_target;
	// hp event
	int nexthpevent;
	int nextinchpevent;

	//temppet
	bool hasTempPet;

	EGNode *_egnode;	//the EG node we are in

	bool	m_hasRune;
	bool	m_hasSpellRune;
	bool	m_hasDeathSaveChance;
	int	flymode;

private:
	void	_StopSong();		//this is not what you think it is
};

// All data associated with a single trade
class Trade
{
public:
	Trade(Mob* in_owner);
	virtual ~Trade();

	void Reset();
	void SetTradeCash(uint32 in_pp, uint32 in_gp, uint32 in_sp, uint32 in_cp);

	// Initiate a trade with another mob
	// Also puts other mob into trader mode with this mob
	void Start(uint32 mob_id, bool initiate_with=true);

	// Mob the owner is trading with
	Mob* With();

	// Add item from cursor slot to trade bucket (automatically does bag data too)
	void AddEntity(int16 from_slot_id, int16 trade_slot_id);

	// Audit trade
	void LogTrade();

	// Debug only method
	#if (EQDEBUG >= 9)
		void DumpTrade();
	#endif

public:
	// Object state
	TradeState state;
	sint32 pp;
	sint32 gp;
	sint32 sp;
	sint32 cp;

private:
	// Send item data for trade item to other person involved in trade
	void SendItemData(const ItemInst* inst, sint16 dest_slot_id);

	uint32 with_id;
	Mob* owner;
};

#endif
