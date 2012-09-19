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
#ifndef EQEMU_DATABASE_H
#define EQEMU_DATABASE_H

#define AUTHENTICATION_TIMEOUT	60
#define INVALID_ID				0xFFFFFFFF

#include "debug.h"
#include "types.h"
#include "dbcore.h"
#include "linked_list.h"
#include "eq_packet_structs.h"
#include "rulesys.h"
/*#include "EQStream.h"
#include "guilds.h"
#include "MiscFunctions.h"
#include "Mutex.h"
#include "Item.h"
#include "extprofile.h"*/
#include <string>
#include <vector>
#include <map>
using namespace std;

//atoi is not int32 or uint32 safe!!!!
#define atoul(str) strtoul(str, NULL, 10)

//class Spawn;
class Corpse;
class Spawn2;
class NPC;
class SpawnGroupList;
class Petition;
class Client;
struct Combine_Struct;
//struct Faction;
//struct FactionMods;
//struct FactionValue;
struct ZonePoint;
struct NPCType;
class Inventory;
class ItemInst;

struct EventLogDetails_Struct {
	int32	id;
	char	accountname[64];
	int32	account_id;
	sint16	status;
	char	charactername[64];
	char	targetname[64];
	char	timestamp[64];
	char	descriptiontype[64];
	char	details[128];
};

struct CharacterEventLog_Struct {
int32	count;
int8	eventid;
EventLogDetails_Struct eld[255];
};


// Added By Hogie 
// INSERT into variables (varname,value) values('decaytime [minlevel] [maxlevel]','[number of seconds]');
// IE: decaytime 1 54 = Levels 1 through 54
//     decaytime 55 100 = Levels 55 through 100
// It will always put the LAST time for the level (I think) from the Database
struct npcDecayTimes_Struct {
	int16 minlvl;
	int16 maxlvl;
	int32 seconds;
};
// Added By Hogie -- End

struct VarCache_Struct {
	char varname[26];	// varname is char(25) in database
	char value[0];
};

struct PlayerProfile_Struct;
struct GuildRankLevel_Struct;
struct GuildRanks_Struct;
struct ExtendedProfile_Struct;
struct GuildMember_Struct;
class PTimerList;

class Database : public DBcore {
public:
	Database();
	Database(const char* host, const char* user, const char* passwd, const char* database,int32 port);
	bool Connect(const char* host, const char* user, const char* passwd, const char* database,int32 port);
	~Database();
	
	
//	void	ExtraOptions();
	

	/*
	 * General Character Related Stuff
	 */
	bool	MoveCharacterToZone(const char* charname, const char* zonename);
	bool	MoveCharacterToZone(const char* charname, const char* zonename,int32 zoneid);
	bool	MoveCharacterToZone(int32 iCharID, const char* iZonename);
	bool	UpdateName(const char* oldname, const char* newname);
	bool	SetHackerFlag(const char* accountname, const char* charactername, const char* hacked);
	bool	SetMQDetectionFlag(const char* accountname, const char* charactername, const char* hacked, const char* zone);
	bool	AddToNameFilter(const char* name);
	bool	ReserveName(int32 account_id, char* name);
	bool	CreateCharacter(uint32 account_id, char* name, int16 gender, int16 race, int16 class_, int8 str, int8 sta, int8 cha, int8 dex, int8 int_, int8 agi, int8 wis, int8 face);
	bool	StoreCharacter(uint32 account_id, PlayerProfile_Struct* pp, Inventory* inv, ExtendedProfile_Struct *ext);
	bool	DeleteCharacter(char* name);
	int8	CopyCharacter(const char* oldname, const char* newname, int32 acctid);

