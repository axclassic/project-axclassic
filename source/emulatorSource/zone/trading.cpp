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
// #include "../common/debug.h"
#include "masterentity.h"
#include "StringIDs.h"
#include "../common/MiscFunctions.h"
#include "../common/rulesys.h"

#ifdef EMBPERL
#include "embparser.h"
#endif

// The maximum amount of a single bazaar/barter transaction expressed in copper.
// Equivalent to 2 Million plat
#define MAX_TRANSACTION_VALUE 2000000000
// ##########################################
// Trade implementation
// ##########################################

Trade::Trade(Mob* in_owner)
{
	owner = in_owner;
	Reset();
}

Trade::~Trade()
{
	Reset();
}

void Trade::Reset()
{
	state = TradeNone;
	with_id = 0;
	pp=0; gp=0; sp=0; cp=0;
}

void Trade::SetTradeCash(uint32 in_pp, uint32 in_gp, uint32 in_sp, uint32 in_cp)
{
	pp=in_pp; gp=in_gp; sp=in_sp; cp=in_cp;
}

// Initiate a trade with another mob
// initiate_with specifies whether to start trade with other mob as well
void Trade::Start(uint32 mob_id, bool initiate_with)
{
	Reset();
	state = Trading;
	with_id = mob_id;
	
	// Autostart on other mob?
	if (initiate_with) {
		Mob* with = With();
		if (with)
			with->trade->Start(owner->GetID(), false);
	}
}

// Add item from a given slot to trade bucket (automatically does bag data too)
void Trade::AddEntity(int16 from_slot_id, int16 trade_slot_id)
{
	if (!owner || !owner->IsClient()) {
		// This should never happen
		LogFile->write(EQEMuLog::Debug, "Programming error: NPC's should not call Trade::AddEntity()");
		return;
	}
	
	// If one party accepted the trade then an item was added, their state needs to be reset
	owner->trade->state = Trading;
	Mob* with = With();
	if (with)
		with->trade->state = Trading;
	
	// Item always goes into trade bucket from cursor
	Client* client = owner->CastToClient();
	const ItemInst* inst = client->GetInv().GetItem(SLOT_CURSOR);
	if (!inst) {
		client->Message(13, "Error: Could not find item on your cursor!");
		return;
	}
	
	_log(TRADING__HOLDER, "%s added item '%s' to trade slot %i", owner->GetName(), inst->GetItem()->Name, trade_slot_id);
	
	ItemInst* inst2 = client->GetInv().GetItem(trade_slot_id);
	int new_charges = 0;
	if (!inst2 || !inst2->GetItem()) {
		// Send all item data to other client
		SendItemData(inst, trade_slot_id);
		// Move item on cursor to the trade slots
		client->PutItemInInventory(trade_slot_id, *inst);
	}
	else
	{
		if (client->GetInv().GetItem(SLOT_CURSOR)->GetID() != client->GetInv().GetItem(trade_slot_id)->GetID()) {
			client->Kick();
			return;
		}
		new_charges = (inst2->GetCharges()+inst->GetCharges());
		if (new_charges < inst2->GetItem()->StackSize)
		{
			inst2->SetCharges(new_charges);
			new_charges = 0;
		}
		else
		{
			new_charges = inst->GetCharges()-(inst2->GetItem()->StackSize-inst2->GetCharges()); //Leftover charges = charges - difference
			inst2->SetCharges(inst2->GetItem()->StackSize);
		}
		SendItemData(inst2, trade_slot_id);
	}
	if (new_charges > 0)
		client->GetInv().GetItem(from_slot_id)->SetCharges(new_charges);
	else
		client->DeleteItemInInventory(from_slot_id);//, (ItemInst&)trade_inst);
}

// Retrieve mob the owner is trading with
// Done like this in case 'with' mob goes LD and Mob* becomes invalid
Mob* Trade::With()
{
	return entity_list.GetMob(with_id);
}

// Private Method: Send item data for trade item to other person involved in trade
void Trade::SendItemData(const ItemInst* inst, sint16 dest_slot_id)
{
	// @merth: This needs to be redone with new item classes
	Mob* mob = With();
	if (!mob->IsClient())
		return; // Not sending packets to NPCs!
	
	Client* with = mob->CastToClient();
	Client* trader = owner->CastToClient();
	if (with && with->IsClient()) {
		with->SendItemPacket(dest_slot_id -IDX_TRADE,inst,ItemPacketTradeView);
		if (inst->GetItem()->ItemClass == 1) {
			for (int16 i=0; i<10; i++) {
				int16 bagslot_id = Inventory::CalcSlotId(dest_slot_id, i);
				const ItemInst* bagitem = trader->GetInv().GetItem(bagslot_id);
				if (bagitem) {
					with->SendItemPacket(bagslot_id-IDX_TRADE,bagitem,ItemPacketTradeView);
				}
			}
		}
		
		//safe_delete(outapp);
	}
}

// Audit trade: The part logged is what travels owner -> with
void Trade::LogTrade()
{
	Mob* with = With();
	if (!owner->IsClient() || !with)
		return; // Should never happen
	
	Client* trader = owner->CastToClient();
	bool logtrade = false;
	int admin_level = 0;
	uint8 item_count = 0;
	
	if (zone->tradevar != 0) {
		for (int16 i=3000; i<=3007; i++) {
			if (trader->GetInv().GetItem(i))
				item_count++;
		}
		
		if (((this->cp + this->sp + this->gp + this->pp)>0) || (item_count>0))
			admin_level = trader->Admin();
		else
			admin_level = 999;
		
		if (zone->tradevar == 7) {
			logtrade = true;
		}
		else if ((admin_level>=10) && (admin_level<20)) {
			if ((zone->tradevar<8) && (zone->tradevar>5))
				logtrade = true;
		}
		else if (admin_level<=20) {
			if ((zone->tradevar<8) && (zone->tradevar>4))
				logtrade = true;
		}
		else if (admin_level<=80) {
			if ((zone->tradevar<8) && (zone->tradevar>3))
				logtrade = true;
		}
		else if (admin_level<=100){
			if ((zone->tradevar<9) && (zone->tradevar>2))
				logtrade = true;
		}
		else if (admin_level<=150){
			if (((zone->tradevar<8) && (zone->tradevar>1)) || (zone->tradevar==9))
				logtrade = true;
		}
		else if (admin_level<=255){
			if ((zone->tradevar<8) && (zone->tradevar>0))
				logtrade = true;	
		}
	}
	
	if (logtrade == true) {
		char logtext[1000] = {0};
		uint32 cash = 0;
		bool comma = false;
		
		// Log items offered by owner
		cash = this->cp + this->sp + this->gp + this->pp;
		if ((cash>0) || (item_count>0)) {
			sprintf(logtext, "%s gave %s ", trader->GetName(), with->GetName());
			
			if (item_count > 0) {
				strcat(logtext, "items {");
				
				for (int16 i=3000; i<=3007; i++) {
					const ItemInst* inst = trader->GetInv().GetItem(i);
					
					if (!comma)
						comma = true;
					else {
						if (inst)
							strcat(logtext, ",");
					}
					
					if (inst) {
						char item_num[15] = {0};
						sprintf(item_num, "%i", inst->GetItem()->ID);
						strcat(logtext, item_num);
						
						if (inst->IsType(ItemClassContainer)) {
							for (uint8 j=0; j<10; j++) {
								inst = trader->GetInv().GetItem(i, j);
								if (inst) {
									strcat(logtext, ",");
									sprintf(item_num, "%i", inst->GetItem()->ID);
									strcat(logtext, item_num);
								}
							}
						}
					}
				}
			}
			
			if (cash > 0) {	
				char money[100] = {0};
				sprintf(money, " %ipp, %igp, %isp, %icp", trader->trade->pp, trader->trade->gp, trader->trade->sp, trader->trade->cp);
				strcat(logtext, money);
			}
			
			database.logevents(trader->AccountName(), trader->AccountID(),
				trader->Admin(), trader->GetName(), with->GetName(), "Trade", logtext, 6);
		}
	}
}

#if (EQDEBUG >= 9)
void Trade::DumpTrade()
{
	Mob* with = With();
	LogFile->write(EQEMuLog::Debug, "Dumping trade data: '%s' in TradeState %i with '%s'",
		this->owner->GetName(), state, ((with==NULL)?"(null)":with->GetName()));
	
	if (!owner->IsClient())
		return;
	
	Client* trader = owner->CastToClient();
	for (int16 i=3000; i<=3007; i++) {
		const ItemInst* inst = trader->GetInv().GetItem(i);
		
		if (inst) {
			LogFile->write(EQEMuLog::Debug, "Item %i (Charges=%i, Slot=%i, IsBag=%s)",
				inst->GetItem()->ID, inst->GetCharges(),
				i, ((inst->IsType(ItemClassContainer)) ? "True" : "False"));
			
			if (inst->IsType(ItemClassContainer)) {
				for (uint8 j=0; j<10; j++) {
					inst = trader->GetInv().GetItem(i, j);
					if (inst) {
						LogFile->write(EQEMuLog::Debug, "\tBagItem %i (Charges=%i, Slot=%i)",
							inst->GetItem()->ID, inst->GetCharges(),
							Inventory::CalcSlotId(i, j));
					}
				}
			}
		}
	}
	
	LogFile->write(EQEMuLog::Debug, "\tpp:%i, gp:%i, sp:%i, cp:%i", pp, gp, sp, cp);
}
#endif

void Client::ResetTrade() {
	const Item_Struct* TempItem = 0;
	ItemInst* ins;
	int x;
	AddMoneyToPP(trade->cp, trade->sp, trade->gp, trade->pp, true);
	for(x=3000; x <= 3007; x++)
	{
		TempItem = 0;
		ins = GetInv().GetItem(x);
		if (ins)
			TempItem = ins->GetItem();
		if (TempItem)
		{
			int freeslotid = GetInv().FindFreeSlot(ins->IsType(ItemClassContainer), true, TempItem->Size);
			if (freeslotid == SLOT_INVALID)
			{
				DropInst(ins);
			}
			else
			{
				PutItemInInventory(freeslotid, *ins);
				SendItemPacket(freeslotid, ins, ItemPacketTrade);
			}
			DeleteItemInInventory(x);
		}
	}
}

