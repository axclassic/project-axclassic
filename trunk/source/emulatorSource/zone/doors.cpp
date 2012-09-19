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
#include "../common/debug.h"
#include <iostream>
#include <stdlib.h>
#include <string.h>
using namespace std;
#include "masterentity.h"
#include "worldserver.h"
#include "StringIDs.h"
#include "zonedb.h"
#include "../common/packet_functions.h"
#include "../common/packet_dump.h"
#include "../common/MiscFunctions.h"
#include "guild_mgr.h"

#define OPEN_DOOR 0x02
#define CLOSE_DOOR 0x03

extern EntityList entity_list;
extern WorldServer worldserver;

#ifdef EQBOTS //Angelox
Timer CheckLockTimer(0);
#endif //EQBOTS

Doors::Doors(const Door* door)
:    close_timer(5000)
{
	db_id = door->db_id;
	door_id = door->door_id;
	strncpy(zone_name,door->zone_name,16);
	strncpy(door_name,door->door_name,32);
	pos_x = door->pos_x;
	pos_y = door->pos_y;
	pos_z = door->pos_z;
	heading = door->heading;
	incline = door->incline;
	opentype = door->opentype;
	guild_id = door->guild_id;
	lockpick = door->lockpick;
	keyitem = door->keyitem;
	keyitem2 = door->keyitem2;
	nokeyring = door->nokeyring;
	trigger_door = door->trigger_door;
	trigger_type = door->trigger_type;
	triggered=false;
	door_param = door->door_param;
	size = door->size;
	invert_state = door->invert_state;
	SetOpenState(false);

	close_timer.Disable();

	strncpy(dest_zone,door->dest_zone,16);
	dest_x = door->dest_x;
	dest_y = door->dest_y;
	dest_z = door->dest_z;
	dest_heading = door->dest_heading;

	is_ldon_door = door->is_ldon_door;

}

Doors::~Doors()
{
}

bool Doors::Process()
{
    if(close_timer.Enabled() && close_timer.Check() && IsDoorOpen())
    {
	triggered=false;
        close_timer.Disable();
        SetOpenState(false);
    }
	return true;
}

