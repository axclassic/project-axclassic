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
/*
New class for handeling corpses and everything associated with them.
Child of the Mob class.
-Quagmire
*/
#include "../common/debug.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <iostream>
using namespace std;
#ifdef WIN32
#define snprintf	_snprintf
#if (_MSC_VER < 1500)
	#define vsnprintf	_vsnprintf
#endif
#define strncasecmp	_strnicmp
#define strcasecmp  _stricmp
#endif

#include "masterentity.h"
#include "../common/packet_functions.h"
#include "../common/crc32.h"
#include "StringIDs.h"
#include "worldserver.h"
#include "../common/rulesys.h"


#ifdef EMBPERL
#include "embparser.h"
#endif

extern EntityList entity_list;
extern Zone* zone;
extern WorldServer worldserver;
extern npcDecayTimes_Struct npcCorpseDecayTimes[100];

void Corpse::SendEndLootErrorPacket(Client* client) {
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_LootComplete, 0);
	client->QueuePacket(outapp);
	safe_delete(outapp);
}

void Corpse::SendLootReqErrorPacket(Client* client, int8 response) {
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_MoneyOnCorpse, sizeof(moneyOnCorpseStruct));
	moneyOnCorpseStruct* d = (moneyOnCorpseStruct*) outapp->pBuffer;
	d->response		= response;
	d->unknown1		= 0x5a;
	d->unknown2		= 0x40;
	client->QueuePacket(outapp);
	safe_delete(outapp);
}

Corpse* Corpse::LoadFromDBData(int32 in_dbid, int32 in_charid, char* in_charname, uchar* in_data, int32 in_datasize, float in_x, float in_y, float in_z, float in_heading, char* timeofdeath, bool rezzed, bool wasAtGraveyard) {
	if (in_datasize < sizeof(classic_db::DBPlayerCorpse_Struct)) {
		cout << "Corpse::LoadFromDBData: Corrupt data: in_datasize < sizeof(DBPlayerCorpse_Struct)" << endl;
		return 0;
	}
	classic_db::DBPlayerCorpse_Struct* dbpc = (classic_db::DBPlayerCorpse_Struct*) in_data;
	bool isSoF = true;
	if (in_datasize != (sizeof(DBPlayerCorpse_Struct) + (dbpc->itemcount * sizeof(ServerLootItem_Struct)))) {
		if (in_datasize != (sizeof(classic_db::DBPlayerCorpse_Struct) + (dbpc->itemcount * sizeof(ServerLootItem_Struct)))) {
			cout << "Corpse::LoadFromDBData: Corrupt data: in_datasize != expected size" << endl;
			return 0;
		}
		else
		{
			isSoF = false;
		}
	}

	if(isSoF)
	{
		DBPlayerCorpse_Struct* dbpcs = (DBPlayerCorpse_Struct*) in_data;
		if (dbpcs->crc != CRC32::Generate(&((uchar*) dbpcs)[4], in_datasize - 4)) {
			cout << "Corpse::LoadFromDBData: Corrupt data: crc failure" << endl;
			return 0;
		}
		ItemList itemlist;
		ServerLootItem_Struct* tmp = 0;
		for (unsigned int i=0; i < dbpcs->itemcount; i++) {
			tmp = new ServerLootItem_Struct;
			memcpy(tmp, &dbpcs->items[i], sizeof(ServerLootItem_Struct));
			itemlist.push_back(tmp);
		}

		// Little hack to account for the fact the race in the corpse struct is a uint8 and Froglok/Drakkin race number > 255
		// and to maintain backwards compatability with existing corpses in the database.
		int16 RealRace;

		switch(dbpcs->race) {
			case 254:
				RealRace = DRAKKIN;
				break;
			case 255:
				RealRace = FROGLOK;
				break;
			default:
				RealRace = dbpc->race;
		}

		Corpse* pc = new Corpse(in_dbid, in_charid, in_charname, &itemlist, dbpcs->copper, dbpcs->silver, dbpcs->gold, dbpcs->plat, in_x, in_y, in_z, in_heading, dbpcs->size, dbpcs->gender, RealRace, dbpcs->class_, dbpcs->deity, dbpcs->level, dbpcs->texture, dbpcs->helmtexture, dbpcs->exp, wasAtGraveyard);
		if (dbpcs->locked)
			pc->Lock();

		// load tints
		memcpy(pc->item_tint, dbpcs->item_tint, sizeof(pc->item_tint));
		// appearance
		pc->haircolor = dbpcs->haircolor;
		pc->beardcolor = dbpcs->beardcolor;
		pc->eyecolor1 = dbpcs->eyecolor1;
		pc->eyecolor2 = dbpcs->eyecolor2;
		pc->hairstyle = dbpcs->hairstyle;
		pc->luclinface = dbpcs->face;
		pc->beard = dbpcs->beard;
		pc->drakkin_heritage = dbpcs->drakkin_heritage;
		pc->drakkin_tattoo = dbpcs->drakkin_tattoo;
		pc->drakkin_details = dbpcs->drakkin_details;
		pc->Rezzed(rezzed);
		pc->become_npc = false;
		return pc;
	}
	else
	{
		if (dbpc->crc != CRC32::Generate(&((uchar*) dbpc)[4], in_datasize - 4)) {
			cout << "Corpse::LoadFromDBData: Corrupt data: crc failure" << endl;
			return 0;
		}
		ItemList itemlist;
		ServerLootItem_Struct* tmp = 0;
		for (unsigned int i=0; i < dbpc->itemcount; i++) {
			tmp = new ServerLootItem_Struct;
			memcpy(tmp, &dbpc->items[i], sizeof(ServerLootItem_Struct));
			itemlist.push_back(tmp);
		}

		// Little hack to account for the fact the race in the corpse struct is a uint8 and Froglok/Drakkin race number > 255
		// and to maintain backwards compatability with existing corpses in the database.
		int16 RealRace;

		switch(dbpc->race) {
			case 254:
				RealRace = DRAKKIN;
				break;
			case 255:
				RealRace = FROGLOK;
				break;
			default:
				RealRace = dbpc->race;
		}

		Corpse* pc = new Corpse(in_dbid, in_charid, in_charname, &itemlist, dbpc->copper, dbpc->silver, dbpc->gold, dbpc->plat, in_x, in_y, in_z, in_heading, dbpc->size, dbpc->gender, RealRace, dbpc->class_, dbpc->deity, dbpc->level, dbpc->texture, dbpc->helmtexture,dbpc->exp, wasAtGraveyard);
		if (dbpc->locked)
			pc->Lock();

		// load tints
		memcpy(pc->item_tint, dbpc->item_tint, sizeof(pc->item_tint));
		// appearance
		pc->haircolor = dbpc->haircolor;
		pc->beardcolor = dbpc->beardcolor;
		pc->eyecolor1 = dbpc->eyecolor1;
		pc->eyecolor2 = dbpc->eyecolor2;
		pc->hairstyle = dbpc->hairstyle;
		pc->luclinface = dbpc->face;
		pc->beard = dbpc->beard;
		pc->drakkin_heritage = 0;
		pc->drakkin_tattoo = 0;
		pc->drakkin_details = 0;
		pc->Rezzed(rezzed);
		pc->become_npc = false;
		return pc;
	}
}

