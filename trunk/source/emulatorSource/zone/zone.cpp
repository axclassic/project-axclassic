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
#include "../common/debug.h"
#include <iostream>
using namespace std;
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <float.h>
#include <time.h>
#include <math.h>

#ifdef WIN32
#include <process.h>
#define	 snprintf	_snprintf
#define  vsnprintf	_vsnprintf
#else
#include <pthread.h>
#include "../common/unix.h"
#endif

#include "masterentity.h"
#include "features.h"
#include "spawngroup.h"
#include "spawn2.h"
#include "zone.h"
#include "worldserver.h"
#include "npc.h"
#include "net.h"
#include "../common/seperator.h"
#include "../common/packet_dump_file.h"
#include "../common/EQStreamFactory.h"
#include "../common/EQStream.h"
#include "ZoneConfig.h"
#include "../common/breakdowns.h"
#include "map.h"
#include "watermap.h"
#include "object.h"
#include "petitions.h"
#include "pathing.h"
#include "../common/files.h"
#include "parser.h"
#include "event_codes.h"
#include "client_logs.h"
#include "../common/rulesys.h"
#include "guild_mgr.h"

#ifdef WIN32
#define snprintf	_snprintf
#define strncasecmp	_strnicmp
#define strcasecmp  _stricmp
#endif


extern WorldServer worldserver;
extern Zone* zone;
extern int32 numclients;
extern NetConnection net;
extern int16 adverrornum;
extern PetitionList petition_list;
Mutex MZoneShutdown;
extern bool staticzone;
Zone* zone = 0;
volatile bool ZoneLoaded = false;
extern Parser* parse;
extern DBAsyncFinishedQueue MTdbafq;
extern DBAsync *dbasync;
void CleanupLoadZoneState(int32 spawn2_count, ZSDump_Spawn2** spawn2_dump, ZSDump_NPC** npc_dump, ZSDump_NPC_Loot** npcloot_dump, NPCType** gmspawntype_dump, Spawn2*** spawn2_loaded, NPC*** npc_loaded, MYSQL_RES** result);

bool Zone::Bootup(int32 iZoneID, int32 iInstanceID, bool iStaticZone) {
	_ZP(Zone_Bootup);
	const char* zonename = database.GetZoneName(iZoneID);
	
	if (iZoneID == 0 || zonename == 0)
		return false;
	srand(time(NULL));
	if (zone != 0 || ZoneLoaded) {
		cerr << "Error: Zone::Bootup call when zone already booted!" << endl;
		worldserver.SetZone(0);
		return false;
	}
	
	LogFile->write(EQEMuLog::Status, "Booting %s (%d:%d)", zonename, iZoneID, iInstanceID);
	
	numclients = 0;
	zone = new Zone(iZoneID, iInstanceID, zonename);
	
	//init the zone, loads all the data, etc
	if (!zone->Init(iStaticZone)) {
		safe_delete(zone);
		cerr << "Zone->Init failed" << endl;
		worldserver.SetZone(0);
		return false;
	}
	
	char tmp[10];
	//PlayerProfile_Struct* pp;
	//int char_num = 0;
	//unsigned long* lengths;
	if (database.GetVariable("loglevel",tmp, 9)) {
		int blah[4];
		if (atoi(tmp)>9){ //Server is using the new code
			for(int i=0;i<4;i++){
				if (((int)tmp[i]>=48) && ((int)tmp[i]<=57))
					blah[i]=(int)tmp[i]-48; //get the value to convert it to an int from the ascii value
				else
					blah[i]=0; //set to zero on a bogue char
			}
			zone->loglevelvar = blah[0];
			LogFile->write(EQEMuLog::Status, "General logging level: %i", zone->loglevelvar);
			zone->merchantvar = blah[1];
			LogFile->write(EQEMuLog::Status, "Merchant logging level: %i", zone->merchantvar);
			zone->tradevar = blah[2];
			LogFile->write(EQEMuLog::Status, "Trade logging level: %i", zone->tradevar);
			zone->lootvar = blah[3];
			LogFile->write(EQEMuLog::Status, "Loot logging level: %i", zone->lootvar);
		}
		else {
        	zone->loglevelvar = int8(atoi(tmp)); //continue supporting only command logging (for now)
			zone->merchantvar = 0;
			zone->tradevar = 0;
			zone->lootvar = 0;
		}
	}

	zone->weather_type = database.GetZoneWeather(iZoneID);

	LogFile->write(EQEMuLog::Debug, "Zone: %s has weather of type %i.", zonename, zone->weather_type);
		
	if(zone->weather_type > 3 || zone->weather_type == 0) {
		zone->zone_weather = 0;
		zone->Weather_Timer->Disable();
		LogFile->write(EQEMuLog::Debug, "Zone: %s(%i) has no weather type. The weather timer has been disabled.", zonename, iZoneID);
	}
	else {
		zone->zone_weather = 0;
		LogFile->write(EQEMuLog::Debug, "Zone: %s(%i) has weather type = %i. The weather timer has been enabled.", zonename, iZoneID, zone->weather_type);
	}

	ZoneLoaded = true;

	worldserver.SetZone(iZoneID, iInstanceID);
	LogFile->write(EQEMuLog::Normal, "---- Zone server %s, listening on port:%i ----", zonename, ZoneConfig::get()->ZonePort);
	LogFile->write(EQEMuLog::Status, "Zone Bootup: %s (%i: %i)", zonename, iZoneID, iInstanceID);
	UpdateWindowTitle();
	zone->GetTimeSync();

	return true;
}

//this really loads the objects into entity_list
bool Zone::LoadZoneObjects() {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = NULL;
	MYSQL_RES *result;
	MYSQL_ROW row;
	
	uint32 len_query = MakeAnyLenString(&query, "SELECT "
		"id,zoneid,xpos,ypos,zpos,heading,itemid,charges,objectname,type,icon,"
		"unknown08,unknown10,unknown20,unknown24,unknown60,unknown64,unknown68,"
		"unknown72,unknown76 from object where zoneid=%i and version=%u", zoneid, instanceversion);
	
	if (database.RunQuery(query, len_query, errbuf, &result)) {
		safe_delete_array(query);
		LogFile->write(EQEMuLog::Status, "Loading Objects from DB...");
		while ((row = mysql_fetch_row(result))) {
			if (atoi(row[9]) == 0)
			{
				// Type == 0 - Static Object
				const char* shortname = database.GetZoneName(atoi(row[1]), false); // zoneid -> zone_shortname

				if (shortname)
				{
					Door d;
					memset(&d, 0, sizeof(d));

					strncpy(d.zone_name, shortname, sizeof(d.zone_name));
					d.db_id = 1000000000 + atoi(row[0]); // Out of range of normal use for doors.id
					d.door_id = -1; // Client doesn't care if these are all the same door_id
					d.pos_x = atof(row[2]); // xpos
					d.pos_y = atof(row[3]); // ypos
					d.pos_z = atof(row[4]); // zpos
					d.heading = atof(row[5]); // heading

					strncpy(d.door_name, row[8], sizeof(d.door_name)); // objectname
					// Strip trailing "_ACTORDEF" if present. Client won't accept it for doors.
					int len = strlen(d.door_name);
					if ((len > 9) && (memcmp(&d.door_name[len - 9], "_ACTORDEF", 10) == 0))
					{
						d.door_name[len - 9] = '\0';
					}
					  
					memcpy(d.dest_zone, "NONE", 5);
					  
					if ((d.size = atoi(row[11])) == 0) // unknown08 = optional size percentage
					{
						d.size = 100;
					}

					switch (d.opentype = atoi(row[12])) // unknown10 = optional request_nonsolid (0 or 1 or experimental number)
					{
						case 0:
							d.opentype = 31;
							break;
						case 1:
							d.opentype = 9;
							break;
					}

					d.incline = atoi(row[13]); // unknown20 = optional model incline value

					Doors* door = new Doors(&d);
					entity_list.AddDoor(door);
				}

				continue;
			}
			Object_Struct data = {0};
			uint32 id = 0;
			uint32 icon = 0;
			uint32 type = 0;
			uint32 itemid = 0;
			uint32 idx = 0;
			sint8 charges = 0;
			
			id							= (uint32)atoi(row[idx++]);
			data.zone_id				= atoi(row[idx++]);
			data.x						= atof(row[idx++]);
			data.y						= atof(row[idx++]);
			data.z						= atof(row[idx++]);
			data.heading				= atof(row[idx++]);
			itemid						= (uint32)atoi(row[idx++]);
			charges						= (sint8)atoi(row[idx++]);
			strcpy(data.object_name, row[idx++]);
			type						= (int8)atoi(row[idx++]);
			icon						= (uint32)atoi(row[idx++]);
			data.object_type			= (uint32)atoi(row[idx++]);
			data.linked_list_addr[0]	= 0;
			data.linked_list_addr[1]	= 0;
			data.unknown008[0]			= (uint32)atoi(row[idx++]);
			data.unknown008[1]			= (uint32)atoi(row[idx++]);
			data.unknown020				= (uint32)atoi(row[idx++]);
			data.unknown024				= (uint32)atoi(row[idx++]);
//			data.unknown060				= (uint32)atoi(row[idx++]);
															idx++;
			data.unknown064				= (uint32)atoi(row[idx++]);
			data.unknown068				= (uint32)atoi(row[idx++]);
			data.unknown072				= (uint32)atoi(row[idx++]);
			data.unknown076				= (uint32)atoi(row[idx++]);
			data.unknown084				= 0;
			
			ItemInst* inst = NULL;
			//FatherNitwit: this dosent seem to work...
			//tradeskill containers do not have an itemid of 0... at least what I am seeing
			if (itemid == 0) {
				// Generic tradeskill container
				inst = new ItemInst(ItemUseWorldContainer);
			}
			else {
				// Groundspawn object
				inst = database.CreateItem(itemid);
			}
			
			//Father Nitwit's fix... not perfect...
			if(inst == NULL && type != OT_DROPPEDITEM) {
				inst = new ItemInst(ItemUseWorldContainer);
			}
			
			// Load child objects if container
			if (inst && inst->IsType(ItemClassContainer)) {
				database.LoadWorldContainer(id, inst);
			}
			
			Object* object = new Object(id, type, icon, data, inst);
			entity_list.AddObject(object, false);
			if(type == OT_DROPPEDITEM && itemid != 0)
			{
				entity_list.RemoveObject(object->GetID());
			}

			safe_delete(inst);
		}
		mysql_free_result(result);
	}
	else {
		safe_delete_array(query);
		LogFile->write(EQEMuLog::Error, "Error Loading Objects from DB: %s",errbuf);
		return(false);
	}
	return(true);
}

//this also just loads into entity_list, not really into zone
bool Zone::LoadGroundSpawns() {
	Ground_Spawns groundspawn;

	memset(&groundspawn, 0, sizeof(groundspawn));
	int gsindex=0;
	LogFile->write(EQEMuLog::Status, "Loading Ground Spawns from DB...");
	database.LoadGroundSpawns(zoneid, GetInstanceVersion(), &groundspawn);
	int32 ix=0;
	char* name=0;
	int32 gsnumber=0;
	for(gsindex=0;gsindex<50;gsindex++){
		if(groundspawn.spawn[gsindex].item>0 && groundspawn.spawn[gsindex].item<500000){
			ItemInst* inst = NULL;
			inst = database.CreateItem(groundspawn.spawn[gsindex].item);
			gsnumber=groundspawn.spawn[gsindex].max_allowed;
			ix=0;
			if(inst){
				name = groundspawn.spawn[gsindex].name;
				for(ix=0;ix<gsnumber;ix++){
					Object* object = new Object(inst,name,groundspawn.spawn[gsindex].max_x,groundspawn.spawn[gsindex].min_x,groundspawn.spawn[gsindex].max_y,groundspawn.spawn[gsindex].min_y,groundspawn.spawn[gsindex].max_z,groundspawn.spawn[gsindex].heading,groundspawn.spawn[gsindex].respawntimer);//new object with id of 10000+
					entity_list.AddObject(object, false);
				}
				safe_delete(inst);
			}
		}
	}
	return(true);
}