void Doors::HandleClick(Client* sender, int8 trigger)
{
	//door debugging info dump
	_log(DOORS__INFO, "%s clicked door %s (dbid %d, eqid %d) at (%.4f,%.4f,%.4f @%.4f)", sender->GetName(), door_name, db_id, door_id, pos_x, pos_y, pos_z, heading);
	_log(DOORS__INFO, "  incline %d, opentype %d, lockpick %d, key %d, nokeyring %d, trigger %d type %d, param %d", incline, opentype, lockpick, keyitem, keyitem2, nokeyring, trigger_door, trigger_type, door_param);
	_log(DOORS__INFO, "  size %d, invert %d, dest: %s (%.4f,%.4f,%.4f @%.4f)", size, invert_state, dest_zone, dest_x, dest_y, dest_z, dest_heading);

    EQApplicationPacket* outapp = new EQApplicationPacket(OP_MoveDoor, sizeof(MoveDoor_Struct));
	MoveDoor_Struct* md = (MoveDoor_Struct*)outapp->pBuffer;
	//DumpPacket(app);
	md->doorid = door_id;
	/////////////////////////////////////////////////////////////////
	//used_pawn: Locked doors! Rogue friendly too =)
	//TODO: add check for other lockpick items
	//////////////////////////////////////////////////////////////////

	if(IsLDoNDoor())
	{
		if(sender)
		{
			if(RuleI(Adventure, ItemIDToEnablePorts) != 0)
			{
				if(!sender->KeyRingCheck(RuleI(Adventure, ItemIDToEnablePorts)))
				{
					if(sender->GetInv().HasItem(RuleI(Adventure, ItemIDToEnablePorts)) == SLOT_INVALID)
			{
				sender->Message_StringID(13, 5141);
				return;
			}
					else
					{
						sender->KeyRingAdd(RuleI(Adventure, ItemIDToEnablePorts));
					}
				}
			}

			AdventureDetails* ad = sender->GetCurrentAdventure();
			if(ad)
			{
				if(ad->ai)
				{
					if(ad->ai->zone_in_object_id == GetDoorDBID())
					{
						int32 zone_id = database.GetZoneID(ad->ai->zone_name.c_str());
						if(ad->instance_id == -1)
						{
							if(zone_id < 1)
							{
								sender->Message(0, "Server was unable to find that zone id.");
								return;
							}

							int16 i_id = 0;
							if(!database.GetUnusedInstanceID(i_id))
							{
								sender->Message(0, "Server was unable to find a free instance id.");
								return;
							}

							if(!database.CreateInstance(i_id, zone_id, ad->ai->zone_version, ad->ai->duration+1800))
							{
								sender->Message(0, "Server was unable to create a new instance.");
								return;
							}

							database.AddAdventureToInstance(ad->id, i_id);
							ServerPacket* pack = new ServerPacket(ServerOP_AdventureUpdate, sizeof(ServerAdventureUpdate_Struct));
							ServerAdventureUpdate_Struct* uas = (ServerAdventureUpdate_Struct*) pack->pBuffer;
							
							timeval tv;
							gettimeofday(&tv, NULL);

							uas->id = ad->id;
							
							uas->new_timez = 1;
							uas->time_z = tv.tv_sec;

							uas->new_inst = 1;
							uas->instance_id = i_id;

							uas->new_status = 1;
							uas->status = 1;

							worldserver.SendPacket(pack);
							safe_delete(pack);

							database.UpdateAdventureStatus(ad->id, 1);
							database.UpdateAdventureInstance(ad->id, i_id, tv.tv_sec);						
							database.AddAdventureToInstance(ad->id, i_id);
							sender->MovePC(zone_id, i_id, ad->ai->dest_x, ad->ai->dest_y, ad->ai->dest_z, ad->ai->dest_h, 0, ZoneSolicited);
							return;
						}
						else
						{
							sender->MovePC(zone_id, ad->instance_id, ad->ai->dest_x, ad->ai->dest_y, ad->ai->dest_z, ad->ai->dest_h, 0, ZoneSolicited);
							return;
						}
					}
					else
					{
						sender->Message_StringID(13, 5143);
						return;
					}
				}
				else
				{
					sender->Message_StringID(13, 5141);
					return;
				}
			}
			else
			{
				sender->Message_StringID(13, 5141);
				return;
			}
		}
	}

	uint32 keyneeded = GetKeyItem();
 	uint32 keyneeded2 = GetKeyItem2();
	int8 keepoffkeyring = GetNoKeyring();
	uint32 haskey = 0;
 	uint32 haskey2 = 0;
	uint32 playerkey = 0;
	const ItemInst *lockpicks = sender->GetInv().GetItem(SLOT_CURSOR);
	
#ifdef EQBOTS //Angelox
	Group *g = entity_list.GetGroupByMob(sender);
	const int spawnedBots = database.SpawnedBotCount(sender->CharacterID());
#endif

	haskey = sender->GetInv().HasItem(keyneeded, 1);
 	haskey2 = sender->GetInv().HasItem(keyneeded2, 1);

	if((haskey != SLOT_INVALID) && (haskey > 0))
	{
		playerkey = keyneeded;
	}
	
	else if((haskey2 != SLOT_INVALID) && (haskey2 > 0))
	{
		playerkey = keyneeded2;
	}

	if(GetTriggerType() == 255)
	{ // this object isnt triggered
		if(trigger == 1)
		{ // this door is only triggered by an object
			if(!IsDoorOpen() || (opentype == 58))
			{
				md->action = OPEN_DOOR;
			}
			else
			{
				md->action = CLOSE_DOOR;
			}
		}
		else
		{
			return;
		}
	}
	
	//If no key needed, open it
	if(((keyneeded == 0) && (keyneeded2 == 0) && (GetLockpick() == 0) && (guild_id == 0)) ||
		(IsDoorOpen() && (opentype == 58)) ||
		((guild_id > 0) && (guild_id == sender->GuildID())))
	{	//door not locked
		if(!IsDoorOpen() || (opentype == 58))
		{
			md->action = OPEN_DOOR;
		}
		else
		{
			md->action = CLOSE_DOOR;
		}
	}
	else //here's most the key lock checks start
	{ 
	  
		// a key is required or the door is locked but can be picked or both
		//sender->Message(4, "This is locked...");
	  
		// guild doors
		if((guild_id > 0) && !sender->GetGM())
		{
			string tmp;
			char tmpmsg[240]; // guild doors msgs
			if(guild_mgr.GetGuildNameByID(guild_id, tmp))
			{
				sprintf(tmpmsg, "Only members of the <%s> guild may enter here", tmp.c_str());
			}
			else
			{
				strcpy(tmpmsg, "Door is locked by an unknown guild");
			}
			sender->Message(4, tmpmsg);
			return;
		}		
		// GM can always open locks - should probably be changed to require a key
		else if(sender->GetGM())
		{
			if(!IsDoorOpen() || (opentype == 58))
			{
				md->action = OPEN_DOOR;
				sender->Message_StringID(4,DOORS_GM);
			}
			else
			{
				md->action = CLOSE_DOOR;
			}
		}

		else if(playerkey)
		{	// they have something they are trying to open it with
			if ((keyneeded || keyneeded2) && (keyneeded  == playerkey || keyneeded2 == playerkey))
			{	// key required and client is using the right key
				if(!IsDoorOpen() || (opentype == 58))
				{
					if (keyneeded == playerkey){
					    if ((!keepoffkeyring) && (playerkey > 1))
					      sender->KeyRingAdd(playerkey); //save regular key to keyring
					  keyneeded2 = 0;
					  sender->Message(4, "You got it open!");
					  md->action = OPEN_DOOR;
					}
					else if (keyneeded2 == playerkey){
					    if (playerkey > 1) 
					      sender->KeyRingAdd(playerkey); //save master key to keyring
					  keyneeded = 0;
					  sender->Message(4, "The gates are yours to control!");
					  md->action = OPEN_DOOR;
					}

				}
				
				else
				{
					md->action = CLOSE_DOOR;
				}
			}
		}
		else if(lockpicks != NULL)
		{
			if(sender->GetSkill(PICK_LOCK))
			{
				if(lockpicks->GetItem()->ItemType == ItemTypeLockPick)
				{
					float modskill=sender->GetSkill(PICK_LOCK);
					sender->CheckIncreaseSkill(PICK_LOCK, NULL, 1);

#if EQDEBUG>=5
					LogFile->write(EQEMuLog::Debug, "Client has lockpicks: skill=%f", modskill);
#endif

					if(GetLockpick() <= modskill)
					{
						if(!IsDoorOpen())
						{
							md->action = OPEN_DOOR;
						}
						else
						{
							md->action = CLOSE_DOOR;
						}
						sender->Message_StringID(4, DOORS_SUCCESSFUL_PICK);
					}
					else
					{
						sender->Message_StringID(4, DOORS_INSUFFICIENT_SKILL);
						return;
					}
				}
				else
				{
					sender->Message_StringID(4, DOORS_NO_PICK);
					return;
				}
			}
			else
			{
				sender->Message_StringID(4, DOORS_CANT_PICK);
				return;
			}
		}

		// locked door and nothing to open it with
		// search for key on keyring
		else if(sender->KeyRingCheck(keyneeded)) //regular key 
		{
			playerkey = keyneeded;
			keyneeded2 = 0;
			if(!IsDoorOpen() || (opentype == 58))
			{ 
				md->action = OPEN_DOOR;
				sender->Message(4, "You got it open!");
			} 
			else
			{ 
				md->action = CLOSE_DOOR; 
			} 
		}
		
		else if(sender->KeyRingCheck(keyneeded2)) //master key
		{
			playerkey = keyneeded2;
			keyneeded = 0;
			if(!IsDoorOpen() || (opentype == 58))
			{ 
				md->action = OPEN_DOOR;
				sender->Message(4, "The gates are yours to control!");
			} 
			else
			{ 
				md->action = CLOSE_DOOR; 
			} 
		}
			
#ifdef EQBOTS 
		// use the rouge bot (must be in group) 
		else if ((g) && (spawnedBots)){
		bool hasRogue = false;
		int picked = MakeRandomInt(1, 3);
		if (GetLockpick() == 0){
		  sender->Message_StringID(4, DOORS_CANT_PICK);
		  return;
		}
		//Lock Delay
		if (CheckLockTimer.GetRemainingTime() < 10)
		    CheckLockTimer.Disable();
		if (CheckLockTimer.Enabled()){
		sender->Message(15, "Not ready yet.");
		    return;
		 }
		 if (!CheckLockTimer.Enabled()){
		    CheckLockTimer.Start(4010);
		 }
		 //End Delay
		if ((!playerkey) && (lockpicks == NULL) && (!sender->KeyRingCheck(keyneeded)) && (!sender->KeyRingCheck(keyneeded2))){
		  for(int i=5; i>=0; i--) {
		      if((g->members[i]) && (g->members[i]->IsBot()) && (g->members[i]->GetClass() == ROGUE)) {
			hasRogue = true;
			    if((hasRogue) && (picked < 2)){	
				if(!IsDoorOpen() || (opentype == 58)){
				    sender->Message(4, "Your rogue bot picked the lock!");
				    md->action = OPEN_DOOR;
				}
				else{
				    md->action = CLOSE_DOOR;
				}
			    }
		    break;
		      }
		  }
		    if (picked >= 2){
		      if(IsDoorOpen())
			md->action = CLOSE_DOOR;

		      if(hasRogue)
		        sender->Message(4, "Your rogue bot failed to pick the lock!");
		      else
		        sender->Message_StringID(4, DOORS_LOCKED);
		      return;
		    }
		    else if (!hasRogue){
		      sender->Message_StringID(4, DOORS_LOCKED);
		      return;
		    }
		 }
	      }
#endif //EQBOTS
	      // nothing else to check with, so it remains locked 
	      else{
		 sender->Message_StringID(4, DOORS_LOCKED);
		 return;
	      }
	}//end lock checks

	entity_list.QueueClients(sender, outapp, false);
	if(!IsDoorOpen() || (opentype == 58))
	{
		close_timer.Start();
		SetOpenState(true);
	}
	else
	{
		close_timer.Disable();
		SetOpenState(false);
	}

	//everything past this point assumes we opened the door
	//and met all the reqs for opening
	//everything to do with closed doors has already been taken care of
	//we return because we don't want people using teleports on an unlocked door (exploit!)
	if(md->action == CLOSE_DOOR)
	{
		safe_delete(outapp);
		return;
	}
	safe_delete(outapp);
	if((GetTriggerDoorID() != 0) && (GetTriggerType() == 1))
	{
		Doors* triggerdoor = entity_list.FindDoor(GetTriggerDoorID());
		if(triggerdoor && !triggerdoor->triggered)
		{
			triggered=true;
			triggerdoor->HandleClick(sender, 1);
		}
		else
		{
			triggered=false;
		}
	}
	else if((GetTriggerDoorID() != 0) && (GetTriggerType() != 1))
	{
		Doors* triggerdoor = entity_list.FindDoor(GetTriggerDoorID());
		if(triggerdoor && !triggerdoor->triggered)
		{
			triggered=true;
			triggerdoor->HandleClick(sender, 0);
		}
		else
		{
			triggered=false;
		}
	}

    if((opentype == 58) && (strncmp(dest_zone, "NONE", strlen("NONE")) != 0))
	{ // Teleport door! 
		if (( strncmp(dest_zone,zone_name,strlen(zone_name)) == 0) && (!keyneeded)) 
		{
			if(!keepoffkeyring)
			{
				sender->KeyRingAdd(playerkey);
			}		
			sender->MovePC(zone->GetZoneID(), zone->GetInstanceID(), dest_x, dest_y, dest_z, dest_heading);
		}
		else if (( !IsDoorOpen() || opentype == 58 ) && (keyneeded && ((keyneeded == playerkey) || sender->GetGM())))
		{
			if(!keepoffkeyring)
			{
				sender->KeyRingAdd(playerkey);
			}		
			if(database.GetZoneID(dest_zone) == zone->GetZoneID())
			{
				sender->MovePC(zone->GetZoneID(), zone->GetInstanceID(), dest_x, dest_y, dest_z, dest_heading);
			}
			else
			{
				sender->MovePC(dest_zone, dest_x, dest_y, dest_z, dest_heading);
			}
		}
		if (( !IsDoorOpen() || opentype == 58 ) && (!keyneeded)) 
		{
			if(database.GetZoneID(dest_zone) == zone->GetZoneID())
			{
				sender->MovePC(zone->GetZoneID(), zone->GetInstanceID(), dest_x, dest_y, dest_z, dest_heading);
			}
			else
			{
				sender->MovePC(dest_zone, dest_x, dest_y, dest_z, dest_heading);
			}
		}
	}
}

