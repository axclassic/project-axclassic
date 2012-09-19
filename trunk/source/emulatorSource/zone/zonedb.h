#ifndef ZONEDB_H_
#define ZONEDB_H_

#include "../common/shareddb.h"
#include "../common/eq_packet_structs.h"
#include "loottable.h"
#include "faction.h"

struct wplist {
	int   index;
	float x;
	float y;
	float z;
	int	  pause;
};

#pragma pack(1)
struct DBnpcspells_entries_Struct {
	sint16	spellid;
	uint16	type;
	uint8	minlevel;
	uint8	maxlevel;
	sint16	manacost;
	sint32	recast_delay;
	sint16	priority;
};
#pragma pack()

struct DBnpcspells_Struct {
	int32	parent_list;
	sint16	attack_proc;
	int8	proc_chance;
	int32	numentries;
	DBnpcspells_entries_Struct entries[0];
};

struct DBTradeskillRecipe_Struct {
	SkillType tradeskill;
	sint16 skill_needed;
	uint16 trivial;
	bool nofail;
	bool replace_container;
	vector< pair<uint32,uint8> > onsuccess;
	vector< pair<uint32,uint8> > onfail;
	string name;
};

struct PetRecord {
	uint32 npc_type;
	bool temporary;
};

struct ZoneSpellsBlocked {
	int32 spellid;
	sint8 type;
	float x;
	float y;
	float z;
	float xdiff;
	float ydiff;
	float zdiff;
	char message[256];
};

struct TraderCharges_Struct {
	int32 ItemID[80];
	sint32 SerialNumber[80];
	int32 ItemCost[80];
	sint32 Charges[80];
};


class ItemInst;
struct FactionMods;
struct FactionValue;
struct LootTable_Struct;


class ZoneDatabase : public SharedDatabase {
public:
	ZoneDatabase();
	ZoneDatabase(const char* host, const char* user, const char* passwd, const char* database,int32 port);
	virtual ~ZoneDatabase();
	
	/*
	 * Objects and World Containers
	 */
	void	LoadWorldContainer(uint32 parentid, ItemInst* container);
	void	SaveWorldContainer(uint32 zone_id, uint32 parent_id, const ItemInst* container);
	void	DeleteWorldContainer(uint32 parent_id,uint32 zone_id);
	uint32	AddObject(uint32 type, uint32 icon, const Object_Struct& object, const ItemInst* inst);
	void	UpdateObject(uint32 id, uint32 type, uint32 icon, const Object_Struct& object, const ItemInst* inst);
	void	DeleteObject(uint32 id);
	Ground_Spawns*	LoadGroundSpawns(int32 zone_id, int16 version, Ground_Spawns* gs);
	
	/*
	 * Adventures
	 */
	
	/*
	 * Traders
	 */

	void    SaveTraderItem(uint32 char_id,uint32 itemid,int32 uniqueid, sint32 charges,uint32 itemcost,int8 slot);
	void    UpdateTraderItemCharges(int char_id, uint32 ItemInstID, sint32 charges);
	void	UpdateTraderItemPrice(int CharID, int32 ItemID, int32 Charges, int32 NewPrice);
	ItemInst* LoadSingleTraderItem(uint32 char_id, int uniqueid);
	void	DeleteTraderItem(uint32 char_id);
	void	DeleteTraderItem(uint32 char_id,int16 slot_id);
	Trader_Struct* LoadTraderItem(uint32 char_id);
	TraderCharges_Struct* LoadTraderItemWithCharges(uint32 char_id);

	// Buyer/Barter
	//
	void AddBuyLine(uint32 CharID, uint32 BuySlot, uint32 ItemID, const char *ItemName, uint32 Quantity, uint32 Price);
	void RemoveBuyLine(uint32 CharID, uint32 BuySlot);
	void DeleteBuyLines(uint32 CharID);
	void UpdateBuyLine(uint32 CharID, uint32 BuySlot, uint32 Quantity);