int Zone::SaveTempItem(int32 merchantid, int32 npcid, int32 item, sint32 charges, bool sold){
	int freeslot = 0;
	std::list<MerchantList> merlist = merchanttable[merchantid];
	std::list<MerchantList>::const_iterator itr;
	int32 i = 1;
	for(itr = merlist.begin();itr != merlist.end();itr++){
		MerchantList ml = *itr;
		if(ml.item == item)
			return 0;

		// Account for merchant lists with gaps in them.
		if(ml.slot >= i)
			i = ml.slot + 1;

	}
	std::list<TempMerchantList> tmp_merlist = tmpmerchanttable[npcid];
	std::list<TempMerchantList>::const_iterator tmp_itr;
	bool update_charges = false;
	TempMerchantList ml;
	while(freeslot == 0 && !update_charges){
		freeslot = i;
		for(tmp_itr = tmp_merlist.begin();tmp_itr != tmp_merlist.end();tmp_itr++){
			ml = *tmp_itr;
			if(ml.item == item){
				update_charges = true;
				freeslot = 0;
				break;
			}
			if((ml.slot == i) || (ml.origslot==i)) {
				freeslot=0;
			}
		}
		i++;
	}
	if(update_charges){
		tmp_merlist.clear();
		std::list<TempMerchantList> oldtmp_merlist = tmpmerchanttable[npcid];
		for(tmp_itr = oldtmp_merlist.begin();tmp_itr != oldtmp_merlist.end();tmp_itr++){
			TempMerchantList ml2 = *tmp_itr;
			if(ml2.item != item)
				tmp_merlist.push_back(ml2);
		}
		if(sold)
			ml.charges = ml.charges + charges;
		else
			ml.charges = charges;
		if(!ml.origslot)
			ml.origslot = ml.slot;
		if(charges>0){
			database.SaveMerchantTemp(npcid, ml.origslot, item, ml.charges);
			tmp_merlist.push_back(ml);
		}
		else{
			database.DeleteMerchantTemp(npcid,ml.origslot);
		}
		tmpmerchanttable[npcid] = tmp_merlist;

		if(sold)
			return ml.slot;
		
	}
	if(freeslot){
		if(charges<0) //sanity check only, shouldnt happen
			charges = 255;
		database.SaveMerchantTemp(npcid, freeslot, item, charges);
		tmp_merlist = tmpmerchanttable[npcid];
		TempMerchantList ml2;
		ml2.charges = charges;
		ml2.item = item;
		ml2.npcid = npcid;
		ml2.slot = freeslot;
		ml2.origslot = ml2.slot;
		tmp_merlist.push_back(ml2);
		tmpmerchanttable[npcid] = tmp_merlist;
	}
	return freeslot;
}

uint32 Zone::GetTempMerchantQuantity(int32 NPCID, uint32 Slot) {

 	std::list<TempMerchantList> TmpMerchantList = tmpmerchanttable[NPCID]; 
	std::list<TempMerchantList>::const_iterator Iterator;

	for(Iterator = TmpMerchantList.begin(); Iterator != TmpMerchantList.end(); Iterator++) 
		if((*Iterator).slot == Slot)
			return (*Iterator).charges;

	return 0;
}

void Zone::LoadTempMerchantData(){
	LogFile->write(EQEMuLog::Status, "Loading Temporary Merchant Lists...");

	char* query = 0;
	uint32_breakdown workpt;
	workpt.b4() = DBA_b4_Zone;
	workpt.w2_3() = 0;
	workpt.b1() = DBA_b1_Zone_MerchantListsTemp;
	DBAsyncWork* dbaw = new DBAsyncWork(&database, &MTdbafq, workpt, DBAsync::Read);
	dbaw->AddQuery(1, &query, MakeAnyLenString(&query, 
		"select ml.npcid,ml.slot,ml.itemid,ml.charges "
		"from "
		"	merchantlist_temp ml, "
		"	spawnentry se, "
		"	spawn2 s2 "
		"where "
		"	ml.npcid=se.npcid "
		"	and se.spawngroupid=s2.spawngroupid "
		"	and s2.zone='%s' and s2.version=%u", GetShortName(), GetInstanceVersion()));
	if (!(pQueuedMerchantsWorkID = dbasync->AddWork(&dbaw))) {
		safe_delete(dbaw);
		LogFile->write(EQEMuLog::Error, "dbasync->AddWork() failed adding merchant list query");
		return;
	}
/*	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	std::list<TempMerchantList> merlist;
	if (database.RunQuery(query, MakeAnyLenString(&query, "select ml.npcid,ml.slot,ml.itemid,ml.charges from merchantlist_temp ml, npc_types nt, spawnentry se, spawn2 s2 where nt.id=ml.npcid and nt.id=se.npcid and se.spawngroupid=s2.spawngroupid and s2.zone='%s' group by ml.npcid,slot order by npcid,slot asc", GetShortName()), errbuf, &result)) {
		int32 npcid = 0;
		while((row = mysql_fetch_row(result))) {
			if(npcid != atoul(row[0])){		
				if(npcid > 0)
					tmpmerchanttable[npcid] = merlist;
				npcid = atoul(row[0]);
				merlist.clear();
			}
			TempMerchantList ml;
			ml.npcid = npcid;
			ml.slot = atoul(row[1]);
			ml.item = atoul(row[2]);
			ml.charges = atoul(row[3]);
			ml.origslot = ml.slot;
			merlist.push_back(ml);
		}
		if(npcid > 0)
			tmpmerchanttable[npcid] = merlist;
		mysql_free_result(result);
	}
	else
		cerr << "Error in LoadTempMerchantData query '" << query << "' " << errbuf << endl;
	safe_delete_array(query);
*/
}

void Zone::LoadTempMerchantData_result(MYSQL_RES* result) {
    MYSQL_ROW row;
	std::map<uint32,std::list<TempMerchantList> >::iterator cur;
	int32 npcid = -1;
	while((row = mysql_fetch_row(result))) {
		TempMerchantList ml;
		ml.npcid = atoul(row[0]);
		if(npcid != ml.npcid){
			cur = tmpmerchanttable.find(ml.npcid);
			if(cur == tmpmerchanttable.end()) {
				std::list<TempMerchantList> empty;
				tmpmerchanttable[ml.npcid] = empty;
				cur = tmpmerchanttable.find(ml.npcid);
			}
			npcid = ml.npcid;
		}
		ml.slot = atoul(row[1]);
		ml.item = atoul(row[2]);
		ml.charges = atoul(row[3]);
		ml.origslot = ml.slot;
		cur->second.push_back(ml);
	}
	//mysql_free_result(result);
	//LogFile->write(EQEMuLog::Status, "Finished Loading Temporary Merchant Lists...");
}

//there should prolly be a temp counterpart of this...
void Zone::LoadNewMerchantData(uint32 merchantid){
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	std::list<MerchantList> merlist;
	if (database.RunQuery(query, MakeAnyLenString(&query, "SELECT item, slot FROM merchantlist WHERE merchantid=%d", merchantid), errbuf, &result)) {
		while((row = mysql_fetch_row(result))) {
			MerchantList ml;
			ml.id = merchantid;
			ml.item = atoul(row[0]);
			ml.slot = atoul(row[1]);
			merlist.push_back(ml);
		}
		merchanttable[merchantid] = merlist;
		mysql_free_result(result);
	}
	else
		LogFile->write(EQEMuLog::Error, "Error in LoadNewMerchantData query '%s' %s", query, errbuf);
	safe_delete_array(query);
}

void Zone::LoadMerchantData_result(MYSQL_RES* result) {
    MYSQL_ROW row;
	std::map<uint32,std::list<MerchantList> >::iterator cur;
	int32 npcid = 0;
	while((row = mysql_fetch_row(result))) {
		MerchantList ml;
		ml.id = atoul(row[0]);
		if(npcid != ml.id){
			cur = merchanttable.find(ml.id);
			if(cur == merchanttable.end()) {
				std::list<MerchantList> empty;
				merchanttable[ml.id] = empty;
				cur = merchanttable.find(ml.id);
			}
			npcid = ml.id;
		}
		ml.slot = atoul(row[1]);
		ml.item = atoul(row[2]);
		cur->second.push_back(ml);
	}
	//mysql_free_result(result);
//	LogFile->write(EQEMuLog::Status, "Finished Loading Merchant Lists...");
}

void Zone::GetMerchantDataForZoneLoad(){
	LogFile->write(EQEMuLog::Status, "Loading Merchant Lists...");
	char* query = 0;
	uint32_breakdown workpt;
	workpt.b4() = DBA_b4_Zone;
	workpt.w2_3() = 0;
	workpt.b1() = DBA_b1_Zone_MerchantLists;
	DBAsyncWork* dbaw = new DBAsyncWork(&database, &MTdbafq, workpt, DBAsync::Read);
	dbaw->AddQuery(1, &query, MakeAnyLenString(&query, 
		"select ml.merchantid,ml.slot,ml.item "
		"from merchantlist ml, npc_types nt, spawnentry se, spawn2 s2 "
		"where nt.merchant_id=ml.merchantid and nt.id=se.npcid "
		"and se.spawngroupid=s2.spawngroupid and s2.zone='%s' and s2.version=%u "
		//"group by ml.merchantid,slot order by merchantid,slot asc"		//this made the query use a temp table/filesort (very slow)... so we handle unsorted data on our end.
		, GetShortName(), GetInstanceVersion()));
	if (!(pQueuedMerchantsWorkID = dbasync->AddWork(&dbaw))) {
		safe_delete(dbaw);
		LogFile->write(EQEMuLog::Error,"dbasync->AddWork() failed adding merchant list query");
		return;
	}
/*	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	std::list<MerchantList> merlist;
	if (database.RunQuery(query, MakeAnyLenString(&query, "select ml.merchantid,ml.slot,ml.item from merchantlist ml, npc_types nt, spawnentry se, spawn2 s2 where nt.merchant_id=ml.merchantid and nt.id=se.npcid and se.spawngroupid=s2.spawngroupid and s2.zone='%s' group by ml.merchantid,slot order by merchantid,slot asc", GetShortName()), errbuf, &result)) {
		int32 npcid = 0;
		while((row = mysql_fetch_row(result))) {
			if(npcid != atoul(row[0])){		
				if(npcid > 0)
					merchanttable[npcid] = merlist;
				npcid = atoul(row[0]);
				merlist.clear();
			}
			MerchantList ml;
			ml.id = npcid;
			ml.slot = atoul(row[1]);
			ml.item = atoul(row[2]);
			merlist.push_back(ml);
		}
		if(npcid > 0)
			merchanttable[npcid] = merlist;
		mysql_free_result(result);
	}
	else
		cerr << "Error in GetMerchantDataForZoneLoad query '" << query << "' " << errbuf << endl;
	safe_delete_array(query);
*/
}

void Zone::DBAWComplete(int8 workpt_b1, DBAsyncWork* dbaw) {
//	LogFile->write(EQEMuLog::Debug, "Zone work complete...");
	switch (workpt_b1) {
		case DBA_b1_Zone_MerchantLists: {
			char errbuf[MYSQL_ERRMSG_SIZE];
			MYSQL_RES* result = 0;
			DBAsyncQuery* dbaq = dbaw->PopAnswer();
			if(dbaq == NULL) {
				LogFile->write(EQEMuLog::Error, "NULL answer provided for async merchant list load.");
				break;
			}
			if(!dbaq->GetAnswer(errbuf, &result)) {
				LogFile->write(EQEMuLog::Error, "Zone::DBAWComplete(): Unable to get results for merchant lists");
				break;
			}
			if(dbaq->QPT() != 1) {
				LogFile->write(EQEMuLog::Error, "Zone::DBAWComplete(): Invalid query part for merchant lists");
				break;
			}
			
			LoadMerchantData_result(result);
			
			pQueuedMerchantsWorkID = 0;
			break;
		}
		case DBA_b1_Zone_MerchantListsTemp: {
			char errbuf[MYSQL_ERRMSG_SIZE];
			MYSQL_RES* result = 0;
			DBAsyncQuery* dbaq = dbaw->PopAnswer();
			if(dbaq == NULL) {
				LogFile->write(EQEMuLog::Error, "NULL answer provided for async temp merchant list load.");
				break;
			}
			if(!dbaq->GetAnswer(errbuf, &result)) {
				LogFile->write(EQEMuLog::Error, "Zone::DBAWComplete(): Unable to get results for temp merchant lists");
				break;
			}
			if(dbaq->QPT() != 1) {
				LogFile->write(EQEMuLog::Error, "Zone::DBAWComplete(): Invalid query part for temp merchant lists");
				break;
			}
			
			LoadTempMerchantData_result(result);
			
			pQueuedMerchantsWorkID = 0;
			break;
		}

		default: {
			LogFile->write(EQEMuLog::Error, "Zone::DBAWComplete(): Unknown workpt_b1");
			break;
		}
	}
}