void Doors::NPCOpen(NPC* sender)
{

#ifdef EQBOTS
	if ((sender) && (!sender->IsBot())) {
#else
	if(sender) {
#endif //EQBOTS

		if(GetTriggerType() == 255 || GetTriggerDoorID() > 0 || GetLockpick() != 0 || GetKeyItem() != 0 /*|| GetKeyItem2() != 0*/ || opentype == 59 || opentype == 58 || !sender->IsNPC()) { // this object isnt triggered or door is locked - NPCs should not open locked doors!
			return;
		}
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_MoveDoor, sizeof(MoveDoor_Struct));
		MoveDoor_Struct* md=(MoveDoor_Struct*)outapp->pBuffer;
		md->doorid = door_id;
		md->action = OPEN_DOOR;
		entity_list.QueueCloseClients(sender,outapp,false,200);
		safe_delete(outapp);

		if(!isopen) {
			close_timer.Start();
			isopen=true;
		}
		else {
			close_timer.Disable();
			isopen=false;
		}
	}
}

void Doors::ForceOpen(Mob *sender)
{
    EQApplicationPacket* outapp = new EQApplicationPacket(OP_MoveDoor, sizeof(MoveDoor_Struct));
	MoveDoor_Struct* md=(MoveDoor_Struct*)outapp->pBuffer;
	md->doorid = door_id;
	md->action = OPEN_DOOR;
	entity_list.QueueClients(sender,outapp,false);
	safe_delete(outapp);

    if(!isopen) {
        close_timer.Start();
        isopen=true;
    }
    else {
        close_timer.Disable();
        isopen=false;
    }
}