// Place items into inventory of NPC specified
void Client::FinishTrade(NPC* with) {
	int32 items[8]={0};
	int8 charges[8]={0};

#ifdef EQBOTS
	bool botCanWear[8] = {0};
	bool BotCanWear = false;
	for(sint16 i=3000; i<=3007; i++) {
		BotCanWear = false;
		botCanWear[i-3000] = BotCanWear;

		const ItemInst* inst = m_inv[i];
		if (inst) {
			items[i-3000]=inst->GetItem()->ID;
			charges[i-3000]=inst->GetCharges();
		}
		//EQoffline: will give the items to the bots and change the bot stats
		// If you are trading an item and you are trading with a bot and the bot is not fightingand the bot belongs to you
		if(inst && with->IsBot() && !with->IsEngaged() && (with->BotOwner == this->CastToMob())) {
			std::string TempErrorMessage;
			const Item_Struct* mWeaponItem = inst->GetItem();
			bool failedLoreCheck = false;
			// Check the traded item for Lore augments and items that the bot already is using.
			for(int m=0; m<MAX_AUGMENT_SLOTS; ++m) {
				ItemInst *itm = inst->GetAugment(m);
				if(itm)
				{
					if(with->CheckLoreConflict(itm->GetItem())) {
						failedLoreCheck = true;
					}
				}
			}
			if(with->CheckLoreConflict(mWeaponItem)) {
				failedLoreCheck = true;
			}
			if(failedLoreCheck) {
				Message_StringID(0, DUP_LORE);
				with->BotSay("This is LORE , and I already have one!");
			}
			// If we have a tradeable item, the bot race/class/level can equip it and there are no Lore augment/item conflicts
			if(!failedLoreCheck && mWeaponItem && inst->IsEquipable(with->GetBaseRace(), with->GetClass()) && (with->GetLevel() >= mWeaponItem->ReqLevel)) { // Angelox
				BotCanWear = true;
                botCanWear[i-3000] = BotCanWear;
				ItemInst* swap_item = NULL;
				bool success = false;
				int how_many_slots = 0;
				int hasLock1 = 0; //Range item first
				int lock1ID = 0; 
				hasLock1 =  (database.GetBotOwner(with->GetNPCTypeID()));
				lock1ID = (database.BotLock1Lookup(hasLock1));
				/* TODO Disabled for now, can't get it to work 
				int lock2ID = 0; //Secondary item first				
				int hasLock2 = 0;
				hasLock2 =  (database.GetBotOwner(with->GetNPCTypeID()));
				lock2ID = (database.BotLock2Lookup(hasLock2));
				*/
				const char* equipped[22] = {"Charm", "Left Ear", "Head", "Face", "Right Ear", "Neck", "Shoulders", "Arms", "Back",
											"Left Wrist", "Right Wrist", "Range", "Hands", "Primary Hand", "Secondary Hand",
											"Left Finger", "Right Finger", "Chest", "Legs", "Feet", "Waist", "Ammo" };
			      if (lock1ID < 1)
			        with->BotSay("I have the command '#bot set primary' for use of range items in primary slot.");
				// This first for loop only deals with putting items into empty slots.
				// It checks and removes items from the secondary slot if the item going into the primary slot is a 2 hander
				// It checks and removes 2 handers from the primary slot if the item goes into the secondary slot
				// It checks if the bot can dual wield when the item is a weapon and is going into the secondary slot
				// It sets success=true if the item will fit into an empty slot
				// It counts how many slots the item will fit into if it fits in more than one slot and the first slots are not empty
				for(int j=0; j<22; ++j) {
					if((mWeaponItem->Slots & (1 << j))) {
						how_many_slots++;
						if(!with->GetBotItem(with, j)) {
							if(j == SLOT_PRIMARY) {
								if((mWeaponItem->ItemType == ItemType2HS) || (mWeaponItem->ItemType == ItemType2HB) || (mWeaponItem->ItemType == ItemType2HPierce)) {
									if(with->GetBotItem(with, SLOT_SECONDARY)) {
										ItemInst* remove_item = with->GetBotItem(with, SLOT_SECONDARY);
										BotTradeSwapItem(with, SLOT_SECONDARY, 0, remove_item, remove_item->GetItem()->Slots, &TempErrorMessage, false);
									}
								}
								BotTradeAddItem(inst, inst->GetCharges(), mWeaponItem->Slots, j, &TempErrorMessage, with);
								success = true;
								break;
							}
							else if(j == SLOT_SECONDARY) {
								if(inst->IsWeapon()) {
									if(with->CanThisClassDualWield()) {
										BotTradeAddItem(inst, inst->GetCharges(), mWeaponItem->Slots, j, &TempErrorMessage, with);
										success = true;
									}
									else {
										with->BotSay("I can't Dual Wield yet.");
										--how_many_slots;
									}
								}
								else {
									BotTradeAddItem(inst, inst->GetCharges(), mWeaponItem->Slots, j, &TempErrorMessage, with);
									success = true;
								}
								if(success) {
									if(with->GetBotItem(with, SLOT_PRIMARY)) {
										ItemInst* remove_item = GetBotItem(with, SLOT_PRIMARY);
										if((remove_item->GetItem()->ItemType == ItemType2HS) || (remove_item->GetItem()->ItemType == ItemType2HB) || (remove_item->GetItem()->ItemType == ItemType2HPierce)) {
											BotTradeSwapItem(with, SLOT_PRIMARY, 0, remove_item, remove_item->GetItem()->Slots, &TempErrorMessage, false);
										}
									}
									break;
								}
							}
							else if (lock1ID < 2){
								BotTradeAddItem(inst, inst->GetCharges(), mWeaponItem->Slots, j, &TempErrorMessage, with);
								success = true;
								break;
							}
						}
					}
				   database.UpdateBotLock1(1,hasLock1);
				}
				// This second loop is used if there was no empty slot available for the trade item; success=false.
				// Force the trade item into the first slot it can fit into and remove the item already there if the client doesn't have a lore augment/item conflict.
				// If the trade item is forced into the PRIMARY slot, check if the trade item is a 2 hander and remove any item in the SECONDARY slot.
				// If the trade item is forced into the SECONDARY slot, check for dual wield and check and remove if the PRIMARY slot is a 2 hander.
				// Set success=true if traded item is equiped
				if(!success) {
					for(int j=0; j<22; ++j) {
						if((mWeaponItem->Slots & (1 << j))) {
							swap_item = with->GetBotItem(with, j);
							failedLoreCheck = false;
							for(int k=0; k<MAX_AUGMENT_SLOTS; ++k) {
								ItemInst *itm = swap_item->GetAugment(k);
								if(itm)
								{
									if(CheckLoreConflict(itm->GetItem())) {
										failedLoreCheck = true;
									}
								}
							}
							if(CheckLoreConflict(swap_item->GetItem())) {
								failedLoreCheck = true;
							}
							if(!failedLoreCheck) {
								if(j == SLOT_PRIMARY) {
									if((mWeaponItem->ItemType == ItemType2HS) || (mWeaponItem->ItemType == ItemType2HB) || (mWeaponItem->ItemType == ItemType2HPierce)) {
										if(with->GetBotItem(with, SLOT_SECONDARY)) {
											ItemInst* remove_item = with->GetBotItem(with, SLOT_SECONDARY);
											BotTradeSwapItem(with, SLOT_SECONDARY, 0, remove_item, remove_item->GetItem()->Slots, &TempErrorMessage, false);
										}
									}
									BotTradeSwapItem(with, SLOT_PRIMARY, inst, swap_item, mWeaponItem->Slots, &TempErrorMessage);
									success = true;
									break;
								}
								else if(j == SLOT_SECONDARY) {
									if(inst->IsWeapon()) {
										if(with->CanThisClassDualWield()) {
											BotTradeSwapItem(with, SLOT_SECONDARY, inst, swap_item, mWeaponItem->Slots, &TempErrorMessage);
											success = true;
										}
										else {
											botCanWear[i-3000] = false;
											with->BotSay("I can't Dual Wield yet.");
										}
									}
									else {
										BotTradeSwapItem(with, SLOT_SECONDARY, inst, swap_item, mWeaponItem->Slots, &TempErrorMessage);
										success = true;
									}
									if(success && with->GetBotItem(with, SLOT_PRIMARY)) {
										ItemInst* remove_item = with->GetBotItem(with, SLOT_PRIMARY);
										if((remove_item->GetItem()->ItemType == ItemType2HS) || (remove_item->GetItem()->ItemType == ItemType2HB) || (remove_item->GetItem()->ItemType == ItemType2HPierce)) {
											BotTradeSwapItem(with, SLOT_PRIMARY, 0, remove_item, remove_item->GetItem()->Slots, &TempErrorMessage, false);
										}
									}
									break;
								}
								else {
									BotTradeSwapItem(with, j, inst, swap_item, mWeaponItem->Slots, &TempErrorMessage);
									success = true;
									break;
								}
							}
							else {
								botCanWear[i-3000] = false;
								Message_StringID(0, PICK_LORE);
								with->BotSay("I'm trying to return a LORE item you already have.");
								break;
							}
						}
					}
				}
				if(success) {
					if(how_many_slots > 1) {
						Message(300, "If you want this item in a different slot, use #bot inventory remove <slot_id> to clear the spot.");
					}
					with->CalcBotStats();
				}
			}
		}
		if(inst) {
			if(with->IsBot() && !botCanWear[i-3000]) {
				PushItemOnCursor(*inst, true);
			}
			DeleteItemInInventory(i);
		}
	}
	if(!with->IsBot()) { // START This is so Bots don't trigger the EVENT_ITEM

#else //EQBOTS

    for (sint16 i=3000; i<=3003; i++) {
        const ItemInst* inst = m_inv[i];
        if (inst) {
            items[i-3000]=inst->GetItem()->ID;
            charges[i-3000]=inst->GetCharges();
            DeleteItemInInventory(i);
        }
    }

#endif //EQBOTS

	//dont bother with this crap unless we have a quest...
	//pets can have quests! (especially charmed NPCs)
	bool did_quest = false;
#ifdef EMBPERL
	if(((PerlembParser *)parse)->HasQuestSub(with->GetNPCTypeID(), "EVENT_ITEM")) {
#else
	if(parse->HasQuestFile(with->GetNPCTypeID())) {
#endif
		char temp1[100];
		memset(temp1,0x0,100);
		char temp2[100];
		memset(temp2,0x0,100);
		for ( int z=0; z < 4; z++ ) {
			snprintf(temp1, 100, "item%d.%d", z+1,with->GetNPCTypeID());
			snprintf(temp2, 100, "%d",items[z]);
			parse->AddVar(temp1,temp2);
//			memset(temp1,0x0,100);
//			memset(temp2,0x0,100);
			snprintf(temp1, 100, "item%d.charges.%d", z+1,with->GetNPCTypeID());
			snprintf(temp2, 100, "%d",charges[z]);
			parse->AddVar(temp1,temp2);
//			memset(temp1,0x0,100);
//			memset(temp2,0x0,100);
		}
		snprintf(temp1, 100, "copper.%d",with->GetNPCTypeID());
		snprintf(temp2, 100, "%i",trade->cp);
		parse->AddVar(temp1,temp2);
//		memset(temp1,0x0,100);
//		memset(temp2,0x0,100);
		snprintf(temp1, 100, "silver.%d",with->GetNPCTypeID());
		snprintf(temp2, 100, "%i",trade->sp);
		parse->AddVar(temp1,temp2);
//		memset(temp1,0x0,100);
//		memset(temp2,0x0,100);
		snprintf(temp1, 100, "gold.%d",with->GetNPCTypeID());
		snprintf(temp2, 100, "%i",trade->gp);
		parse->AddVar(temp1,temp2);
//		memset(temp1,0x0,100);
//		memset(temp2,0x0,100);
		snprintf(temp1, 100, "platinum.%d",with->GetNPCTypeID());
		snprintf(temp2, 100, "%i",trade->pp);
		parse->AddVar(temp1,temp2);
//		memset(temp1,0x0,100);
//		memset(temp2,0x0,100);
		parse->Event(EVENT_ITEM, with->GetNPCTypeID(), NULL, with, this);
		did_quest = true;
	}
	if(RuleB(TaskSystem, EnableTaskSystem)) {
		int Cash = trade->cp + (trade->sp * 10) + (trade->gp * 100) + (trade->pp * 1000);
		if(UpdateTasksOnDeliver(items, Cash, with->GetNPCTypeID())) {
			if(!with->IsMoving()) 
				with->FaceTarget(this);
		}
	}
//		Message(0, "Normal NPC: keeping items.");
		
	//else, we do not have a quest, give the items to the NPC
	if(did_quest) {
		//only continue if we are a charmed NPC
		if(!with->HasOwner() || ((with->GetPetType() != petCharmed) && (with->GetPetType() != petOther)))
			return;
	}

#ifdef EQBOTS

	} // END This is so Bots don't trigger the EVENT_ITEM

#endif //EQBOTS
		
	int xy = with->CountLoot();
	
	for(int y=0; y < 8; y++) {

#ifdef EQBOTS

		if(with->IsBot()) { // The xy++ below doesn't work for bot trading.
			if(xy >= 23) {
				break;
			}
			xy--;
		}
		else

#endif //EQBOTS

		if (xy >= 20)
			break;
		xy++;
		//NPC* npc=with->CastToNPC();
		const Item_Struct* item2 = database.GetItem(items[y]);
		if (item2) {

#ifdef EQBOTS

			//if was not no drop item, let the NPC have it
			if((GetGM() && !with->IsBot()) || ((item2->NoDrop != 0) && !with->IsBot()))
				with->AddLootDrop(item2, &with->itemlist, charges[y], true, true);
			// franck-add: you can give nodrop items to bots
			else if(with->IsBot() && botCanWear[y]) {
				with->BotSay("Thank you for the %s, %s.", item2->Name,  this->GetName());
			}
			else if(with->IsBot() && !botCanWear[y]) {
				with->BotSay("I can't use this %s!", item2->Name);
			}

#else //EQBOTS

            //if was not no drop item, let the NPC have it
			if(GetGM() || item2->NoDrop != 0)
				with->AddLootDrop(item2, &with->itemlist, charges[y], true, true);
			//else 
			//	with->AddLootDrop(item2, NULL, charges[y], false, true);

#endif //EQBOTS

		}
	}
}

#ifdef EQBOTS

void Client::BotTradeSwapItem(NPC* bot, sint16 lootSlot, const ItemInst* inst, const ItemInst* inst_swap, uint32 equipableSlots, std::string* errorMessage, bool swap) {
	std::string TempErrorMessage;
	PushItemOnCursor(*inst_swap, true);
	database.RemoveBotItemBySlot(bot->GetNPCTypeID(), lootSlot, &TempErrorMessage);
	bot->GetBotInv().DeleteItem(lootSlot);
	int8 materialFromSlot = Inventory::CalcMaterialFromSlot(lootSlot);
	if(materialFromSlot != 0xFF) {
		bot->BotRemoveEquipItem(materialFromSlot);
		bot->SendWearChange(materialFromSlot);
	}
	if(swap) {
		BotTradeAddItem(inst, inst->GetCharges(), equipableSlots, lootSlot, &TempErrorMessage, bot);
	}
}
void Client::BotTradeAddItem(const ItemInst* inst, sint16 charges, uint32 equipableSlots, int16 lootSlot, std::string* errorMessage, NPC* bot, bool addToDb) {
	if(addToDb) {
		database.SetBotItemInSlot(bot->GetNPCTypeID(), lootSlot, inst->GetID(), inst, errorMessage);
		if(!errorMessage->empty())
			return;
		bot->GetBotInv().PutItem(lootSlot, *inst);
	}

	int8 materialFromSlot = Inventory::CalcMaterialFromSlot(lootSlot);
	if(materialFromSlot != 0xFF) {
		bot->BotAddEquipItem(materialFromSlot, inst->GetID());
		bot->SendWearChange(materialFromSlot);
	}
}

#endif //EQBOTS

void Client::FinishTrade(Client* other)
{
	sint16 slot_id;
	if (!other)
		return;

	mlog(TRADING__CLIENT, "Finishing trade with client %s", other->GetName());
	
	// Move each trade slot into free inventory slot
	for (sint16 i=3000; i<=3007; i++){
		const ItemInst* inst = m_inv[i];
		if(inst == NULL)
			continue;

		mlog(TRADING__CLIENT, "Giving %s (%d) in slot %d to %s", inst->GetItem()->Name, inst->GetItem()->ID, i, other->GetName());
		
		if (inst->GetItem()->NoDrop != 0 || other == this) {
			slot_id = other->GetInv().FindFreeSlot(inst->IsType(ItemClassContainer), true, inst->GetItem()->Size);

			mlog(TRADING__CLIENT, "Trying to put %s (%d) into slot %d", inst->GetItem()->Name, inst->GetItem()->ID, slot_id);
			if (other->PutItemInInventory(slot_id, *inst, true)) {
				mlog(TRADING__CLIENT, "Item  %s (%d) successfully transfered, deleting from trade slot.", inst->GetItem()->Name, inst->GetItem()->ID);
			} else {
				PushItemOnCursor(*inst, true);
				mlog(TRADING__ERROR, "Unable to give item %d (%d) to %s, returning to giver.", inst->GetItem()->Name, inst->GetItem()->ID, other->GetName());
			}
			DeleteItemInInventory(i);
		} else {
			PushItemOnCursor(*inst, true);
			DeleteItemInInventory(i);
		}
	}
	
	// Money @merth: look into how NPC's receive cash
	this->AddMoneyToPP(other->trade->cp, other->trade->sp, other->trade->gp, other->trade->pp, true);
	
	//Do not reset the trade here, done by the caller.
}

bool Client::CheckTradeLoreConflict(Client* other)
{
	if (!other)
		return true;
	// Move each trade slot into free inventory slot
	for (sint16 i=3000; i<=3007; i++){
		const ItemInst* inst = m_inv[i];

		if (inst && inst->GetItem()) {
			if (other->CheckLoreConflict(inst->GetItem()))
				return true;
		}
	}
	return false;
}

void Client::Trader_ShowItems(){
	EQApplicationPacket* outapp= new EQApplicationPacket(OP_Trader, sizeof(Trader_Struct));

	Trader_Struct* outints = (Trader_Struct*)outapp->pBuffer;
	Trader_Struct* TraderItems = database.LoadTraderItem(this->CharacterID());

	for(int i = 0; i < 80; i++){
		outints->ItemCost[i] = TraderItems->ItemCost[i];
		outints->Items[i] = TraderItems->Items[i];
	}
	outints->Code = BazaarTrader_ShowItems;

	QueuePacket(outapp);
	_pkt(TRADING__PACKETS, outapp);
	safe_delete(outapp);
	safe_delete(TraderItems);
}

void Client::SendTraderPacket(Client* Trader) {

	EQApplicationPacket* outapp= new EQApplicationPacket(OP_BecomeTrader, sizeof(BecomeTrader_Struct));

	BecomeTrader_Struct* bts = (BecomeTrader_Struct*)outapp->pBuffer;

	bts->Code = BazaarTrader_StartTraderMode;

	bts->ID = Trader->GetID();

	QueuePacket(outapp);

	_pkt(TRADING__PACKETS, outapp);

	safe_delete(outapp);
}

void Client::Trader_CustomerBrowsing(Client *Customer) {

	EQApplicationPacket* outapp= new EQApplicationPacket(OP_Trader, sizeof(Trader_ShowItems_Struct));

	Trader_ShowItems_Struct* sis = (Trader_ShowItems_Struct*)outapp->pBuffer;

	sis->Code = BazaarTrader_CustomerBrowsing;

	sis->TraderID = Customer->GetID();

	QueuePacket(outapp);
}


void Client::Trader_StartTrader() {

	Trader=true;

	EQApplicationPacket* outapp= new EQApplicationPacket(OP_Trader, sizeof(Trader_ShowItems_Struct));

	Trader_ShowItems_Struct* sis = (Trader_ShowItems_Struct*)outapp->pBuffer;

	sis->Code = BazaarTrader_StartTraderMode;

	sis->TraderID = this->GetID();

	QueuePacket(outapp);

	_pkt(TRADING__PACKETS, outapp);

	safe_delete(outapp);

	// Notify other clients we are now in trader mode
	//
	outapp= new EQApplicationPacket(OP_BecomeTrader, sizeof(BecomeTrader_Struct));

	BecomeTrader_Struct* bts = (BecomeTrader_Struct*)outapp->pBuffer;

	bts->Code = 1;

	bts->ID = this->GetID();

	entity_list.QueueClients(this, outapp, false);

	_pkt(TRADING__PACKETS, outapp);

	safe_delete(outapp);
}

void Client::Trader_EndTrader() {

	// If someone is looking at our wares, remove all the items from the window.
	//
	if(CustomerID) {
		Client* Customer = entity_list.GetClientByID(CustomerID);
		GetItems_Struct* gis=GetTraderItems();

		if(Customer && gis) {
			EQApplicationPacket* outapp = new EQApplicationPacket(OP_TraderDelItem,sizeof(TraderDelItem_Struct));
			TraderDelItem_Struct* tdis = (TraderDelItem_Struct*)outapp->pBuffer;

			tdis->Unknown000 = 0;
			tdis->TraderID = Customer->GetID();
			tdis->Unknown012 = 0;
			Customer->Message(13, "The Trader is no longer open for business");

			for(int i = 0; i < 80; i++) {
				if(gis->Items[i] != 0) {

					tdis->ItemID = gis->SerialNumber[i];

					Customer->QueuePacket(outapp);
				}
			}

			safe_delete(outapp);
			safe_delete(gis);
		}
	}

	database.DeleteTraderItem(this->CharacterID());

	// Notify other clients we are no longer in trader mode.
	//
	EQApplicationPacket* outapp= new EQApplicationPacket(OP_BecomeTrader, sizeof(BecomeTrader_Struct));

	BecomeTrader_Struct* bts = (BecomeTrader_Struct*)outapp->pBuffer;

	bts->Code = 0;

	bts->ID = this->GetID();

	entity_list.QueueClients(this, outapp, false);

	_pkt(TRADING__PACKETS, outapp);

	safe_delete(outapp);

	outapp= new EQApplicationPacket(OP_Trader, sizeof(Trader_ShowItems_Struct));

	Trader_ShowItems_Struct* sis = (Trader_ShowItems_Struct*)outapp->pBuffer;

	sis->Code = BazaarTrader_EndTraderMode;

	sis->TraderID = BazaarTrader_EndTraderMode;

	QueuePacket(outapp);

	_pkt(TRADING__PACKETS, outapp);

	safe_delete(outapp);

	WithCustomer(0);

	this->Trader = false;
}

void Client::SendTraderItem(int32 ItemID, int16 Quantity) {

	string Packet;
	sint16 FreeSlotID=0;

	const Item_Struct* item = database.GetItem(ItemID);

	if(!item){
		_log(TRADING__CLIENT, "Bogus item deleted in Client::SendTraderItem!\n");
		return;
	}
	
	ItemInst* inst = database.CreateItem(item, Quantity);

	if (inst) {
		FreeSlotID = m_inv.FindFreeSlot(false, true, inst->GetItem()->Size);

		PutItemInInventory(FreeSlotID, *inst);
		Save();
		
		SendItemPacket(FreeSlotID, inst, ItemPacketTrade);

		safe_delete(inst);
	}
}

void Client::SendSingleTraderItem(int32 CharID, int SerialNumber) {

	ItemInst* inst= database.LoadSingleTraderItem(CharID, SerialNumber);
	if(inst) {
		SendItemPacket(30, inst, ItemPacketMerchant);
		safe_delete(inst);
	}

}

void Client::BulkSendTraderInventory(int32 char_id) {
	const Item_Struct *item;

	TraderCharges_Struct* TraderItems = database.LoadTraderItemWithCharges(char_id);

	for (int8 i = 0;i < 80; i++) {
		if((TraderItems->ItemID[i] == 0) || (TraderItems->ItemCost[i] <= 0)) {
			continue;
		}
		else
			item=database.GetItem(TraderItems->ItemID[i]);
		
		if (item && (item->NoDrop!=0)) {
			ItemInst* inst = database.CreateItem(item);
			if (inst) {
				inst->SetSerialNumber(TraderItems->SerialNumber[i]);
				if(TraderItems->Charges[i] > 0)
					inst->SetCharges(TraderItems->Charges[i]);

				if(inst->IsStackable()) {
					inst->SetMerchantCount(TraderItems->Charges[i]);
					inst->SetMerchantSlot(TraderItems->SerialNumber[i]);
				}

				inst->SetPrice(TraderItems->ItemCost[i]);
				SendItemPacket(30, inst, ItemPacketMerchant);
				safe_delete(inst);
			}
			else
				_log(TRADING__CLIENT, "Client::BulkSendTraderInventory NULL inst pointer");
		}
		else
			_log(TRADING__CLIENT, "Client::BulkSendTraderInventory NULL item pointer or item is NODROP %8X",item);
	}
	safe_delete(TraderItems);
}

ItemInst* Client::FindTraderItemBySerialNumber(sint32 SerialNumber){

	ItemInst* item = NULL;
	int16 SlotID = 0;
	for(int i = 0; i < 8;i++){
		item = this->GetInv().GetItem(22 + i);
		if(item && item->GetItem()->ID == 17899){ //Traders Satchel
			for(int x = 0; x < 10; x++){
				SlotID = (((22 + i + 3) * 10) + x + 1);
				item = this->GetInv().GetItem(SlotID);
				if(item) {
					if(item->GetSerialNumber() == SerialNumber) 
						return item;
				}
			}
		}
	}
	_log(TRADING__CLIENT, "Client::FindTraderItemBySerialNumber Couldn't find item! Serial No. was %i", SerialNumber);

	return NULL;
}


GetItems_Struct* Client::GetTraderItems(){

	const ItemInst* item = NULL;
	int16 SlotID = 0;

	GetItems_Struct* gis= new GetItems_Struct;

	memset(gis,0,sizeof(GetItems_Struct));

	int8 ndx = 0;

	for(int i = 0; i < 8; i++){
		item = this->GetInv().GetItem(22 + i);
		if(item && item->GetItem()->ID == 17899){ //Traders Satchel
			for(int x = 0; x < 10; x++){
				SlotID = (((22 + i +3 ) *10) + x + 1);

				item = this->GetInv().GetItem(SlotID);

				if(item){
					gis->Items[ndx] = item->GetItem()->ID;
					gis->SerialNumber[ndx] = item->GetSerialNumber();
					gis->Charges[ndx] = item->GetCharges();
					ndx++;
				}
			}
		}
	}
	return gis;
}

int16 Client::FindTraderItem(sint32 SerialNumber, int16 Quantity){

	const ItemInst* item= NULL;
	int16 SlotID = 0;
	for(int i = 0; i < 8;i++){
		item = this->GetInv().GetItem(22+i);
		if(item && item->GetItem()->ID == 17899){ //Traders Satchel
			for(int x = 0; x < 10; x++){
				SlotID= (((22 + i + 3) * 10) + x + 1);

				item = this->GetInv().GetItem(SlotID);

				if(item && item->GetSerialNumber() == SerialNumber && 
				   (item->GetCharges() >= Quantity || (item->GetCharges() <= 0 && Quantity == 1))){

					return SlotID;
				}
			}
		}
	}
	_log(TRADING__CLIENT, "Could NOT find a match for Item: %i with a quantity of: %i on Trader: %s\n", 
			      SerialNumber , Quantity, this->GetName());

	return 0;
}

void Client::NukeTraderItem(int16 Slot,sint16 Charges,int16 Quantity,Client* Customer,int16 TraderSlot, int SerialNumber) {

	if(!Customer) return;
	_log(TRADING__CLIENT, "NukeTraderItem(Slot %i, Charges %i, Quantity %i", Slot, Charges, Quantity);
	if(Quantity < Charges) {
		Customer->SendSingleTraderItem(this->CharacterID(), SerialNumber);
		m_inv.DeleteItem(Slot, Quantity);
	}
	else {
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_TraderDelItem,sizeof(TraderDelItem_Struct));
		TraderDelItem_Struct* tdis = (TraderDelItem_Struct*)outapp->pBuffer;

		tdis->Unknown000 = 0;
		tdis->TraderID = Customer->GetID();
		tdis->ItemID = SerialNumber;
		tdis->Unknown012 = 0;

		_pkt(TRADING__PACKETS, outapp);

		Customer->QueuePacket(outapp);
		safe_delete(outapp);

		m_inv.DeleteItem(Slot);

	}
	// This updates the trader. Removes it from his trading bags.
	//
	const ItemInst* Inst = m_inv[Slot];

	database.SaveInventory(CharacterID(), Inst, Slot);

	EQApplicationPacket* outapp2;

	if(Quantity < Charges)
		outapp2 = new EQApplicationPacket(OP_DeleteItem,sizeof(MoveItem_Struct));
	else
		outapp2 = new EQApplicationPacket(OP_MoveItem,sizeof(MoveItem_Struct));

	MoveItem_Struct* mis = (MoveItem_Struct*)outapp2->pBuffer;
	mis->from_slot = Slot;
	mis->to_slot = 0xFFFFFFFF;
	mis->number_in_stack = 0xFFFFFFFF;

	if(Quantity >= Charges)
		Quantity = 1;

	for(int i = 0; i < Quantity; i++) {
		_pkt(TRADING__PACKETS, outapp2);

		this->QueuePacket(outapp2);
	}
	safe_delete(outapp2);

}
void Client::TraderUpdate(int16 SlotID,int32 TraderID){
	// This method is no longer used.

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_TraderItemUpdate,sizeof(TraderItemUpdate_Struct));
	TraderItemUpdate_Struct* tus=(TraderItemUpdate_Struct*)outapp->pBuffer;
	tus->Charges = 0xFFFF;
	tus->FromSlot = SlotID;
	tus->ToSlot = 0xFF;
	tus->TraderID = TraderID;
	tus->Unknown000 = 0;
	QueuePacket(outapp);
	safe_delete(outapp);
}