void Zone::Shutdown(bool quite) 
{
	if (!ZoneLoaded)
		return;

	std::map<uint32,NPCType *>::iterator itr;
	while(zone->npctable.size()) {
		itr=zone->npctable.begin();
		delete itr->second;
		zone->npctable.erase(itr);
	}

	std::map<uint32,AdventureInfo*>::iterator itr2;
	while(zone->adventure_list.size()) 
	{	
		itr2 = zone->adventure_list.begin();
		delete itr2->second;
		zone->adventure_list.erase(itr2);
	}
	zone->adventure_entry_list.clear();
	zone->adventure_entry_list_flavor.clear();

	std::map<uint32,AdventureDetails*>::iterator itr3;
	while(zone->active_adventures.size()) 
	{	
		itr3 = zone->active_adventures.begin();
		delete itr3->second;
		zone->active_adventures.erase(itr3);
	}

	std::map<uint32,LDoNTrapTemplate*>::iterator itr4;
	while(zone->ldon_trap_list.size()) 
	{	
		itr4 = zone->ldon_trap_list.begin();
		delete itr4->second;
		zone->ldon_trap_list.erase(itr4);
	}
	zone->ldon_trap_entry_list.clear();

	LogFile->write(EQEMuLog::Status, "Zone Shutdown: %s (%i)", zone->GetShortName(), zone->GetZoneID());
	petition_list.ClearPetitions();
	zone->GotCurTime(false);
	if (!quite)
		LogFile->write(EQEMuLog::Normal, "Zone shutdown: going to sleep");
	ZoneLoaded = false;
	char pzs[3] = "";
	if (database.GetVariable("PersistentZoneState", pzs, 2)) {
		if (pzs[0] == '1') {
			Sleep(100);
			LogFile->write(EQEMuLog::Normal, "Saving zone state");
			database.DumpZoneState();
		}
	}
	zone->ResetAuth();
	safe_delete(zone);
	dbasync->CommitWrites();
	UpdateWindowTitle();
}

void Zone::LoadZoneDoors(const char* zone, int16 version)
{
	LogFile->write(EQEMuLog::Status, "Loading doors for %s ...", zone);
	
	int32 maxid;
	sint32 count = database.GetDoorsCount(&maxid, zone, version);
	if(count < 1) {
		LogFile->write(EQEMuLog::Status, "... No doors loaded.");
		return;
	}
	
	Door *dlist = new Door[count];
	
	if(!database.LoadDoors(count, dlist, zone, version)) {
		LogFile->write(EQEMuLog::Error, "... Failed to load doors.");
		delete[] dlist;
		return;
	}
	
	int r;
	Door *d = dlist;
	for(r = 0; r < count; r++, d++) {
		Doors* newdoor = new Doors(d);
		entity_list.AddDoor(newdoor);
	}
	delete[] dlist;
}

Zone::Zone(int32 in_zoneid, int32 in_instanceid, const char* in_short_name)
:	initgrids_timer(10000),
	autoshutdown_timer((RuleI(Zone, AutoShutdownDelay))),
	clientauth_timer(AUTHENTICATION_TIMEOUT * 1000),
	spawn2_timer(1000),
	adventure_timer(2000),
	qglobal_purge_timer(30000)
{
	zoneid = in_zoneid;
	instanceid = in_instanceid;
	instanceversion = database.GetInstanceVersion(instanceid);
	zonemap = Map::LoadMapfile(in_short_name);
	watermap = WaterMap::LoadWaterMapfile(in_short_name);
	pathing = PathManager::LoadPathFile(in_short_name);
	qGlobals = NULL;

	if(RuleB(TaskSystem, EnableTaskSystem)) {
		taskmanager->LoadProximities(zoneid);
	}

	short_name = strcpy(new char[strlen(in_short_name)+1], in_short_name);
	strlwr(short_name);
	memset(file_name, 0, sizeof(file_name));
	long_name = 0;
	aggroedmobs =0;

	psafe_x = 0;
	psafe_y = 0;
	psafe_z = 0;
	pgraveyard_id = 0;
	pgraveyard_zoneid = 0;
	pgraveyard_x = 0;
	pgraveyard_y = 0;
	pgraveyard_z = 0;
	pgraveyard_heading = 0;
	pMaxClients = 0;
	pQueuedMerchantsWorkID = 0;
	pvpzone = false;
	if(database.GetServerType() == 1)
		pvpzone = true;
	database.GetZoneLongName(short_name, &long_name, file_name, &psafe_x, &psafe_y, &psafe_z, &pgraveyard_id, &pMaxClients);
	if(graveyard_id() > 0)
	{
		LogFile->write(EQEMuLog::Debug, "Graveyard ID is %i.", graveyard_id());
		bool GraveYardLoaded = database.GetZoneGraveyard(graveyard_id(), &pgraveyard_zoneid, &pgraveyard_x, &pgraveyard_y, &pgraveyard_z, &pgraveyard_heading);
		if(GraveYardLoaded)
			LogFile->write(EQEMuLog::Debug, "Loaded a graveyard for zone %s: graveyard zoneid is %u x is %f y is %f z is %f heading is %f.", short_name, graveyard_zoneid(), graveyard_x(), graveyard_y(), graveyard_z(), graveyard_heading());
		else
			LogFile->write(EQEMuLog::Error, "Unable to load the graveyard id %i for zone %s.", graveyard_id(), short_name);
	}
	if (long_name == 0) {
		long_name = strcpy(new char[18], "Long zone missing");
	}
	autoshutdown_timer.Start(AUTHENTICATION_TIMEOUT * 1000, false);
	Weather_Timer = new Timer((MakeRandomInt(1800, 7200) + 30) * 2000);
	Weather_Timer->Start();
	LogFile->write(EQEMuLog::Debug, "The next weather check for zone: %s will be in %i seconds.", short_name, Weather_Timer->GetRemainingTime()/1000);
	weather_type = 0;
	zone_weather = 0;
	
	blocked_spells = NULL;
	totalBS = 0;

	aas = NULL;
	totalAAs = 0;
    gottime = false;
	
	Instance_Shutdown_Timer = NULL;
	if(instanceid > 0)
	{
		int32 rem = database.GetTimeRemainingInstance(instanceid);
		if(rem < 150) //give some leeway to people who are zoning in 2.5 minutes to finish zoning in and get ported out
			rem = 150;
		Instance_Timer = new Timer(rem * 1000);
	}
	else
	{
		Instance_Timer = NULL;
	}

	database.QGlobalPurge();

	if(zoneid == RuleI(World, GuildBankZoneID))
		GuildBanks = new GuildBankManager;
	else
		GuildBanks = NULL;
}

Zone::~Zone() {
	if(pQueuedMerchantsWorkID != 0)
		dbasync->CancelWork(pQueuedMerchantsWorkID);
	spawn2_list.Clear();
	safe_delete(zonemap);
	safe_delete(watermap);
	safe_delete(pathing);
	if (worldserver.Connected()) {
		worldserver.SetZone(0);
	}
	safe_delete_array(short_name);
	safe_delete_array(long_name);
	safe_delete(Weather_Timer);
	zone_point_list.Clear();
	entity_list.Clear();
	ClearBlockedSpells();
	
	safe_delete(Instance_Timer);
	safe_delete(Instance_Shutdown_Timer);
	safe_delete(qGlobals);

	if(aas != NULL) {
		int r;
		for(r = 0; r < totalAAs; r++) {
			uchar *data = (uchar *) aas[r];
			safe_delete_array(data);
		}
		safe_delete_array(aas);
	}
#ifdef CLIENT_LOGS
	client_logs.clear();
#endif
}

//Modified for timezones.
bool Zone::Init(bool iStaticZone) {
	SetStaticZone(iStaticZone);
	
	//load up our spawn conditions before any spawn data, since the spawn
	//data needs access to the spawn conditions to do its thing.
	//Because the spawn conditions system isn't compatible with instances atm we wont load if we're
	//an instanced zone but it's something I'll revisit.
	if(GetInstanceID() == 0)
	{
		LogFile->write(EQEMuLog::Status, "Loading spawn conditions...");
		if(!spawn_conditions.LoadSpawnConditions(short_name)) {
			LogFile->write(EQEMuLog::Error, "Loading spawn conditions failed, continuing without them.");
		}
	}
	
	LogFile->write(EQEMuLog::Status, "Loading static zone points...");
	if (!database.LoadStaticZonePoints(&zone_point_list, short_name)) {
		LogFile->write(EQEMuLog::Error, "Loading static zone points failed.");
		return false;
	}
	
	LogFile->write(EQEMuLog::Status, "Loading spawn groups...");
	if (!database.LoadSpawnGroups(short_name, GetInstanceVersion(), &spawn_group_list)) {
		LogFile->write(EQEMuLog::Error, "Loading spawn groups failed.");
		return false;
	}
	
	LogFile->write(EQEMuLog::Status, "Loading spawn2 points...");
	if (!database.PopulateZoneSpawnList(zoneid, spawn2_list, GetInstanceVersion()))
	{
		LogFile->write(EQEMuLog::Error, "Loading spawn2 points failed.");
		return false;
	}
	
	LogFile->write(EQEMuLog::Status, "Loading player corpses...");
	if (!database.LoadPlayerCorpses(zoneid, instanceid)) {
		LogFile->write(EQEMuLog::Error, "Loading player corpses failed.");
		return false;
	}
	
	LogFile->write(EQEMuLog::Status, "Loading traps...");
	if (!database.LoadTraps(short_name, GetInstanceVersion()))
	{
		LogFile->write(EQEMuLog::Error, "Loading traps failed.");
		return false;
	}
	
	LogFile->write(EQEMuLog::Status, "Loading ground spawns...");
	if (!LoadGroundSpawns())
	{
		LogFile->write(EQEMuLog::Error, "Loading ground spawns failed. continuing.");
	}
	
	LogFile->write(EQEMuLog::Status, "Loading World Objects from DB...");
	if (!LoadZoneObjects())
	{
		LogFile->write(EQEMuLog::Error, "Loading World Objects failed. continuing.");
	}
	
	//load up the zone's doors (prints inside)
	zone->LoadZoneDoors(zone->GetShortName(), zone->GetInstanceVersion());
	zone->LoadBlockedSpells(zone->GetZoneID());
	
	//clear trader items if we are loading the bazaar
	if(strncasecmp(short_name,"bazaar",6)==0) {
		database.DeleteTraderItem(0);
		database.DeleteBuyLines(0);
	}
	
	zone->LoadAdventures();
	zone->LoadAdventureEntries();
	zone->LoadAdventureFlavor();
	zone->LoadActiveAdventures();
	zone->LoadLDoNTraps();
	zone->LoadLDoNTrapEntries();
	zone->LoadVeteranRewards();


	//Load AA information
	adverrornum = 500;
	LoadAAs();
	
	//Load merchant data
	adverrornum = 501;
	zone->GetMerchantDataForZoneLoad();
	
	//Load temporary merchant data
	adverrornum = 502;
	zone->LoadTempMerchantData();
	
	adverrornum = 503;
	//g_LogFile.write("AI LEVEL set to %d\n",iAILevel);
	petition_list.ClearPetitions();
	petition_list.ReadDatabase();
	
	//load the zone config file.
	if (!LoadZoneCFG(zone->GetShortName(), true)) // try loading the zone name...
		LoadZoneCFG(zone->GetFileName()); // if that fails, try the file name, then load defaults
	
	parse->ClearCache();
	
	LogFile->write(EQEMuLog::Status, "Loading timezone data...");
	zone->zone_time.setEQTimeZone(database.GetZoneTZ(zoneid));
	
	LogFile->write(EQEMuLog::Status, "Init Finished: ZoneID = %d, Time Offset = %d", zoneid, zone->zone_time.getEQTimeZone());
	return true;
}

