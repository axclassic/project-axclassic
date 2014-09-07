/*  EQEMu:  Everquest Server Emulator
    Copyright (C) 2001-2006  EQEMu Development Team (http://eqemulator.net)

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

#include "worlddb.h"
//#include "../common/Item.h"
#include "../common/MiscFunctions.h"
#include "../common/eq_packet_structs.h"
#include "../common/Item.h"
#include "../common/dbasync.h"
#include "../common/rulesys.h"
#include <iostream>
#include <cstdlib>

using namespace std;


WorldDatabase database;

//Classic2012 Lookup
int WorldDatabase::Classic2012Lookup() {
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

//LSStatus updater
void WorldDatabase::UpdateLSStatus(int numzones, int numplayers) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	int32 affected_rows = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE LSStats SET numzones=%i, numplayers=%i",numzones, numplayers), errbuf, 0, &affected_rows)) {
		cerr << "Error in LSStats query '" << query << "' " << errbuf << endl;
	}
	safe_delete_array(query);
}

// solar: the current stuff is at the bottom of this function
void WorldDatabase::GetCharSelectInfo(int32 account_id, CharacterSelect_Struct* cs) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	Inventory *inv;
	
	for (int i=0; i<10; i++) {
		strcpy(cs->name[i], "<none>");
		cs->zone[i] = 0;
		cs->level[i] = 0;
            cs->tutorial[i] = 0;
		cs->gohome[i] = 0;
	}
	
	int char_num = 0;
	unsigned long* lengths;
	
	// Populate character info
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT name,profile,zonename,class,level FROM character_ WHERE account_id=%i order by name limit 10", account_id), errbuf, &result)) {
		safe_delete_array(query);
		while ((row = mysql_fetch_row(result))) {
			lengths = mysql_fetch_lengths(result);
			////////////
			////////////	This is the current one, the other are for converting
			////////////
			if ((lengths[1] == sizeof(PlayerProfile_Struct))) {
				strcpy(cs->name[char_num], row[0]);
				PlayerProfile_Struct* pp = (PlayerProfile_Struct*)row[1];
				uint8 clas = atoi(row[3]);
				uint8 lvl = atoi(row[4]);
				
				// Character information
				if(lvl == 0)
					cs->level[char_num]		= pp->level;	//no level in DB, trust PP
				else
					cs->level[char_num]		= lvl;
				if(clas == 0)
					cs->class_[char_num]	= pp->class_;	//no class in DB, trust PP
				else
					cs->class_[char_num]	= clas;
				cs->race[char_num]			= pp->race;
				cs->gender[char_num]		= pp->gender;
				cs->deity[char_num]			= pp->deity;
				cs->zone[char_num]			= GetZoneID(row[2]);
				cs->face[char_num]			= pp->face;
				cs->haircolor[char_num]		= pp->haircolor;
				cs->beardcolor[char_num]	= pp->beardcolor;
				cs->eyecolor2[char_num] 	= pp->eyecolor2;
				cs->eyecolor1[char_num] 	= pp->eyecolor1;
				cs->hairstyle[char_num]		= pp->hairstyle;
				cs->beard[char_num]			= pp->beard;
				cs->drakkin_heritage[char_num]	= pp->drakkin_heritage;
				cs->drakkin_tattoo[char_num]	= pp->drakkin_tattoo;
				cs->drakkin_details[char_num]	= pp->drakkin_details;

				if(RuleB(World, EnableTutorialButton) && (lvl <= RuleI(World, MaxLevelForTutorial)))
					cs->tutorial[char_num] = 1;

				if(RuleB(World, EnableReturnHomeButton)) {
					int now = time(NULL);
					if((now - pp->lastlogin) >= RuleI(World, MinOfflineTimeToReturnHome))
						cs->gohome[char_num] = 1;
				}


				// This part creates home city entries for characters created before the home bind point was tracked.
				// Do it here because the player profile is already loaded and it's as good a spot as any.  This whole block should
				// probably be removed at some point, when most accounts are safely converted.
				if(pp->binds[4].zoneId == 0) {
					bool altered = false;
					MYSQL_RES *result2;
					MYSQL_ROW row2;
					char startzone[50] = {0};

					// check for start zone variable (I didn't even know any variables were still being used...)
					if(database.GetVariable("startzone", startzone, 50)) {
						uint32 zoneid = database.GetZoneID(startzone);
						if(zoneid) {
							pp->binds[4].zoneId = zoneid;
							GetSafePoints(zoneid, &pp->binds[4].x, &pp->binds[4].y, &pp->binds[4].z);
							altered = true;
						}
					}
					else {
						RunQuery(query,
							MakeAnyLenString(&query,
							"SELECT zone_id,bind_id,x,y,z FROM start_zones "
							"WHERE player_class=%i AND player_deity=%i AND player_race=%i",
							pp->class_,
							pp->deity,
							pp->race
							),
							errbuf,
							&result2
						);
						safe_delete_array(query);

						// if there is only one possible start city, set it
						if(mysql_num_rows(result2) == 1) {
							row2 = mysql_fetch_row(result2);
							if(atoi(row2[1]) != 0) {		// if a bind_id is specified, make them start there
								pp->binds[4].zoneId = (uint32)atoi(row2[1]);
								GetSafePoints(pp->binds[4].zoneId, &pp->binds[4].x, &pp->binds[4].y, &pp->binds[4].z);
							}
							else {	// otherwise, use the zone and coordinates given
								pp->binds[4].zoneId = (uint32)atoi(row2[0]);
								float x = atof(row2[2]);
								float y = atof(row2[3]);
								float z = atof(row2[4]);
								if(x == 0 & y == 0 & z == 0)
									GetSafePoints(pp->binds[4].zoneId, &x, &y, &z);

								pp->binds[4].x = x;
								pp->binds[4].y = y;
								pp->binds[4].z = z;
							}
							altered = true;
						}

						mysql_free_result(result2);
					}

					// update the player profile
					if(altered) {
						uint32 char_id = GetCharacterID(cs->name[char_num]);
						RunQuery(query,MakeAnyLenString(&query,"SELECT extprofile FROM character_ WHERE id=%i",char_id), errbuf, &result2);
						safe_delete_array(query);
						if(result2) {
							row2 = mysql_fetch_row(result2);
							ExtendedProfile_Struct* ext = (ExtendedProfile_Struct*)row2[0];
							SetPlayerProfile(account_id,char_id,pp,inv,ext);
						}
						mysql_free_result(result2);
					}
				}	// end of "set start zone" block


				// Character's equipped items
				// @merth: Haven't done bracer01/bracer02 yet.
				// Also: this needs a second look after items are a little more solid
				// NOTE: items don't have a color, players MAY have a tint, if the
				// use_tint part is set.  otherwise use the regular color
				inv = new Inventory;
				if(GetInventory(account_id, cs->name[char_num], inv))
				{
					for (uint8 material = 0; material <= 8; material++)
					{
						uint32 color;
						ItemInst *item = inv->GetItem(Inventory::CalcSlotFromMaterial(material));
						if(item == 0)
							continue;

						cs->equip[char_num][material] = item->GetItem()->Material;

						if(pp->item_tint[material].rgb.use_tint)	// they have a tint (LoY dye)
							color = pp->item_tint[material].color;
						else	// no tint, use regular item color
							color = item->GetItem()->Color;

						cs->cs_colors[char_num][material].color = color;

						// the weapons are kept elsewhere
						if ((material==MATERIAL_PRIMARY) || (material==MATERIAL_SECONDARY))
						{
							if(strlen(item->GetItem()->IDFile) > 2) {
								int32 idfile=atoi(&item->GetItem()->IDFile[2]);
								if (material==MATERIAL_PRIMARY)
									cs->primary[char_num]=idfile;
								else
									cs->secondary[char_num]=idfile;
							}
						}
					}
				}
				else
				{
					printf("Error loading inventory for %s\n", cs->name[char_num]);
				}
				safe_delete(inv);	
				if (++char_num > 10)
					break;
			}
			else
			{
				cout << "Got a bogus character (" << row[0] << ") Ignoring!!!" << endl;
				cout << "PP length ="<<lengths[1]<<" but PP should be "<<sizeof(PlayerProfile_Struct)<<endl;
				//DeleteCharacter(row[0]);
			}
		}
		mysql_free_result(result);
	}
	else
	{
		cerr << "Error in GetCharSelectInfo query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return;
	}
	
	return;
}

int WorldDatabase::MoveCharacterToBind(int CharID, uint8 bindnum) {
	// if an invalid bind point is specified, use the primary bind
	if (bindnum > 4)
		bindnum = 0;

	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	int32	affected_rows = 0;
	PlayerProfile_Struct pp;

	bool PPValid = false;

	if (RunQuery(query, MakeAnyLenString(&query, "SELECT profile from character_ where id='%i'", CharID), errbuf, &result)) {
		row = mysql_fetch_row(result);
		unsigned long* lengths = mysql_fetch_lengths(result);
		if (lengths[0] == sizeof(PlayerProfile_Struct)) {
			memcpy(&pp, row[0], sizeof(PlayerProfile_Struct));
			PPValid = true;
		}
		mysql_free_result(result);
	}
	safe_delete_array(query);

	if(!PPValid) return 0;

	const char *BindZoneName = StaticGetZoneName(pp.binds[bindnum].zoneId);

	if(!strcmp(BindZoneName, "UNKNWN")) return pp.zone_id;

	if (!RunQuery(query, MakeAnyLenString(&query, "UPDATE character_ SET zonename = '%s',zoneid=%i,x=%f, y=%f, z=%f, instanceid=0 WHERE id='%i'", 
					      BindZoneName, pp.binds[bindnum].zoneId, pp.binds[bindnum].x, pp.binds[bindnum].y, pp.binds[bindnum].z,
					      CharID), errbuf, 0,&affected_rows)) {

		return pp.zone_id;
	}
	safe_delete_array(query);
	
	return pp.binds[bindnum].zoneId; 
}

bool WorldDatabase::GetStartZone(PlayerProfile_Struct* in_pp, CharCreate_Struct* in_cc)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row = 0;
	int rows;

	if(!in_pp || !in_cc)
		return false;

	in_pp->x = in_pp->y = in_pp->z = in_pp->zone_id = 0;
	in_pp->binds[0].x = in_pp->binds[0].y = in_pp->binds[0].z = in_pp->binds[0].zoneId = 0;

	RunQuery
	(
		query,
		MakeAnyLenString
		(
			&query,
			"SELECT x,y,z,zone_id,bind_id FROM start_zones "
			"WHERE player_choice=%i AND player_class=%i "
			"AND player_deity=%i AND player_race=%i",
			in_cc->start_zone,
			in_cc->class_,
			in_cc->deity,
			in_cc->race
		),
		errbuf,
		&result
	);
	LogFile->write(EQEMuLog::Status, "Start zone query: %s\n", query);
	safe_delete_array(query); 
	
	if((rows = mysql_num_rows(result)) > 0)
		row = mysql_fetch_row(result);
	
	if(row)
	{         
		LogFile->write(EQEMuLog::Status, "Found starting location in start_zones");
		in_pp->x = atof(row[0]); 
		in_pp->y = atof(row[1]); 
		in_pp->z = atof(row[2]); 
		in_pp->zone_id = atoi(row[3]); 
		in_pp->binds[0].zoneId = atoi(row[4]); 
	} 
	else
	{
		printf("No start_zones entry in database, using defaults\n");
		switch(in_cc->start_zone)
		{
			case 0:
			{
				in_pp->zone_id = 24;	// erudnext
				in_pp->binds[0].zoneId = 38;	// tox
				break;
			}
			case 1:
			{
				in_pp->zone_id =2;	// qeynos2
				in_pp->binds[0].zoneId = 2;	// qeynos2
				break;
			}
			case 2:
			{
				in_pp->zone_id =29;	// halas
				in_pp->binds[0].zoneId = 30;	// everfrost
				break;
			}
			case 3:
			{
				in_pp->zone_id =19;	// rivervale
				in_pp->binds[0].zoneId = 20;	// kithicor
				break;
			}
			case 4:
			{
				in_pp->zone_id =9;	// freportw
				in_pp->binds[0].zoneId = 9;	// freportw
				break;
			}
			case 5:
			{
				in_pp->zone_id =40;	// neriaka
				in_pp->binds[0].zoneId = 25;	// nektulos
				break;
			}
			case 6:
			{
				in_pp->zone_id =52;	// gukta
				in_pp->binds[0].zoneId = 46;	// innothule
				break;
			}
			case 7:
			{
				in_pp->zone_id =49;	// oggok
				in_pp->binds[0].zoneId = 47;	// feerrott
				break;
			}
			case 8:
			{
				in_pp->zone_id =60;	// kaladima
				in_pp->binds[0].zoneId = 68;	// butcher
				break;
			}
			case 9:
			{
				in_pp->zone_id =54;	// gfaydark
				in_pp->binds[0].zoneId = 54;	// gfaydark
				break;
			}
			case 10:
			{	
				in_pp->zone_id =61;	// felwithea
				in_pp->binds[0].zoneId = 54;	// gfaydark
				break;
			}
			case 11:
			{	
				in_pp->zone_id =55;	// akanon
				in_pp->binds[0].zoneId = 56;	// steamfont
				break;
			}
			case 12:
			{	
				in_pp->zone_id =82;	// cabwest
				in_pp->binds[0].zoneId = 78;	// fieldofbone
				break;
			}
			case 13:
			{
				in_pp->zone_id =74;	// kerra
				in_pp->binds[0].zoneId = 74;	// kerra
				break;
			}
			case 14:
			{
				in_pp->zone_id =83;	// swampofnohope
				in_pp->binds[0].zoneId = 83;	// swampofnohope
				break;
			}
		}
	}

	if(in_pp->x == 0 && in_pp->y == 0 && in_pp->z == 0)
		database.GetSafePoints(in_pp->zone_id, &in_pp->x, &in_pp->y, &in_pp->z);

	if(in_pp->binds[0].x == 0 && in_pp->binds[0].y == 0 && in_pp->binds[0].z == 0)
		database.GetSafePoints(in_pp->binds[0].zoneId, &in_pp->binds[0].x, &in_pp->binds[0].y, &in_pp->binds[0].z);
	if(result) 
		mysql_free_result(result);	
	return true;
}

bool WorldDatabase::GetStartZoneSoF(PlayerProfile_Struct* in_pp, CharCreate_Struct* in_cc)
{

	// SoF doesn't send the player_choice field in character creation, it now sends the real zoneID instead.
	//
	// For SoF, search for an entry in start_zones with a matching zone_id, class, race and deity.
	//
	// For now, if no row matching row is found, send them to Crescent Reach, as that is probably the most likely (ax_classic sends to load zone for move script, since we don't use Crescent).
	// reason for no match being found.
	//
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row = 0;
	int rows;

	if(!in_pp || !in_cc)
		return false;

	in_pp->x = in_pp->y = in_pp->z = in_pp->zone_id = 0;
	in_pp->binds[0].x = in_pp->binds[0].y = in_pp->binds[0].z = in_pp->binds[0].zoneId = 0;

	RunQuery
	(
		query,
		MakeAnyLenString
		(
			&query,
			"SELECT x,y,z,zone_id,bind_id FROM start_zones "
			//"WHERE zone_id=%i AND player_class=%i "
			"WHERE player_class=%i "
			"AND player_deity=%i AND player_race=%i",
			//in_cc->start_zone,
			in_cc->class_,
			in_cc->deity,
			in_cc->race
		),
		errbuf,
		&result
	);
	LogFile->write(EQEMuLog::Status, "SoF Start zone query: %s\n", query);
	_log(WORLD__CLIENT_TRACE, "SoF Start zone query: %s\n", query);
	safe_delete_array(query); 
	
	if((rows = mysql_num_rows(result)) > 0)
		row = mysql_fetch_row(result);
	
	if(row)
	{         
		LogFile->write(EQEMuLog::Status, "Found starting location in start_zones");
		in_pp->x = atof(row[0]); 
		in_pp->y = atof(row[1]); 
		in_pp->z = atof(row[2]);
		in_pp->zone_id = atoi(row[3]);
		in_pp->binds[0].zoneId = atoi(row[4]); 
	} 

	else {
		printf("No start_zones entry in database, using defaults\n");
		in_pp->x = in_pp->binds[0].x = -316;
		in_pp->y = in_pp->binds[0].y = 5;
		in_pp->z = in_pp->binds[0].z = 8.2;
		in_pp->zone_id = in_pp->binds[0].zoneId = 184; // load.
	}

/*
	else
	{
		printf("No start_zones entry in database, using defaults\n");
		in_pp->zone_id = in_cc->start_zone;
		switch(in_cc->start_zone)
		{
			case 0:
			{
				in_pp->zone_id = 24;	// erudnext
				in_pp->binds[0].zoneId = 38;	// tox
				break;
			}
			case 1:
			{
				in_pp->zone_id =2;	// qeynos2
				in_pp->binds[0].zoneId = 2;	// qeynos2
				break;
			}
			case 2:
			{
				in_pp->zone_id =29;	// halas
				in_pp->binds[0].zoneId = 30;	// everfrost
				break;
			}
			case 3:
			{
				in_pp->zone_id =19;	// rivervale
				in_pp->binds[0].zoneId = 20;	// kithicor
				break;
			}
			case 4:
			{
				in_pp->zone_id =9;	// freportw
				in_pp->binds[0].zoneId = 9;	// freportw
				break;
			}
			case 5:
			{
				in_pp->zone_id =40;	// neriaka
				in_pp->binds[0].zoneId = 25;	// nektulos
				break;
			}
			case 6:
			{
				in_pp->zone_id =52;	// gukta
				in_pp->binds[0].zoneId = 46;	// innothule
				break;
			}
			case 7:
			{
				in_pp->zone_id =49;	// oggok
				in_pp->binds[0].zoneId = 47;	// feerrott
				break;
			}
			case 8:
			{
				in_pp->zone_id =60;	// kaladima
				in_pp->binds[0].zoneId = 68;	// butcher
				break;
			}
			case 9:
			{
				in_pp->zone_id =54;	// gfaydark
				in_pp->binds[0].zoneId = 54;	// gfaydark
				break;
			}
			case 10:
			{	
				in_pp->zone_id =61;	// felwithea
				in_pp->binds[0].zoneId = 54;	// gfaydark
				break;
			}
			case 11:
			{	
				in_pp->zone_id =55;	// akanon
				in_pp->binds[0].zoneId = 56;	// steamfont
				break;
			}
			case 12:
			{	
				in_pp->zone_id =82;	// cabwest
				in_pp->binds[0].zoneId = 78;	// fieldofbone
				break;
			}
			case 13:
			{
				in_pp->zone_id =74;	// kerra
				in_pp->binds[0].zoneId = 74;	// kerra
				break;
			}
			case 14:
			{
				in_pp->zone_id =83;	// swampofnohope
				in_pp->binds[0].zoneId = 83;	// swampofnohope
				break;
			}
		}
	}
*/

	if(in_pp->x == 0 && in_pp->y == 0 && in_pp->z == 0)
		database.GetSafePoints(in_pp->zone_id, &in_pp->x, &in_pp->y, &in_pp->z);

	if(in_pp->binds[0].x == 0 && in_pp->binds[0].y == 0 && in_pp->binds[0].z == 0)
		database.GetSafePoints(in_pp->binds[0].zoneId, &in_pp->binds[0].x, &in_pp->binds[0].y, &in_pp->binds[0].z);
	if(result) 
		mysql_free_result(result);	
	return true;
}