void Client::FindAndNukeTraderItem(sint32 SerialNumber, int16 Quantity, Client* Customer, int16 TraderSlot){

	const ItemInst* item= NULL;
	bool Stackable = false;
	sint16 Charges=0;

	int16 SlotID = FindTraderItem(SerialNumber, Quantity);
	if(SlotID > 0){

		item = this->GetInv().GetItem(SlotID);

		if(item) {
			Charges = this->GetInv().GetItem(SlotID)->GetCharges();

			Stackable = item->IsStackable();

			if(!Stackable) 
				Quantity = (Charges > 0) ? Charges : 1;

		}
		_log(TRADING__CLIENT, "FindAndNuke %s, Charges %i, Quantity %i", item->GetItem()->Name, Charges, Quantity);
		if(item && (Charges <= Quantity || (Charges <= 0 && Quantity==1) || !Stackable)){
			this->DeleteItemInInventory(SlotID, Quantity);

			TraderCharges_Struct* GetSlot = database.LoadTraderItemWithCharges(this->CharacterID());

			int8 Count = 0;

			bool TestSlot = true;

			for(int y = 0;y < 80;y++){

				if(TestSlot && GetSlot->SerialNumber[y] == SerialNumber){

					database.DeleteTraderItem(this->CharacterID(),y);
					NukeTraderItem(SlotID, Charges, Quantity, Customer, TraderSlot, GetSlot->SerialNumber[y]);
					TestSlot=false;
				}
				else if(GetSlot->ItemID[y] > 0)
					Count++;
			}
			if(Count == 0) 
				Trader_EndTrader();

			return;
		}
		else if(item) {
			database.UpdateTraderItemCharges(this->CharacterID(), item->GetSerialNumber(), Charges-Quantity);

			NukeTraderItem(SlotID, Charges, Quantity, Customer, TraderSlot, item->GetSerialNumber());

			return;

		}
	}
	_log(TRADING__CLIENT, "Could NOT find a match for Item: %i with a quantity of: %i on Trader: %s\n",SerialNumber, 
			      Quantity,this->GetName());
}

