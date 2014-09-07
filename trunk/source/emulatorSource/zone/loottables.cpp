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
#include <stdio.h>
#include <iostream>
using namespace std;
#include <stdlib.h>
#include "npc.h"
#include "masterentity.h"
#include "zonedb.h"
#include "../common/MiscFunctions.h"
#ifdef WIN32
#define snprintf	_snprintf
#endif

#include "../common/EMuShareMem.h"
extern LoadEMuShareMemDLL EMuShareMemDLL;
bool SharedDatabase::extDBLoadLoot() {
	return s_usedb->DBLoadLoot();
}

bool SharedDatabase::LoadLoot() {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	int32 tmpLootTableCount = 0;
	int32 tmpLootTableEntriesCount = 0;
	int32 tmpLootDropCount = 0;
	int32 tmpLootDropEntriesCount = 0;
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT max(id), count(*) FROM loottable"), errbuf, &result)) {
		safe_delete_array(query);
		if (mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			if (row[0])
				loottable_max = atoi(row[0]);
			else
				loottable_max = 0;
			tmpLootTableCount = atoi(row[1]);
		}
		else {
			mysql_free_result(result);
			return false;
		}
		mysql_free_result(result);
	}
	else {
		cerr << "Error in LoadLoot query, loottable part: '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT count(*) FROM loottable_entries"), errbuf, &result)) {
		safe_delete_array(query);
		if (mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			tmpLootTableEntriesCount = atoi(row[0]);
		}
		else {
			mysql_free_result(result);
			return false;
		}
		mysql_free_result(result);
	}
	else {
		cerr << "Error in LoadLoot query, loottable2 part: '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}

	if (RunQuery(query, MakeAnyLenString(&query, "SELECT max(id), count(*) FROM lootdrop"), errbuf, &result)) {
		safe_delete_array(query);
		if (mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			if (row[0])
				lootdrop_max = atoi(row[0]);
			else
				lootdrop_max = 0;
			tmpLootDropCount = atoi(row[1]);
		}
		else {
			mysql_free_result(result);
			return false;
		}
		mysql_free_result(result);
	}
	else {
		cerr << "Error in LoadLoot query, lootdrop1 part: '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT max(lootdrop_id), count(*) FROM lootdrop_entries"), errbuf, &result)) {
		safe_delete_array(query);
		if (mysql_num_rows(result) == 1) {
			row = mysql_fetch_row(result);
			tmpLootDropEntriesCount = atoi(row[1]);
		}
		else {
			mysql_free_result(result);
			return false;
		}
		mysql_free_result(result);
	}
	else {
		cerr << "Error in LoadLoot query, lootdrop part: '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}
	return EMuShareMemDLL.Loot.DLLLoadLoot(&extDBLoadLoot,
			 sizeof(LootTable_Struct), tmpLootTableCount, loottable_max,
			 sizeof(LootTableEntries_Struct), tmpLootTableEntriesCount,
			 sizeof(LootDrop_Struct), tmpLootDropCount, lootdrop_max,
			 sizeof(LootDropEntries_Struct), tmpLootDropEntriesCount);
}