void WorldDatabase::GetLauncherList(std::vector<std::string> &rl) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char* query = 0;
	MYSQL_RES *result;
    MYSQL_ROW row;
	
	rl.clear();
	
	if (RunQuery(query, MakeAnyLenString(&query,
			"SELECT name FROM launcher" )
		, errbuf, &result))
	{
		while ((row = mysql_fetch_row(result))) {
			rl.push_back(row[0]);
		}
		mysql_free_result(result);
	}
	else {
		LogFile->write(EQEMuLog::Error, "WorldDatabase::GetLauncherList: %s", errbuf);
	}
	safe_delete_array(query);
}

void WorldDatabase::SetMailKey(int CharID, int IPAddress, int MailKey) {

	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;

	char MailKeyString[17];

	if(RuleB(Chat, EnableMailKeyIPVerification) == true)
		sprintf(MailKeyString, "%08X%08X", IPAddress, MailKey);
	else	
		sprintf(MailKeyString, "%08X", MailKey);

	if (!RunQuery(query, MakeAnyLenString(&query, "UPDATE character_ SET mailkey = '%s' WHERE id='%i'", 
					      MailKeyString, CharID), errbuf)) 

		LogFile->write(EQEMuLog::Error, "WorldDatabase::SetMailKey(%i, %s) : %s", CharID, MailKeyString, errbuf);
	
	safe_delete_array(query);

}

