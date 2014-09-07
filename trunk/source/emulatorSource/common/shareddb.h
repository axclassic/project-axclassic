#ifndef SHAREDDB_H_
#define SHAREDDB_H_

#define MAX_ITEM_ID				125000

#include "database.h"
#include "skills.h"
#include "../zone/spdat.h"
#include "Item.h"

#include <list>


struct Item_Struct;
struct NPCFactionList;
struct Faction;
struct LootTable_Struct;
struct LootDrop_Struct;

/*
 * This object is inherited by world and zone's DB object,
 * and is mainly here to facilitate shared memory, and other
 * things which only world and zone need.
 */
class SharedDatabase : public Database {
public:
	SharedDatabase();
	SharedDatabase(const char* host, const char* user, const char* passwd, const char* database,int32 port);
	virtual ~SharedDatabase();

	/*
	 * General Character Related Stuff
	 */
	bool	SetGMSpeed(int32 account_id, int8 gmspeed);
	int8	GetGMSpeed(int32 account_id);
	bool	SetHideMe(int32 account_id, int8 hideme);
	bool	GetPlayerProfile(uint32 account_id, char* name, PlayerProfile_Struct* pp, Inventory* inv, ExtendedProfile_Struct *ext, char* current_zone = 0, uint32 *current_instance = 0);
	bool	SetPlayerProfile(uint32 account_id, uint32 charid, PlayerProfile_Struct* pp, Inventory* inv, ExtendedProfile_Struct *ext, uint32 current_zone = 0, uint32 current_instance = 0);
	int32	SetPlayerProfile_MQ(char** query, uint32 account_id, uint32 charid, PlayerProfile_Struct* pp, Inventory* inv, ExtendedProfile_Struct *ext, uint32 current_zone = 0, uint32 current_instance = 0);
	sint32	DeleteStalePlayerCorpses();
	sint32	DeleteStalePlayerBackups();

	int32	GetTotalTimeEntitledOnAccount(uint32 AccountID);

	/*
	 * Character Inventory
	 */
	bool	SaveCursor(int32 char_id, std::list<ItemInst*>::const_iterator &start, std::list<ItemInst*>::const_iterator &end);
	bool	SaveInventory(uint32 char_id, const ItemInst* inst, sint16 slot_id);
	bool	VerifyInventory(uint32 account_id, sint16 slot_id, const ItemInst* inst);
	bool	GetSharedBank(uint32 id, Inventory* inv, bool is_charid);
	sint32	GetSharedPlatinum(int32 account_id);
	bool	SetSharedPlatinum(int32 account_id, sint32 amount_to_add);
	bool	GetInventory(uint32 char_id, Inventory* inv);
	bool	GetInventory(uint32 account_id, char* name, Inventory* inv);
	bool    SetStartingItems(PlayerProfile_Struct* pp, Inventory* inv, uint32 si_race, uint32 si_class, uint32 si_deity, uint32 si_current_zone, char* si_name, int admin);
	
	
	string	GetBook(const char *txtfile);
	
	/*
	 * Item Methods
	 */
	ItemInst* CreateItem(uint32 item_id, sint16 charges=0, uint32 aug1=0, uint32 aug2=0, uint32 aug3=0, uint32 aug4=0, uint32 aug5=0);
	ItemInst* CreateItem(const Item_Struct* item, sint16 charges=0, uint32 aug1=0, uint32 aug2=0, uint32 aug3=0, uint32 aug4=0, uint32 aug5=0);
	ItemInst* CreateBaseItem(const Item_Struct* item, sint16 charges=0);
	
	/*
	 * Shared Memory crap
	 */
	inline const int32	GetMaxItem()			{ return max_item; }
	inline const int32	GetMaxLootTableID()		{ return loottable_max; }
	inline const int32	GetMaxLootDropID()		{ return lootdrop_max; }
	inline const int32	GetMaxNPCType()			{ return max_npc_type; }
	inline const int32  GetMaxNPCFactionList()	{ return npcfactionlist_max; }
	const Item_Struct*	GetItem(uint32 id);
	const EvolveInfo*	GetEvolveInfo(uint32 loregroup);
	const NPCFactionList*	GetNPCFactionEntry(uint32 id);
	int16	GetSkillCap(int8 Class_, SkillType Skill, int8 Level);
	int8	GetTrainLevel(int8 Class_, SkillType Skill, int8 Level);
//	const Door*				GetDoor(int8 door_id, const char* zone_name);
//	const Door*				GetDoorDBID(uint32 db_id);
	const	LootTable_Struct* GetLootTable(int32 loottable_id);
	const	LootDrop_Struct* GetLootDrop(int32 lootdrop_id);
	bool	LoadItems();
	bool	LoadLoot();
	bool	LoadNPCFactionLists();
	bool	LoadSkillCaps();
	bool	GetCommandSettings(map<string,uint8> &commands);
	const Item_Struct* IterateItems(uint32* NextIndex);
	bool	DBLoadItems(sint32 iItemCount, uint32 iMaxItemID);
	bool	DBLoadNPCTypes(sint32 iNPCTypeCount, uint32 iMaxNPCTypeID);
	bool	DBLoadNPCFactionLists(sint32 iNPCFactionListCount, uint32 iMaxNPCFactionListID);
	bool	DBLoadLoot();
	bool	DBLoadSkillCaps();
	void	DBLoadDamageShieldTypes(SPDat_Spell_Struct* sp, sint32 iMaxSpellID);


protected:
	void SDBInitVars();
	
	/*
	 * Private shared mem stuff
	 */
	sint32	GetItemsCount(int32* oMaxID = 0);
	sint32	GetNPCTypesCount(int32* oMaxID = 0);
	sint32	GetNPCFactionListsCount(int32* oMaxID = 0);
	static bool extDBLoadItems(sint32 iItemCount, int32 iMaxItemID);
	static bool extDBLoadNPCFactionLists(sint32 iNPCFactionListCount, int32 iMaxNPCFactionListID);
	static bool extDBLoadLoot();
	static bool extDBLoadSkillCaps();
	
	
	uint32				max_item;
	uint32				max_npc_type;
	uint32				max_door_type;
	uint32				npcfactionlist_max;
	uint32				loottable_max;
	uint32				lootdrop_max;
	
	int32				npc_spells_maxid;
	
private:
	static SharedDatabase *s_usedb;
};





#endif /*SHAREDDB_H_*/



