// To be used on NPC death and ZoneStateLoad
// Mongrel: added see_invis and see_invis_undead
Corpse::Corpse(NPC* in_npc, ItemList* in_itemlist, int32 in_npctypeid, const NPCType** in_npctypedata, int32 in_decaytime)
// vesuvias - appearence fix
 : Mob("Unnamed_Corpse","",0,0,in_npc->GetGender(),in_npc->GetRace(),in_npc->GetClass(),BT_Humanoid//bodytype added
       ,in_npc->GetDeity(),in_npc->GetLevel(),in_npc->GetNPCTypeID(),in_npc->GetSize(),0,
	 in_npc->GetHeading(),in_npc->GetX(),in_npc->GetY(),in_npc->GetZ(),0,
	 in_npc->GetTexture(),in_npc->GetHelmTexture(),
	 0,0,0,0,0,0,0,0,0,
	 0,0,0,0,0,0,0,0,0,0,0,0xff,0,0,0,0,0,0,0,0,0,0),
	 corpse_decay_timer(in_decaytime),
	corpse_delay_timer(RuleI(NPC, CorpseUnlockTimer)),
	corpse_graveyard_timer(0),
	loot_cooldown_timer(100)
{
	corpse_graveyard_timer.Disable();
	memset(item_tint, 0, sizeof(item_tint));
	pIsChanged = false;
	p_PlayerCorpse = false;
	pLocked = false;
	BeingLootedBy = 0xFFFFFFFF;
	if (in_itemlist) {
		itemlist = *in_itemlist;
		in_itemlist->clear();
	}
	
	SetCash(in_npc->GetCopper(), in_npc->GetSilver(), in_npc->GetGold(), in_npc->GetPlatinum());
	
	npctype_id = in_npctypeid;
	SetPKItem(0);
	charid = 0;
	dbid = 0;
	p_depop = false;
	strcpy(orgname, in_npc->GetName());
	strcpy(name, in_npc->GetName());
	// Added By Hogie 
	for(int count = 0; count < 100; count++) {
		if ((level >= npcCorpseDecayTimes[count].minlvl) && (level <= npcCorpseDecayTimes[count].maxlvl)) {
			corpse_decay_timer.SetTimer(npcCorpseDecayTimes[count].seconds*1000);
			break;
		}
	}
	if(IsEmpty())
	{
		corpse_decay_timer.SetTimer(RuleI(NPC,EmptyNPCCorpseDecayTimeMS)+1000);
	}

	if(in_npc->HasPrivateCorpse())
	{
		corpse_delay_timer.SetTimer(corpse_decay_timer.GetRemainingTime() + 1000);
	}

	// Added By Hogie -- End
	for (int i=0; i<MAX_LOOTERS; i++)
		looters[i] = 0;
	this->rezzexp = 0;
}

// To be used on PC death
// Mongrel: added see_invis and see_invis_undead
Corpse::Corpse(Client* client, sint32 in_rezexp)
// vesuvias - appearence fix
: Mob
(
	"Unnamed_Corpse",
	"",
	0,
	0,
	client->GetGender(),
	client->GetRace(),
	client->GetClass(), 
	BT_Humanoid, // bodytype added
	client->GetDeity(),
	client->GetLevel(),
	0,
	client->GetSize(),
	0,
	client->GetHeading(),	// heading
	client->GetX(),
	client->GetY(),
	client->GetZ(),
	0,
	client->GetTexture(),
	client->GetHelmTexture(),
	0,	// AC
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,	// CHA
	client->GetPP().haircolor,
	client->GetPP().beardcolor,
	client->GetPP().eyecolor1,
	client->GetPP().eyecolor2,
	client->GetPP().hairstyle,
	client->GetPP().face,
	client->GetPP().beard,
	client->GetPP().drakkin_heritage,
	client->GetPP().drakkin_tattoo,
	client->GetPP().drakkin_details,
	0,
	0xff,	// aa title
	0,
	0,
	0,
	0,
	0,
	0,
	0,	// qglobal
	0,	// slow_mitigation
	0,	// maxlevel
	0	// scalerate
),
	corpse_decay_timer(RuleI(Character, CorpseDecayTimeMS)),
	corpse_delay_timer(RuleI(NPC, CorpseUnlockTimer)),
	corpse_graveyard_timer(RuleI(Zone, GraveyardTimeMS)),
	loot_cooldown_timer(100)
{
	int i;
	PlayerProfile_Struct *pp = &client->GetPP();
	ItemInst *item;

	if(!zone->HasGraveyard()) {
		corpse_graveyard_timer.Disable();
	}

	memset(item_tint, 0, sizeof(item_tint));
	for (i=0; i<MAX_LOOTERS; i++)
		looters[i] = 0;

	pIsChanged		= true;
	rezzexp			= in_rezexp;
	p_PlayerCorpse	= true;
	pLocked			= false;
	BeingLootedBy	= 0xFFFFFFFF;
	charid			= client->CharacterID();
	dbid			= 0;
	p_depop			= false;
	copper			= 0;
	silver			= 0;
	gold			= 0;
	platinum		= 0;
	strcpy(orgname, pp->name);
	strcpy(name, pp->name);
	
	//become_npc was not being initialized which led to some pretty funky things with newly created corpses
	become_npc = false;

	SetPKItem(0);

	if((!RuleB(Character, LeaveNakedCorpses)) || (RuleB(Character, LeaveCorpses) && GetLevel() >= RuleI(Character, DeathItemLossLevel))) {
		// cash
		SetCash(pp->copper, pp->silver, pp->gold, pp->platinum);
		pp->copper = 0;
		pp->silver = 0;
		pp->gold = 0;
		pp->platinum = 0;
	
		// get their tints
		memcpy(item_tint, &client->GetPP().item_tint, sizeof(item_tint));
	
		// solar: TODO soulbound items need not be added to corpse, but they need
		// to go into the regular slots on the player, out of bags
	
		// worn + inventory + cursor
		for(i = 0; i <= 30; i++)
		{
			item = client->GetInv().GetItem(i);
			if((item && (!client->IsBecomeNPC())) || (item && client->IsBecomeNPC() && !item->GetItem()->NoRent))
			{
				MoveItemToCorpse(client, item, i);
			}
		}
		// cursor queue
		iter_queue it;
		for(it=client->GetInv().cursor_begin(),i=8000; it!=client->GetInv().cursor_end(); it++,i++) {
			item = *it;
			if((item && (!client->IsBecomeNPC())) || (item && client->IsBecomeNPC() && !item->GetItem()->NoRent))
			{
				MoveItemToCorpse(client, item, i);
			}
		}
		
		client->Save();
	} //end "not leaving naked corpses"
	
	Rezzed(false);
	Save();
}

// solar: helper function for client corpse constructor
void Corpse::MoveItemToCorpse(Client *client, ItemInst *item, sint16 equipslot)
{
	int bagindex;
	sint16 interior_slot;
	ItemInst *interior_item;

	AddItem(item->GetItem()->ID, item->GetCharges(),  equipslot, item->GetAugmentItemID(0), item->GetAugmentItemID(1), item->GetAugmentItemID(2), item->GetAugmentItemID(3), item->GetAugmentItemID(4));
	if(item->IsType(ItemClassContainer))
	{
		for(bagindex = 0; bagindex <= 10; bagindex++)
		{
			interior_slot = Inventory::CalcSlotId(equipslot, bagindex);
			interior_item = client->GetInv().GetItem(interior_slot);

			if(interior_item)
			{
				AddItem(interior_item->GetItem()->ID, interior_item->GetCharges(), interior_slot, interior_item->GetAugmentItemID(0), interior_item->GetAugmentItemID(1), interior_item->GetAugmentItemID(2), interior_item->GetAugmentItemID(3), interior_item->GetAugmentItemID(4));
				client->DeleteItemInInventory(interior_slot);
			}
		}
	}
	client->DeleteItemInInventory(equipslot);
}

// To be called from LoadFromDBData
// Mongrel: added see_invis and see_invis_undead
Corpse::Corpse(int32 in_dbid, int32 in_charid, char* in_charname, ItemList* in_itemlist, int32 in_copper, int32 in_silver, int32 in_gold, int32 in_plat, float in_x, float in_y, float in_z, float in_heading, float in_size, int8 in_gender, int16 in_race, int8 in_class, int8 in_deity, int8 in_level, int8 in_texture, int8 in_helmtexture,int32 in_rezexp, bool wasAtGraveyard)
 : Mob("Unnamed_Corpse","",0,0,in_gender, in_race, in_class, BT_Humanoid, in_deity, in_level,0, in_size, 0, in_heading, in_x, in_y, in_z,0,in_texture,in_helmtexture,
	 0,0,0,0,0,0,0,0,0,
	 0,0,0,0,0,0,0,0,0,0,0,0xff,
	 0,0,0,0,0,0,0,0,0,0),
	corpse_decay_timer(RuleI(Character, CorpseDecayTimeMS)),
	corpse_delay_timer(RuleI(NPC, CorpseUnlockTimer)),
	corpse_graveyard_timer(RuleI(Zone, GraveyardTimeMS)),
	loot_cooldown_timer(100)
{
	if(!zone->HasGraveyard() || wasAtGraveyard)
		corpse_graveyard_timer.Disable();

	memset(item_tint, 0, sizeof(item_tint));
	pIsChanged = false;
	p_PlayerCorpse = true;
	pLocked = false;
	BeingLootedBy = 0xFFFFFFFF;
	dbid = in_dbid;
	p_depop = false;
	charid = in_charid;
	itemlist = *in_itemlist;
	in_itemlist->clear();

	//we really should be loading the decay timer here...
	LoadPlayerCorpseDecayTime(in_dbid);
	
	strcpy(orgname, in_charname);
	strcpy(name, in_charname);
	this->copper = in_copper;
	this->silver = in_silver;
	this->gold = in_gold;
	this->platinum = in_plat;
	rezzexp = in_rezexp;
	for (int i=0; i<MAX_LOOTERS; i++)
		looters[i] = 0;
	SetPKItem(0);
}