void Zone::ReloadStaticData() {
	LogFile->write(EQEMuLog::Status, "Reloading Zone Static Data...");
	
	LogFile->write(EQEMuLog::Status, "Reloading static zone points...");
	zone_point_list.Clear();
	if (!database.LoadStaticZonePoints(&zone_point_list, GetShortName())) {
		LogFile->write(EQEMuLog::Error, "Loading static zone points failed.");
	}
	
	LogFile->write(EQEMuLog::Status, "Reloading traps...");
	entity_list.RemoveAllTraps();
	if (!database.LoadTraps(GetShortName(), GetInstanceVersion()))
	{
		LogFile->write(EQEMuLog::Error, "Reloading traps failed.");
	}
	
	LogFile->write(EQEMuLog::Status, "Reloading ground spawns...");
	if (!LoadGroundSpawns())
	{
		LogFile->write(EQEMuLog::Error, "Reloading ground spawns failed. continuing.");
	}
	
	entity_list.RemoveAllObjects();
	LogFile->write(EQEMuLog::Status, "Reloading World Objects from DB...");
	if (!LoadZoneObjects())
	{
		LogFile->write(EQEMuLog::Error, "Reloading World Objects failed. continuing.");
	}
	
	entity_list.RemoveAllDoors();
	zone->LoadZoneDoors(zone->GetShortName(), zone->GetInstanceVersion());
	zone->LoadVeteranRewards();
	
	//load the zone config file.
	if (!LoadZoneCFG(zone->GetShortName(), true)) // try loading the zone name...
		LoadZoneCFG(zone->GetFileName()); // if that fails, try the file name, then load defaults
	
	LogFile->write(EQEMuLog::Status, "Zone Static Data Reloaded.");
}

bool Zone::LoadZoneCFG(const char* filename, bool DontLoadDefault) {
	memset(&newzone_data, 0, sizeof(NewZone_Struct));
	if(!database.GetZoneCFG(database.GetZoneID(filename), &newzone_data, can_bind, can_combat, can_levitate, can_castoutdoor, is_city, is_hotzone, can_raid, is_classic)) { //Angelox3
		cout << "Error while loading Zone Config!\n";
		cout << "IF YOU HAVENT DONE SO, SOURCE THE ZONECFG.SQL FILE!!!!!!\n";
		return false;
	}
	
	//overwrite with our internal variables
	strcpy(newzone_data.zone_short_name, GetShortName());
	strcpy(newzone_data.zone_long_name, GetLongName());
	strcpy(newzone_data.zone_short_name2,GetShortName());
	
	LogFile->write(EQEMuLog::Status, "Successfully loaded Zone Config.");
	return true;
}

bool Zone::SaveZoneCFG() {
	return database.SaveZoneCFG(GetZoneID(),&newzone_data);
}

void Zone::AddAuth(ServerZoneIncommingClient_Struct* szic) {
	ZoneClientAuth_Struct* zca = new ZoneClientAuth_Struct;
	memset(zca, 0, sizeof(ZoneClientAuth_Struct));
	zca->ip = szic->ip;
	zca->wid = szic->wid;
	zca->accid = szic->accid;
	zca->admin = szic->admin;
	zca->charid = szic->charid;
	zca->tellsoff = szic->tellsoff;
	strn0cpy(zca->charname, szic->charname, sizeof(zca->charname));
	strn0cpy(zca->lskey, szic->lskey, sizeof(zca->lskey));
	zca->stale = false;
	client_auth_list.Insert(zca);
}

void Zone::RemoveAuth(const char* iCharName)
{
	LinkedListIterator<ZoneClientAuth_Struct*> iterator(client_auth_list);

	iterator.Reset();
	while (iterator.MoreElements()) {
		ZoneClientAuth_Struct* zca = iterator.GetData();
		if (strcasecmp(zca->charname, iCharName) == 0) {
		iterator.RemoveCurrent();
		return;
		}
		iterator.Advance();
	}
}

void Zone::ResetAuth()
{
	LinkedListIterator<ZoneClientAuth_Struct*> iterator(client_auth_list);

	iterator.Reset();
	while (iterator.MoreElements()) {
		iterator.RemoveCurrent();
	}
}

bool Zone::GetAuth(int32 iIP, const char* iCharName, int32* oWID, int32* oAccID, int32* oCharID, sint16* oStatus, char* oLSKey, bool* oTellsOff) {
	LinkedListIterator<ZoneClientAuth_Struct*> iterator(client_auth_list);

	iterator.Reset();
	while (iterator.MoreElements()) {
		ZoneClientAuth_Struct* zca = iterator.GetData();
		if (strcasecmp(zca->charname, iCharName) == 0) {
				if(oWID)
				*oWID = zca->wid;
				if(oAccID)
				*oAccID = zca->accid;
				if(oCharID)
				*oCharID = zca->charid;
				if(oStatus)
				*oStatus = zca->admin;
				if(oTellsOff)
				*oTellsOff = zca->tellsoff;
				zca->stale = true;
			return true;
		}
		iterator.Advance();
	}
	return false;
}

int32 Zone::CountAuth() {
	LinkedListIterator<ZoneClientAuth_Struct*> iterator(client_auth_list);

	int x = 0;
	iterator.Reset();
	while (iterator.MoreElements()) {
		x++;
		iterator.Advance();
	}
	return x;
}

bool Zone::Process() {
	LockMutex lock(&MZoneLock);
	_ZP(Zone_Process);


	spawn_conditions.Process();

	if(spawn2_timer.Check()) {
		LinkedListIterator<Spawn2*> iterator(spawn2_list);

		iterator.Reset();
		while (iterator.MoreElements()) {
			if (iterator.GetData()->Process()) {
				iterator.Advance();
			}
			else {
				iterator.RemoveCurrent();
			}
		}
	}
	if(initgrids_timer.Check()) {
		//delayed grid loading stuff.
		initgrids_timer.Disable();
		LinkedListIterator<Spawn2*> iterator(spawn2_list);

		iterator.Reset();
		while (iterator.MoreElements()) {
			iterator.GetData()->LoadGrid();
			iterator.Advance();
		}
	}

	if(!staticzone) {
		if (autoshutdown_timer.Check()) {
			StartShutdownTimer();
			if (numclients == 0) {
				return false;
			}
		}
	}

	if(GetInstanceID() > 0)
	{
		if(Instance_Timer != NULL && Instance_Shutdown_Timer == NULL)
		{
			if(Instance_Timer->Check())
			{
				entity_list.GateAllClients();
				database.DeleteInstance(GetInstanceID());
				Instance_Shutdown_Timer = new Timer(20000); //20 seconds
			}
		}
		else if(Instance_Shutdown_Timer != NULL)
		{
			if(Instance_Shutdown_Timer->Check())
			{
				StartShutdownTimer();
				return false;
			}
		}
	}

	if(adventure_timer.Check())
	{
		std::map<uint32, AdventureDetails*>::iterator aa_iter;
		aa_iter = active_adventures.begin();
		while(aa_iter != active_adventures.end())
		{
			AdventureDetails *ad = aa_iter->second;
			if(ad)
			{
				if(ad->ai)
				{
					timeval tv;
					gettimeofday(&tv, NULL);
					if(ad->time_completed > 0)
					{
						//if time is up then destroy this adventure
						if((RuleI(Adventure, LDoNAdventureExpireTime) + ad->time_completed) <= tv.tv_sec)
						{
							if(ad->status == 2)
							{
								ServerPacket *pack2 = new ServerPacket(ServerOP_AdventureFinish, sizeof(ServerAdventureFinish_Struct));
								ServerAdventureFinish_Struct *afin = (ServerAdventureFinish_Struct*)pack2->pBuffer;
								afin->id = ad->id;
								afin->win_lose = 0;
								afin->points = 0;
								afin->update_stats = false;
								worldserver.SendPacket(pack2);
								safe_delete(pack2);

								database.DestroyAdventure(ad->id);
								ServerPacket *pack = new ServerPacket(ServerOP_AdventureDestroy, sizeof(ServerAdventureDestroy_Struct));
								ServerAdventureDestroy_Struct *adest = (ServerAdventureDestroy_Struct*)pack->pBuffer;
								adest->id = ad->id;
								worldserver.SendPacket(pack);
								safe_delete(pack);
							}
							else
							{
								database.DestroyAdventure(ad->id);
								ServerPacket *pack = new ServerPacket(ServerOP_AdventureDestroy, sizeof(ServerAdventureDestroy_Struct));
								ServerAdventureDestroy_Struct *adest = (ServerAdventureDestroy_Struct*)pack->pBuffer;
								adest->id = ad->id;
								worldserver.SendPacket(pack);
								safe_delete(pack);
							}
						}
					}
					else if(ad->time_zoned > 0)
					{
						if(ad->status == 1)
						{
							if((ad->ai->duration + ad->time_zoned) <= tv.tv_sec)
							{
								database.UpdateAllAdventureStatsEntry(ad->id, ad->ai->theme, false);
								sint32 time_since = tv.tv_sec - (ad->ai->duration + ad->time_zoned);
								if(time_since >= RuleI(Adventure, LDoNAdventureExpireTime)) //we're over time on our instance
								{
									database.DestroyAdventure(ad->id);
									ServerPacket *pack = new ServerPacket(ServerOP_AdventureDestroy, sizeof(ServerAdventureDestroy_Struct));
									ServerAdventureDestroy_Struct *adest = (ServerAdventureDestroy_Struct*)pack->pBuffer;
									adest->id = ad->id;
									worldserver.SendPacket(pack);
									safe_delete(pack);
								}
								else
								{
									database.UpdateAdventureCompleted(ad->id, (tv.tv_sec-time_since));
									database.UpdateAdventureStatus(ad->id, 2);

									//send new status to all players
									ServerPacket *pack = new ServerPacket(ServerOP_AdventureUpdate, sizeof(ServerAdventureUpdate_Struct));
									ServerAdventureUpdate_Struct *au = (ServerAdventureUpdate_Struct*)pack->pBuffer;
									au->id = ad->id;
									au->new_timec = 1;
									au->new_status = 1;
									au->status = 2;
									au->time_c = (tv.tv_sec-time_since);
									worldserver.SendPacket(pack);
									safe_delete(pack);
									
									ServerPacket *pack2 = new ServerPacket(ServerOP_AdventureFinish, sizeof(ServerAdventureFinish_Struct));
									ServerAdventureFinish_Struct *afin = (ServerAdventureFinish_Struct*)pack2->pBuffer;
									afin->id = ad->id;
									afin->win_lose = 0;
									afin->points = 0;
									afin->update_stats = false;
									worldserver.SendPacket(pack2);
									safe_delete(pack2);									

									char msg[] = "You failed to complete your adventure in time.  Complete your adventure goal within 30 minutes to receive a lesser reward.  This adventure will end in 30 minutes and your party will be ejected from the dungeon.\0";
									ServerPacket *pack_msg = new ServerPacket(ServerOP_AdventureMessage, sizeof(ServerAdventureMessage_Struct) + strlen(msg) + 1);
									ServerAdventureMessage_Struct *am = (ServerAdventureMessage_Struct*)pack_msg->pBuffer;
									am->id = ad->id;
									strncpy(am->message, msg, strlen(msg));
									worldserver.SendPacket(pack_msg);
									safe_delete(pack_msg);

									//set time on instance to 30 min
									database.SetInstanceDuration(ad->instance_id, (RuleI(Adventure, LDoNAdventureExpireTime)-time_since));
									ServerPacket *instance_pack = new ServerPacket(ServerOP_InstanceUpdateTime, sizeof(ServerInstanceUpdateTime_Struct));
									ServerInstanceUpdateTime_Struct *iut = (ServerInstanceUpdateTime_Struct*)instance_pack->pBuffer;
									iut->instance_id = ad->instance_id;
									iut->new_duration = (RuleI(Adventure, LDoNAdventureExpireTime)-time_since);
									worldserver.SendPacket(instance_pack);
									safe_delete(instance_pack);
								}
							}
						}
					}
					else
					{
						if((ad->ai->zone_in_time + ad->time_created) <= tv.tv_sec)
						{
							database.UpdateAllAdventureStatsEntry(ad->id, ad->ai->theme, false);
							database.DestroyAdventure(ad->id);
							ServerPacket *pack = new ServerPacket(ServerOP_AdventureDestroy, sizeof(ServerAdventureDestroy_Struct));
							ServerAdventureDestroy_Struct *adest = (ServerAdventureDestroy_Struct*)pack->pBuffer;
							adest->id = ad->id;
							worldserver.SendPacket(pack);
							safe_delete(pack);
						}
					}
				}
			}
			aa_iter++;
		}
	}

	if(Weather_Timer->Check()){
		Weather_Timer->Disable();
		int16 tmpweather = MakeRandomInt(0, 100);

		if(zone->weather_type != 0)
		{
			if(tmpweather >= 80)
			{
				// A change in the weather....
				int8 tmpOldWeather = zone_weather;

				if(zone->zone_weather == 0)
					zone->zone_weather = zone->weather_type;
				else
					zone->zone_weather = 0;

				LogFile->write(EQEMuLog::Debug, "The weather for zone: %s has changed. Old weather was = %i. New weather is = %i", zone->GetShortName(), tmpOldWeather, zone_weather);

				this->weatherSend();
			}
			else
				LogFile->write(EQEMuLog::Debug, "The weather for zone: %s is not going to change. Chance was = %i percent.", zone->GetShortName(), tmpweather);

			uint32 weatherTime = 0;

			if(zone->zone_weather != zone->weather_type)
				weatherTime = (MakeRandomInt(1800, 7200) + 30) * 2000;
			else
				weatherTime = (MakeRandomInt(900, 2700) + 30) * 1000;

			Weather_Timer->Start(weatherTime);

			LogFile->write(EQEMuLog::Debug, "The next weather check for zone: %s will be in %i seconds.", zone->GetShortName(), Weather_Timer->GetRemainingTime()/1000); 
		}
	}

	if(qGlobals)
	{
		if(qglobal_purge_timer.Check())
		{
			qGlobals->PurgeExpiredGlobals();
		}
	}

	if (clientauth_timer.Check()) {
		LinkedListIterator<ZoneClientAuth_Struct*> iterator2(client_auth_list);

		iterator2.Reset();
		while (iterator2.MoreElements()) {
			if (iterator2.GetData()->stale)
				iterator2.RemoveCurrent();
			else {
				iterator2.GetData()->stale = true;
				iterator2.Advance();
			}
		}
	}

	return true;
}