	/*
	 * General Information Getting Queries
	 */
	bool	CheckNameFilter(const char* name, bool surname = false);
	bool	CheckUsedName(const char* name);
	int32	GetAccountIDByChar(const char* charname, int32* oCharID = 0);
	uint32	GetAccountIDByChar(uint32 char_id);
	int32	GetAccountIDByName(const char* accname, sint16* status = 0, int32* lsid = 0);
	void	GetAccountName(int32 accountid, char* name, int32* oLSAccountID = 0);
	void	GetCharName(int32 char_id, char* name);
	int32	GetCharacterInfo(const char* iName, int32* oAccID = 0, int32* oZoneID = 0, int32* oInstanceID = 0,float* oX = 0, float* oY = 0, float* oZ = 0);
	int32	GetCharacterID(const char *name);
	bool	CheckBannedIPs(const char* loginIP); //Lieka Edit:  Check incomming connection against banned IP table.
 	bool	AddBannedIP(char* bannedIP, const char* notes); //Lieka Edit:  Add IP address to the Banned_IPs table.
	bool	CheckGMIPs(const char* loginIP, int32 account_id);
	bool	AddGMIP(char* ip_address, char* name);
	void	LoginIP(int32 AccountID, const char* LoginIP);

	/*
	 * Instancing Stuff
	 */
	bool VerifyZoneInstance(int32 zone_id, int16 instance_id);
	bool VerifyInstanceAlive(int16 instance_id, int32 char_id);
	bool CharacterInInstanceGroup(int16 instance_id, int32 char_id);
	void SetCharacterInstance(int16 instance_id, int32 char_id);
	void DeleteInstance(uint16 instance_id);
	bool CheckInstanceExpired(uint16 instance_id);
	int32 ZoneIDFromInstanceID(uint16 instance_id);
	int32 VersionFromInstanceID(uint16 instance_id);
	int32 GetTimeRemainingInstance(uint16 instance_id);
	bool GetUnusedInstanceID(uint16 &instance_id);
	bool CreateInstance(uint16 instance_id, uint32 zone_id, uint32 version, uint32 duration);
	void PurgeExpiredInstances();
	bool AddClientToInstance(uint16 instance_id, uint32 char_id);
	bool RemoveClientFromInstance(uint16 instance_id, uint32 char_id);
	bool RemoveClientsFromInstance(uint16 instance_id);
	bool CheckInstanceExists(uint16 instance_id);
	void BuryCorpsesInInstance(uint16 instance_id);
	int16 GetInstanceVersion(uint16 instance_id);
	int16 GetInstanceID(const char* zone, int32 charid, int16 version);
	int16 GetInstanceID(int32 zone, int32 charid, int16 version);
	void AssignGroupToInstance(int32 gid, int32 instance_id);
	void AssignRaidToInstance(int32 rid, int32 instance_id);
	void FlagInstanceByGroupLeader(int32 zone, int16 version, int32 charid, int32 gid);
	void FlagInstanceByRaidLeader(int32 zone, int16 version, int32 charid, int32 rid);
	void SetInstanceDuration(int16 instance_id, int32 new_duration);

	/*
	 * Adventure
	 */
	void GroupAdventureLevelAndRange(int32 gid, int32 &avg_level, int32 &range);
	void RaidAdventureLevelAndRange(int32 rid, int32 &avg_level, int32 &range);
	int32 CreateAdventure(int32 adventure_id);
	void AddPlayerToAdventure(int32 id, int32 charid);
	void RemovePlayerFromAdventure(int32 id, int32 charid);
	void RemovePlayersFromAdventure(int32 id);
	void AddGroupToAdventure(int32 id, int32 gid);
	void AddRaidToAdventure(int32 id, int32 rid);
	void DestroyAdventure(int32 id);
	bool GetAdventureDetails(int32 charid, int32 &id, int32 &adventure_id, int32 &instance_id, int32 &count, 
		int32 &ass_count, int32 &status, int32 &time_c, int32 &time_z, int32 &time_comp);
	int32 GetAdventureID(int32 char_id);
	int32 CountPlayersInAdventure(int32 id);
	void PurgeAdventures();
	void AddAdventureToInstance(int32 adv_id, int32 inst_id);
	void UpdateAdventureStatus(int32 adv_id, int32 status);
	void UpdateAdventureInstance(int32 adv_id, int32 inst_id, int32 time);
	void UpdateAdventureCompleted(int32 adv_id, int32 time);
	void UpdateAdventureCount(int32 adv_id, int32 new_count);
	void IncrementAdventureCount(int32 adv_id);
	int32 GetAdventureCount(int32 adv_id);
	bool AdventureExists(int32 adv_id);
	void UpdateAdventureStatsEntry(int32 char_id, int8 theme, bool win);
	void UpdateAllAdventureStatsEntry(int32 adv_id, int8 theme, bool win);
	bool GetAdventureStats(int32 char_id, int32 &guk_w, int32 &mir_w, int32 &mmc_w, int32 &ruj_w, int32 &tak_w, 
		int32 &guk_l, int32 &mir_l, int32 &mmc_l, int32 &ruj_l, int32 &tak_l);
	int32 AdventureGetAssassinateKills(int32 adv_id);
	void AdventureSetAssassinateKills(int32 adv_id, int32 kills);

