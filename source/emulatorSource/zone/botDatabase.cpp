/*	EQEMu EQBOTS:	Everquest Server Emulator
Copyright (C) 2008 EQBOTS  EQEMu AXCLASSIC Development Team (http://www.axclassic.com)

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; version 2 of the License.
	
		This program is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY except by those people which sell it, which
	are required to give you total support for your newly bought product;
	without even the implied warranty of MERCHANTABILITY or FITNESS FOR
	A PARTICULAR PURPOSE.	See the GNU General Public License for more details.
	
		You should have received a copy of the GNU General Public License
		along with this program; if not, write to the Free Software
		Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA	02111-1307	USA
		
	EQBOTS Custom file coded for the AXClassic project

  Angelox: Created for bot-database methods isolation. 
*/

#ifdef EQBOTS
/*
 Franck-adds: EQoffline
 Change the isbot field in the npc_types entries for a given mob: it will become 'bottable'.
 Then, you will make it your bot.
*/
#include "../common/debug.h"
#include <iostream>
using namespace std;
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errmsg.h>
#include <mysqld_error.h>
#include <limits.h>
#include <ctype.h>
#include <assert.h>
#include <map>

// Disgrace: for windows compile
#ifdef WIN32
#include <windows.h>
#define snprintf	_snprintf
#define strncasecmp	_strnicmp
#define strcasecmp	_stricmp
#else
#include "../common/unix.h"
#include <netinet/in.h>
#include <sys/time.h>
#endif

//#include "botDatabase.h"
#include "../common/database.h"
#include "../common/eq_packet_structs.h"
#include "../common/guilds.h"
#include "../common/MiscFunctions.h"
#include "../common/extprofile.h"


void Database::AddBot(int32 mobidtmp) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE npc_types SET isbot=1 where id=%i", mobidtmp), errbuf, 0, &affected_rows)) {
		cerr << "Error in AddBot query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

MYSQL_RES* Database::ListBotGroups(int32 charid) { ///TODO; Finish this, would show bots with groups and ids from the database.
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;

	if(!RunQuery(query, MakeAnyLenString(&query, "SELECT groupid, slot, botid FROM botgroups WHERE charid=%i ORDER BY groupid, slot", charid), errbuf, &result)) {
		cerr << "Error in ListBotGroups query '" << query << "' " << errbuf << endl;
	}
    safe_delete_array(query);
	return result;
}

MYSQL_RES* Database::ListSpawnedBots(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;

	if(!RunQuery(query, MakeAnyLenString(&query, "SELECT bot_name, zone_name FROM botleader WHERE leaderid=%i", id), errbuf, &result)) {
		cerr << "Error in ListSpawnedBots query '" << query << "' " << errbuf << endl;
	}
    safe_delete_array(query);
	return result;
}
// See if a mob is bottable or no by checking the isbot field in the npc_types entrie.
int Database::GetBotStatus(int32 mobidtmp) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int botstatus = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT isbot FROM npc_types WHERE id=%i", mobidtmp), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			botstatus = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in GetBotStatus query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return botstatus;
}

bool Database::DeleteBot(int32 mobid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	bool success = true;
	
	if(!RunQuery(query, MakeAnyLenString(&query, "DELETE from npc_types where id=%i", mobid), errbuf)) {
		success = false;
	}
	if(!RunQuery(query, MakeAnyLenString(&query, "DELETE from botinventory where npctypeid=%i", mobid), errbuf)) {
		success = false;
	}
	if(!RunQuery(query, MakeAnyLenString(&query, "DELETE from botsowners where botnpctypeid=%i", mobid), errbuf)) {
		success = false;
	}
	safe_delete_array(query);
	return success;
}

