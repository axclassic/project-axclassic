
#include "zonedb.h"
#include "../common/Item.h"
#include "../common/MiscFunctions.h"
#include "../common/extprofile.h"
#include "../common/guilds.h"
#include "../common/rulesys.h"
#include "zone.h"
#include "client.h"
#include "groups.h"
#include "raids.h"
#include <iostream>
#include <string>
#include <sstream>

using namespace std;

extern Zone* zone;

ZoneDatabase database;

ZoneDatabase::ZoneDatabase()
: SharedDatabase()
{
	ZDBInitVars();
}

ZoneDatabase::ZoneDatabase(const char* host, const char* user, const char* passwd, const char* database, int32 port)
: SharedDatabase(host, user, passwd, database, port)
{
	ZDBInitVars();
}

void ZoneDatabase::ZDBInitVars() {
	memset(item_minstatus, 0, sizeof(item_minstatus));
	memset(door_isopen_array, 0, sizeof(door_isopen_array));
	npc_spells_maxid = 0;
	npc_spells_cache = 0;
	npc_spells_loadtried = 0;
	max_faction = 0;
	faction_array = NULL;
}

ZoneDatabase::~ZoneDatabase() {
	unsigned int x;
	if (npc_spells_cache) {
		for (x=0; x<=npc_spells_maxid; x++) {
			safe_delete_array(npc_spells_cache[x]);
		}
		safe_delete_array(npc_spells_cache);
	}
	safe_delete_array(npc_spells_loadtried);
	
	if (faction_array != NULL) {
		for (x=0; x <= max_faction; x++) {
			if (faction_array[x] != 0)
				safe_delete(faction_array[x]);
		}
		safe_delete_array(faction_array);
	}
}

bool ZoneDatabase::SaveZoneCFG(int32 zoneid,NewZone_Struct* zd){
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	if (!RunQuery(query, MakeAnyLenString(&query, "update zone set underworld=%f,minclip=%f,"
		"maxclip=%f,fog_minclip=%f,fog_maxclip=%f,fog_blue=%i,fog_red=%i,fog_green=%i,sky=%i,"
		"ztype=%i,zone_exp_multiplier=%f,safe_x=%f,safe_y=%f,safe_z=%f "
		"where zoneidnumber=%i",
		zd->underworld,zd->minclip,
		zd->maxclip,zd->fog_minclip[0],zd->fog_maxclip[0],zd->fog_blue[0],zd->fog_red[0],zd->fog_green[0],zd->sky,
		zd->ztype,zd->zone_exp_multiplier,
		zd->safe_x,zd->safe_y,zd->safe_z,
		zoneid),errbuf))	{
			LogFile->write(EQEMuLog::Error, "Error in SaveZoneCFG query %s: %s", query, errbuf);
			safe_delete_array(query);
			return false;
	}
	safe_delete_array(query);
	return true;
}

bool ZoneDatabase::GetZoneCFG(int32 zoneid, NewZone_Struct *zone_data, bool &can_bind, bool &can_combat, bool &can_levitate, bool &can_castoutdoor, bool &is_city , bool &is_hotzone, bool &can_raid, bool &is_classic) { //Angelox3
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	int i=0;
	int b=0;
	bool good = false;
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT ztype,"
		"fog_red,fog_green,fog_blue,fog_minclip,fog_maxclip,"
		"fog_red2,fog_green2,fog_blue2,fog_minclip2,fog_maxclip2,"
		"fog_red3,fog_green3,fog_blue3,fog_minclip3,fog_maxclip3,"
		"fog_red4,fog_green4,fog_blue4,fog_minclip4,fog_maxclip4,"
		"sky,zone_exp_multiplier,safe_x,safe_y,safe_z,underworld,"
		"minclip,maxclip,time_type,canbind,cancombat,canlevitate,"
		"castoutdoor,hotzone,canraid,isclassic" //Angelox3
		" from zone where zoneidnumber=%i",zoneid), errbuf, &result)) {
		safe_delete_array(query);
		while((row = mysql_fetch_row(result))) {
			int r = 0;
			memset(zone_data,0,sizeof(NewZone_Struct));
			zone_data->ztype=atoi(row[r++]);
			
			for(i=0;i<4;i++){
				zone_data->fog_red[i]=atoi(row[r++]);
				zone_data->fog_green[i]=atoi(row[r++]);
				zone_data->fog_blue[i]=atoi(row[r++]);
				zone_data->fog_minclip[i]=atof(row[r++]);
				zone_data->fog_maxclip[i]=atof(row[r++]);
			}
			
			zone_data->sky=atoi(row[r++]);
			zone_data->zone_exp_multiplier=atof(row[r++]);
			zone_data->safe_x=atof(row[r++]);
			zone_data->safe_y=atof(row[r++]);
			zone_data->safe_z=atof(row[r++]);
			zone_data->underworld=atof(row[r++]);
			zone_data->minclip=atof(row[r++]);
			zone_data->maxclip=atof(row[r++]);
			
			zone_data->time_type=atoi(row[r++]);
//not in the DB yet:
			zone_data->gravity = 0.4;
			
			b = atoi(row[r++]);
			can_bind = b==0?false:true;
			is_city = b==2?true:false;
			can_combat = atoi(row[r++])==0?false:true;
			can_levitate = atoi(row[r++])==0?false:true;
			can_castoutdoor = atoi(row[r++])==0?false:true;
			is_hotzone = atoi(row[r++])==0?false:true;
			can_raid = atoi(row[r++])==0?false:true;//Angelox3
			is_classic = atoi(row[r++])==0?false:true;//Angelox3
			
			good = true;
		}
		mysql_free_result(result);
	}
	else
		LogFile->write(EQEMuLog::Error, "Error in GetZoneCFG query %s: %s", query, errbuf);
	safe_delete_array(query);
	
	zone_data->zone_id = zoneid;
	
	return(good);
}

//updates or clears the respawn time in the database for the current spawn id
void ZoneDatabase::UpdateSpawn2Timeleft(int32 id, int16 instance_id, int32 timeleft)
{
	timeval tv;
	gettimeofday(&tv, NULL);
	int32 cur = tv.tv_sec;

	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	
	//if we pass timeleft as 0 that means we clear from respawn time
	//otherwise we update with a REPLACE INTO
	if(timeleft == 0)
	{
		if (!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM respawn_times WHERE id=%lu "
			"AND instance_id=%lu",(unsigned long)id, (unsigned long)instance_id),errbuf))
		{
			LogFile->write(EQEMuLog::Error, "Error in UpdateTimeLeft query %s: %s", query, errbuf);
		}
		safe_delete_array(query);
	}
	else
	{
		if (!RunQuery(query, MakeAnyLenString(&query, "REPLACE INTO respawn_times (id,start,duration,instance_id) "
			"VALUES(%lu,%lu,%lu,%lu)",(unsigned long)id, (unsigned long)cur, (unsigned long)timeleft, (unsigned long)instance_id),errbuf))
		{
			LogFile->write(EQEMuLog::Error, "Error in UpdateTimeLeft query %s: %s", query, errbuf);
		}
		safe_delete_array(query);
	}
	return;
}

//Gets the respawn time left in the database for the current spawn id
int32 ZoneDatabase::GetSpawnTimeLeft(int32 id, int16 instance_id)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	MakeAnyLenString(&query, "SELECT start, duration FROM respawn_times WHERE id=%lu AND instance_id=%lu",
		(unsigned long)id, (unsigned long)zone->GetInstanceID());
	
	if (RunQuery(query, strlen(query), errbuf, &result))
	{
		safe_delete_array(query);
		row = mysql_fetch_row(result);
		if(row)
		{
			timeval tv;
			gettimeofday(&tv, NULL);
			int32 resStart = atoi(row[0]);
			int32 resDuration = atoi(row[1]);

			//compare our values to current time
			if((resStart + resDuration) <= tv.tv_sec)
			{
				//our current time was expired
				mysql_free_result(result);
				return 0;
			}
			else
			{
				//we still have time left on this timer
				mysql_free_result(result);
				return ((resStart + resDuration) - tv.tv_sec);
			}
		}
		else
		{
			mysql_free_result(result);
			return 0;
		}
	}
	else
	{
		LogFile->write(EQEMuLog::Error, "Error in GetSpawnTimeLeft query '%s': %s", query, errbuf);
		safe_delete_array(query);
		return 0;
	}
	return 0;
}