	/*
	 * Account Related
	 */
	int32	GetMiniLoginAccount(char* ip);
	void	GetAccountFromID(int32 id, char* oAccountName, sint16* oStatus);
	int32	CheckLogin(const char* name, const char* password, sint16* oStatus = 0);
	sint16	CheckStatus(int32 account_id);
	int32	CreateAccount(const char* name, const char* password, sint16 status, int32 lsaccount_id = 0, int32 lsaccount_id2 = 0);
	int32	pLSID;
	inline int32		LSID()	const		{ return pLSID; }
	bool	DeleteAccount(const char* name);
 	bool	SetAccountStatus(const char* name, sint16 status);
	bool	SetLocalPassword(uint32 accid, const char* password);
	int32	GetAccountIDFromLSID(int32 iLSID, char* oAccountName = 0, sint16* oStatus = 0);
	bool	UpdateLiveChar(char* charname,int32 lsaccount_id);
	bool	GetLiveChar(int32 account_id, char* cname);
	int8	GetAgreementFlag(int32 acctid);
	void	SetAgreementFlag(int32 acctid);
	
	/*
	 * Groups
	 */
	int32	GetGroupID(const char* name);
	void	SetGroupID(const char* name, int32 id, int32 charid);
	void	ClearGroup(int32 gid = 0);
	void	ClearStatics();
	//void	ClearBotTemps();
	char*	GetGroupLeaderForLogin(const char* name,char* leaderbuf);
	
	void	SetGroupLeaderName(int32 gid, const char* name);
	char*	GetGroupLeadershipInfo(int32 gid, char* leaderbuf, char* assist = NULL, char *marknpc = NULL,
				       GroupLeadershipAA_Struct* GLAA = NULL);
	void	ClearGroupLeader(int32 gid = 0);

	/*
	 * Raids
	 */
	void	ClearRaid(int32 rid = 0);
	void	ClearRaidDetails(int32 rid = 0);
	int32	GetRaidID(const char* name);
	const char *GetRaidLeaderName(int32 rid);

	/*
	 * Database Varaibles
	 */
	bool	GetVariable(const char* varname, char* varvalue, int16 varvalue_len);
	bool	SetVariable(const char* varname, const char* varvalue);
	bool	LoadVariables();
	int32	LoadVariables_MQ(char** query);
	bool	LoadVariables_result(MYSQL_RES* result);
	