///TODO Finish this, its a start for simplified raid group creation.
/*
void Database::CreateRaidGroups(int32 groupid, int32 charid, int32 botid, int16 slot, int Class, int tableA, int tableB, int tableC) {
      if (tableA == 1){
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "INSERT into botgroups (groupid, charid, botid, slot) values (%i, %i, %i, %i)", groupid, charid, botid, slot), errbuf, 0, &affected_rows)) {
		cerr << "Error in SaveBotGroups query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
      }
      else if (tableB == 1){
	char errbuf2[MYSQL_ERRMSG_SIZE];
	char *query2 = 0;
	int32 affected_rows2 = 0;

	if(!RunQuery(query2, MakeAnyLenString(&query2, "INSERT into botgroups_b (groupid, charid, botid, slot) values (%i, %i, %i, %i)", groupid, charid, botid, slot), errbuf2, 0, &affected_rows2)) {
		cerr << "Error in SaveBotGroupsB query '" << query2 << "' " << errbuf2 << endl;
	}
	safe_delete_array(query2);
      }
      else if (tableC == 1){
	char errbuf3[MYSQL_ERRMSG_SIZE];
	char *query3 = 0;
	int32 affected_rows3 = 0;

	if(!RunQuery(query3, MakeAnyLenString(&query3, "INSERT into botgroups_c (groupid, charid, botid, slot) values (%i, %i, %i, %i)", groupid, charid, botid, slot), errbuf3, 0, &affected_rows3)) {
		cerr << "Error in SaveBotGroupsC query '" << query3 << "' " << errbuf3 << endl;
	}
	safe_delete_array(query3);
      }

}
*/
void Database::SaveBotGroups(int32 groupid, int32 charid, int32 botid, int16 slot, int tableA, int tableB, int tableC) {
      if (tableA == 1){
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "INSERT into botgroups (groupid, charid, botid, slot) values (%i, %i, %i, %i)", groupid, charid, botid, slot), errbuf, 0, &affected_rows)) {
		cerr << "Error in SaveBotGroups query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
      }
      else if (tableB == 1){
	char errbuf2[MYSQL_ERRMSG_SIZE];
	char *query2 = 0;
	int32 affected_rows2 = 0;

	if(!RunQuery(query2, MakeAnyLenString(&query2, "INSERT into botgroups_b (groupid, charid, botid, slot) values (%i, %i, %i, %i)", groupid, charid, botid, slot), errbuf2, 0, &affected_rows2)) {
		cerr << "Error in SaveBotGroupsB query '" << query2 << "' " << errbuf2 << endl;
	}
	safe_delete_array(query2);
      }
      else if (tableC == 1){
	char errbuf3[MYSQL_ERRMSG_SIZE];
	char *query3 = 0;
	int32 affected_rows3 = 0;

	if(!RunQuery(query3, MakeAnyLenString(&query3, "INSERT into botgroups_c (groupid, charid, botid, slot) values (%i, %i, %i, %i)", groupid, charid, botid, slot), errbuf3, 0, &affected_rows3)) {
		cerr << "Error in SaveBotGroupsC query '" << query3 << "' " << errbuf3 << endl;
	}
	safe_delete_array(query3);
      }

}

void Database::DeleteBotGroups(int32 charid, int tableA, int tableB, int tableC) {
      if (tableA == 1){
	char errbuf1[MYSQL_ERRMSG_SIZE];
	char *query1 = 0;
	int32 affected_rows1 = 0;

	if(!RunQuery(query1, MakeAnyLenString(&query1, "DELETE FROM botgroups where charid=%i", charid), errbuf1, 0, &affected_rows1)) {
		cerr << "Error in DeleteBotGroups query '" << query1 << "' " << errbuf1 << endl;
	}
	safe_delete_array(query1);
      }
      else if (tableB == 1){
	char errbuf2[MYSQL_ERRMSG_SIZE];
	char *query2 = 0;
	int32 affected_rows2 = 0;

	if(!RunQuery(query2, MakeAnyLenString(&query2, "DELETE FROM botgroups_b where charid=%i", charid), errbuf2, 0, &affected_rows2)) {
		cerr << "Error in DeleteBotGroupsB query '" << query2 << "' " << errbuf2 << endl;
	}
	safe_delete_array(query2);
      }
      else if (tableC == 1){
	char errbuf3[MYSQL_ERRMSG_SIZE];
	char *query3 = 0;
	int32 affected_rows3 = 0;

	if(!RunQuery(query3, MakeAnyLenString(&query3, "DELETE FROM botgroups_c where charid=%i", charid), errbuf3, 0, &affected_rows3)) {
		cerr << "Error in DeleteBotGroupsC query '" << query3 << "' " << errbuf3 << endl;
	}
	safe_delete_array(query3);
      }
}

MYSQL_RES* Database::LoadBotGroups(int32 charid, int tableA, int tableB, int tableC) {
      if (tableA ==1){
	char errbuf1[MYSQL_ERRMSG_SIZE];
	char* query1 = 0;
	MYSQL_RES* result1;

	if(!RunQuery(query1, MakeAnyLenString(&query1, "SELECT groupid, botid from botgroups WHERE charid=%i order by charid, groupid, slot", charid), errbuf1, &result1)) {
		cerr << "Error in LoadBotGroups query '" << query1 << "' " << errbuf1 << endl;
	}
    safe_delete_array(query1);
	return result1;
      }
      else if (tableB ==1){
	char errbuf2[MYSQL_ERRMSG_SIZE];
	char* query2 = 0;
	MYSQL_RES* result2;

	if(!RunQuery(query2, MakeAnyLenString(&query2, "SELECT groupid, botid from botgroups_b WHERE charid=%i order by charid, groupid, slot", charid), errbuf2, &result2)) {
		cerr << "Error in LoadBotGroups_b query '" << query2 << "' " << errbuf2 << endl;
	}
    safe_delete_array(query2);
	return result2;
      }
      else if (tableC ==1){
	char errbuf3[MYSQL_ERRMSG_SIZE];
	char* query3 = 0;
	MYSQL_RES* result3;

	if(!RunQuery(query3, MakeAnyLenString(&query3, "SELECT groupid, botid from botgroups_c WHERE charid=%i order by charid, groupid, slot", charid), errbuf3, &result3)) {
		cerr << "Error in LoadBotGroups_c query '" << query3 << "' " << errbuf3 << endl;
	}
    safe_delete_array(query3);
	return result3;
      }
}
//Angelox: This is for saving the group and keeping them tell player decides to remove.
//It also is used for loading the bots into the active bottemp zoning table.
//Botbank refers to regular groups
void Database::SaveToBotBank(int32 groupid, int32 charid, int32 botid, int16 slot, int32 hp, int32 mana) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;
	
	if (groupid > 19){
	  if(!RunQuery(query, MakeAnyLenString(&query, "INSERT into botbank (groupid, charid, botid, slot, hp, mana) values (%i, %i, %i, %i, %i, %i)", groupid, charid, botid, slot, hp, mana), errbuf, 0, &affected_rows)) {
		cerr << "Error in SaveToBotBank query '" << query << "' " << errbuf << endl;
	  }
	}
	
	else{
	  if(!RunQuery(query, MakeAnyLenString(&query, "INSERT into botgroups (groupid, charid, botid, slot, hp, mana) values (%i, %i, %i, %i, %i, %i)", groupid, charid, botid, slot, hp, mana), errbuf, 0, &affected_rows)) {
		cerr << "Error in SaveToBotGroups query '" << query << "' " << errbuf << endl;
	  }
	}
	safe_delete_array(query);
}