void Zone::StartShutdownTimer(int32 set_time) {
	MZoneLock.lock();
	if (set_time > autoshutdown_timer.GetRemainingTime()) {
		if (set_time == (RuleI(Zone, AutoShutdownDelay)))
		{
			set_time = database.getZoneShutDownDelay(GetZoneID());
		}
		autoshutdown_timer.Start(set_time, false);
	}
	MZoneLock.unlock();
}

bool Zone::Depop(bool StartSpawnTimer) {
std::map<uint32,NPCType *>::iterator itr;
	entity_list.Depop(StartSpawnTimer);

   // Refresh npctable, getting current info from database.
   while(npctable.size()) {
		itr=npctable.begin();
		delete itr->second;
		npctable.erase(itr);
   }

	return true;
}

void Zone::Repop(int32 delay) {
	
	if(!Depop())
		return;
	
	LinkedListIterator<Spawn2*> iterator(spawn2_list);

	MZoneLock.lock();
	iterator.Reset();
	while (iterator.MoreElements()) {
		iterator.RemoveCurrent();
	}

	if (!database.PopulateZoneSpawnList(zoneid, spawn2_list, GetInstanceVersion(), delay))
		LogFile->write(EQEMuLog::Debug, "Error in Zone::Repop: database.PopulateZoneSpawnList failed");

	MZoneLock.unlock();
	
	initgrids_timer.Start();
}

void Zone::GetTimeSync()
{
	if (worldserver.Connected() && !gottime) {
		ServerPacket* pack = new ServerPacket(ServerOP_GetWorldTime, 0);
		worldserver.SendPacket(pack);
		safe_delete(pack);
	}
}

void Zone::SetDate(int16 year, int8 month, int8 day, int8 hour, int8 minute)
{
	if (worldserver.Connected()) {
		ServerPacket* pack = new ServerPacket(ServerOP_SetWorldTime, sizeof(eqTimeOfDay));
		eqTimeOfDay* eqtod = (eqTimeOfDay*)pack->pBuffer;
		eqtod->start_eqtime.minute=minute;
		eqtod->start_eqtime.hour=hour;
		eqtod->start_eqtime.day=day;
		eqtod->start_eqtime.month=month;
		eqtod->start_eqtime.year=year;
		eqtod->start_realtime=time(0);
		printf("Setting master date on world server to: %d-%d-%d %d:%d (%d)\n", year, month, day, hour, minute, (int)eqtod->start_realtime);
		worldserver.SendPacket(pack);
		safe_delete(pack);
	}
}

void Zone::SetTime(int8 hour, int8 minute)
{
	if (worldserver.Connected()) {
		ServerPacket* pack = new ServerPacket(ServerOP_SetWorldTime, sizeof(eqTimeOfDay));
		eqTimeOfDay* eqtod = (eqTimeOfDay*)pack->pBuffer;
		zone_time.getEQTimeOfDay(time(0), &eqtod->start_eqtime);
		eqtod->start_eqtime.minute=minute;
		eqtod->start_eqtime.hour=hour;
		eqtod->start_realtime=time(0);
		printf("Setting master time on world server to: %d:%d (%d)\n", hour, minute, (int)eqtod->start_realtime);
		worldserver.SendPacket(pack);
		safe_delete(pack);
	}
}

ZonePoint* Zone::GetClosestZonePoint(float x, float y, float z, int32 to, float max_distance, Client* client) {
	LinkedListIterator<ZonePoint*> iterator(zone_point_list);
	ZonePoint* closest_zp = 0;
	float closest_dist = FLT_MAX;
	float max_distance2 = max_distance*max_distance;
	iterator.Reset();
	while(iterator.MoreElements())
	{
		ZonePoint* zp = iterator.GetData();
		if (zp->target_zone_id == to)
		{
			float delta_x = zp->x - x;
			float delta_y = zp->y - y;
			if(zp->x == 999999 || zp->x == -999999)
				delta_x = 0;
			if(zp->y == 999999 || zp->y == -999999)
				delta_y = 0;

			float dist = delta_x*delta_x+delta_y*delta_y;
			if (dist < closest_dist)
			{
				closest_zp = zp;
				closest_dist = dist;
			}
		}
		iterator.Advance();
	}
	
	if(closest_dist>(40000.0f) && closest_dist<max_distance2)
	{
		if(client)
			client->CheatDetected(MQZoneUnknownDest, x, y, z); //[Paddy] Someone is trying to use /zone
		LogFile->write(EQEMuLog::Status, "WARNING: Closest zone point for zone id %d is %f, you might need to update your zone_points table if you dont arrive at the right spot.",to,closest_dist);
		LogFile->write(EQEMuLog::Status, "<Real Zone Points>.  %f x %f y %fz ",x,y,z);
	}
	
	if(closest_dist > max_distance2)
		closest_zp = NULL;
	
	if(!closest_zp)
		closest_zp = GetClosestZonePointWithoutZone(x,y,z);

	return closest_zp;
}

ZonePoint* Zone::GetClosestZonePoint(float x, float y, float z, const char* to_name, float max_distance) {
	if(to_name == NULL)
		return GetClosestZonePointWithoutZone(x,y,z, max_distance);
	return GetClosestZonePoint(x, y, z, database.GetZoneID(to_name), max_distance);
}

ZonePoint* Zone::GetClosestZonePointWithoutZone(float x, float y, float z, float max_distance) {
	LinkedListIterator<ZonePoint*> iterator(zone_point_list);
	ZonePoint* closest_zp = 0;
	float closest_dist = FLT_MAX;
	float max_distance2 = max_distance*max_distance;
	iterator.Reset();
	while(iterator.MoreElements())
	{
		ZonePoint* zp = iterator.GetData();
			float delta_x = zp->x - x;
			float delta_y = zp->y - y;
			if(zp->x == 999999 || zp->x == -999999)
				delta_x = 0;
			if(zp->y == 999999 || zp->y == -999999)
				delta_y = 0;

			float dist = delta_x*delta_x+delta_y*delta_y;///*+(zp->z-z)*(zp->z-z)*/;
			if (dist < closest_dist)
			{
				closest_zp = zp;
				closest_dist = dist;
			}
		iterator.Advance();
	}
	if(closest_dist > max_distance2)
		closest_zp = NULL;

	return closest_zp;
}

bool ZoneDatabase::LoadStaticZonePoints(LinkedList<ZonePoint*>* zone_point_list,const char* zonename)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	zone_point_list->Clear();
	zone->numzonepoints = 0;
	MakeAnyLenString(&query, "SELECT x,y,z,target_x,target_y,target_z,target_zone_id,heading,target_heading,number FROM zone_points WHERE zone='%s' order by number", zonename);
	if (RunQuery(query, strlen(query), errbuf, &result))
	{
		safe_delete_array(query);
		while((row = mysql_fetch_row(result)))
		{
			ZonePoint* zp = new ZonePoint;
			zp->x = atof(row[0]);
			zp->y = atof(row[1]);
			zp->z = atof(row[2]);
			zp->target_x = atof(row[3]);
			zp->target_y = atof(row[4]);
			zp->target_z = atof(row[5]);
			zp->target_zone_id = atoi(row[6]);
			zp->heading=atof(row[7]);
			zp->target_heading=atof(row[8]);
			zp->number=atoi(row[9]);
			zone_point_list->Insert(zp);
			zone->numzonepoints++;
		}
		mysql_free_result(result);
	}
	else
	{
		cerr << "Error1 in LoadStaticZonePoints query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}
return true;
}