	/*
	 * General Queries
	 */
	bool	LoadZoneNames();
	bool	GetZoneLongName(const char* short_name, char** long_name, char* file_name = 0, float* safe_x = 0, float* safe_y = 0, float* safe_z = 0, int32* graveyard_id = 0, int32* maxclients = 0);
	bool	GetZoneGraveyard(const int32 graveyard_id, int32* graveyard_zoneid = 0, float* graveyard_x = 0, float* graveyard_y = 0, float* graveyard_z = 0, float* graveyard_heading = 0);
	int32	GetZoneGraveyardID(int32 zone_id);
	int32	GetZoneID(const char* zonename);
	int8    GetPEQZone(int32 zoneID);
	const char*	GetZoneName(int32 zoneID, bool ErrorUnknown = false);
	int8	GetServerType();
	bool	GetSafePoints(const char* short_name, float* safe_x = 0, float* safe_y = 0, float* safe_z = 0, sint16* minstatus = 0, int8* minlevel = 0, char *flag_needed = NULL, int8* canzone = 0); //Angelox4
	bool	GetSafePoints(int32 zoneID, float* safe_x = 0, float* safe_y = 0, float* safe_z = 0, sint16* minstatus = 0, int8* minlevel = 0, char *flag_needed = NULL, int8* canzone = 0) { return GetSafePoints(GetZoneName(zoneID), safe_x, safe_y, safe_z, minstatus, minlevel, flag_needed, canzone); } //Angelox4
	int8	GetSkillCap(int8 skillid, int8 in_race, int8 in_class, int16 in_level);
	int8	GetRaceSkill(int8 skillid, int8 in_race);
	
#ifdef EQBOTS
	//franck-adds: EQoffline ------------------
	// 1:
	void	ClearBotTemps();	
	void	AddBot(int32 mobidtmp);
	void	RemoveBot(int32 mobidtmp);
	void	SetBotTitle(int32 BotiD, const char* BotTile);
	// 2:
	bool	DeleteBot(int32 mobid);
	bool    BotGroupExists(int32 groupid, int32 charid);
	int32	GetBotGroupID(int32 charid);
	int32	GetSavedBotGroupID(int32 botid);
	int	GetBotStatus(int32 mobidtmp);
	int32	GetBotIDByBotName(std::string botName);
	void	DeleteBotGroups(int32 charid, int tableA, int tableB, int tableC);
	MYSQL_RES*	LoadBotGroups(int32 charid, int tableA, int tableB, int tableC);
	void	SaveBotGroups(int32 groupid, int32 charid, int32 botid, int16 slot, int tableA, int tableB, int tableC);
	void	SetBotLeader(int32 mobidtmp, int32 leaderid, const char* botName, const char* zoneName, int32 zoneid);
	int32	GetBotLeader(int32 mobidtmp);
	int	SpawnedBotCount(int32 id);
	int	AllowedBotSpawns(int32 id);
	void	SaveToBotBank(int32 groupid, int32 charid, int32 botid, int16 slot, int32 hp, int32 mana);
	void	DeleteFromBotBank(int32 groupid, int32 charid);
	//MYSQL_RES*	LoadFromBotBank(int32 charid);
	MYSQL_RES*	LoadFromBotGroups(int32 groupid, int32 charid);
	void	SaveToBotTemp(int32 groupid, int32 charid, int32 botid, int16 slot, int32 hp, int32 mana);
	void	DeleteFromBotTemp(int32 charid);
	void	DeleteBotBuffs(int32 botid);
	void    DeleteBotTempEntry(int32 mobidtmp);
	void    DeleteBotGroupEntry(int32 groupid, int32 mobidtmp);
	void	CopyBotBankToBotTemp(int32 groupid, int32 charid);
	int		CheckBotTemp(int32 charid);
	MYSQL_RES*	LoadFromBotTemp(int32 groupid, int32 charid);
	int	BotClientModeLookup(int32 id);
	int	BotRaidModeLookup(int32 id);

	//Spell Quests
	int	BotSummonLookup(int32 id);
	int	BotCircleLookup(int32 id);
	int	BotPortalLookup(int32 id);
	int	BotTempLookup(int32 id);
	int	BotTashrLookup(int32 id);
	int	BotWtashrLookup(int32 id);
	//Bard Spells (could be quested)
	int	BotSelosLookup(int32 id);
	// botspellstate spell checks
	int	BotRootLookup(int32 id);
	int	BotSnareLookup(int32 id);
	//End Spell Quests
	int 	LadderTrophyLookup(int32 id);
	int 	Classic2012Lookup();
	int 	BotCanBindLookUp(int32 zone_id);
	int	BotTauntLookup(int32 id);
	int	BotSpamLookup(int32 id);
	int	BattleHealLookup(int32 id);	
	int	BotLock1Lookup(int32 id); //lock primary
	int	BotLock2Lookup(int32 id); //lock secondary