Corpse::~Corpse() {
	if (p_PlayerCorpse && !(p_depop && dbid == 0)) {
			Save();
	}
	
	ItemList::iterator cur,end;
	cur = itemlist.begin();
	end = itemlist.end();
	for(; cur != end; cur++) {
		ServerLootItem_Struct* item = *cur;
		safe_delete(item);
	}
	itemlist.clear();
}

/*
this needs to be called AFTER the entity_id is set
the client does this too, so it's unchangable
*/
void Corpse::CalcCorpseName() {
	EntityList::RemoveNumbers(name);
	char tmp[64];
	snprintf(tmp, sizeof(tmp), "'s corpse%d", GetID());
	name[(sizeof(name) - 1) - strlen(tmp)] = 0;
	strcat(name, tmp);
}

bool Corpse::Save() {
	if (!p_PlayerCorpse)
		return true;
	if (!pIsChanged)
		return true;
	
	int32 tmp = this->CountItems();
	int32 tmpsize = sizeof(DBPlayerCorpse_Struct) + (tmp * sizeof(ServerLootItem_Struct));
	DBPlayerCorpse_Struct* dbpc = (DBPlayerCorpse_Struct*) new uchar[tmpsize];
	memset(dbpc, 0, tmpsize);
	dbpc->itemcount = tmp;
	dbpc->size = this->size;
	dbpc->locked = pLocked;
	dbpc->copper = this->copper;
	dbpc->silver = this->silver;
	dbpc->gold = this->gold;
	dbpc->plat = this->platinum;

	// Little hack to account for the fact the race in the corpse struct is a uint8 and Froglok/Drakkin race number > 255
	// and to maintain backwards compatability with existing corpses in the database.
	int16 CorpseRace;

	switch(race) {
		case DRAKKIN:
			CorpseRace = 254;
			break;
		case FROGLOK:
			CorpseRace = 255;
			break;
		default:
			CorpseRace = race;
	}

	dbpc->race = CorpseRace;
	dbpc->class_ = class_;
	dbpc->gender = gender;
	dbpc->deity = deity;
	dbpc->level = level;
	dbpc->texture = this->texture;
	dbpc->helmtexture = this->helmtexture;
	dbpc->exp = rezzexp;

	memcpy(dbpc->item_tint, item_tint, sizeof(dbpc->item_tint));
	dbpc->haircolor = haircolor;
	dbpc->beardcolor = beardcolor;
	dbpc->eyecolor2 = eyecolor1;
	dbpc->hairstyle = hairstyle;
	dbpc->face = luclinface;
	dbpc->beard = beard;
	dbpc->drakkin_heritage = drakkin_heritage;
	dbpc->drakkin_tattoo = drakkin_tattoo;
	dbpc->drakkin_details = drakkin_details;
	
	int32 x = 0;
	ItemList::iterator cur,end;
	cur = itemlist.begin();
	end = itemlist.end();
	for(; cur != end; cur++) {
		ServerLootItem_Struct* item = *cur;
		memcpy((char*) &dbpc->items[x++], (char*) item, sizeof(ServerLootItem_Struct));
	}

	dbpc->crc = CRC32::Generate(&((uchar*) dbpc)[4], tmpsize - 4);

	if (dbid == 0)
		dbid = database.CreatePlayerCorpse(charid, orgname, zone->GetZoneID(), zone->GetInstanceID(), (uchar*) dbpc, tmpsize, x_pos, y_pos, z_pos, heading);
	else
		dbid = database.UpdatePlayerCorpse(dbid, charid, orgname, zone->GetZoneID(), zone->GetInstanceID(), (uchar*) dbpc, tmpsize, x_pos, y_pos, z_pos, heading,Rezzed());
	safe_delete_array(dbpc);
	if (dbid == 0) {
		cout << "Error: Failed to save player corpse '" << this->GetName() << "'" << endl;
		return false;
	}
	return true;
}

void Corpse::Delete() {
	if (IsPlayerCorpse() && dbid != 0)
		database.DeletePlayerCorpse(dbid);
	dbid = 0;

	p_depop = true;
}

void Corpse::Depop(bool StartSpawnTimer) {
	if (IsNPCCorpse())
		p_depop = true;
}

void Corpse::DepopCorpse() {
		p_depop = true;
}

int32 Corpse::CountItems() {
	return itemlist.size();
}

void Corpse::AddItem(uint32 itemnum, int8 charges, sint16 slot, uint32 aug1, uint32 aug2, uint32 aug3, uint32 aug4, uint32 aug5) {
	if (!database.GetItem(itemnum))
		return;
	pIsChanged = true;
	ServerLootItem_Struct* item = new ServerLootItem_Struct;
	memset(item, 0, sizeof(ServerLootItem_Struct));
	item->item_id = itemnum;
	item->charges = charges;
	item->equipSlot = slot;
	item->aug1=aug1;
	item->aug2=aug2;
	item->aug3=aug3;
	item->aug4=aug4;
	item->aug5=aug5;
	itemlist.push_back(item);
}

ServerLootItem_Struct* Corpse::GetItem(int16 lootslot, ServerLootItem_Struct** bag_item_data)
{
	ServerLootItem_Struct *sitem = 0, *sitem2;
	
	// find the item
	ItemList::iterator cur,end;
	cur = itemlist.begin();
	end = itemlist.end();
	for(; cur != end; cur++) {
		if((*cur)->lootslot == lootslot)
		{
			sitem = *cur;
			break;
		}
	}

	if (sitem && bag_item_data && Inventory::SupportsContainers(sitem->equipSlot))
	{
		sint16 bagstart = Inventory::CalcSlotId(sitem->equipSlot, 0);

		cur = itemlist.begin();
		end = itemlist.end();
		for(; cur != end; cur++) {
			sitem2 = *cur;
			if(sitem2->equipSlot >= bagstart && sitem2->equipSlot < bagstart + 10)
			{
				bag_item_data[sitem2->equipSlot - bagstart] = sitem2;
			}
		}
	}
	
	return sitem;
}

uint32 Corpse::GetWornItem(sint16 equipSlot) const {
	ItemList::const_iterator cur,end;
	cur = itemlist.begin();
	end = itemlist.end();
	for(; cur != end; cur++) {
		ServerLootItem_Struct* item = *cur;
		if (item->equipSlot == equipSlot)
		{
			return item->item_id;
		}
	}
	
	return 0;
}

void Corpse::RemoveItem(int16 lootslot)
{

	if (lootslot == 0xFFFF)
		return;
	
	ItemList::iterator cur,end;
	cur = itemlist.begin();
	end = itemlist.end();
	for(; cur != end; cur++) {
		ServerLootItem_Struct* sitem = *cur;
		if (sitem->lootslot == lootslot)
		{
			RemoveItem(sitem);
			return;
		}
	}
}

void Corpse::RemoveItem(ServerLootItem_Struct* item_data)
{
	int8 material;
	
	ItemList::iterator cur,end;
	cur = itemlist.begin();
	end = itemlist.end();
	for(; cur != end; cur++) {
		ServerLootItem_Struct* sitem = *cur;
		if (sitem == item_data)
		{
			pIsChanged = true;
			itemlist.erase(cur);

			material = Inventory::CalcMaterialFromSlot(sitem->equipSlot);
			if(material != 0xFF)
				SendWearChange(material);
			
			safe_delete(sitem);
			
			return;
		}
	}
}

void Corpse::SetCash(int32 in_copper, int32 in_silver, int32 in_gold, int32 in_platinum) {
	this->copper = in_copper;
	this->silver = in_silver;
	this->gold = in_gold;
	this->platinum = in_platinum;
	pIsChanged = true;
}

void Corpse::RemoveCash() {
	this->copper = 0;
	this->silver = 0;
	this->gold = 0;
	this->platinum = 0;
	pIsChanged = true;
}

bool Corpse::IsEmpty() const {
	if (copper != 0 || silver != 0 || gold != 0 || platinum != 0)
		return false;
	return(itemlist.size() == 0);
}