void Doors::ForceClose(Mob *sender)
{
    EQApplicationPacket* outapp = new EQApplicationPacket(OP_MoveDoor, sizeof(MoveDoor_Struct));
	MoveDoor_Struct* md=(MoveDoor_Struct*)outapp->pBuffer;
	md->doorid = door_id;
	md->action = OPEN_DOOR;
	entity_list.QueueClients(sender,outapp,false);
	safe_delete(outapp);

    if(!isopen) {
        close_timer.Start();
        isopen=true;
    }
    else {
        close_timer.Disable();
        isopen=false;
    }
}

void Doors::DumpDoor(){
    LogFile->write(EQEMuLog::Debug,
        "db_id:%i door_id:%i zone_name:%s door_name:%s pos_x:%f pos_y:%f pos_z:%f heading:%f",
        db_id, door_id, zone_name, door_name, pos_x, pos_y, pos_z, heading);
    LogFile->write(EQEMuLog::Debug,
		"opentype:%i guild_id:%i lockpick:%i keyitem:%i keyitem2:%i nokeyring:%i trigger_door:%i trigger_type:%i door_param:%i open:%s",
        opentype, guild_id, lockpick, keyitem, keyitem2, nokeyring, trigger_door, trigger_type, door_param, (isopen) ? "open":"closed");
    LogFile->write(EQEMuLog::Debug,
        "dest_zone:%s dest_x:%f dest_y:%f dest_z:%f dest_heading:%f",
        dest_zone, dest_x, dest_y, dest_z, dest_heading);
}