void ZoneDatabase::UpdateSpawn2Status(int32 id, int8 new_status)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	
	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE spawn2 SET enabled=%i WHERE id=%lu", new_status, (unsigned long)id),errbuf))
	{
		LogFile->write(EQEMuLog::Error, "Error in UpdateSpawn2Status query %s: %s", query, errbuf);
	}
	safe_delete_array(query);
	return;
}

bool ZoneDatabase::logevents(const char* accountname,int32 accountid,int8 status,const char* charname, const char* target,const char* descriptiontype, const char* description,int event_nid){
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	uint32 len = strlen(description);
	uint32 len2 = strlen(target);
	char* descriptiontext = new char[2*len+1];
	char* targetarr = new char[2*len2+1];
	memset(descriptiontext, 0, 2*len+1);
	memset(targetarr, 0, 2*len2+1);
	DoEscapeString(descriptiontext, description, len);
	DoEscapeString(targetarr, target, len2);
	if (!RunQuery(query, MakeAnyLenString(&query, "Insert into eventlog (accountname,accountid,status,charname,target,descriptiontype,description,event_nid) values('%s',%i,%i,'%s','%s','%s','%s','%i')", accountname,accountid,status,charname,targetarr,descriptiontype,descriptiontext,event_nid), errbuf))	{
		cerr << "Error in logevents" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}
	safe_delete_array(query);
	safe_delete_array(descriptiontext);
	safe_delete_array(targetarr);
	return true;
}


void ZoneDatabase::UpdateBug(BugStruct* bug){
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	

	uint32 len = strlen(bug->bug);
	char* bugtext = NULL;
	if(len > 0)
	{
		bugtext = new char[2*len+1];
		memset(bugtext, 0, 2*len+1);
		DoEscapeString(bugtext, bug->bug, len);
	}

	len = strlen(bug->ui);
	char* uitext = NULL;
	if(len > 0)
	{
		uitext = new char[2*len+1];
		memset(uitext, 0, 2*len+1);
		DoEscapeString(uitext, bug->ui, len);
	}

	len = strlen(bug->target_name);
	char* targettext = NULL;
	if(len > 0)
	{
		targettext = new char[2*len+1];
		memset(targettext, 0, 2*len+1);
		DoEscapeString(targettext, bug->target_name, len);
	}

	//x and y are intentionally swapped because eq is inversexy coords
	if (!RunQuery(query, MakeAnyLenString(&query, "INSERT INTO bugs (zone, name, ui, x, y, z, type, flag, target, bug, date) "
		"values('%s', '%s', '%s', '%.2f', '%.2f', '%.2f', '%s', %d, '%s', '%s', CURDATE())", zone->GetShortName(), bug->name, 
		uitext==NULL?"":uitext, bug->y, bug->x, bug->z, bug->chartype, bug->type, targettext==NULL?"Unknown Target":targettext, 
		bugtext==NULL?"":bugtext), errbuf)) {	
		cerr << "Error in UpdateBug" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
	safe_delete_array(bugtext);
	safe_delete_array(uitext);
	safe_delete_array(targettext);	
}

void ZoneDatabase::UpdateBug(PetitionBug_Struct* bug){
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	uint32 len = strlen(bug->text);
	char* bugtext = new char[2*len+1];
	memset(bugtext, 0, 2*len+1);
	DoEscapeString(bugtext, bug->text, len);
	if (!RunQuery(query, MakeAnyLenString(&query, "Insert into bugs (type,name,bugtext,flag) values('%s','%s','%s',%i)","Petition",bug->name,bugtext,25), errbuf))	{
		cerr << "Error in UpdateBug" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
	safe_delete_array(bugtext);
}


bool ZoneDatabase::GetAccountInfoForLogin_result(MYSQL_RES* result, sint16* admin, char* account_name, int32* lsaccountid, int8* gmspeed, bool* revoked,bool* gmhideme) {
    MYSQL_ROW row;
	if (mysql_num_rows(result) == 1) {
		row = mysql_fetch_row(result);
		if (admin)
			*admin = atoi(row[0]);
		if (account_name)
			strcpy(account_name, row[1]);
		if (lsaccountid) {

			if (row[2])
				*lsaccountid = atoi(row[2]);
			else
				*lsaccountid = 0;


		}
		if (gmspeed)
			*gmspeed = atoi(row[3]);
		if (revoked)
			*revoked = atoi(row[4]);
		if(gmhideme)
			*gmhideme = atoi(row[5]);
		return true;
	}
	else {
		return false;
	}
}


bool ZoneDatabase::SetSpecialAttkFlag(int8 id, const char* flag) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	int32	affected_rows = 0;
	
	if (!RunQuery(query, MakeAnyLenString(&query, "UPDATE npc_types SET npcspecialattks='%s' WHERE id=%i;",flag,id), errbuf, 0, &affected_rows)) {
		safe_delete_array(query);
		return false;
	}
	safe_delete_array(query);
	
	if (affected_rows == 0) {
		return false;
	}
	
	return true;
}

bool ZoneDatabase::DoorIsOpen(int8 door_id,const char* zone_name)
{
	if(door_isopen_array[door_id] == 0) {
		SetDoorPlace(1,door_id,zone_name);
		return false;
	}
	else {
		SetDoorPlace(0,door_id,zone_name);
		return true;
	}
}

void ZoneDatabase::SetDoorPlace(int8 value,int8 door_id,const char* zone_name)
{
	door_isopen_array[door_id] = value;
}

void ZoneDatabase::GetEventLogs(const char* name,char* target,int32 account_id,int8 eventid,char* detail,char* timestamp, CharacterEventLog_Struct* cel)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	query = new char[256];
	int32 count = 0;
	char modifications[200];
	if(strlen(name) != 0)
		sprintf(modifications,"charname=\'%s\'",name);
	else if(account_id != 0)
		sprintf(modifications,"accountid=%i",account_id);
	
	if(strlen(target) != 0)
		sprintf(modifications,"%s AND target like \'%%%s%%\'",modifications,target);
	
	if(strlen(detail) != 0)
		sprintf(modifications,"%s AND description like \'%%%s%%\'",modifications,detail);
	
	if(strlen(timestamp) != 0)
		sprintf(modifications,"%s AND time like \'%%%s%%\'",modifications,timestamp);
	
	if(eventid == 0)
		eventid =1;
	sprintf(modifications,"%s AND event_nid=%i",modifications,eventid);
	
	MakeAnyLenString(&query, "SELECT id,accountname,accountid,status,charname,target,time,descriptiontype,description FROM eventlog where %s",modifications);	
	if (RunQuery(query, strlen(query), errbuf, &result))
	{
		safe_delete_array(query);
		while((row = mysql_fetch_row(result)))
		{
			if(count > 255)
				break;
			cel->eld[count].id = atoi(row[0]);
			strncpy(cel->eld[count].accountname,row[1],64);
			cel->eld[count].account_id = atoi(row[2]);
			cel->eld[count].status = atoi(row[3]);
			strncpy(cel->eld[count].charactername,row[4],64);
			strncpy(cel->eld[count].targetname,row[5],64);
			sprintf(cel->eld[count].timestamp,"%s",row[6]);
			strncpy(cel->eld[count].descriptiontype,row[7],64);
			strncpy(cel->eld[count].details,row[8],128);
			cel->eventid = eventid;
			count++;
			cel->count = count;
		}
		mysql_free_result(result);
	}
	else
	{
		// TODO: Invalid item length in database
		safe_delete_array(query);
	}
}

/*
	Cofruben:Starting adventure database functions.
*/