bool Corpse::Process() {
	if (p_depop)
		return false;
	
	if(corpse_delay_timer.Check())
	{
		for (int i=0; i<MAX_LOOTERS; i++)
			looters[i] = 0;
		corpse_delay_timer.Disable();
		return true;
	}

	if(corpse_graveyard_timer.Check()) {
		if(zone->HasGraveyard()) {
			Save();
			p_depop = true;
			database.GraveyardPlayerCorpse(dbid, zone->graveyard_zoneid(), 
				(zone->GetZoneID() == zone->graveyard_zoneid()) ? zone->GetInstanceID() : 0, zone->graveyard_x(), 
				zone->graveyard_y(), zone->graveyard_z(), zone->graveyard_heading());
			corpse_graveyard_timer.Disable();
			ServerPacket* pack = new ServerPacket(ServerOP_SpawnPlayerCorpse, sizeof(SpawnPlayerCorpse_Struct));
			SpawnPlayerCorpse_Struct* spc = (SpawnPlayerCorpse_Struct*)pack->pBuffer;
			spc->player_corpse_id = dbid;
			spc->zone_id = zone->graveyard_zoneid();
			worldserver.SendPacket(pack);
			safe_delete(pack);
			LogFile->write(EQEMuLog::Debug, "Moved %s player corpse to the designated graveyard in zone %s.", this->GetName(), database.GetZoneName(zone->graveyard_zoneid()));
			dbid = 0;
		}
		
		corpse_graveyard_timer.Disable();
		return false;
	}

	if(corpse_decay_timer.Check()) {
		if(!RuleB(Zone, EnableShadowrest))
			Delete();
		else {
			if(database.BuryPlayerCorpse(dbid)) {
				Save();
				p_depop = true;
				dbid = 0;
				LogFile->write(EQEMuLog::Debug, "Tagged %s player corpse has burried.", this->GetName());
			}
			else
			{
				LogFile->write(EQEMuLog::Error, "Unable to bury %s player corpse.", this->GetName());
				return true;
			}
		}
		corpse_decay_timer.Disable();
		return false;
	}
	
	return true;
}

void Corpse::SetDecayTimer(int32 decaytime) {
	if (decaytime == 0)
		corpse_decay_timer.Trigger();
	else
		corpse_decay_timer.Start(decaytime);
}

bool Corpse::CanMobLoot(int charid) {
	int8 z=0;
	for(int i=0; i<MAX_LOOTERS; i++) {
		if(looters[i] != 0)
			z++;

		if (looters[i] == charid)
			return true;
	}
	if(z == 0)
		return true;
	else
		return false;
}

void Corpse::AllowMobLoot(Mob *them, int8 slot)
{
	if(slot >= MAX_LOOTERS)
		return;
	if(them == NULL || !them->IsClient())
		return;

	looters[slot] = them->CastToClient()->CharacterID();
}

// @merth: this function needs some work
void Corpse::MakeLootRequestPackets(Client* client, const EQApplicationPacket* app) {
	// Added 12/08.  Started compressing loot struct on live.
	char tmp[10];
	if(p_depop)
	{
		SendLootReqErrorPacket(client, 0);
		return;
	}
	
	if (IsPlayerCorpse()){
	    if(!client->GetInv().CursorEmpty())
	    {
		client->Message(13, "Error: You have an item on your cursor.");
		SendEndLootErrorPacket(client);
		return;
	    }
	    if(client->IsBotRaiding())
	    {
		//client->Message(13, "Warning: If this is players corpse, you should not loot while in raid mode!.");
		client->Message(13, "Error: You cannot loot your corpse while in raid mode.");
		client->Message(13, "Too many spawned bots while looting could create lag and bug your corpse.");
		//cout << "PlayerCorpse Warning:: Player possible attempted corpse loot in raid mode!" << endl;
		SendEndLootErrorPacket(client);
		return;
	    }
	    if (pLocked && client->Admin() < 100) {
		SendLootReqErrorPacket(client, 0);
		client->Message(13, "Error: Corpse locked by GM.");
		return;
	    }
	    if((charid != client->CharacterID() && client->Admin() < 150) && (CanMobLoot(client->CharacterID())) && (GetPKItem()==0)){
		client->Message(13, "Error: This is a player corpse and you dont own it.");
		SendEndLootErrorPacket(client);
		BeingLootedBy = 0xFFFFFFFF;
		return;
	    }
	    if (dbid == 0) {
//		SendLootReqErrorPacket(client, 0);
		client->Message(13, "Warning: Corpse's dbid = 0! Corpse will not survive zone shutdown!");
		cout << "Error: PlayerCorpse::MakeLootRequestPackets: dbid = 0!" << endl;
//		return;
	    }
	}
	    
	if (pLocked && client->Admin() < 100) {
		SendLootReqErrorPacket(client, 0);
		client->Message(13, "Error: Corpse locked by GM.");
		return;
	}
	if(BeingLootedBy == 0)
		BeingLootedBy = 0xFFFFFFFF;
	if (this->BeingLootedBy != 0xFFFFFFFF) {
		// lets double check....
		Entity* looter = entity_list.GetID(this->BeingLootedBy);
		if (looter == 0 || !looter->IsClient())
			this->BeingLootedBy = 0xFFFFFFFF;
	}	
	int8 tCanLoot = 1;
	bool lootcoin=false;
	if(database.GetVariable("LootCoin",tmp, 9))
		lootcoin=(atoi(tmp)==1);
	if (this->BeingLootedBy != 0xFFFFFFFF && this->BeingLootedBy != client->GetID()) {
		SendLootReqErrorPacket(client, 0);
		tCanLoot = 0;
	}
	else if(IsPlayerCorpse() && charid == client->CharacterID())
		tCanLoot = 2;
	else if ((IsNPCCorpse() || become_npc) && CanMobLoot(client->CharacterID()))
		tCanLoot = 2;
	else if(GetPKItem()==-1 && CanMobLoot(client->CharacterID()))
		tCanLoot = 3; //pvp loot all items, variable cash
	else if(GetPKItem()==1 && CanMobLoot(client->CharacterID()))
		tCanLoot = 4; //pvp loot 1 item, variable cash
	else if(GetPKItem()>1 && CanMobLoot(client->CharacterID()))
		tCanLoot = 5; //pvp loot 1 set item, variable cash
	if(tCanLoot == 1){
		if (client->Admin() < 100 || !client->GetGM()) {
			SendLootReqErrorPacket(client, 2);
		}
	}
	if (tCanLoot >= 2 || (tCanLoot == 1 && client->Admin() >= 100 && client->GetGM()))
	{
		this->BeingLootedBy = client->GetID();
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_MoneyOnCorpse, sizeof(moneyOnCorpseStruct));
		moneyOnCorpseStruct* d = (moneyOnCorpseStruct*) outapp->pBuffer;
		
		d->response		= 1;
		d->unknown1		= 0x42;
		d->unknown2		= 0xef;
		if (tCanLoot == 2 || (tCanLoot>=3 && lootcoin)) { // dont take the coin off if it's a gm peeking at the corpse
			if (zone->lootvar!=0){
				int admin=client->Admin();
				if (zone->lootvar==7){
						client->LogLoot(client,this,0);
				}
				else if ((admin>=10) && (admin<20)){
					if ((zone->lootvar<8) && (zone->lootvar>5))
						client->LogLoot(client,this,0);
				}
				else if (admin<=20){
					if ((zone->lootvar<8) && (zone->lootvar>4))
						client->LogLoot(client,this,0);
				}
				else if (admin<=80){
					if ((zone->lootvar<8) && (zone->lootvar>3))
						client->LogLoot(client,this,0);
				}
				else if (admin<=100){
					if ((zone->lootvar<9) && (zone->lootvar>2))
						client->LogLoot(client,this,0);
				}
				else if (admin<=150){
					if (((zone->lootvar<8) && (zone->lootvar>1)) || (zone->lootvar==9))
						client->LogLoot(client,this,0);
				}
				else if (admin<=255){
					if ((zone->lootvar<8) && (zone->lootvar>0))
						client->LogLoot(client,this,0);	
				}
			}
			if(!IsPlayerCorpse() && client->IsGrouped() && client->AutoSplitEnabled() && client->GetGroup()) {
				d->copper		= 0;
				d->silver		= 0;
				d->gold			= 0;
				d->platinum		= 0;
				Group *cgroup = client->GetGroup();
				cgroup->SplitMoney(GetCopper(), GetSilver(), GetGold(), GetPlatinum(), client);
			} else {
				d->copper		= this->GetCopper();
				d->silver		= this->GetSilver();
				d->gold			= this->GetGold();
				d->platinum		= this->GetPlatinum();
				client->AddMoneyToPP(GetCopper(),GetSilver(),GetGold(),GetPlatinum(),false);
			}
			RemoveCash();
			Save();
			client->Save();
		}
		outapp->priority = 6;
		client->QueuePacket(outapp); 
		safe_delete(outapp);
		if(tCanLoot==5){
			int pkitem = GetPKItem();
			const Item_Struct* item = database.GetItem(pkitem);
			ItemInst* inst = database.CreateItem(item, item->MaxCharges);
			if (inst)
			{
				client->SendItemPacket(22, inst, ItemPacketLoot);
				safe_delete(inst);
			}
			else
				client->Message(13,"Could not find item number %i to send!!",GetPKItem());
			client->QueuePacket(app);
			return;
		}

		int i = 0;
		const Item_Struct* item = 0;
		ItemList::iterator cur,end;
		cur = itemlist.begin();
		end = itemlist.end();
		for(; cur != end; cur++) {
			ServerLootItem_Struct* item_data = *cur;
			item_data->lootslot = 0xFFFF;

			// Dont display the item if it's in a bag
			if(!IsPlayerCorpse() || item_data->equipSlot <= 30 || tCanLoot>=3)
			{
				if (i >= 30)
				{
						Message(13, "Warning: Too many items to display. Loot some then re-loot the corpse to see the rest");
				}
				else
				{
					item = database.GetItem(item_data->item_id);
					if (client && item)
					{
						ItemInst* inst = database.CreateItem(item, item_data->charges, item_data->aug1, item_data->aug2, item_data->aug3, item_data->aug4, item_data->aug5);
						if (inst)
						{
							client->SendItemPacket(i + 22, inst, ItemPacketLoot);
							safe_delete(inst);
						}
						item_data->lootslot = i;
					}
				}
				i++;
			}
		}
	}
	
	// Disgrace: Client seems to require that we send the packet back...
	client->QueuePacket(app);

	// This is required for the 'Loot All' feature to work for SoD clients. I expect it is to tell the client that the
	// server has now sent all the items on the corpse.
	if(client->GetClientVersion() >= EQClientSoD)
	      if(IsPlayerCorpse()){
		client->Message(15, "'Loot All' feature disabled, as it can crash the zone and bug your characters corpse.");
	      }
	      else{ //Left it enabled for mobs, as they don't have much to loot.
		SendLootReqErrorPacket(client, 6);
	      }
}