void Client::ReturnTraderReq(const EQApplicationPacket* app, sint16 TraderItemCharges){

	TraderBuy_Struct* tbs = (TraderBuy_Struct*)app->pBuffer;

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_TraderBuy, sizeof(TraderBuy_Struct));

	TraderBuy_Struct* outtbs  = (TraderBuy_Struct*)outapp->pBuffer;

	memcpy(outtbs, tbs, app->size);

	outtbs->Price = (tbs->Price * static_cast<int32>(TraderItemCharges));

	outtbs->Quantity = TraderItemCharges;

	outtbs->TraderID = this->GetID();

	outtbs->AlreadySold = 0;

	QueuePacket(outapp);

	safe_delete(outapp);
}

void Client::TradeRequestFailed(const EQApplicationPacket* app) {

	TraderBuy_Struct* tbs = (TraderBuy_Struct*)app->pBuffer;

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_TraderBuy, sizeof(TraderBuy_Struct));

	TraderBuy_Struct* outtbs = (TraderBuy_Struct*)outapp->pBuffer;

	memcpy(outtbs, tbs, app->size);

	outtbs->AlreadySold = 0xFFFFFFFF;

	outtbs->TraderID = 0xFFFFFFFF;;

	QueuePacket(outapp);

	safe_delete(outapp);
}


static void BazaarAuditTrail(const char *Seller, const char *Buyer, const char *ItemName, int Quantity, int TotalCost, int TranType) {

	const char *AuditQuery="INSERT INTO `trader_audit` (`time`, `seller`, `buyer`, `itemname`, `quantity`, `totalcost`, `trantype`) "
			  "VALUES (NOW(), '%s', '%s', '%s', %i, %i, %i)";

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;

	if(!database.RunQuery(query, MakeAnyLenString(&query, AuditQuery, Seller, Buyer, ItemName, Quantity, TotalCost, TranType), errbuf))
		_log(TRADING__CLIENT, "Audit write error: %s : %s", query, errbuf);

	safe_delete_array(query);
}



void Client::BuyTraderItem(TraderBuy_Struct* tbs,Client* Trader,const EQApplicationPacket* app){

	if(!Trader) return;

	if(!Trader->IsTrader()) {
		TradeRequestFailed(app);
		return;
	}

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_Trader,sizeof(TraderBuy_Struct));

	TraderBuy_Struct* outtbs  = (TraderBuy_Struct*)outapp->pBuffer;

	outtbs->ItemID = tbs->ItemID;

	const ItemInst* BuyItem = Trader->FindTraderItemBySerialNumber(tbs->ItemID);

	if(!BuyItem) {
		_log(TRADING__CLIENT, "Unable to find item on trader.");
		TradeRequestFailed(app);	
		safe_delete(outapp);
		return;
	}

	_log(TRADING__CLIENT, "Buyitem: Name: %s, IsStackable: %i, Requested Quantity: %i, Charges on Item %i",
			      BuyItem->GetItem()->Name, BuyItem->IsStackable(), tbs->Quantity, BuyItem->GetCharges());
	// If the item is not stackable, then we can only be buying one of them.
	if(!BuyItem->IsStackable()) 
		 outtbs->Quantity = tbs->Quantity;
	else {
		// Stackable items, arrows, diamonds, etc
		int ItemCharges = BuyItem->GetCharges();
		// ItemCharges for stackables should not be <= 0
		if(ItemCharges <= 0)
			outtbs->Quantity = 1;
		// If the purchaser requested more than is in the stack, just sell them how many are actually in the stack.
		else if(ItemCharges < (sint16)tbs->Quantity)
			outtbs->Quantity = ItemCharges;
		else
			outtbs->Quantity = tbs->Quantity;
	}

	_log(TRADING__CLIENT, "Actual quantity that will be traded is %i", outtbs->Quantity);

	if((tbs->Price * outtbs->Quantity) <= 0) {
		Message(13, "Internal error. Aborting trade. Please report this to the ServerOP. Error code is 1");
		Trader->Message(13, "Internal error. Aborting trade. Please report this to the ServerOP. Error code is 1");
		LogFile->write(EQEMuLog::Error, "Bazaar: Zero price transaction between %s and %s aborted."
						"Item: %s, Charges: %i, TBS: Qty %i, Price: %i",
						GetName(), Trader->GetName(),
						BuyItem->GetItem()->Name, BuyItem->GetCharges(), tbs->Quantity, tbs->Price);
		TradeRequestFailed(app);
		safe_delete(outapp);
		return;
	}

	uint64 TotalTransactionValue = static_cast<uint64>(tbs->Price) * static_cast<uint64>(outtbs->Quantity);

	if(TotalTransactionValue > MAX_TRANSACTION_VALUE) {
		Message(13, "That would exceed the single transaction limit of %u platinum.", MAX_TRANSACTION_VALUE / 1000);
		TradeRequestFailed(app);
		safe_delete(outapp);
		return;
	}

	ReturnTraderReq(app, outtbs->Quantity);

	outtbs->TraderID = this->GetID();

	outtbs->Action = BazaarBuyItem;

	strncpy(outtbs->ItemName, BuyItem->GetItem()->Name, 64);

	int TraderSlot = 0;

	if(BuyItem->IsStackable())
		SendTraderItem(BuyItem->GetItem()->ID, outtbs->Quantity);
	else
		SendTraderItem(BuyItem->GetItem()->ID, BuyItem->GetCharges());


	EQApplicationPacket* outapp2 = new EQApplicationPacket(OP_MoneyUpdate,sizeof(MoneyUpdate_Struct));

	MoneyUpdate_Struct* mus= (MoneyUpdate_Struct*)outapp2->pBuffer;

	// This cannot overflow assuming MAX_TRANSACTION_VALUE, checked above, is the default of 2000000000
	int32 TotalCost = tbs->Price * outtbs->Quantity;

	outtbs->Price = TotalCost;

	this->TakeMoneyFromPP(TotalCost);

	mus->platinum = TotalCost / 1000;

	TotalCost -= (mus->platinum * 1000);

	mus->gold = TotalCost / 100;

	TotalCost -= (mus->gold * 100);

	mus->silver = TotalCost / 10;

	TotalCost -= (mus->silver * 10);

	mus->copper = TotalCost;

	Trader->AddMoneyToPP(mus->copper,mus->silver,mus->gold,mus->platinum,false);

	mus->platinum = Trader->GetPlatinum();
	mus->gold = Trader->GetGold();
	mus->silver = Trader->GetSilver();
	mus->copper = Trader->GetCopper();

	TraderSlot = Trader->FindTraderItem(tbs->ItemID, outtbs->Quantity);

	Trader->QueuePacket(outapp2);

	_pkt(TRADING__PACKETS, outapp2);

	if(RuleB(Bazaar, AuditTrail))
		BazaarAuditTrail(Trader->GetName(), GetName(), BuyItem->GetItem()->Name, outtbs->Quantity, outtbs->Price, 0);

	Trader->FindAndNukeTraderItem(tbs->ItemID, outtbs->Quantity, this, 0);

	Trader->QueuePacket(outapp);

	_pkt(TRADING__PACKETS, outapp);

	safe_delete(outapp);
	safe_delete(outapp2);

}