bool ZoneDatabase::DumpZoneState() {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;

	if (!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM zone_state_dump WHERE zonename='%s'", zone->GetShortName()), errbuf)) {
		cerr << "Error in DumpZoneState query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}
	safe_delete_array(query);



	int32	spawn2_count = zone->CountSpawn2();
	int32	npc_count = 0;
	int32	npcloot_count = 0;
	int32	gmspawntype_count = 0;
	entity_list.CountNPC(&npc_count, &npcloot_count, &gmspawntype_count);

	cout << "DEBUG: spawn2count=" << spawn2_count << ", npc_count=" << npc_count << ", npcloot_count=" << npcloot_count << ", gmspawntype_count=" << gmspawntype_count << endl;

	ZSDump_Spawn2* spawn2_dump = 0;
	ZSDump_NPC*	npc_dump = 0;
	ZSDump_NPC_Loot* npcloot_dump = 0;
	NPCType* gmspawntype_dump = 0;
	if (spawn2_count > 0) {
		spawn2_dump = (ZSDump_Spawn2*) new uchar[spawn2_count * sizeof(ZSDump_Spawn2)];
		memset(spawn2_dump, 0, sizeof(ZSDump_Spawn2) * spawn2_count);
	}
	if (npc_count > 0) {
		npc_dump = (ZSDump_NPC*) new uchar[npc_count * sizeof(ZSDump_NPC)];
		memset(npc_dump, 0, sizeof(ZSDump_NPC) * npc_count);
		for (unsigned int i=0; i < npc_count; i++) {
			npc_dump[i].spawn2_dump_index = 0xFFFFFFFF;
			npc_dump[i].gmspawntype_index = 0xFFFFFFFF;
		}
	}
	if (npcloot_count > 0) {
		npcloot_dump = (ZSDump_NPC_Loot*) new uchar[npcloot_count * sizeof(ZSDump_NPC_Loot)];
		memset(npcloot_dump, 0, sizeof(ZSDump_NPC_Loot) * npcloot_count);
		for (unsigned int k=0; k < npcloot_count; k++)
			npcloot_dump[k].npc_dump_index = 0xFFFFFFFF;
	}
	if (gmspawntype_count > 0) {
		gmspawntype_dump = (NPCType*) new uchar[gmspawntype_count * sizeof(NPCType)];
		memset(gmspawntype_dump, 0, sizeof(NPCType) * gmspawntype_count);
	}

	entity_list.DoZoneDump(spawn2_dump, npc_dump, npcloot_dump, gmspawntype_dump);
    query = new char[512 + ((sizeof(ZSDump_Spawn2) * spawn2_count + sizeof(ZSDump_NPC) * npc_count + sizeof(ZSDump_NPC_Loot) * npcloot_count + sizeof(NPCType) * gmspawntype_count) * 2)];
	char* end = query;

    end += sprintf(end, "Insert Into zone_state_dump (zonename, spawn2_count, npc_count, npcloot_count, gmspawntype_count, spawn2, npcs, npc_loot, gmspawntype) values ('%s', %i, %i, %i, %i, ", zone->GetShortName(), spawn2_count, npc_count, npcloot_count, gmspawntype_count);
    *end++ = '\'';
	if (spawn2_dump != 0) {
		end += DoEscapeString(end, (char*)spawn2_dump, sizeof(ZSDump_Spawn2) * spawn2_count);
		safe_delete_array(spawn2_dump);
	}
    *end++ = '\'';
    end += sprintf(end, ", ");
    *end++ = '\'';
	if (npc_dump != 0) {
		end += DoEscapeString(end, (char*)npc_dump, sizeof(ZSDump_NPC) * npc_count);
		safe_delete_array(npc_dump);
	}
    *end++ = '\'';
    end += sprintf(end, ", ");
    *end++ = '\'';
	if (npcloot_dump != 0) {
		end += DoEscapeString(end, (char*)npcloot_dump, sizeof(ZSDump_NPC_Loot) * npcloot_count);
		safe_delete_array(npcloot_dump);
	}
    *end++ = '\'';
    end += sprintf(end, ", ");
    *end++ = '\'';
	if (gmspawntype_dump != 0) {
		end += DoEscapeString(end, (char*)gmspawntype_dump, sizeof(NPCType) * gmspawntype_count);
		safe_delete_array(gmspawntype_dump);
	}
    *end++ = '\'';
    end += sprintf(end, ")");

	int32 affected_rows = 0;
	if (!RunQuery(query, (int32) (end - query), errbuf, 0, &affected_rows)) {
		//    if (DoEscapeString(query, (unsigned int) (end - query))) {
		safe_delete_array(query);
        cerr << "Error in ZoneDump query " << errbuf << endl;
		return false;
    }
	safe_delete_array(query);

	if (affected_rows == 0) {
		cerr << "Zone dump failed. (affected rows = 0)" << endl;
		return false;
	}
	return true;
}

sint8 ZoneDatabase::LoadZoneState(const char* zonename, LinkedList<Spawn2*>& spawn2_list) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;

	int32 i;
	unsigned long* lengths;
	int32	elapsedtime = 0;
	int32	spawn2_count = 0;
	int32	npc_count = 0;
	int32	npcloot_count = 0;
	int32	gmspawntype_count = 0;
	ZSDump_Spawn2* spawn2_dump = 0;
	ZSDump_NPC*	npc_dump = 0;
	ZSDump_NPC_Loot* npcloot_dump = 0;
	NPCType* gmspawntype_dump = 0;
	Spawn2** spawn2_loaded = 0;
	NPC** npc_loaded = 0;

	if (RunQuery(query, MakeAnyLenString(&query, "SELECT spawn2_count, npc_count, npcloot_count, gmspawntype_count, spawn2, npcs, npc_loot, gmspawntype, (UNIX_TIMESTAMP()-UNIX_TIMESTAMP(time)) as elapsedtime FROM zone_state_dump WHERE zonename='%s'", zonename), errbuf, &result)) {
		safe_delete_array(query);
		if (mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			cout << "Elapsed time: " << row[8] << endl;
			elapsedtime = atoi(row[8]) * 1000;
			lengths = mysql_fetch_lengths(result);
			spawn2_count = atoi(row[0]);
			cout << "Spawn2count: " << spawn2_count << endl;
			if (lengths[4] != (sizeof(ZSDump_Spawn2) * spawn2_count)) {
				cerr << "Error in LoadZoneState: spawn2_dump length mismatch l=" << lengths[4] << ", e=" << (sizeof(ZSDump_Spawn2) * spawn2_count) << endl;
				CleanupLoadZoneState(spawn2_count, &spawn2_dump, &npc_dump, &npcloot_dump, &gmspawntype_dump, &spawn2_loaded, &npc_loaded, &result);
				return -1;
			}
			else if (spawn2_count > 0) {
				spawn2_dump = new ZSDump_Spawn2[spawn2_count];
				spawn2_loaded = new Spawn2*[spawn2_count];
				memcpy(spawn2_dump, row[4], lengths[4]);
				for (i=0; i < spawn2_count; i++) {
					if (spawn2_dump[i].time_left == 0xFFFFFFFF) // npc spawned, timer should be disabled
						spawn2_loaded[i] = LoadSpawn2(spawn2_list, spawn2_dump[i].spawn2_id, 0xFFFFFFFF);
					else if (spawn2_dump[i].time_left <= elapsedtime)
						spawn2_loaded[i] = LoadSpawn2(spawn2_list, spawn2_dump[i].spawn2_id, 0);
					else
						spawn2_loaded[i] = LoadSpawn2(spawn2_list, spawn2_dump[i].spawn2_id, spawn2_dump[i].time_left - elapsedtime);
					if (spawn2_loaded[i] == 0) {
						cerr << "Error in LoadZoneState: spawn2_loaded[" << i << "] == 0" << endl;
						CleanupLoadZoneState(spawn2_count, &spawn2_dump, &npc_dump, &npcloot_dump, &gmspawntype_dump, &spawn2_loaded, &npc_loaded, &result);
						return -1;

					}
				}
			}

			gmspawntype_count = atoi(row[3]);
			cout << "gmspawntype_count: " << gmspawntype_count << endl;
			if (lengths[7] != (sizeof(NPCType) * gmspawntype_count)) {
				cerr << "Error in LoadZoneState: gmspawntype_dump length mismatch l=" << lengths[7] << ", e=" << (sizeof(NPCType) * gmspawntype_count) << endl;
				CleanupLoadZoneState(spawn2_count, &spawn2_dump, &npc_dump, &npcloot_dump, &gmspawntype_dump, &spawn2_loaded, &npc_loaded, &result);
				return -1;
			}
			else if (gmspawntype_count > 0) {
				gmspawntype_dump = new NPCType[gmspawntype_count];
				memcpy(gmspawntype_dump, row[7], lengths[7]);
			}

			npc_count = atoi(row[1]);
			cout << "npc_count: " << npc_count << endl;
			if (lengths[5] != (sizeof(ZSDump_NPC) * npc_count)) {
				cerr << "Error in LoadZoneState: npc_dump length mismatch l=" << lengths[5] << ", e=" << (sizeof(ZSDump_NPC) * npc_count) << endl;
				CleanupLoadZoneState(spawn2_count, &spawn2_dump, &npc_dump, &npcloot_dump, &gmspawntype_dump, &spawn2_loaded, &npc_loaded, &result);
				return -1;
			}
			else if (npc_count > 0) {
				npc_dump = new ZSDump_NPC[npc_count];
				npc_loaded = new NPC*[npc_count];
				for (i=0; i < npc_count; i++) {
					npc_loaded[i] = 0;
				}
				memcpy(npc_dump, row[5], lengths[5]);
				for (i=0; i < npc_count; i++) {
					if (npc_loaded[i] != 0) {
						cerr << "Error in LoadZoneState: npc_loaded[" << i << "] != 0" << endl;
						CleanupLoadZoneState(spawn2_count, &spawn2_dump, &npc_dump, &npcloot_dump, &gmspawntype_dump, &spawn2_loaded, &npc_loaded, &result);
						return -1;
					}
					Spawn2* tmp = 0;
					if (!npc_dump[i].corpse && npc_dump[i].spawn2_dump_index != 0xFFFFFFFF) {
						if (spawn2_loaded == 0 || npc_dump[i].spawn2_dump_index >= spawn2_count) {
							cerr << "Error in LoadZoneState: (spawn2_loaded == 0 || index >= count) && npc_dump[" << i << "].spawn2_dump_index != 0xFFFFFFFF" << endl;
							CleanupLoadZoneState(spawn2_count, &spawn2_dump, &npc_dump, &npcloot_dump, &gmspawntype_dump, &spawn2_loaded, &npc_loaded, &result);
							return -1;
						}
						tmp = spawn2_loaded[npc_dump[i].spawn2_dump_index];
						spawn2_loaded[npc_dump[i].spawn2_dump_index] = 0;
					}
					if (npc_dump[i].npctype_id == 0) {
						if (npc_dump[i].gmspawntype_index == 0xFFFFFFFF) {
							cerr << "Error in LoadZoneState: gmspawntype index invalid" << endl;
							safe_delete(tmp);

							CleanupLoadZoneState(spawn2_count, &spawn2_dump, &npc_dump, &npcloot_dump, &gmspawntype_dump, &spawn2_loaded, &npc_loaded, &result);
							return -1;
						}
						else {
							if (gmspawntype_dump == 0 || npc_dump[i].gmspawntype_index >= gmspawntype_count) {
								cerr << "Error in LoadZoneState: (gmspawntype_dump == 0 || index >= count) && npc_dump[" << i << "].npctype_id == 0" << endl;
								safe_delete(tmp);

								CleanupLoadZoneState(spawn2_count, &spawn2_dump, &npc_dump, &npcloot_dump, &gmspawntype_dump, &spawn2_loaded, &npc_loaded, &result);
								return -1;
							}
							npc_loaded[i] = new NPC(&gmspawntype_dump[npc_dump[i].gmspawntype_index], tmp, npc_dump[i].x, npc_dump[i].y, npc_dump[i].z, npc_dump[i].heading, FlyMode3, npc_dump[i].corpse);
						}
					}
					else {
						const NPCType* crap = database.GetNPCType(npc_dump[i].npctype_id);
						if (crap != 0)
							npc_loaded[i] = new NPC(crap, tmp, npc_dump[i].x, npc_dump[i].y, npc_dump[i].z, npc_dump[i].heading, FlyMode3, npc_dump[i].corpse);
						else {
							cerr << "Error in LoadZoneState: Unknown npctype_id: " << npc_dump[i].npctype_id << endl;
							safe_delete(tmp);
						}
					}
					if (npc_loaded[i] != 0) {
						npc_loaded[i]->AddCash(npc_dump[i].copper, npc_dump[i].silver, npc_dump[i].gold, npc_dump[i].platinum);
						//							if (npc_dump[i].corpse) {
						//								if (npc_dump[i].decay_time_left <= elapsedtime)
						//									npc_loaded[i]->SetDecayTimer(0);
						//								else
						//									npc_loaded[i]->SetDecayTimer(npc_dump[i].decay_time_left - elapsedtime);
						//							}
						entity_list.AddNPC(npc_loaded[i]);
					}
				}
			}

			npcloot_count = atoi(row[2]);
			cout << "npcloot_count: " << npcloot_count << endl;
			if (lengths[6] != (sizeof(ZSDump_NPC_Loot) * npcloot_count)) {
				cerr << "Error in LoadZoneState: npcloot_dump length mismatch l=" << lengths[6] << ", e=" << (sizeof(ZSDump_NPC_Loot) * npcloot_count) << endl;
				CleanupLoadZoneState(spawn2_count, &spawn2_dump, &npc_dump, &npcloot_dump, &gmspawntype_dump, &spawn2_loaded, &npc_loaded, &result);
				return -1;
			}
			else if (npcloot_count > 0) {
				if (npc_loaded == 0) {
					cerr << "Error in LoadZoneState: npcloot_count > 0 && npc_loaded == 0" << endl;
					CleanupLoadZoneState(spawn2_count, &spawn2_dump, &npc_dump, &npcloot_dump, &gmspawntype_dump, &spawn2_loaded, &npc_loaded, &result);
					return -1;
				}
				npcloot_dump = new ZSDump_NPC_Loot[npcloot_count];
				memcpy(npcloot_dump, row[6], lengths[6]);
				for (i=0; i < npcloot_count; i++) {
					if (npcloot_dump[i].npc_dump_index >= npc_count) {
						cerr << "Error in LoadZoneState: npcloot_dump[" << i << "].npc_dump_index >= npc_count" << endl;
						CleanupLoadZoneState(spawn2_count, &spawn2_dump, &npc_dump, &npcloot_dump, &gmspawntype_dump, &spawn2_loaded, &npc_loaded, &result);
						return -1;
					}
					if (npc_loaded[npcloot_dump[i].npc_dump_index] != 0) {
						npc_loaded[npcloot_dump[i].npc_dump_index]->AddItem(npcloot_dump[i].itemid, npcloot_dump[i].charges, npcloot_dump[i].equipSlot);
					}
				}
			}
			CleanupLoadZoneState(spawn2_count, &spawn2_dump, &npc_dump, &npcloot_dump, &gmspawntype_dump, &spawn2_loaded, &npc_loaded, &result);
		}
		else {
			CleanupLoadZoneState(spawn2_count, &spawn2_dump, &npc_dump, &npcloot_dump, &gmspawntype_dump, &spawn2_loaded, &npc_loaded, &result);
			return 0;
		}
		CleanupLoadZoneState(spawn2_count, &spawn2_dump, &npc_dump, &npcloot_dump, &gmspawntype_dump, &spawn2_loaded, &npc_loaded, &result);
	}
	else {
		cerr << "Error in LoadZoneState query '" << query << "' " << errbuf << endl;

		safe_delete_array(query);
		return -1;
	}

	return 1;
}

