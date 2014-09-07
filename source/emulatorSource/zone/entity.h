/*  EQEMu:  Everquest Server Emulator
	Copyright (C) 2001-2003  EQEMu Development Team (http://eqemulator.net)

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
#ifndef ENTITY_H
#define ENTITY_H

#include "../common/types.h"
#include "../common/linked_list.h"
#include "zonedb.h"
#include "../common/eq_constants.h"
#include "zonedump.h"
#include "zonedbasync.h"
#include "../common/servertalk.h"
#include "../common/bodytypes.h"
#include "QGlobals.h"

// max number of newspawns to send per bulk packet
#define SPAWNS_PER_POINT_DATARATE 10
#define MAX_SPAWNS_PER_PACKET	100

//#ifdef WIN32
	class	EQApplicationPacket;
//#else
//	struct	EQApplicationPacket;
//#endif

class Client;
class Mob;
class NPC;
class Corpse;
class Beacon;
class Petition;
class Object;
class Group;
class Raid;
class Doors;
class Trap;
class Entity;
class EntityList;

#ifdef EQBOTS
//EQoffline
class BotRaids;
#endif //EQBOTS

#ifdef BOTS
class Bot;
class BotRaids;
#endif

extern EntityList entity_list;

void ProcessClientThreadSpawn(void *tmp);

class Entity
{
public:
	Entity();
	virtual ~Entity();

	virtual bool IsClient()			const { return false; }
	virtual bool IsNPC()			const { return false; }
	virtual bool IsMob()			const { return false; }
	virtual bool IsCorpse()			const { return false; }
	virtual bool IsPlayerCorpse()	const { return false; }
	virtual bool IsNPCCorpse()		const { return false; }
	virtual bool IsObject()			const { return false; }
//	virtual bool IsGroup()			const { return false; }
	virtual bool IsDoor()			const { return false; }
	virtual bool IsTrap()			const { return false; }
	virtual bool IsBeacon()			const { return false; }

	virtual bool Process()  { return false; }
	virtual bool Save() { return true; }
	virtual void Depop(bool StartSpawnTimer = true) {}

	Client* CastToClient();
	NPC*    CastToNPC();
	Mob*    CastToMob();
	Corpse*	CastToCorpse();
	Object* CastToObject();
	Doors*	CastToDoors();
	Trap*	CastToTrap();
	Beacon*	CastToBeacon();
	
	const Client* CastToClient() const;
	const NPC*    CastToNPC() const;
	const Mob*    CastToMob() const;
	const Corpse*	CastToCorpse() const;
	const Object* CastToObject() const;
//	const Group*	CastToGroup() const;
	const Doors*	CastToDoors() const;
	const Trap*	CastToTrap() const;
	const Beacon*	CastToBeacon() const;

	inline const int16& GetID()	{ return id; }
	virtual const char* GetName() { return ""; }
	virtual void DBAWComplete(int8 workpt_b1, DBAsyncWork* dbaw) { pDBAsyncWorkID = 0; }
	bool CheckCoordLosNoZLeaps(float cur_x, float cur_y, float cur_z, float trg_x, float trg_y, float trg_z, float perwalk=1);

#ifdef BOTS
	virtual bool IsBot() const { return false; }
	Bot* CastToBot();
#endif

protected:
	friend class EntityList;
	virtual void SetID(int16 set_id);
	int32 pDBAsyncWorkID;
private:
	int16 id;
};

class EntityList
{
public:
	EntityList();
	~EntityList();
	
	Entity* GetID(int16 id);
	Mob*	GetMob(int16 id);
	inline Mob*	GetMobID(int16 id) { return(GetMob(id)); }	//for perl
	Mob*	GetMob(const char* name);
	NPC*	GetNPCByID(int16 id);
	Mob*	GetMobByNpcTypeID(int32 get_id);
	Client* GetClientByName(const char *name); 
	Client* GetClientByAccID(int32 accid);
	Client* GetClientByID(int16 id);
	Client* GetClientByCharID(int32 iCharID);
	Client* GetClientByWID(int32 iWID);
	Client* GetClient(int32 ip, int16 port);
	Client* GetRandomClient(float x, float y, float z, float Distance, Client *ExcludeClient = NULL);
	Group*	GetGroupByMob(Mob* mob);
	Group*	GetGroupByClient(Client* client);
	Group*  GetGroupByID(int32 id);
	Group*  GetGroupByLeaderName(char* leader);
	Raid*	GetRaidByMob(Mob* mob);
	Raid*	GetRaidByClient(Client* client);
	Raid*	GetRaidByID(int32 id);
	Raid*	GetRaidByLeaderName(const char *leader);

#ifdef EQBOTS

	// EQoffline
	BotRaids* GetBotRaidByMob(Mob *mr);
	void	RezBotMember(std::list<int32>::iterator iter, int group_id, int group_member_id, BotRaids *br, Group *g, Client *c);
	bool	RemoveBotRaid(int16 delete_id);
	void    AddBotRaid(BotRaids *br);
	void    AddBotRaid(BotRaids *br, int16 id);

#endif //EQBOTS

	Corpse*	GetCorpseByOwner(Client* client);
	Corpse* GetCorpseByID(int16 id);
	Corpse* GetCorpseByDBID(int32 dbid);
	Corpse* GetCorpseByName(char* name);
	void RemoveAllCorpsesByCharID(int32 charid);
	int RezzAllCorpsesByCharID(int32 charid);
	bool IsMobInZone(Mob *who);
	void ClearClientPetitionQueue();
    bool CanAddHateForMob(Mob *p);
    void	SendGuildMOTD(uint32 guild_id);
    void	SendGuildSpawnAppearance(uint32 guild_id);
    void	SendGuildMembers(uint32 guild_id);
    void	RefreshAllGuildInfo(uint32 guild_id);
    void	SendGuildList();
//	void	SendGuildJoin(GuildJoin_Struct* gj);
	// Check group list for NULL entries
	void	CheckGroupList (const char *fname, const int fline);
	void	GroupProcess();
	void	RaidProcess();
	void	DoorProcess();
	void	ObjectProcess();
	void	CorpseProcess();
	void	MobProcess();
	void	TrapProcess();
	void	BeaconProcess();
	void	ProcessMove(Client *c, float x, float y, float z);
	void	ProcessProximitySay(const char *Message, Client *c, int8 language = 0);
	void	SendAATimer(int32 charid,UseAA_Struct* uaa);
	Doors*	FindDoor(int8 door_id);
	Object*	FindObject(int32 object_id);
	Object*	FindNearbyObject(float x, float y, float z, float radius);
	bool	MakeDoorSpawnPacket(EQApplicationPacket* app);
	bool    MakeTrackPacket(Client* client);
	void	SendTraders(Client* client);	
	void    AddClient(Client*);
	void    AddNPC(NPC*, bool SendSpawnPacket = true, bool dontqueue = false);
	void	AddCorpse(Corpse* pc, int32 in_id = 0xFFFFFFFF);
	void    AddObject(Object*, bool SendSpawnPacket = true);
	void    AddGroup(Group*);
	void    AddGroup(Group*, int32 id);
	void	AddRaid(Raid *raid);
	void    AddRaid(Raid*, int32 id);
	void	AddDoor(Doors* door);
	void	AddTrap(Trap* trap);
	void	AddBeacon(Beacon *beacon);
	void	AddProximity(NPC *proximity_for);
	void	Clear();
	bool	RemoveMob(int16 delete_id);
	bool	RemoveMob(Mob* delete_mob);
	bool	RemoveClient(int16 delete_id);
	bool	RemoveClient(Client* delete_client);
	bool	RemoveNPC(int16 delete_id);
	bool	RemoveGroup(int32 delete_id);
	bool	RemoveRaid(int32 delete_id);
	bool	RemoveCorpse(int16 delete_id);
	bool	RemoveDoor(int16 delete_id);
	bool	RemoveTrap(int16 delete_id);
	bool	RemoveObject(int16 delete_id);
	bool	RemoveProximity(int16 delete_npc_id);
	void	RemoveAllMobs();
	void	RemoveAllClients();
	void	RemoveAllNPCs();
	void	RemoveAllGroups();
	void	RemoveAllCorpses();
	void	RemoveAllDoors();
	void	RemoveAllTraps();
	void	RemoveAllObjects();
	void	RemoveAllLocalities();
	void	RemoveAllRaids();
	void	DestroyTempPets(Mob *owner);
	Entity*	GetEntityMob(int16 id);
	Entity* GetEntityMob(const char *name);
	Entity*	GetEntityDoor(int16 id);
	Entity*	GetEntityObject(int16 id);
	Entity*	GetEntityCorpse(int16 id);
	Entity* GetEntityCorpse(const char *name);
//	Entity*	GetEntityGroup(int32 id);
	Entity*	GetEntityTrap(int16 id);
	Entity*	GetEntityBeacon(int16 id);
	
	void DescribeAggro(Client *towho, NPC *from_who, float dist, bool verbose);

	// Edgar's function to strip off trailing zeroes. 
// solar: no longer used
//	void   NPCMessage(Mob* sender, bool skipsender, float dist, int32 type, const char* message, ...); 

	void	Message(int32 to_guilddbid, int32 type, const char* message, ...);
	void	MessageStatus(int32 to_guilddbid, int to_minstatus, int32 type, const char* message, ...);
	void	MessageClose(Mob* sender, bool skipsender, float dist, int32 type, const char* message, ...);
	void	Message_StringID(Mob *sender, bool skipsender, int32 type, int32 string_id, const char* message1=0,const char* message2=0,const char* message3=0,const char* message4=0,const char* message5=0,const char* message6=0,const char* message7=0,const char* message8=0,const char* message9=0);
	void	MessageClose_StringID(Mob *sender, bool skipsender, float dist, int32 type, int32 string_id, const char* message1=0,const char* message2=0,const char* message3=0,const char* message4=0,const char* message5=0,const char* message6=0,const char* message7=0,const char* message8=0,const char* message9=0);
	void	ChannelMessageFromWorld(const char* from, const char* to, int8 chan_num, int32 guilddbid, int8 language, const char* message);
	void    ChannelMessage(Mob* from, int8 chan_num, int8 language, const char* message, ...);
	void    ChannelMessage(Mob* from, int8 chan_num, int8 language, int8 lang_skill, const char* message, ...);
	void	ChannelMessageSend(Mob* to, int8 chan_num, int8 language, const char* message, ...);
	void    SendZoneSpawns(Client*);
	void	SendZonePVPUpdates(Client *);
	void	SendZoneSpawnsBulk(Client* client);
	void    Save();
	void    SendZoneCorpses(Client*);
	void    SendZoneCorpsesBulk(Client*);
	void    SendZoneObjects(Client* client);
	void	SendZoneAppearance(Client *c);
	void	DuelMessage(Mob* winner, Mob* loser, bool flee);
	void    QuestJournalledSayClose(Mob *sender, Client *QuestIntiator, float dist, const char* mobname, const char* message);
	void	GroupMessage(int32 gid, const char *from, const char *message);


	void    RemoveFromTargets(Mob* mob);
	void    ReplaceWithTarget(Mob* pOldMob, Mob*pNewTarget);
	void	QueueCloseClients(Mob* sender, const EQApplicationPacket* app, bool ignore_sender=false, float dist=200, Mob* SkipThisMob = 0, bool ackreq = true,eqFilterType filter=FilterNone);
	void    QueueClients(Mob* sender, const EQApplicationPacket* app, bool ignore_sender=false, bool ackreq = true);
	void	QueueClientsStatus(Mob* sender, const EQApplicationPacket* app, bool ignore_sender = false, int8 minstatus = 0, int8 maxstatus = 0);
	void	QueueClientsGuild(Mob* sender, const EQApplicationPacket* app, bool ignore_sender = false, int32 guildeqid = 0);
	void	QueueClientsGuildBankItemUpdate(const GuildBankItemUpdate_Struct *gbius, uint32 GuildID);
	void	QueueClientsByTarget(Mob* sender, const EQApplicationPacket* app, bool iSendToSender = true, Mob* SkipThisMob = 0, bool ackreq = true,
				     bool HoTT = true, uint32 ClientVersionBits = 0xFFFFFFFF);

	void	QueueToGroupsForNPCHealthAA(Mob* sender, const EQApplicationPacket* app);
	void    QueueManaged(Mob* sender, const EQApplicationPacket* app, bool ignore_sender=false, bool ackreq = true);

	void	AEAttack(Mob *attacker, float dist, int Hand = 13, int count = 0);
	void	AETaunt(Client *caster, float range = 0);
	void	AESpell(Mob *caster, Mob *center, int16 spell_id, bool affect_caster = true);
	void	AEBardPulse(Mob *caster, Mob *center, int16 spell_id, bool affect_caster = true);
	
	void 	RadialSetLogging(Mob *around, bool enabled, bool clients, bool non_clients, float range = 0);

	//trap stuff
	Mob*	GetTrapTrigger(Trap* trap);
	void	SendAlarm(Trap* trap, Mob* currenttarget, int8 kos);
	Trap*	FindNearbyTrap(Mob* searcher, float max_dist);
	
	void	AddHealAggro(Mob* target, Mob* caster, int16 thedam);
	Mob*	FindDefenseNPC(int32 npcid);
	void	OpenDoorsNear(NPC* opener);

	void	UpdateWho(bool iSendFullUpdate = false);
	void	SendPositionUpdates(Client* client, int32 cLastUpdate = 0, float range = 0, Entity* alwayssend = 0, bool iSendEvenIfNotChanged = false);
	char*	MakeNameUnique(char* name);
	static char*	RemoveNumbers(char* name);
	void	SignalMobsByNPCID(int32 npc_type, int signal_id);
	void	CountNPC(int32* NPCCount, int32* NPCLootCount, int32* gmspawntype_count);
	void	DoZoneDump(ZSDump_Spawn2* spawn2dump, ZSDump_NPC* npcdump, ZSDump_NPC_Loot* npclootdump, NPCType* gmspawntype_dump);
	void    RemoveEntity(int16 id);
	void	SendPetitionToAdmins(Petition* pet);
	void	SendPetitionToAdmins();

	void	ListNPCs(Client* client, const char* arg1 = 0, const char* arg2 = 0, int8 searchtype = 0);
	void	ListNPCCorpses(Client* client);
	void	ListPlayerCorpses(Client* client);
	void	FindPathsToAllNPCs();
	sint32	DeleteNPCCorpses();
	sint32	DeletePlayerCorpses();
	void	WriteEntityIDs();
	void	HalveAggro(Mob* who);
	void	DoubleAggro(Mob* who);
	void	Evade(Mob *who);
	void	UpdateHoTT(Mob* target);

    void    Process();
	void	ClearAggro(Mob* targ);
	void	ClearFeignAggro(Mob* targ);
	// Everhood 6/17/06
	void	ClearZoneFeignAggro(Client* targ);
	void	AggroZone(Mob* who, int hate = 0);
	
	bool	Fighting(Mob* targ);
	void    RemoveFromHateLists(Mob* mob, bool settoone = false);
	void	RemoveDebuffs(Mob* caster);


	void	MessageGroup(Mob* sender, bool skipclose, int32 type, const char* message, ...);
	//void	MessageRaid(Mob* sender, bool skipclose, int32 type, const char* message, ...);
	
	void	LimitAddNPC(NPC *npc);
	void	LimitRemoveNPC(NPC *npc);
	bool	LimitCheckType(int32 npc_type, int count);
	bool	LimitCheckGroup(int32 spawngroup_id, int count);
	bool	LimitCheckBoth(int32 npc_type, int32 spawngroup_id, int group_count, int type_count);
	bool	LimitCheckName(const char* npc_name);

	void	CheckClientAggro(Client *around);
	Mob*	AICheckCloseAggro(Mob* sender, float iAggroRange, float iAssistRange);
	int	GetHatedCount(Mob *attacker, Mob *exclude);
	void	AIYellForHelp(Mob* sender, Mob* attacker);
	bool	AICheckCloseBeneficialSpells(NPC* caster, int8 iChance, float iRange, int16 iSpellTypes);
	Mob*	GetTargetForMez(Mob* caster);
	int32	CheckNPCsClose(Mob *center);

	Corpse* GetClosestCorpse(Mob* sender, const char *Name);
	NPC* GetClosestBanker(Mob* sender, uint32 &distance);
	Mob*	GetClosestMobByBodyType(Mob* sender, bodyType BodyType);
	void	ForceGroupUpdate(int32 gid);
	void	SendGroupLeave(int32 gid, const char *name);
	void	SendGroupJoin(int32 gid, const char *name);

	void    SaveAllClientsTaskState();
	void    ReloadAllClientsTaskState(int TaskID=0);

	void	CreateGroundObject(int32 itemid, float x, float y, float z, float heading, int32 decay_time = 300000);
	void	ZoneWho(Client *c, Who_All_Struct* Who);
	void	UnMarkNPC(int16 ID);

	void	GateAllClients();
	void	SendAdventureUpdate(int32 a_id);
	void	AdventureMessage(int32 a_id, const char *msg);
	void	AdventureFinish(int32 a_id, int8 win_lose, int32 points, bool update_stats);
	void	AdventureDestroy(int32 a_id);
	void	AdventureCountUpdate(int32 a_id, int32 current, int32 total);
	void	SignalAllClients(int32 data);
	void	UpdateQGlobal(uint32 qid, QGlobal newGlobal);
	void	DeleteQGlobal(std::string name, uint32 npcID, uint32 charID, uint32 zoneID);
	void	SendFindableNPCList(Client *c);
	void	UpdateFindableNPCState(NPC *n, bool Remove);
	void	HideCorpses(Client *c, uint8 CurrentMode, uint8 NewMode);

	list<Mob*> GetMobList();
	list<NPC*> GetNPCList();
	list<Client*> GetClientList();
	list<Corpse*> GetCorpseList();

#ifdef EQBOTS

	// franck-add: EQoffline
	int32				character_id;
	inline int32	CharacterID()	const { return character_id; }
	bool	Bot_AICheckCloseBeneficialSpells(NPC* caster, int8 iChance, float iRange, int16 iSpellTypes);
	Mob*	GetBotMobByName(const char *name);
	void    ShowSpawnWindow(Client* client, int Distance, bool NamedOnly = false);
	void    BotHelpWindow(Client* client, int MobClass);

#endif //EQBOTS

	// fez_ajer: Get lists of NPC's (cast to Mob*) currently aggro'd on the mob/group
	list<Mob*> GetMobAggroList(Mob *target);
	list<Mob*> GetGroupAggroList(Group *group);

protected:
	friend class Zone;
	void	Depop(bool StartSpawnTimer = true);
private:
	int16   GetFreeID();
	void	AddToSpawnQueue(int16 entityid, NewSpawn_Struct** app);
	void	CheckSpawnQueue();
	
	//used for limiting spawns
	class SpawnLimitRecord { public: int32 spawngroup_id; int32 npc_type; };
	map<int16, SpawnLimitRecord> npc_limit_list;		//entity id -> npc type
	
	int32	tsFirstSpawnOnQueue; // timestamp that the top spawn on the spawnqueue was added, should be 0xFFFFFFFF if queue is empty
	int32	NumSpawnsOnQueue;
	LinkedList<NewSpawn_Struct*> SpawnQueue;

	LinkedList<Client*> client_list;
	LinkedList<Mob*> mob_list;
	LinkedList<NPC*> npc_list;
	list<Group*> group_list;
	LinkedList<Corpse*> corpse_list;
	LinkedList<Object*> object_list;
	LinkedList<Doors*> door_list;
	LinkedList<Trap*> trap_list;
	LinkedList<Beacon*> beacon_list;
	LinkedList<NPC *> proximity_list;
	list<Raid *> raid_list;
	int16 last_insert_id;

#ifdef EQBOTS

	//EQoffline
	list<BotRaids*> botraid_list;

#endif //EQBOTS

	// Please Do Not Declare Any EntityList Class Members After This Comment
#ifdef BOTS
	public:
		void AddBot(Bot* newBot, bool SendSpawnPacket = true, bool dontqueue = false);
		bool RemoveBot(int16 entityID);
		Mob* GetMobByBotID(uint32 botID);
		list<Bot*> GetBotsByBotOwnerCharacterID(uint32 botOwnerCharacterID);

		bool Bot_AICheckCloseBeneficialSpells(Bot* caster, int8 iChance, float iRange, int16 iSpellTypes);  // TODO: Evaluate this closesly in hopes to eliminate
		void ShowSpawnWindow(Client* client, int Distance, bool NamedOnly);  // TODO: Implement ShowSpawnWindow in the bot class but it needs entity list stuff
		BotRaids* GetBotRaidByMob(Mob *mr);	// TODO: Remove after BotRaids object is deprecated
		bool RemoveBotRaid(int16 delete_id);	// TODO: Remove after BotRaids object is deprecated
		void AddBotRaid(BotRaids *br);	// TODO: Remove after BotRaids object is deprecated
		void AddBotRaid(BotRaids *br, int16 id);	// TODO: Remove after BotRaids object is deprecated
	private:
		LinkedList<Bot*> bot_list;
		list<BotRaids*> botraid_list;	// TODO: Remove after BotRaids object is deprecated
#endif
};

class BulkZoneSpawnPacket {
public:
	BulkZoneSpawnPacket(Client* iSendTo, int32 iMaxSpawnsPerPacket);	// 0 = send zonewide
	virtual ~BulkZoneSpawnPacket();
	
	bool	AddSpawn(NewSpawn_Struct* ns);
	void	SendBuffer();	// Sends the buffer and cleans up everything - can safely re-use the object after this function call (no need to free and do another new)
private:
	int32	pMaxSpawnsPerPacket;
	int32	index;
	NewSpawn_Struct* data;
	Client* pSendTo;
};

#endif