	/*
	 * General Character Related Stuff
	 */
	bool	SetServerFilters(char* name, ServerSideFilters_Struct *ssfs);
	int32	GetServerFilters(char* name, ServerSideFilters_Struct *ssfs);
	bool	GetAccountInfoForLogin(int32 account_id, sint16* admin = 0, char* account_name = 0, 
				int32* lsaccountid = 0, int8* gmspeed = 0, bool* revoked = 0, bool* gmhideme = 0);
	bool	GetAccountInfoForLogin_result(MYSQL_RES* result, sint16* admin = 0, char* account_name = 0, 
				int32* lsaccountid = 0, int8* gmspeed = 0, bool* revoked = 0, bool* gmhideme = false);
	bool	GetCharacterInfoForLogin_result(MYSQL_RES* result, uint32* character_id = 0, char* current_zone = 0, 
				PlayerProfile_Struct* pp = 0, Inventory* inv = 0, ExtendedProfile_Struct *ext = 0, uint32* pplen = 0, 
				uint32* guilddbid = 0, int8* guildrank = 0, uint8 *class_=  0, uint8 *level = 0, bool *LFP = 0,
				bool *LFG = 0);
	bool	GetCharacterInfoForLogin(const char* name, uint32* character_id = 0, char* current_zone = 0, 
				PlayerProfile_Struct* pp = 0, Inventory* inv = 0, ExtendedProfile_Struct *ext = 0, uint32* pplen = 0, 
				uint32* guilddbid = 0, int8* guildrank = 0, uint8 *class_ = 0, uint8 *level = 0, bool *LFP = 0,
				bool *LFG = 0);
	
	/*
	 * Character Inventory
	 */
	bool	NoRentExpired(const char* name);
	
	/*
	 * Corpses
	 */
	bool	GetDecayTimes(npcDecayTimes_Struct* npcCorpseDecayTimes);
	int32	CreatePlayerCorpse(int32 charid, const char* charname, int32 zoneid, int16 instanceid, uchar* data, int32 datasize, float x, float y, float z, float heading);
	int32	UpdatePlayerCorpse(int32 dbid, int32 charid, const char* charname, int32 zoneid, int16 instanceid, uchar* data, int32 datasize, float x, float y, float z, float heading, bool rezzed = false);
	bool	BuryPlayerCorpse(int32 dbid);
	bool	DeletePlayerCorpse(int32 dbid);
	int32	GetPlayerBurriedCorpseCount(int32 char_id);
	int32	GetPlayerCorpseCount(int32 char_id);
	Corpse* SummonBurriedPlayerCorpse(int32 char_id, int32 dest_zoneid, int16 dest_instanceid, float dest_x, float dest_y, float dest_z, float dest_heading);
	bool	SummonAllPlayerCorpses(int32 char_id, int32 dest_zoneid, int16 dest_instanceid, float dest_x, float dest_y, float dest_z, float dest_heading);
	Corpse*	LoadPlayerCorpse(int32 player_corpse_id);
	bool	UnburyPlayerCorpse(int32 dbid, int32 new_zoneid, int16 dest_instanceid, float new_x, float new_y, float new_z, float new_heading);
	bool	LoadPlayerCorpses(int32 iZoneID, int16 iInstanceID);
	int32	GraveyardPlayerCorpse(int32 dbid, int32 zoneid, int16 instanceid, float x, float y, float z, float heading);
	int32	NewGraveyardRecord(int32 graveyard_zoneid, float graveyard_x, float graveyard_y, float graveyard_z, float graveyard_heading);
	int32	AddGraveyardIDToZone(int32 zone_id, int32 graveyard_id);
	bool	DeleteGraveyard(int32 zone_id, int32 graveyard_id);
	int32   GetFirstCorpseID(int32 char_id);
	
	/*
	 * Faction
	 */
	bool	GetNPCFactionList(int32 npcfaction_id, sint32* faction_id, sint32* value, sint32* primary_faction = 0);
	bool	GetFactionData(FactionMods* fd, uint32 class_mod, uint32 race_mod, uint32 deity_mod, sint32 faction_id); //rembrant, needed for factions Dec, 16 2001
	bool	GetFactionName(sint32 faction_id, char* name, int32 buflen); // rembrant, needed for factions Dec, 16 2001
	bool	GetFactionIdsForNPC(uint32 nfl_id, list<struct NPCFaction*> *faction_list, sint32* primary_faction = 0); // neotokyo: improve faction handling
	bool	SetCharacterFactionLevel(int32 char_id, sint32 faction_id, sint32 value, faction_map &val_list); // rembrant, needed for factions Dec, 16 2001
	bool	LoadFactionData();
	bool	LoadFactionValues(int32 char_id, faction_map & val_list);
	bool	LoadFactionValues_result(MYSQL_RES* result, faction_map & val_list);
	
	/*
	 * AAs
	 */
	bool    LoadAAEffects();
	bool	LoadAAEffects2();
	bool    LoadSwarmSpells();
//	int32	GetPlayerAlternateAdv(int32 account_id, char* name, PlayerAA_Struct* aa);
	SendAA_Struct*	GetAASkillVars(int32 skill_id);
	int8	GetTotalAALevels(int32 skill_id);
	int32	GetSizeAA();
	int32	CountAAs();
	void	LoadAAs(SendAA_Struct **load);
	int32 CountAAEffects();
	void FillAAEffects(SendAA_Struct* aa_struct);
	