// Load child objects for a world container (i.e., forge, bag dropped to ground, etc)
void ZoneDatabase::LoadWorldContainer(uint32 parentid, ItemInst* container)
{
	if (!container) {
		LogFile->write(EQEMuLog::Error, "Programming error: LoadWorldContainer passed NULL pointer");
		return;
	}
	
	char errbuf[MYSQL_ERRMSG_SIZE];
    char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	//const Item_Struct* item = NULL;
	//ItemInst* inst = NULL;
	
	uint32 len_query =  MakeAnyLenString(&query, "select "
		"bagidx,itemid,charges,augslot1,augslot2,augslot3,augslot4,augslot5 from object_contents where parentid=%i", parentid);
	
	if (RunQuery(query, len_query, errbuf, &result)) {
		while ((row = mysql_fetch_row(result))) {
			uint8 index = (uint8)atoi(row[0]);
			uint32 item_id = (uint32)atoi(row[1]);
			sint8 charges = (sint8)atoi(row[2]);
			uint32 aug[5];
			aug[0]	= (uint32)atoi(row[3]);
			aug[1]	= (uint32)atoi(row[4]);
			aug[2]	= (uint32)atoi(row[5]);
			aug[3]	= (uint32)atoi(row[6]);
			aug[4]	= (uint32)atoi(row[7]);
			
			ItemInst* inst = database.CreateItem(item_id, charges);
			if (inst) {
				if (inst->GetItem()->ItemClass == ItemClassCommon) {
					for(int i=0;i<5;i++) {
						if (aug[i]) {
								inst->PutAugment(&database, i, aug[i]);
						}
					}
				}
				// Put item inside world container
				container->PutItem(index, *inst);
				safe_delete(inst);
			}
		}
		mysql_free_result(result);
	}
	else {
		LogFile->write(EQEMuLog::Error, "Error in DB::LoadWorldContainer: %s", errbuf);
	}
	
	safe_delete_array(query);
}

// Save child objects for a world container (i.e., forge, bag dropped to ground, etc)
void ZoneDatabase::SaveWorldContainer(uint32 zone_id, uint32 parent_id, const ItemInst* container)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
    char* query = 0;
	
	// Since state is not saved for each world container action, we'll just delete
	// all and save from scratch .. we may come back later to optimize
	//DeleteWorldContainer(parent_id);
	
	if (!container) {
		return;
	}
	//Delete all items from container
	DeleteWorldContainer(parent_id,zone_id);
	// Save all 10 items, if they exist
	for (uint8 index=0; index<10; index++) {
		ItemInst* inst = container->GetItem(index);
		if (inst) {
			uint32 item_id = inst->GetItem()->ID;
			uint32 augslot[5] = { 0, 0, 0, 0, 0 };
			if (inst->IsType(ItemClassCommon)) {
				for(int i=0;i<5;i++) {
					ItemInst *auginst=inst->GetAugment(i);
					augslot[i]=(auginst && auginst->GetItem()) ? auginst->GetItem()->ID : 0;
				}
			}
			uint32 len_query = MakeAnyLenString(&query,

				"replace into object_contents (zoneid,parentid,bagidx,itemid,charges,augslot1,augslot2,augslot3,augslot4,augslot5,droptime) values (%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,now())",
				zone_id, parent_id, index, item_id, inst->GetCharges(),augslot[0],augslot[1],augslot[2],augslot[3],augslot[4]);
			
			if (!RunQuery(query, len_query, errbuf)) {
				LogFile->write(EQEMuLog::Error, "Error in ZoneDatabase::SaveWorldContainer: %s", errbuf);
			}
			safe_delete_array(query);
		}

	}
}

// Remove all child objects inside a world container (i.e., forge, bag dropped to ground, etc)
void ZoneDatabase::DeleteWorldContainer(uint32 parent_id,uint32 zone_id)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
    char* query = 0;
	
	uint32 len_query = MakeAnyLenString(&query,
		"delete from object_contents where parentid=%i and zoneid=%i", parent_id,zone_id);
	if (!RunQuery(query, len_query, errbuf)) {
		LogFile->write(EQEMuLog::Error, "Error in ZoneDatabase::DeleteWorldContainer: %s", errbuf);
	}
	
	safe_delete_array(query);
}

Trader_Struct* ZoneDatabase::LoadTraderItem(uint32 char_id){
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	Trader_Struct* loadti = new Trader_Struct;
	memset(loadti,0,sizeof(Trader_Struct));
	if (RunQuery(query,MakeAnyLenString(&query, "select * from trader where char_id=%i order by slot_id limit 80",char_id),errbuf,&result)){
		safe_delete_array(query);
		loadti->Code = BazaarTrader_ShowItems;
		while ((row = mysql_fetch_row(result))) {
			if(atoi(row[5])>=80 || atoi(row[4])<0)
				_log(TRADING__CLIENT, "Bad Slot number when trying to load trader information!\n");
			else{
				loadti->Items[atoi(row[5])] = atoi(row[1]);
				loadti->ItemCost[atoi(row[5])] = atoi(row[4]);
			}
		}
		mysql_free_result(result);
	}
	else{
		safe_delete_array(query);
		_log(TRADING__CLIENT, "Failed to load trader information!\n");
	}
	return loadti;
}

TraderCharges_Struct* ZoneDatabase::LoadTraderItemWithCharges(uint32 char_id){
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	TraderCharges_Struct* loadti = new TraderCharges_Struct;
	memset(loadti,0,sizeof(TraderCharges_Struct));
	if (RunQuery(query,MakeAnyLenString(&query, "select * from trader where char_id=%i order by slot_id limit 80",char_id),errbuf,&result)){
		safe_delete_array(query);
		while ((row = mysql_fetch_row(result))) {
			if(atoi(row[5])>=80 || atoi(row[5])<0)
				_log(TRADING__CLIENT, "Bad Slot number when trying to load trader information!\n");
			else{
				loadti->ItemID[atoi(row[5])] = atoi(row[1]);
				loadti->SerialNumber[atoi(row[5])] = atoi(row[2]);
				loadti->Charges[atoi(row[5])] = atoi(row[3]);
				loadti->ItemCost[atoi(row[5])] = atoi(row[4]);
			}
		}
		mysql_free_result(result);
	}
	else{
		safe_delete_array(query);
		_log(TRADING__CLIENT, "Failed to load trader information!\n");
	}
	return loadti;
}

ItemInst* ZoneDatabase::LoadSingleTraderItem(uint32 CharID, int SerialNumber) {

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if (RunQuery(query,MakeAnyLenString(&query, "select * from trader where char_id=%i and serialnumber=%i order by slot_id limit 80",
					   CharID, SerialNumber),errbuf,&result)){
		safe_delete_array(query);

		if (mysql_num_rows(result) != 1) {
			_log(TRADING__CLIENT, "Bad result from query\n"); fflush(stdout);
			return NULL;
		}
		row = mysql_fetch_row(result);
		int ItemID = atoi(row[1]);
		int Charges = atoi(row[3]);
		int Cost = atoi(row[4]);

		const Item_Struct *item=database.GetItem(ItemID);

		if(!item) {
			_log(TRADING__CLIENT, "Unable to create item\n"); fflush(stdout);
			return NULL;
		}

		if (item && (item->NoDrop!=0)) {
			ItemInst* inst = database.CreateItem(item);
			if(!inst) {
				_log(TRADING__CLIENT, "Unable to create item instance\n"); fflush(stdout);
				return NULL;
			}

			inst->SetCharges(Charges);
			inst->SetSerialNumber(SerialNumber);
			inst->SetMerchantSlot(SerialNumber);
			inst->SetPrice(Cost);
			if(inst->IsStackable())
				inst->SetMerchantCount(Charges);

			return inst;
		}
	}

	return NULL;


}

void ZoneDatabase::SaveTraderItem(uint32 CharID, uint32 ItemID, int32 SerialNumber, sint32 Charges, uint32 ItemCost, int8 Slot){

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	if (!(RunQuery(query,MakeAnyLenString(&query, "replace INTO trader VALUES(%i,%i,%i,%i,%i,%i)",
					      CharID, ItemID, SerialNumber, Charges, ItemCost, Slot),errbuf)))
		_log(TRADING__CLIENT, "Failed to save trader item: %i for char_id: %i, the error was: %s\n", ItemID, CharID, errbuf);

	safe_delete_array(query);
}