void Client::SendBazaarWelcome(){

	char errbuf[MYSQL_ERRMSG_SIZE];

	char* query = 0;

	MYSQL_RES *result;

	MYSQL_ROW row;

	if (database.RunQuery(query,MakeAnyLenString(&query, "select count(distinct char_id),count(char_id) from trader"),errbuf,&result)){
		if(mysql_num_rows(result)==1){

			row = mysql_fetch_row(result);

			EQApplicationPacket* outapp = new EQApplicationPacket(OP_BazaarSearch, sizeof(BazaarWelcome_Struct));

			memset(outapp->pBuffer,0,outapp->size);

			BazaarWelcome_Struct* bws = (BazaarWelcome_Struct*)outapp->pBuffer;

			bws->Beginning.Action = BazaarWelcome;

			bws->Items = atoi(row[1]);

			bws->Traders = atoi(row[0]);

			QueuePacket(outapp);

			safe_delete(outapp);
		}
		mysql_free_result(result);
	}
	safe_delete_array(query);

	if (database.RunQuery(query,MakeAnyLenString(&query, "select count(distinct charid) from buyer"),errbuf,&result)){
		if(mysql_num_rows(result)==1) {

			row = mysql_fetch_row(result);

			Message(10, "There are %i Buyers waiting to purchase your loot.  Type /barter to search for them,"
				    " or use /buyer to set up your own Buy Lines.", atoi(row[0]));
		}
		mysql_free_result(result);
	}
	safe_delete_array(query);
}

void Client::SendBazaarResults(int32 TraderID, int32 Class_, int32 Race, int32 ItemStat, int32 Slot, int32 Type,
			       char Name[64], int32 MinPrice, int32 MaxPrice) {

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* Query = 0;
	string Search, Values;
	MYSQL_RES *Result;
	MYSQL_ROW Row;
	char Tmp[100] = {0};

	Values.append("count(item_id),trader.*,items.name");

	Search.append("where trader.item_id=items.id");

	if(TraderID > 0){
		Client* Trader = entity_list.GetClientByID(TraderID);

		if(Trader){
			sprintf(Tmp," and trader.char_id=%i",Trader->CharacterID());
			Search.append(Tmp);
		}
			
	}
	string SearchrResults;

	if(MinPrice != 0){
		sprintf(Tmp, " and trader.item_cost>=%i", MinPrice);
		Search.append(Tmp);
	}
	if(MaxPrice != 0){
		sprintf(Tmp, " and trader.item_cost<=%i", MaxPrice);
		Search.append(Tmp);
	}
	if(strlen(Name) > 0){
		char *SafeName = RemoveApostrophes(Name);
		sprintf(Tmp, " and items.name like '%%%s%%'", SafeName);
		safe_delete_array(SafeName);
		Search.append(Tmp);
	}
	if(Class_ != 0xFFFFFFFF){
			sprintf(Tmp, " and mid(reverse(bin(items.classes)),%i,1)=1", Class_);
			Search.append(Tmp);
	}
	if(Race!=0xFFFFFFFF){
			sprintf(Tmp, " and mid(reverse(bin(items.races)),%i,1)=1", Race);
			Search.append(Tmp);
	}
	if(Slot!=0xFFFFFFFF){
			sprintf(Tmp, " and mid(reverse(bin(items.slots)),%i,1)=1", Slot + 1);
			Search.append(Tmp);
	}
	if(Type!=0xFFFFFFFF){
		switch(Type){

			case 0:
				// 1H Slashing
				Search.append(" and items.itemtype=0 and damage>0");
				break;
			case 31:
				Search.append(" and items.itemclass=2");
				break;
			case 46:
				Search.append(" and items.spellid>0 and items.spellid<65000");
				break;
			case 47:
				Search.append(" and items.spellid=998");
				break;
			case 48:
				Search.append(" and items.spellid>=1298 and items.spellid<=1307");
				break;
			case 49:
				Search.append(" and items.focusid>0");
				break;
			default:
				sprintf(Tmp, " and items.itemtype=%i", Type);
				Search.append(Tmp);
		}
	}
		
	switch(ItemStat) {

		case STAT_AC:
			Search.append(" and items.ac>0");
			Values.append(",items.ac");
			break;

		case STAT_AGI:
			Search.append(" and items.aagi>0");
			Values.append(",items.aagi");
			break;

		case STAT_CHA:
			Search.append(" and items.acha>0");
			Values.append(",items.acha");
			break;

		case STAT_DEX:
			Search.append(" and items.adex>0");
			Values.append(",items.adex");
			break;

		case STAT_INT:
			Search.append(" and items.aint>0");
			Values.append(",items.aint");
			break;

		case STAT_STA:
			Search.append(" and items.asta>0");
			Values.append(",items.asta");
			break;

		case STAT_STR:
			Search.append(" and items.astr>0");
			Values.append(",items.astr");
			break;
		
		case STAT_WIS:
			Search.append(" and items.awis>0");
			Values.append(",items.awis");
			break;

		case STAT_COLD:
			Search.append(" and items.cr>0");
			Values.append(",items.cr");
			break;
		
		case STAT_DISEASE:
			Search.append(" and items.dr>0");
			Values.append(",items.dr");
			break;
	
		case STAT_FIRE:
			Search.append(" and items.fr>0");
			Values.append(",items.fr");
			break;

		case STAT_MAGIC:
			Values.append(",items.mr");
			Search.append(" and items.mr>0");
			break;

		case STAT_POISON:
			Search.append(" and items.pr>0");
			Values.append(",items.pr");
			break;

		case STAT_HP:
			Search.append(" and items.hp>0");
			Values.append(",items.hp");
			break;

		case STAT_MANA:
			Search.append(" and items.mana>0");
			Values.append(",items.mana");
			break;

		default:
			Values.append(",0");
			break;
	}

	Values.append(",sum(charges), items.stackable ");

	if (database.RunQuery(Query,MakeAnyLenString(&Query, "select %s from trader,items %s group by items.id,charges,char_id limit %i",
						     Values.c_str(),Search.c_str(), RuleI(Bazaar, MaxSearchResults)),errbuf,&Result)){

		_log(TRADING__CLIENT, "SRCH: %s", Query);
		safe_delete_array(Query);

		int Size = 0;
		int32 ID = 0;

		if(mysql_num_rows(Result) == static_cast<unsigned long>(RuleI(Bazaar, MaxSearchResults)))
			Message(15, "Your search reached the limit of %i results. Please narrow your search down by selecting more options.",
				    RuleI(Bazaar, MaxSearchResults));

		if(mysql_num_rows(Result) == 0){
			EQApplicationPacket* outapp2 = new EQApplicationPacket(OP_BazaarSearch, sizeof(BazaarReturnDone_Struct));
			BazaarReturnDone_Struct* brds = (BazaarReturnDone_Struct*)outapp2->pBuffer;
			brds->TraderID = ID;
			brds->Type = BazaarSearchDone;
			brds->Unknown008 = 0xFFFFFFFF;
			brds->Unknown012 = 0xFFFFFFFF;
			brds->Unknown016 = 0xFFFFFFFF;
			this->QueuePacket(outapp2);
			_pkt(TRADING__PACKETS,outapp2);
			safe_delete(outapp2);
			mysql_free_result(Result);
			return;
		}
		Size = mysql_num_rows(Result) * sizeof(BazaarSearchResults_Struct);
		uchar *buffer = new uchar[Size];
		uchar *bufptr = buffer;
		memset(buffer, 0, Size);

		int Action = BazaarSearchResults;
		int32 Cost = 0;
		sint32 SerialNumber = 0;
		char Name[64] = {0};
		int Count = 0;
		int32 StatValue=0;

		while ((Row = mysql_fetch_row(Result))) {
			VARSTRUCT_ENCODE_TYPE(int32, bufptr, Action);
			Count = atoi(Row[0]);
			VARSTRUCT_ENCODE_TYPE(int32, bufptr, Count);
			SerialNumber = atoi(Row[3]);
			VARSTRUCT_ENCODE_TYPE(sint32, bufptr, SerialNumber);
			Client* Trader2=entity_list.GetClientByCharID(atoi(Row[1]));
			if(Trader2){
				ID = Trader2->GetID();
				VARSTRUCT_ENCODE_TYPE(int32, bufptr, ID);
			}
			else{
				_log(TRADING__CLIENT, "Unable to find trader: %i\n",atoi(Row[1]));
				VARSTRUCT_ENCODE_TYPE(int32, bufptr, 0);
			}
			Cost = atoi(Row[5]);
			VARSTRUCT_ENCODE_TYPE(int32, bufptr, Cost);
			StatValue = atoi(Row[8]);
			VARSTRUCT_ENCODE_TYPE(int32, bufptr, StatValue);
			bool Stackable = atoi(Row[10]);
			if(Stackable) {
				int Charges = atoi(Row[9]);
				sprintf(Name, "%s(%i)", Row[7], Charges);
			}
			else
				sprintf(Name,"%s(%i)",Row[7], Count);

			memcpy(bufptr,&Name, strlen(Name));

			bufptr += 64;
			// Extra fields for SoD+
			//
			if(Trader2)
				sprintf(Name, "%s", Trader2->GetName());
			else
				sprintf(Name, "Unknown");
			memcpy(bufptr,&Name, strlen(Name));
			bufptr += 64;
			VARSTRUCT_ENCODE_TYPE(uint32, bufptr, atoi(Row[1]));	// ItemID
		}
		mysql_free_result(Result);

		EQApplicationPacket* outapp = new EQApplicationPacket(OP_BazaarSearch, Size);

		memcpy(outapp->pBuffer, buffer, Size);

		this->QueuePacket(outapp);

		_pkt(TRADING__PACKETS,outapp);

		safe_delete(outapp);
		safe_delete_array(buffer);

		EQApplicationPacket* outapp2 = new EQApplicationPacket(OP_BazaarSearch, sizeof(BazaarReturnDone_Struct));
		BazaarReturnDone_Struct* brds = (BazaarReturnDone_Struct*)outapp2->pBuffer;

		brds->TraderID = ID;
		brds->Type = BazaarSearchDone;

		brds->Unknown008 = 0xFFFFFFFF;
		brds->Unknown012 = 0xFFFFFFFF;
		brds->Unknown016 = 0xFFFFFFFF;

		this->QueuePacket(outapp2);

		_pkt(TRADING__PACKETS,outapp2);
		safe_delete(outapp2);
		
	}
	else{
		_log(TRADING__CLIENT, "Failed to retrieve Bazaar Search!! %s %s\n", Query, errbuf);
		safe_delete_array(Query);
		return;
	}
}

static void UpdateTraderCustomerItemsAdded(int32 CustomerID,  TraderCharges_Struct* gis, int32 ItemID) {

	// Send Item packets to the customer to update the Merchant window with the
	// new items for sale, and give them a message in their chat window.

	Client* Customer = entity_list.GetClientByID(CustomerID);

	if(!Customer) return;

	const Item_Struct *item = database.GetItem(ItemID);

	if(!item) return;

	ItemInst* inst = database.CreateItem(item);

	if(!inst) return;

	Customer->Message(13, "The Trader has put up %s for sale.", item->Name);

	for(int i = 0; i < 80; i++) {

		if(gis->ItemID[i] == ItemID) {

			inst->SetCharges(gis->Charges[i]);

			inst->SetPrice(gis->ItemCost[i]);

			inst->SetSerialNumber(gis->SerialNumber[i]);

			inst->SetMerchantSlot(gis->SerialNumber[i]);

			if(inst->IsStackable())
				inst->SetMerchantCount(gis->Charges[i]);

			_log(TRADING__CLIENT, "Sending price update for %s, Serial No. %i with %i charges",
					      item->Name, gis->SerialNumber[i], gis->Charges[i]);

			Customer->SendItemPacket(30, inst, ItemPacketMerchant);
		}
	}

	safe_delete(inst);
}

