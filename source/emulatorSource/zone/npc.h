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
#ifndef NPC_H
#define NPC_H

class NPC;
#include "zonedb.h"
#include "mob.h"
//#include "spawn.h"

#include <list>
using namespace std;

#include "spawn2.h"
#include "loottable.h"
#include "zonedump.h"
#include "QGlobals.h"

#ifdef WIN32
	#define  M_PI	3.141592
#endif

typedef struct {
	float min_x;
	float max_x;
	float min_y;
	float max_y;
	float min_z;
	float max_z;
	bool say;
} NPCProximity;

struct AISpells_Struct {
	int16	type;			// 0 = never, must be one (and only one) of the defined values
	uint16	spellid;		// <= 0 = no spell
	sint16	manacost;		// -1 = use spdat, -2 = no cast time
	int32	time_cancast;	// when we can cast this spell next
	sint32	recast_delay;
	sint16	priority;
};

class NPC : public Mob
{
public:
	static NPC* SpawnNPC(const char* spawncommand, float in_x, float in_y, float in_z, float in_heading = 0, Client* client = 0);
	static sint8 GetAILevel(bool iForceReRead = false);
	
	NPC(const NPCType* data, Spawn2* respawn, float x, float y, float z, float heading, int iflymode, bool IsCorpse = false);
	
	virtual ~NPC();

	//abstract virtual function implementations requird by base abstract class
	virtual void Death(Mob* killerMob, sint32 damage, int16 spell_id, SkillType attack_skill);
	virtual void Damage(Mob* from, sint32 damage, int16 spell_id, SkillType attack_skill, bool avoidable = true, sint8 buffslot = -1, bool iBuffTic = false);
	virtual bool Attack(Mob* other, int Hand = 13, bool FromRiposte = false);
	virtual bool HasRaid() { return false; }
	virtual bool HasGroup() { return false; }
	virtual Raid* GetRaid() { return 0; }
	virtual Group* GetGroup() { return 0; }

	virtual bool IsNPC() const { return true; }

	virtual bool Process();
	virtual void	AI_Init();
	virtual void	AI_Start(int32 iMoveDelay = 0);
	virtual void	AI_Stop();
	void			AI_DoMovement();
	bool			AI_AddNPCSpells(int32 iDBSpellsID);
	virtual bool	AI_EngagedCastCheck();
	bool			AI_HasSpells() { return HasAISpell; }

#ifdef EQBOTS
	//franck-adds: EQoffline
	virtual bool	Bot_AI_EngagedCastCheck();
	virtual bool	Bot_AI_IdleCastCheck();
	virtual bool	Bot_Command_MezzTarget(Mob *target, int32 chanter, int32 bard, int32 necro);
	virtual bool	Bot_Command_RezzTarget(Mob *target);
	virtual bool	BotRaidSpell(int16 spellID);
	virtual bool	Bot_Command_Cure(int curetype, int level);
	virtual bool	Bot_AI_PursueCastCheck();
	virtual bool	Bot_Command_CalmTarget(Mob *target);
	virtual bool	Bot_Command_CharmTarget(int charmtype,Mob *target);
	virtual bool	Bot_Command_DireTarget(int diretype, Mob *target);
	virtual bool 	Bot_Command_HealTarget(int healtype, Mob *target); //Angelox2
	virtual bool 	Bot_Command_SlowTarget(int slowtype, Mob *target); //Angelox2
	//virtual bool	Bot_Command_SpawnGroup(); //Angelox2
	virtual bool	Bot_Command_Resist(int resisttype, int level);
	Inventory m_inv;
	inline Inventory& GetBotInv()				{ return m_inv; }
	inline const Inventory& GetBotInv() const	{ return m_inv; }
#endif //EQBOTS

	virtual bool	AI_PursueCastCheck();
	virtual bool	AI_IdleCastCheck();
	virtual void	AI_Event_SpellCastFinished(bool iCastSucceeded, int8 slot);
	
	void LevelScale();
	void CalcNPCResists();
	void CalcNPCRegen();
	void CalcNPCDamage();
	
	virtual void SetTarget(Mob* mob);
	virtual uint16 GetSkill(SkillType skill_num) const { if (skill_num <= HIGHEST_SKILL) { return skills[skill_num]; } return 0; }
/*  virtual void SetSkill(int in_skill_num, int8 in_skill_value) { // socket 12-29-01
        if (in_skill_num <= HIGHEST_SKILL) { skills[in_skill_num + 1] = in_skill_value; } }*/