	bool	IsBotSpawned(int32 id, int botid);
	bool	BotHasGroup(int32 botid, int32 charid);
	MYSQL_RES*	ListSpawnedBots(int32 id);
	MYSQL_RES*	ListBotGroups(int32 charid);
	int		GetBotOwner(int32 mobid);
	void	UpdateBotLock1(int32 value, int32 charid); //lock primary
	void	UpdateBotLock2(int32 value, int32 charid); //lock secondary
	void	SetBotOwner(int32 mobid, int32 ownerid);
	void	UpdateBotOwner(int32 accountid, int32 ownerid);
	void	UpdateBotStats(int32 hp, int32 mana, int32 botid);
	void	UpdateBotGroupID(int32 groupid, int32 charid);
	void	UpdateBattleHeal(int32 value, int32 charid);	
	void	UpdateBotSpam(int32 value, int32 charid);	
	void	UpdateBotRoot(int32 value, int32 charid);
	void	UpdateBotSnare(int32 value, int32 charid);	
	void	UpdateBotSelos(int32 value, int32 charid);
	void	UpdateBotTaunt(int32 value, int32 charid);
	void	UpdateBotRaidMode(int32 value, int32 charid);
	void	UpdateBotClientMode(int32 value, int32 charid);
	void	UpdateBotArchery(int32 archery, int32 botid);
	int	GetBotArchery(int32 botid);
	int 	GetBotHP(int32 botid);
	void	CleanBotLeader(int32 leaderid);
	void    CleanBotLeaderEntries(int32 mobidtmp);
	int	CountBots(int32 leaderid);
	int	GetMagePet(int32 botid);
	void	SetMagePet(int32 magepet, int32 botid);

	// 3:
	// a)  Get and Set an item in the bot inventory
	bool	BotHasAnItemInSlot(int32 botid, int32 slot);			// return true if it has an item in the invent and false if not
	int	GetBotItemBySlot(int32 botid, int32 slot);				// return the item ID in the given slot
	uint32	GetEquipmentColor(int32 botid, int32 slot);
	void	SetBotItemInSlot(uint32 botID, uint32 slotID, uint32 itemID, const ItemInst* inst, std::string *errorMessage);// add an item the in the slot
	void	RemoveBotItemBySlot(int32 botid, int32 slot, std::string *errorMessage);			// remove an item in the given slot

	// c) How many items do the bots have
	int		GetBotItemsNumber(int32 botid);							// return the number of items that the bots have
#endif //EQBOTS
	void	ZoneLauncherLookup(const char* zone, int32 date);	
	bool	LoadPTimers(uint32 charid, PTimerList &into);
	void	ClearPTimers(uint32 charid);
	void	ClearMerchantTemp();
	void	SetLFP(int32 CharID, bool LFP); 
	void	SetLFG(int32 CharID, bool LFG); 
	void	AddReport(std::string who, std::string against, std::string lines);
	

protected:
	void	HandleMysqlError(int32 errnum);
	//bool	RunQuery(const char* query, int32 querylen, char* errbuf = 0, MYSQL_RES** result = 0, int32* affected_rows = 0, int32* errnum = 0, bool retry = true);
	
private:
	void DBInitVars();
	
	int32	max_zonename;
	char**	zonename_array;
	
	Mutex	Mvarcache;
	uint32	varcache_max;
	VarCache_Struct**	varcache_array;
	uint32	varcache_lastupdate;
};

bool	FetchRowMap(MYSQL_RES *result, map<string,string> &rowmap);
#endif