static void UpdateTraderCustomerPriceChanged(int32 CustomerID,  TraderCharges_Struct* gis, int32 ItemID, sint32 Charges, int32 NewPrice) {

	// Send ItemPackets to update the customer's Merchant window with the new price (or remove the item if
	// the new price is 0) and inform them with a chat message.

	Client* Customer = entity_list.GetClientByID(CustomerID);

	if(!Customer) return;

	const Item_Struct *item = database.GetItem(ItemID);

	if(!item) return;

	if(NewPrice == 0) {
		// If the new price is 0, remove the item(s) from the window.
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_TraderDelItem,sizeof(TraderDelItem_Struct));
		TraderDelItem_Struct* tdis = (TraderDelItem_Struct*)outapp->pBuffer;

		tdis->Unknown000 = 0;
		tdis->TraderID = Customer->GetID();
		tdis->Unknown012 = 0;
		Customer->Message(13, "The Trader has withdrawn the %s from sale.", item->Name);

		for(int i = 0; i < 80; i++) {

			if(gis->ItemID[i] == ItemID) {

				tdis->ItemID = gis->SerialNumber[i];
				_log(TRADING__CLIENT, "Telling customer to remove item %i with %i charges and S/N %i",
						      ItemID, Charges, gis->SerialNumber[i]);

				_pkt(TRADING__PACKETS, outapp);

				Customer->QueuePacket(outapp);
			}
		}

		safe_delete(outapp);
		return;
	}

	_log(TRADING__CLIENT, "Sending price updates to customer %s", Customer->GetName());

	ItemInst* inst = database.CreateItem(item);

	if(!inst) return;

	if(Charges > 0)
		inst->SetCharges(Charges);

	inst->SetPrice(NewPrice);

	if(inst->IsStackable())
		inst->SetMerchantCount(Charges);

	// Let the customer know the price in the window has suddenly just changed on them.
	Customer->Message(13, "The Trader has changed the price of %s.", item->Name);

	for(int i = 0; i < 80; i++) {
		if((gis->ItemID[i] != ItemID) || 
		   ((!item->Stackable) && (gis->Charges[i] != Charges))) 
			continue;

		inst->SetSerialNumber(gis->SerialNumber[i]);

		inst->SetMerchantSlot(gis->SerialNumber[i]);

		_log(TRADING__CLIENT, "Sending price update for %s, Serial No. %i with %i charges",
				      item->Name, gis->SerialNumber[i], gis->Charges[i]);

		Customer->SendItemPacket(30, inst, ItemPacketMerchant);
	}
	safe_delete(inst);
}

void Client::HandleTraderPriceUpdate(const EQApplicationPacket *app) {

	// Handle price updates from the Trader and update a customer browsing our stuff if necessary
	// This method also handles removing items from sale and adding them back up whilst still in
	// Trader mode.
	//
	TraderPriceUpdate_Struct* tpus = (TraderPriceUpdate_Struct*)app->pBuffer;

	_log(TRADING__CLIENT, "Received Price Update for %s, Item Serial No. %i, New Price %i",
			      GetName(), tpus->SerialNumber, tpus->NewPrice);

	// Pull the items this Trader currently has for sale from the trader table.
	//
	TraderCharges_Struct* gis = database.LoadTraderItemWithCharges(CharacterID());

	if(!gis) {
		_log(TRADING__CLIENT, "Error retrieving Trader items details to update price.");
		return;
	}

	// The client only sends a single update with the Serial Number of the item whose price has been updated.
	// We must update the price for all the Trader's items that are identical to that one item, i.e.
	// if it is a stackable item like arrows, update the price for all stacks. If it is not stackable, then
	// update the prices for all items that have the same number of charges.
	//
	int32 IDOfItemToUpdate = 0;

	sint32 ChargesOnItemToUpdate = 0;

	int32 OldPrice = 0;

	for(int i = 0; i < 80; i++) {

		if((gis->ItemID[i] > 0) && (gis->SerialNumber[i] == tpus->SerialNumber)) {
			// We found the item that the Trader wants to change the price of (or add back up for sale).
			//
			_log(TRADING__CLIENT, "ItemID is %i, Charges is %i", gis->ItemID[i], gis->Charges[i]);

			IDOfItemToUpdate = gis->ItemID[i];

			ChargesOnItemToUpdate = gis->Charges[i];

			OldPrice = gis->ItemCost[i];

			break;
		}
	}

	if(IDOfItemToUpdate == 0) {

		// If the item is not currently in the trader table for this Trader, then they must have removed it from sale while
		// still in Trader mode. Check if the item is in their Trader Satchels, and if so, put it back up.
	
		// Quick Sanity check. If the item is not currently up for sale, and the new price is zero, just ack the packet
		// and do nothing.
		if(tpus->NewPrice == 0) {
			tpus->SubAction = BazaarPriceChange_RemoveItem;
			QueuePacket(app);
			safe_delete(gis);
			return ;
		}

		_log(TRADING__CLIENT, "Unable to find item to update price for. Rechecking trader satchels");

		// Find what is in their Trader Satchels
		GetItems_Struct* newgis=GetTraderItems();

		int32 IDOfItemToAdd = 0;

		sint32 ChargesOnItemToAdd = 0;

		for(int i = 0; i < 80; i++) {

			if((newgis->Items[i] > 0) && (newgis->SerialNumber[i] == tpus->SerialNumber)) {

				_log(TRADING__CLIENT, "Found new Item to Add, ItemID is %i, Charges is %i", newgis->Items[i], 
						      newgis->Charges[i]);

				IDOfItemToAdd = newgis->Items[i];
				ChargesOnItemToAdd = newgis->Charges[i];

				break;
			}
		}


		const Item_Struct *item = 0;

		if(IDOfItemToAdd)
			item = database.GetItem(IDOfItemToAdd);

		if(!IDOfItemToAdd || !item) {

			_log(TRADING__CLIENT, "Item not found in Trader Satchels either.");
			tpus->SubAction = BazaarPriceChange_Fail;
			QueuePacket(app);
			Trader_EndTrader();
			safe_delete(gis);
			safe_delete(newgis);
			return;
		}

		// It is a limitation of the client that if you have multiple of the same item, but with different charges,
		// although you can set different prices for them before entering Trader mode. If you Remove them and then
		// add them back whilst still in Trader mode, they all go up for the same price. We check for this situation
		// and give the Trader a warning message.
		//
		if(!item->Stackable) {

			bool SameItemWithDifferingCharges = false;

			for(int i = 0; i < 80; i++) {
				if((newgis->Items[i] == IDOfItemToAdd) && (newgis->Charges[i] != ChargesOnItemToAdd)) {

					SameItemWithDifferingCharges = true;
					break;
				}
			}

			if(SameItemWithDifferingCharges)
				Message(13, "Warning: You have more than one %s with different charges. They have all been added for sale "
					    "at the same price.", item->Name);
		}

		// Now put all Items with a matching ItemID up for trade.
		//
		for(int i = 0; i < 80; i++) {

			if(newgis->Items[i] == IDOfItemToAdd) {

				database.SaveTraderItem(CharacterID(), newgis->Items[i], newgis->SerialNumber[i], newgis->Charges[i],
							tpus->NewPrice, i);

				gis->ItemID[i] = newgis->Items[i];
				gis->Charges[i] = newgis->Charges[i];
				gis->SerialNumber[i] = newgis->SerialNumber[i];
				gis->ItemCost[i] = tpus->NewPrice;

				_log(TRADING__CLIENT, "Adding new item for %s. ItemID %i, SerialNumber %i, Charges %i, Price: %i, Slot %i",
						     GetName(), newgis->Items[i], newgis->SerialNumber[i], newgis->Charges[i], 
						     tpus->NewPrice, i);
			}
		}

		// If we have a customer currently browsing, update them with the new items.
		//
		if(CustomerID)
			UpdateTraderCustomerItemsAdded(CustomerID,  gis, IDOfItemToAdd);

		safe_delete(gis);
		safe_delete(newgis);

		// Acknowledge to the client.
		tpus->SubAction = BazaarPriceChange_AddItem;
		QueuePacket(app);

		return;
	}

	// This is a safeguard against a Trader increasing the price of an item while a customer is browsing and
	// unwittingly buying it at a higher price than they were expecting to.
	//
	if((OldPrice != 0) && (tpus->NewPrice > OldPrice) && CustomerID) {

		tpus->SubAction = BazaarPriceChange_Fail;
		QueuePacket(app);
		Trader_EndTrader();
		Message(13, "You must remove the item from sale before you can increase the price while a customer is browsing.");
		Message(13, "Click 'Begin Trader' to restart Trader mode with the increased price for this item.");
		safe_delete(gis);
		return;
	}

	// Send Acknowledgement back to the client.
	if(OldPrice == 0) 
		tpus->SubAction = BazaarPriceChange_AddItem;
	else if(tpus->NewPrice != 0) 
		tpus->SubAction = BazaarPriceChange_UpdatePrice;
	else
		tpus->SubAction = BazaarPriceChange_RemoveItem;
	
	QueuePacket(app);

	if(OldPrice == tpus->NewPrice) {
		_log(TRADING__CLIENT, "The new price is the same as the old one.");
		safe_delete(gis);
		return;
	}
	// Update the price for all items we have for sale that have this ItemID and number of charges, or remove
	// them from the trader table if the new price is zero.
	//
	database.UpdateTraderItemPrice(CharacterID(), IDOfItemToUpdate, ChargesOnItemToUpdate, tpus->NewPrice);

	// If a customer is browsing our goods, send them the updated prices / remove the items from the Merchant window
	if(CustomerID)  
		UpdateTraderCustomerPriceChanged(CustomerID, gis, IDOfItemToUpdate, ChargesOnItemToUpdate, tpus->NewPrice);

	safe_delete(gis);

}

void Client::SendBuyerResults(char* SearchString, uint32 SearchID) {

	// This method is called when a potential seller in the /barter window searches for matching buyers
	//
	_log(TRADING__BARTER, "Client::SendBuyerResults %s\n", SearchString);

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* Query = 0;
	char ItemName[64];
	string Search, Values;
	MYSQL_RES *Result;
	MYSQL_ROW Row;

	char*EscSearchString = new char[strlen(SearchString) * 2 + 1];
	database.DoEscapeString(EscSearchString, SearchString, strlen(SearchString));

	if (database.RunQuery(Query,MakeAnyLenString(&Query, "select * from buyer where itemname like '%%%s%%' order by charid limit %i",
						     EscSearchString, RuleI(Bazaar, MaxBarterSearchResults)), errbuf, &Result)) {

		int NumberOfRows = mysql_num_rows(Result);

		if(NumberOfRows == RuleI(Bazaar, MaxBarterSearchResults))
			Message(15, "Your search found too many results; some are not displayed.");
		else {
			if(strlen(SearchString) == 0)
				Message(10, "There are %i Buy Lines.", NumberOfRows);
			else
				Message(10, "There are %i Buy Lines that match the search string '%s'.", 
					    NumberOfRows, SearchString);
		}

		if(NumberOfRows == 0) {
			mysql_free_result(Result);
			safe_delete_array(Query);
			return;
		}

		uint32 LastCharID = 0;
		Client *Buyer = NULL;

		while ((Row = mysql_fetch_row(Result))) {

			uint32 CharID = atoi(Row[0]);
			uint32 BuySlot = atoi(Row[1]);
			uint32 ItemID = atoi(Row[2]);
			strcpy(ItemName, Row[3]);
			uint32 Quantity = atoi(Row[4]);
			uint32 Price = atoi(Row[5]);

			// Each item in the search results is sent as a single fixed length packet, although the position of 
			// the fields varies due to the use of variable length strings. The reason the packet is so big, is
			// to allow item compensation, e.g. a buyer could offer to buy a Blade Of Carnage for 10000pp plus
			// other items in exchange. Item compensation is not currently supported in EQEmu.
			//
			EQApplicationPacket* outapp = new EQApplicationPacket(OP_Barter, 940);

			char *Buf = (char *)outapp->pBuffer;

			const Item_Struct* item = database.GetItem(ItemID);

			if(!item) continue;

			// Save having to scan the client list when dealing with multiple buylines for the same Character.
			if(CharID != LastCharID) {
				Buyer = entity_list.GetClientByCharID(CharID);
				LastCharID = CharID;
			}

			if(!Buyer) continue;

			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Barter_BuyerSearchResults);	// Command
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	SearchID);			// Match up results with the request
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	BuySlot);			// Slot in this Buyer's list
			VARSTRUCT_ENCODE_TYPE(uint8,	Buf,	0x01);				// Unknown - probably a flag field
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	ItemID);			// ItemID
			VARSTRUCT_ENCODE_STRING(	Buf,	ItemName);			// Itemname
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	item->Icon);			// Icon
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Quantity);			// Quantity
			VARSTRUCT_ENCODE_TYPE(uint8,	Buf,	0x01);				// Unknown - probably a flag field
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Price);				// Price
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Buyer->GetID());		// Entity ID
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	0);				// Flag for + Items , probably ItemCount
			VARSTRUCT_ENCODE_STRING(	Buf, 	Buyer->GetName());		// Seller Name

			_pkt(TRADING__BARTER, outapp);

			QueuePacket(outapp);
			safe_delete(outapp);
		}

		mysql_free_result(Result);
	}
	else{
		_log(TRADING__CLIENT, "Failed to retrieve Barter Search!! %s %s\n", Query, errbuf);
	}
	safe_delete_array(Query);
	safe_delete_array(EscSearchString);
}