void CleanupLoadZoneState(int32 spawn2_count, ZSDump_Spawn2** spawn2_dump, ZSDump_NPC** npc_dump, ZSDump_NPC_Loot** npcloot_dump, NPCType** gmspawntype_dump, Spawn2*** spawn2_loaded, NPC*** npc_loaded, MYSQL_RES** result) {
	safe_delete(*spawn2_dump);
	safe_delete(*spawn2_loaded);
	safe_delete(*gmspawntype_dump);
	safe_delete(*npc_dump);
	safe_delete(*npc_loaded);
	safe_delete(*npcloot_dump);
	if (*result) {
		mysql_free_result(*result);
		*result = 0;
	}
}

void Zone::SpawnStatus(Mob* client) {
	LinkedListIterator<Spawn2*> iterator(spawn2_list);

	int32 x = 0;
	iterator.Reset();
	while(iterator.MoreElements())
	{
		if (iterator.GetData()->timer.GetRemainingTime() == 0xFFFFFFFF)
			client->Message(0, "  %d:  %1.1f, %1.1f, %1.1f:  disabled", iterator.GetData()->GetID(), iterator.GetData()->GetX(), iterator.GetData()->GetY(), iterator.GetData()->GetZ());
		else
			client->Message(0, "  %d:  %1.1f, %1.1f, %1.1f:  %1.2f", iterator.GetData()->GetID(), iterator.GetData()->GetX(), iterator.GetData()->GetY(), iterator.GetData()->GetZ(), (float)iterator.GetData()->timer.GetRemainingTime() / 1000);

		x++;
		iterator.Advance();
	}
	client->Message(0, "%i spawns listed.", x);
}

void Zone::ShowEnabledSpawnStatus(Mob* client)
{
	LinkedListIterator<Spawn2*> iterator(spawn2_list);
	int x = 0;
	int iEnabledCount = 0;

	iterator.Reset();

	while(iterator.MoreElements())
	{
		if (iterator.GetData()->timer.GetRemainingTime() != 0xFFFFFFFF)
		{
			client->Message(0, "  %d:  %1.1f, %1.1f, %1.1f:  %1.2f", iterator.GetData()->GetID(), iterator.GetData()->GetX(), iterator.GetData()->GetY(), iterator.GetData()->GetZ(), (float)iterator.GetData()->timer.GetRemainingTime() / 1000);
			iEnabledCount++;
		}

		x++;
		iterator.Advance();
	}

	client->Message(0, "%i of %i spawns listed.", iEnabledCount, x);
}

void Zone::ShowDisabledSpawnStatus(Mob* client)
{
	LinkedListIterator<Spawn2*> iterator(spawn2_list);
	int x = 0;
	int iDisabledCount = 0;

	iterator.Reset();

	while(iterator.MoreElements())
	{
		if (iterator.GetData()->timer.GetRemainingTime() == 0xFFFFFFFF)
		{
			client->Message(0, "  %d:  %1.1f, %1.1f, %1.1f:  disabled", iterator.GetData()->GetID(), iterator.GetData()->GetX(), iterator.GetData()->GetY(), iterator.GetData()->GetZ());
			iDisabledCount++;
		}

		x++;
		iterator.Advance();
	}

	client->Message(0, "%i of %i spawns listed.", iDisabledCount, x);
}

void Zone::ShowSpawnStatusByID(Mob* client, uint32 spawnid)
{
	LinkedListIterator<Spawn2*> iterator(spawn2_list);
	int x = 0;
	int iSpawnIDCount = 0;

	iterator.Reset();

	while(iterator.MoreElements())
	{
		if (iterator.GetData()->GetID() == spawnid)
		{
			if (iterator.GetData()->timer.GetRemainingTime() == 0xFFFFFFFF)
				client->Message(0, "  %d:  %1.1f, %1.1f, %1.1f:  disabled", iterator.GetData()->GetID(), iterator.GetData()->GetX(), iterator.GetData()->GetY(), iterator.GetData()->GetZ());
			else
				client->Message(0, "  %d:  %1.1f, %1.1f, %1.1f:  %1.2f", iterator.GetData()->GetID(), iterator.GetData()->GetX(), iterator.GetData()->GetY(), iterator.GetData()->GetZ(), (float)iterator.GetData()->timer.GetRemainingTime() / 1000);

			iSpawnIDCount++;

			break;
		}

		x++;
		iterator.Advance();
	}

	if(iSpawnIDCount > 0)
		client->Message(0, "%i of %i spawns listed.", iSpawnIDCount, x);
	else
		client->Message(0, "No matching spawn id was found in this zone.");
}


bool Zone::RemoveSpawnEntry(uint32 spawnid)
{
	LinkedListIterator<Spawn2*> iterator(spawn2_list);


	iterator.Reset();
	while(iterator.MoreElements())
	{
		if(iterator.GetData()->GetID() == spawnid)
		{
			iterator.RemoveCurrent();
			return true;
		}
		else
		iterator.Advance();
	}
return false;
}

bool Zone::RemoveSpawnGroup(uint32 in_id) {
	if(spawn_group_list.RemoveSpawnGroup(in_id))
		return true;
	else
		return false;
}


// Added By Hogie
bool ZoneDatabase::GetDecayTimes(npcDecayTimes_Struct* npcCorpseDecayTimes) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	int i = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if (RunQuery(query, MakeAnyLenString(&query, "SELECT varname, value FROM variables WHERE varname like 'decaytime%%' ORDER BY varname"), errbuf, &result)) {
		safe_delete_array(query);
		while((row = mysql_fetch_row(result))) {
			Seperator sep(row[0]);
			npcCorpseDecayTimes[i].minlvl = atoi(sep.arg[1]);
			npcCorpseDecayTimes[i].maxlvl = atoi(sep.arg[2]);
			if (atoi(row[1]) > 7200)
				npcCorpseDecayTimes[i].seconds = 720;
			else
				npcCorpseDecayTimes[i].seconds = atoi(row[1]);
			i++;
		}
		mysql_free_result(result);
	}
	else {
		safe_delete_array(query);
		return false;
	}
	return true;
}// Added By Hogie -- End

void Zone::weatherSend()
{
	/*switch(zone_weather)
	{
	case 0:
		entity_list.Message(0, 0, "The sky clears.");
		break;
	case 1:
		entity_list.Message(0, 0, "Raindrops begin to fall from the sky.");
		break;
	case 2:
		entity_list.Message(0, 0, "Snowflakes begin to fall from the sky.");
		break;
	default:
		entity_list.Message(0, 0, "Strange weather patterns form in the sky. (%i)", zone_weather);
		break;
	}*/
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_Weather, 8);
	if(zone_weather>0)
		outapp->pBuffer[0] = zone_weather-1;
	if(zone_weather>0)
		outapp->pBuffer[4] = 0x10+(rand()%10); // This number changes in the packets, intensity?
	entity_list.QueueClients(0, outapp);
	safe_delete(outapp);
}

bool Zone::HasGraveyard() {
	bool Result = false;

	if(graveyard_zoneid() > 0)
		Result = true;

	return Result;
}

void Zone::SetGraveyard(int32 zoneid, int32 x, int32 y, int32 z, int32 heading) {
	pgraveyard_zoneid = zoneid;
	pgraveyard_x = x;
	pgraveyard_y = y;
	pgraveyard_z = z;
	pgraveyard_heading = heading;
}

void Zone::LoadBlockedSpells(int32 zoneid)
{
	if(!blocked_spells)
	{
		totalBS = database.GetBlockedSpellsCount(zoneid);
		if(totalBS > 0){
			blocked_spells = new ZoneSpellsBlocked[totalBS];
			if(!database.LoadBlockedSpells(totalBS, blocked_spells, zoneid))
			{
				LogFile->write(EQEMuLog::Error, "... Failed to load blocked spells.");
				ClearBlockedSpells();
			}
		}
	}
}

void Zone::ClearBlockedSpells()
{
	if(blocked_spells){
		safe_delete_array(blocked_spells);
		totalBS = 0;
	}
}

bool Zone::IsSpellBlocked(int32 spell_id, float nx, float ny, float nz)
{
	if(blocked_spells){
		for(int x = 0; x < totalBS; x++)
		{
			if(spell_id != blocked_spells[x].spellid)
				continue;

			switch(blocked_spells[x].type){
				case 1:{
					return true;
					break;
				}

				case 2:{
					if((( nx >= (blocked_spells[x].x-blocked_spells[x].xdiff)) && (nx <= (blocked_spells[x].x+blocked_spells[x].xdiff))) &&
						(( ny >= (blocked_spells[x].y-blocked_spells[x].ydiff)) && (ny <= (blocked_spells[x].y+blocked_spells[x].ydiff))) &&
						(( nz >= (blocked_spells[x].z-blocked_spells[x].zdiff)) && (nz <= (blocked_spells[x].z+blocked_spells[x].zdiff))))
					{
						return true;
					}
					break;
				}
				default:
					continue;
					break;
			}
		}
	}
	return false;
}

const char* Zone::GetSpellBlockedMessage(int32 spell_id, float nx, float ny, float nz)
{
	if(blocked_spells){
		for(int x = 0; x < totalBS; x++)
		{
			if(spell_id != blocked_spells[x].spellid)
				continue;

			switch(blocked_spells[x].type){
				case 1:{
					return blocked_spells[x].message;
					break;
				}

				case 2:{
					if((( nx > (blocked_spells[x].x-blocked_spells[x].xdiff)) && (nx < (blocked_spells[x].x+blocked_spells[x].xdiff))) &&
						(( ny > (blocked_spells[x].y-blocked_spells[x].ydiff)) && (ny < (blocked_spells[x].y+blocked_spells[x].ydiff))) &&
						(( nz > (blocked_spells[x].z-blocked_spells[x].zdiff)) && (nz < (blocked_spells[x].z+blocked_spells[x].zdiff))))
					{
						return blocked_spells[x].message;
					}
					break;
				}
				default:
					continue;
					break;
			}
		}
	}
	return "Error: Message String Not Found\0";
}

void Zone::LoadAdventures()
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if(database.RunQuery(query,MakeAnyLenString(&query,"SELECT id, zone, zone_version, "
		"is_hard, is_raid, min_level, max_level, type, type_data, type_count, assa_x, "
		"assa_y, assa_z, assa_h, text, duration, zone_in_time, win_points, lose_points, "
		"theme, zone_in_zone_id, zone_in_x, zone_in_y, zone_in_object_id, dest_x, dest_y,"
		" dest_z, dest_h FROM adventure_template"), errbuf, &result)) 
	{
		while((row = mysql_fetch_row(result))) 
		{
			int8 x = 0;
			AdventureInfo *ai = new AdventureInfo;
			ai->id = atoi(row[x++]);
			ai->zone_name = row[x++];
			ai->zone_version = atoi(row[x++]);
			ai->is_hard = atoi(row[x++]);
			ai->is_raid = atoi(row[x++]);
			ai->min_level = atoi(row[x++]);
			ai->max_level = atoi(row[x++]);
			ai->type = (AdventureObjective)atoi(row[x++]);
			ai->type_data = atoi(row[x++]);
			ai->type_count = atoi(row[x++]);
			ai->assa_x = atof(row[x++]);
			ai->assa_y = atof(row[x++]);
			ai->assa_z = atof(row[x++]);
			ai->assa_h = atof(row[x++]);
			ai->text = row[x++];
			ai->duration = atoi(row[x++]);
			ai->zone_in_time = atoi(row[x++]);
			ai->win_points = atoi(row[x++]);
			ai->lose_points = atoi(row[x++]);
			ai->theme = atoi(row[x++]);
			ai->zone_in_zone_id = atoi(row[x++]);
			ai->zone_in_x = atof(row[x++]);
			ai->zone_in_y = atof(row[x++]);
			ai->zone_in_object_id = atoi(row[x++]);
			ai->dest_x = atof(row[x++]);
			ai->dest_y = atof(row[x++]);
			ai->dest_z = atof(row[x++]);
			ai->dest_h = atof(row[x++]);
			adventure_list[ai->id] = ai;
		}
		mysql_free_result(result);
		safe_delete_array(query);
	}
	else
	{
		LogFile->write(EQEMuLog::Error, "Error in Zone::LoadAdventures: %s (%s)", query, errbuf);
		safe_delete_array(query);
		return;
	}
}