	void CalcItemBonuses(StatBonuses *newbon);
	virtual void CalcBonuses();

	
	// neotokyo: added frenzy
	//bool	Attack(Mob* other, int Hand = 13, bool = false);
	virtual void	RangedAttack(Mob* other);
	virtual void	ThrowingAttack(Mob* other) { }

#ifdef EQBOTS
	// EQoffline: special BotAttack function
	bool	BotAttackMelee(Mob* other, int Hand = 13, bool = false);
	bool	BotRangedAttack(Mob* other);
	void	BotRemoveEquipItem(int slot) { equipment[slot] = 0; }
	void	BotAddEquipItem(int slot, uint32 id) { equipment[slot] = id; }
	bool	CheckLoreConflict(const Item_Struct* item);

#endif //EQBOTS

	//void	Damage(Mob* other, sint32 damage, int16 spell_id, SkillType attack_skill, bool avoidable = true, sint8 buffslot = -1, bool iBuffTic = false);
	//void	Death(Mob* other, sint32 damage, int16 spell_id, SkillType attack_skill);
	bool	DatabaseCastAccepted(int spell_id);
	bool	IsFactionListAlly(uint32 other_faction);
	FACTION_VALUE CheckNPCFactionAlly(sint32 other_faction);
	virtual FACTION_VALUE GetReverseFactionCon(Mob* iOther);

	void	GoToBind(uint8 bindnum = 0)	{ GMMove(org_x, org_y, org_z, org_heading); }
	void	Gate();

	void	GetPetState(SpellBuff_Struct *buffs, int32 *items, char *name);
	void	SetPetState(SpellBuff_Struct *buffs, int32 *items);
	void	InteractiveChat(int8 chan_num, int8 language, const char * message, const char* targetname,Mob* sender);
	void	TakenAction(int8 action,Mob* actiontaker);
	virtual void SpellProcess();
	virtual void FillSpawnStruct(NewSpawn_Struct* ns, Mob* ForWho);

	void	AddItem(const Item_Struct* item, int8 charges, int8 slot = 0);
	void	AddItem(int32 itemid, int8 charges, int8 slot = 0);
	void	AddLootTable();
/*
	void	NPCSpecialAttacks(const char* parse, int permtag);
	void	NPCDatabaseSpells(const char* parse);
	void	NPCUnharmSpell(int spell_id);
	void	CheckFriendlySpellStatus();

	void	CheckEnemySpellStatus();
	void	NPCHarmSpell(int target,int type);
	void    HateSummon();
*/	

#ifdef EQBOTS

	uint32	GetItemID(int slot_id);

#endif //EQBOTS

	void	DescribeAggro(Client *towho, Mob *mob, bool verbose);
	void    RemoveItem(uint32 item_id, int16 quantity = 0, int16 slot = 0);
//	bool	AddNPCSpells(int32 iDBSpellsID, AISpells_Struct* AIspells);
	void	ClearItemList();
	ServerLootItem_Struct*	GetItem(int slot_id);
	void	AddCash(int16 in_copper, int16 in_silver, int16 in_gold, int16 in_platinum);
	void	AddCash();
	void	RemoveCash();
	void	QueryLoot(Client* to);
	int32	CountLoot();
	void	DumpLoot(int32 npcdump_index, ZSDump_NPC_Loot* npclootdump, int32* NPCLootindex);
	inline int32	GetLoottableID()	const { return loottable_id; }
//	void	SetPetType(int16 in_type)	{ typeofpet = in_type; } // put this here because only NPCs can be anything but charmed pets

	inline uint32	GetCopper()		const { return copper; }
	inline uint32	GetSilver()		const { return silver; }
	inline uint32	GetGold()		const { return gold; }
	inline uint32	GetPlatinum()	const { return platinum; }

	inline void	SetCopper(uint32 amt)		{ copper = amt; }
	inline void	SetSilver(uint32 amt)		{ silver = amt; }
	inline void	SetGold(uint32 amt)			{ gold = amt; }
	inline void	SetPlatinum(uint32 amt)		{ platinum = amt; }



	void SetGrid(int32 grid_){ grid=grid_; }
	void SetSp2(int32 sg2){ spawn_group=sg2; }
	void SetWaypointMax(int16 wp_){ wp_m=wp_; }

	int16 GetWaypointMax() const { return wp_m; }
	int32 GetGrid() const { return grid; }
	int32 GetSp2() const { return spawn_group; }
	int32 GetSpawnPointID() const;

	int8 GetPrimSkill()	const { return prim_melee_type; }
	int8 GetSecSkill()	const { return sec_melee_type; }
	void SetPrimSkill(int8 skill_type)	{ prim_melee_type = skill_type; }
	void SetSecSkill(int8 skill_type)	{ sec_melee_type = skill_type; }