void Corpse::LootItem(Client* client, const EQApplicationPacket* app)
{
	//this gets sent out no matter what as a sort of 'ack', so send it here.
	client->QueuePacket(app);

	if(!loot_cooldown_timer.Check())
	{
		SendEndLootErrorPacket(client);
		return;
	}
	// To prevent item loss for a player using 'Loot All' who doesn't have inventory space for all their items.
	if(!client->GetInv().CursorEmpty())
	{
		client->Message(13, "You may not loot an item while you have an item on your cursor.");
		SendEndLootErrorPacket(client);
		return;
	}

	LootingItem_Struct* lootitem = (LootingItem_Struct*)app->pBuffer;

	if (this->BeingLootedBy != client->GetID()) {
		client->Message(13, "Error: Corpse::LootItem: BeingLootedBy != client");
		SendEndLootErrorPacket(client);
		return;
	}
	if (IsPlayerCorpse() && !CanMobLoot(client->CharacterID()) && !become_npc && (charid != client->CharacterID() && client->Admin() < 150)) {
		client->Message(13, "Error: This is a player corpse and you dont own it.");
		SendEndLootErrorPacket(client);
		return;
	}
	if (pLocked && client->Admin() < 100) {
		SendLootReqErrorPacket(client, 0);
		client->Message(13, "Error: Corpse locked by GM.");
		return;
	}
	if(IsPlayerCorpse() && (charid != client->CharacterID()) && CanMobLoot(client->CharacterID()) && GetPKItem()==0){
		client->Message(13, "Error: You cannot loot any more items from this corpse.");
		SendEndLootErrorPacket(client);
		BeingLootedBy = 0xFFFFFFFF;
		return;
	}
	const Item_Struct* item = 0;
	ItemInst *inst = 0;
	ServerLootItem_Struct* item_data = NULL, *bag_item_data[10];
	
	memset(bag_item_data, 0, sizeof(bag_item_data));
	if(GetPKItem()>1)
		item = database.GetItem(GetPKItem());
	else if(GetPKItem()==-1 || GetPKItem()==1)
		item_data = GetItem(lootitem->slot_id - 22); //dont allow them to loot entire bags of items as pvp reward
	else
		item_data = GetItem(lootitem->slot_id - 22, bag_item_data);

	if (GetPKItem()<=1 && item_data != 0)
	{
		item = database.GetItem(item_data->item_id);
	}
	
	// Prevent Item Duplication When Looting Corpse
	if (((item_data->equipSlot >= 251) && (item_data->equipSlot <= 330)) && ((charid == client->CharacterID()) && (IsPlayerCorpse()))) {
		client->Message(13, "Anti-Item Duplicate Attempt - You're looting too fast!");
		return ;
	}
	
	//Original
	/*
	if (((item_data->equipSlot >= 251) && (item_data->equipSlot <= 330)) && ((charid == client->CharacterID()) && (IsPlayerCorpse()))) {
		char *itemdupemsg = NULL;
		MakeAnyLenString(&itemdupemsg,  "Loot Item Duplication {%s}", item->Name);
		database.SetMQDetectionFlag(client->AccountName(), client->GetName(), itemdupemsg, zone->GetShortName());
		safe_delete_array(itemdupemsg);
		return ;
	}
	*/
	
	if (item != 0)
	{
		if(item_data)
			inst = database.CreateItem(item, item_data?item_data->charges:0, item_data->aug1, item_data->aug2, item_data->aug3, item_data->aug4, item_data->aug5);
		else
			inst = database.CreateItem(item);

		if(inst->IsStackable()) {
			if(item_data) 
				//Restore charges from the original item.
				inst->SetCharges(item_data->charges);
			else
				inst->SetCharges(1);
		} else {
			//default changes
			if(item->MaxCharges == -1)
				inst->SetCharges(1);
			else {
				if(item_data) {
					//Restore charges from the original item.
					inst->SetCharges(item_data->charges);
				}
				else {
					inst->SetCharges(item->MaxCharges);
				}
			}
		}
	}

	if (client && inst)
	{
		if (client->CheckLoreConflict(item))
		{
		   if ((IsPlayerCorpse()) && (client->Admin() < 100)){
			client->Message(13, "Error: Duplicate item found, Player corpse bugged.");
			client->Message(13, "An attempt has been made to repair the problem.");
			client->Message(13, "Don't loot anything that appears duplicate, else you risk bugging your character!.");
			client->Message(13, "Inform a GM if you lost item for replacement.");
			delete inst;
			delete item_data;
			return;
		    }
		    else{
			client->Message_StringID(0,LOOT_LORE_ERROR);
			SendEndLootErrorPacket(client);
			BeingLootedBy = 0;
			delete inst;
			return;
		    }
		}

#ifdef EMBPERL
		char buf[24];
		snprintf(buf, 23, "%d %d", inst->GetItem()->ID, inst->GetCharges());
		buf[23] = '\0';
		((PerlembParser*)parse)->Event(EVENT_LOOT, 0, buf, (NPC*)NULL, client);
#endif

		if (zone->lootvar != 0)
		{
			int admin=client->Admin();
			if (zone->lootvar==7){
					client->LogLoot(client,this,item);
			}
			else if ((admin>=10) && (admin<20)){
				if ((zone->lootvar<8) && (zone->lootvar>5))
					client->LogLoot(client,this,item);
			}
			else if (admin<=20){
				if ((zone->lootvar<8) && (zone->lootvar>4))
					client->LogLoot(client,this,item);
			}
			else if (admin<=80){
				if ((zone->lootvar<8) && (zone->lootvar>3))
					client->LogLoot(client,this,item);
			}
			else if (admin<=100){
				if ((zone->lootvar<9) && (zone->lootvar>2))
					client->LogLoot(client,this,item);
			}
			else if (admin<=150){
				if (((zone->lootvar<8) && (zone->lootvar>1)) || (zone->lootvar==9))
					client->LogLoot(client,this,item);
			}
			else if (admin<=255){
				if ((zone->lootvar<8) && (zone->lootvar>0))
					client->LogLoot(client,this,item);	
			}
		}

		AdventureDetails *ad = client->GetCurrentAdventure();
		if(ad && ad->ai)
		{
			if(ad->instance_id == zone->GetInstanceID())
			{
				if(!IsPlayerCorpse())
				{
					if(ad->ai->type == Adventure_Collect)
					{
						if(ad->ai->type_data == inst->GetItem()->ID)
						{
							//todo increment one for every item in stack.
							zone->UpdateAdventureCount(ad);
						}
					}
				}
			}
		}

		// first add it to the looter - this will do the bag contents too
		if(lootitem->auto_loot)
		{
			if(!client->AutoPutLootInInventory(*inst, true, true, bag_item_data))
				client->PutLootInInventory(SLOT_CURSOR, *inst, bag_item_data);
		}
		else
		{
			client->PutLootInInventory(SLOT_CURSOR, *inst, bag_item_data);
		}
		// Update any tasks that have an activity to loot this item.
		if(RuleB(TaskSystem, EnableTaskSystem))
			client->UpdateTasksForItem(ActivityLoot, item->ID);
		// now remove it from the corpse
		if(item_data)
			RemoveItem(item_data->lootslot);
		// remove bag contents too
		if (item->ItemClass == ItemClassContainer && (GetPKItem()!=-1 || GetPKItem()!=1))
		{
			for (int i=0; i < 10; i++)
			{
				if (bag_item_data[i])
				{
					RemoveItem(bag_item_data[i]);
				}
			}
		}
		
		if(GetPKItem()!=-1)
			SetPKItem(0);
		
		//now send messages to all interested parties

		//creates a link for the item
		char *link = 0, *link2 = 0; //just like a db query  :-)
		client->MakeItemLink(link2, inst);
		MakeAnyLenString(&link, "%c" "%s" "%s" "%c",
			0x12,
			link2,
			item->Name,
			0x12);
		safe_delete_array(link2);

		client->Message_StringID(MT_LootMessages, LOOTED_MESSAGE, link);
		if(!IsPlayerCorpse()) {
			Group *g = client->GetGroup();
			if(g != NULL) {
				g->GroupMessage_StringID(client, MT_LootMessages, OTHER_LOOTED_MESSAGE, client->GetName(), link);
			}
		}
		safe_delete_array(link);
	}
	else
	{
		SendEndLootErrorPacket(client);
		safe_delete(inst);
		return;
	}

	if (IsPlayerCorpse())
		client->SendItemLink(inst);
	else
		client->SendItemLink(inst, true);

	safe_delete(inst);
}