void Zone::LoadAdventureEntries()
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if(database.RunQuery(query,MakeAnyLenString(&query,"SELECT id, template_id FROM adventure_template_entry"),errbuf,&result)) {
		while((row = mysql_fetch_row(result))) 
		{
			int32 id = atoi(row[0]);
			int32 template_id = atoi(row[1]);

			AdventureInfo *ai = NULL;
			std::map<uint32,AdventureInfo*>::iterator it;
			it = adventure_list.find(template_id);
			if(it == adventure_list.end())
			{
				continue;
			}
			else
			{
				ai = adventure_list[template_id];
			}

			std::list<AdventureInfo*> temp;
			std::map<uint32,std::list<AdventureInfo*> >::iterator iter;

			iter = adventure_entry_list.find(id);
			if(iter == adventure_entry_list.end())
			{
				temp.push_back(ai);
				adventure_entry_list[id] = temp;
			}
			else
			{
				temp = adventure_entry_list[id];
				temp.push_back(ai);
				adventure_entry_list[id] = temp;
			}
		}
		mysql_free_result(result);
		safe_delete_array(query);
	}
	else
	{
		LogFile->write(EQEMuLog::Error, "Error in Zone::LoadAdventureEntries: %s (%s)", query, errbuf);
		safe_delete_array(query);
		return;
	}
}

void Zone::LoadAdventureFlavor()
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if(database.RunQuery(query,MakeAnyLenString(&query,"SELECT id, text FROM adventure_template_entry_flavor"),errbuf,&result)) {
		while((row = mysql_fetch_row(result))) 
		{
			int32 id = atoi(row[0]);
			std::string in_str = row[1];
			adventure_entry_list_flavor[id] = in_str;
		}
		mysql_free_result(result);
		safe_delete_array(query);
	}
	else
	{
		LogFile->write(EQEMuLog::Error, "Error in Zone::LoadAdventureFlavor: %s (%s)", query, errbuf);
		safe_delete_array(query);
		return;
	}
}

void Zone::LoadActiveAdventures()
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if(database.RunQuery(query,MakeAnyLenString(&query,"SELECT `id`, `adventure_id`, `instance_id`, `count`, `assassinate_count`, `status`, "
		"`time_created`, `time_zoned`, `time_completed` FROM `adventure_details`"),errbuf,&result)) {
		while((row = mysql_fetch_row(result))) 
		{
			int8 x = 0;
			AdventureDetails *ad = new AdventureDetails;
			ad->id = atoi(row[x++]);
			ad->ai = adventure_list[atoi(row[x++])];
			ad->instance_id = atoi(row[x++]);
			ad->count = atoi(row[x++]);
			ad->assassinate_count = atoi(row[x++]);
			ad->status = atoi(row[x++]);
			ad->time_created = atoi(row[x++]);
			ad->time_zoned = atoi(row[x++]);
			ad->time_completed = atoi(row[x++]);
			active_adventures[ad->id] = ad;
		}
		mysql_free_result(result);
		safe_delete_array(query);
	}
	else
	{
		LogFile->write(EQEMuLog::Error, "Error in Zone::LoadActiveAdventures: %s (%s)", query, errbuf);
		safe_delete_array(query);
		return;
	}
}

void Zone::UpdateAdventureCount(AdventureDetails *ad)
{
	if(ad && ad->ai)
	{
		if(ad->status == 3)
			return;

		database.IncrementAdventureCount(ad->id);
		ServerPacket *pack = new ServerPacket(ServerOP_AdventureCount, sizeof(ServerAdventureCount_Struct));
		ServerAdventureCount_Struct *ac = (ServerAdventureCount_Struct*)pack->pBuffer;
		ac->id = ad->id;
		ac->count = ++ad->count;
		worldserver.SendPacket(pack);
		safe_delete(pack);

		if(ad->ai->type_count == (ad->count))
		{
			timeval tv;
			gettimeofday(&tv, NULL);
			database.UpdateAdventureStatus(ad->id, 3);
			database.UpdateAllAdventureStatsEntry(ad->id, ad->ai->theme, true);

			if(ad->status == 1)
			{
				database.UpdateAdventureCompleted(ad->id, tv.tv_sec);
				database.RemovePlayersFromAdventure(ad->id);
				database.RemoveClientsFromInstance(ad->instance_id);

				ServerPacket *pack2 = new ServerPacket(ServerOP_AdventureFinish, sizeof(ServerAdventureFinish_Struct));
				ServerAdventureFinish_Struct *afin = (ServerAdventureFinish_Struct*)pack2->pBuffer;
				afin->id = ad->id;
				afin->win_lose = 1;
				afin->points = ad->ai->win_points;
				afin->update_stats = true;
				worldserver.SendPacket(pack2);
				safe_delete(pack2);

				//send new status to all players
				ServerPacket *pack = new ServerPacket(ServerOP_AdventureUpdate, sizeof(ServerAdventureUpdate_Struct));
				ServerAdventureUpdate_Struct *au = (ServerAdventureUpdate_Struct*)pack->pBuffer;
				au->id = ad->id;
				au->new_timec = 1;
				au->new_status = 1;
				au->status = 3;
				au->time_c = tv.tv_sec;
				worldserver.SendPacket(pack);
				safe_delete(pack);

				database.SetInstanceDuration(ad->instance_id, RuleI(Adventure, LDoNAdventureExpireTime));
				ServerPacket *instance_pack = new ServerPacket(ServerOP_InstanceUpdateTime, sizeof(ServerInstanceUpdateTime_Struct));
				ServerInstanceUpdateTime_Struct *iut = (ServerInstanceUpdateTime_Struct*)instance_pack->pBuffer;
				iut->instance_id = ad->instance_id;
				iut->new_duration = RuleI(Adventure, LDoNAdventureExpireTime);
				worldserver.SendPacket(instance_pack);
				safe_delete(instance_pack);
			}
			else if(ad->status == 2)
			{
				database.RemovePlayersFromAdventure(ad->id);
				database.RemoveClientsFromInstance(ad->instance_id);

				ServerPacket *pack2 = new ServerPacket(ServerOP_AdventureFinish, sizeof(ServerAdventureFinish_Struct));
				ServerAdventureFinish_Struct *afin = (ServerAdventureFinish_Struct*)pack2->pBuffer;
				afin->id = ad->id;
				afin->win_lose = 1;
				afin->points = ad->ai->lose_points;
				afin->update_stats = true;
				worldserver.SendPacket(pack2);
				safe_delete(pack2);

				//send new status to all players
				ServerPacket *pack = new ServerPacket(ServerOP_AdventureUpdate, sizeof(ServerAdventureUpdate_Struct));
				ServerAdventureUpdate_Struct *au = (ServerAdventureUpdate_Struct*)pack->pBuffer;
				au->id = ad->id;
				au->new_status = 1;
				au->status = 3;
				worldserver.SendPacket(pack);
				safe_delete(pack);
			}
		}
	}
}

void Zone::SetInstanceTimer(int32 new_duration)
{
	if(Instance_Timer)
	{
		Instance_Timer->Start(new_duration * 1000);
	}
}

void Zone::LoadLDoNTraps()
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if(database.RunQuery(query,MakeAnyLenString(&query,"SELECT id, type, spell_id, "
		"skill, locked FROM ldon_trap_templates"), errbuf, &result)) 
	{
		while((row = mysql_fetch_row(result))) 
		{
			int8 x = 0;
			LDoNTrapTemplate *lt = new LDoNTrapTemplate;
			lt->id = atoi(row[x++]);
			lt->type = (LDoNChestTypes)atoi(row[x++]);
			lt->spell_id = atoi(row[x++]);
			lt->skill = atoi(row[x++]);
			lt->locked = atoi(row[x++]);
			ldon_trap_list[lt->id] = lt;
		}
		mysql_free_result(result);
		safe_delete_array(query);
	}
	else
	{
		LogFile->write(EQEMuLog::Error, "Error in Zone::LoadLDoNTraps: %s (%s)", query, errbuf);
		safe_delete_array(query);
		return;
	}
}

void Zone::LoadLDoNTrapEntries()
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if(database.RunQuery(query,MakeAnyLenString(&query,"SELECT id, trap_id FROM ldon_trap_entries"),errbuf,&result)) {
		while((row = mysql_fetch_row(result))) 
		{
			int32 id = atoi(row[0]);
			int32 trap_id = atoi(row[1]);

			LDoNTrapTemplate *tt = NULL;
			std::map<uint32,LDoNTrapTemplate*>::iterator it;
			it = ldon_trap_list.find(trap_id);
			if(it == ldon_trap_list.end())
			{
				continue;
			}
			else
			{
				tt = ldon_trap_list[trap_id];
			}

			std::list<LDoNTrapTemplate*> temp;
			std::map<uint32,std::list<LDoNTrapTemplate*> >::iterator iter;

			iter = ldon_trap_entry_list.find(id);
			if(iter == ldon_trap_entry_list.end())
			{
				temp.push_back(tt);
				ldon_trap_entry_list[id] = temp;
			}
			else
			{
				temp = ldon_trap_entry_list[id];
				temp.push_back(tt);
				ldon_trap_entry_list[id] = temp;
			}
		}
		mysql_free_result(result);
		safe_delete_array(query);
	}
	else
	{
		LogFile->write(EQEMuLog::Error, "Error in Zone::LoadLDoNTrapEntries: %s (%s)", query, errbuf);
		safe_delete_array(query);
		return;
	}
}

void Zone::LoadVeteranRewards()
{
	VeteranRewards.clear();
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	InternalVeteranReward current_reward;
	int8 idx = 0;

	current_reward.claim_id = 0;
	

	if(database.RunQuery(query,MakeAnyLenString(&query,"SELECT claim_id, name, item_id, charges FROM"
		" veteran_reward_templates WHERE reward_slot < 8 and claim_id > 0 ORDER by claim_id, reward_slot"),
		errbuf,&result)) 
	{
		while((row = mysql_fetch_row(result))) 
		{
			int32 claim = atoi(row[0]);
			if(claim != current_reward.claim_id)
			{
				if(current_reward.claim_id != 0)
				{
					current_reward.claim_count = idx;
					current_reward.number_available = 1;
					VeteranRewards.push_back(current_reward);
				}
				idx = 0;
				memset(&current_reward, 0, sizeof(InternalVeteranReward));
				current_reward.claim_id = claim;
			}

			strcpy(current_reward.items[idx].item_name, row[1]);
			current_reward.items[idx].item_id = atoi(row[2]);
			current_reward.items[idx].charges = atoi(row[3]);
			idx++;
		}

		if(current_reward.claim_id != 0)
		{
			current_reward.claim_count = idx;
			current_reward.number_available = 1;
			VeteranRewards.push_back(current_reward);
		}
		mysql_free_result(result);
		safe_delete_array(query);
	}
	else
	{
		LogFile->write(EQEMuLog::Error, "Error in Zone::LoadVeteranRewards: %s (%s)", query, errbuf);
		safe_delete_array(query);
	}
}

void Zone::UpdateQGlobal(uint32 qid, QGlobal newGlobal)
{
	if(newGlobal.npc_id != 0)
		return;

	if(newGlobal.char_id != 0)
		return;

	if(newGlobal.zone_id == GetZoneID() || newGlobal.zone_id == 0)
	{
		if(qGlobals)
		{
			qGlobals->AddGlobal(qid, newGlobal);
		}
		else
		{
			qGlobals = new QGlobalCache();
			qGlobals->AddGlobal(qid, newGlobal);
		}
	}
}

void Zone::DeleteQGlobal(std::string name, uint32 npcID, uint32 charID, uint32 zoneID)
{
	if(qGlobals)
	{
		qGlobals->RemoveGlobal(name, npcID, charID, zoneID);
	}
}