void ZoneDatabase::UpdateTraderItemCharges(int CharID, uint32 SerialNumber, sint32 Charges) {

	_log(TRADING__CLIENT, "ZoneDatabase::UpdateTraderItemCharges(%i, %i, %i)", CharID, SerialNumber, Charges);
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	if (!(RunQuery(query,MakeAnyLenString(&query, "update trader set charges=%i where char_id=%i and serialnumber=%i",
					     Charges, CharID, SerialNumber),errbuf)))
		_log(TRADING__CLIENT, "Failed to update charges for  trader item: %i for char_id: %i, the error was: %s\n",
				      SerialNumber, CharID, errbuf);

	safe_delete_array(query);

}

void ZoneDatabase::UpdateTraderItemPrice(int CharID, int32 ItemID, int32 Charges, int32 NewPrice) {

	_log(TRADING__CLIENT, "ZoneDatabase::UpdateTraderPrice(%i, %i, %i, %i)", CharID, ItemID, Charges, NewPrice);

	const Item_Struct *item = database.GetItem(ItemID);

	if(!item)
		return;

	char errbuf[MYSQL_ERRMSG_SIZE];

	char* Query = 0;

	if(NewPrice == 0) {
		_log(TRADING__CLIENT, "Removing Trader items from the DB for CharID %i, ItemID %i", CharID, ItemID);

		if (!(RunQuery(Query,MakeAnyLenString(&Query, "delete from trader where char_id=%i and item_id=%i",
							       CharID, ItemID),errbuf)))
	
			_log(TRADING__CLIENT, "Failed to remove trader item(s): %i for char_id: %i, the error was: %s\n",
					      ItemID, CharID, errbuf);

		safe_delete_array(Query);
		
		return;
	}
	else {
		if(!item->Stackable) {
			if (!(RunQuery(Query,MakeAnyLenString(&Query, "update trader set item_cost=%i where char_id=%i and item_id=%i"
								      " and charges=%i", NewPrice, CharID, ItemID, Charges),errbuf)))
	
				_log(TRADING__CLIENT, "Failed to update price for  trader item: %i for char_id: %i, the error was: %s\n",
						      ItemID, CharID, errbuf);
		}
		else {
			if (!(RunQuery(Query,MakeAnyLenString(&Query, "update trader set item_cost=%i where char_id=%i and item_id=%i",
								      NewPrice, CharID, ItemID),errbuf)))
	
				_log(TRADING__CLIENT, "Failed to update price for  trader item: %i for char_id: %i, the error was: %s\n",
						      ItemID, CharID, errbuf);
		}

		safe_delete_array(Query);
	}

}

void ZoneDatabase::DeleteTraderItem(uint32 char_id){
	char errbuf[MYSQL_ERRMSG_SIZE];
    char* query = 0;
	if(char_id==0){
		if (!(RunQuery(query,MakeAnyLenString(&query, "delete from trader"),errbuf)))
			_log(TRADING__CLIENT, "Failed to delete all trader items data, the error was: %s\n",errbuf);
	}
	else{
		if (!(RunQuery(query,MakeAnyLenString(&query, "delete from trader where char_id=%i",char_id),errbuf)))
			_log(TRADING__CLIENT, "Failed to delete trader item data for char_id: %i, the error was: %s\n",char_id,errbuf);
	}
	safe_delete_array(query);
}
void ZoneDatabase::DeleteTraderItem(uint32 CharID,int16 SlotID){
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	if (!(RunQuery(query,MakeAnyLenString(&query, "delete from trader where char_id=%i and slot_id=%i",CharID, SlotID),errbuf)))
		_log(TRADING__CLIENT, "Failed to delete trader item data for char_id: %i, the error was: %s\n",CharID, errbuf);
	safe_delete_array(query);
}

void ZoneDatabase::DeleteBuyLines(uint32 CharID){

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	if(CharID==0){
		if (!(RunQuery(query,MakeAnyLenString(&query, "delete from buyer"),errbuf)))
			_log(TRADING__CLIENT, "Failed to delete all buyer items data, the error was: %s\n",errbuf);
	}
	else{
		if (!(RunQuery(query,MakeAnyLenString(&query, "delete from buyer where charid=%i",CharID),errbuf)))
			_log(TRADING__CLIENT, "Failed to delete buyer item data for charid: %i, the error was: %s\n",CharID,errbuf);
	}
	safe_delete_array(query);
}

void ZoneDatabase::AddBuyLine(uint32 CharID, uint32 BuySlot, uint32 ItemID, const char* ItemName, uint32 Quantity, uint32 Price) {

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	if (!(RunQuery(query,MakeAnyLenString(&query, "replace INTO buyer VALUES(%i,%i, %i,\"%s\",%i,%i)",
					      CharID, BuySlot, ItemID, ItemName, Quantity, Price),errbuf)))
		_log(TRADING__CLIENT, "Failed to save buline item: %i for char_id: %i, the error was: %s\n", ItemID, CharID, errbuf);

	safe_delete_array(query);
}

void ZoneDatabase::RemoveBuyLine(uint32 CharID, uint32 BuySlot) {

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;

	if (!(RunQuery(query,MakeAnyLenString(&query, "delete from buyer where charid=%i and buyslot=%i", CharID, BuySlot), errbuf)))
		_log(TRADING__CLIENT, "Failed to delete buyslot %i for charid: %i, the error was: %s\n", BuySlot, CharID, errbuf);

	safe_delete_array(query);
}

void ZoneDatabase::UpdateBuyLine(uint32 CharID, uint32 BuySlot, uint32 Quantity) {

	if(Quantity <= 0) {
		RemoveBuyLine(CharID, BuySlot);
		return;
	}

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;

	if (!(RunQuery(query,MakeAnyLenString(&query, "update buyer set quantity=%i where charid=%i and buyslot=%i", 
					      Quantity, CharID, BuySlot), errbuf)))
		_log(TRADING__CLIENT, "Failed to update quantity in buyslot %i for charid: %i, the error was: %s\n", BuySlot, CharID, errbuf);

	safe_delete_array(query);

}

bool ZoneDatabase::GetCharacterInfoForLogin(const char* name, uint32* character_id, 
char* current_zone, PlayerProfile_Struct* pp, Inventory* inv, ExtendedProfile_Struct *ext, 
uint32* pplen, uint32* guilddbid, int8* guildrank, 
int8 *class_, int8 *level, bool *LFP, bool *LFG) {
	_CP(Database_GetCharacterInfoForLogin);
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	int32 querylen;
    MYSQL_RES *result;
	
	bool ret = false;
	
	//DO NOT FORGET TO EDIT Client::Handle_Connect_OP_ZoneEntry if you change this.
	
	if (character_id && *character_id) {
		// searching by ID should be a lil bit faster
		querylen = MakeAnyLenString(&query, 
			"SELECT id,profile,zonename,x,y,z,guild_id,rank,extprofile,class,level,lfp,lfg,instanceid "
			" FROM character_ LEFT JOIN guild_members ON id=char_id WHERE id=%i", *character_id);
	}
	else {
		querylen = MakeAnyLenString(&query, 
			"SELECT id,profile,zonename,x,y,z,guild_id,rank,extprofile,class,level,lfp,lfg,instanceid "
			" FROM character_ LEFT JOIN guild_members ON id=char_id WHERE name='%s'", name);
	}
	
	if (RunQuery(query, querylen, errbuf, &result)) {
		ret = GetCharacterInfoForLogin_result(result, character_id, current_zone, pp, inv, ext, pplen, guilddbid, guildrank, class_, level, LFP, LFG);
		mysql_free_result(result);
	}
	else {
		LogFile->write(EQEMuLog::Error, "GetCharacterInfoForLogin query '%s' %s", query, errbuf);
	}
	
	safe_delete_array(query);
	return ret;
}