void Corpse::EndLoot(Client* client, const EQApplicationPacket* app) {
	EQApplicationPacket* outapp = new EQApplicationPacket;
	outapp->SetOpcode(OP_LootComplete);
	outapp->size = 0;
	client->QueuePacket(outapp);
	safe_delete(outapp);
	
	//client->Save();		//inventory operations auto-commit
	this->BeingLootedBy = 0xFFFFFFFF;
	if (this->IsEmpty())
		Delete();
	else
		Save();
}

void Corpse::FillSpawnStruct(NewSpawn_Struct* ns, Mob* ForWho)
{
	Mob::FillSpawnStruct(ns, ForWho);
	
	ns->spawn.max_hp = 120;
	
	if (IsPlayerCorpse())
		ns->spawn.NPC = 3;
	else
		ns->spawn.NPC = 2;
}

void Corpse::QueryLoot(Client* to) {
	int x = 0;
	to->Message(0, "Coin: %ip %ig %is %ic", platinum, gold, silver, copper);

	ItemList::iterator cur,end;
	cur = itemlist.begin();
	end = itemlist.end();
	for(; cur != end; cur++) {
		ServerLootItem_Struct* sitem = *cur;
		const Item_Struct* item = database.GetItem(sitem->item_id);
		if (item)
			to->Message(0, "  %d: %s", item->ID, item->Name);
		else
			to->Message(0, "  Error: 0x%04x", sitem->item_id);
		x++;
	}
	to->Message(0, "%i items on %s.", x, this->GetName());
}

void Corpse::Summon(Client* client,bool spell) {
	int32 dist2 = 10000; // pow(100, 2);
	if (!spell) {
		if (this->GetCharID() == client->CharacterID()) {
			if (IsLocked() && client->Admin() < 100) {
				client->Message(13, "That corpse is locked by a GM.");
			}
			else if (DistNoRootNoZ(*client) <= dist2) {
				GMMove(client->GetX(), client->GetY(), client->GetZ());
				pIsChanged = true;
			}
			else
				client->Message(0, "Corpse is too far away.");
		}
		else 
		{
			bool consented = false;
			std::list<std::string>::iterator itr;
			for(itr = client->consent_list.begin(); itr != client->consent_list.end(); itr++)
			{
				if(strcmp(this->GetOwnerName(), itr->c_str()) == 0)
				{
					if (DistNoRootNoZ(*client) <= dist2)
					{
						GMMove(client->GetX(), client->GetY(), client->GetZ());
						pIsChanged = true;
					}
					else
					{
						client->Message(0, "Corpse is too far away.");
					}
					consented = true;
				}
			}
			if(!consented)
				client->Message(0, "You do not have permission to move this corpse.");
		}
	}
	else {
		GMMove(client->GetX(), client->GetY(), client->GetZ());
		pIsChanged = true;
	}
	Save();
}

void Corpse::CompleteRezz(){
	rezzexp = 0;
	pIsChanged = true;
	this->Save();
}

void Corpse::Spawn() {
	EQApplicationPacket* app = new EQApplicationPacket;
	this->CreateSpawnPacket(app, this);
	entity_list.QueueClients(this, app);
	safe_delete(app);
}

bool ZoneDatabase::DeleteGraveyard(int32 zone_id, int32 graveyard_id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char* query = new char[256];
	int32 query_length = 0;
	int32 affected_rows = 0;
	
	query_length = sprintf(query,"UPDATE zone SET graveyard_id=0 WHERE zoneidnumber=%u", zone_id);
	
	if (!RunQuery(query, query_length, errbuf, 0, &affected_rows)) {
		safe_delete_array(query);
        cerr << "Error1 in DeleteGraveyard query " << errbuf << endl;
		return false;
    }
	
	if (affected_rows == 0) {
        cerr << "Error2 in DeleteGraveyard query: affected_rows = 0" << endl;
		return false;
	}

	query_length = sprintf(query,"DELETE FROM graveyard WHERE id=%u", graveyard_id);

	if (!RunQuery(query, query_length, errbuf, 0, &affected_rows)) {
		safe_delete_array(query);
        cerr << "Error3 in DeleteGraveyard query " << errbuf << endl;
		return false;
    }
	safe_delete_array(query);
	
	if (affected_rows == 0) {
        cerr << "Error4 in DeleteGraveyard query: affected_rows = 0" << endl;
		return false;
	}

	return true;
}
int32 ZoneDatabase::AddGraveyardIDToZone(int32 zone_id, int32 graveyard_id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char* query = new char[256];
	char* end = query;
	int32 affected_rows = 0;
	
	end += sprintf(end,"UPDATE zone SET graveyard_id=%u WHERE zoneidnumber=%u", graveyard_id, zone_id);
	
	if (!RunQuery(query, (int32) (end - query), errbuf, 0, &affected_rows)) {
		safe_delete_array(query);
        cerr << "Error1 in AddGraveyardIDToZone query " << errbuf << endl;
		return 0;
    }
	safe_delete_array(query);
	
	if (affected_rows == 0) {
        cerr << "Error2 in AddGraveyardIDToZone query: affected_rows = 0" << endl;
		return 0;
	}

	return zone_id;
}
int32 ZoneDatabase::NewGraveyardRecord(int32 graveyard_zoneid, float graveyard_x, float graveyard_y, float graveyard_z, float graveyard_heading) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char* query = new char[256];
	char* end = query;
	int32 affected_rows = 0;
	int32 new_graveyard_id = 0;
	
	end += sprintf(end,"INSERT INTO graveyard SET zone_id=%u, x=%1.1f, y=%1.1f, z=%1.1f, heading=%1.1f", graveyard_zoneid, graveyard_x, graveyard_y, graveyard_z, graveyard_heading);
	
	if (!RunQuery(query, (int32) (end - query), errbuf, 0, &affected_rows, &new_graveyard_id)) {
		safe_delete_array(query);
        cerr << "Error1 in NewGraveyardRecord query " << errbuf << endl;
		return 0;
    }
	safe_delete_array(query);
	
	if (affected_rows == 0) {
        cerr << "Error2 in NewGraveyardRecord query: affected_rows = 0" << endl;
		return 0;
	}

	if(new_graveyard_id <= 0) {
		cerr << "Error3 in NewGraveyardRecord query: new_graveyard_id <= 0" << endl;
		return 0;
	}

	return new_graveyard_id;
}
int32 ZoneDatabase::GraveyardPlayerCorpse(int32 dbid, int32 zoneid, int16 instanceid, float x, float y, float z, float heading) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char* query = new char[256];
	char* end = query;
	int32 affected_rows = 0;
	
	end += sprintf(end,"Update player_corpses SET zoneid=%u, instanceid=%u, x=%1.1f, y=%1.1f, z=%1.1f, heading=%1.1f, WasAtGraveyard=1 WHERE id=%d", zoneid, instanceid, x, y, z, heading, dbid);
	
	if (!RunQuery(query, (int32) (end - query), errbuf, 0, &affected_rows)) {
		safe_delete_array(query);
        cerr << "Error1 in GraveyardPlayerCorpse query " << errbuf << endl;
		return 0;
    }
	safe_delete_array(query);
	
	if (affected_rows == 0) {
        cerr << "Error2 in GraveyardPlayerCorpse query: affected_rows = 0" << endl;
		return 0;
	}
	return dbid;
}
int32 ZoneDatabase::UpdatePlayerCorpse(int32 dbid, int32 charid, const char* charname, int32 zoneid, int16 instanceid, uchar* data, int32 datasize, float x, float y, float z, float heading, bool rezzed) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char* query = new char[256+(datasize*2)];
	char* end = query;
	int32 affected_rows = 0;
	
	end += sprintf(end, "Update player_corpses SET data=");
	*end++ = '\'';
	end += DoEscapeString(end, (char*)data, datasize);
	*end++ = '\'';
	end += sprintf(end,", charname='%s', zoneid=%u, instanceid=%u, charid=%d, x=%1.1f, y=%1.1f, z=%1.1f, heading=%1.1f WHERE id=%d", charname, zoneid, instanceid, charid, x, y, z, heading, dbid);
	
	if (!RunQuery(query, (int32) (end - query), errbuf, 0, &affected_rows)) {
		safe_delete_array(query);
        cerr << "Error1 in UpdatePlayerCorpse query " << errbuf << endl;
		return 0;
    }
	safe_delete_array(query);
	
	if (affected_rows == 0) {
        cerr << "Error2 in UpdatePlayerCorpse query: affected_rows = 0" << endl;
		return 0;
	}
	if(rezzed){
		if (!RunQuery(query, MakeAnyLenString(&query, "update player_corpses set rezzed = 1 WHERE id=%d",dbid), errbuf)) {
			safe_delete_array(query);
			cerr << "Error in UpdatePlayerCorpse/Rezzed query: " << errbuf << endl;
		}
	}
	return dbid;
}