	/*
	 * Zone related
	 */
	bool	GetZoneCFG(int32 zoneid, NewZone_Struct *data, bool &can_bind, bool &can_combat, bool &can_levitate, bool &can_castoutdoor, bool &is_city, bool &is_hotzone, bool &can_raid, bool &is_classic); //Angelox3
	bool	SaveZoneCFG(int32 zoneid,NewZone_Struct* zd);
	bool	DumpZoneState();
	sint8	LoadZoneState(const char* zonename, LinkedList<Spawn2*>& spawn2_list);
	bool	LoadStaticZonePoints(LinkedList<ZonePoint*>* zone_point_list,const char* zonename);
	bool	UpdateZoneSafeCoords(const char* zonename, float x, float y, float z);
	int8	GetUseCFGSafeCoords();
    int		getZoneShutDownDelay(int32 zoneID);
	
	/*
	 * Item
	 */
	void	LoadItemStatus();
	inline int8	GetItemStatus(uint32 id) { if (id < MAX_ITEM_ID) { return item_minstatus[id]; } return 0; }
	inline void SetItemStatus(uint32 id, int8 status) { if (id < MAX_ITEM_ID) { item_minstatus[id] = status; } }
	bool	DBSetItemStatus(int32 id, int8 status);
	
	/*
	 * Spawns and Spawn Points
	 */
	bool	LoadSpawnGroups(const char* zone_name, uint16 version, SpawnGroupList* spawn_group_list);
    bool	LoadSpawnGroupsByID(int spawngroupid, SpawnGroupList* spawn_group_list);
	bool	PopulateZoneSpawnList(int32 zoneid, LinkedList<Spawn2*> &spawn2_list, int16 version, int32 repopdelay = 0);
	Spawn2*	LoadSpawn2(LinkedList<Spawn2*> &spawn2_list, int32 spawn2id, int32 timeleft);
	bool	CreateSpawn2(Client *c, int32 spawngroup, const char* zone, float heading, float x, float y, float z, int32 respawn, int32 variance, uint16 condition, sint16 cond_value);
	void	UpdateSpawn2Timeleft(int32 id, int16 instance_id,int32 timeleft);
	int32	GetSpawnTimeLeft(int32 id, int16 instance_id);
	void	UpdateSpawn2Status(int32 id, int8 new_status);
	
	/*
	 * Grids/Paths
	 */
	int32	GetFreeGrid(int16 zoneid);
	void	DeleteGrid(Client *c, int32 sg2, int32 grid_num, bool grid_too,int16 zoneid);
	void	DeleteWaypoint(Client *c, int32 grid_num, int32 wp_num,int16 zoneid);
//	int32	AddWP(Client *c, int32 sg2, int16 grid_num, int8 wp_num, float xpos, float ypos, float zpos, int32 pause, float xpos1, float ypos1, float zpos1, int type1, int type2,int16 zoneid);
	void	AddWP(Client *c, int32 gridid, int32 wpnum, float xpos, float ypos, float zpos, int32 pause, int16 zoneid);
	int32	AddWPForSpawn(Client *c, int32 spawn2id, float xpos, float ypos, float zpos, int32 pause, int type1, int type2, int16 zoneid);
	void	ModifyGrid(Client *c, bool remove, int32 id, int8 type = 0, int8 type2 = 0,int16 zoneid = 0);
	void    ModifyWP(Client *c, int32 grid_id, int32 wp_num, float xpos, float ypos, float zpos, int32 script=0,int16 zoneid =0);
	int8    GetGridType(int32 grid,int32 zoneid);
	int8    GetGridType2(int32 grid, int16 zoneid);
	bool    GetWaypoints(int32 grid, int16 zoneid, int32 num, wplist* wp);
	void	AssignGrid(Client *client, float x, float y, int32 id);
	int		GetHighestGrid(uint32 zoneid);
	int		GetHighestWaypoint(uint32 zoneid, int32 gridid);
	
	/*
	 * NPCs
	 */
	const NPCType*			GetNPCType(uint32 id);
	int32	NPCSpawnDB(int8 command, const char* zone, Client *c, NPC* spawn = 0, int32 extra = 0); // 0 = Create 1 = Add; 2 = Update; 3 = Remove; 4 = Delete
	bool	SetSpecialAttkFlag(int8 id, const char* flag);
	bool	GetPetEntry(const char *pet_type, PetRecord *into);
	void	AddLootTableToNPC(NPC* npc,int32 loottable_id, ItemList* itemlist, int32* copper, int32* silver, int32* gold, int32* plat);
	void	AddLootDropToNPC(NPC* npc,int32 lootdrop_id, ItemList* itemlist);
	int32	GetMaxNPCSpellsID();
	DBnpcspells_Struct* GetNPCSpells(int32 iDBSpellsID);
	