#define StructDist(in, f1, f2) (uint32(&in->f2)-uint32(&in->f1))

// Process results of GetCharacterInfoForLogin()
// Query this processes: SELECT id,profile,zonename,x,y,z,guild,guildrank,extprofile,class,level FROM character_ WHERE id=%i
bool ZoneDatabase::GetCharacterInfoForLogin_result(MYSQL_RES* result, 
	int32* character_id, char* current_zone, PlayerProfile_Struct* pp, Inventory* inv, 
	ExtendedProfile_Struct *ext, uint32* pplen, uint32* guilddbid, int8* guildrank, 
	int8 *class_, int8 *level, bool *LFP, bool *LFG) {
	_CP(Database_GetCharacterInfoForLogin_result);
	
    MYSQL_ROW row;
	unsigned long* lengths;
	
	if (mysql_num_rows(result) == 1) {
		row = mysql_fetch_row(result);
		lengths = mysql_fetch_lengths(result);
		if (pp && pplen) {
			if (lengths[1] == sizeof(PlayerProfile_Struct)) {
				memcpy(pp, row[1], sizeof(PlayerProfile_Struct));
			} else {
				LogFile->write(EQEMuLog::Error, "Player profile length mismatch in GetCharacterInfo Expected: %i, Got: %i",
					sizeof(PlayerProfile_Struct), lengths[1]);
				return false;
			}
			
			*pplen = lengths[1];
			pp->zone_id = GetZoneID(row[2]);
			pp->zoneInstance = atoi(row[13]);
			
			pp->x = atof(row[3]);
			pp->y = atof(row[4]);
			pp->z = atof(row[5]);

			pp->lastlogin = time(NULL);
			
			if (pp->x == -1 && pp->y == -1 && pp->z == -1)
				GetSafePoints(pp->zone_id, &pp->x, &pp->y, &pp->z);
		}
		
		uint32 char_id = atoi(row[0]);
		if (RuleB(Character, SharedBankPlat))
			pp->platinum_shared = database.GetSharedPlatinum(GetAccountIDByChar(char_id));
		if (character_id)
			*character_id = char_id;
		if (current_zone)
			strcpy(current_zone, row[2]);

		if (guilddbid) {
			if(row[6] != NULL)
				*guilddbid = atoi(row[6]);
			else
				*guilddbid = GUILD_NONE;
		}
		if (guildrank) {
			if(row[7] != NULL)
				*guildrank = atoi(row[7]);
			else
				*guildrank = GUILD_RANK_NONE;
		}
		
		if(ext) {
			//SetExtendedProfile handles any conversion
			SetExtendedProfile(ext, row[8], lengths[8]);
		}
		
		if(class_)
			*class_ = atoi(row[9]);
		
		if(level)
			*level = atoi(row[10]);

		if(LFP)
			*LFP = atoi(row[11]);
		
		if(LFG)
			*LFG = atoi(row[12]);
		// Fix use_tint, previously it was set to 1 for a dyed slot, client wants it set to 0xFF
		for(int i = 0; i<9; i++)
			if(pp->item_tint[i].rgb.use_tint == 1)
				pp->item_tint[i].rgb.use_tint = 0xFF;
		
		// Retrieve character inventory
		return GetInventory(char_id, inv);
	}
	
	return false;
}

bool ZoneDatabase::NoRentExpired(const char* name){
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	if (RunQuery(query, MakeAnyLenString(&query, "Select (UNIX_TIMESTAMP(NOW())-timelaston) from character_ where name='%s'", name), errbuf, &result)) {
		safe_delete_array(query);
		if (mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			int32 seconds = atoi(row[0]);
			mysql_free_result(result);
			return (seconds>1800);
		}
	}
	return false;
}


void ZoneDatabase::LoadItemStatus() {
	memset(item_minstatus, 0, sizeof(item_minstatus));
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	int32 tmp;
	if (RunQuery(query, MakeAnyLenString(&query, "Select id, minstatus from items where minstatus > 0"), errbuf, &result)) {
		safe_delete_array(query);
		while ((row = mysql_fetch_row(result)) && row[0] && row[1]) {
			tmp = atoi(row[0]);
			if (tmp < MAX_ITEM_ID)
				item_minstatus[tmp] = atoi(row[1]);
		}
		mysql_free_result(result);
	}
	else {
		cout << "Error in LoadItemStatus query: '" << query << "'" << endl;
		safe_delete_array(query);
	}
}

bool ZoneDatabase::DBSetItemStatus(int32 id, int8 status) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;
	if (!RunQuery(query, MakeAnyLenString(&query, "Update items set minstatus=%u where id=%u", status, id), errbuf, 0, &affected_rows)) {
		cout << "Error in LoadItemStatus query: '" << query << "'" << endl;
	}
	safe_delete_array(query);
	return (bool) (affected_rows == 1);
}


/* Searches npctable for matchind id, and returns the item if found,
 * or NULL otherwise. If id passed is 0, loads all npc_types for
 * the current zone, returning the last item added.
 */