void Database::DeleteFromBotBank(int32 groupid, int32 charid) { //Deletes a bot group
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;
	
	if (groupid > 19){
	  if(!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM botbank WHERE groupid=%i AND charid=%i",groupid, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in DeleteFromBotBank query '" << query << "' " << errbuf << endl;
	  }
	}
	else{
	  if(!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM botgroups WHERE groupid=%i AND charid=%i",groupid, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in DeleteFromBotBank query '" << query << "' " << errbuf << endl;
	  }
	}
	safe_delete_array(query);
}

void Database::DeleteBotGroupEntry(int32 groupid, int32 mobidtmp) { //Deletes one bot
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;
	
	if (groupid > 19){
	  if(!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM botbank WHERE groupid=%i AND botid=%i",groupid, mobidtmp), errbuf, 0, &affected_rows)) {
		cerr << "Error in DeleteBotBotGroupEntry query '" << query << "' " << errbuf << endl;
	  }
	}
	else{
	  if(!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM botgroups WHERE botid=%i", mobidtmp), errbuf, 0, &affected_rows)) {
		cerr << "Error in DeleteBotBotGroupEntry query '" << query << "' " << errbuf << endl;
	  }
	}
	safe_delete_array(query);
}
/*
MYSQL_RES* Database::LoadFromBotBank(int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	
	if(!RunQuery(query, MakeAnyLenString(&query, "SELECT groupid, botid from botbank WHERE charid=%i order by charid, groupid, slot", charid), errbuf, &result)) {
		cerr << "Error in LoadFromBotBank query '" << query << "' " << errbuf << endl;
	}
    safe_delete_array(query);
	return result;
}
*/
MYSQL_RES* Database::LoadFromBotGroups(int32 groupid, int32 charid) { //Used while in Raid mode
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	
	if (groupid > 19){
	  if(!RunQuery(query, MakeAnyLenString(&query, "SELECT groupid, botid from botbank WHERE groupid=%i AND charid=%i order by charid, groupid, slot", groupid, charid), errbuf, &result)) {
		cerr << "Error in LoadFromBotGroups query '" << query << "' " << errbuf << endl;
	  }
	}
	else{
	  if(!RunQuery(query, MakeAnyLenString(&query, "SELECT groupid, botid from botgroups WHERE groupid=%i AND charid=%i order by charid, groupid, slot", groupid, charid), errbuf, &result)) {
		cerr << "Error in LoadFromBotGroups query '" << query << "' " << errbuf << endl;
	  }
	}
    safe_delete_array(query);
	return result;
}