	uint32	adventure_template_id;
	uint32	MerchantType;
	void	Depop(bool StartSpawnTimer = true);
	void	Stun(int duration);
	void	UnStun();
	
	inline void SignalNPC(int _signal_id) { signaled = true; signal_id = _signal_id; }
	
	inline sint32	GetNPCFactionID()	const { return npc_faction_id; }
	inline sint32			GetPrimaryFaction()	const { return primary_faction; }
	sint32	GetNPCHate(Mob* in_ent)  {return hate_list.GetEntHate(in_ent);}
    bool    IsOnHatelist(Mob*p) { return hate_list.IsOnHateList(p);}

	void	SetNPCFactionID(sint32 in) { npc_faction_id = in; database.GetFactionIdsForNPC(npc_faction_id, &faction_list, &primary_faction); }

	float   org_x, org_y, org_z, org_heading;
	
	int16	GetMaxDMG() const {return max_dmg;}
	bool	IsAnimal() const { return(bodytype == BT_Animal); }
	int16   GetPetSpellID() const {return pet_spell_id;}
	void    SetPetSpellID(int16 amt) {pet_spell_id = amt;}
	int32	GetMaxDamage(int8 tlevel);
	void    SetTaunting(bool tog) {taunting = tog;}
	void	PickPocket(Client* thief);
	void	StartSwarmTimer(int32 duration) { swarm_timer.Start(duration); }
	void	AddLootDrop(const Item_Struct*dbitem, ItemList* itemlistconst, sint8 charges, bool equipit, bool wearchange = false);
	virtual void DoClassAttacks(Mob *target);
	void	CheckSignal();
	
	//waypoint crap
	int		GetMaxWp() const { return max_wp; }
	void				DisplayWaypointInfo(Client *to);
	void				CalculateNewWaypoint();
//	int8				CalculateHeadingToNextWaypoint();
//	float				CalculateDistanceToNextWaypoint();
	void				AssignWaypoints(int32 grid);
	void				SetWaypointPause();
	void				UpdateWaypoint(int wp_index);
	// quest wandering commands
	void				StopWandering();
	void				ResumeWandering();
	void				PauseWandering(int pausetime);
	void				MoveTo(float mtx, float mty, float mtz, float mth, bool saveguardspot);
	
	int32				GetEquipment(int8 material_slot) const;	// returns item id
	sint32				GetEquipmentMaterial(int8 material_slot) const;
	
	void				NextGuardPosition();
	void				SaveGuardSpot(bool iClearGuardSpot = false);
	inline bool			IsGuarding() const { return(guard_heading != 0); }
/*	void				SaveSpawnSpot();
	inline const float	GetSpawnX() const { return spawn_x; }
	inline const float	GetSpawnY() const { return spawn_y; }
	inline const float	GetSpawnZ() const { return spawn_z; }
	inline const float	GetSpawnHeading() const { return spawn_heading; }
	*/
	void				AI_SetRoambox(float iDist, float iRoamDist, int32 iDelay = 2500);
	void				AI_SetRoambox(float iDist, float iMaxX, float iMinX, float iMaxY, float iMinY, int32 iDelay = 2500);
	
	
	inline bool WillAggroNPCs() const { return(npc_aggro); }
	
	inline void GiveNPCTypeData(NPCType *ours) { NPCTypedata_ours = ours; }
	inline const int32 GetNPCSpellsID()	const { return npc_spells_id; }
	
	ItemList	itemlist; //kathgar - why is this public?  Doing other things or I would check the code
	
	NPCProximity* proximity;

	Spawn2*	respawn2;
	QGlobalCache *GetQGlobals() { return qGlobals; }
	QGlobalCache *CreateQGlobals() { qGlobals = new QGlobalCache(); return qGlobals; }

	AA_SwarmPetInfo *GetSwarmInfo() { return (swarmInfoPtr); }
	void SetSwarmInfo(AA_SwarmPetInfo *mSwarmInfo) { swarmInfoPtr = mSwarmInfo; }

	sint32	GetAccuracyRating() { return (accuracy_rating); }
	void	SetAccuracyRating(sint32 d) { accuracy_rating = d;}

	void	ModifyNPCStat(const char *identifier, const char *newValue);
	virtual void SetLevel(uint8 in_level, bool command = false);

	bool IsLDoNTrapped() { return (ldon_trapped); }
	void SetLDoNTrapped(bool n) { ldon_trapped = n; }

	int8 GetLDoNTrapType() { return (ldon_trap_type); }
	void SetLDoNTrapType(int8 n) { ldon_trap_type = n; }

	int16 GetLDoNTrapSpellID() { return (ldon_spell_id); }
	void SetLDoNTrapSpellID(int16 n) { ldon_spell_id = n; }