int32 ZoneDatabase::CreatePlayerCorpse(int32 charid, const char* charname, int32 zoneid, int16 instanceid, uchar* data, int32 datasize, float x, float y, float z, float heading) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char* query = new char[256+(datasize*2)];
	char* end = query;
    //MYSQL_RES *result;
    //MYSQL_ROW row;
	int32 affected_rows = 0;
	int32 last_insert_id = 0;
	
	end += sprintf(end, "Insert into player_corpses SET data=");
	*end++ = '\'';
	end += DoEscapeString(end, (char*)data, datasize);
	*end++ = '\'';
	end += sprintf(end,", charname='%s', zoneid=%u, instanceid=%u, charid=%d, x=%1.1f, y=%1.1f, z=%1.1f, heading=%1.1f, timeofdeath=Now(), IsBurried=0", charname, zoneid, instanceid, charid, x, y, z, heading);
	
    if (!RunQuery(query, (int32) (end - query), errbuf, 0, &affected_rows, &last_insert_id)) {
		safe_delete_array(query);
        cerr << "Error1 in CreatePlayerCorpse query " << errbuf << endl;
		return 0;
    }
	safe_delete_array(query);
	
	if (affected_rows == 0) {
        cerr << "Error2 in CreatePlayerCorpse query: affected_rows = 0" << endl;
		return 0;
	}

	if (last_insert_id == 0) {
        cerr << "Error3 in CreatePlayerCorpse query: last_insert_id = 0" << endl;
		return 0;
	}
	
	return last_insert_id;
}

int32 ZoneDatabase::GetPlayerBurriedCorpseCount(int32 char_id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	int32 CorpseCount = 0;
	
	if (RunQuery(query, MakeAnyLenString(&query, "select count(*) from player_corpses where charid = '%u' and IsBurried = 1", char_id), errbuf, &result)) {
		row = mysql_fetch_row(result);
		CorpseCount = atoi(row[0]);
		mysql_free_result(result);
	}
	else {
		cerr << "Error in GetPlayerBurriedCorpseCount query '" << query << "' " << errbuf << endl;
	}
	
	safe_delete_array(query);

	return CorpseCount;
}

int32 ZoneDatabase::GetPlayerCorpseCount(int32 char_id) {
        char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
        int32 CorpseCount = 0;

        if (RunQuery(query, MakeAnyLenString(&query, "select count(*) from player_corpses where charid = '%u'", char_id), errbuf, &result)) {
                row = mysql_fetch_row(result);
                CorpseCount = atoi(row[0]);
                mysql_free_result(result);
        }
        else {
                cerr << "Error in GetPlayerCorpseCount query '" << query << "' " << errbuf << endl;
        }

        safe_delete_array(query);

        return CorpseCount;
}

Corpse* ZoneDatabase::SummonBurriedPlayerCorpse(int32 char_id, int32 dest_zoneid, int16 dest_instanceid, float dest_x, float dest_y, float dest_z, float dest_heading) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	Corpse* NewCorpse = 0;
	unsigned long* lengths;
	
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT id, charname, data, timeofdeath, rezzed FROM player_corpses WHERE charid='%u' AND IsBurried=1 ORDER BY timeofdeath LIMIT 1", char_id), errbuf, &result)) {
		row = mysql_fetch_row(result);
		lengths = mysql_fetch_lengths(result);
		if(row) {
			NewCorpse = Corpse::LoadFromDBData(atoi(row[0]), char_id, row[1], (uchar*) row[2], lengths[2], dest_x, dest_y, dest_z, dest_heading, row[3],atoi(row[4])==1, false);
			if(NewCorpse) {
				entity_list.AddCorpse(NewCorpse);
				if(!UnburyPlayerCorpse(NewCorpse->GetDBID(), dest_zoneid, dest_instanceid, dest_x, dest_y, dest_z, dest_heading))
					LogFile->write(EQEMuLog::Error, "Unable to unbury a summoned player corpse for character id %u.", char_id);
			}
			else
				LogFile->write(EQEMuLog::Error, "Unable to construct a player corpse from a burried player corpse for character id %u.", char_id);
		}

		mysql_free_result(result);
	}
	else {
		cerr << "Error in SummonBurriedPlayerCorpse query '" << query << "' " << errbuf << endl;
	}
	
	safe_delete_array(query);

	return NewCorpse;
}

bool ZoneDatabase::SummonAllPlayerCorpses(int32 char_id, int32 dest_zoneid, int16 dest_instanceid,
					  float dest_x, float dest_y, float dest_z, float dest_heading)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	Corpse* NewCorpse = 0;
	int CorpseCount = 0;
	unsigned long* lengths;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE player_corpses SET zoneid = %i, instanceid = %i, x = %f, y = %f, z = %f, "
						     "heading = %f, IsBurried = 0, WasAtGraveyard = 0 WHERE charid = %i",
						     dest_zoneid, dest_instanceid, dest_x, dest_y, dest_z, dest_heading, char_id), errbuf))
		LogFile->write(EQEMuLog::Error, "Error moving corpses, Query = %s, Error = %s\n", query, errbuf);

	safe_delete_array(query);
		
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT id, charname, data, timeofdeath, rezzed FROM player_corpses WHERE charid='%u'"
						     "ORDER BY timeofdeath", char_id), errbuf, &result))
	{
		while((row = mysql_fetch_row(result)))
		{
			lengths = mysql_fetch_lengths(result);
			NewCorpse = Corpse::LoadFromDBData(atoi(row[0]), char_id, row[1], (uchar*) row[2], lengths[2], dest_x, dest_y,
							   dest_z, dest_heading, row[3],atoi(row[4])==1, false);
			if(NewCorpse) {
				entity_list.AddCorpse(NewCorpse);
				NewCorpse->SetDecayTimer(RuleI(Character, CorpseDecayTimeMS));
				NewCorpse->Spawn();
				++CorpseCount;
			}
			else
				LogFile->write(EQEMuLog::Error, "Unable to construct a player corpse for character id %u.", char_id);
		}

		mysql_free_result(result);
	}
	else
		LogFile->write(EQEMuLog::Error, "Error in SummonAllPlayerCorpses Query = %s, Error = %s\n", query, errbuf);
	
	safe_delete_array(query);

	return (CorpseCount > 0);
}