bool SharedDatabase::DBLoadLoot() {
	LogFile->write(EQEMuLog::Status, "Loading Loot tables from database...");
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
    MYSQL_RES *result2;
	int32 i, tmpid = 0, tmpmincash = 0, tmpmaxcash = 0, tmpavgcoin = 0;
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT id, mincash, maxcash, avgcoin FROM loottable"), errbuf, &result)) {
		safe_delete_array(query);
		LootTable_Struct* tmpLT = 0;
		while ((row = mysql_fetch_row(result))) {
			tmpid = atoi(row[0]);
			tmpmincash = atoi(row[1]);
			tmpmaxcash = atoi(row[2]);
			tmpavgcoin = atoi(row[3]);
			if (RunQuery(query, MakeAnyLenString(&query, "SELECT loottable_id, lootdrop_id, multiplier, probability FROM loottable_entries WHERE loottable_id=%i", tmpid), errbuf, &result2)) {
				safe_delete_array(query);
				tmpLT = (LootTable_Struct*) new uchar[sizeof(LootTable_Struct) + (sizeof(LootTableEntries_Struct) * mysql_num_rows(result2))];
				memset(tmpLT, 0, sizeof(LootTable_Struct) + (sizeof(LootTableEntries_Struct) * mysql_num_rows(result2)));
				tmpLT->NumEntries = mysql_num_rows(result2);
				tmpLT->mincash = tmpmincash;
				tmpLT->maxcash = tmpmaxcash;
				tmpLT->avgcoin = tmpavgcoin;
				i=0;
				while ((row = mysql_fetch_row(result2))) {
					if (i >= tmpLT->NumEntries) {
						mysql_free_result(result);
						mysql_free_result(result2);
						safe_delete_array(tmpLT);
						cerr << "Error in ZoneDatabase::DBLoadLoot, i >= NumEntries" << endl;
						return false;
					}
					tmpLT->Entries[i].lootdrop_id = atoi(row[1]);
					tmpLT->Entries[i].multiplier = atoi(row[2]);
					tmpLT->Entries[i].probability = atoi(row[3]);
					i++;
				}
				if (!EMuShareMemDLL.Loot.cbAddLootTable(tmpid, tmpLT)) {
					mysql_free_result(result);
					mysql_free_result(result2);
					safe_delete_array(tmpLT);
					cout << "Error in ZoneDatabase::DBLoadLoot: !cbAddLootTable(" << tmpid << ")" << endl;
					return false;
				}
				safe_delete_array(tmpLT);
				mysql_free_result(result2);
			}
			else {
				mysql_free_result(result);
				cerr << "Error in LoadLoot (memshare) #1 query '" << query << "' " << errbuf << endl;
				safe_delete_array(query);
				return false;
			}
		}
		mysql_free_result(result);
	}
	else {
		cerr << "Error in LoadLoot (memshare) #2 query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}

	if (RunQuery(query, MakeAnyLenString(&query, "SELECT id FROM lootdrop", tmpid), errbuf, &result)) {
		safe_delete_array(query);
		LootDrop_Struct* tmpLD = 0;
		while ((row = mysql_fetch_row(result))) {
			tmpid = atoi(row[0]);
			if (RunQuery(query, MakeAnyLenString(&query, "SELECT lootdrop_id, item_id, item_charges, equip_item, chance FROM lootdrop_entries WHERE lootdrop_id=%i order by chance desc", tmpid), errbuf, &result2)) {
				safe_delete_array(query);
				tmpLD = (LootDrop_Struct*) new uchar[sizeof(LootDrop_Struct) + (sizeof(LootDropEntries_Struct) * mysql_num_rows(result2))];
				memset(tmpLD, 0, sizeof(LootDrop_Struct) + (sizeof(LootDropEntries_Struct) * mysql_num_rows(result2)));
				tmpLD->NumEntries = mysql_num_rows(result2);
				i=0;
				while ((row = mysql_fetch_row(result2))) {
					if (i >= tmpLD->NumEntries) {
						mysql_free_result(result);
						mysql_free_result(result2);
						safe_delete_array(tmpLD);
						cerr << "Error in ZoneDatabase::DBLoadLoot, i >= NumEntries" << endl;
						return false;
					}
					tmpLD->Entries[i].item_id = atoi(row[1]);
					tmpLD->Entries[i].item_charges = atoi(row[2]);
					tmpLD->Entries[i].equip_item = atoi(row[3]);
					tmpLD->Entries[i].chance = atoi(row[4]);
					i++;
				}
				if (!EMuShareMemDLL.Loot.cbAddLootDrop(tmpid, tmpLD)) {
					mysql_free_result(result);
					mysql_free_result(result2);
					safe_delete_array(tmpLD);
					cout << "Error in ZoneDatabase::DBLoadLoot: !cbAddLootDrop(" << tmpid << ")" << endl;
					return false;
				}
				safe_delete_array(tmpLD);
				mysql_free_result(result2);
			}
			else {
				cerr << "Error in LoadLoot (memshare) #3 query '" << query << "' " << errbuf << endl;
				mysql_free_result(result);
				safe_delete_array(query);
				return false;
			}
		}
		mysql_free_result(result);
	}
	else {
		cerr << "Error in LoadLoot (memshare) #4 query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}

	return true;
}

const LootTable_Struct* SharedDatabase::GetLootTable(int32 loottable_id) {
	return EMuShareMemDLL.Loot.GetLootTable(loottable_id);
}

const LootDrop_Struct* SharedDatabase::GetLootDrop(int32 lootdrop_id) {
	return EMuShareMemDLL.Loot.GetLootDrop(lootdrop_id);
}

// Queries the loottable: adds item & coin to the npc
void ZoneDatabase::AddLootTableToNPC(NPC* npc,int32 loottable_id, ItemList* itemlist, int32* copper, int32* silver, int32* gold, int32* plat) {
	_ZP(Database_AddLootTableToNPC);
//if (loottable_id == 178190)
//DebugBreak();
	const LootTable_Struct* lts = 0;
	*copper = 0;
	*silver = 0;
	*gold = 0;
	*plat = 0;

	lts = database.GetLootTable(loottable_id);
	if (!lts)
		return;

	// do coin
	if (lts->mincash > lts->maxcash) {
		cerr << "Error in loottable #" << loottable_id << ": mincash > maxcash" << endl;
	}
	else if (lts->maxcash != 0) {
		int32 cash = 0;
		if (lts->mincash == lts->maxcash)
			cash = lts->mincash;
		else
			cash = (rand() % (lts->maxcash - lts->mincash)) + lts->mincash;
		if (cash != 0) {
			if (lts->avgcoin != 0) {
				//this is some crazy ass stuff... and makes very little sense... dont use it, k?
				int32 mincoin = (int32) (lts->avgcoin * 0.75 + 1);
				int32 maxcoin = (int32) (lts->avgcoin * 1.25 + 1);
				*copper = (rand() % (maxcoin - mincoin)) + mincoin - 1;
				*silver = (rand() % (maxcoin - mincoin)) + mincoin - 1;
				*gold = (rand() % (maxcoin - mincoin)) + mincoin - 1;
			if(*copper > cash) { *copper = cash; }
				cash -= *copper;
            if(*silver>(cash/10)) { *silver = (cash/10); }
				cash -= *silver*10;
            if(*gold > (cash/100)) { *gold = (cash/100); }
				cash -= *gold*100;
         }
         if (cash < 0) {
            cash = 0;
			}
			*plat = cash / 1000;
			cash -= *plat * 1000;
			int32 gold2 = cash / 100;
			cash -= gold2 * 100;
			int32 silver2 = cash / 10;
			cash -= silver2 * 10;
			*gold += gold2;
			*silver += silver2;
			*copper += cash;
		}
	}

	// Do items
	for (int32 i=0; i<lts->NumEntries; i++) {
		for (int32 k = 1; k <= lts->Entries[i].multiplier; k++) {
			if ( MakeRandomInt(0,99) < lts->Entries[i].probability) {
				AddLootDropToNPC(npc,lts->Entries[i].lootdrop_id, itemlist);
			}
		}
	}
}

// Called by AddLootTableToNPC
// maxdrops = size of the array npcd
void ZoneDatabase::AddLootDropToNPC(NPC* npc,int32 lootdrop_id, ItemList* itemlist) {
	const LootDrop_Struct* lds = GetLootDrop(lootdrop_id);
	if (!lds) {
	 //   LogFile->write(EQEMuLog::Error, "Database Or Memory error GetLootDrop(%i) == 0, npc:%s", lootdrop_id, npc->GetName());
		return;
	}
	if(lds->NumEntries == 0)	//nothing possible to add
		return;

// This is Wiz's updated Pool Looting functionality.  Eventually, the database format should be moved over to use this
// or implemented to support both methods.  (A unique identifier in lootable_entries indicates to roll for a pool item
// in another table.
#ifdef POOLLOOTING
	printf("POOL!\n");
	int32 chancepool = 0;
	int32 loot_items[100];
	int8  equipitem[100];
	int32 itemchance[100];
	int16 itemcharges[100];
	int8 i = 0;

	for (int m=0;m < 100;m++) {
		loot_items[m]=0;
		itemchance[m]=0;
		itemcharges[m]=0;
		equipitem[m]=0;
	}

	for (int k=0; k<lds->NumEntries; k++) 
	{
		loot_items[i] = lds->Entries[k].item_id;
		int chance = lds->Entries[k].chance;
		itemcharges[i] = lds->Entries[k].item_charges;
		equipitem[i] = lds->Entries[k].equip_item;
		
		/*
		im not sure what this is trying to accomplish...
		LinkedListIterator<ServerLootItem_Struct*> iterator(*itemlist);
		iterator.Reset();
		while(iterator.MoreElements())
		{
			 if (iterator.GetData()->item_id == loot_items[i])
			 {
				chance /= 5;
			 }
			 iterator.Advance();
		}*/

		chance += chancepool;
		chancepool += lds->Entries[k].chance;
		itemchance[i] = chance;
		i++;
	}
	int32 res;
	i = 0;

    if (chancepool!=0) { //avoid divide by zero if some mobs have 0 for chancepool
        res = MakeRandomInt(0, chancepool-1);
    }
    else {
        res = 0;
    }

	while (loot_items[i] != 0) {
		if (res <= itemchance[i])
			break;
		else
			i++;
	}
	const Item_Struct* dbitem = GetItem(items[i]);
	npc->AddLootDrop(dbitem, itemlist, lds->Entries[k].item_charges, lds->Entries[k].equip_item, false);
	
#else
	//non-pool based looting

	int32 r;

	// Calculate the total chance for all the entries
	int32 totalchance = 0;
	for (r = 0; r < lds->NumEntries; r++) {
		totalchance += lds->Entries[r].chance;
	}

	// Adjust maxroll if totalchance is greater than 100
	int32 maxroll = (totalchance > 100) ? totalchance - 1 : 99;
	if (totalchance > 100) {
		LogFile->write(EQEMuLog::Debug, "lootdrop_id %d has a total chance > 100 (%d)... Adjusting maxRoll to %d", lootdrop_id, totalchance, maxroll);
	}

	// Roll a value between 0 and maxroll
	int32 roll = MakeRandomInt(0, maxroll);

	// Step through the entries and add the item if our roll was less than the current running total
	uint32 thischance = 0;
	for (r = 0; r < lds->NumEntries; r++) {
		thischance += lds->Entries[r].chance;
		if (roll < thischance) {
			int32 itemid = lds->Entries[r].item_id;
			const Item_Struct* dbitem = GetItem(itemid);
			npc->AddLootDrop(dbitem, itemlist, lds->Entries[r].item_charges, lds->Entries[r].equip_item, false);
			break;
		}
	}

#endif
	
}

//if itemlist is null, just send wear changes
void NPC::AddLootDrop(const Item_Struct *item2, ItemList* itemlist, sint8 charges, bool equipit, bool wearchange) {
	if(item2 == NULL)
		return;
	
	//make sure we are doing something...
	if(!itemlist && !wearchange)
		return;
	
	ServerLootItem_Struct* item = new ServerLootItem_Struct;
#if EQDEBUG>=11
		LogFile->write(EQEMuLog::Debug, "Adding drop to npc: %s, Item: %i", GetName(), item2->ID);
#endif
	
	EQApplicationPacket* outapp = NULL;
	WearChange_Struct* wc = NULL;
	if(wearchange) {
		outapp = new EQApplicationPacket(OP_WearChange, sizeof(WearChange_Struct));
		wc = (WearChange_Struct*)outapp->pBuffer;
		wc->spawn_id = GetID();
		wc->material=0;
	}
	 			
	item->item_id = item2->ID;
	item->charges = charges;
	item->aug1 = 0;
	item->aug2 = 0;
	item->aug3 = 0;
	item->aug4 = 0;
	item->aug5 = 0;
	if (equipit) {
		uint8 eslot = 0xFF;
		//const Item_Struct* item2 = database.GetItem(item->item_id);
		char newid[20];
		//if(!item2) //Angelox removed as per Akkadius
		//	return;
		
		// @merth: IDFile size has been increased, this needs to change
		uint16 emat;
		if(item2->Material <= 0
			|| item2->Slots & (1 << SLOT_PRIMARY | 1 << SLOT_SECONDARY)) {
			memset(newid, 0, sizeof(newid));
			for(int i=0;i<7;i++){
				if (!isalpha(item2->IDFile[i])){
					strncpy(newid, &item2->IDFile[i],5);
					i=8;
				}
			}

			emat = atoi(newid);
		} else {
			emat = item2->Material;
		}

		if ((item2->Slots & (1 << SLOT_PRIMARY)) && (equipment[MATERIAL_PRIMARY]==0)) {
			if (item2->Proc.Effect != 0)
				CastToMob()->AddProcToWeapon(item2->Proc.Effect, true);
			
			eslot = MATERIAL_PRIMARY;
		}
		else if (item2->Slots & (1 << SLOT_SECONDARY) && (equipment[MATERIAL_SECONDARY]==0) 
			&& (GetOwner() != NULL || (GetLevel() >= 13 && MakeRandomInt(0,99) < NPC_DW_CHANCE) || (item2->Damage==0)) &&
			(item2->ItemType == ItemType1HS || item2->ItemType == ItemType1HB || item2->ItemType == ItemTypeShield ||
			item2->ItemType == ItemTypePierce))
		{
			if (item2->Proc.Effect!=0)
				CastToMob()->AddProcToWeapon(item2->Proc.Effect, true);
			
			eslot = MATERIAL_SECONDARY;
		}
		else if ((item2->Slots & (1 << SLOT_HEAD)) && (equipment[MATERIAL_HEAD]==0)) {
			eslot = MATERIAL_HEAD;
		}
		else if ((item2->Slots & (1 << SLOT_CHEST)) && (equipment[MATERIAL_CHEST]==0)) {
			eslot = MATERIAL_CHEST;
		}
		else if ((item2->Slots & (1 << SLOT_ARMS)) && (equipment[MATERIAL_ARMS]==0)) {
			eslot = MATERIAL_ARMS;
		}
		else if (item2->Slots & ((1 << SLOT_BRACER01)|(1 << SLOT_BRACER02)) && (equipment[MATERIAL_BRACER]==0)) {
			eslot = MATERIAL_BRACER;
		}
		else if ((item2->Slots & (1 << SLOT_HANDS)) && (equipment[MATERIAL_HANDS]==0)) {
			eslot = MATERIAL_HANDS;
		}
		else if ((item2->Slots & (1 << SLOT_LEGS)) && (equipment[MATERIAL_LEGS]==0)) {
			eslot = MATERIAL_LEGS;
		}
		else if ((item2->Slots & (1 << SLOT_FEET)) && (equipment[MATERIAL_FEET]==0)) {
			eslot = MATERIAL_FEET;
		}
		
		/*
		what was this about???
		
		if (((npc->GetRace()==127) && (npc->CastToMob()->GetOwnerID()!=0)) && (item2->Slots==24576) || (item2->Slots==8192) || (item2->Slots==16384)){
			npc->d_meele_texture2=atoi(newid);
			wc->wear_slot_id=8;
			if (item2->Material >0)
				wc->material=item2->Material;
			else
				wc->material=atoi(newid);
			npc->AC+=item2->AC;
			npc->STR+=item2->STR;
			npc->INT+=item2->INT;
		}
		*/
		
		//if we found an open slot it goes in...
		if(eslot != 0xFF) {
			//equip it...
			equipment[eslot] = item2->ID;
			
			if(wearchange) {
				wc->wear_slot_id = eslot;
				wc->material = emat;
			}
			
			CalcBonuses();
		}
		item->equipSlot = item2->Slots;
	}
	
	if(itemlist != NULL)
		itemlist->push_back(item);
	else
		safe_delete(item);
	
	if(wearchange && outapp) {
		entity_list.QueueClients(this, outapp);
	 	safe_delete(outapp);
	}
}
	  
void NPC::AddItem(const Item_Struct* item, int8 charges, uint8 slot) {
	//slot isnt needed, its determined from the item.
	AddLootDrop(item, &itemlist, charges, true, true);
}

void NPC::AddItem(int32 itemid, int8 charges, uint8 slot) {
	//slot isnt needed, its determined from the item.
	const Item_Struct * i = database.GetItem(itemid);
	if(i == NULL)
		return;
	AddLootDrop(i, &itemlist, charges, true, true);
}
	  
void NPC::AddLootTable() {
	if (npctype_id != 0) { // check if it's a GM spawn
	  database.AddLootTableToNPC(this,loottable_id, &itemlist, &copper, &silver, &gold, &platinum);
	}
}