void Client::ShowBuyLines(const EQApplicationPacket *app) {

	BuyerInspectRequest_Struct* bir = ( BuyerInspectRequest_Struct*)app->pBuffer;

	Client *Buyer = entity_list.GetClientByID(bir->BuyerID);

	if(!Buyer) {
		bir->Approval = 0; // Tell the client that the Buyer is unavailable
		QueuePacket(app);
		Message(13, "The Buyer has gone away.");
		return;
	}

	bir->Approval = Buyer->WithCustomer(GetID());

	QueuePacket(app);

	if(bir->Approval == 0) {
		Message_StringID(clientMessageYellow, TRADER_BUSY);
		return;
	}

	const char *WelcomeMessagePointer = Buyer->GetBuyerWelcomeMessage();

	if(strlen(WelcomeMessagePointer) > 0)
		Message(10, "%s greets you, '%s'.", Buyer->GetName(), WelcomeMessagePointer);

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_Barter, sizeof(BuyerBrowsing_Struct));

	BuyerBrowsing_Struct* bb = (BuyerBrowsing_Struct*)outapp->pBuffer;

	// This packet produces the SoandSo is browsing your Buy Lines message	
	bb->Action = Barter_SellerBrowsing;

	sprintf(bb->PlayerName, GetName());

	Buyer->QueuePacket(outapp);

	safe_delete(outapp);

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* Query = 0;
	char ItemName[64];
	string Search, Values;
	MYSQL_RES *Result;
	MYSQL_ROW Row;

	if (database.RunQuery(Query,MakeAnyLenString(&Query, "select * from buyer where charid = %i",
						     Buyer->CharacterID()),errbuf,&Result)){

		if(mysql_num_rows(Result) == 0) {

			safe_delete_array(Query);

			mysql_free_result(Result);

			return;
		}

		while ((Row = mysql_fetch_row(Result))) {

			uint32 BuySlot = atoi(Row[1]);
			uint32 ItemID = atoi(Row[2]);
			strcpy(ItemName, Row[3]);
			uint32 Quantity = atoi(Row[4]);
			uint32 Price = atoi(Row[5]);

			EQApplicationPacket* outapp = new EQApplicationPacket(OP_Barter, 936);

			char *Buf = (char *)outapp->pBuffer;

			const Item_Struct* item = database.GetItem(ItemID);

			if(!item) continue;

			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Barter_BuyerInspectWindow);
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	BuySlot);
			VARSTRUCT_ENCODE_TYPE(uint8,	Buf,	1);				// Flag
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	ItemID);
			VARSTRUCT_ENCODE_STRING(	Buf,	ItemName);
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	item->Icon);
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Quantity);
			VARSTRUCT_ENCODE_TYPE(uint8,	Buf,	1);				// Flag
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Price);
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Buyer->GetID());
			VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	0);
			VARSTRUCT_ENCODE_STRING(	Buf,	Buyer->GetName());

			_pkt(TRADING__BARTER, outapp);
			QueuePacket(outapp);
		}
		mysql_free_result(Result);
	}
	safe_delete_array(Query);
}

void Client::SellToBuyer(const EQApplicationPacket *app) {

	char* Buf = (char *)app->pBuffer;
	
	char ItemName[64];

	/*uint32	Action		=*/ VARSTRUCT_SKIP_TYPE(uint32, Buf);	//unused
	uint32	Quantity	= VARSTRUCT_DECODE_TYPE(uint32, Buf);
	uint32	BuyerID		= VARSTRUCT_DECODE_TYPE(uint32, Buf);
	uint32	BuySlot		= VARSTRUCT_DECODE_TYPE(uint32, Buf);
	uint32	UnknownByte	= VARSTRUCT_DECODE_TYPE(uint8, Buf);
	uint32	ItemID		= VARSTRUCT_DECODE_TYPE(uint32, Buf);
	/* ItemName  */		  VARSTRUCT_DECODE_STRING(ItemName, Buf);
	/*uint32	Unknown2	=*/ VARSTRUCT_SKIP_TYPE(uint32, Buf);	//unused
	uint32	QtyBuyerWants	= VARSTRUCT_DECODE_TYPE(uint32, Buf);
		UnknownByte	= VARSTRUCT_DECODE_TYPE(uint8, Buf);
	uint32	Price		= VARSTRUCT_DECODE_TYPE(uint32, Buf);
	/*uint32	BuyerID2	=*/ VARSTRUCT_SKIP_TYPE(uint32, Buf);	//unused
	/*uint32	Unknown3	=*/ VARSTRUCT_SKIP_TYPE(uint32, Buf);	//unused

	const Item_Struct *item = database.GetItem(ItemID);

	if(!item || !Quantity || !Price || !QtyBuyerWants) return;

	if(m_inv.HasItem(ItemID, Quantity, invWhereWorn|invWherePersonal|invWhereCursor) == SLOT_INVALID) {

		Message(13, "You do not have %i %s on you.", Quantity, item->Name);

		return;
	}


	Client *Buyer = entity_list.GetClientByID(BuyerID);

	if(!Buyer || !Buyer->IsBuyer()) {
		Message(13, "The Buyer has gone away.");
		return;
	}

	// For Stackable items, HasSpaceForItem will try check if there is space to stack with existing stacks in
	// the buyer inventory.
	if(!(Buyer->GetInv().HasSpaceForItem(item, Quantity))) {

	   	Message(13, "The Buyer does not have space for %i %s", Quantity, item->Name);

		return;
	}

	if((static_cast<int64>(Quantity) * static_cast<int64>(Price)) > MAX_TRANSACTION_VALUE) {
		Message(13, "That would exceed the single transaction limit of %u platinum.", MAX_TRANSACTION_VALUE / 1000);
		return;
	}

	if(!Buyer->HasMoney(Quantity * Price)) {
		Message(13, "The Buyer does not have sufficient money to purchase that quantity of %s.", item->Name);
		Buyer->Message(13, "%s tried to sell you %i %s, but you have insufficient funds.", GetName(), Quantity, item->Name);
		return;
	}

	if(Buyer->CheckLoreConflict(item)) {
		Message(13, "That item is LORE and the Buyer already has one.");
		Buyer->Message(13, "%s tried to sell you %s but this item is LORE and you already have one.",
				   GetName(), item->Name);
		return;
	}

	if(item->NoDrop == 0) {
		Message(13, "That item is NODROP.");
		return;
	}

	if(!item->Stackable) {

		for(uint32 i = 0; i < Quantity; i++) {

			sint16 SellerSlot = m_inv.HasItem(ItemID, 1, invWhereWorn|invWherePersonal|invWhereCursor);

			// This shouldn't happen, as we already checked there was space in the Buyer's inventory
			if(SellerSlot == SLOT_INVALID) {

				if(i > 0) {
					// Set the Quantity to the actual number we successfully transferred.
					Quantity = i;
					break;
				}
				_log(TRADING__BARTER, "Unexpected error while moving item from seller to buyer.");
	   			Message(13, "Internal error while processing transaction.");
				return;
			}

			ItemInst* ItemToTransfer = m_inv.PopItem(SellerSlot);

			if(!ItemToTransfer || !Buyer->MoveItemToInventory(ItemToTransfer, true)) {
				_log(TRADING__BARTER, "Unexpected error while moving item from seller to buyer.");
	   			Message(13, "Internal error while processing transaction.");
				
				if(ItemToTransfer)
					safe_delete(ItemToTransfer);

				return;
			}

			database.SaveInventory(CharacterID(), 0, SellerSlot);

			safe_delete(ItemToTransfer);

			// Remove the item from inventory, clientside
			//
			EQApplicationPacket* outapp2 = new EQApplicationPacket(OP_MoveItem,sizeof(MoveItem_Struct));

			MoveItem_Struct* mis	= (MoveItem_Struct*)outapp2->pBuffer;
			mis->from_slot		= SellerSlot;
			mis->to_slot		= 0xFFFFFFFF;
			mis->number_in_stack	= 0xFFFFFFFF;

			QueuePacket(outapp2);
			safe_delete(outapp2);

		}
	}
	else {
		// Stackable
		//
		uint32 QuantityMoved = 0;

		while(QuantityMoved < Quantity) {

			// Find the slot on the seller that has a stack of at least 1 of the item
			sint16 SellerSlot = m_inv.HasItem(ItemID, 1, invWhereWorn|invWherePersonal|invWhereCursor);

			if(SellerSlot == SLOT_INVALID) {
				_log(TRADING__BARTER, "Unexpected error while moving item from seller to buyer.");
	   			Message(13, "Internal error while processing transaction.");
				return;
			}

			ItemInst* ItemToTransfer = m_inv.PopItem(SellerSlot);

			if(!ItemToTransfer) {
				_log(TRADING__BARTER, "Unexpected error while moving item from seller to buyer.");
	   			Message(13, "Internal error while processing transaction.");
				return;
			}

			// If the stack we found has less than the quantity we are selling ...
			if(ItemToTransfer->GetCharges() <= (Quantity - QuantityMoved)) {
				// Transfer the entire stack

				QuantityMoved += ItemToTransfer->GetCharges();

				if(!Buyer->MoveItemToInventory(ItemToTransfer, true)) {
					_log(TRADING__BARTER, "Unexpected error while moving item from seller to buyer.");
	 	  			Message(13, "Internal error while processing transaction.");
					safe_delete(ItemToTransfer);
					return;
				}
				// Delete the entire stack from the seller's inventory
				database.SaveInventory(CharacterID(), 0, SellerSlot);

				safe_delete(ItemToTransfer);

				// and tell the client to do the same.
				EQApplicationPacket* outapp2 = new EQApplicationPacket(OP_MoveItem,sizeof(MoveItem_Struct));

				MoveItem_Struct* mis	= (MoveItem_Struct*)outapp2->pBuffer;
				mis->from_slot		= SellerSlot;
				mis->to_slot		= 0xFFFFFFFF;
				mis->number_in_stack	= 0xFFFFFFFF;

				QueuePacket(outapp2);
				safe_delete(outapp2);
			}
			else {
				//Move the amount we need, and put the rest of the stack back in the seller's inventory
				//
				int QuantityToRemoveFromStack = Quantity - QuantityMoved;

				ItemToTransfer->SetCharges(ItemToTransfer->GetCharges() - QuantityToRemoveFromStack);

				m_inv.PutItem(SellerSlot, *ItemToTransfer);

				database.SaveInventory(CharacterID(), ItemToTransfer, SellerSlot);

				ItemToTransfer->SetCharges(QuantityToRemoveFromStack);

				if(!Buyer->MoveItemToInventory(ItemToTransfer, true)) {
					_log(TRADING__BARTER, "Unexpected error while moving item from seller to buyer.");
	 	  			Message(13, "Internal error while processing transaction.");
					safe_delete(ItemToTransfer);
					return;
				}

				safe_delete(ItemToTransfer);

				EQApplicationPacket* outapp2 = new EQApplicationPacket(OP_DeleteItem,sizeof(MoveItem_Struct));

				MoveItem_Struct* mis	= (MoveItem_Struct*)outapp2->pBuffer;
				mis->from_slot		= SellerSlot;
				mis->to_slot		= 0xFFFFFFFF;
				mis->number_in_stack 	= 0xFFFFFFFF;

				for(int i = 0; i < QuantityToRemoveFromStack; i++)
					QueuePacket(outapp2);

				safe_delete(outapp2);

				QuantityMoved = Quantity;
			}
		}

	}
	
	Buyer->TakeMoneyFromPP(Quantity * Price);

	AddMoneyToPP(Quantity * Price, false);

	if(RuleB(Bazaar, AuditTrail))
		BazaarAuditTrail(GetName(), Buyer->GetName(), ItemName, Quantity, Quantity * Price, 1);

	// We now send a packet to the Seller, which causes it to display 'You have sold <Qty> <Item> to <Player> for <money>'
	//
	// The PacketLength of 1016 is from the only instance of this packet I have seen, which is from Live, November 2008
	// The Titanium/6.2 struct is slightly different in that it appears to use fixed length strings instead of variable
	// length as used on Live. The extra space in the packet is also likely to be used for Item compensation, if we ever
	// implement that.
	//
	int32 PacketLength = 1016; 

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_Barter, PacketLength);

	Buf = (char *)outapp->pBuffer;

	VARSTRUCT_ENCODE_TYPE(uint32,	Buf, Barter_SellerTransactionComplete);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf, Quantity);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf, Quantity * Price);
	if(GetClientVersion() >= EQClientSoD)
	{
		VARSTRUCT_ENCODE_TYPE(uint32,	Buf, 0);	// Think this is the upper 32 bits of a 64 bit price
	}

	sprintf(Buf, "%s", Buyer->GetName()); Buf += 64;

	VARSTRUCT_ENCODE_TYPE(uint32,	Buf, 0x00);
	VARSTRUCT_ENCODE_TYPE(uint8,	Buf, 0x01);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf, 0x00);

	sprintf(Buf, "%s", ItemName); Buf += 64;

	_pkt(TRADING__BARTER, outapp);
	QueuePacket(outapp);

	// This next packet goes to the Buyer and produces the 'You've bought <Qty> <Item> from <Seller> for <money>'
	//
	
	Buf = (char *)outapp->pBuffer;

	VARSTRUCT_ENCODE_TYPE(uint32, Buf, Barter_BuyerTransactionComplete);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf, Quantity);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf, Quantity * Price);
	if(GetClientVersion() >= EQClientSoD)
	{
		VARSTRUCT_ENCODE_TYPE(uint32,	Buf, 0);	// Think this is the upper 32 bits of a 64 bit price
	}

	sprintf(Buf, "%s", GetName()); Buf += 64;

	VARSTRUCT_ENCODE_TYPE(uint32,	Buf, 0x00);
	VARSTRUCT_ENCODE_TYPE(uint8,	Buf, 0x01);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf, 0x00);

	sprintf(Buf, "%s", ItemName); Buf += 64;

	Buyer->QueuePacket(outapp);

	safe_delete(outapp);

	// Next we update the buyer table in the database to reflect the reduced quantity the Buyer wants to buy.
	//
	database.UpdateBuyLine(Buyer->CharacterID(), BuySlot, QtyBuyerWants - Quantity);

	// Next we update the Seller's Barter Window to reflect the reduced quantity the Buyer is now looking to buy.
	//
	EQApplicationPacket* outapp3 = new EQApplicationPacket(OP_Barter, 936);

	Buf = (char *)outapp3->pBuffer;

	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Barter_BuyerInspectWindow);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	BuySlot);
	VARSTRUCT_ENCODE_TYPE(uint8,	Buf,	1);				// Unknown
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	ItemID);
	VARSTRUCT_ENCODE_STRING(	Buf,	ItemName);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	item->Icon);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	QtyBuyerWants - Quantity);

	// If the amount we have just sold completely satisfies the quantity the Buyer was looking for,
	// setting the next byte to 0 will remove the item from the Barter Window.
	//
	if(QtyBuyerWants - Quantity > 0) {
		VARSTRUCT_ENCODE_TYPE(uint8, Buf, 1);		// 0 = Toggle Off, 1 = Toggle On
	}
	else {
		VARSTRUCT_ENCODE_TYPE(uint8, Buf, 0);		// 0 = Toggle Off, 1 = Toggle On
	}

	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Price);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Buyer->GetID());
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	0);

	VARSTRUCT_ENCODE_STRING(	Buf,	Buyer->GetName());

	_pkt(TRADING__BARTER, outapp3);
	QueuePacket(outapp3);
	safe_delete(outapp3);

	// The next packet updates the /buyer window with the reduced quantity, and toggles the buy line off if the
	// quantity they wanted to buy has been met.
	//
	EQApplicationPacket* outapp4 = new EQApplicationPacket(OP_Barter, 936);

	Buf = (char*)outapp4->pBuffer;

	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Barter_BuyerItemUpdate);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	BuySlot);
	VARSTRUCT_ENCODE_TYPE(uint8,	Buf,	1);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	ItemID);
	VARSTRUCT_ENCODE_STRING(	Buf,	ItemName);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	item->Icon);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	QtyBuyerWants - Quantity);

	if((QtyBuyerWants - Quantity) > 0) {

		VARSTRUCT_ENCODE_TYPE(uint8, Buf, 1);		// 0 = Toggle Off, 1 = Toggle On
	}
	else {
		VARSTRUCT_ENCODE_TYPE(uint8, Buf, 0);		// 0 = Toggle Off, 1 = Toggle On
	}

	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Price);
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	0x08f4);	// Unknown
	VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	0);
	VARSTRUCT_ENCODE_STRING(	Buf,	Buyer->GetName());

	_pkt(TRADING__BARTER, outapp4);
	Buyer->QueuePacket(outapp4);
	safe_delete(outapp4);

	return;
}