const NPCType* ZoneDatabase::GetNPCType (uint32 id) {
	const NPCType *npc=NULL;
	map<uint32,NPCType *>::iterator itr;

	// If NPC is already in tree, return it.
	if((itr = zone->npctable.find(id)) != zone->npctable.end())
		return itr->second;
   
   // Otherwise, get NPCs from database.
		char errbuf[MYSQL_ERRMSG_SIZE];
		char *query = 0;
		MYSQL_RES *result;
		MYSQL_ROW row;


      // If id is 0, load all npc_types for the current zone,
      // according to spawn2.
      const char *basic_query = "SELECT "
			"npc_types.id,"
			"npc_types.name,"
			"npc_types.level,"
            "npc_types.race,"
			"npc_types.class,"
			"npc_types.hp,"
            "npc_types.gender,"
			"npc_types.texture,"
			"npc_types.helmtexture,"
            "npc_types.size,"
			"npc_types.loottable_id,"
            "npc_types.merchant_id,"
			"npc_types.adventure_template_id,"
			"npc_types.trap_template,"
			"npc_types.attack_speed,"
            "npc_types.STR,"
			"npc_types.STA,"
			"npc_types.DEX,"
			"npc_types.AGI,"
            "npc_types._INT,"
			"npc_types.WIS,"
			"npc_types.CHA,"
            "npc_types.MR,"
			"npc_types.CR,"
			"npc_types.DR,"
			"npc_types.FR,"
			"npc_types.PR,"
            "npc_types.mindmg,"
            "npc_types.maxdmg,"
			"npc_types.npcspecialattks,"
            "npc_types.npc_spells_id,"
			"npc_types.d_meele_texture1,"
            "npc_types.d_meele_texture2,"
			"npc_types.prim_melee_type,"
			"npc_types.sec_melee_type,"
            "npc_types.runspeed,"
			"npc_types.findable,"
			"npc_types.trackable,"
            "npc_types.hp_regen_rate,"
			"npc_types.mana_regen_rate,"
            "npc_types.aggroradius,"
			"npc_types.bodytype,"
            "npc_types.npc_faction_id,"
			"npc_types.face,"
            "npc_types.luclin_hairstyle,"
			"npc_types.luclin_haircolor,"
            "npc_types.luclin_eyecolor,"
			"npc_types.luclin_eyecolor2,"
            "npc_types.luclin_beardcolor,"
			"npc_types.luclin_beard,"
			"npc_types.drakkin_heritage,"
			"npc_types.drakkin_tattoo,"
			"npc_types.drakkin_details,"
			"npc_types.armortint_id,"
			"npc_types.armortint_red,"
			"npc_types.armortint_green,"
			"npc_types.armortint_blue,"
            "npc_types.see_invis,"
			"npc_types.see_invis_undead,"
            "npc_types.lastname,"
			"npc_types.qglobal,"
			"npc_types.AC,"
            "npc_types.npc_aggro,"
			"npc_types.spawn_limit,"
			"npc_types.see_hide,"
			"npc_types.see_improved_hide,"
			"npc_types.ATK,"
			"npc_types.Accuracy,"
			"npc_types.slow_mitigation,"
			"npc_types.maxlevel,"
			"npc_types.scalerate,"
			"npc_types.private_corpse,"
			"npc_types.unique_spawn_by_name";

		MakeAnyLenString(&query, "%s FROM npc_types WHERE id=%d", basic_query, id);

		if (RunQuery(query, strlen(query), errbuf, &result)) {
         // Process each row returned.
			while((row = mysql_fetch_row(result))) {
				NPCType *tmpNPCType;
				tmpNPCType = new NPCType;
				memset (tmpNPCType, 0, sizeof *tmpNPCType);
				
				int r = 0;
				tmpNPCType->npc_id = atoi(row[r++]);
				
				strncpy(tmpNPCType->name, row[r++], 50);

				tmpNPCType->level = atoi(row[r++]);
				tmpNPCType->race = atoi(row[r++]);
				tmpNPCType->class_ = atoi(row[r++]);
				tmpNPCType->max_hp = atoi(row[r++]);
				tmpNPCType->cur_hp = tmpNPCType->max_hp;
				tmpNPCType->gender = atoi(row[r++]);
				tmpNPCType->texture = atoi(row[r++]);
				tmpNPCType->helmtexture = atoi(row[r++]);
				tmpNPCType->size = atof(row[r++]);
				tmpNPCType->loottable_id = atoi(row[r++]);
				tmpNPCType->merchanttype = atoi(row[r++]);
				tmpNPCType->adventure_template = atoi(row[r++]);
				tmpNPCType->trap_template = atoi(row[r++]);
				tmpNPCType->attack_speed = atof(row[r++]);
				tmpNPCType->STR = atoi(row[r++]);
				tmpNPCType->STA = atoi(row[r++]);
				tmpNPCType->DEX = atoi(row[r++]);
				tmpNPCType->AGI = atoi(row[r++]);
				tmpNPCType->INT = atoi(row[r++]);
				tmpNPCType->WIS = atoi(row[r++]);
				tmpNPCType->CHA = atoi(row[r++]);
				tmpNPCType->MR = atoi(row[r++]);
				tmpNPCType->CR = atoi(row[r++]);
				tmpNPCType->DR = atoi(row[r++]);
				tmpNPCType->FR = atoi(row[r++]);
				tmpNPCType->PR = atoi(row[r++]);
				tmpNPCType->min_dmg = atoi(row[r++]);
				tmpNPCType->max_dmg = atoi(row[r++]);
				strcpy(tmpNPCType->npc_attacks,row[r++]);
				tmpNPCType->npc_spells_id = atoi(row[r++]);
				tmpNPCType->d_meele_texture1 = atoi(row[r++]);
				tmpNPCType->d_meele_texture2 = atoi(row[r++]);
				tmpNPCType->prim_melee_type = atoi(row[r++]);
				tmpNPCType->sec_melee_type = atoi(row[r++]);
 				tmpNPCType->runspeed= atof(row[r++]);
				tmpNPCType->findable = atoi(row[r++]) == 0? false : true;
				tmpNPCType->trackable = atoi(row[r++]) == 0? false : true;
				tmpNPCType->hp_regen = atoi(row[r++]);
				tmpNPCType->mana_regen = atoi(row[r++]);
				
				tmpNPCType->aggroradius = (sint32)atoi(row[r++]);
				// set defaultvalue for aggroradius
				if (tmpNPCType->aggroradius <= 0)
					tmpNPCType->aggroradius = 70;

				if (row[r] && strlen(row[r]))
					tmpNPCType->bodytype = (int8)atoi(row[r]);
				else
					tmpNPCType->bodytype = 0;
				r++;
				
				tmpNPCType->npc_faction_id = atoi(row[r++]);
				
				tmpNPCType->luclinface = atoi(row[r++]);
				tmpNPCType->hairstyle = atoi(row[r++]);
				tmpNPCType->haircolor = atoi(row[r++]);
				tmpNPCType->eyecolor1 = atoi(row[r++]);
				tmpNPCType->eyecolor2 = atoi(row[r++]);
				tmpNPCType->beardcolor = atoi(row[r++]);
				tmpNPCType->beard = atoi(row[r++]);
				tmpNPCType->drakkin_heritage = atoi(row[r++]);
				tmpNPCType->drakkin_tattoo = atoi(row[r++]);
				tmpNPCType->drakkin_details = atoi(row[r++]);
				uint32 armor_tint_id = atoi(row[r++]);
				tmpNPCType->armor_tint[0] = (atoi(row[r++]) & 0xFF) << 16;
				tmpNPCType->armor_tint[0] |= (atoi(row[r++]) & 0xFF) << 8;
				tmpNPCType->armor_tint[0] |= (atoi(row[r++]) & 0xFF);
				tmpNPCType->armor_tint[0] |= (tmpNPCType->armor_tint[0]) ? (0xFF << 24) : 0;

				int i;
				if (armor_tint_id > 0)
				{
					if (tmpNPCType->armor_tint[0] == 0)
					{
						char at_errbuf[MYSQL_ERRMSG_SIZE];
						char *at_query = NULL;
						MYSQL_RES *at_result = NULL;
						MYSQL_ROW at_row;

						MakeAnyLenString(&at_query,
						"SELECT "
						"red1h,grn1h,blu1h,"
						"red2c,grn2c,blu2c,"
						"red3a,grn3a,blu3a,"
						"red4b,grn4b,blu4b,"
						"red5g,grn5g,blu5g,"
						"red6l,grn6l,blu6l,"
						"red7f,grn7f,blu7f,"
						"red8x,grn8x,blu8x,"
						"red9x,grn9x,blu9x "
						"FROM npc_types_tint WHERE id=%d", armor_tint_id);

						if (RunQuery(at_query, strlen(at_query), at_errbuf, &at_result))
						{
							if ((at_row = mysql_fetch_row(at_result)))
							{
								for (i = 0; i < MAX_MATERIALS; i++)
								{
									tmpNPCType->armor_tint[i] = atoi(at_row[i * 3]) << 16;
									tmpNPCType->armor_tint[i] |= atoi(at_row[i * 3 + 1]) << 8;
									tmpNPCType->armor_tint[i] |= atoi(at_row[i * 3 + 2]);
									tmpNPCType->armor_tint[i] |= (tmpNPCType->armor_tint[i]) ? (0xFF << 24) : 0;
								}
							}
							else
							{
								armor_tint_id = 0;
							}
						}
						else
						{
							armor_tint_id = 0;
						}

						if (at_result)
						{
							mysql_free_result(at_result);
						}

						safe_delete_array(at_query);
					}
					else
					{
						armor_tint_id = 0;
					}
				}

				if (armor_tint_id == 0)
				{
					for (i = 1; i < MAX_MATERIALS; i++)
					{
						tmpNPCType->armor_tint[i] = tmpNPCType->armor_tint[0];
					}
				}

				tmpNPCType->see_invis = atoi(row[r++])==0?false:true;			// Set see_invis flag
				tmpNPCType->see_invis_undead = atoi(row[r++])==0?false:true;	// Set see_invis_undead flag
				if (row[r] != NULL)
					strncpy(tmpNPCType->lastname, row[r], 32);
				r++;
				
				tmpNPCType->qglobal = atoi(row[r++])==0?false:true;	// qglobal
				tmpNPCType->AC = atoi(row[r++]);
				tmpNPCType->npc_aggro = atoi(row[r++])==0?false:true;
				tmpNPCType->spawn_limit = atoi(row[r++]);
				tmpNPCType->see_hide = atoi(row[r++])==0?false:true;
				tmpNPCType->see_improved_hide = atoi(row[r++])==0?false:true;
				tmpNPCType->ATK = atoi(row[r++]);
				tmpNPCType->accuracy_rating = atoi(row[r++]);
				tmpNPCType->slow_mitigation = atoi(row[r++]);
				tmpNPCType->maxlevel = atoi(row[r++]);
				tmpNPCType->scalerate = atoi(row[r++]);
				tmpNPCType->private_corpse = atoi(row[r++]) == 1 ? true : false;
				tmpNPCType->unique_spawn_by_name = atoi(row[r++]) == 1 ? true : false;

				// If NPC with duplicate NPC id already in table,
				// free item we attempted to add.
				if (zone->npctable.find(tmpNPCType->npc_id) != zone->npctable.end())
				{
					cerr << "Error loading duplicate NPC " << tmpNPCType->npc_id << endl;
					delete tmpNPCType;
					npc = NULL;
				} else {
					zone->npctable[tmpNPCType->npc_id]=tmpNPCType;
					npc = tmpNPCType;
				}

//				Sleep(0);
			}

			if (result) {
				mysql_free_result(result);
			}
		} else
			cerr << "Error loading NPCs from database. Bad query: " << errbuf << endl;
      safe_delete_array(query);

   return npc;
}