sint32 ZoneDatabase::GetDoorsCount(int32* oMaxID, const char *zone_name, int16 version) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;

    MYSQL_RES *result;
    MYSQL_ROW row;
	query = new char[256];
	sprintf(query, "SELECT MAX(id), count(*) FROM doors WHERE zone='%s' AND version=%u", zone_name, version);
	if (RunQuery(query, strlen(query), errbuf, &result)) {
		safe_delete_array(query);
		row = mysql_fetch_row(result);
		if (row != NULL && row[1] != 0) {
			sint32 ret = atoi(row[1]);
			if (oMaxID) {
				if (row[0])
					*oMaxID = atoi(row[0]);
				else
					*oMaxID = 0;
			}
			mysql_free_result(result);
			return ret;
		}
		mysql_free_result(result);
	}
	else {
		cerr << "Error in GetDoorsCount query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return -1;
	}

	return -1;
}


/*
extern "C" bool extDBLoadDoors(sint32 iDoorCount, int32 iMaxDoorID) { return database.DBLoadDoors(iDoorCount, iMaxDoorID); }
const Door* ZoneDatabase::GetDoor(int8 door_id, const char* zone_name) {
	for(uint32 i=0; i!=max_door_type;i++)
	{
        const Door* door;
        door = GetDoorDBID(i);
        if (!door)
		continue;
	if(door->door_id == door_id && strcasecmp(door->zone_name, zone_name) == 0)
	return door;
	}
return 0;
}

const Door* ZoneDatabase::GetDoorDBID(uint32 db_id) {
	return EMuShareMemDLL.Doors.GetDoor(db_id);
}

bool ZoneDatabase::LoadDoors() {
	if (!EMuShareMemDLL.Load())
		return false;
	sint32 tmp = 0;
	tmp = GetDoorsCount(&max_door_type);
	if (tmp == -1) {
		cout << "Error: ZoneDatabase::LoadDoors-ShareMem: GetDoorsCount() returned < 0" << endl;
		return false;
	}
	bool ret = EMuShareMemDLL.Doors.DLLLoadDoors(&extDBLoadDoors, sizeof(Door), &tmp, &max_door_type);
	return ret;
}*/