	bool IsLDoNLocked() { return (ldon_locked); }
	void SetLDoNLocked(bool n) { ldon_locked = n; }

	int16 GetLDoNLockedSkill() { return (ldon_locked_skill); }
	void SetLDoNLockedSkill(int16 n) { ldon_locked_skill = n; }

	bool IsLDoNTrapDetected() { return (ldon_trap_detected); }
	void SetLDoNTrapDetected(bool n) { ldon_trap_detected = n; }

	const bool GetCombatEvent() const { return combat_event; }
	void SetCombatEvent(bool b) { combat_event = b; }

	//The corpse we make can only be looted by people who got credit for the kill
	const bool HasPrivateCorpse() const { return NPCTypedata->private_corpse; }
	const char* GetRawNPCTypeName() const { return NPCTypedata->name; }

	bool GetDepop() { return p_depop; }

	// Kings & Bandits - npc melee texture fix on attack anim
	int16 GetMeleeTexture1() { return d_meele_texture1; }
	int16 GetMeleeTexture2() { return d_meele_texture2; }

protected:
	
	const NPCType*	NPCTypedata;
	NPCType*	NPCTypedata_ours;	//special case for npcs with uniquely created data.

	friend class EntityList;
	list<struct NPCFaction*> faction_list;
	uint32	copper;
	uint32	silver;
	uint32	gold;
	uint32	platinum;
	int32   grid;
	int32   spawn_group;
	int16	wp_m;

	sint32	npc_faction_id;
	sint32	primary_faction;
	
	Timer	attacked_timer;		//running while we are being attacked (damaged)
    Timer	swarm_timer;
    Timer	classattack_timer;
	Timer	knightattack_timer;
    Timer	assist_timer;		//ask for help from nearby mobs
	Timer	qglobal_purge_timer;

	bool	combat_event;	//true if we are in combat, false otherwise
    Timer	sendhpupdate_timer;
	Timer	enraged_timer;

	int32	npc_spells_id;
	int8	casting_spell_AIindex;
	Timer*	AIautocastspell_timer;
	int32*	pDontCastBefore_casting_spell;
	std::vector<AISpells_Struct> AIspells;
	bool HasAISpell;
	void AddSpellToNPCList(sint16 iPriority, sint16 iSpellID, uint16 iType, sint16 iManaCost, sint32 iRecastDelay);
	bool AICastSpell(Mob* tar, int8 iChance, int16 iSpellTypes);

#ifdef EQBOTS
	//franck-add: EQoffline
public:
	int   BotSpellCount() { return AIspells.size(); }
	int16 BotGetSpells(int spellslot) { return AIspells[spellslot].spellid; }
    int16 BotGetSpellType(int spellslot) { return AIspells[spellslot].type; }
    int16 BotGetSpellPriority(int spellslot) { return AIspells[spellslot].priority; }
protected:
	bool Bot_AICastSpell(Mob* tar, int8 iChance, int16 iSpellTypes);
#endif //EQBOTS

	bool AIDoSpellCast(int8 i, Mob* tar, sint32 mana_cost, int32* oDontDoAgainBefore = 0);
	
	
	int32	max_dmg;
	int32	min_dmg;
	sint32	accuracy_rating;
	
	//pet crap:
	int16	pet_spell_id;
	bool	taunting;
    Timer	taunt_timer;		//for pet taunting
	
	bool npc_aggro;
	
	int		signal_id;
	bool	signaled;	// used by quest signal() command
	
	//waypoint crap:
	vector<wplist> Waypoints;
	void _ClearWaypints();
	int		max_wp;
	int		save_wp;
    float guard_x, guard_y, guard_z, guard_heading;
	float roambox_max_x;
	float roambox_max_y;
	float roambox_min_x;
	float roambox_min_y;
	float roambox_distance;
	float roambox_movingto_x;
	float roambox_movingto_y;
	int32 roambox_delay;
	
	int16   skills[HIGHEST_SKILL+1];
	int32   equipment[MAX_MATERIALS];	//this is an array of item IDs
	int16	d_meele_texture1;			//this is an item Material value
	int16	d_meele_texture2;			//this is an item Material value (offhand)
	int8	prim_melee_type;			//Sets the Primary Weapon attack message and animation
	int8	sec_melee_type;				//Sets the Secondary Weapon attack message and animation

	AA_SwarmPetInfo *swarmInfoPtr;
	
	bool ldon_trapped;
	int8 ldon_trap_type;
	int16 ldon_spell_id;
	bool ldon_locked;
	int16 ldon_locked_skill;
	bool ldon_trap_detected;
	QGlobalCache *qGlobals;

private:
	int32	loottable_id;
	bool	p_depop;
};

#endif