//Angelox: This is for zoning bot/groups - Table bottemp is for zoning. 
void Database::SaveToBotTemp(int32 groupid, int32 charid, int32 botid, int16 slot, int32 hp, int32 mana) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "INSERT into bottemp (groupid, charid, botid, slot, hp, mana) values (%i, %i, %i, %i, %i, %i)", groupid, charid, botid, slot, hp, mana), errbuf, 0, &affected_rows)) {
		cerr << "Error in SaveToBotTemp query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

//copys what's in botgroups to bottemp for zoning purpose. 
void Database::CopyBotBankToBotTemp(int32 groupid, int32 charid) { 
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;
	
	if (groupid > 19){
	  if(!RunQuery(query, MakeAnyLenString(&query, "INSERT INTO bottemp SELECT * FROM botbank WHERE groupid=%i AND charid=%i;",groupid, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in CopyBotBankToBotTemp query '" << query << "' " << errbuf << endl;
	  }
	}
	else{
	  if(!RunQuery(query, MakeAnyLenString(&query, "INSERT INTO bottemp SELECT * FROM botgroups WHERE groupid=%i AND charid=%i;",groupid, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in CopyBotBankToBotTemp query '" << query << "' " << errbuf << endl;
	  }
	}
	safe_delete_array(query);
}


void Database::DeleteFromBotTemp(int32 charid) { //Deletes all characters bots
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM bottemp where charid=%i", charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in DeleteFromBotTemp query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

void Database::DeleteBotTempEntry(int32 mobidtmp) { //Deletes one bot
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

    if(!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM bottemp WHERE botid=%i", mobidtmp), errbuf, 0, &affected_rows)) {
		cerr << "Error in DeleteBotBotTempEntries query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

MYSQL_RES* Database::LoadFromBotTemp(int32 groupid, int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;

	if(!RunQuery(query, MakeAnyLenString(&query, "SELECT groupid, botid from bottemp WHERE groupid=%i AND charid=%i order by charid, groupid, slot",groupid, charid), errbuf, &result)) {
		cerr << "Error in LoadFromBotTemp query '" << query << "' " << errbuf << endl;
	}
    safe_delete_array(query);
	return result;
}

void Database::DeleteBotBuffs(int32 botid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;
	   if(!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM botbuffs WHERE botid=%i",botid), errbuf, 0, &affected_rows)) {
	    cerr << "Error in DeleteBotBuffs query '" << query << "' " << errbuf << endl;
	   }
	 safe_delete_array(query);
}

int32 Database::GetSavedBotGroupID(int32 botid){
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
	int32 botGroupID = 0;
	if(RunQuery(query, MakeAnyLenString(&query, "SELECT groupid FROM botgroups WHERE botid=%i", botid), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			botGroupID = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in GetSavedBotGroupID query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return botGroupID;
}

int32 Database::GetBotGroupID(int32 charid){
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
	int32 botGroupID = 0;
	if(RunQuery(query, MakeAnyLenString(&query, "SELECT groupid FROM bottemp WHERE charid=%i LIMIT 0,1", charid), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			botGroupID = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in GetBotGroupID query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return botGroupID;
}

void Database::UpdateBotGroupID(int32 groupid, int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE bottemp SET groupid=%i WHERE charid=%i",groupid, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in UpdateBotGroupID query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}
//Angelox: End zoning routines

// Set the bot leader once it got invited in the group
void Database::SetBotLeader(int32 mobidtmp, int32 leaderid, const char* botName, const char* zoneName, int32 ZoneID) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "INSERT INTO botleader SET botid=%i, leaderid=%i, bot_name='%s', zone_name='%s', zoneid=%i", mobidtmp, leaderid, botName, zoneName, ZoneID), errbuf, 0, &affected_rows)) {
		cerr << "Error in SetBotLeader query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

void Database::SetBotTitle(int32 BotiD, const char* BotTitle) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;
	
	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE npc_types SET lastname='%s' WHERE id=%i",BotTitle, BotiD), errbuf, 0, &affected_rows)) {
		cerr << "Error in SetBotTitle query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

// Who's the bot leader ?
int32 Database::GetBotLeader(int32 mobidtmp) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int32 botleader = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT leaderid FROM botleader WHERE botid=%i", mobidtmp), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			botleader = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in GetBotLeader query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return botleader;
}

//Check to see if bot is in any groups
bool Database::BotHasGroup(int32 botid, int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    bool isThere = false;
	 if(RunQuery(query, MakeAnyLenString(&query, "SELECT botid FROM botgroups WHERE botid=%i AND charid=%i", botid, charid), errbuf, &result)) {
		if(mysql_num_rows(result) > 0) {
			while(row = mysql_fetch_row(result)) {
				if(botid == atoi(row[0])) {
					isThere = true;
				}
			}
		}
	  }

	  else {
		cerr << "Error in BotHasGroup query '" << query << "' " << errbuf << endl;
	  }
    mysql_free_result(result);
    safe_delete_array(query);
    return isThere;
}

//Check If botgroup exists
bool Database::BotGroupExists(int32 groupid, int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
	bool isThere = false;
	if (groupid < 19){
	  if(RunQuery(query, MakeAnyLenString(&query, "SELECT groupid FROM botgroups WHERE groupid=%i AND charid=%i",groupid, charid ), errbuf, &result)) {
		if(mysql_num_rows(result) > 0) {
			while(row = mysql_fetch_row(result)) {
				if(groupid == atoi(row[0])) {
					isThere = true;
				}
			}
		}
	  }
	  else {
		cerr << "Error in BotGroupExists-botgroups query '" << query << "' " << errbuf << endl;
	    }
	}
	else{
	  if(RunQuery(query, MakeAnyLenString(&query, "SELECT groupid FROM botbank WHERE groupid=%i AND charid=%i",groupid, charid ), errbuf, &result)) {
		if(mysql_num_rows(result) > 0) {
			while(row = mysql_fetch_row(result)) {
				if(groupid == atoi(row[0])) {
					isThere = true;
				}
			}
		}
	  }
	  else {
		cerr << "Error in BotGroupExists-botbank query '" << query << "' " << errbuf << endl;
	  }
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return isThere;
}

bool Database::IsBotSpawned(int32 id, int botid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    bool isSpawned = false;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT botid FROM botleader WHERE leaderid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) > 0) {
			while(row = mysql_fetch_row(result)) {
				if(botid == atoi(row[0])) {
					isSpawned = true;
				}
			}
		}
	}
	else {
		cerr << "Error in AllowedBotSpawns query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return isSpawned;
}

int Database::AllowedBotSpawns(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int numberAllowed = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM quest_globals WHERE name='bot_spawn_limit' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			numberAllowed = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in AllowedBotSpawns query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return numberAllowed;
}

//Angelox2 start
//BotCanBindQuery
int Database::BotCanBindLookUp(int32 zone_id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
    int32 bindID = 0;

	if (RunQuery(query, MakeAnyLenString(&query, "SELECT canbindothers FROM zone WHERE zoneidnumber='%u'", zone_id), errbuf, &result))
	{
		if (mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			bindID = atoi(row[0]);
		}
		mysql_free_result(result);
	}
	else
	{
		cerr << "Error in BotCanBindLookUp query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
	return bindID;
}

//Ladder Trophy Lookup
int Database::LadderTrophyLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int trophyCount = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM quest_globals WHERE name='ladder_trophy' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			trophyCount = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in LadderTrophyLookup '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return trophyCount;
}

//Necro-Bots Summon Spell
int Database::BotSummonLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int spellActive = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM quest_globals WHERE name='bot_spell_1' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellActive = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotSummonLookup query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellActive;
}

//Classic2012 Lookup
int Database::Classic2012Lookup() {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int isActive = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM quest_globals WHERE name='Classic2012'"), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			isActive = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in 2012Lookup query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return isActive;
}

//Druid-Bots Circle Spells
int Database::BotCircleLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int spellActive = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM quest_globals WHERE name='bot_spell_2' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellActive = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotCircleLookup query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellActive;
}

//Wizard-Bots Portal Spells
int Database::BotPortalLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int spellActive = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM quest_globals WHERE name='bot_spell_3' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellActive = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotPortalLookup query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellActive;
}

//Bards Selos Spell updater
void Database::UpdateBotSelos(int32 value, int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE quest_globals SET value=%i WHERE charid=%i and name='bard_spell_1'",value, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in UpdateBotSelos query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

//Bot Selos
int Database::BotSelosLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int spellActive = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM quest_globals WHERE name='bard_spell_1' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellActive = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotSelosLookup query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellActive;
}

//Bot Spam status updater
void Database::UpdateBotSpam(int32 value, int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE botspellstate SET value=%i WHERE charid=%i and name='bot_spam'",value, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in UpdateBotSpam query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

//Bot Spam check status
int Database::BotSpamLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	char* query2 = 0;	
	int32 affected_rows = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int spellState = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM botspellstate WHERE name='bot_spam' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellState = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotSpamLookup query '" << query << "' " << errbuf << endl;
	}
	if (spellState == 0){
	  if(!RunQuery(query2, MakeAnyLenString(&query2, "INSERT INTO botspellstate(charid, name, value) values(%i, 'bot_spam', 1 )", id), errbuf, 0, &affected_rows)) {
		cerr << "Error in BotSpamInsert query '" << query2 << "' " << errbuf << endl;
	    }
	   safe_delete_array(query2);		
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellState;
}


//Bot Battle Heal status updater
void Database::UpdateBattleHeal(int32 value, int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE botspellstate SET value=%i WHERE charid=%i and name='battle_heal'",value, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in UpdateBattleHeal query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

//Bot Battle Heal check status
int Database::BattleHealLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	char* query2 = 0;	
	int32 affected_rows = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int spellState = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM botspellstate WHERE name='battle_heal' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellState = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BattleHealLookup query '" << query << "' " << errbuf << endl;
	}
	if (spellState == 0){
	  if(!RunQuery(query2, MakeAnyLenString(&query2, "INSERT INTO botspellstate(charid, name, value) values(%i, 'battle_heal', 1 )", id), errbuf, 0, &affected_rows)) {
		cerr << "Error in BattleHealInsert query '" << query2 << "' " << errbuf << endl;
	    }
	   safe_delete_array(query2);		
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellState;
}

//Bot Taunt updater
void Database::UpdateBotTaunt(int32 value, int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE botspellstate SET value=%i WHERE charid=%i and name='tswitch'",value, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in UpdateBotTaunt query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

//Bot Taunt Status checker
int Database::BotTauntLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	char* query2 = 0;	
	int32 affected_rows = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
	int spellState = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM botspellstate WHERE name='tswitch' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellState = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotTauntLookup query '" << query << "' " << errbuf << endl;
	}
	if (spellState == 0){
	  if(!RunQuery(query2, MakeAnyLenString(&query2, "INSERT INTO botspellstate(charid, name, value) values(%i, 'tswitch', 1 )", id), errbuf, 0, &affected_rows)) {
		cerr << "Error in BotTauntInsert query '" << query2 << "' " << errbuf << endl;
	    }
	   safe_delete_array(query2);		
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellState;
}

//Bot Root status updater
void Database::UpdateBotRoot(int32 value, int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE botspellstate SET value=%i WHERE charid=%i and name='bot_root'",value, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in UpdateBotRoot query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

//Bot Root check status
int Database::BotRootLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	char* query2 = 0;	
	int32 affected_rows = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int spellState = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM botspellstate WHERE name='bot_root' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellState = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotRootLookup query '" << query << "' " << errbuf << endl;
	}
	if (spellState == 0){
	  if(!RunQuery(query2, MakeAnyLenString(&query2, "INSERT INTO botspellstate(charid, name, value) values(%i, 'bot_root', 1 )", id), errbuf, 0, &affected_rows)) {
		cerr << "Error in BotRootInsert query '" << query2 << "' " << errbuf << endl;
	    }
	   safe_delete_array(query2);		
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellState;
}

//Bot Snare status updater
void Database::UpdateBotSnare(int32 value, int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE botspellstate SET value=%i WHERE charid=%i and name='bot_snare'",value, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in UpdateBotSnare query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

//Bot Snare check status
int Database::BotSnareLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	char* query2 = 0;	
	int32 affected_rows = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
        int spellState = 0;
	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM botspellstate WHERE name='bot_snare' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellState = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotSnareLookup query '" << query << "' " << errbuf << endl;

	}
	if (spellState == 0){
	  if(!RunQuery(query2, MakeAnyLenString(&query2, "INSERT INTO botspellstate(charid, name, value) values(%i, 'bot_snare', 1 )", id), errbuf, 0, &affected_rows)) {
		cerr << "Error in BotSnareInsert query '" << query2 << "' " << errbuf << endl;
	    }
	   safe_delete_array(query2);		
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellState;
}

//Bot Lock primary status updater
void Database::UpdateBotLock1(int32 value, int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE botspellstate SET value=%i WHERE charid=%i and name='bot_lock1'",value, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in UpdateBotLock1 query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

//Bot Lock primary status
int Database::BotLock1Lookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	char* query2 = 0;	
	int32 affected_rows = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
        int spellState = 0;
	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM botspellstate WHERE name='bot_Lock1' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellState = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotLock1Lookup query '" << query << "' " << errbuf << endl;

	}
	if (spellState == 0){
	  if(!RunQuery(query2, MakeAnyLenString(&query2, "INSERT INTO botspellstate(charid, name, value) values(%i, 'bot_Lock1', 1 )", id), errbuf, 0, &affected_rows)) {
		cerr << "Error in BotLock1Insert query '" << query2 << "' " << errbuf << endl;
	    }
	   safe_delete_array(query2);		
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellState;
}

//Bot Lock secondary status updater
void Database::UpdateBotLock2(int32 value, int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE botspellstate SET value=%i WHERE charid=%i and name='bot_lock2'",value, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in UpdateBotLock2 query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

//Bot Lock secondary status
int Database::BotLock2Lookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	char* query2 = 0;	
	int32 affected_rows = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
        int spellState = 0;
	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM botspellstate WHERE name='bot_Lock2' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellState = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotLock2Lookup query '" << query << "' " << errbuf << endl;

	}
	if (spellState == 0){
	  if(!RunQuery(query2, MakeAnyLenString(&query2, "INSERT INTO botspellstate(charid, name, value) values(%i, 'bot_Lock2', 1 )", id), errbuf, 0, &affected_rows)) {
		cerr << "Error in BotLock2Insert query '" << query2 << "' " << errbuf << endl;
	    }
	   safe_delete_array(query2);		
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellState;
}

//Bot Mode status updater (NPC or Client)
void Database::UpdateBotClientMode(int32 value, int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE botspellstate SET value=%i WHERE charid=%i and name='bot_client'",value, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in UpdateBotClient query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

//Bot Mode status check (NPC or Client)
int Database::BotClientModeLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	char* query2 = 0;	
	int32 affected_rows = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
        int spellState = 0;
	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM botspellstate WHERE name='bot_client' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellState = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotClientLookup query '" << query << "' " << errbuf << endl;

	}
	if (spellState == 0){
	  if(!RunQuery(query2, MakeAnyLenString(&query2, "INSERT INTO botspellstate(charid, name, value) values(%i, 'bot_client', 1 )", id), errbuf, 0, &affected_rows)) {
		cerr << "Error in BotBotClientInsert query '" << query2 << "' " << errbuf << endl;
	    }
	   safe_delete_array(query2);		
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellState;
}

//Raid optimizer checker
void Database::UpdateBotRaidMode(int32 value, int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE botspellstate SET value=%i WHERE charid=%i and name='bot_raidmode'",value, charid), errbuf, 0, &affected_rows)) {
		cerr << "Error in UpdateBotRaidMode query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

//Raid optimizer updater
int Database::BotRaidModeLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	char* query2 = 0;	
	int32 affected_rows = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
        int spellState = 0;
	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM botspellstate WHERE name='bot_raidmode' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellState = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotRaidModeLookup query '" << query << "' " << errbuf << endl;

	}
	if (spellState == 0){
	  if(!RunQuery(query2, MakeAnyLenString(&query2, "INSERT INTO botspellstate(charid, name, value) values(%i, 'bot_raidmode', 1 )", id), errbuf, 0, &affected_rows)) {
		cerr << "Error in BotRaidModeLookup query '" << query2 << "' " << errbuf << endl;
	    }
	   safe_delete_array(query2);		
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellState;
}

//Cleric-Bots Temperance Spell
int Database::BotTempLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int spellActive = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM quest_globals WHERE name='bot_spell_4' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellActive = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotTempLookup query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellActive;
}

//Enchanter-Bots Tash Spell
int Database::BotTashrLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int spellActive = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM quest_globals WHERE name='bot_spell_5' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellActive = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotTashLookup query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellActive;
}

//Enchanter-Bots AE Tash Spell
int Database::BotWtashrLookup(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int spellActive = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT value FROM quest_globals WHERE name='bot_spell_6' and charid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spellActive = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in BotWtashLookup query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spellActive;
}

// Check Bottemp for bots
int Database::CheckBotTemp(int32 charid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int tempCount = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT COUNT(*) FROM bottemp WHERE charid=%i", charid), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			tempCount = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in CheckBotTemp query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return tempCount;
}

//Angelox2 End

int Database::SpawnedBotCount(int32 id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int spawnedBots = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT COUNT(*) FROM botleader WHERE leaderid=%i", id), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			spawnedBots = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in SpawnedBotCount query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return spawnedBots;
}

int Database::GetBotOwner(int32 mobid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int botowner = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT botleadercharacterid FROM botsowners WHERE botnpctypeid=%i", mobid), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			botowner = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in GetBotOwner query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return botowner;
}

void Database::SetBotOwner(int32 mobid, int32 ownerid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "INSERT INTO botsowners(botleadercharacterid, botnpctypeid) values(%i, %i)", ownerid, mobid), errbuf, 0, &affected_rows)) {
		cerr << "Error in SetBotOwner query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

void Database::UpdateBotOwner(int32 accountid, int32 ownerid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE botsowners set botleadercharacterid=%i where botleadercharacterid=%i", accountid, ownerid), errbuf, 0, &affected_rows)) {
		cerr << "Error in SetBotOwner query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

void Database::UpdateBotStats(int32 hp, int32 mana, int32 botid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE bottemp SET hp=%i, mana=%i WHERE botid=%i",hp, mana, botid), errbuf, 0, &affected_rows)) {
		cerr << "Error in UpdateBotHP query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

int Database::GetBotHP(int32 botid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
	int32 BotHP = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT hp FROM bottemp WHERE botid=%i", botid), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			BotHP = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in GetBotHP query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return BotHP;
}


void Database::UpdateBotArchery(int32 archery, int32 botid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE botsowners set botarchery=%i where botnpctypeid=%i", archery, botid), errbuf, 0, &affected_rows)) {
		cerr << "Error in UpdateBotArchery query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

int Database::GetBotArchery(int32 botid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int botarchery = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT botarchery FROM botsowners WHERE botnpctypeid=%i", botid), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			botarchery = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in GetBotOwner query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return botarchery;
}

// Clean all the bots leader entries when the leader disconnects, zones or LD
void Database::CleanBotLeader(int32 leaderid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM botleader where leaderid=%i", leaderid), errbuf, 0, &affected_rows)) {
		cerr << "Error in CleanBotLeader query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

// Clean the leader entrie for a given mob
void Database::CleanBotLeaderEntries(int32 mobidtmp) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

    if(!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM botleader WHERE botid=%i", mobidtmp), errbuf, 0, &affected_rows)) {
		cerr << "Error in CleanBotLeaderEntries query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

// How many bots have they created?
int Database::CountBots(int32 accountID) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int botCount = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT COUNT(*) FROM botsowners WHERE botleadercharacterid=%i", accountID), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			botCount = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in CountBots query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return botCount;
}

int Database::GetMagePet(int32 botid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int botarchery = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT magepet FROM botsowners WHERE botnpctypeid=%i", botid), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			botarchery = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in GetMagePet query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return botarchery;
}

void Database::SetMagePet(int32 magepet, int32 botid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE botsowners set magepet=%i where botnpctypeid=%i", magepet, botid), errbuf, 0, &affected_rows)) {
		cerr << "Error in SetMagePet query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

// Find an item in the bot inventory at a given slot
int Database::GetBotItemBySlot(int32 botid, int32 slot) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int iteminslot = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT itemid FROM botinventory WHERE npctypeid=%i AND botslotid=%i", botid, slot), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			iteminslot = atoi(row[0]);
		}
	}
	else {
		cerr << "Error in GetBotItemBySlot query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return iteminslot;
}

///Still TODO 
//Get the armor color
uint32 Database::GetEquipmentColor(int32 botid, int32 slot) {
  
	//Bot tints
	int32 slotid = 0;
	uint32 returncolor = 0;
	
	//Translate code slot # to DB slot #
	slotid = Inventory::CalcSlotFromMaterial(slot);

	//read from db
	char* Query = 0;
	MYSQL_RES* DatasetResult;
	MYSQL_ROW DataRow;
	
	if(RunQuery(Query, MakeAnyLenString(&Query, "SELECT color FROM botinventory WHERE npctypeid = %u AND botslotid = %u", botid, slotid), 0, &DatasetResult)) {
		if(mysql_num_rows(DatasetResult) == 1) {
			DataRow = mysql_fetch_row(DatasetResult);
			if(DataRow)
				returncolor = atol(DataRow[0]);
		}
		mysql_free_result(DatasetResult);
		safe_delete_array(Query);
	}
	return returncolor;
}

// Remove an item in the given slot
void Database::RemoveBotItemBySlot(int32 botid, int32 slot, std::string *errorMessage) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;

	if(botid > 0 && slot >= 0) {
		if(!RunQuery(query, MakeAnyLenString(&query, "DELETE FROM botinventory WHERE npctypeid=%i AND botslotid=%i", botid, slot), errbuf)){
			*errorMessage = std::string(errbuf);
		}
		safe_delete_array(query);
	}
}

// Add or change an item at a given slot in the bot inventory
void Database::SetBotItemInSlot(uint32 botID, uint32 slotID, uint32 itemID, const ItemInst* inst, std::string *errorMessage) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	uint32 augslot[5] = { 0, 0, 0, 0, 0 };

	if(botID > 0 && slotID >= 0 && itemID > 0) {
		if (inst && inst->IsType(ItemClassCommon)) {
			for(int i=0; i<5; ++i) {
				ItemInst* auginst = inst->GetItem(i);
				augslot[i] = (auginst && auginst->GetItem()) ? auginst->GetItem()->ID : 0;
			}
		}
		if(!RunQuery(query, MakeAnyLenString(&query,
			"REPLACE INTO botinventory "
			"	(npctypeid,botslotid,itemid,charges,instnodrop,color,"
			"	augslot1,augslot2,augslot3,augslot4,augslot5)"
			" VALUES(%lu,%lu,%lu,%lu,%lu,%lu,"
			"	%lu,%lu,%lu,%lu,%lu)",
			(unsigned long)botID, (unsigned long)slotID, (unsigned long)itemID, (unsigned long)inst->GetCharges(), (unsigned long)(inst->IsInstNoDrop() ? 1:0),(unsigned long)inst->GetColor(),
			(unsigned long)augslot[0],(unsigned long)augslot[1],(unsigned long)augslot[2],(unsigned long)augslot[3],(unsigned long)augslot[4]), errbuf)) {
				*errorMessage = std::string(errbuf);
		}

		safe_delete_array(query);
	}
}

// How many items does the bot have in its inventory ?
int Database::GetBotItemsNumber(int32 botid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
    int itemsnbre = 0;

	if(RunQuery(query, MakeAnyLenString(&query, "SELECT COUNT(*) FROM botinventory WHERE npctypeid=%i", botid), errbuf, &result)) {
		if(mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			itemsnbre = atoi(row[0]);
		}
	}
	else {
        cerr << "Error in GetBotItemsNumber query '" << query << "' " << errbuf << endl;
	}
	mysql_free_result(result);
    safe_delete_array(query);
    return itemsnbre;
}

uint32 Database::GetBotIDByBotName(std::string botName) {
	uint32 Result = 0;

	if(!botName.empty()) {
		char* Query = 0;
		char TempErrorMessageBuffer[MYSQL_ERRMSG_SIZE];
		MYSQL_RES* DatasetResult;
		MYSQL_ROW DataRow;
		std::string errorMessage;

		if(!RunQuery(Query, MakeAnyLenString(&Query, "SELECT id FROM npc_types WHERE name = '%s'", botName.c_str()), TempErrorMessageBuffer, &DatasetResult)) {
			errorMessage = std::string(TempErrorMessageBuffer);
		}
		else {
			while(DataRow = mysql_fetch_row(DatasetResult)) {
				Result = atoi(DataRow[0]);
				break;
			}

			mysql_free_result(DatasetResult);
		}

		safe_delete_array(Query);

		if(!errorMessage.empty()) {
			// TODO: Log this error to zone error log
		}
	}

	return Result;
}
#endif //EQBOTS