bool ZoneDatabase::LoadDoors(sint32 iDoorCount, Door *into, const char *zone_name, int16 version) {
	LogFile->write(EQEMuLog::Status, "Loading Doors from database...");
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;

//	Door tmpDoor;
	MakeAnyLenString(&query, "SELECT id,doorid,zone,name,pos_x,pos_y,pos_z,heading,"
		"opentype,guild,lockpick,keyitem,keyitem2,nokeyring,triggerdoor,triggertype,dest_zone,dest_x,"
		"dest_y,dest_z,dest_heading,door_param,invert_state,incline,size,is_ldon_door "
		"FROM doors WHERE zone='%s' AND version=%u ORDER BY doorid asc", zone_name, version);
	if (RunQuery(query, strlen(query), errbuf, &result)) {
		safe_delete_array(query);
		sint32 r;
		for(r = 0; (row = mysql_fetch_row(result)); r++) {
			if(r >= iDoorCount) {
				cerr << "Error, Door Count of " << iDoorCount << " exceeded." << endl;
				break;
			}
			memset(&into[r], 0, sizeof(Door));
			into[r].db_id = atoi(row[0]);
			into[r].door_id = atoi(row[1]);
			strncpy(into[r].zone_name,row[2],16);
			strncpy(into[r].door_name,row[3],32);
			into[r].pos_x = (float)atof(row[4]);
			into[r].pos_y = (float)atof(row[5]);
			into[r].pos_z = (float)atof(row[6]);
			into[r].heading = (float)atof(row[7]);
			into[r].opentype = atoi(row[8]);
			into[r].guild_id = atoi(row[9]);
			into[r].lockpick = atoi(row[10]);
			into[r].keyitem = atoi(row[11]);
			into[r].keyitem2 = atoi(row[12]);
			into[r].nokeyring = atoi(row[13]);
			into[r].trigger_door = atoi(row[14]);
			into[r].trigger_type = atoi(row[15]);
            strncpy(into[r].dest_zone,row[16],17);
            into[r].dest_x = (float) atof(row[17]);
            into[r].dest_y = (float) atof(row[18]);
            into[r].dest_z = (float) atof(row[19]);
            into[r].dest_heading = (float) atof(row[20]);
			into[r].door_param=atoi(row[21]);
			into[r].invert_state=atoi(row[22]);
			into[r].incline=atoi(row[23]);
			into[r].size=atoi(row[24]);
			into[r].is_ldon_door=atoi(row[25]);
		}
		mysql_free_result(result);
	}
	else
	{
		cerr << "Error in DBLoadDoors query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}
	return true;
}