bool ZoneDatabase::UnburyPlayerCorpse(int32 dbid, int32 new_zoneid, int16 new_instanceid, float new_x, float new_y, float new_z, float new_heading) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char* query = new char[256];
	char* end = query;
	int32 affected_rows = 0;
	bool Result = false;
	
	end += sprintf(end, "UPDATE player_corpses SET IsBurried=0, zoneid=%u, instanceid=%u, x=%f, y=%f, z=%f, heading=%f, timeofdeath=Now(), WasAtGraveyard=0 WHERE id=%u", new_zoneid, new_instanceid, new_x, new_y, new_z, new_heading, dbid);
		
	if (RunQuery(query, (int32) (end - query), errbuf, 0, &affected_rows)) {
        if (affected_rows == 1)
			Result = true;
		else
			cerr << "Error2 in UnburyPlayerCorpse query: affected_rows NOT EQUAL to 1, as expected." << endl;
    }
	else
		cerr << "Error1 in UnburyPlayerCorpse query " << errbuf << endl;

	safe_delete_array(query);

	return Result;
}

Corpse* ZoneDatabase::LoadPlayerCorpse(int32 player_corpse_id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	Corpse* NewCorpse = 0;
	unsigned long* lengths;
	
	if (RunQuery(query, MakeAnyLenString(&query, "SELECT id, charid, charname, x, y, z, heading, data, timeofdeath, rezzed, WasAtGraveyard FROM player_corpses WHERE id='%u'", player_corpse_id), errbuf, &result)) {
		row = mysql_fetch_row(result);
		lengths = mysql_fetch_lengths(result);
		NewCorpse = Corpse::LoadFromDBData(atoi(row[0]), atoi(row[1]), row[2], (uchar*) row[7], lengths[7], atof(row[3]), atoi(row[4]), atoi(row[5]), atoi(row[6]), row[8],atoi(row[9])==1, atoi(row[10]));
		entity_list.AddCorpse(NewCorpse);
		mysql_free_result(result);
	}
	else {
		cerr << "Error in LoadPlayerCorpse query '" << query << "' " << errbuf << endl;
		cerr << "Note that if your missing the 'rezzed' field you can add it with:\nALTER TABLE `player_corpses` ADD `rezzed` TINYINT UNSIGNED DEFAULT \"0\";\n";
	}
	
	safe_delete_array(query);

	return NewCorpse;
}

bool ZoneDatabase::LoadPlayerCorpses(int32 iZoneID, int16 iInstanceID) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	int32 query_length = 0;
	
	unsigned long* lengths;

	if(!RuleB(Zone, EnableShadowrest))
		query_length = MakeAnyLenString(&query, "SELECT id, charid, charname, x, y, z, heading, data, timeofdeath, rezzed, WasAtGraveyard FROM player_corpses WHERE zoneid='%u' AND instanceid='%u'", iZoneID, iInstanceID);
	else
		query_length = MakeAnyLenString(&query, "SELECT id, charid, charname, x, y, z, heading, data, timeofdeath, rezzed, 0 FROM player_corpses WHERE zoneid='%u' AND instanceid='%u' AND IsBurried=0", iZoneID, iInstanceID);

	if (RunQuery(query, query_length, errbuf, &result)) {
		safe_delete_array(query);
		while ((row = mysql_fetch_row(result))) {
			lengths = mysql_fetch_lengths(result);
			entity_list.AddCorpse(Corpse::LoadFromDBData(atoi(row[0]), atoi(row[1]), row[2], (uchar*) row[7], lengths[7], atof(row[3]), atoi(row[4]), atoi(row[5]), atoi(row[6]), row[8],atoi(row[9])==1, atoi(row[10])));
		}
		mysql_free_result(result);
	}
	else {
		cerr << "Error in LoadPlayerCorpses query '" << query << "' " << errbuf << endl;
		cerr << "Note that if your missing the 'rezzed' field you can add it with:\nALTER TABLE `player_corpses` ADD `rezzed` TINYINT UNSIGNED DEFAULT \"0\";\n";
		safe_delete_array(query);
		return false;
	}
	
	return true;
}

int32 ZoneDatabase::GetFirstCorpseID(int32 char_id) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	int32 CorpseID = 0;
	
	MakeAnyLenString(&query, "SELECT id FROM player_corpses WHERE charid='%u' AND IsBurried=0 ORDER BY timeofdeath LIMIT 1", char_id);
		if (RunQuery(query, strlen(query), errbuf, &result)) {
			if (mysql_num_rows(result)!= 0){
				row = mysql_fetch_row(result);
				CorpseID = atoi(row[0]);
				mysql_free_result(result);
	}
		}
	else {
		cerr << "Error in GetFirstCorpseID query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return 0;
	}
	
	safe_delete_array(query);
	return CorpseID;
}

bool ZoneDatabase::BuryPlayerCorpse(int32 dbid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	
	if (!RunQuery(query, MakeAnyLenString(&query, "UPDATE player_corpses SET IsBurried = 1 WHERE id=%d", dbid), errbuf)) {
		cerr << "Error in BuryPlayerCorpse query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}
	
	safe_delete_array(query);
	return true;
}

bool ZoneDatabase::DeletePlayerCorpse(int32 dbid) {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
	
	if (!RunQuery(query, MakeAnyLenString(&query, "Delete from player_corpses where id=%d", dbid), errbuf)) {
		cerr << "Error in DeletePlayerCorpse query '" << query << "' " << errbuf << endl;
		safe_delete_array(query);
		return false;
	}
	
	safe_delete_array(query);
	return true;
}

// these functions operate with a material slot, which is from 0 to 8
int32 Corpse::GetEquipment(int8 material_slot) const {
	int invslot;
	
	if(material_slot > 8)
	{
		return 0;
	}

	invslot = Inventory::CalcSlotFromMaterial(material_slot);
	if(invslot == -1)
		return 0;

	return GetWornItem(invslot);
}

uint32 Corpse::GetEquipmentColor(int8 material_slot) const {
	const Item_Struct *item;

	if(material_slot > 8)
	{
		return 0;
	}

	item = database.GetItem(GetEquipment(material_slot));
	if(item != 0)
	{
		return item_tint[material_slot].rgb.use_tint ?
			item_tint[material_slot].color :
			item->Color;
	}

	return 0;
}

void Corpse::AddLooter(Mob* who)
{
	for (int i=0; i<MAX_LOOTERS; i++)
	{
		if (looters[i] == 0)
		{
			looters[i] = who->CastToClient()->CharacterID();
			break;
		}
	}
}

void Corpse::LoadPlayerCorpseDecayTime(int32 dbid){
	if(!dbid)
		return;
	char errbuf[MYSQL_ERRMSG_SIZE];
    char *query = 0;
    MYSQL_RES *result;
    MYSQL_ROW row;
	if (database.RunQuery(query, MakeAnyLenString(&query, "SELECT (UNIX_TIMESTAMP() - UNIX_TIMESTAMP(timeofdeath)) FROM player_corpses WHERE id=%d and not timeofdeath=0", dbid), errbuf, &result)) {
		safe_delete_array(query);
		while ((row = mysql_fetch_row(result))) {
			if(atoi(row[0]) > 0 && RuleI(Character, CorpseDecayTimeMS) > (atoi(row[0]) * 1000))
				corpse_decay_timer.SetTimer(RuleI(Character, CorpseDecayTimeMS) - (atoi(row[0]) * 1000));
			else
				corpse_decay_timer.SetTimer(300000);
		}
		mysql_free_result(result);
	}
	else
		safe_delete_array(query);
}

/*
void Corpse::CastRezz(int16 spellid, Mob* Caster){
	if(Rezzed()){
		if(Caster && Caster->IsClient())
			Caster->Message(13,"This character has already been resurrected.");
		return;
	}

	APPLAYER* outapp = new APPLAYER(OP_RezzRequest, sizeof(Resurrect_Struct));
	Resurrect_Struct* rezz = (Resurrect_Struct*) outapp->pBuffer;
	memcpy(rezz->your_name,this->orgname,30);
	memcpy(rezz->corpse_name,this->name,30);
	memcpy(rezz->rezzer_name,Caster->GetName(),30);
	memcpy(rezz->zone,zone->GetShortName(),15);
	rezz->spellid = spellid;
	rezz->x = this->x_pos;
	rezz->y = this->y_pos;
	rezz->z = (float)this->z_pos;
	worldserver.RezzPlayer(outapp, rezzexp, OP_RezzRequest);
	//DumpPacket(outapp);
	safe_delete(outapp);
}
*/