/*
void WorldDatabase::GetLauncherZones(const char *launcher_name, std::vector<LauncherZone> &rl) {
}

bool WorldDatabase::GetLauncherZone(const char *launcher_name, const char *zone_short, LauncherZone &r) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	bool ret = false;
    
    char namebuf[128];
	DoEscapeString(namebuf, launcher_name, strlen(launcher_name)&0x3F);	//limit len to 64
	namebuf[127] = '\0';
    char zonebuf[32];
	DoEscapeString(zonebuf, zone_short, strlen(zone_short)&0xF);	//limit len to 16
	zonebuf[31] = '\0';
	
	if (RunQuery(query, MakeAnyLenString(&query,
			"SELECT port FROM launchers WHERE launcher='%s' AND zone='%s'",
			namebuf)
		, errbuf, &result))
	{
		if((row = mysql_fetch_row(result))) {
			r.zone = zone_short;
			r.port = atoi(row[0]);
			ret = true;
		}
		mysql_free_result(result);
	} else {
		LogFile->write(EQEMuLog::Error, "WorldDatabase::GetLauncherList: %s", errbuf);
	}
	safe_delete_array(query);
	return(ret);
}

bool WorldDatabase::AddLauncherZone(const char *launcher_name, const LauncherZone &it) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    
    char namebuf[128];
	DoEscapeString(namebuf, launcher_name, strlen(launcher_name)&0x3F);	//limit len to 64
	namebuf[127] = '\0';
    char zonebuf[32];
	DoEscapeString(zonebuf, it.zone.c_str(), it.zone.length()&0xF);	//limit len to 16
	zonebuf[31] = '\0';
	
	if (!RunQuery(query, MakeAnyLenString(&query,
		"INSERT INTO launchers (launcher,zone,port) VALUES('%s', '%s', %d)",
		 namebuf, zonebuf, it.port), errbuf)) {
		LogFile->write(EQEMuLog::Error, "Error in AddLauncherZone query: %s", errbuf);
		safe_delete_array(query);
		return false;
	}
	
	safe_delete_array(query);
	return true;
}

bool WorldDatabase::DeleteLauncherZone(const char *launcher_name, const char *zone_short) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    
    char namebuf[128];
	DoEscapeString(namebuf, launcher_name, strlen(launcher_name)&0x3F);	//limit len to 64
	namebuf[127] = '\0';
    char zonebuf[32];
	DoEscapeString(zonebuf, zone_short, strlen(zone_short)&0xF);	//limit len to 16
	zonebuf[31] = '\0';
	
	if (!RunQuery(query, MakeAnyLenString(&query, 
		"DELETE FROM launchers WHERE launcher='%s' AND zone='%s'", 
		namebuf, zonebuf), errbuf)) {
		LogFile->write(EQEMuLog::Error, "Error in DeleteLauncherZone query: %s", errbuf);
		safe_delete_array(query);
		return false;
	}
	
	safe_delete_array(query);
	return true;
}

bool WorldDatabase::UpdateLauncherZone(const char *launcher_name, const LauncherZone &it) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    
    char namebuf[128];
	DoEscapeString(namebuf, launcher_name, strlen(launcher_name)&0x3F);	//limit len to 64
	namebuf[127] = '\0';
    char zonebuf[32];
	DoEscapeString(zonebuf, it.zone.c_str(), it.zone.length()&0xF);	//limit len to 16
	zonebuf[31] = '\0';
	
	if (!RunQuery(query, MakeAnyLenString(&query,
		"UPDATE launchers SET port=%d WHERE launcher='%s' AND zone='%s'",
		 it.port, namebuf, zonebuf), errbuf)) {
		LogFile->write(EQEMuLog::Error, "Error in UpdateLauncherZone query: %s", errbuf);
		safe_delete_array(query);
		return false;
	}
	
	safe_delete_array(query);
	return true;
}
*/




