int8 ZoneDatabase::GetGridType(int32 grid, int32 zoneid ) {
	char *query = 0;
	char errbuf[MYSQL_ERRMSG_SIZE];
	MYSQL_RES *result;
	MYSQL_ROW row;
	int type = 0;
	if (RunQuery(query, MakeAnyLenString(&query,"SELECT type from grid where id = %i and zoneid = %i",grid,zoneid),errbuf,&result)) {
		safe_delete_array(query);
		if (mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			type = atoi( row[0] );
		}
			mysql_free_result(result);
	} else {
		cerr << "Error in GetGridType query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
	}
	return type;
}



void ZoneDatabase::SaveMerchantTemp(int32 npcid, int32 slot, int32 item, int32 charges){
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;

	if (!RunQuery(query, MakeAnyLenString(&query, "replace into merchantlist_temp (npcid,slot,itemid,charges) values(%d,%d,%d,%d)", npcid, slot, item, charges), errbuf)) {
		cerr << "Error in SaveMerchantTemp query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);	
}
void ZoneDatabase::DeleteMerchantTemp(int32 npcid, int32 slot){
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;

	if (!RunQuery(query, MakeAnyLenString(&query, "delete from merchantlist_temp where npcid=%d and slot=%d", npcid, slot), errbuf)) {
		cerr << "Error in DeleteMerchantTemp query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);	
}


bool ZoneDatabase::UpdateZoneSafeCoords(const char* zonename, float x=0, float y=0, float z=0) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	int32	affected_rows = 0;
	
	if (!RunQuery(query, MakeAnyLenString(&query, "UPDATE zone SET safe_x='%f', safe_y='%f', safe_z='%f' WHERE short_name='%s';", x, y, z, zonename), errbuf, 0, &affected_rows)) {
		safe_delete_array(query);
		return false;
	}
	safe_delete_array(query);
	
	if (affected_rows == 0)
	{
		return false;
	}
	
	return true;
}


int8 ZoneDatabase::GetUseCFGSafeCoords()
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM variables WHERE varname='UseCFGSafeCoords'"), errbuf, &result)) {
		safe_delete_array(query);
		if (mysql_num_rows(result) == 1)
		{
			row = mysql_fetch_row(result);

			int8 usecoords = atoi(row[0]);
			mysql_free_result(result);
			return usecoords;
		}
		else
		{
			mysql_free_result(result);
			return 0;
		}
		mysql_free_result(result);
	}
	else
	{
		
		cerr << "Error in GetUseCFGSafeCoords query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}
	
	return 0;
	
}


int32 ZoneDatabase::GetServerFilters(char* name, ServerSideFilters_Struct *ssfs) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;

    MYSQL_ROW row;
	
	
	unsigned long* lengths;
	
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT serverfilters FROM account WHERE name='%s'", name), errbuf, &result)) {
		safe_delete_array(query);
		if (mysql_num_rows(result) == 1) {	
			row = mysql_fetch_row(result);
			lengths = mysql_fetch_lengths(result);
			if (lengths[0] == sizeof(ServerSideFilters_Struct)) {
				memcpy(ssfs, row[0], sizeof(ServerSideFilters_Struct));
			}
			else {
				cerr << "Player profile length mismatch in ServerSideFilters" << endl;
				mysql_free_result(result);
				return 0;
			}
		}
		else {
			mysql_free_result(result);
			return 0;

		}
		int32 len = lengths[0];
		mysql_free_result(result);
		return len;
	}
	else {
		cerr << "Error in ServerSideFilters query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return 0;
	}
	
	return 0;
}

bool ZoneDatabase::SetServerFilters(char* name, ServerSideFilters_Struct *ssfs) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char query[256+sizeof(ServerSideFilters_Struct)*2+1];
	char* end = query;
	
	//if (strlen(name) > 15)
	//	return false;
	
	/*for (int i=0; i<strlen(name); i++)
	{
	if ((name[i] < 'a' || name[i] > 'z') && 
	(name[i] < 'A' || name[i] > 'Z') && 
	(name[i] < '0' || name[i] > '9'))
	return 0;
}*/
	
	
	end += sprintf(end, "UPDATE account SET serverfilters=");
	*end++ = '\'';
    end += DoEscapeString(end, (char*)ssfs, sizeof(ServerSideFilters_Struct));
    *end++ = '\'';
    end += sprintf(end," WHERE name='%s'", name);
	
	int32 affected_rows = 0;
    if (!RunQuery(query, (int32) (end - query), errbuf, 0, &affected_rows)) {
        cerr << "Error in SetServerSideFilters query " << errbuf << endl;
		return false;
    }
	
	if (affected_rows == 0) {
		return false;
	}
	
	return true;
}


//New functions for timezone
int32 ZoneDatabase::GetZoneTZ(int32 zoneid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT timezone FROM zone WHERE zoneidnumber=%i", zoneid), errbuf, &result))
	{
		safe_delete_array(query);
		if (mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			int32 tmp = atoi(row[0]);
			mysql_free_result(result);
			return tmp;
		}
		mysql_free_result(result);
	}
	else {
		cerr << "Error in GetZoneTZ query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
	}
	return 0;
}

bool ZoneDatabase::SetZoneTZ(int32 zoneid, int32 tz) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	int32 affected_rows = 0;
	
	if (RunQuery(query, MakeAnyLenString(&query, "UPDATE zone SET timezone=%i WHERE zoneidnumber=%i", tz, zoneid), errbuf, 0, &affected_rows)) {
		safe_delete_array(query);

		if (affected_rows == 1)
			return true;
		else
			return false;
	}
	else {
		cerr << "Error in SetZoneTZ query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}
	
	return false;
}
//End new timezone functions.


//Functions for weather
int8 ZoneDatabase::GetZoneWeather(int32 zoneid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT weather FROM zone WHERE zoneidnumber=%i", zoneid), errbuf, &result))
	{
		safe_delete_array(query);
		if (mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			int8 tmp = atoi(row[0]);
			mysql_free_result(result);
			return tmp;

		}
		mysql_free_result(result);
	}

	else {
		cerr << "Error in GetZoneWeather query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
	}
	return 0;
}

bool ZoneDatabase::SetZoneWeather(int32 zoneid, int8 w) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	int32 affected_rows = 0;
	
	if (RunQuery(query, MakeAnyLenString(&query, "UPDATE zone SET weather=%i WHERE zoneidnumber=%i", w, zoneid), errbuf, 0, &affected_rows)) {
		safe_delete_array(query);
		if (affected_rows == 1)
			return true;
		else
			return false;
	}
	else {
		cerr << "Error in SetZoneWeather query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}
	
	return false;
}
//End weather functions.

/*
 solar: this is never actually called, client_process starts an async query
 instead and uses GetAccountInfoForLogin_result to process it..
 */
bool ZoneDatabase::GetAccountInfoForLogin(int32 account_id, sint16* admin, char* account_name, int32* lsaccountid, int8* gmspeed, bool* revoked,bool* gmhideme) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
	
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT status, name, lsaccount_id, gmspeed, revoked, hideme FROM account WHERE id=%i", account_id), errbuf, &result)) {
		safe_delete_array(query);
		bool ret = GetAccountInfoForLogin_result(result, admin, account_name, lsaccountid, gmspeed, revoked,gmhideme);
		mysql_free_result(result);
		return ret;
	}
	else
	{
		cerr << "Error in GetAccountInfoForLogin query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}
	
	return false;
}