	/*
	 * Petitions
	 */
	void	UpdateBug(BugStruct* bug);
	void	UpdateBug(PetitionBug_Struct* bug);
	void	DeletePetitionFromDB(Petition* wpet);
	void	UpdatePetitionToDB(Petition* wpet);
	void	InsertPetitionToDB(Petition* wpet);
	void	RefreshPetitionsFromDB();
	
	
	/*
	 * Merchants
	 */
	void	SaveMerchantTemp(int32 npcid, int32 slot, int32 item, int32 charges);
	void	DeleteMerchantTemp(int32 npcid, int32 slot);
	
	/*
	 * Tradeskills
	 */
	bool	GetTradeRecipe(const ItemInst* container, uint8 c_type, uint32 some_id, DBTradeskillRecipe_Struct *spec);
	bool	GetTradeRecipe(uint32 recipe_id, uint8 c_type, uint32 some_id, DBTradeskillRecipe_Struct *spec);
	int32   GetZoneForage(int32 ZoneID, int8 skill);    /* for foraging - BoB */
	int32   GetZoneFishing(int32 ZoneID, int8 skill, uint32 &npc_id, uint8 &npc_chance);
	
	/*
	 * Tribute
	 */
	bool	LoadTributes();
	
	/*
	 * Doors
	 */
	uint32  MaxDoors() { return max_door_type; }
	bool	DoorIsOpen(int8 door_id,const char* zone_name);
	void	SetDoorPlace(int8 value,int8 door_id,const char* zone_name);
	bool	LoadDoors(sint32 iDoorCount, Door *into, const char *zone_name, int16 version);
	bool	CheckGuildDoor(int8 doorid,int16 guild_id, const char* zone);
	bool	SetGuildDoor(int8 doorid,int16 guild_id, const char* zone);
	int32	GetGuildEQID(int32 guilddbid);
	void	UpdateDoorGuildID(int doorid, int guild_id);
	sint32	GetDoorsCount(int32* oMaxID, const char *zone_name, int16 version);
	
	/*
	 * Blocked Spells
	 */

	sint32	GetBlockedSpellsCount(int32 zoneid);
	bool	LoadBlockedSpells(sint32 blockedSpellsCount, ZoneSpellsBlocked* into, int32 zoneid);

	/*
	 * Traps
	 */
	bool	LoadTraps(const char* zonename, int16 version);
	char*	GetTrapMessage(int32 trap_id);

	/*
	 * Time
	 */
	int32	GetZoneTZ(int32 zoneid);
	bool	SetZoneTZ(int32 zoneid, int32 tz);
	
	/*
	 * Weather
	 */
	int8	GetZoneWeather(int32 zoneid);
	bool	SetZoneWeather(int32 zoneid, int8 w);
	/*
	 * Group
	 */
	void RefreshGroupFromDB(Client *c);
	int8 GroupCount(int32 groupid);
	/*
	 * Raid
	 */
	int8 RaidGroupCount(int32 raidid, int32 groupid);

	/*
	 * Instancing
	 */
	void ListAllInstances(Client* c, int32 charid);

	/*
	 * QGlobals
	 */
	void QGlobalPurge();

	/*
	 * Misc stuff.
	 * PLEASE DO NOT ADD TO THIS COLLECTION OF CRAP UNLESS YOUR METHOD 
	 * REALLY HAS NO BETTER SECTION
	 */
	bool    logevents(const char* accountname,int32 accountid,int8 status,const char* charname,const char* target, const char* descriptiontype, const char* description,int event_nid);
	void	GetEventLogs(const char* name,char* target,int32 account_id=0,int8 eventid=0,char* detail=0,char* timestamp=0, CharacterEventLog_Struct* cel=0);
	int32	GetKarma(int32 acct_id);
	void	UpdateKarma(int32 acct_id, int32 amount);
	
	/*
	 * Things which really dont belong here...
	 */
	sint16	CommandRequirement(const char* commandname);
	 
protected:
	void ZDBInitVars();
	
	uint32				max_faction;
	Faction**			faction_array;
	
	int32				npc_spells_maxid;
	DBnpcspells_Struct** npc_spells_cache;
	bool*				npc_spells_loadtried;
	int8 item_minstatus[MAX_ITEM_ID];
	int8 door_isopen_array[255];
};

extern ZoneDatabase database;

#endif /*ZONEDB_H_*/