void Client::SendBuyerPacket(Client* Buyer) {

	// This is the Buyer Appearance packet. This method is called for each Buyer when a Client connects to the zone.
	//
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_Barter, 13 + strlen(GetName()));

	char* Buf = (char*)outapp->pBuffer;

	VARSTRUCT_ENCODE_TYPE(uint32, Buf, Barter_BuyerAppearance);
	VARSTRUCT_ENCODE_TYPE(uint32, Buf, Buyer->GetID());
	VARSTRUCT_ENCODE_TYPE(uint32, Buf, 0x01);
	VARSTRUCT_ENCODE_STRING(Buf, GetName());

	QueuePacket(outapp);
	safe_delete(outapp);
}

void Client::ToggleBuyerMode(bool TurnOn) {

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_Barter, 13 + strlen(GetName()));

	char* Buf = (char*)outapp->pBuffer;

	VARSTRUCT_ENCODE_TYPE(uint32, Buf, Barter_BuyerAppearance);
	VARSTRUCT_ENCODE_TYPE(uint32, Buf, GetID());

	if(TurnOn) {
		VARSTRUCT_ENCODE_TYPE(uint32, Buf, 0x01);
	}
	else {
		VARSTRUCT_ENCODE_TYPE(uint32, Buf, 0x00);
		database.DeleteBuyLines(CharacterID());
		CustomerID = 0;
	}
	VARSTRUCT_ENCODE_STRING(Buf, GetName());
	entity_list.QueueClients(this, outapp, false);

	_pkt(TRADING__BARTER, outapp);
	safe_delete(outapp);

	Buyer = TurnOn;
}

void Client::UpdateBuyLine(const EQApplicationPacket *app) {

	// This method is called when:
	//
	// /buyer mode is first turned on, once for each item
	// A BuyLine is toggled on or off in the/buyer window.
	//
	char* Buf = (char*)app->pBuffer;

	char ItemName[64];

	/*uint32 Action		=*/ VARSTRUCT_SKIP_TYPE(uint32, Buf);	//unused
	uint32 BuySlot		= VARSTRUCT_DECODE_TYPE(uint32, Buf);
	uint8  Unknown009	= VARSTRUCT_DECODE_TYPE(uint8, Buf);
	uint32 ItemID		= VARSTRUCT_DECODE_TYPE(uint32, Buf);
	/* ItemName */		  VARSTRUCT_DECODE_STRING(ItemName, Buf);
	uint32 Icon		= VARSTRUCT_DECODE_TYPE(uint32, Buf);
	uint32 Quantity		= VARSTRUCT_DECODE_TYPE(uint32, Buf);
	uint8  ToggleOnOff	= VARSTRUCT_DECODE_TYPE(uint8, Buf);
	uint32 Price		= VARSTRUCT_DECODE_TYPE(uint32, Buf);
	/*uint32 UnknownZ		=*/ VARSTRUCT_SKIP_TYPE(uint32, Buf);	//unused
	uint32 ItemCount	= VARSTRUCT_DECODE_TYPE(uint32, Buf);

	const Item_Struct *item = database.GetItem(ItemID);

	if(!item) return;

	bool LoreConflict = CheckLoreConflict(item);

	_log(TRADING__BARTER, "UpdateBuyLine: Char: %s BuySlot: %i ItemID %i %s Quantity %i Toggle: %i Price %i ItemCount %i LoreConflict %i",
			      GetName(), BuySlot, ItemID, item->Name, Quantity, ToggleOnOff, Price, ItemCount, LoreConflict);

	if((item->NoDrop != 0) && !LoreConflict && (Quantity > 0) && HasMoney(Quantity * Price) && ToggleOnOff && (ItemCount == 0)) {
		_log(TRADING__BARTER, "Adding to database");
		database.AddBuyLine(CharacterID(), BuySlot, ItemID, ItemName, Quantity, Price);
		QueuePacket(app);
	}
	else {
		if(ItemCount > 0)
			Message(13, "Buy line %s disabled as Item Compensation is not currently supported.", ItemName);

		else if(Quantity <= 0)
			Message(13, "Buy line %s disabled as the quantity is invalid.", ItemName);

		else if(LoreConflict)
			Message(13, "Buy line %s disabled as the item is LORE and you have one already.", ItemName);

		else if(item->NoDrop == 0)
			Message(13, "Buy line %s disabled as the item is NODROP.", ItemName);

		else if(ToggleOnOff)
			Message(13, "Buy line %s disabled due to insufficient funds.", ItemName);

		else
			database.RemoveBuyLine(CharacterID(), BuySlot);

		EQApplicationPacket* outapp = new EQApplicationPacket(OP_Barter, 936);

		Buf = (char*)outapp->pBuffer;

		VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Barter_BuyerItemUpdate);
		VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	BuySlot);
		VARSTRUCT_ENCODE_TYPE(uint8,	Buf,	Unknown009);
		VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	ItemID);
		VARSTRUCT_ENCODE_STRING(	Buf,	ItemName);
		VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Icon);
		VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Quantity);
		VARSTRUCT_ENCODE_TYPE(uint8,	Buf,	0);				// Toggle the Buy Line off in the client
		VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	Price);
		VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	0x08f4);			// Unknown
		VARSTRUCT_ENCODE_TYPE(uint32,	Buf,	0);
		VARSTRUCT_ENCODE_STRING(	Buf,	GetName());

		_pkt(TRADING__BARTER, outapp);
		QueuePacket(outapp);
		safe_delete(outapp);
	}

}

void Client::BuyerItemSearch(const EQApplicationPacket *app) {

	BuyerItemSearch_Struct* bis = (BuyerItemSearch_Struct*)app->pBuffer;

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_Barter, sizeof(BuyerItemSearchResults_Struct));

	BuyerItemSearchResults_Struct* bisr = (BuyerItemSearchResults_Struct*)outapp->pBuffer;

	const Item_Struct* item = 0;

	int Count=0;

	char Name[64];
	char Criteria[255];

	strn0cpy(Criteria, bis->SearchString, sizeof(Criteria));

	strupr(Criteria);

	char* pdest;

	int32 it = 0;

	while ((item = database.IterateItems(&it))) {

		strn0cpy(Name, item->Name, sizeof(Name));

		strupr(Name);

		pdest = strstr(Name, Criteria);

		if (pdest != NULL) {
			sprintf(bisr->Results[Count].ItemName, item->Name);
			bisr->Results[Count].ItemID = item->ID;
			bisr->Results[Count].Unknown068 = item->Icon;
			bisr->Results[Count].Unknown072 = 0x00000000;
			Count++;
		}
		if (Count == MAX_BUYER_ITEMSEARCH_RESULTS)
			break;
	}
	if (Count == MAX_BUYER_ITEMSEARCH_RESULTS)
		Message(15, "Your search returned more than %i results. Only the first %i are displayed.",
			    MAX_BUYER_ITEMSEARCH_RESULTS, MAX_BUYER_ITEMSEARCH_RESULTS);

	bisr->Action = Barter_BuyerSearch;
	bisr->ResultCount = Count;

	_pkt(TRADING__BARTER, outapp);
	QueuePacket(outapp);
	safe_delete(outapp);
}