void ZoneDatabase::RefreshGroupFromDB(Client *c){
	if(!c){
		return;
	}

	Group *g = c->GetGroup();

	if(!g){
		return;
	}

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_GroupUpdate,sizeof(GroupUpdate2_Struct));
	GroupUpdate2_Struct* gu = (GroupUpdate2_Struct*)outapp->pBuffer;	
	gu->action = groupActUpdate;
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	strcpy(gu->yourname, c->GetName());
	GetGroupLeadershipInfo(g->GetID(), gu->leadersname, NULL, NULL, &gu->leader_aas);
	gu->NPCMarkerID = g->GetNPCMarkerID();

	int index = 0;
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT name from group_id where groupid=%d", g->GetID()), errbuf, &result)) {
		while((row = mysql_fetch_row(result))){
			if(index < 6){
				if(strcmp(c->GetName(), row[0]) != 0){
					strcpy(gu->membername[index], row[0]);
					index++;
				}
			}
		}
		mysql_free_result(result);
	}
	else
	{
		printf("Error in group update query: %s\n", errbuf);
	}
	safe_delete_array(query);

	c->QueuePacket(outapp);
	safe_delete(outapp);
	//g->NotifyMainAssist(c);
	//g->NotifyMarkNPC(c);
	g->NotifyTarget(c);
	g->SendMarkedNPCsToMember(c);

}

int8 ZoneDatabase::GroupCount(int32 groupid){
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	int8 count=0;
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT count(charid) FROM group_id WHERE groupid=%d", groupid), errbuf, &result)) {
		if((row = mysql_fetch_row(result))!=NULL)
			count = atoi(row[0]);
		mysql_free_result(result);
	} else {
		LogFile->write(EQEMuLog::Error, "Error in ZoneDatabase::GroupCount query '%s': %s", query, errbuf);		
	}
	safe_delete_array(query);
	return count;
}

 int8 ZoneDatabase::RaidGroupCount(int32 raidid, int32 groupid)
 {
 	char errbuf[MYSQL_ERRMSG_SIZE];
     char *query = 0;
     MYSQL_RES *result;
     MYSQL_ROW row;
 	int8 count=0;
 	if (RunQuery(query, MakeAnyLenString(&query, "SELECT count(charid) FROM raid_members WHERE raidid=%d AND groupid=%d;", raidid, groupid), errbuf, &result)) {
 		if((row = mysql_fetch_row(result))!=NULL)
 			count = atoi(row[0]);
 		mysql_free_result(result);
 	} else {
 		LogFile->write(EQEMuLog::Error, "Error in ZoneDatabase::RaidGroupCount query '%s': %s", query, errbuf);		
 	}
 	safe_delete_array(query);
 	return count;
 }

sint32 ZoneDatabase::GetBlockedSpellsCount(int32 zoneid)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;

    MYSQL_RES *result;
    MYSQL_ROW row;
	query = new char[256];
	sprintf(query, "SELECT count(*) FROM blocked_spells WHERE zoneid=%d", zoneid);
	if (RunQuery(query, strlen(query), errbuf, &result)) {
		safe_delete_array(query);
		row = mysql_fetch_row(result);
		if (row != NULL && row[0] != 0) {
			sint32 ret = atoi(row[0]);
			mysql_free_result(result);
			return ret;
		}
		mysql_free_result(result);
	}
	else {
		cerr << "Error in GetBlockedSpellsCount query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return -1;
	}
	
	return -1;
}

bool ZoneDatabase::LoadBlockedSpells(sint32 blockedSpellsCount, ZoneSpellsBlocked* into, int32 zoneid)
{
	LogFile->write(EQEMuLog::Status, "Loading Blocked Spells from database...");

	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;

	MakeAnyLenString(&query, "SELECT id, spellid, type, x, y, z, x_diff, y_diff, z_diff, message "
		"FROM blocked_spells WHERE zoneid=%d ORDER BY id asc", zoneid);
	if (RunQuery(query, strlen(query), errbuf, &result)) {
		safe_delete_array(query);
		sint32 r;
		for(r = 0; (row = mysql_fetch_row(result)); r++) {
			if(r >= blockedSpellsCount) {
				cerr << "Error, Blocked Spells Count of " << blockedSpellsCount << " exceeded." << endl;
				break;
			}
			memset(&into[r], 0, sizeof(ZoneSpellsBlocked));
			if(row){
				into[r].spellid = atoi(row[1]);
				into[r].type = atoi(row[2]);
				into[r].x = atof(row[3]);
				into[r].y = atof(row[4]);
				into[r].z = atof(row[5]);
				into[r].xdiff = atof(row[6]);
				into[r].ydiff = atof(row[7]);
				into[r].zdiff = atof(row[8]);
				strncpy(into[r].message, row[9], 255);
				into[r].message[255] = '\0';
			}
		}
		mysql_free_result(result);
	}
	else
	{
		cerr << "Error in LoadBlockedSpells query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}
	return true;
}

int ZoneDatabase::getZoneShutDownDelay(int32 zoneID)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT shutdowndelay FROM zone WHERE zoneidnumber=%i", zoneID), errbuf, &result))
	{
		if (mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			int retVal = atoi(row[0]);

			mysql_free_result(result);
			safe_delete_array(query);
			return (retVal);
		}
		else {
			cerr << "Error in getZoneShutDownDelay (more than one result) query '" << query << "' " << errbuf << endl;
			mysql_free_result(result);
			safe_delete_array(query);
			return (RuleI(Zone, AutoShutdownDelay));
		}
	}
	else {
		cerr << "Error in getZoneShutDownDelay query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
	}
	return (RuleI(Zone, AutoShutdownDelay));
}

int32 ZoneDatabase::GetKarma(int32 acct_id)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	int32 ret_val = 0;

	if (!RunQuery(query,MakeAnyLenString(&query, "select `karma` from `account` where `id`='%i' limit 1",
		acct_id),errbuf,&result))
	{
		safe_delete_array(query);
		return 0;
	}

	safe_delete_array(query);
	row = mysql_fetch_row(result);

	ret_val = atoi(row[0]);

	mysql_free_result(result);

	return ret_val;
}

void ZoneDatabase::UpdateKarma(int32 acct_id, int32 amount)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	int32 affected_rows = 0;

	if (RunQuery(query, MakeAnyLenString(&query, "UPDATE account set karma=%i where id=%i", amount, acct_id), errbuf, 0, &affected_rows)){
		safe_delete_array(query);}
	else {
		cerr << "Error in UpdateKarma query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
	}
}

void ZoneDatabase::ListAllInstances(Client* c, int32 charid)
{
	if(!c)
		return;


	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;


	if (RunQuery(query,MakeAnyLenString(&query, "SELECT instance_lockout.id, zone, version FROM instance_lockout JOIN"
		" instance_lockout_player ON instance_lockout.id = instance_lockout_player.id"
		" WHERE instance_lockout_player.charid=%lu", (unsigned long)charid),errbuf,&result))
	{
		safe_delete_array(query);

		char name[64];
		database.GetCharName(charid, name);
		c->Message(0, "%s is part of the following instances:", name);
		while(row = mysql_fetch_row(result))
		{
			c->Message(0, "%s - id: %lu, version: %lu", database.GetZoneName(atoi(row[1])), 
				(unsigned long)atoi(row[0]), (unsigned long)atoi(row[2]));
		}

		mysql_free_result(result);
	}
	else
	{
		safe_delete_array(query);
	}
}

void ZoneDatabase::QGlobalPurge()
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	database.RunQuery(query, MakeAnyLenString(&query, "DELETE FROM quest_globals WHERE expdate < UNIX_TIMESTAMP()"), 
		errbuf);
	safe_delete_array(query);
}
