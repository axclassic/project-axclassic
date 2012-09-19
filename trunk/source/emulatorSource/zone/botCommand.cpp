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
	
 Angelox: This file separates the bot commands from the client ones. 
*/

// Franck-add: EQoffline
#ifdef EQBOTS
#include <string.h>
#include <stdlib.h>

#ifdef WIN32
#define strcasecmp _stricmp
#endif

#include "../common/debug.h"
#include "../common/ptimer.h"
#include "../common/packet_functions.h"
#include "../common/packet_dump.h"
#include "../common/serverinfo.h"
#include "../common/files.h"
#include "../common/opcodemgr.h"
#include "../common/EQPacket.h"
#include "../common/guilds.h"
#include "../common/rulesys.h"
//#include "../common/servertalk.h" // for oocmute and revoke
#include "worldserver.h"
#include "masterentity.h"
#include "map.h"
#include "watermap.h"
#include "features.h"
#include "pathing.h"
#include "client_logs.h"
#include "guild_mgr.h"
#include "titles.h"
#include "../common/patches/patches.h"

#include "mob.h"
#include "StringIDs.h"
#include "botRaids.h"

void command_botmode(Client *c, const Seperator *sep) {
 if((c->IsGrouped()) || (c->IsBotRaiding())){
    c->Message(15, "Disband your group or raid first.");
    return;
  }
   //Initialize the variable in the database. 
   int charid = c->CharacterID();
   database.BotClientModeLookup(charid); //Auto sets to 1
    
   if(!strcasecmp(sep->arg[1], "client")){
     c->Message(15, "Bots are in client mode");
     c->SetbotNpcMode(false);
     database.UpdateBotClientMode(2,charid);
   }
   else if(!strcasecmp(sep->arg[1], "npc")){
     c->Message(15, "Bots are in npc mode.");
     c->SetbotNpcMode(true);
     database.UpdateBotClientMode(1,charid);
   }
   else if(sep->arg[1][0] == '\0')      
    c->Message(15, "Usage: #botmode [client] or [npc].");
   else
    c->Message(15, "Usage: #botmode [client] or [npc].");
}
Timer CheckPacify(0);

//Angelox: Moved all the Bot comands from command.cpp to here.
void command_bot(Client *c, const Seperator *sep) {
  
	std::string TempErrorMessage;
//General Variables
	Mob *t = c->GetTarget();
	Mob *target = c->GetTarget();
	int BotLevel = c->GetLevel();
	bool Special = (RuleB(EQOffline, AXCustom));
	int classicStat = database.Classic2012Lookup();
//End General Variables	
	if(c->GetFeigned()) { //Angelox: General block for FD.
		c->Message(15, "Bot commands of any type not permitted while you are feigned.");
		return;
	}
	if ((Special) && (sep->arg[1][0] == '\0')){
		if(BotLevel <= 3){ 
			entity_list.BotHelpWindow(c,1);
		}
		c->Message(15, "To make a bot, type #bot create [name] [class(id)] [race(id)] [gender (male/female)]");
		c->Message(15, "Type [bot] [create] [help] for more details.");
		c->Message(15, "Be sure to talk to Aediles and Anita Thrall for bot activation and spells.");
		c->Message(15, "Type #bot help for a list of available commands.");
		return;
	}
	else if (sep->arg[1][0] == '\0') {
		c->Message(15, "Bad argument, type #bot help");
		return;
	}
	if(!strcasecmp( sep->arg[1], "help") && !strcasecmp( sep->arg[2], "\0")){
		if(BotLevel <= 2){ 
			entity_list.BotHelpWindow(c,1);
		}
		c->Message(15, "List of global commands available for bots :");
		c->Message(15, "#bot help - show this");
		c->Message(15, "#bot help [class] - will show bots class specific commands.");
		c->Message(15, "#bot create [name] [class (id)] [race (id)] [model (male/female)] - create a permanent bot. See #bot help create.");
		c->Message(15, "#bot call [bot name] - spawns your bot when called by its name (can also use Bot ID instead of name). ");
		c->Message(15, "#bot spawn [bot name] - same as [#bot call], (use #bot list to see all of your bots). ");
		c->Message(15, "#bot disbandgroup - forces the disbandment of your current group.");
		c->Message(15, "#bot spawngroup [0] and up - spawns and groups any of the requested group numbers, defaults to 20.");
		c->Message(15, "#bot savegroup [0] and up - saves or changes to the requested group number (0 -19 are used for raid groups).");
		c->Message(15, "#bot showgroups [normal] [raid] - Displays your list of bots with their groups that are saved in the database.");
		c->Message(15, "#bot delete - completely destroy forever the targeted bot and all its items.");
		c->Message(15, "#bot list [all/class(1-16)] - list your bots all or by class. Classes: 1(Warrior), 2(Cleric), 3(Paladin), 4(Ranger), 5(Sk), 6(Druid), 7(Monk), 8(Bard), 9(Rogue), 10(Shaman), 11(Necro), 12(Wiz), 13(Mag), 14(Ench), 15(Beast), 16(Bersek)");
		c->Message(15, "#bot add - make the targetted bot joining your group.");
		c->Message(15, "#bot [follow/guard/attack (target)] - Give orders [follow/guard/attack (target)] to your grouped bots.");
		c->Message(15, "#bot assist (target) - Will change your bot group to attack your new target during a melee encounter.");
		c->Message(15, "#bot assist single (target) - Will change one fighter bot to attack your new target during a melee encounter.");
		c->Message(15, "#bot summon [bot],[group],[corpse],[food],or [drink] - Will summon one or all your grouped bots to you, or corpse (needs Necro), or food/drink.");
		c->Message(15, "#bot move - works just like summon, but summons all your bots behind you, in a line.");
		c->Message(15, "#bot inventory list - show the inventory (and the slots IDs) of the targetted bot.");
		c->Message(15, "#bot unequip [slot name] or [slotid] - remove the item at the given slot in the inventory of the targetted bot.");
		c->Message(15, "#bot remove - same as unequip.");
		c->Message(15, "#bot update - you must type that command once you gain a level.");
		c->Message(15, "#bot raid [commands] (#bot raid help will show some help).");
		c->Message(15, "#bot saveraid - save your current group(s) of bots.");
		c->Message(15, "#bot spawnraid - spawns your saved bots.");
		c->Message(15, "#bot groupraid - groups your spawned bots.");
		c->Message(15, "#bot augmentitem - allows you to augment items for other classes. You must have the Augmentation Sealer window filled.");
		c->Message(15, "#bot title - Inputs any thing you want (in 4 words), below the bots name.");
		// fez_ajer: Add auto commands to help menu
		c->Message(15, "#bot auto [commands] (#bot auto help will show some help).");
		c->Message(15, "#bot set [primary], [snare] [on] or [off], [root] [on] or [off], [chat] [on] or [off] - enable primary slot for range item, enable/disable root, snare, chat.");
		c->Message(15, "#bot set [taunt], [on] [off] [warrior] [paladin] [sk] [ranger] or [bard] -Sets taunt skill.");
		c->Message(15, "#bot mana - displays a mana report for all your spawned bots.");
		c->Message(15, "#bot buffs - shows buffs on the targetted bot.");		
		c->Message(15, "#bot offtank - attempts to find a bot to offtank the targetted mob.");
		c->Message(15, "#bot battlerez - periodically ressurect your fallen bots.");
		c->Message(15, "#bot change [face], [hair], [haircolor], [beard], [beardcolor], [eyes] and <value> - Change your Bots appearance.");
		c->Message(15, "#botmode - Toggle between client look, [client] or the default [npc].");
		c->Message(15, "For class specific commands, type bot and the class (Example: [bot] [cleric]).");
		return;
	}

//BotHelp
	if((!strcasecmp(sep->arg[1], "cleric")) || (!strcasecmp( sep->arg[1], "help") && !strcasecmp( sep->arg[2], "cleric"))) {
		c->Message(15, "--------- Additional Cleric Commands--------------------");
	    c->Message(15, "#bot heal - Heals your target.");
	    c->Message(15, "#bot cheal - Complete heals your target, use healers name from any Cleric in your group or raid.");
	    c->Message(15, "#bot sheal - Heals your target, use healers name from any Cleric in your group or raid.");
	    c->Message(15, "#bot petheal - Heals any pet/target, use healers name from any Cleric in your group or raid.");
	    c->Message(15, "#bot healme - Heals yourself.");
	    c->Message(15, "#bot gheal - Heals all of your group.");
	    c->Message(15, "#bot rez - Revives your dead character.");
	    c->Message(15, "#bot temperance - Buffs your target.");
	    c->Message(15, "#bot pacify - Calms your target.");
	    c->Message(15, "#bot bindme - Binds your target. ");
	    c->Message(15, "#bot cure - cures your target.");
	    c->Message(15, "#bot summon - [food/drink] for your target.");	    
	    c->Message(15, "#bot resist - Buffs your target with resist of choice.");
	    c->Message(15, "----------------------------------------------------------------------");
	    entity_list.BotHelpWindow(c,2);
	    return;
	}
	if((!strcasecmp(sep->arg[1], "wizard")) || (!strcasecmp( sep->arg[1], "help") && !strcasecmp( sep->arg[2], "wizard"))) {  
	    c->Message(15, "--------- Additional Wizard Commands-------------------- ");
	    c->Message(15, "#bot invis - Will make you invisible");
	    c->Message(15, "#bot gate - Port you to certain areas.");
	    c->Message(15, "#bot levitate - Provides levitation for your target.");
	    c->Message(15, "#bot lore - cast Identify on the item on your mouse pointer.");
	    c->Message(15, "-----------------------------------------------------------------------");
	    entity_list.BotHelpWindow(c,3);
	    return;
	}
	if((!strcasecmp(sep->arg[1], "ranger")) || (!strcasecmp( sep->arg[1], "help") && !strcasecmp( sep->arg[2], "ranger"))) { 
	    c->Message(15, "--------- Additional Ranger Commands-------------------- ");
	    c->Message(15, "#bot sow - Will buff any target with SoW.");
	    c->Message(15, "#bot track - Opens up a tracking window.");
	    c->Message(15, "#bot archery - Causes the ranger to swap to his bow (if he has one)");
	    c->Message(15, "#bot endureb - Can breathe under water");
	    c->Message(15, "#bot levitate - Provides levitation for your target.");
	    c->Message(15, "-----------------------------------------------------------------------");
	    entity_list.BotHelpWindow(c,4);
	    return;
	}
	if((!strcasecmp(sep->arg[1], "druid")) || (!strcasecmp( sep->arg[1], "help") && !strcasecmp( sep->arg[2], "druid"))) { 	
	    c->Message(15, "--------- Additional Druid Commands-------------------- ");
	    c->Message(15, "#bot gate - Port you to certain areas.");
	    c->Message(15, "#bot sow - Will buff any target with SoW");
	    c->Message(15, "#bot endureb - Can breathe under water");
	    c->Message(15, "#bot invis - Will make you invisible");
	    c->Message(15, "#bot track - Opens up a tracking window.");
	    c->Message(15, "#bot sheal - Heals your target, use healers name from any Druid in your group or raid.");
	    c->Message(15, "#bot petheal - Heals any pet/target, use healers name from any Druid in your group or raid.");
	    c->Message(15, "#bot heal - Heals your target.");
	    c->Message(15, "#bot healme - Heals yourself.");
	    c->Message(15, "#bot evac - Evacuates you to a safespot in the zone");
	    c->Message(15, "#bot cure - cures your target.");
	    c->Message(15, "#bot resist - Buffs your target with resist of choice.");
	    c->Message(15, "#bot charm - Turns your target into the bots pet.");
	    c->Message(15, "#bot levitate - Provides levitation for your target.");
	    c->Message(15, "#bot skin - Buffs target with hitpoints and more and more.");
	    c->Message(15, "#bot summon - [food/drink] for your target.");	    
	    c->Message(15, "----------------------------------------------------------------------");
	    entity_list.BotHelpWindow(c,5);
	    return;
	}
	if((!strcasecmp(sep->arg[1], "shaman")) || (!strcasecmp( sep->arg[1], "help") && !strcasecmp( sep->arg[2], "shaman"))) { 
	    c->Message(15, "--------- Additional Shaman Commands-------------------- ");
	    c->Message(15, "#bot sow - Will buff any target with SoW");
	    c->Message(15, "#bot invis - Will make you invisible");
	    c->Message(15, "#bot sheal - Heals your target, use healers name from any Shaman in your group or raid.");
	    c->Message(15, "#bot petheal - Heals any pet/target, use healers name from any Shaman in your group or raid.");
	    c->Message(15, "#bot heal - Heals your target.");
	    c->Message(15, "#bot healme - Heals yourself.");
	    c->Message(15, "#bot endureb - Can breathe under water");
	    c->Message(15, "#bot cure - cures your target.");
	    c->Message(15, "#bot resist - Buffs your target with resist of choice.");
	    c->Message(15, "#bot slow - Slows your targets attack rate.");
	    c->Message(15, "#bot shrink - Shrinks your target.");
	    c->Message(15, "#bot levitate - Provides levitation for your target.");
	    c->Message(15, "#bot summon - [food/drink] for your target.");	    
	    c->Message(15, "-----------------------------------------------------------------------");
	    entity_list.BotHelpWindow(c,6);
	    return;
	}
	if((!strcasecmp(sep->arg[1], "necromancer")) || (!strcasecmp( sep->arg[1], "help") && !strcasecmp( sep->arg[2], "necromancer"))) { 
	    c->Message(15, "--------- Additional Necromancer Commands-------------------- ");
	    c->Message(15, "#bot levitate - Provides levitation for your target.");
	    c->Message(15, "#bot invis - Will make you invisible");
	    c->Message(15, "#bot charm - Turns your target into the bots pet.");
	    c->Message(15, "#bot summon corpse - Summons your targets characters corpse to your feet. ");
	    c->Message(15, "#bot lore - Cast Identify on the item on your mouse pointer.");
	    c->Message(15, "#bot subvent - Replenish mana to your target.");	    
	    c->Message(15, "----------------------------------------------------------------------------");
	    entity_list.BotHelpWindow(c,7);
	    return;
	}
	if((!strcasecmp(sep->arg[1], "rogue")) || (!strcasecmp( sep->arg[1], "help") && !strcasecmp( sep->arg[2], "rogue"))) { 
	    c->Message(15, "--------- Additional Rogue Commands-------------------- ");
	    c->Message(15, "#bot picklock - opens locked doors.");
	    c->Message(15, "#bot archery - Causes the Rogue to swap to his bow (if he has one)");
	    c->Message(15, "----------------------------------------------------------------------");
	    entity_list.BotHelpWindow(c,8);
	    return;
	}
	if((!strcasecmp(sep->arg[1], "enchanter")) || (!strcasecmp( sep->arg[1], "help") && !strcasecmp( sep->arg[2], "enchanter"))) { 
	    c->Message(15, "--------- Additional Enchanter Commands-------------------- ");
	    c->Message(15, "#bot endureb - Can breathe under water");
	    c->Message(15, "#bot levitate - Provides levitation for your target.");
	    c->Message(15, "#bot slow - Slows your targets attack rate.");
	    c->Message(15, "#bot pacify - Calms your target.");
	    c->Message(15, "#bot rune - Buffs your target with the Run shield.");
	    c->Message(15, "#bot charm - Turns your target into the bots pet.");
	    c->Message(15, "#bot dire charm - Turns your target into the bots permanent pet. ");
	    c->Message(15, "#bot ai mez - Will stop attacks for a short time.");
	    c->Message(15, "#bot auto mez on/off - Will stop incoming adds to the melee.");	    
	    c->Message(15, "#bot tash - Cast Tashan type spell on target");
	    c->Message(15, "#bot wtash - Cast AE Wind of Tashani types on target");
	    c->Message(15, "--------------------------------------------------------------------------");
	    entity_list.BotHelpWindow(c,9);
	    return;
	}
	if((!strcasecmp(sep->arg[1], "Beastlord")) || (!strcasecmp( sep->arg[1], "help") && !strcasecmp( sep->arg[2], "Beastlord"))) { 
	    c->Message(15, "--------- Additional Beastlord Commands-------------------- ");
	    c->Message(15, "#bot slow - Slows your targets attack rate.");
	    c->Message(15, "#bot sow - Will buff any target with SoW");
	    c->Message(15, "#bot levitate - Provides levitation for your target.");
	    c->Message(15, "#bot shrink - Shrinks your target.");
	    c->Message(15, "#bot summon - [food/drink] for your target.");	    
	    c->Message(15, "--------------------------------------------------------------------------");
	    entity_list.BotHelpWindow(c,10);
	    return;
	}
	if((!strcasecmp(sep->arg[1], "bard")) || (!strcasecmp( sep->arg[1], "help") && !strcasecmp( sep->arg[2], "bard"))) { 
	    c->Message(15, "--------- Additional Bard Commands-------------------- ");
	    c->Message(15, "#bot track - Opens up a tracking window.");
	    c->Message(15, "#bot auto mez on/off - Will automatically stop incoming adds to the melee.");
	    c->Message(15, "#bot selos on/off - Will automatically start or stop Bard speed.");	    
	    c->Message(15, "---------------------------------------------------------------------");
	    entity_list.BotHelpWindow(c,11);
	    return;
	}
	if((!strcasecmp(sep->arg[1], "magician")) || (!strcasecmp( sep->arg[1], "help") && !strcasecmp( sep->arg[2], "magician"))) { 
	    c->Message(15, "--------- Additional Magician Commands-------------------- ");
	    c->Message(15, "#bot invis - Will make you invisible");
	    c->Message(15, "#bot magepet - Select which pet type you want.");
	    c->Message(15, "#bot levitate - Provides levitation for your target.");
	    c->Message(15, "#bot lore - cast Identify on the item on your mouse pointer.");
	    c->Message(15, "#bot summon - [food/drink] for your target.");	    
	    c->Message(15, "-------------------------------------------------------------------------");
	    entity_list.BotHelpWindow(c,12);
	    return;
	}

	if(!strcasecmp(sep->arg[1], "augmentitem")) {
		AugmentItem_Struct* in_augment = new AugmentItem_Struct[sizeof(AugmentItem_Struct)];
		in_augment->container_slot = 1000;
		in_augment->unknown02[0] = 0;
		in_augment->unknown02[1] = 0;
		in_augment->augment_slot = -1;
		Object::HandleAugmentation(c, in_augment, c->GetTradeskillObject());
		return;
	}

	if(!strcasecmp(sep->arg[1], "create")) {
//		bool Special = (RuleB(EQOffline, AXCustom));
		if ((Special) && (!strcasecmp(sep->arg[2], "help"))){
			c->Message(15, "------------------------------------------------------------------");
			c->Message(15, "Classes:  1(Warrior), 2(Cleric), 3(Paladin), 4(Ranger), 5(Sk), 6(Druid), 7(Monk), 8(Bard), 9(Rogue), 10(Shaman), 11(Necro), 12(Wiz), 13(Mag), 14(Ench), 15(Beast), 16(Bersek)");
			c->Message(15, "------------------------------------------------------------------");
			c->Message(15, "Races: 1(Human), 2(Barb), 3(Erudit), 4(Wood elf), 5(High elf), 6(Dark elf), 7(Half elf), 8(Dwarf), 9(Troll), 10(Ogre), 11(Halfling), 12(Gnome), 330(Froglok), 128(Iksar), 130(Vah shir)");
			c->Message(15, "------------------------------------------------------------------");
			c->Message(15, "Usage: #bot create [name] [class(1-16)] [race(1-12,128,130,330)] [gender(male/female)]");
			c->Message(15, "Example: #bot create Gandolf 12 1 male");
			return;
		}
		if(sep->arg[2][0] == '\0' || sep->arg[3][0] == '\0' || sep->arg[4][0] == '\0' || sep->arg[5][0] == '\0' || sep->arg[6][0] != '\0') {
			if (Special){
				c->Message(15, "Usage: #bot create [name] [class(id)] [race(id)] [gender (male/female)]");
				c->Message(15, "Type [bot] [create] [help] for more details.");
				c->Message(15, "Be sure to talk to Aediles and Anita Thrall for bot activation and spells.");
				return;
			}
			else{
				c->Message(15, "Usage: #bot create [name] [class(id)] [race(id)] [gender (male/female)]");
				return;
			}
		}
		else if(strcasecmp(sep->arg[3],"1") && strcasecmp(sep->arg[3],"2") && strcasecmp(sep->arg[3],"3") && strcasecmp(sep->arg[3],"4") && strcasecmp(sep->arg[3],"5") && strcasecmp(sep->arg[3],"6") && strcasecmp(sep->arg[3],"7") && strcasecmp(sep->arg[3],"8") && strcasecmp(sep->arg[3],"9") && strcasecmp(sep->arg[3],"10") && strcasecmp(sep->arg[3],"11") && strcasecmp(sep->arg[3],"12") && strcasecmp(sep->arg[3],"13") && strcasecmp(sep->arg[3],"14") && strcasecmp(sep->arg[3],"15") && strcasecmp(sep->arg[3],"16")) {
			c->Message(15, "Usage: #bot create [name] [class(id)] [race(id)] [gender (male/female)]");
			return;
		}		
		else if(strcasecmp(sep->arg[4],"1") && strcasecmp(sep->arg[4],"2") && strcasecmp(sep->arg[4],"3") && strcasecmp(sep->arg[4],"4") && strcasecmp(sep->arg[4],"5") && strcasecmp(sep->arg[4],"6") && strcasecmp(sep->arg[4],"7") && strcasecmp(sep->arg[4],"8") && strcasecmp(sep->arg[4],"9") && strcasecmp(sep->arg[4],"10") && strcasecmp(sep->arg[4],"11") && strcasecmp(sep->arg[4],"12") && strcasecmp(sep->arg[4],"330") && strcasecmp(sep->arg[4],"128") && strcasecmp(sep->arg[4],"130")) {
			c->Message(15, "Usage: #bot create [name] [class(1-16)] [race(1-12,128,130,330)] [gender (male/female)]");
			return;
		}
		else if(strcasecmp(sep->arg[5],"male") && strcasecmp(sep->arg[5],"female")) {
			c->Message(15, "Usage: #bot create [name] [class(1-16)] [race(1-12,128,130,330)] [gender (male/female)]");
			return;
		}
		
		if(database.CountBots(c->CharacterID()) >= RuleI(EQOffline, CreateBotCount)) {
			c->Message(15, "You cannot create more than %i bots.", RuleI(EQOffline, CreateBotCount));
			return;
		}
		// Check Race/Class combos
		int choosebclass = atoi(sep->arg[3]);
        int iRace = atoi(sep->arg[4]);
		bool isComboAllowed = false;
        switch(iRace) {
			case 1: // Human
				switch(choosebclass) {
					case 1: // Warrior
					case 2: // Cleric
					case 3: // Paladin
					case 4: // Ranger
					case 5: // Shadowknight
					case 6: // Druid
					case 7: // Monk
					case 8: // Bard
					case 9: // Rogue
					case 11: // Necromancer
					case 12: // Wizard
					case 13: // Magician
					case 14: // Enchanter
						isComboAllowed = true;
						break;
				}
				break;
			case 2: // Barbarian
				switch(choosebclass) {
					case 1: // Warrior
					case 9: // Rogue
					case 10: // Shaman
					case 15: // Beastlord
					case 16: // Berserker
						isComboAllowed = true;
						break;
				}
				break;
			case 3: // Erudite
				switch(choosebclass) {
					case 2: // Cleric
					case 3: // Paladin
					case 5: // Shadowknight
					case 11: // Necromancer
					case 12: // Wizard
					case 13: // Magician
					case 14: // Enchanter
						isComboAllowed = true;
						break;
				}
				break;
			case 4: // Wood Elf
				switch(choosebclass) {
					case 1: // Warrior
					case 4: // Ranger
					case 6: // Druid
					case 8: // Bard
					case 9: // Rogue
						isComboAllowed = true;
						break;
				}
				break;
			case 5: // High Elf
				switch(choosebclass) {
					case 2: // Cleric
					case 3: // Paladin
					case 12: // Wizard
					case 13: // Magician
					case 14: // Enchanter
						isComboAllowed = true;
						break;
				}
				break;
			case 6: // Dark Elf
				switch(choosebclass) {
					case 1: // Warrior
					case 2: // Cleric
					case 5: // Shadowknight
					case 9: // Rogue
					case 11: // Necromancer
					case 12: // Wizard
					case 13: // Magician
					case 14: // Enchanter
						isComboAllowed = true;
						break;
				}
				break;
			case 7: // Half Elf
				switch(choosebclass) {
					case 1: // Warrior
					case 3: // Paladin
					case 4: // Ranger
					case 6: // Druid
					case 8: // Bard
					case 9: // Rogue
						isComboAllowed = true;
						break;
				}
				break;
			case 8: // Dwarf
				switch(choosebclass) {
					case 1: // Warrior
					case 2: // Cleric
					case 3: // Paladin
					case 9: // Rogue
					case 16: // Berserker
						isComboAllowed = true;
						break;
				}
				break;
			case 9: // Troll
				switch(choosebclass) {
					case 1: // Warrior
					case 5: // Shadowknight
					case 10: // Shaman
					case 15: // Beastlord
					case 16: // Berserker
						isComboAllowed = true;
						break;
				}
				break;
			case 10: // Ogre
				switch(choosebclass) {
					case 1: // Warrior
					case 5: // Shadowknight
					case 10: // Shaman
					case 15: // Beastlord
					case 16: // Berserker
						isComboAllowed = true;
						break;
				}
				break;
			case 11: // Halfling
				switch(choosebclass) {
					case 1: // Warrior
					case 2: // Cleric
					case 3: // Paladin
					case 4: // Ranger
					case 6: // Druid
					case 9: // Rogue
						isComboAllowed = true;
						break;
				}
				break;
			case 12: // Gnome
				switch(choosebclass) {
					case 1: // Warrior
					case 2: // Cleric
					case 3: // Paladin
					case 5: // Shadowknight
					case 9: // Rogue
					case 11: // Necromancer
					case 12: // Wizard
					case 13: // Magician
					case 14: // Enchanter
						isComboAllowed = true;
						break;
				}
				break;
			case 128: // Iksar
				switch(choosebclass) {
					case 1: // Warrior
					case 5: // Shadowknight
					case 7: // Monk
					case 10: // Shaman
					case 11: // Necromancer
					case 15: // Beastlord
						isComboAllowed = true;
						break;
				}
				break;
			case 130: // Vah Shir
				switch(choosebclass) {
					case 1: // Warrior
					case 8: // Bard
					case 9: // Rogue
					case 10: // Shaman
					case 15: // Beastlord
					case 16: // Berserker
						isComboAllowed = true;
						break;
				}
				break;
			case 330: // Froglok
				switch(choosebclass) {
					case 1: // Warrior
					case 2: // Cleric
					case 3: // Paladin
					case 5: // Shadowknight
					case 9: // Rogue
					case 10: // Shaman
					case 11: // Necromancer
					case 12: // Wizard
						isComboAllowed = true;
						break;
				}
				break;
        }
		if(!isComboAllowed) {
			c->Message(15, "That Race/Class combination cannot be created.");
			return;
		}

		const char* botName = sep->arg[2];
		if(!botName || (strlen(botName) < 4) || (strlen(botName) > 40)) {
			c->Message(15, "%s is too many characters.", botName);
			return;
		}

		for(int i=0; botName[i]; i++) {
			if(!isalpha(botName[i])) {
				if(botName[i] != '_') {
					c->Message(15, "%s can only use A-Z, a-z and _ ", botName);
					return;
				}
			}
		}

		int spellid = 0;
		// base stats
		uint16 bstr = 75;
		uint16 bsta = 75;
		uint16 bdex = 75;
		uint16 bagi = 75;
		uint16 bwis = 75;
		uint16 bint = 75;
		uint16 bcha = 75;
		uint16 ATK = 5;
		sint16 MR = 25;
		sint16 FR = 25;
		sint16 DR = 15;
		sint16 PR = 15;
		sint16 CR = 25;

        switch(choosebclass) {
            case 1: // Warrior
				bstr += 10;
				bsta += 20;
				bagi += 10;
				bdex += 10;
				ATK += 12;
				MR += (1 / 2 + 1);
                break;
            case 2: // Cleric
                spellid = 701;
				bstr += 5;
				bsta += 5;
				bagi += 10;
				bwis += 30;
				ATK += 8;
                break;
            case 3: // Paladin
                spellid = 708;
				bstr += 15;
				bsta += 5;
				bwis += 15;
				bcha += 10;
				bdex += 5;
				ATK =+ 17;
				DR += 8;
                break;
            case 4: // Ranger
                spellid = 710;
				bstr += 15;
				bsta += 10;
				bagi += 10;
				bwis += 15;
				ATK += 17;
				FR += 4;
				CR += 4;
                break;
            case 5: // Shadowknight
                spellid = 709;
				bstr += 10;
				bsta += 15;
				bint += 20;
				bcha += 5;
				ATK += 17;
				PR += 4;
				DR += 4;
                break;
            case 6: // Druid
                spellid = 707;
				bsta += 15;
				bwis += 35;
				ATK += 5;
                break;
            case 7: // Monk
				bstr += 5;
				bsta += 15;
				bagi += 15;
				bdex += 15;
				ATK += 17;
                break;
            case 8: // Bard
				spellid = 711;
				bstr += 15;
				bdex += 10;
				bcha += 15;
				bint += 10;
				ATK += 17;
                break;
            case 9: // Rogue
				bstr += 10;
				bsta += 20;
				bagi += 10;
				bdex += 10;
				ATK += 12;
				PR += 8;
                break;
            case 10: // Shaman
                spellid = 706;
				bsta += 10;
				bwis += 30;
				bcha += 10;
				ATK += 28;
                break;
            case 11: // Necromancer
                spellid = 703;
				bdex += 10;
				bagi += 10;
				bint += 30;
				ATK += 5;
                break;
            case 12: // Wizard
                spellid = 702;
				bsta += 20;
				bint += 30;
				ATK += 5;
                break;
            case 13: // Magician
                spellid = 704;
				bsta += 20;
				bint += 30;
				ATK += 5;
                break;
            case 14: // Enchanter
                spellid = 705;
				bint += 25;
				bcha += 25;
				ATK += 5;
                break;
            case 15: // Beastlord
                spellid = 712;
				bsta += 10;
				bagi += 10;
				bdex += 5;
				bwis += 20;
				bcha += 5;
				ATK += 31;
				break;
            case 16: // Berserker
				bstr += 10;
				bsta += 15;
				bdex += 15;
				bagi += 10;
				ATK += 25;
				break;
        }

		int gender = 0;
		if(!strcasecmp(sep->arg[5], "female"))
			gender = 1;

		float bsize = 6;
        switch(iRace) {
			case 1: // Humans have no race bonus
				break;
			case 2: // Barbarian
				bstr += 28;
				bsta += 20;
				bagi += 7;
				bdex -= 5;
				bwis -= 5;
				bint -= 10;
				bcha -= 20;
				bsize = 7;
				CR += 10;
				break;
			case 3: // Erudite
				bstr -= 15;
				bsta -= 5;
				bagi -= 5;
				bdex -= 5;
				bwis += 8;
				bint += 32;
				bcha -= 5;
				MR += 5;
				DR -= 5;
				break;
			case 4: // Wood Elf
				bstr -= 10;
				bsta -= 10;
				bagi += 20;
				bdex += 5;
				bwis += 5;
                bsize = 5;
				break;
			case 5: // High Elf
				bstr -= 20;
				bsta -= 10;
				bagi += 10;
				bdex -= 5;
				bwis += 20;
				bint += 12;
				bcha += 5;
				break;
			case 6: // Dark Elf
				bstr -= 15;
				bsta -= 10;
				bagi += 15;
				bwis += 8;
				bint += 24;
				bcha -= 15;
                bsize = 5;
				break;
			case 7: // Half Elf
				bstr -= 5;
				bsta -= 5;
				bagi += 15;
				bdex += 10;
				bwis -= 15;
                bsize = 5.5;
				break;
			case 8: // Dwarf
				bstr += 15;
				bsta += 15;
				bagi -= 5;
				bdex += 15;
				bwis += 8;
				bint -= 15;
				bcha -= 30;
                bsize = 4;
				MR -= 5;
				PR += 5;
				break;
			case 9: // Troll
				bstr += 33;
				bsta += 34;
				bagi += 8;
				bwis -= 15;
				bint -= 23;
				bcha -= 35;
                bsize = 8;
				FR -= 20;
				break;
			case 10: // Ogre
				bstr += 55;
				bsta += 77;
				bagi -= 5;
				bdex -= 5;
				bwis -= 8;
				bint -= 15;
				bcha -= 38;
                bsize = 9;
				break;
			case 11: // Halfling
				bstr -= 5;
				bagi += 20;
				bdex += 15;
				bwis += 5;
				bint -= 8;
				bcha -= 25;
                bsize = 3.5;
				PR += 5;
				DR += 5;
				break;
			case 12: // Gnome
				bstr -= 15;
				bsta -= 5;
				bagi += 10;
				bdex += 10;
				bwis -= 8;
				bint += 23;
				bcha -= 15;
                bsize = 3;
				break;
			case 128: // Iksar
				bstr -= 5;
				bsta -= 5;
				bagi += 15;
				bdex += 10;
				bwis += 5;
				bcha -= 20;
				MR -= 5;
				FR -= 5;
				break;
			case 130: // Vah Shir
				bstr += 15;
				bagi += 15;
				bdex -= 5;
				bwis -= 5;
				bint -= 10;
				bcha -= 10;
                bsize = 7;
				MR -= 5;
				FR -= 5;
				break;
			case 330: // Froglok
				bstr -= 5;
				bsta += 5;
				bagi += 25;
				bdex += 25;
				bcha -= 25;
                bsize = 5;
				MR -= 5;
				FR -= 5;
				break;
        }

		// Randomize facial appearance
		int iFace = 0;
		if(iRace == 2) { // Barbarian w/Tatoo
			iFace = MakeRandomInt(0, 79);
		}
		else {
			iFace = MakeRandomInt(0, 7);
		}
		int iHair = 0;
		int iBeard = 0;
		int iBeardColor = 1;
		if(gender) {
			iHair = MakeRandomInt(0, 2);
			if(iRace == 8) { // Dwarven Females can have a beard
				if(MakeRandomInt(1, 100) < 50) {
					iFace += 10;
				}
			}
		}
		else {
			iHair = MakeRandomInt(0, 3);
			iBeard = MakeRandomInt(0, 5);
			iBeardColor = MakeRandomInt(0, 19);
		}
		int iHairColor = MakeRandomInt(0, 19);
		int iEyeColor1 = MakeRandomInt(0, 9);
		int iEyeColor2 = 0;
		if(MakeRandomInt(1, 100) > 96) {
			iEyeColor2 = MakeRandomInt(0, 9);
		}
		else {
			iEyeColor2 = iEyeColor1;
		}

		// Base AC
		int bac = (1 * 3) * 4;
		switch(choosebclass) {
			case WARRIOR:
			case SHADOWKNIGHT:
			case PALADIN:
				bac = bac*1.5;
		}

		// Calc Base Hit Points
		int16 multiplier = 1;
		switch(choosebclass) {
			case WARRIOR:
				multiplier = 220;
				break;
			case DRUID:
			case CLERIC:
			case SHAMAN:
				multiplier = 150;
				break;
			case BERSERKER:
			case PALADIN:
			case SHADOWKNIGHT:
				multiplier = 210;
				break;
			case MONK:
			case BARD:
			case ROGUE:
			case BEASTLORD:
				multiplier = 180;
				break;
			case RANGER:
				multiplier = 200;
				break;
			case MAGICIAN:
			case WIZARD:
			case NECROMANCER:
			case ENCHANTER:
				multiplier = 120;
				break;
		}
		int16 lm = multiplier;
		int16 Post255;
		if((bsta-255)/2 > 0)
			Post255 = (bsta-255)/2;
		else
			Post255 = 0;
		int base_hp = (5)+(1*lm/10) + (((bsta-Post255)*1*lm/3000)) + ((Post255*1)*lm/6000);

		// save bot to the database
		char errbuf[MYSQL_ERRMSG_SIZE];
		char *query = 0;
		MYSQL_RES *result;
		MYSQL_ROW row;
		const char* lname = "";

		if(database.RunQuery(query, MakeAnyLenString(&query, "SELECT count(*) FROM npc_types WHERE name like '%s'", sep->arg[2]), errbuf, &result)) {
			row = mysql_fetch_row(result);
			if(atoi(row[0]) != 0) {
				c->Message(15, "%s already exists, try a different name.", sep->arg[2]);
			}
			else if(database.RunQuery(query, MakeAnyLenString(&query, "SELECT count(*) FROM character_ WHERE name like '%s'", sep->arg[2]), errbuf, &result)) {
				row = mysql_fetch_row(result);
				if(atoi(row[0]) != 0) {
					c->Message(15, "%s already exists, try a different name.", sep->arg[2]);
				}
				else if(database.RunQuery(query, MakeAnyLenString(&query, "INSERT INTO npc_types (name,lastname,level,race,class,bodytype,hp,gender,size,hp_regen_rate,mana_regen_rate,npc_spells_id,npc_faction_id,face,luclin_hairstyle,luclin_haircolor,luclin_eyecolor,luclin_eyecolor2,luclin_beardcolor,luclin_beard,runspeed,MR,CR,DR,FR,PR,AC,STR,STA,DEX,AGI,_INT,WIS,CHA,isbot,ATK) VALUES ('%s','%s', %i, %i, %i, %i, %i, %i, %f, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %f, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i)", botName,lname,1,atoi(sep->arg[4]),atoi(sep->arg[3]),1,base_hp,gender,bsize,0,0,spellid,0,iFace,iHair,iHairColor,iEyeColor1,iEyeColor2,iBeardColor,iBeard,2.501f,MR,CR,DR,FR,PR,bac,bstr,bsta,bdex,bagi,bint,bwis,bcha,1,ATK), errbuf, 0)) {
					if(database.RunQuery(query, MakeAnyLenString(&query, "SELECT MAX(id) from npc_types where name='%s' and isBot=1", sep->arg[2]), errbuf, &result)) {
						if(row = mysql_fetch_row(result)) {
							database.SetBotOwner(atoi(row[0]), c->CharacterID()); 
							c->Message(15, "Bot created: %s", row[0]);
						}
					}
				}
				else {
					c->Message(15, "Error while creating your bot... %s", errbuf);
				}
			}
		}
		else {
			c->Message(15, "Error while creating your bot... %s", errbuf);
		}
		safe_delete_array(query);
		mysql_free_result(result);
        return;
	}

	if(!strcasecmp(sep->arg[1], "help") && !strcasecmp(sep->arg[2], "create") ){
		c->Message(15, "Classes:  1(Warrior), 2(Cleric), 3(Paladin), 4(Ranger), 5(Sk), 6(Druid), 7(Monk), 8(Bard), 9(Rogue), 10(Shaman), 11(Necro), 12(Wiz), 13(Mag), 14(Ench), 15(Beast), 16(Bersek)");
		c->Message(15, "------------------------------------------------------------------");
		c->Message(15, "Races: 1(Human), 2(Barb), 3(Erudit), 4(Wood elf), 5(High elf), 6(Dark elf), 7(Half elf), 8(Dwarf), 9(Troll), 10(Ogre), 11(Halfling), 12(Gnome), 330(Froglok), 128(Iksar), 130(Vah shir)");
		c->Message(15, "------------------------------------------------------------------");
		c->Message(15, "Usage: #bot create [name] [class(1-16)] [race(1-12,128,130,330)] [gender(male/female)]");
		c->Message(15, "Example: #bot create Gandolf 12 1 male");
		return;
	}

	if((!strcasecmp(sep->arg[1], "delete")) && (!strcasecmp(sep->arg[2], "now"))) {
		if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot()){
            c->Message(15, "You must target a bot!");
			return;
		}
		else if(database.GetBotOwner(c->GetTarget()->GetNPCTypeID()) != c->CharacterID()) {
            c->Message(15, "You can't delete a bot that you don't own.");
			return;
		}
		if(database.DeleteBot(c->GetTarget()->GetNPCTypeID())) {
			c->GetTarget()->BotSay("...but why?!! We had such good adventures together! gaahhh...glrrrk...");
			c->GetTarget()->BotOwner = NULL;
			c->GetTarget()->BotKill();
		}
		else {
			c->Message(15, "Error deleting Bot!");
		}
		return;
	}
	if(!strcasecmp(sep->arg[1], "delete")) {
		if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot()) {
            c->Message(15, "You must target a bot!");
			return;
		}
		else if(database.GetBotOwner(c->GetTarget()->GetNPCTypeID()) != c->CharacterID()) {
            c->Message(15, "You can't delete a bot that you don't own.");
			return;
		}	  
		c->GetTarget()->BotSay("Are you SURE you want to delete me? You can't restore me once I'm deleted!");
		c->Message(15, "If you are sure this is the right bot and you want to permanently erase it from the database, use \"#bot delete now\"");
		return;
	}
//List
	if(!strcasecmp(sep->arg[1], "list")) {
		c->Message(15, "List of bots you created are,");
		bool listAll = true;
		int iClass = atoi(sep->arg[2]);
		switch(iClass) {
			case 1:
			case 2:
			case 3:
			case 4:
			case 5:
			case 6:
			case 7:
			case 8:
			case 9:
			case 10:
			case 11:
			case 12:
			case 13:
			case 14:
			case 15:
			case 16:
				listAll = false;
				break;
			default:
				break;
		}

		char errbuf[MYSQL_ERRMSG_SIZE];
		char *query = 0;
		int32 affected_rows = 0;
		MYSQL_RES *result;
		MYSQL_ROW row;

		if(database.RunQuery(query, MakeAnyLenString(&query, "SELECT id, name, class, race from npc_types where isbot=1"), errbuf, &result, &affected_rows))
        {

            while(row = mysql_fetch_row(result))
            {
                // change the class ID by the name
				int irow = atoi(row[2]);
				const char *crow;

                switch(irow) {
                    case 1:
                        crow = "Warrior";
                        break;
                    case 2:
                        crow = "Cleric";
                        break;
                    case 3:
                        crow = "Paladin";
                        break;
                    case 4:
                        crow = "Ranger";
                        break;
                    case 5:
                        crow = "Shadows Knight";
                        break;
                    case 6:
                        crow = "Druid";
                        break;
                    case 7:
                        crow = "Monk";
                        break;
                    case 8:
                        crow = "Bard";
                        break;
                    case 9:
                        crow = "Rogue";
                        break;
                    case 10:
                        crow = "Shaman";
                        break;
                    case 11:
                        crow = "Necromancer";
                        break;
                    case 12:
                        crow = "Wizard";
                        break;
                    case 13:
                        crow = "Magician";
                        break;
                    case 14:
                        crow = "Enchanter";
                        break;
                    case 15:
                        crow = "Beastlord";
                        break;
                    case 16:
                        crow = "Berserker";
                        break;
                    default:
                        crow = "Warrior";
                }
			
				// change the race ID by the name
				int rrow = atoi(row[3]);
				const char *rrrow;
	
                switch(rrow) {
                    case 1:
                        rrrow = "Human";
                        break;
                    case 2:
                        rrrow = "Barbarian";
                        break;
                    case 3:
                        rrrow = "Erudite";
                        break;
                    case 4:
                        rrrow = "Wood Elf";
                        break;
                    case 5:
                        rrrow = "High Elf";
                        break;
                    case 6:
                        rrrow = "Dark Elf";
                        break;
                    case 7:
                        rrrow = "Half Elf";
                        break;
                    case 8:
                        rrrow = "Dwarf";
                        break;
                    case 9:
                        rrrow = "Troll";
                        break;
                    case 10:
                        rrrow = "Ogre";
                        break;
                    case 11:
                        rrrow = "Halfling";
                        break;
                    case 12:
                        rrrow = "Gnome";
                        break;
                    case 330:
                        rrrow = "Froglok";
                        break;
                    case 128:
                        rrrow = "Iksar";
                        break;
                    case 130:
                        rrrow = "Vah Shir";
                        break;
                    default:
                        rrrow = "Human";
                }

				if(listAll && database.GetBotOwner(atoi(row[0])) == c->CharacterID()) { 
					c->Message(15,"ID: %s -- Class: %s -- Name: %s -- Race: %s -- ", row[0], crow, row[1], rrrow);
				}
				else if((database.GetBotOwner(atoi(row[0])) == c->CharacterID()) && (irow == iClass)) { 
					c->Message(15,"ID: %s -- Class: %s -- Name: %s -- Race: %s -- ", row[0], crow, row[1], rrrow);
				}
			}				
		}
		mysql_free_result(result);
		safe_delete_array(query);
		return;
	}

//SpawnOneBot by name or by id
	if ((!strcasecmp(sep->arg[1], "spawn") ) || (!strcasecmp(sep->arg[1], "call"))) {
		uint32 botIdByName = (database.GetBotIDByBotName(std::string(sep->arg[2])));
		uint32 botOwnerId1 = (database.GetBotOwner(botIdByName));
		uint32 botOwnerId2 = (database.GetBotOwner(atoi(sep->arg[2])));
		uint32 botOwnerId3 = 0;
		uint32 botId = 0;
		if ((botOwnerId1) != (c->CharacterID()))
			botOwnerId3 = (database.GetBotOwner(atoi(sep->arg[2])));
		else
			botOwnerId3 = (database.GetBotOwner(botIdByName));
		if ((botOwnerId1) != (c->CharacterID()))
			botId = (atoi(sep->arg[2]));
		else
			botId = (database.GetBotIDByBotName(std::string(sep->arg[2])));
		if ((botOwnerId3)!= (c->CharacterID())){
			c->Message(15,"You can't spawn a bot that you don't own.");
			return;
		}

		if(c->GetFeigned()){
			c->Message(15, "You can't summon bots while you are feigned.");
			return;
		}

		if(c->GetAggroCount() > 0){
			c->Message(15, "You can't summon bots while a monster has aggro on you.");
			return;
		}
		if(c->IsBotRaiding()) {
			BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
			if(br) {
				if(br->GetBotRaidAggro()) {
					c->Message(15, "You can't summon bots while you are engaged.");
					return;
				}
			}
		}

		if(c->IsGrouped()){
			Group *g = entity_list.GetGroupByClient(c);
			for (int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g && g->members[i] && !g->members[i]->qglobal && 
				  (g->members[i]->GetAppearance() != eaDead) && g->members[i]->IsEngaged()){
				    c->Message(15, "You can't summon bots while you are engaged.");
					return;
				}
				if(g && g->members[i] && g->members[i]->qglobal) {
					return;
				}
			}
		}
		
		const NPCType* tmp = 0;
		if ((tmp = database.GetNPCType(botId))){
			Mob *mtmp = entity_list.GetMobByNpcTypeID(botId);
			if(mtmp && entity_list.IsMobInZone(mtmp)){
				c->Message(15, "This bot is already in the zone.");
				tmp = 0;
				mtmp = 0;
				return;
			}
			
			const int spawnedBots = database.SpawnedBotCount(c->CharacterID());
			int32 groupID = database.GetBotGroupID(c->CharacterID());
			//bool HasGroup = database.BotHasGroup(botId, c->CharacterID());
			bool IsSpawned = database.IsBotSpawned(c->CharacterID(), botId);
/*			if((HasGroup) && (groupID < 20 )){
				c->Message(15, "Bot already in one of your saved groups.");
				c->Message(15, "For forming bot raid groups or saving multiple groups, specify a groupID. GroupIDs under 20 are reserved for raid groups and have restrictions.");
				c->Message(15, "If you still want to reuse this bot for single group hunting, first save this group to groupID 20, (example #bot savegroup 20) then re-try #bot spawn and #bot add.");
				return;
			}*/
			if(spawnedBots && IsSpawned) {
				c->Message(15, "That bot is already spawned.");
				MYSQL_RES* total = database.ListSpawnedBots(c->CharacterID());
				MYSQL_ROW row;
				if(mysql_num_rows(total) == spawnedBots) {
					for(int i=0; i<spawnedBots; i++) {
						row = mysql_fetch_row(total);
						char* longname;
						if(database.GetZoneLongName((char*)row[1], &longname, NULL, NULL, NULL, NULL, NULL, NULL)) {
							c->Message(15, "%s is in %s", row[0], longname);
							safe_delete(longname);
						}
					}
				}
				mysql_free_result(total);
				tmp = 0;
				mtmp = 0;
				return;
			}

			if(RuleB(EQOffline, BotQuest)) {
				const int allowedBots = database.AllowedBotSpawns(c->CharacterID());
				if(allowedBots == 0) {
					c->Message(15, "You cannot spawn any bots.");
					tmp = 0;
					mtmp = 0;
					return;
				}
				if(spawnedBots >= allowedBots) {
					c->Message(15, "You cannot spawn more than %i bot(s).", spawnedBots);
					MYSQL_RES* total = database.ListSpawnedBots(c->CharacterID());
					MYSQL_ROW row;
					if(mysql_num_rows(total) == spawnedBots) {
						for(int i=0; i<spawnedBots; i++) {
							row = mysql_fetch_row(total);
							char* longname;
							if(database.GetZoneLongName((char*)row[1], &longname, NULL, NULL, NULL, NULL, NULL, NULL)) {
								c->Message(15, "%s is in %s", row[0], longname);
								safe_delete(longname);
							}
						}
					}
					mysql_free_result(total);
					tmp = 0;
					mtmp = 0;
					return;
				}
			}

			if(spawnedBots >= RuleI(EQOffline, SpawnBotCount)) {
				c->Message(15, "You cannot spawn more than %i bots.", spawnedBots);
				tmp = 0;
				mtmp = 0;
				return;
			}
			
			int32 remain = c->GetPTimers().GetRemainingTime(pTimerSpawnBotReuse);
			int zoneID = zone->GetZoneID();
			int bindID = database.BotCanBindLookUp(zoneID);
			if((!c->GetPTimers().Expired(&database, pTimerSpawnBotReuse, false)) && (!c->GetGM()) && (bindID < 1)) {
				c->Message(13,"You must wait %d minutes %d seconds before using the spawnbot command again.", ((remain)/60), (remain%60));
				return;
			}
			c->GetPTimers().Start(pTimerSpawnBotReuse, 30);
			
			int randmove = MakeRandomInt(-2, 2);
			NPC* npc = new NPC(tmp, 0, c->GetX() + randmove, c->GetY() + randmove, c->GetZ(), c->GetHeading() + randmove, FlyMode3);
			// As the mob is in the DB, we need to calc its level, HP, Mana.
			// First, the mob must have the same level as his leader
			npc->SetLevel(BotLevel);
			// fez_ajer: Set default behavior flags
			npc->CastToMob()->SetBotAutoMez(false);
			npc->CastToMob()->SetBotAutoDefend(false);
			entity_list.AddNPC(npc, true, true);
			npc->CastToMob()->SendAppearancePacket(AT_Linkdead, 0);
			
			database.SetBotLeader(npc->GetNPCTypeID(), c->CharacterID(), npc->GetName(), zone->GetShortName(), zone->GetZoneID());
			if(npc->GetClass()==MAGICIAN) {
				int8 pcID = database.GetMagePet(npc->GetNPCTypeID());
				if(pcID) {
					npc->SetPetChooser(true);
					npc->SetPetChooserID(pcID);
				}
			}
			npc->CastToMob()->Say("I am ready for battle.");
			npc->CastToMob()->Say("I'll be camping out in 90 seconds, if you don't add me to your group.");
			// Equip the bot
			std::string errorMessage = "";
			npc->EquipBot(npc, &errorMessage);
			if(!errorMessage.empty()) {
				npc->CastToMob()->Say("There was an error loading my equipment");
			}
			
			//check if bot was using archery last spawn
			int8 botclass = npc->GetClass();
			if((botclass==WARRIOR)||(botclass==PALADIN)||(botclass==RANGER)||(botclass==SHADOWKNIGHT)||(botclass==ROGUE)) {
				//if we are an archery capable class, do the db check
				if(database.GetBotArchery(npc->GetNPCTypeID())) {
					npc->SetBotArchery();
				}
			}

		}
		else {
			c->Message(15, "BotID: %i not found", botId);
			tmp = 0;
		}
		return;
	}

//Archery
	if((!strcasecmp(sep->arg[1], "archery")) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "archery")) {
		if((c->GetTarget() == NULL) || (c->GetTarget() == c) || !c->GetTarget()->IsBot()) {
			c->Message(15, "You must target a bot!");
			return;
		}
		Mob *archerbot = c->GetTarget();
		if((archerbot->GetClass()==WARRIOR)||(archerbot->GetClass()==PALADIN)||(archerbot->GetClass()==RANGER)||(archerbot->GetClass()==SHADOWKNIGHT)||(archerbot->GetClass()==ROGUE)) {
			archerbot->SetBotArchery();
		}
		else {
            archerbot->BotSay("I don't know how to use a bow.");
		}
		return;
	}
 //Taunt moved to "#bot set taunt" 
   if(!strcasecmp(sep->arg[1], "taunt")){
  	  c->Message(15, "Try '#bot set taunt' instead.");
	  return;
   }
/*
      if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot()) {
	  c->Message(15, "You must target a bot first.");
	  return;
      }
    Group *g = c->GetGroup();
    if(g) {
     for(int i=0; i<MAX_GROUP_MEMBERS; i++){
      Mob *botMember = NULL; 
      botMember = g->members[i];
      if(g->members[i] && g->members[i]->IsBot()) {
        if (sep->arg[2][0] == '\0'){
          c->Message(15, "Usage: #bot taunt [on], [off], [warrior], [paladin], [sk], [ranger], [bard].");
	  return;
        }	
       if (!strcasecmp(sep->arg[2], "off")){
	database.UpdateBotTaunt(0,charid);
	target->SetBotTauntLevel(0);
	c->Message(15, "Taunting disabled.");
       }
       else if (!strcasecmp(sep->arg[2], "warrior")){
	database.UpdateBotTaunt(1,charid);
	target->SetBotTauntLevel(1);
	c->Message(15, "Warrior class set to taunt.");
       }
       else if (!strcasecmp(sep->arg[2], "paladin")){
	database.UpdateBotTaunt(2,charid);
	target->SetBotTauntLevel(2);
	c->Message(15, "Paladin class set to taunt.");
       }
       else if (!strcasecmp(sep->arg[2], "sk")){
	database.UpdateBotTaunt(3,charid);
	target->SetBotTauntLevel(3);
	c->Message(15, "Shadowknight class set to taunt.");
       }
       else if (!strcasecmp(sep->arg[2], "ranger")){
	database.UpdateBotTaunt(4,charid);
	target->SetBotTauntLevel(4);
	c->Message(15, "Ranger class set to taunt.");
       }
       else if (!strcasecmp(sep->arg[2], "bard")){
	database.UpdateBotTaunt(5,charid);
	target->SetBotTauntLevel(5);
	c->Message(15, "Bard class set to taunt.");
       }
       else if (!strcasecmp(sep->arg[2], "on")){
	database.UpdateBotTaunt(6,charid);
	target->SetBotTauntLevel(6);
	c->Message(15, "All taunt classes will taunt.");
       }
       else{
	c->Message(15, "No taunt class available or improper usage.");
      	c->Message(15, "Usage: #bot taunt [on], [off], [warrior], [paladin], [sk], [ranger], [bard].");
	return;
       }
      return;       
      }
     }
    }
   return;
  }
*/
//Move
	if((!strcasecmp(sep->arg[1], "move")) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "move")) {
		if(c->IsBotRaiding()) {
			BotRaids *brsummon = entity_list.GetBotRaidByMob(c->CastToMob());
			if(brsummon) {
				brsummon->RandSummonRaidBots(c->CastToMob(), false);
			}
		}
		if(c->IsGrouped())
        {
			Group *g = c->GetGroup();
			if(g) {
				for(int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					Mob *botMember = NULL; 
					botMember = g->members[i];
					int randmove = MakeRandomInt(-5, 5);
					if(g->members[i] && g->members[i]->IsBot()) {
						if(g->members[i]->IsMoving()){
						    c->Message(15, "You can't be moving for this command.");
						    return;
						}
						g->members[i]->Warp(botMember->GetX() + randmove, botMember->GetY() + randmove, botMember->GetZ());
					}
				}
			}
		}
        return;
	}
	
///TODO: Finish armorcolor
//bot armor colors
/*
	if(!strcasecmp(sep->arg[1], "armorcolor")) {
	    int32 botid = (t->GetNPCTypeID());
	    //std::string errorMessage;
	    char errbuf[MYSQL_ERRMSG_SIZE];
	    int32 affected_rows = 0;
	    char *query = 0;
	    MYSQL_RES *result;
	    //MYSQL_ROW row;
	    //const char* lname = "";
	    int setslot = atoi(sep->arg[2]);
	    uint red = atoi(sep->arg[3]);
	    uint green = atoi(sep->arg[4]);
	    uint blue = atoi(sep->arg[5]);
	    uint32 setcolor = (red << 16) | (green << 8) | blue;

		if(target && target->IsBot() && (database.GetBotOwner(target->GetNPCTypeID()) == c->CharacterID())) {

			if(sep->arg[2][0] == '\0' || sep->arg[3][0] == '\0' || sep->arg[4][0] == '\0' || sep->arg[5][0] == '\0') {
				c->Message(0, "Usage: #bot armorcolor [slot] [red] [green] [blue] - use #bot help armorcolor for info");
				return;
			}

			if(database.RunQuery(query, MakeAnyLenString(&query, "UPDATE botinventory SET color = %i WHERE botslotid = %i AND npctypeid = %i",setcolor, setslot, botid), errbuf, 0, &affected_rows)){
			}
			else{
			  c->Message(15, "Coudn't save to database.");
			  mysql_free_result(result);
			  safe_delete_array(query)
			  return;
			}
		int slotmaterial = Inventory::CalcMaterialFromSlot(setslot);
		c->GetTarget()->CastToMob()->SendWearChange(slotmaterial);
			//}
		}
		else {
			c->Message(15, "You must target a bot you own to do this.");
		}
	  mysql_free_result(result);
	  safe_delete_array(query);
	  return;
	}
	// Help for coloring bot armor
		if(!strcasecmp(sep->arg[1], "help") && !strcasecmp(sep->arg[2], "armorcolor") ){
		c->Message(0, "-----------------#bot armorcolor help-----------------------------");
		c->Message(0, "Armor:  17(Chest/Robe), 7(Arms), 9(Bracer), 12(Hands), 18(Legs), 19(Boots), 2(Helm)");
		c->Message(0, "------------------------------------------------------------------");
		c->Message(0, "Color: [red] [green] [blue]  (enter a number from 0-255 for each");
		c->Message(0, "------------------------------------------------------------------");
		c->Message(0, "Example: #bot armorcolor 17 0 255 0 - this would make the chest bright green");
		return;
	}
*/
//Picklock
	if((!strcasecmp(sep->arg[1], "picklock")) && (!c->IsGrouped())) {
		c->Message(15, "picklock not needed anymore, try clicking on the door, while grouped with your rogue bot.");
		//c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "picklock")) {
		c->Message(15, "picklock not needed anymore, try clicking on the door, while grouped with your rogue bot.");
		return;
		/*		
		if((c->GetTarget() == NULL) || (c->GetTarget() == c) || !c->GetTarget()->IsBot() || (c->GetTarget()->GetClass() != ROGUE)) {
			c->Message(15, "You must target a rogue bot!");
			return;		}
		entity_list.OpenDoorsNear(c->GetTarget()->CastToNPC());
		return;
		*/
	}
	
//Showgroups (displays stored groups). 
	if((!strcasecmp(sep->arg[1], "showgroups"))||(!strcasecmp(sep->arg[1], "showgroup"))){
		char errbuf[MYSQL_ERRMSG_SIZE];
		char *query = 0;
		int32 affected_rows = 0;
		MYSQL_RES *result;
		MYSQL_ROW row;
		
	    if(!strcasecmp(sep->arg[2], "raid")){
	      c->Message(15, "Your list of stored raid groups are,");
		    if(database.RunQuery(query, MakeAnyLenString(&query, "SELECT botgroups.groupid, npc_types.name, npc_types.class, npc_types.race, npc_types.id FROM botgroups,npc_types WHERE botgroups.botid = npc_types.id AND npc_types.id > 500000 ORDER by botgroups.groupid"), errbuf, &result, &affected_rows))
		    {
			while(row = mysql_fetch_row(result))
			{
				int irow = atoi(row[2]);
				const char *crow;
			    switch(irow) {
				case 1:
				    crow = "Warrior";
				    break;
				case 2:
				    crow = "Cleric";
				    break;
				case 3:
				    crow = "Paladin";
				    break;
				case 4:
				    crow = "Ranger";
				    break;
				case 5:
				    crow = "Shadows Knight";
				    break;
				case 6:
				    crow = "Druid";
				    break;
				case 7:
				    crow = "Monk";
				    break;
				case 8:
				    crow = "Bard";
				    break;
				case 9:
				    crow = "Rogue";
				    break;
				case 10:
				    crow = "Shaman";
				    break;
				case 11:
				    crow = "Necromancer";
				    break;
				case 12:
				    crow = "Wizard";
				    break;
				case 13:
				    crow = "Magician";
				    break;
				case 14:
				    crow = "Enchanter";
				    break;
				case 15:
				    crow = "Beastlord";
				    break;
				case 16:
				    crow = "Berserker";
				    break;
				default:
				    crow = "Warrior";
			    }
			    
				int rrow = atoi(row[3]);
				const char *rrrow;
			      switch(rrow) {
				case 1:
				    rrrow = "Human";
				    break;
				case 2:
				    rrrow = "Barbarian";
				    break;
				case 3:
				    rrrow = "Erudite";
				    break;
				case 4:
				    rrrow = "Wood Elf";
				    break;
				case 5:
				    rrrow = "High Elf";
				    break;
				case 6:
				    rrrow = "Dark Elf";
				    break;
				case 7:
				    rrrow = "Half Elf";
				    break;
				case 8:
				  rrrow = "Dwarf";
				  break;
				case 9:
				    rrrow = "Troll";
				    break;
				case 10:
				    rrrow = "Ogre";
				  break;
				case 11:
				      rrrow = "Halfling";
				    break;
				case 12:
				    rrrow = "Gnome";
				    break;
				case 330:
				    rrrow = "Froglok";
				    break;
				case 128:
				    rrrow = "Iksar";
				    break;
				case 130:
				    rrrow = "Vah Shir";
				    break;
				default:
				    rrrow = "Human";
			    }

			    if(database.GetBotOwner(atoi(row[4])) == c->CharacterID()) { 
				    c->Message(15,"GroupID: %s -- Class: %s -- Name: %s -- Race: %s -- ", row[0], crow, row[1], rrrow);
			    }
			}
		    }
	      mysql_free_result(result);
	      safe_delete_array(query);
	      return;
	    }
		
	    else if(!strcasecmp(sep->arg[2], "normal")){
	      c->Message(15, "Your list of stored single groups are,");
		    if(database.RunQuery(query, MakeAnyLenString(&query, "SELECT botbank.groupid, npc_types.name, npc_types.class, npc_types.race, npc_types.id FROM botbank,npc_types WHERE botbank.botid = npc_types.id AND npc_types.id > 500000 ORDER by botbank.groupid"), errbuf, &result, &affected_rows))
		    {
			while(row = mysql_fetch_row(result))
			{
				int irow = atoi(row[2]);
				const char *crow;
			    switch(irow) {
				case 1:
				    crow = "Warrior";
				    break;
				case 2:
				    crow = "Cleric";
				    break;
				case 3:
				    crow = "Paladin";
				    break;
				case 4:
				    crow = "Ranger";
				    break;
				case 5:
				    crow = "Shadows Knight";
				    break;
				case 6:
				    crow = "Druid";
				    break;
				case 7:
				    crow = "Monk";
				    break;
				case 8:
				    crow = "Bard";
				    break;
				case 9:
				    crow = "Rogue";
				    break;
				case 10:
				    crow = "Shaman";
				    break;
				case 11:
				    crow = "Necromancer";
				    break;
				case 12:
				    crow = "Wizard";
				    break;
				case 13:
				    crow = "Magician";
				    break;
				case 14:
				    crow = "Enchanter";
				    break;
				case 15:
				    crow = "Beastlord";
				    break;
				case 16:
				    crow = "Berserker";
				    break;
				default:
				    crow = "Warrior";
			    }
			    
				int rrow = atoi(row[3]);
				const char *rrrow;
			      switch(rrow) {
				case 1:
				    rrrow = "Human";
				    break;
				case 2:
				    rrrow = "Barbarian";
				    break;
				case 3:
				    rrrow = "Erudite";
				    break;
				case 4:
				    rrrow = "Wood Elf";
				    break;
				case 5:
				    rrrow = "High Elf";
				    break;
				case 6:
				    rrrow = "Dark Elf";
				    break;
				case 7:
				    rrrow = "Half Elf";
				    break;
				case 8:
				  rrrow = "Dwarf";
				  break;
				case 9:
				    rrrow = "Troll";
				    break;
				case 10:
				    rrrow = "Ogre";
				  break;
				case 11:
				      rrrow = "Halfling";
				    break;
				case 12:
				    rrrow = "Gnome";
				    break;
				case 330:
				    rrrow = "Froglok";
				    break;
				case 128:
				    rrrow = "Iksar";
				    break;
				case 130:
				    rrrow = "Vah Shir";
				    break;
				default:
				    rrrow = "Human";
			    }

			    if(database.GetBotOwner(atoi(row[4])) == c->CharacterID()) { 
				    c->Message(15,"GroupID: %s -- Class: %s -- Name: %s -- Race: %s -- ", row[0], crow, row[1], rrrow);
			    }
			}
		    }
	      mysql_free_result(result);
	      safe_delete_array(query);
	      return;
	    }
		    
	    else if(sep->arg[1][0] == '\0')  {
		c->Message(15, "Usage: #bot showgroups [normal], [raid].");
		return;
	    }
		    
	    else  {
		c->Message(15, "Usage: #bot showgroups [normal], [raid].");
		return;
	    }
	  return;
	}
//Savegroup - Angelox: For saving individual groups under different groupIDs. Can be used for grouping or raid-groups. 
	if(!strcasecmp(sep->arg[1], "savegroup")){
	    int32 OldGroupID = database.GetBotGroupID(c->CharacterID());
	    int32 NewGroupId = atoi(sep->arg[2]);
	    int32 GroupExists = database.BotGroupExists(NewGroupId, c->CharacterID());
		if(!c->IsGrouped()){
		    c->Message(15, "You need to group with a bot for this");
		    return;
		}
		else if(c->IsBotRaiding()){
		    c->Message(15, "Thise works only while in single group mode.");
		    return;
		}
		else {
		  if((GroupExists) && (NewGroupId < 20)){
		    c->Message(15, "You already have a group in the database with this GroupID, try another GroupID number or You can add and remove members to this group by targeting the member and your [disband] button");
		    c->Message(15, "For single group hunting use your GroupID of 20 and higher to avoid raid groups conflicts.");
		    return;
		  }
		  else if((sep->arg[2][0] == '\0') && (!GroupExists)){
		    //database.DeleteFromBotBank(OldGroupID, c->CharacterID());
		    database.UpdateBotGroupID(20, c->CharacterID());
		    c->Message(15, "Group info saved to GroupID 20.");
		    c->Message(15, "For forming bot raid groups or saving multiple groups, specify a groupID. GroupIDs under 20 are reserved for raid groups and have restrictions.");
		    c->SaveBotGroup(20, c);
		    return;
		  }
		  else{
		    if (OldGroupID == NewGroupId)
		      database.DeleteFromBotBank(OldGroupID, c->CharacterID());
		    
		    database.UpdateBotGroupID(NewGroupId, c->CharacterID()); 
		      if(NewGroupId < 20){
			c->Message(15, "If one or more bots are in other raid groups, they will not be saved.");
			c->Message(15, "For multiple hunting groups with duplicate bots, save to GroupIDs 20 and higher.");			
		      }
		    c->Message(15, "Group info saved.");
		    c->SaveBotGroup(NewGroupId, c);
		    return;
		  }
	      }
	   return;
	}

// These are old "summon" commands, can be removed later.
    if(!strcasecmp(sep->arg[1], "make")){
       	 c->Message(15, " Try #bot summon [food] or[ drink] instead");
	 return;}
    if((!strcasecmp(sep->arg[1], "corpse")) && (!strcasecmp(sep->arg[2], "summon"))) {
	c->Message(15, "Try \"#bot summon corpse\" instead.");
	return;}
    if((!strcasecmp(sep->arg[1], "group")) && (!strcasecmp(sep->arg[2], "summon"))) {
	c->Message(15, "Try \"#Bot summon group\" instead.");
	return;}	

//Summon [bot], [corpse], [group], [food], [drink]
//Keep other "summon" commands nested here. 
   if((!strcasecmp(sep->arg[1], "summon"))&& (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
   if(!strcasecmp(sep->arg[1], "summon")){
	  if (!strcasecmp( sep->arg[2], "\0")){
		c->Message(15, "Usage: #bot summon [bot], [group], [corpse], [food], or [drink].");
		return;
	  }
//Bot  
	  if(!strcasecmp(sep->arg[2], "bot")) {
		if((c->GetTarget() == NULL) || (c->GetTarget() == c) 
		|| !c->GetTarget()->IsBot() || c->GetTarget()->IsPet()){
		c->Message(15, "You must target a bot!");
		return;
	  }
		if(!c->GetPTimers().Expired(&database, pTimerBotCHealReuse, false)) {
			c->Message(15, "Not while CHeal in progress.");
			return;
		}
	
		if(c->GetTarget()->IsMob() && !c->GetTarget()->IsPet()){
                 Mob *b = c->GetTarget();
			// Is our target "botable" ?
			if(b && !b->IsBot()){
				c->Message(15, "You must target a bot!");
				return;
			}
			if(b && (database.GetBotOwner(b->GetNPCTypeID()) != c->CharacterID())) 
			{
				b->Say("You can only summon your own bots.");
				return;
			}
			if(b) {
				b->SetTarget(b->BotOwner);
				b->Warp(c->GetX(), c->GetY(), c->GetZ());
			}
		}
		return;
	    }
//Corpse
	if((!strcasecmp(sep->arg[2], "corpse")) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[2], "corpse")) {
		if(c->GetTarget() == NULL) {
			c->Message(15, "You must select player with his corpse in the zone.");
			return;
		}
		if(c->IsGrouped()) {
			bool hassummoner = false;
			Mob *t = c->GetTarget();
			Group *g = c->GetGroup();
			Mob *summoner = NULL;
			int summonerlevel = 0;

			bool summonClass1 = true;
			bool summonClass2 = true;
			bool summonClass3 = true;
			if(RuleB(EQOffline, BotSpellQuest))
			{
				switch(database.BotSummonLookup(c->CharacterID()))
				{
				case 1:
					summonClass2 = false;
					summonClass3 = false;
					break;
				case 2:
					summonClass3 = false;
					break;
				case 3:
					// They're all 'true' by default
					break;
				default:
					summonClass1 = false;
					summonClass2 = false;
					summonClass3 = false;
					break;
				}
			}
			for(int i=0; i<MAX_GROUP_MEMBERS; ++i) {
				if((g && g->members[i]) && g->members[i]->IsBot() && (g->members[i]->GetClass() == NECROMANCER)) {
					hassummoner = true;
					summoner = g->members[i];
					summonerlevel = g->members[i]->GetLevel();
					Mob *t = c->GetTarget();
					if(!t->IsClient()) {
						summoner->BotSay("You have to target a player with a corpse in the zone",t->GetCleanName());
						return;
					}
					else if(summonerlevel < 12){
						summoner->BotSay("I need to be level 12 for this spell.");
						return;
					}
					else if(!summonClass1 && (BotLevel >= 12)) {
						summoner->BotSay("You need to see the Bot Spell Scriber for this spell.");
						return;
					}
					else if(!summonClass2 && (BotLevel >= 35)) {
						summoner->BotSay("You need to see the Bot Spell Scriber again.");
						return;
					}
					else if(!summonClass3 && (BotLevel >= 57)) {
						summoner->BotSay("You need to see the Bot Spell Scriber again.");
						return;
					}
					else if((summonerlevel > 11) && (summonerlevel < 35) && summonClass1)  {
						summoner->InterruptSpell();
						summoner->BotSay("Attempting to summon %s\'s corpse.", t->GetCleanName());
						summoner->CastSpell(2213, t->GetID(), 1, -1, -1);
						if(!RuleB(EQOffline, BotGroupBuffing)) {
							summoner->SpellOnTarget(2213, t);
						}
						return;
					}
					else if((summonerlevel > 34) && (summonerlevel < 57) && summonClass2) {
						summoner->InterruptSpell();
						summoner->BotSay("Attempting to summon %s\'s corpse.", t->GetCleanName());
						summoner->CastSpell(3, t->GetID(), 1, -1, -1);
						if(!RuleB(EQOffline, BotGroupBuffing)) {
							summoner->InterruptSpell();
							summoner->SpellOnTarget(3, t);
						}
						return;
					}
					else if((summonerlevel > 56) && (summonerlevel < 76)  && summonClass3) {
						summoner->InterruptSpell();
						summoner->BotSay("Attempting to summon %s\'s corpse.", t->GetCleanName());
						summoner->CastSpell(1773, t->GetID(), 1, -1, -1);
						if(!RuleB(EQOffline, BotGroupBuffing)) {
							summoner->InterruptSpell();
							summoner->SpellOnTarget(1773, t);
						}
						return;
					}
					else if((summonerlevel > 75) && (summonerlevel < 81)) {
						summoner->InterruptSpell();
						summoner->BotSay("Attempting to summon %s\'s corpse.", t->GetCleanName());
						summoner->CastSpell(14823, t->GetID(), 1, -1, -1);
						if(!RuleB(EQOffline, BotGroupBuffing)) {
							summoner->SpellOnTarget(14823, t);
						}
						return;
					}
				}
			}
			if (!hassummoner) {
				c->Message(15, "You must have a Necromancer in your group.");
			}
			return;
		}
	}
//Group
	if((!strcasecmp(sep->arg[2], "group")) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}	
	if(!strcasecmp(sep->arg[2], "group")) {
	    if(!c->GetPTimers().Expired(&database, pTimerBotCHealReuse, false)) {
		    c->Message(15, "Not while CHeal in progress.");
		    return;
	    }	  
		if(c->IsBotRaiding()) {
			BotRaids *brsummon = entity_list.GetBotRaidByMob(c->CastToMob());
			if(brsummon) {
				brsummon->SummonRaidBots(c->CastToMob(), false);
			}
		}
		else if(c->IsGrouped())
        {
			Group *g = c->GetGroup();
			if(g) {
				for(int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					if(g->members[i] && g->members[i]->IsBot()) {
						g->members[i]->SetTarget(g->members[i]->BotOwner);
						g->members[i]->Warp(c->GetX(), c->GetY(), c->GetZ());
						if(g->members[i] && g->members[i]->GetPetID()) {
							g->members[i]->GetPet()->SetTarget(g->members[i]);
							g->members[i]->GetPet()->Warp(c->GetX(), c->GetY(), c->GetZ());
						}
						Mob *botMember = NULL; 
						botMember = g->members[i];
						int randmove = MakeRandomInt(-2, 2);
						if(g->members[i] && g->members[i]->IsBot()) {
							g->members[i]->Warp(botMember->GetX() +randmove, botMember->GetY() +randmove, botMember->GetZ());
						}
					}
				}
			}
		}
        return;
	}
//Food and Drink 
      if ((!strcasecmp(sep->arg[2], "food")) || (!strcasecmp(sep->arg[2], "drink"))){
	if (!c->IsGrouped()){
	 c->Message(15, "You need to group with a bot for this");
	 return;}
	if ((c->GetTarget() == NULL)  || (c->GetTarget()->IsNPC())){
	 c->Message(15, "You must target yourself or a player zone.");
	 return;}
	  Mob *feeder = NULL;
	  bool hasfeeder = false;
	  if(c->IsGrouped()){
		Group *g = c->GetGroup();
		  if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++)
			{
				if((g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == MAGICIAN)) 
				|| (g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == SHAMAN))
				|| (g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == CLERIC))
				|| (g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == DRUID))
				|| (g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == BEASTLORD)))
				{
					hasfeeder = true;
					feeder = g->members[i];
				}
			}
			if(!hasfeeder) {
				c->Message(15, "You must have a Cleric, Druid, Magician, Shaman or Beastlord in your group.");
				return;
			}
		}
	}
	if ((feeder->GetClass() == SHAMAN) && (BotLevel <= 6)){
	  feeder->BotSay("I'm not level 6 yet.", c->GetName());
		return;
	}
	else if ((feeder->GetClass() == CLERIC) && (BotLevel <= 8)){
	  feeder->BotSay("I'm not level 8 yet.", c->GetName());
	  	return;
	}
	else if ((feeder->GetClass() == DRUID) && (BotLevel <= 11)){
	  feeder->BotSay("I'm not level 11 yet.", c->GetName());
	 	return;
	}
	else if ((feeder->GetClass() == BEASTLORD) && (BotLevel <= 29)){
	  feeder->BotSay("I'm not level 29 yet.", c->GetName());
	  	return;
	}
	if (hasfeeder) {
	  if(!c->GetPTimers().Expired(&database, pTimerBotHealReuse, false)) {
	    feeder->BotSay("Recast not ready yet", c->GetName());
	    return;}
	   c->GetPTimers().Start(pTimerBotHealReuse, 5);
	    feeder->InterruptSpell();
	       if (!strcasecmp(sep->arg[2], "food")){
		feeder->CastToNPC()->CastSpell(50, t->GetID(), 1, -1, -1); //this one is to get the spell text effect
		feeder->BotSay("Summoning food for %s.", c->GetName());
		feeder->SpellOnTarget(50, t);} //this is the one that works
	       else if (!strcasecmp(sep->arg[2], "drink")){
		feeder->CastToNPC()->CastSpell(211, t->GetID(), 1, -1, -1); //Ditto 
		feeder->BotSay("Summoning drink for %s.", c->GetName());
		feeder->SpellOnTarget(211, t);} //Ditto
	   }
	return;
      }
 } //End of "summon" commands nest.
 
//Groupraid
	if(!strcasecmp(sep->arg[1], "groupraid")) {
		if (BotLevel < 45){
			c->Message(15, "You are too low in level for spawning raids. Bot raiding is enabled at level 45 and later.");
			return;
		}
		if(c->GetFeigned())
		{
			c->Message(15, "You can't load your raid while you are feigned.");
			return;
		}

		if(c->IsBotRaiding() || c->IsGrouped()) {
			c->Message(15, "You cannot be in a group.");
			return;
		}
		if (((zone->IsClassic()) && (c->GetTarget() == NULL)) || ((!zone->CanRaid()) && (c->GetTarget() == NULL)) || 
		   ((!zone->CanRaid()) && (c->GetTarget() == c)) || ((!zone->CanRaid()) && (c->GetTarget()->IsBot()))){ 
			c->Message(15, "Target the mob and re-try the command.");
			return;
		}	  
		if((!zone->CanRaid()) && (BotLevel >= 50) && (target->GetLevel() <= 49)) {
			c->Message(15, "Targets level is trivial for you, must be at least level 50.");		  
			c->Message(15, "You cannot form raid groups in this zone.");
			return;
		}
		if((zone->IsClassic()) && (BotLevel >= 50) && (target->GetLevel() <= 49)){
			c->Message(15, "Targets level is trivial for you, must be at least level 50.");		  
			c->Message(15, "This zone is trivial for you, try a zone with higher level mobs.");
			return;
		}
	      const int spawnedBots = database.SpawnedBotCount(c->CharacterID());
	      if(!strcasecmp(sep->arg[2], "agroup")){
		MYSQL_RES* groups = database.LoadBotGroups(c->CharacterID(),1,0,0);

		MYSQL_ROW row = 0;
		int bots = mysql_num_rows(groups);
		int group = 0;
		int16 id = c->GetID();
		Mob* mob = c->CastToMob();
		mob->SetOwnerID(0);
		Group *g = new Group(mob);
		entity_list.AddGroup(g);
		bool followid = false;
		BotRaids *br = 0;
		MYSQL_ROW rows = 0;
		const Item_Struct* item2 = NULL;
		int numitems = 0;
		uint32 itemID = 0;
		Mob *mtmp = 0;
		for(int i=0; i<bots; ++i) {
			row = mysql_fetch_row(groups);
			if((g->BotGroupCount() < 6) && (atoi(row[0]) == group)) {
				mtmp = entity_list.GetMobByNpcTypeID(atoi(row[1]));
					if(mtmp) {
					g->AddMember(mtmp);
					if(!followid) {
						mtmp->SetFollowID(id);
						id = mtmp->GetID();
						followid = true;
					}
					else {
						mtmp->SetFollowID(id);
					}
					mtmp->BotOwner = mob;
					mtmp->SetOwnerID(0);
					if(br) {
						mtmp->SetBotRaiding(true);
						mtmp->SetBotRaidID(br->GetBotRaidID());
					}
					std::string errorMessage = "";
					mtmp->EquipBot(mtmp->CastToNPC(), &errorMessage);
					if(!errorMessage.empty()) {
						mtmp->Say("There was an error loading my equipment");
					}
					
					//check if bot was using archery last spawn
					int8 botclass = mtmp->GetClass();
					if((botclass==WARRIOR)||(botclass==PALADIN)||(botclass==RANGER)||(botclass==SHADOWKNIGHT)||(botclass==ROGUE)) {
						//if we are an archery capable class, do the db check
						if(database.GetBotArchery(mtmp->GetNPCTypeID())) {
							mtmp->SetBotArchery();
						}
					}
/*					if(((spawnedBots > 20) && (BotLevel > 44) && (BotLevel < 55))||
					   ((spawnedBots > 30) && (BotLevel > 54) && (BotLevel < 60))||
					   ((spawnedBots > 45) && (BotLevel > 59) && (BotLevel < 65))){
					  if (c->IsGrouped()) {
					    Group *g = c->GetGroup();
					    if ((BotLevel > 44) && (BotLevel < 55))
					      c->Message(15, "You're level does not allow more than 20 spawned bots - remake your groups.");
					    else if ((BotLevel > 54) && (BotLevel < 60))
					      c->Message(15, "You're level does not allow more than 30 spawned bots - remake your groups.");
					    else if ((BotLevel > 59) && (BotLevel < 65))
					      c->Message(15, "You're level does not allow more than 45 spawned bots - remake your groups.");
					        if (g) {
						  c->Message(15, "Disbanding group");
						  g->DisbandGroup();
						  database.CleanBotLeader(c->CharacterID());
						  mysql_free_result(groups);
						  return;
					        }
					     }
					  }*/
					mtmp->CalcBotStats(false);
				}
			}
			else {
				group++;
				mtmp = entity_list.GetMobByNpcTypeID(atoi(row[1]));
				if(mtmp) {
					mtmp->SetFollowID(id);
					id = mtmp->GetID();
					mtmp->BotOwner = mob;
					mtmp->SetOwnerID(0);
					if(!br) {
						br = new BotRaids(mob);
					}
					for(int k=0; k<MAX_GROUP_MEMBERS; ++k) {
						if(g->members[k]) {
							g->members[k]->SetBotRaiding(true);
							g->members[k]->SetBotRaidID(br->GetBotRaidID());
						}
					}
					br->AddBotGroup(g);
					g = new Group(mtmp);
					entity_list.AddGroup(g);
					if(g->members[0] && !g->members[0]->IsBotRaiding())
					{
						for(int n=0; n<MAX_GROUP_MEMBERS; ++n) {
							if(g->members[n]) {
								g->members[n]->SetBotRaiding(true);
								g->members[n]->SetBotRaidID(br->GetBotRaidID());
							}
						}
					}
					br->AddBotGroup(g);
					std::string errorMessage = "";
					mtmp->EquipBot(mtmp->CastToNPC(), &errorMessage);
					if(!errorMessage.empty()) {
						mtmp->Say("There was an error loading my equipment");
					}
					
					//check if bot was using archery last spawn
					int8 botclass = mtmp->GetClass();
					if((botclass==WARRIOR)||(botclass==PALADIN)||(botclass==RANGER)||(botclass==SHADOWKNIGHT)||(botclass==ROGUE)) {
						//if we are an archery capable class, do the db check
						if(database.GetBotArchery(mtmp->GetNPCTypeID())) {
							mtmp->SetBotArchery();
						}
					}
/*					if(((spawnedBots > 20) && (BotLevel > 44) && (BotLevel < 55))||
					   ((spawnedBots > 30) && (BotLevel > 54) && (BotLevel < 60))||
					   ((spawnedBots > 45) && (BotLevel > 59) && (BotLevel < 65))){
					  if (c->IsGrouped()) {
					    Group *g = c->GetGroup();
					    if ((BotLevel > 44) && (BotLevel < 55))
					      c->Message(15, "You're level does not allow more than 20 spawned bots - remake your groups.");
					    else if ((BotLevel > 54) && (BotLevel < 60))
					      c->Message(15, "You're level does not allow more than 30 spawned bots - remake your groups.");
					    else if ((BotLevel > 59) && (BotLevel < 65))
					      c->Message(15, "You're level does not allow more than 45 spawned bots - remake your groups.");
					        if (g) {
						  c->Message(15, "Disbanding group");
						  g->DisbandGroup();
						  database.CleanBotLeader(c->CharacterID());
						  mysql_free_result(groups);
						  return;
					        }
					     }
					  }*/
					mtmp->CalcBotStats(false);
				}
			}
		}
		mysql_free_result(groups);
		return;
	      }
	      if(!strcasecmp(sep->arg[2], "bgroup")){
		MYSQL_RES* groups = database.LoadBotGroups(c->CharacterID(),0,1,0);

		MYSQL_ROW row = 0;
		int bots = mysql_num_rows(groups);
		int group = 0;
		int16 id = c->GetID();
		Mob* mob = c->CastToMob();
		mob->SetOwnerID(0);
		Group *g = new Group(mob);
		entity_list.AddGroup(g);
		bool followid = false;
		BotRaids *br = 0;
		MYSQL_ROW rows = 0;
		const Item_Struct* item2 = NULL;
		int numitems = 0;
		uint32 itemID = 0;
		Mob *mtmp = 0;
		for(int i=0; i<bots; ++i) {
			row = mysql_fetch_row(groups);
			if((g->BotGroupCount() < 6) && (atoi(row[0]) == group)) {
				mtmp = entity_list.GetMobByNpcTypeID(atoi(row[1]));
					if(mtmp) {
					g->AddMember(mtmp);
					if(!followid) {
						mtmp->SetFollowID(id);
						id = mtmp->GetID();
						followid = true;
					}
					else {
						mtmp->SetFollowID(id);
					}
					mtmp->BotOwner = mob;
					mtmp->SetOwnerID(0);
					if(br) {
						mtmp->SetBotRaiding(true);
						mtmp->SetBotRaidID(br->GetBotRaidID());
					}
					std::string errorMessage = "";
					mtmp->EquipBot(mtmp->CastToNPC(), &errorMessage);
					if(!errorMessage.empty()) {
						mtmp->Say("There was an error loading my equipment");
					}
					
					//check if bot was using archery last spawn
					int8 botclass = mtmp->GetClass();
					if((botclass==WARRIOR)||(botclass==PALADIN)||(botclass==RANGER)||(botclass==SHADOWKNIGHT)||(botclass==ROGUE)) {
						//if we are an archery capable class, do the db check
						if(database.GetBotArchery(mtmp->GetNPCTypeID())) {
							mtmp->SetBotArchery();
						}
					}
/*					if(((spawnedBots > 20) && (BotLevel > 44) && (BotLevel < 55))||
					   ((spawnedBots > 30) && (BotLevel > 54) && (BotLevel < 60))||
					   ((spawnedBots > 45) && (BotLevel > 59) && (BotLevel < 65))){
					  if (c->IsGrouped()) {
					    Group *g = c->GetGroup();
					    if ((BotLevel > 44) && (BotLevel < 55))
					      c->Message(15, "You're level does not allow more than 20 spawned bots - remake your groups.");
					    else if ((BotLevel > 54) && (BotLevel < 60))
					      c->Message(15, "You're level does not allow more than 30 spawned bots - remake your groups.");
					    else if ((BotLevel > 59) && (BotLevel < 65))
					      c->Message(15, "You're level does not allow more than 45 spawned bots - remake your groups.");
					        if (g) {
						  c->Message(15, "Disbanding group");
						  g->DisbandGroup();
						  database.CleanBotLeader(c->CharacterID());
						  mysql_free_result(groups);
						  return;
					        }
					     }
					  }*/
					mtmp->CalcBotStats(false);
				}
			}
			else {
				group++;
				mtmp = entity_list.GetMobByNpcTypeID(atoi(row[1]));
				if(mtmp) {
					mtmp->SetFollowID(id);
					id = mtmp->GetID();
					mtmp->BotOwner = mob;
					mtmp->SetOwnerID(0);
					if(!br) {
						br = new BotRaids(mob);
					}
					for(int k=0; k<MAX_GROUP_MEMBERS; ++k) {
						if(g->members[k]) {
							g->members[k]->SetBotRaiding(true);
							g->members[k]->SetBotRaidID(br->GetBotRaidID());
						}
					}
					br->AddBotGroup(g);
					g = new Group(mtmp);
					entity_list.AddGroup(g);
					if(g->members[0] && !g->members[0]->IsBotRaiding())
					{
						for(int n=0; n<MAX_GROUP_MEMBERS; ++n) {
							if(g->members[n]) {
								g->members[n]->SetBotRaiding(true);
								g->members[n]->SetBotRaidID(br->GetBotRaidID());
							}
						}
					}
					br->AddBotGroup(g);
					std::string errorMessage = "";
					mtmp->EquipBot(mtmp->CastToNPC(), &errorMessage);
					if(!errorMessage.empty()) {
						mtmp->Say("There was an error loading my equipment");
					}
					
					//check if bot was using archery last spawn
					int8 botclass = mtmp->GetClass();
					if((botclass==WARRIOR)||(botclass==PALADIN)||(botclass==RANGER)||(botclass==SHADOWKNIGHT)||(botclass==ROGUE)) {
						//if we are an archery capable class, do the db check
						if(database.GetBotArchery(mtmp->GetNPCTypeID())) {
							mtmp->SetBotArchery();
						}
					}
/*					if(((spawnedBots > 20) && (BotLevel > 44) && (BotLevel < 55))||
					   ((spawnedBots > 30) && (BotLevel > 54) && (BotLevel < 60))||
					   ((spawnedBots > 45) && (BotLevel > 59) && (BotLevel < 65))){
					  if (c->IsGrouped()) {
					    Group *g = c->GetGroup();
					    if ((BotLevel > 44) && (BotLevel < 55))
					      c->Message(15, "You're level does not allow more than 20 spawned bots - remake your groups.");
					    else if ((BotLevel > 54) && (BotLevel < 60))
					      c->Message(15, "You're level does not allow more than 30 spawned bots - remake your groups.");
					    else if ((BotLevel > 59) && (BotLevel < 65))
					      c->Message(15, "You're level does not allow more than 45 spawned bots - remake your groups.");
					        if (g) {
						  c->Message(15, "Disbanding group");
						  g->DisbandGroup();
						  database.CleanBotLeader(c->CharacterID());
						  mysql_free_result(groups);
						  return;
					        }
					     }
					  }*/
					mtmp->CalcBotStats(false);
				}
			}
		}
		mysql_free_result(groups);
		return;
	      }
	      if(!strcasecmp(sep->arg[2], "cgroup")){
		MYSQL_RES* groups = database.LoadBotGroups(c->CharacterID(),0,0,1);

		MYSQL_ROW row = 0;
		int bots = mysql_num_rows(groups);
		int group = 0;
		int16 id = c->GetID();
		Mob* mob = c->CastToMob();
		mob->SetOwnerID(0);
		Group *g = new Group(mob);
		entity_list.AddGroup(g);
		bool followid = false;
		BotRaids *br = 0;
		MYSQL_ROW rows = 0;
		const Item_Struct* item2 = NULL;
		int numitems = 0;
		uint32 itemID = 0;
		Mob *mtmp = 0;
		for(int i=0; i<bots; ++i) {
			row = mysql_fetch_row(groups);
			if((g->BotGroupCount() < 6) && (atoi(row[0]) == group)) {
				mtmp = entity_list.GetMobByNpcTypeID(atoi(row[1]));
					if(mtmp) {
					g->AddMember(mtmp);
					if(!followid) {
						mtmp->SetFollowID(id);
						id = mtmp->GetID();
						followid = true;
					}
					else {
						mtmp->SetFollowID(id);
					}
					mtmp->BotOwner = mob;
					mtmp->SetOwnerID(0);
					if(br) {
						mtmp->SetBotRaiding(true);
						mtmp->SetBotRaidID(br->GetBotRaidID());
					}
					std::string errorMessage = "";
					mtmp->EquipBot(mtmp->CastToNPC(), &errorMessage);
					if(!errorMessage.empty()) {
						mtmp->Say("There was an error loading my equipment");
					}
					
					//check if bot was using archery last spawn
					int8 botclass = mtmp->GetClass();
					if((botclass==WARRIOR)||(botclass==PALADIN)||(botclass==RANGER)||(botclass==SHADOWKNIGHT)||(botclass==ROGUE)) {
						//if we are an archery capable class, do the db check
						if(database.GetBotArchery(mtmp->GetNPCTypeID())) {
							mtmp->SetBotArchery();
						}
					}
					//This piece was for players who went a second tim around (de leveled) for Epic quest
					//Removed it as it obstructs the new bot group/raid group code.
					/* 
					if(((spawnedBots > 20) && (BotLevel > 44) && (BotLevel < 55))||
					   ((spawnedBots > 30) && (BotLevel > 54) && (BotLevel < 60))||
					   ((spawnedBots > 45) && (BotLevel > 59) && (BotLevel < 65))){
					  if (c->IsGrouped()) {
					    Group *g = c->GetGroup();
					    if ((BotLevel > 44) && (BotLevel < 55))
					      c->Message(15, "You're level does not allow more than 20 spawned bots - remake your groups.");
					    else if ((BotLevel > 54) && (BotLevel < 60))
					      c->Message(15, "You're level does not allow more than 30 spawned bots - remake your groups.");
					    else if ((BotLevel > 59) && (BotLevel < 65))
					      c->Message(15, "You're level does not allow more than 45 spawned bots - remake your groups.");
					        if (g) {
						  c->Message(15, "Disbanding group");
						  g->DisbandGroup();
						  database.CleanBotLeader(c->CharacterID());
						  mysql_free_result(groups);
						  return;
					        }
					     }
					  }
					  */
					mtmp->CalcBotStats(false);
				}
			}
			else {
				group++;
				mtmp = entity_list.GetMobByNpcTypeID(atoi(row[1]));
				if(mtmp) {
					mtmp->SetFollowID(id);
					id = mtmp->GetID();
					mtmp->BotOwner = mob;
					mtmp->SetOwnerID(0);
					if(!br) {
						br = new BotRaids(mob);
					}
					for(int k=0; k<MAX_GROUP_MEMBERS; ++k) {
						if(g->members[k]) {
							g->members[k]->SetBotRaiding(true);
							g->members[k]->SetBotRaidID(br->GetBotRaidID());
						}
					}
					br->AddBotGroup(g);
					g = new Group(mtmp);
					entity_list.AddGroup(g);
					if(g->members[0] && !g->members[0]->IsBotRaiding())
					{
						for(int n=0; n<MAX_GROUP_MEMBERS; ++n) {
							if(g->members[n]) {
								g->members[n]->SetBotRaiding(true);
								g->members[n]->SetBotRaidID(br->GetBotRaidID());
							}
						}
					}
					br->AddBotGroup(g);
					std::string errorMessage = "";
					mtmp->EquipBot(mtmp->CastToNPC(), &errorMessage);
					if(!errorMessage.empty()) {
						mtmp->Say("There was an error loading my equipment");
					}
					
					//check if bot was using archery last spawn
					int8 botclass = mtmp->GetClass();
					if((botclass==WARRIOR)||(botclass==PALADIN)||(botclass==RANGER)||(botclass==SHADOWKNIGHT)||(botclass==ROGUE)) {
						//if we are an archery capable class, do the db check
						if(database.GetBotArchery(mtmp->GetNPCTypeID())) {
							mtmp->SetBotArchery();
						}
					}
/*					if(((spawnedBots > 20) && (BotLevel > 44) && (BotLevel < 55))||
					   ((spawnedBots > 30) && (BotLevel > 54) && (BotLevel < 60))||
					   ((spawnedBots > 45) && (BotLevel > 59) && (BotLevel < 65))){
					  if (c->IsGrouped()) {
					    Group *g = c->GetGroup();
					    if ((BotLevel > 44) && (BotLevel < 55))
					      c->Message(15, "You're level does not allow more than 20 spawned bots - remake your groups.");
					    else if ((BotLevel > 54) && (BotLevel < 60))
					      c->Message(15, "You're level does not allow more than 30 spawned bots - remake your groups.");
					    else if ((BotLevel > 59) && (BotLevel < 65))
					      c->Message(15, "You're level does not allow more than 45 spawned bots - remake your groups.");
					        if (g) {
						  c->Message(15, "Disbanding group");
						  g->DisbandGroup();
						  database.CleanBotLeader(c->CharacterID());
						  mysql_free_result(groups);
						  return;
					        }
					     }
					  }*/
					mtmp->CalcBotStats(false);
				}
			}
		}
		mysql_free_result(groups);
		return;
	      }
	     c->Message(15, "usage #bot spawnraid [agroup], [bgroup], or [cgroup].");
	     return;
	}

//Disbandgroup
	if ((!strcasecmp(sep->arg[1], "disbandgroup"))) {
		if (c->IsGrouped()) {
			Group *g = c->GetGroup();
			if (g) {
				c->Message(15, "Disbanding group");
				g->DisbandGroup();
				database.CleanBotLeader(c->CharacterID());
				database.DeleteFromBotTemp(c->CharacterID());
			}
		}
		else {
			c->Message(15, "You have no group to disband.");
		}
		return;
	}

//SpawnGroup
	if((!strcasecmp(sep->arg[1], "spawngroup")) || (!strcasecmp(sep->arg[1], "groupspawn"))) {
		if(c->CheckAggro(c)) {
			c->Message(15, "You can not create bot groups while you are aggroed.");
			return;
		}
		if(c->GetFeigned()){
			c->Message(15, "You can't load your group while you are feigned.");
			return;
		}
		if(c->GetAggroCount() > 0){
			c->Message(15, "You can't load your group while a monster has aggro on you.");
			return;
		}
		if(c->IsGrouped()) {
			c->Message(15, "You can't spawn a group when you're already grouped. Try using #bot disbandgroup");
			c->Message(15, "If you're already grouped with another player, use '#bot spawn' instead.");
			return;
		}
		Group *g = entity_list.GetGroupByMob(c);  //engaged
		for (int i=0; i<MAX_GROUP_MEMBERS; i++){
			if(g && g->members[i] && g->members[i]->IsEngaged()){
				c->Message(15, "You can't create bot groups while you are engaged.");
				return;
			}
		}
		int32 GroupID = atoi(sep->arg[2]);
		 if(sep->arg[2][0] == '\0')
		   GroupID = 20;
		int32 GroupExists = database.BotGroupExists(GroupID, c->CharacterID());
		if(!GroupExists){
			c->Message(15, "GroupID %i non existent in the database - form the group first then save with #bot savegroup.", GroupID);
			c->Message(15, "You can save into multiple groups with the savegroup option, which can later be used with spawngroup and the group id");
			c->Message(15, "Your saved groups with ids of 0 through 19 are reserved for bot raiding and have restrictions.");
			c->Message(15, "Spawngroup usage is #bot spawngroup [GroupID] (defaults to 20).");
			c->Message(15, "And savegroup usage is #bot savegroup [GroupID] (defaults to 20).");
			  if (c->IsGrouped()) {
			    Group *g = c->GetGroup();
			      if (g) {
				g->DisbandGroup();
				database.CleanBotLeader(c->CharacterID());
				database.DeleteFromBotTemp(c->CharacterID());
			      }
			  }
		    return;
		}

		int zoneID = zone->GetZoneID();
		int bindID = database.BotCanBindLookUp(zoneID);
		int32 remain = c->GetPTimers().GetRemainingTime(pTimerSpawnGroupReuse);		
		if((!c->GetPTimers().Expired(&database, pTimerSpawnGroupReuse, false)) && (!c->GetGM()) && (bindID < 1)) {
			c->Message(13,"You must wait %d minutes %d seconds and not use Feign Death before using the spawngroup command again.", ((remain)/60), (remain%60));
			return;
		}
		c->GetPTimers().Start(pTimerSpawnGroupReuse, 60);
		c->SpawnBotBank(GroupID, c);
		return;
		  
	}

//SpawnRaid
	if(!strcasecmp(sep->arg[1], "spawnraid")) {
		if (BotLevel < 45){
			c->Message(15, "You are too low in level for spawning raids. Bot raiding is enabled at level 45 and later.");
			return;
		}
		if (((zone->IsClassic()) && (c->GetTarget() == NULL)) || ((!zone->CanRaid()) && (c->GetTarget() == NULL)) || 
		   ((!zone->CanRaid()) && (c->GetTarget() == c)) || ((!zone->CanRaid()) && (c->GetTarget()->IsBot()))){ 
			c->Message(15, "Target the mob and re-try the command.");
			return;
		}	  
		if((!zone->CanRaid()) && (BotLevel >= 50) && (target->GetLevel() <= 49)) {
			c->Message(15, "Targets level is trivial for you, must be at least level 50.");		  
			c->Message(15, "You cannot form raid groups in this zone.");
			return;
		}
		if((zone->IsClassic()) && (BotLevel >= 50) && (target->GetLevel() <= 49)){
			c->Message(15, "Targets level is trivial for you, must be at least level 50.");		  
			c->Message(15, "This zone is trivial for you, try a zone with higher level mobs.");
			return;
		}
		if(c->GetFeigned())
		{
			c->Message(15, "You can't load your raid while you are feigned.");
			return;
		}
		if(c->GetAggroCount() > 0)
		{
			c->Message(15, "You can't load your raid while a monster has aggro on you.");
			return;
		}
		int zoneID = zone->GetZoneID();
		int bindID = database.BotCanBindLookUp(zoneID);
		int32 remain = c->GetPTimers().GetRemainingTime(pTimerSpawnRaidReuse);		
		if((!c->GetPTimers().Expired(&database, pTimerSpawnRaidReuse, false)) && (!c->GetGM()) && (bindID < 1)) {
			c->Message(13,"You must wait %d minutes %d seconds and not use Feign Death before using the spawnraid command again.", ((remain)/60), (remain%60));
			return;
		}
		c->GetPTimers().Start(pTimerSpawnRaidReuse, 180);
		const int spawnedBots = database.SpawnedBotCount(c->CharacterID());
		if(c->IsBotRaiding() || c->IsGrouped() || spawnedBots) {
			c->Message(15, "You already have spawned bots.");
			MYSQL_RES* total = database.ListSpawnedBots(c->CharacterID());
			MYSQL_ROW row;
			if(mysql_num_rows(total) == spawnedBots) {
				for(int i=0; i<spawnedBots; i++) {
					row = mysql_fetch_row(total);
					char* longname;
					if(database.GetZoneLongName((char*)row[1], &longname, NULL, NULL, NULL, NULL, NULL, NULL)) {
						c->Message(15, "%s is in %s", row[0], longname);
						safe_delete(longname);
					}
				}
			}
			mysql_free_result(total);
			return;
		}
//		} //Raid Timer end
	     if(!strcasecmp(sep->arg[2], "agroup")){
		MYSQL_RES* groups = database.LoadBotGroups(c->CharacterID(),1,0,0);
		MYSQL_ROW row;
		int bots = mysql_num_rows(groups);
		const NPCType* tmp = 0;
		NPC* npc = 0;
		float myX = c->GetX();
		float myY = c->GetY();
		float myZ = c->GetZ();
		float myHeading = c->GetHeading();
		uint8 myLevel = BotLevel;
		for(int i=0; i<bots; i++) {
			row = mysql_fetch_row(groups);
			if(tmp = database.GetNPCType(atoi(row[1]))) {
				npc = new NPC(tmp, 0, myX, myY, myZ, myHeading, FlyMode3);
				tmp = 0;
				npc->SetLevel(myLevel);
				// fez_ajer: Set default behavior flags
				npc->CastToMob()->SetBotAutoMez(false);
				npc->CastToMob()->SetBotAutoDefend(false);
				entity_list.AddNPC(npc, true, true);
				npc->CastToMob()->SendAppearancePacket(AT_Linkdead, 0);
				
				database.SetBotLeader(npc->GetNPCTypeID(), c->CharacterID(), npc->GetName(), zone->GetShortName(), zone->GetZoneID());
				if(npc->GetClass()==MAGICIAN) {
					int8 pcID = database.GetMagePet(npc->GetNPCTypeID());
					if(pcID) {
						npc->SetPetChooser(true);
						npc->SetPetChooserID(pcID);
					}
				}
			}
		     }
		    mysql_free_result(groups);
		    return;
	     }
	     else if(!strcasecmp(sep->arg[2], "bgroup")){
		MYSQL_RES* groups = database.LoadBotGroups(c->CharacterID(),0,1,0);
		MYSQL_ROW row;
		int bots = mysql_num_rows(groups);
		const NPCType* tmp = 0;
		NPC* npc = 0;
		float myX = c->GetX();
		float myY = c->GetY();
		float myZ = c->GetZ();
		float myHeading = c->GetHeading();
		uint8 myLevel = BotLevel;
		for(int i=0; i<bots; i++) {
			row = mysql_fetch_row(groups);
			if(tmp = database.GetNPCType(atoi(row[1]))) {
				npc = new NPC(tmp, 0, myX, myY, myZ, myHeading, FlyMode3);
				tmp = 0;
				npc->SetLevel(myLevel);
				// fez_ajer: Set default behavior flags
				npc->CastToMob()->SetBotAutoMez(false);
				npc->CastToMob()->SetBotAutoDefend(false);
				entity_list.AddNPC(npc, true, true);
				npc->CastToMob()->SendAppearancePacket(AT_Linkdead, 0);
				
				database.SetBotLeader(npc->GetNPCTypeID(), c->CharacterID(), npc->GetName(), zone->GetShortName(), zone->GetZoneID());
				if(npc->GetClass()==MAGICIAN) {
					int8 pcID = database.GetMagePet(npc->GetNPCTypeID());
					if(pcID) {
						npc->SetPetChooser(true);
						npc->SetPetChooserID(pcID);
					}
				}
			}
		     }
		    mysql_free_result(groups);
		    return;
	     }
	     else if(!strcasecmp(sep->arg[2], "cgroup")){
		MYSQL_RES* groups = database.LoadBotGroups(c->CharacterID(),0,0,1);
		MYSQL_ROW row;
		int bots = mysql_num_rows(groups);
		const NPCType* tmp = 0;
		NPC* npc = 0;
		float myX = c->GetX();
		float myY = c->GetY();
		float myZ = c->GetZ();
		float myHeading = c->GetHeading();
		uint8 myLevel = BotLevel;
		for(int i=0; i<bots; i++) {
			row = mysql_fetch_row(groups);
			if(tmp = database.GetNPCType(atoi(row[1]))) {
				npc = new NPC(tmp, 0, myX, myY, myZ, myHeading, FlyMode3);
				tmp = 0;
				npc->SetLevel(myLevel);
				// fez_ajer: Set default behavior flags
				npc->CastToMob()->SetBotAutoMez(false);
				npc->CastToMob()->SetBotAutoDefend(false);
				entity_list.AddNPC(npc, true, true);
				npc->CastToMob()->SendAppearancePacket(AT_Linkdead, 0);
				
				database.SetBotLeader(npc->GetNPCTypeID(), c->CharacterID(), npc->GetName(), zone->GetShortName(), zone->GetZoneID());
				if(npc->GetClass()==MAGICIAN) {
					int8 pcID = database.GetMagePet(npc->GetNPCTypeID());
					if(pcID) {
						npc->SetPetChooser(true);
						npc->SetPetChooserID(pcID);
					}
				}
			}
		     }
		    mysql_free_result(groups);
		    return;
	     }
	    //if(!strcasecmp(sep->arg[2], "\0")){
	     c->Message(15, "usage #bot spawnraid [agroup], [bgroup], or [cgroup].");
	     return;
	    //}
	}

//SaveRaid
	if(!strcasecmp(sep->arg[1], "saveraid")) {
		if (((zone->IsClassic()) && (c->GetTarget() == NULL)) || ((!zone->CanRaid()) && (c->GetTarget() == NULL)) || 
		   ((!zone->CanRaid()) && (c->GetTarget() == c)) || ((!zone->CanRaid()) && (c->GetTarget()->IsBot()))){ 
			c->Message(15, "Target the mob and re-try the command.");
			return;
		}	  
		if((!zone->CanRaid()) && (BotLevel >= 50) && (target->GetLevel() <= 49)) {
			c->Message(15, "Targets level is trivial for you, must be at least level 50.");		  
			c->Message(15, "You cannot form raid groups in this zone.");
			return;
		}
		if((zone->IsClassic()) && (BotLevel >= 50) && (target->GetLevel() <= 49)){
			c->Message(15, "Targets level is trivial for you, must be at least level 50.");		  
			c->Message(15, "This zone is trivial for you, try a zone with higher level mobs.");
			return;
		}
		if(c->GetFeigned()){
            c->Message(15, "You can't save your raid while you are feigned.");
			return;
		}
		if(c->IsBotRaiding()) {
			BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
			if(br) {
				if(br->GetBotRaidAggro()) {
                    c->Message(15, "You can't save your raid while you are engaged.");
					return;
				}
			}
		}

		if(c->IsGrouped())
        {
			Group *g = entity_list.GetGroupByClient(c);
			for (int i=0; i<MAX_GROUP_MEMBERS; i++)
            {
				if(g && g->members[i] && !g->members[i]->qglobal && (g->members[i]->GetAppearance() != eaDead) && g->members[i]->IsEngaged())
                {
                    c->Message(15, "You can't save your raid while you are engaged.");
					return;
				}
				if(g && g->members[i] && g->members[i]->qglobal) {
					return;
				}
			}
		}
		//BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
	     if(!strcasecmp(sep->arg[2], "agroup")) {
	       BotRaids *br1 = entity_list.GetBotRaidByMob(c->CastToMob());
		if(br1) {
			br1->SaveGroups(c, 1, 0, 0);
			c->Message(15, "Your agroup raid is saved.");
		}
		else {
			Group *g = entity_list.GetGroupByClient(c);
			if(g) {
				database.DeleteBotGroups(c->CharacterID(), 1, 0, 0);
				for(int j=0; j<MAX_GROUP_MEMBERS; j++) {
					if(g->members[j]) {
						if(g->members[j]->IsClient()) {
							continue;
						}
						database.SaveBotGroups(0, c->CharacterID(), g->members[j]->GetNPCTypeID(), 1, 0, 0, j);
					}
				}
				c->Message(15, "Your agroup raid is saved.");
			}
			else {
				c->Message(15, "You need to have a raid to save a raid.");
			}
		}
		return;
	    }
	   else if(!strcasecmp(sep->arg[2], "bgroup")) {
	     BotRaids *br2 = entity_list.GetBotRaidByMob(c->CastToMob());
		if(br2) {
			br2->SaveGroups(c, 0, 1, 0);
			c->Message(15, "Your bgroup raid is saved.");
		}
		else {
			Group *g = entity_list.GetGroupByClient(c);
			if(g) {
				database.DeleteBotGroups(c->CharacterID(), 1, 0, 0);
				for(int k=0; k<MAX_GROUP_MEMBERS; k++) {
					if(g->members[k]) {
						if(g->members[k]->IsClient()) {
							continue;
						}
						database.SaveBotGroups(0, c->CharacterID(), g->members[k]->GetNPCTypeID(), 0, 1, 0, k);
					}
				}
				c->Message(15, "Your bgroup raid is saved.");
			}
			else {
				c->Message(15, "You need to have a raid to save a raid.");
			}
		}
		return;
	    }
	   else if (!strcasecmp(sep->arg[2], "cgroup")) {
	     BotRaids *br3 = entity_list.GetBotRaidByMob(c->CastToMob());
		if(br3) {
			br3->SaveGroups(c, 0, 0, 1);
			c->Message(15, "Your cgroup raid is saved.");
		}
		else {
			Group *g = entity_list.GetGroupByClient(c);
			if(g) {
				database.DeleteBotGroups(c->CharacterID(), 0, 0, 1);
				for(int m=0; m<MAX_GROUP_MEMBERS; m++) {
					if(g->members[m]) {
						if(g->members[m]->IsClient()) {
							continue;
						}
						database.SaveBotGroups(0, c->CharacterID(), g->members[m]->GetNPCTypeID(), 0, 0, 1, m);
					}
				}
				c->Message(15, "Your cgroup raid is saved.");
			}
			else {
				c->Message(15, "You need to have a raid to save a raid.");
			}
		}
		return;
	    }
	    //if(!strcasecmp(sep->arg[2], "\0"))
	     c->Message(15, "usage #bot saveraid [agroup], [bgroup], or [cgroup].");
		return;
	}

//Add a bot to the group
	if((!strcasecmp(sep->arg[1], "group") && (!strcasecmp(sep->arg[2], "add"))) || (!strcasecmp(sep->arg[1], "add"))){
		if(c->GetFeigned()) {
		    c->Message(15, "You can't create bot groups while feigned!");
			return;
		}
		if (c->CheckAggro(c)) {
			c->Message(15, "You can not add bots while you are aggroed.");
			return;
		}
		if(c->GetAggroCount() > 0){
			c->Message(15, "You can't add bots to your group while a monster has aggro on you.");
			return;
		}
		if(c->IsBotRaiding()) {
			BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
			if(br) {
				if(br->GetBotRaidAggro()) {
                    c->Message(15, "You can't create bot groups while you are engaged.");
					return;
				}
			}
		}
		if(c->IsGrouped()){
			Group *g = entity_list.GetGroupByMob(c);  //engaged
			for (int i=0; i<MAX_GROUP_MEMBERS; i++) {
                if(g && g->members[i] && g->members[i]->IsEngaged()){
                    c->Message(15, "You can't create bot groups while you are engaged.");
					return;
				}
			}
		}
		if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot()){
		    c->Message(15, "You must target a bot!");
			return;
		}
		if(c->GetTarget()->IsClient()){
		    c->Message(15, "You can't invite clients this way.");
			return;
		}

		if ( c->IsGrouped() ){
		  Group *g = entity_list.GetGroupByClient(c);
			if(g && (g->BotGroupCount() > 5)){
                c->Message(15, "There is no more room in your group.");
				/*Mob* kmob = c->GetTarget();
				if(kmob != NULL) {
					kmob->BotOwner = NULL;
					kmob->BotDepop();
				} */
				return;
			}
		}
		if(c->IsGrouped()) {
		  Group *g = entity_list.GetGroupByClient(c);
			if(g && (c->CastToMob() != g->members[0])) {
				c->Message(15, "Only the group leader can add bots.");
				Mob* kmob = c->GetTarget();
				if(kmob != NULL) {
					kmob->BotOwner = NULL;
					kmob->BotDepop();
				}
				return;
			}
		}
		if(c->GetTarget()->IsMob() && !c->GetTarget()->IsPet()){
		  Mob *b = c->GetTarget();
			// Is our target "botable" ?
			if(b && !b->IsBot()){
			  b->Say("I can't be a bot!");
				return;
			}

			if(database.GetBotOwner(b->GetNPCTypeID()) != c->CharacterID()){
			  b->Say("I can't be your bot, you are not my owner.");
				return;
			}
			// Is he already grouped ?
			if(b->IsGrouped()){
			  b->BotSay("I'm already grouped!");
				return;
			}
			bool HasGrouP = database.BotHasGroup(b->GetNPCTypeID(), c->CharacterID());
			int32 SavedGroupID = database.GetSavedBotGroupID(b->GetNPCTypeID());
			int32 groupID = database.GetBotGroupID(c->CharacterID());
			if (groupID < 20){ 
			    if((HasGrouP) && (SavedGroupID != groupID)){
				c->Message(15, "Bot already in one of your saved raid groups.");
				c->Message(15, "For forming bot raid groups or saving multiple groups, specify a groupID. GroupIDs under 20 are reserved for raid groups and have restrictions (you can't save the same bot in other raid groups).");
				c->Message(15, "If you still want to reuse this bot for single group hunting, first save this group to groupID 20 or higher (example #bot savegroup 20), then re-try #bot spawn and #bot add.");
				b->BotDepop();
				return;
			  }
			}
			// else, we do:
			//1: Set its leader
			b->Say("I'm becoming %s\'s bot!", c->GetName());

			//2: Set the follow ID so he's following its leader
			b->SetFollowID(c->GetID());
			b->BotOwner = c->CastToMob();
			b->SetOwnerID(0);
			c->CastToMob()->SetOwnerID(0);
			int32 GroupID = database.GetBotGroupID(c->CharacterID());

			//3:  invite it to the group
			if(!c->IsGrouped()) {
				Group *g = new Group(c->CastToMob());
				g->AddMember(b);
				entity_list.AddGroup(g);
				c->SaveBotGroup(20, c);
				// update group AAs
				g->UpdateGroupAAs();
				g->SendLeadershipAAUpdate();
			}
			else {
				c->GetGroup()->AddMember(b);
				c->SaveBotGroup(GroupID, c);
			}
				// Angelox: regroups them if leader bot is disbanded.
				Group *g = c->GetGroup();
				for (int i=0; i<MAX_GROUP_MEMBERS; i++) {
				    if(g->members[i] && g->members[i]->IsBot()) {
					g->members[i]->SetFollowID(c->GetID());
				    }
				}
			if(c->IsBotRaiding()) {
				b->SetBotRaiding(true);
				b->SetBotRaidID(c->CastToMob()->GetBotRaidID());
			}
/*  This was the old load It piece
			uint32 itemID = 0;
			const Item_Struct* item2 = NULL;
			for(int i=0; i<22; i++) {
				itemID = database.GetBotItemBySlot(b->GetNPCTypeID(), i);
				if(itemID != 0) {
					item2 = database.GetItem(itemID);
					c->BotTradeAddItem(itemID, item2->MaxCharges, item2->Slots, i, b->CastToNPC(), false);
				}
			}
*/
			b->CalcBotStats();
			b->SendPosUpdate();
//BotHelp
			if(b->GetClass() == CLERIC) {
				b->BotSay("I have the following additional commands available at your request: #bot heal, #bot healme, #bot gheal, #bot petheal, #bot sheal, #bot cheal, #bot rez, #bot temperance, #bot pacify, #bot bindme, #bot cure, #bot resist.");
				b->BotSay("Use #bot cleric help, if you wish to see my commands again");
			}
			else if (b->GetClass() == WIZARD){
				b->BotSay("I have the following additional commands available at your request: #bot invis, #bot gate, #bot levitate, #bot lore.");
				b->BotSay("Use #bot wizard help, if you wish to see my commands again");
			}
			else if (b->GetClass() == RANGER){
				b->BotSay("I have the following additional commands available at your request: #bot sow, #bot track, #bot levitate, #bot archery, #bot resist, #bot endureb.");
				b->BotSay("Use #bot ranger help, if you wish to see my commands again");
			}
			else if (b->GetClass() == DRUID){
				b->BotSay("I have the following additional commands available at your request: #bot heal, #bot healme, #bot petheal, #bot sheal, #bot sow, #bot invis, #bot charm, #bot track, #bot levitate, #bot gate, #bot endureb, #bot cure, #bot resist, #bot evac, #bot skin.");
				b->BotSay("Use #bot druid help, if you wish to see my commands again");
			}
			else if (b->GetClass() == SHAMAN){
				b->BotSay("I have the following additional commands available at your request: #bot heal, #bot healme, #bot petheal, #bot sheal, #bot sow, #bot invis, #bot slow, #bot levitate, #bot shrink, #bot endureb, #bot cure, #bot resist.");
				b->BotSay("Use #bot shaman help, if you wish to see my commands again");
			}
			else if (b->GetClass() == NECROMANCER){
				b->BotSay("I have the following additional commands available at your request: #bot charm, #bot invis, #bot levitate, #bot corpse summon, #bot lore.");
				b->BotSay("Use #bot necromancer help, if you wish to see my commands again");
			}
			else if (b->GetClass() == ROGUE){
				b->BotSay("I have the following additional commands available at your request: #bot picklock, #bot archery.");
				b->BotSay("Use #bot rogue help, if you wish to see my commands again");
			}
			else if (b->GetClass() == ENCHANTER){
				b->BotSay("I have the following additional commands available at your request: #bot invis, #bot rune, #bot slow, #bot pacify, #bot charm, #bot dire charm, #bot auto mez, #bot ai mez, #bot tash, #bot wtash, #bot levitate, #bot endureb.");
				b->BotSay("Use #bot enchanter help, if you wish to see my commands again");
			}
			else if (b->GetClass() == BEASTLORD){
				b->BotSay("I have the following additional commands available at your request: #bot slow, #bot sow, #bot levitate, #bot shrink.");
				b->BotSay("Use #bot beastlord help, if you wish to see my commands again");
			}
			else if (b->GetClass() == BARD){
				b->BotSay("I have the following additional command available at your request: #bot track, #bot auto mez.");
				b->BotSay("Use #bot bard help, if you wish to see my commands again");
			}
			else if (b->GetClass() == MAGICIAN){
				b->BotSay("I have the following additional commands available at your request: #bot invis, #bot magepet, #bot levitate, #bot lore.");
				b->BotSay("Use #bot magician help, if you wish to see my commands again");
			}
		}
		return;
	}

	/*if((!strcasecmp(sep->arg[1], "group")) && (!strcasecmp(sep->arg[2], "remove"))){
		c->Message(15, "You need to group with a bot for this");
		c->Message(15, "It's better to use your groups [Disband] button.");
		c->Message(15, "For individual bot removal, target the desired bot and press your [Disband] button.");
		c->Message(15, "For total group removal, don't target anything, then press your[Disband] button.");
		return;
	}*/
	if((!strcasecmp(sep->arg[1], "group")) && (!strcasecmp(sep->arg[2], "remove"))) { //Angelox
		//if (entity_list.GetGroupByMob(c)->BotGroupCount() < 3) {
			c->Message(15, "Use your groups [Disband] button.");
			c->Message(15, "For individual bot removal, target the desired bot and press your [Disband] button.");
			c->Message(15, "For total group removal, don't target anything, then press your[Disband] button.");	    
			return;
		//}
		/*if(c->GetTarget() != NULL) {
			if(c->GetTarget()->IsBot() && (c->GetTarget()->GetBotLeader() == c->CharacterID())) {
				if(c->GetTarget()->IsGrouped()) {
					Group *g = entity_list.GetGroupByMob(c->GetTarget());
					if(g && g->members[0]) {
						if(g->members[0] == c->GetTarget()) {
							for(int i=5; i>=0; i--) {
								if(g->members[i]) {
									c->GetTarget()->SpellOnTarget(42, t);                        
									g->members[i]->BotOwner = NULL;
									g->members[i]->BotKill();
									c->SaveBotGroup(c);
									c->Message(15, "It's better to use your groups [Disband] button.");
									c->Message(15, "For individual bot removal, target the desired bot and press your [Disband] button.");
									c->Message(15, "For total group removal, don't target anything, then press your[Disband] button.");	    
								}
							}
						}
						else {
							c->GetTarget()->SpellOnTarget(42, t);
							c->GetTarget()->BotOwner = NULL;
							c->GetTarget()->BotKill();
							c->SaveBotGroup(c);
							c->Message(15, "It's better to use your groups [Disband] button.");
							c->Message(15, "For individual bot removal, target the desired bot and press your [Disband] button.");
							c->Message(15, "For total group removal, don't target anything, then press your[Disband] button.");	
						}
						if(g->BotGroupCount() < 3) {
							c->SaveBotGroup(c);
							g->DisbandGroup();
							c->Message(15, "It's better to use your groups [Disband] button.");
							c->Message(15, "For individual bot removal, target the desired bot and press your [Disband] button.");
							c->Message(15, "For total group removal, don't target anything, then press your[Disband] button.");
						}
					}
				}
				else {
					c->GetTarget()->SpellOnTarget(42, t);
					c->GetTarget()->BotOwner = NULL;
					c->GetTarget()->BotKill();
					c->SaveBotGroup(c);
				}
				if(c->IsBotRaiding()) {
					if(database.SpawnedBotCount(c->CharacterID()) < 6) {
						entity_list.RemoveBotRaid(c->CastToMob()->GetBotRaidID());
						Group *g = c->GetGroup();
						if(g) {
							for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
								if(g->members[i]) {
									g->members[i]->SetBotRaidID(0);
									g->members[i]->SetBotRaiding(false);
								}
							}
						}
					}
				
			}
			else {
				c->Message(15, "You must target a bot first.");
			}}*/
		}
		/*else {
			c->Message(15, "You must target a bot first.");
		}
		return;
	}*/

//Angelox New Commands Start
	if(!c->IsGrouped()) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	else if(!strcasecmp(sep->arg[1], "follow")) {
		if(c->IsBotRaiding()) {
			BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
			  if(!strcasecmp(sep->arg[2], "close"))
			    br->FollowGuardCmd(c, false, true);
			  else if(!strcasecmp(sep->arg[2], "normal"))
			    br->FollowGuardCmd(c, false, false);
			  else
			    c->Message(15, "Usage: #bot follow [close] or [normal].");
		}
		else if(c->IsGrouped()){
			Group *g = c->GetGroup();
			bool isClose = false;
			if(g) {
			  if(!strcasecmp(sep->arg[2], "close"))
			    isClose = true;
			  else if(!strcasecmp(sep->arg[2], "normal"))
			    isClose = false;
			  else{
			    c->Message(15, "Usage: #bot follow [close] or [normal].");
			    return;
			  }
				int32 botfollowid = 0;
				const char* botfollowname = NULL;
				for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
					if(g->members[i] && g->members[i]->IsBot()) {
						if(botfollowid == 0) {
							g->members[i]->SetTarget(c);
							botfollowid = g->members[i]->GetID();
							botfollowname = g->members[i]->GetName();
							g->members[i]->SetFollowID(c->GetID());
							      if (g->members[i]->GetTarget()->IsClient()){
								if (!isClose)
								   g->members[i]->BotSay("Following %s normal mode.", c->GetName());
								else
								   g->members[i]->BotSay("Following %s as close as possible.", c->GetName());
							      }
						}
						else {
							g->members[i]->SetFollowID(botfollowid);
							      if (!isClose)							
								   botfollowid = g->members[i]->GetID();
						}
						g->members[i]->WipeHateList();
						  if (database.BotSpamLookup(database.GetBotOwner(g->members[i]->GetNPCTypeID())) < 2)
						      g->members[i]->SetBotChat(true);
					}
				}
			}
		}
		return;
	}
    else if(!strcasecmp(sep->arg[1], "guard")) {
		if(c->IsBotRaiding()) {
		    BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
		    br->FollowGuardCmd(c, true, false);
		}
		else if(c->IsGrouped())
		{
			Group *g = c->GetGroup();
			if(g) {
				for(int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					if(g->members[i] && g->members[i]->IsBot()) {
						if(g->members[i]->IsMoving()){
						    c->Message(15, "You can't be moving for this command.");
						    return;
						}
						    if ((g->members[i]->GetTarget())&&(g->members[i]->GetTarget()->IsClient())){
							    g->members[i]->BotSay("Waiting here.");
							    g->members[i]->SetFollowID(0);
							    g->members[i]->WipeHateList();
							    g->members[i]->SetBotChat(false);
						    }
						    if (g->members[i]->GetTarget()){
							    g->members[i]->SetFollowID(0);
							    g->members[i]->WipeHateList();
							    g->members[i]->SetBotChat(false);
						    }
						    else
							    c->Message(15, "Already in guard mode.");
						 return;
					}
				}
			}
		}
		return;
	}
	else if(!strcasecmp(sep->arg[1], "attack")) {
		if (((zone->IsClassic()) && (c->GetTarget() == NULL)) || ((!zone->CanRaid()) && (c->GetTarget() == NULL)) || 
		   ((!zone->CanRaid()) && (c->GetTarget() == c)) || ((!zone->CanRaid()) && (c->GetTarget()->IsBot()))){ 
			c->Message(15, "Target the mob and re-try the command.");
			return;
		}	  
		if((!zone->CanRaid()) && (c->IsBotRaiding()) && ((BotLevel >= 50) && (target->GetLevel() <= 49))) {
			c->Message(15, "You cannot form raid groups in this zone.");
			return;
		}
		if((zone->IsClassic()) && (BotLevel >= 50) && (target->GetLevel() <= 49)){
			c->Message(15, "Targets level is trivial for you, must be at least level 50.");		  
			c->Message(15, "This zone is trivial for you, try a zone with higher level mobs.");
			return;
		}
		if(!c->IsGrouped()){
			c->Message(15, "You need to group with a bot for this");
			return;
		}
		if(c->IsGrouped() && (c->GetTarget() != NULL) && c->IsAttackAllowed(c->GetTarget()))
		{
			//break invis when you attack
			if(c->invisible) {
				c->BuffFadeByEffect(SE_Invisibility);
				c->BuffFadeByEffect(SE_Invisibility2);
				c->invisible = false;
			}
			if(c->invisible_undead) {
				c->BuffFadeByEffect(SE_InvisVsUndead);
				c->BuffFadeByEffect(SE_InvisVsUndead2);
				c->invisible_undead = false;
			}
			if(c->invisible_animals){
				c->BuffFadeByEffect(SE_InvisVsAnimals);
				c->invisible_animals = false;
			}
			if(c->hidden || c->improved_hidden){
				c->hidden = false;
				c->improved_hidden = false;
				EQApplicationPacket* outapp = new EQApplicationPacket(OP_SpawnAppearance, sizeof(SpawnAppearance_Struct));
				SpawnAppearance_Struct* sa_out = (SpawnAppearance_Struct*)outapp->pBuffer;
				sa_out->spawn_id = c->GetID();
				sa_out->type = 0x03;
				sa_out->parameter = 0;
				entity_list.QueueClients(c, outapp, true);
				safe_delete(outapp);
			}

			if(c->GetTarget() && c->GetTarget()->IsBot()) {
				return;
			}

			c->SetOrderBotAttack(true);
			if(c->IsBotRaiding())
			{
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
				if(br)
				{
					c->SetOrderBotAttack(true);
					br->AddBotRaidAggro(c->GetTarget());
					c->SetOrderBotAttack(false);
				}
			}
			else {
				Group *g = entity_list.GetGroupByMob(c->CastToMob());
				if(g)
				{
					for(int i=0; i<MAX_GROUP_MEMBERS; i++)
					{
						if(g->members[i] && g->members[i]->IsBot())
						{
							c->SetOrderBotAttack(true);
						      //if (g->members[i]->CheckLosFN(target) && c->CheckLosFN(target))
							  g->members[i]->AddToHateList(c->GetTarget(), 1);
						      //else
							  //c->Message(15, "No line of sight.");
							c->SetOrderBotAttack(false);
						}
					}
				}
			}
			c->SetOrderBotAttack(false);
		}
		else
		{
			c->Message(15, "You must target a monster.");
		}
		return;
	}
	else if(!strcasecmp(sep->arg[1], "assist")) {
		if (((zone->IsClassic()) && (c->GetTarget() == NULL)) || ((!zone->CanRaid()) && (c->GetTarget() == NULL)) || 
		   ((!zone->CanRaid()) && (c->GetTarget() == c)) || ((!zone->CanRaid()) && (c->GetTarget()->IsBot()))){ 
			c->Message(15, "Target the mob and re-try the command.");
			return;
		}	  
		if((!zone->CanRaid()) && (c->IsBotRaiding()) && ((BotLevel >= 50) && (target->GetLevel() <= 49))) {
			c->Message(15, "You cannot form raid groups in this zone.");
			return;
		}
		if((zone->IsClassic()) && (BotLevel >= 50) && (target->GetLevel() <= 49)){
			c->Message(15, "Targets level is trivial for you, must be at least level 50.");		  
			c->Message(15, "This zone is trivial for you, try a zone with higher level mobs.");
			return;
		}
		if(!c->IsGrouped()){
			c->Message(15, "You need to group with a bot for this");
			return;
		}
		if(c->IsGrouped() && (c->GetTarget() != NULL) && c->IsAttackAllowed(c->GetTarget()))
		{
			//break invis when you attack
			if(c->invisible) {
				c->BuffFadeByEffect(SE_Invisibility);
				c->BuffFadeByEffect(SE_Invisibility2);
				c->invisible = false;
			}
			if(c->invisible_undead) {
				c->BuffFadeByEffect(SE_InvisVsUndead);
				c->BuffFadeByEffect(SE_InvisVsUndead2);
				c->invisible_undead = false;
			}
			if(c->invisible_animals){
				c->BuffFadeByEffect(SE_InvisVsAnimals);
				c->invisible_animals = false;
			}
			if(c->hidden || c->improved_hidden){
				c->hidden = false;
				c->improved_hidden = false;
				EQApplicationPacket* outapp = new EQApplicationPacket(OP_SpawnAppearance, sizeof(SpawnAppearance_Struct));
				SpawnAppearance_Struct* sa_out = (SpawnAppearance_Struct*)outapp->pBuffer;
				sa_out->spawn_id = c->GetID();
				sa_out->type = 0x03;
				sa_out->parameter = 0;
				entity_list.QueueClients(c, outapp, true);
				safe_delete(outapp);
			}

			if(c->GetTarget() && c->GetTarget()->IsBot()) {
				return;
			}
				Group *g = entity_list.GetGroupByMob(c->CastToMob());
				if(g){
					for(int i=0; i<MAX_GROUP_MEMBERS; i++)
					{
						if(g->members[i] && g->members[i]->IsBot())
						{
							g->members[i]->WipeHateList();
							c->SetOrderBotAttack(true);
							g->members[i]->AddToHateList(c->GetTarget(), 1);
							c->SetOrderBotAttack(false);
						}
					}
				}
/*			if(c->IsBotRaiding())
			{
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
				if(br)
				{
					c->SetOrderBotAttack(true);
					br->AddBotRaidAggro(c->GetTarget());
					c->SetOrderBotAttack(false);
				}
			}
			else {
				Group *g = entity_list.GetGroupByMob(c->CastToMob());
				if(g)
				{
					for(int i=0; i<MAX_GROUP_MEMBERS; i++)
					{
						if(g->members[i] && g->members[i]->IsBot())
						{
							c->SetOrderBotAttack(true);
							g->members[i]->AddToHateList(c->GetTarget(), 1);
							c->SetOrderBotAttack(false);
						}
					}
				} 
			}*/
			//c->SetOrderBotAttack(false);
		}
		else
		{
			c->Message(15, "You must target a monster.");
		}
	return;
  }
	else if((!strcasecmp(sep->arg[1], "single")) && (!strcasecmp(sep->arg[2], "assist"))) {
		if (((zone->IsClassic()) && (c->GetTarget() == NULL)) || ((!zone->CanRaid()) && (c->GetTarget() == NULL)) || 
		   ((!zone->CanRaid()) && (c->GetTarget() == c)) || ((!zone->CanRaid()) && (c->GetTarget()->IsBot()))){ 
			c->Message(15, "Target the mob and re-try the command.");
			return;
		}	  
		if((!zone->CanRaid()) && (c->IsBotRaiding()) && ((BotLevel >= 50) && (target->GetLevel() <= 49))) {
			c->Message(15, "You cannot form raid groups in this zone.");
			return;
		}
		if((zone->IsClassic()) && (BotLevel >= 50) && (target->GetLevel() <= 49)){
			c->Message(15, "Targets level is trivial for you, must be at least level 50.");		  
			c->Message(15, "This zone is trivial for you, try a zone with higher level mobs.");
			return;
		}
		if(!c->IsGrouped()){
			c->Message(15, "You need to group with a bot for this");
			return;
		}
		if(c->IsGrouped() && (c->GetTarget() != NULL) && c->IsAttackAllowed(c->GetTarget()))
		{
			//break invis when you attack
			if(c->invisible) {
				c->BuffFadeByEffect(SE_Invisibility);
				c->BuffFadeByEffect(SE_Invisibility2);
				c->invisible = false;
			}
			if(c->invisible_undead) {
				c->BuffFadeByEffect(SE_InvisVsUndead);
				c->BuffFadeByEffect(SE_InvisVsUndead2);
				c->invisible_undead = false;
			}
			if(c->invisible_animals){
				c->BuffFadeByEffect(SE_InvisVsAnimals);
				c->invisible_animals = false;
			}
			if(c->hidden || c->improved_hidden){
				c->hidden = false;
				c->improved_hidden = false;
				EQApplicationPacket* outapp = new EQApplicationPacket(OP_SpawnAppearance, sizeof(SpawnAppearance_Struct));
				SpawnAppearance_Struct* sa_out = (SpawnAppearance_Struct*)outapp->pBuffer;
				sa_out->spawn_id = c->GetID();
				sa_out->type = 0x03;
				sa_out->parameter = 0;
				entity_list.QueueClients(c, outapp, true);
				safe_delete(outapp);
			}

			if(c->GetTarget() && c->GetTarget()->IsBot()) {
				return;
			}
				Group *g = entity_list.GetGroupByMob(c->CastToMob());
				if(g){
					for(int i=0; i<MAX_GROUP_MEMBERS; i++)
					{
						if(g->members[i] && g->members[i]->IsBot())
						{
						  if (g->members[i]->GetClass() == MONK){ 
							g->members[i]->WipeHateList();
							c->SetOrderBotAttack(true);
							g->members[i]->AddToHateList(c->GetTarget(), 1);
							//c->SetOrderBotAttack(false);
							break;}
						  else if (g->members[i]->GetClass() == PALADIN){ 
							g->members[i]->WipeHateList();
							c->SetOrderBotAttack(true);
							g->members[i]->AddToHateList(c->GetTarget(), 1);
							//c->SetOrderBotAttack(false);
							break;}
						  else if (g->members[i]->GetClass() == RANGER){ 
							g->members[i]->WipeHateList();
							c->SetOrderBotAttack(true);
							g->members[i]->AddToHateList(c->GetTarget(), 1);
							//c->SetOrderBotAttack(false);
							break;}
						  else if (g->members[i]->GetClass() == SHADOWKNIGHT){ 
							g->members[i]->WipeHateList();
							c->SetOrderBotAttack(true);
							g->members[i]->AddToHateList(c->GetTarget(), 1);
							//c->SetOrderBotAttack(false);
							break;}
						  else if (g->members[i]->GetClass() == BERSERKER){ 
							g->members[i]->WipeHateList();
							c->SetOrderBotAttack(true);
							g->members[i]->AddToHateList(c->GetTarget(), 1);
							//c->SetOrderBotAttack(false);
							break;}
						  else if (g->members[i]->GetClass() == ROGUE){ 
							g->members[i]->WipeHateList();
							c->SetOrderBotAttack(true);
							g->members[i]->AddToHateList(c->GetTarget(), 1);
							//c->SetOrderBotAttack(false);
							break;}
						  else if (g->members[i]->GetClass() == WARRIOR){ 
							g->members[i]->WipeHateList();
							c->SetOrderBotAttack(true);
							g->members[i]->AddToHateList(c->GetTarget(), 1);
							//c->SetOrderBotAttack(false);
							break;}
						/*  else{ 
							c->Message(15, "You need a fighter bot for this");							
							break;}  */
						}
					}
				}
/*			if(c->IsBotRaiding())
			{
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
				if(br)
				{
					c->SetOrderBotAttack(true);
					br->AddBotRaidAggro(c->GetTarget());
					c->SetOrderBotAttack(false);
				}
			}
			else {
				Group *g = entity_list.GetGroupByMob(c->CastToMob());
				if(g)
				{
					for(int i=0; i<MAX_GROUP_MEMBERS; i++)
					{
						if(g->members[i] && g->members[i]->IsBot())
						{
							c->SetOrderBotAttack(true);
							g->members[i]->AddToHateList(c->GetTarget(), 1);
							c->SetOrderBotAttack(false);
						}
					}
				} */
			}
			//c->SetOrderBotAttack(false);
		else
		{
			c->Message(15, "You must target a monster.");
		}
	return;
  }
// Angelox End

// Original Group Order commands
	if(!strcasecmp(sep->arg[1], "group") && !strcasecmp(sep->arg[2], "order")){
		if(!c->IsGrouped()){
			c->Message(15, "You need to group with a bot for this");
			return;
		}
	else if(!strcasecmp(sep->arg[3], "follow")) {
		if(c->IsBotRaiding()) {
			BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
			  if(!strcasecmp(sep->arg[4], "close"))
			    br->FollowGuardCmd(c, false, true);
			  else if(!strcasecmp(sep->arg[4], "normal"))
			    br->FollowGuardCmd(c, false, false);
			  else
			    c->Message(15, "Usage: #bot follow [close] or [normal].");
		}
		else if(c->IsGrouped()){
			Group *g = c->GetGroup();
			bool isClose = false;
			if(g) {
			  if(!strcasecmp(sep->arg[4], "close"))
			    isClose = true;
			  else if(!strcasecmp(sep->arg[4], "normal"))
			    isClose = false;
			  else{
			    c->Message(15, "Usage: #bot follow [close] or [normal].");
			    return;
			  }
				int32 botfollowid = 0;
				const char* botfollowname = NULL;
				for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
					if(g->members[i] && g->members[i]->IsBot()) {
						if(botfollowid == 0) {
							g->members[i]->SetTarget(c);
							botfollowid = g->members[i]->GetID();
							botfollowname = g->members[i]->GetName();
							g->members[i]->SetFollowID(c->GetID());
							      if (g->members[i]->GetTarget()->IsClient()){
								if (!isClose)
								   g->members[i]->BotSay("Following %s normal mode.", c->GetName());
								else
								   g->members[i]->BotSay("Following %s as close as possible.", c->GetName());
							      }
						}
						else {
							g->members[i]->SetFollowID(botfollowid);
							      if (!isClose)							
								   botfollowid = g->members[i]->GetID();
						}
						g->members[i]->WipeHateList();
						  if (database.BotSpamLookup(database.GetBotOwner(g->members[i]->GetNPCTypeID())) < 2)
						      g->members[i]->SetBotChat(true);
					}
				}
			}
		}
		return;
	}
    else if(!strcasecmp(sep->arg[3], "guard")) {
		if(c->IsBotRaiding()) {
		    BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
		    br->FollowGuardCmd(c, true, false);
		}
		else if(c->IsGrouped())
		{
			Group *g = c->GetGroup();
			if(g) {
				for(int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					if(g->members[i] && g->members[i]->IsBot()) {
						if(g->members[i]->IsMoving()){
						    c->Message(15, "You can't be moving for this command.");
						    return;
						}
						g->members[i]->SetFollowID(0);
						g->members[i]->WipeHateList();
						g->members[i]->SetBotChat(false);
						    if (g->members[i]->GetTarget()->IsClient())
							g->members[i]->BotSay("Waiting here.");
					}
				}
			}
		}
		return;
	}
		else if(!strcasecmp(sep->arg[3], "attack")){
			if (((zone->IsClassic()) && (c->GetTarget() == NULL)) || ((!zone->CanRaid()) && (c->GetTarget() == NULL)) || 
				((!zone->CanRaid()) && (c->GetTarget() == c)) || ((!zone->CanRaid()) && (c->GetTarget()->IsBot()))){ 
					c->Message(15, "Target the mob and re-try the command.");
					return;
			}	  
			if((!zone->CanRaid()) && (c->IsBotRaiding()) && ((BotLevel >= 50) && (target->GetLevel() <= 49))) {
				c->Message(15, "You cannot form raid groups in this zone.");
				return;
			}
			if((zone->IsClassic()) && (BotLevel >= 50) && (target->GetLevel() <= 49)){
				c->Message(15, "Targets level is trivial for you, must be at least level 50.");		  
				c->Message(15, "This zone is trivial for you, try a zone with higher level mobs.");
				return;
			}
			if(!c->IsGrouped()){
				c->Message(15, "You need to group with a bot for this");
				return;
			}
			if(c->IsGrouped() && (c->GetTarget() != NULL) && c->IsAttackAllowed(c->GetTarget())){
				//break invis when you attack
				if(c->invisible) {
					c->BuffFadeByEffect(SE_Invisibility);
					c->BuffFadeByEffect(SE_Invisibility2);
					c->invisible = false;
				}
				if(c->invisible_undead) {
					c->BuffFadeByEffect(SE_InvisVsUndead);
					c->BuffFadeByEffect(SE_InvisVsUndead2);
					c->invisible_undead = false;
				}
				if(c->invisible_animals){
					c->BuffFadeByEffect(SE_InvisVsAnimals);
					c->invisible_animals = false;
				}
				if(c->hidden || c->improved_hidden){
					c->hidden = false;
					c->improved_hidden = false;
					EQApplicationPacket* outapp = new EQApplicationPacket(OP_SpawnAppearance, sizeof(SpawnAppearance_Struct));
					SpawnAppearance_Struct* sa_out = (SpawnAppearance_Struct*)outapp->pBuffer;
					sa_out->spawn_id = c->GetID();
					sa_out->type = 0x03;
					sa_out->parameter = 0;
					entity_list.QueueClients(c, outapp, true);
					safe_delete(outapp);
				}

				if(c->GetTarget() && c->GetTarget()->IsBot()){
					return;
				}

				c->SetOrderBotAttack(true);
				if(c->IsBotRaiding()){
					BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
					if(br){
						c->SetOrderBotAttack(true);
						br->AddBotRaidAggro(c->GetTarget());
						c->SetOrderBotAttack(false);
					}
				}
				else{
					Group *g = entity_list.GetGroupByMob(c->CastToMob());
					if(g){
						for(int i=0; i<MAX_GROUP_MEMBERS; i++){
							if(g->members[i] && g->members[i]->IsBot()){
								c->SetOrderBotAttack(true);
								g->members[i]->AddToHateList(c->GetTarget(), 1);
								c->SetOrderBotAttack(false);
							}
						}
					}
				}
				c->SetOrderBotAttack(false);
			}
			else{
				c->Message(15, "You must target a monster.");
			}
		}
		return;
	}

	if(!strcasecmp(sep->arg[1], "inventory") && !strcasecmp(sep->arg[2], "list")){
        if(c->GetTarget() != NULL){
            if(c->GetTarget()->IsBot() && (c->GetTarget()->BotOwner == c->CastToMob())){
                Mob* b = c->GetTarget();	
				const char* equipped[22] = {"Charm", "Left Ear", "Head", "Face", "Right Ear", "Neck", "Shoulders", "Arms", "Back",
											"Left Wrist", "Right Wrist", "Range", "Hands", "Primary Hand", "Secondary Hand",
											"Left Finger", "Right Finger", "Chest", "Legs", "Feet", "Waist", "Ammo" };
				
				const ItemInst* item1 = NULL;
				const Item_Struct* item2 = NULL;
				bool is2Hweapon = false;
				for(int i=0; i<22; ++i){
					if((i == 14) && is2Hweapon){
						continue;
					}

					item1 = b->GetBotItem(b->CastToNPC(), i);
					if(item1)
						item2 = item1->GetItem();
					else
						item2 = NULL;

					if(!TempErrorMessage.empty()) {
						c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
						return;
					}
					if(item2 == 0) {
						b->BotSay("I need something for my %s (Item %i)", equipped[i], i);
						continue;
					}
					if((i == 13) && ((item2->ItemType == ItemType2HS) || (item2->ItemType == ItemType2HB) || (item2->ItemType == ItemType2HPierce))) {
						is2Hweapon = true;
					}

					char* itemLink = 0;
					if((i == 0) || (i == 11) || (i == 13) || (i == 14) || (i == 21)) {
						if (c->GetClientVersion() == EQClientSoF)
						{
							MakeAnyLenString(&itemLink, "%1X" "%05X" "%05X" "%05X" "%05X" "%05X" "%05X" "%1X" "%04X" "%1X" "%05X" "%08X", 
								0,
								item2->ID, 
								item1->GetAugmentItemID(0), 
								item1->GetAugmentItemID(1), 
								item1->GetAugmentItemID(2), 
								item1->GetAugmentItemID(3), 
								item1->GetAugmentItemID(4), 
								0, 
								0, 
								0,
								0,
								0
								);
							b->BotSay("Using %c%s%s%c in my %s (Item %i)", 0x12, itemLink, item2->Name, 0x12, equipped[i], i);
						}
						else{
							MakeAnyLenString(&itemLink, "%1X" "%05X" "%05X" "%05X" "%05X" "%05X" "%05X" "%1X" "%04X" "%1X" "%08X",
								0,
								item2->ID, 
								item1->GetAugmentItemID(0), 
								item1->GetAugmentItemID(1), 
								item1->GetAugmentItemID(2), 
								item1->GetAugmentItemID(3), 
								item1->GetAugmentItemID(4), 
								0, 
								0, 
								0, 
								0);
							b->BotSay("Using %c%s%s%c in my %s (Item %i)", 0x12, itemLink, item2->Name, 0x12, equipped[i], i);
						}
					}
					else{
						if (c->GetClientVersion() == EQClientSoF)
						{
							MakeAnyLenString(&itemLink, "%1X" "%05X" "%05X" "%05X" "%05X" "%05X" "%05X" "%1X" "%04X" "%1X" "%05X" "%08X", 
								0,
								item2->ID, 
								item1->GetAugmentItemID(0), 
								item1->GetAugmentItemID(1), 
								item1->GetAugmentItemID(2), 
								item1->GetAugmentItemID(3), 
								item1->GetAugmentItemID(4), 
								0, 
								0, 
								0,
								0,
								0
								);
							b->BotSay("Using %c%s%s%c in my %s (Item %i)", 0x12, itemLink, item2->Name, 0x12, equipped[i], i);
						}
						else{
							MakeAnyLenString(&itemLink, "%1X" "%05X" "%05X" "%05X" "%05X" "%05X" "%05X" "%1X" "%04X" "%1X" "%08X",
								0,
								item2->ID, 
								item1->GetAugmentItemID(0), 
								item1->GetAugmentItemID(1), 
								item1->GetAugmentItemID(2), 
								item1->GetAugmentItemID(3), 
								item1->GetAugmentItemID(4), 
								0, 
								0, 
								0, 
								0);
							b->BotSay("Using %c%s%s%c in my %s (Item %i)", 0x12, itemLink, item2->Name, 0x12, equipped[i], i);
						}
					}
				}
			}
			else {
				c->Message(15, "You must group your bot first.");
			}
		}
		else {
			c->Message(15, "You must target a bot first.");
		}
		return;
	}
	
	if((!strcasecmp(sep->arg[1], "inventory")) && (!strcasecmp(sep->arg[2], "remove"))){ //Angelox3
        if((c->GetTarget() == NULL) || (sep->arg[3] == '\0') || !c->GetTarget()->IsBot()){
			c->Message(15, "Usage: #bot inventory remove [slotid] (You must have a bot targetted) ");
			return;
		}		
		else if(c->GetTarget()->IsBot() && (c->GetTarget()->BotOwner == c->CastToMob())){
			if(c->GetTradeskillObject() || (c->trade->state == Trading))
				return;

			int slotId = atoi(sep->arg[3]);	
			if(slotId > 21 || slotId < 0) {
				c->Message(15, "A bot has 21 slots in its inventory, please choose a slot between 0 and 21.");
				return;
			}
			const char* equipped[22] = {"Charm", "Left Ear", "Head", "Face", "Right Ear", "Neck", "Shoulders", "Arms", "Back",
										"Left Wrist", "Right Wrist", "Range", "Hands", "Primary Hand", "Secondary Hand",
										"Left Finger", "Right Finger", "Chest", "Legs", "Feet", "Waist", "Ammo" };

			const Item_Struct* itm = NULL;
			const ItemInst* itminst = c->GetTarget()->GetBotItem(c->GetTarget()->CastToNPC(), slotId);
			if(itminst)
				itm = itminst->GetItem();

			if(!TempErrorMessage.empty()) {
				c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
				return;
			}

			// Don't allow the player to remove a lore item they already possess and cause a crash
			bool hasAug = false;
			if(itminst) {
				for(int a=0; a<MAX_AUGMENT_SLOTS; ++a) {
					ItemInst *augItem = itminst->GetAugment(a);
					if(augItem) {
						if(c->CheckLoreConflict(augItem->GetItem())) {
							hasAug = true;
						}
					}
				}
				if(c->CheckLoreConflict(itm)) {
					hasAug = true;
				}
			}
			if(!hasAug) {
				if(itm) {
					c->PushItemOnCursor(*itminst, true);
					Mob* gearbot = c->GetTarget();
					if((slotId == SLOT_RANGE)||(slotId == SLOT_AMMO)||(slotId == SLOT_PRIMARY)||(slotId == SLOT_SECONDARY)) {
						gearbot->SetBotArcher(false);
					}
					database.RemoveBotItemBySlot(gearbot->GetNPCTypeID(), slotId, &TempErrorMessage);
					gearbot->CastToNPC()->GetBotInv().DeleteItem(slotId);

					if(!TempErrorMessage.empty()) {
						c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
						return;
					}

					int8 materialFromSlot = Inventory::CalcMaterialFromSlot(slotId);
					if(materialFromSlot != 0xFF) {
						gearbot->CastToNPC()->BotRemoveEquipItem(materialFromSlot);
						gearbot->CastToNPC()->SendWearChange(materialFromSlot);
					}
					gearbot->CalcBotStats();
					switch(slotId) {
						case 0:
						case 1:
						case 2:
						case 3:
						case 4:
						case 5:
						case 8:
						case 9:
						case 10:
						case 11:
						case 13:
						case 14:
						case 15:
						case 16:
						case 17:
						case 20:
						case 21:
							gearbot->BotSay("My %s is now unequipped.", equipped[slotId]);
							break;
						case 6:
						case 7:
						case 12:
						case 18:
						case 19:
							gearbot->BotSay("My %s are now unequipped.", equipped[slotId]);
							break;
						default:
							break;
					}
				}
				else {
					switch(slotId) {
						case 0:
						case 1:
						case 2:
						case 3:
						case 4:
						case 5:
						case 8:
						case 9:
						case 10:
						case 11:
						case 13:
						case 14:
						case 15:
						case 16:
						case 17:
						case 20:
						case 21:
							c->GetTarget()->BotSay("My %s is already unequipped.", equipped[slotId]);
							break;
						case 6:
						case 7:
						case 12:
						case 18:
						case 19:
							c->GetTarget()->BotSay("My %s are already unequipped.", equipped[slotId]);
							break;
						default:
							break;
					}
				}
			}
			else {
				c->Message_StringID(0, PICK_LORE);
			}
		}
		return;
	}

	if((!strcasecmp(sep->arg[1], "unequip")) ||  (!strcasecmp(sep->arg[1], "remove")))  { //Angelox3
		if((c->GetTarget() == NULL) || (sep->arg[3] == '\0') || !c->GetTarget()->IsBot())
		{
			c->Message(15, "Usage: #bot unequip [slot name] or [slotid](You must have a bot targetted) ");
			return;
		}		
		else if(c->GetTarget()->IsBot() && (c->GetTarget()->BotOwner == c->CastToMob()))
		{
			if(c->GetTradeskillObject() || (c->trade->state == Trading))
				return;

			int slotId = NULL;	  
			if (!strcasecmp(sep->arg[2], "primary")){ 
				slotId = 13;}
			else if (!strcasecmp(sep->arg[2], "secondary")){ 
				slotId = 14;}
			else if (!strcasecmp(sep->arg[2], "charm")){ 
				slotId = 0;}
			else if (!strcasecmp(sep->arg[2], "left") && (!strcasecmp(sep->arg[3], "ear"))){ 
				slotId = 1;}
			else if (!strcasecmp(sep->arg[2], "head")){ 
				slotId = 2;}
			else if (!strcasecmp(sep->arg[2], "face")){ 
				slotId = 3;}
			else if (!strcasecmp(sep->arg[2], "right") && (!strcasecmp(sep->arg[3], "ear"))){ 
				slotId = 4;}
			else if (!strcasecmp(sep->arg[2], "neck")){ 
				slotId = 5;}
			else if (!strcasecmp(sep->arg[2], "shoulders")){ 
				slotId = 6;}
			else if (!strcasecmp(sep->arg[2], "arms")){ 
				slotId = 7;}
			else if (!strcasecmp(sep->arg[2], "back")){ 
				slotId = 8;}
			else if (!strcasecmp(sep->arg[2], "left") && (!strcasecmp(sep->arg[3], "wrist"))){ 
				slotId = 9;}
			else if (!strcasecmp(sep->arg[2], "right") && (!strcasecmp(sep->arg[3], "wrist"))){ 
				slotId = 10;}
			else if (!strcasecmp(sep->arg[2], "range")){ 
				slotId = 11;}
			else if (!strcasecmp(sep->arg[2], "hands")){ 
				slotId = 12;}
			else if (!strcasecmp(sep->arg[2], "left") && (!strcasecmp(sep->arg[3], "finger"))){ 
				slotId = 15;}
			else if (!strcasecmp(sep->arg[2], "right") && (!strcasecmp(sep->arg[3], "finger"))){ 
				slotId = 16;}
			else if (!strcasecmp(sep->arg[2], "chest")){ 
				slotId = 17;}
			else if (!strcasecmp(sep->arg[2], "legs")){ 
				slotId = 18;}
			else if (!strcasecmp(sep->arg[2], "feet")){ 
				slotId = 19;}
			else if (!strcasecmp(sep->arg[2], "waist")){ 
				slotId = 20;}
			else if (!strcasecmp(sep->arg[2], "ammo")){ 
				slotId = 21;}			 
			else if (sep->arg[2][0] == '\0'){
				c->Message(15, "Usage: #bot unequip [slotid] or [slot name](You must have a bot targetted).");
				c->Message(15, "Valid arguments for slot name: Primary, Secondary, Charm, Left Ear, Head, Face, Right Ear, Neck, Shoulders, Arms, Back,Left Wrist, Right Wrist, Range, Hands, Left Finger, Right Finger, Chest, Legs, Feet, Waist, Ammo");
				return;}
			else {
				slotId = atoi(sep->arg[2]);
				c->Message(15, "Typos default to the charm slot.");			
				c->Message(15, "Be sure you used the valid argument for slot name.");
				c->Message(15, "Valid arguments for slot name: Primary, Secondary, Charm, Left Ear, Head, Face, Right Ear, Neck, Shoulders, Arms, Back,Left Wrist, Right Wrist, Range, Hands, Left Finger, Right Finger, Chest, Legs, Feet, Waist, Ammo");
			}

			if(slotId > 21 || slotId < 0) {
				c->Message(15, "A bot has 21 slots in its inventory, please choose a slot between 0 and 21.");
				return;
			}
			const char* equipped[22] = {"Charm", "Left Ear", "Head", "Face", "Right Ear", "Neck", "Shoulders", "Arms", "Back",
										"Left Wrist", "Right Wrist", "Range", "Hands", "Primary Hand", "Secondary Hand",
										"Left Finger", "Right Finger", "Chest", "Legs", "Feet", "Waist", "Ammo" };

			const Item_Struct* itm = NULL;
			const ItemInst* itminst = c->GetTarget()->GetBotItem(c->GetTarget()->CastToNPC(), slotId);
			if(itminst)
				itm = itminst->GetItem();

			if(!TempErrorMessage.empty()) {
				c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
				return;
			}

			// Don't allow the player to remove a lore item they already possess and cause a crash
			bool hasAug = false;
			if(itminst) {
				for(int a=0; a<MAX_AUGMENT_SLOTS; ++a) {
					ItemInst *augItem = itminst->GetAugment(a);
					if(augItem) {
						if(c->CheckLoreConflict(augItem->GetItem())) {
							hasAug = true;
						}
					}
				}
				if(c->CheckLoreConflict(itm)) {
					hasAug = true;
				}
			}
			if(!hasAug) {
				if(itm) {
					c->PushItemOnCursor(*itminst, true);
					Mob* gearbot = c->GetTarget();
					if((slotId == SLOT_RANGE)||(slotId == SLOT_AMMO)||(slotId == SLOT_PRIMARY)||(slotId == SLOT_SECONDARY)) {
						gearbot->SetBotArcher(false);
					}
					database.RemoveBotItemBySlot(gearbot->GetNPCTypeID(), slotId, &TempErrorMessage);
					gearbot->CastToNPC()->GetBotInv().DeleteItem(slotId);

					if(!TempErrorMessage.empty()) {
						c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
						return;
					}

					int8 materialFromSlot = Inventory::CalcMaterialFromSlot(slotId);
					if(materialFromSlot != 0xFF) {
						gearbot->CastToNPC()->BotRemoveEquipItem(materialFromSlot);
						gearbot->CastToNPC()->SendWearChange(materialFromSlot);
					}
					gearbot->CalcBotStats();
					switch(slotId) {
						case 0:
						case 1:
						case 2:
						case 3:
						case 4:
						case 5:
						case 8:
						case 9:
						case 10:
						case 11:
						case 13:
						case 14:
						case 15:
						case 16:
						case 17:
						case 20:
						case 21:
							gearbot->BotSay("My %s is now unequipped.", equipped[slotId]);
							break;
						case 6:
						case 7:
						case 12:
						case 18:
						case 19:
							gearbot->BotSay("My %s are now unequipped.", equipped[slotId]);
							break;
						default:
							break;
					}
				}
				else {
					switch(slotId) {
						case 0:
						case 1:
						case 2:
						case 3:
						case 4:
						case 5:
						case 8:
						case 9:
						case 10:
						case 11:
						case 13:
						case 14:
						case 15:
						case 16:
						case 17:
						case 20:
						case 21:
							c->GetTarget()->BotSay("My %s is already unequipped.", equipped[slotId]);
							break;
						case 6:
						case 7:
						case 12:
						case 18:
						case 19:
							c->GetTarget()->BotSay("My %s are already unequipped.", equipped[slotId]);
							break;
						default:
							break;
					}
				}
			}
			else {
				c->Message_StringID(0, PICK_LORE);
			}
		}
		return;
	}

//update
	if((!strcasecmp(sep->arg[1], "update")) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "update")) {
        if((c->GetTarget() != NULL) && c->GetTarget()->IsBot()) {
			Mob *t = c->GetTarget();
		//Angelox fixed update bots outside your group exploit
			if(t && (database.GetBotOwner(t->GetNPCTypeID()) != c->CharacterID())){
				c->Message(15,"Choose a target in your group.");
				return;
			}
		// Congdar: add IsEngaged check for exploit to keep bots alive by repeatedly using #bot update.
			if(BotLevel <= c->GetTarget()->GetLevel()) {
					c->Message(15, "This bot has already been updated.");
					return;
			}
			
			if(c->IsBotRaiding()) {
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
				if(br) {
					if(br->GetBotRaidAggro()) {
						c->Message(15, "You can't update bots while you are engaged.");
						return;
					}
				}
			}

			if(c->IsGrouped()){
				Group *g = entity_list.GetGroupByClient(c);
				for (int i=0; i<MAX_GROUP_MEMBERS; i++){
					if(g && g->members[i] && g->members[i]->IsEngaged()){
						c->Message(15, "You can't update bots while you are engaged.");
						return;
					}
				}
			}

			if((c->GetTarget()->BotOwner == c->CastToMob()) && !c->GetFeigned()) {
                Mob *bot = c->GetTarget();
                bot->SetLevel(BotLevel);
				bot->SetPetChooser(false);
				bot->CalcBotStats();
            }
            else {
				if(c->GetFeigned()) {
					c->Message(15, "You cannot update bots while feigned.");
				}
				else {
					c->Message(15, "You must target your bot first");
				}
            }
        }
        else {
			c->Message(15, "You must target a bot first");
        }
        return;
	}

//Bind
	if((!strcasecmp(sep->arg[1], "bindme"))  && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "bindme")) {
		Mob *binder = NULL;
		bool hasbinder = false;
		int zoneID = zone->GetZoneID();
		int bindID = database.BotCanBindLookUp(zoneID);
		if(c->IsGrouped()){
		Group *g = c->GetGroup();
		  if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == CLERIC)){
					hasbinder = true;
					binder = g->members[i];
				}
				else if((BotLevel > 11) && ((g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == MAGICIAN))
				|| (g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == WIZARD))
				|| (g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == DRUID))
				|| (g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == NECROMANCER))
				|| (g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == ENCHANTER))
				|| (g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == SHAMAN))))
				{
					hasbinder = true;
					binder = g->members[i];
				}
			}
			      if(binder->IsMoving()){
				binder->BotSay("I can't be moving for this!");
				return;}
			      else if((!hasbinder) && (BotLevel <= 9)){
				c->Message(15, "You must have a Cleric in your group.");
				return;}
			      else if((!hasbinder) && (BotLevel <= 12)){
				c->Message(15, "You must have a Cleric, Druid, Magician, Necro, Wizard or Enchanter in your group.");
				return;}
			      else if((!hasbinder) && (BotLevel <= 13)){
				c->Message(15, "You must have a Cleric, Druid, Magician, Shaman, Necro, Wizard or Enchanter in your group.");
				return;}
			      else if(!hasbinder) {
				c->Message(15, "You must have a Cleric, Druid, Magician, Shaman, Necro, Wizard or Enchanter in your group.");
				return;}
		}
	}
		if ((binder->GetClass() == CLERIC) && (BotLevel <= 9)){
		  binder->BotSay("I'm not level 10 yet.", c->GetName());
			return;
		}
		else if (((binder->GetClass() == MAGICIAN) || (binder->GetClass() == WIZARD) ||(binder->GetClass() ==  DRUID)
		  || NECROMANCER || ENCHANTER) && (BotLevel <= 11)){
		  binder->BotSay("I'm not level 12 yet.", c->GetName());
		  	return;
		}
		else if ((binder->GetClass() == SHAMAN) && (BotLevel <= 13)){
		  binder->BotSay("I'm not level 14 yet.", c->GetName());
		  	return;
		}
		if(hasbinder) {
		  if (bindID < 1){
		    binder->BotSay("I cannot bind others in this zone.");
		    return;
		  }
			binder->InterruptSpell(); 
			binder->BotSay("Attempting to bind you %s.", c->GetName());
			binder->CastToNPC()->CastSpell(35, c->GetID(), 1, -1, -1);
		}
		return;
	}

//Rune
	if((!strcasecmp(sep->arg[1], "rune"))  && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "runeme")) {
		c->Message(15, "This command has been changed - try '#bot rune'.");
		return;
	}
	if(!strcasecmp(sep->arg[1], "rune")) {
		Group* mygroup = c->GetGroup();
		Mob *t = c->GetTarget();
		if((t == NULL) || (t->IsNPC()) && (!t->IsBot()) || (!t->IsGrouped()) ||
			((t->IsBot()) && (database.GetBotOwner(t->GetNPCTypeID()) != c->CharacterID())) ||  
			((mygroup) && (!mygroup->IsGroupMember(t)))) {
				c->Message(15, "Target a player or bot in your group.");
				return;
		}
		Mob *runeer = NULL;
		bool hasruneer = false;
		if(c->IsGrouped()){
			Group *g = c->GetGroup();
			if(g) {
				for(int i=0; i<MAX_GROUP_MEMBERS; i++){
					if(g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == ENCHANTER)){
						hasruneer = true;
						runeer = g->members[i];
					}
				}
				if(!hasruneer) {
					c->Message(15, "You must have an Enchanter in your group.");
				}
			}
		}
		if(hasruneer) {
			runeer->InterruptSpell();
			if(runeer->GetLevel() <= 12) {
				runeer->BotSay("I need to be level 13 or higher for this...");
			}
			else if ((runeer->GetLevel() >= 13) && (runeer->GetLevel() <= 21)) {
				runeer->BotSay("Casting Rune I...");
				runeer->CastToNPC()->CastSpell(481, t->GetID(), 1, -1, -1);
			}
			else if ((runeer->GetLevel() >= 22) && (runeer->GetLevel() <= 32)) {
				runeer->BotSay("Casting Rune II...");
				runeer->CastToNPC()->CastSpell(482, t->GetID(), 1, -1, -1);
			}
			else if ((runeer->GetLevel() >= 33) && (runeer->GetLevel() <= 39)) { 
				runeer->BotSay("Casting Rune III...");
				runeer->CastToNPC()->CastSpell(483, t->GetID(), 1, -1, -1);
			}
			else if ((runeer->GetLevel() >= 40) && (runeer->GetLevel() <= 51)) { 
				runeer->BotSay("Casting Rune IV...");
				runeer->CastToNPC()->CastSpell(484, t->GetID(), 1, -1, -1);
			}
			else if ((runeer->GetLevel() >= 52) && (runeer->GetLevel() <= 60)) { 
				runeer->BotSay("Casting Rune V...");
				runeer->CastToNPC()->CastSpell(1689, t->GetID(), 1, -1, -1);
			}
			else if (runeer->GetLevel() >= 61){ 
				runeer->BotSay("Casting Rune of Zebuxoruk...");
				runeer->CastToNPC()->CastSpell(3343, t->GetID(), 1, -1, -1);
			}
		}
		return;
	}

//GHeal, Group Heal - Cleric
	if((!strcasecmp(sep->arg[1], "gheal"))  && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "gheal")) {
		Group* mygroup = c->GetGroup();
		Mob *t = c->GetTarget();
		/*
		if((t == NULL) || (t->IsNPC()) && (!t->IsBot()) || (!t->IsGrouped()) ||
			((t->IsBot()) && (database.GetBotOwner(t->GetNPCTypeID()) != c->CharacterID())) ||  
			((mygroup) && (!mygroup->IsGroupMember(t)))) {
				c->Message(15, "Target a player or bot in your group.");
				return;
		}
		*/
		Mob *ghealer = NULL;
		bool hasghealer = false;
		if(c->IsGrouped()){
			Group *g = c->GetGroup();
			if(g) {
				for(int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					if(g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == CLERIC))
					{
						hasghealer = true;
						ghealer = g->members[i];
					}
				}
				if(!hasghealer) {
					c->Message(15, "You must have a Cleric in your group.");
				}
			}
		}
		if(hasghealer) {
		    int CurMana = ghealer->GetMana();
		    ghealer->InterruptSpell();
			if(ghealer->GetLevel() <= 29) {
				ghealer->BotSay("I need to be level 30 or higher for this...");
				return;}
			else if ((ghealer->GetLevel() >= 30) && (ghealer->GetLevel() <= 44)) {
				    if (CurMana < 305){
				      ghealer->BotSay("Not enough mana!") ;
				      return;}
				ghealer->BotSay("Casting Word of Health...");
				ghealer->CastToClient()->CastSpell(135, c->GetID(), 1, -1, -1);
			}
			else if ((ghealer->GetLevel() >= 45) && (ghealer->GetLevel() <= 56)) {
				    if (CurMana < 430){
				      ghealer->BotSay("Not enough mana!") ;
				      return;}
				ghealer->BotSay("Casting Word of Healing...");
				ghealer->CastToClient()->CastSpell(136, c->GetID(), 1, -1, -1);
			}
			else if ((ghealer->GetLevel() >= 57) && (ghealer->GetLevel() <= 59)) {
				    if (CurMana < 900){
				      ghealer->BotSay("Not enough mana!") ;
				      return;}
				ghealer->BotSay("Casting Word of Restoration...");
				ghealer->CastToClient()->CastSpell(1521, c->GetID(), 1, -1, -1);
			}
			else if ((ghealer->GetLevel() >= 60) && (ghealer->GetLevel() <= 63)) {
				    if (CurMana < 1100){
				      ghealer->BotSay("Not enough mana!") ;
				      return;}
				ghealer->BotSay("Casting Word of Redemption...");
				ghealer->CastToClient()->CastSpell(1523, c->GetID(), 1, -1, -1);
			}
			else if ((ghealer->GetLevel() >= 64) && (ghealer->GetLevel() <= 68)) {
				    if (CurMana < 1100){
				      ghealer->BotSay("Not enough mana!") ;
				      return;}
				ghealer->BotSay("Casting Word of Replenishment...");
				ghealer->CastToClient()->CastSpell(3471, c->GetID(), 1, -1, -1);
			}
			else if (ghealer->GetLevel() >= 69){ 
				ghealer->BotSay("Casting Word of Vivification...");
				    if (CurMana < 1340){
				      ghealer->BotSay("Not enough mana!") ;
				      return;}
				ghealer->CastToClient()->CastSpell(5270, c->GetID(), 1, -1, -1);
			}
		}
		return;
	}

//Skin (Druids Skin Like * buffs)
	if((!strcasecmp(sep->arg[1], "skin"))  && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "skin")) {
		Group* mygroup = c->GetGroup();
		Mob *t = c->GetTarget();
		if ((t == NULL)  || (t->IsNPC()) && (!t->IsBot())) {
			c->Message(15, "You must select a player or bot in the zone.");
			return;
		}
		Mob *skiner = NULL;
		bool hasskiner = false;
		if(c->IsGrouped()){
			Group *g = c->GetGroup();
			if(g) {
				for(int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					if(g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == DRUID)){
						hasskiner = true;
						skiner = g->members[i];
					}
				}
				if(!hasskiner) {
					c->Message(15, "You must have an Druid in your group.");
				}
			}
		}
		if(hasskiner) {
			skiner->InterruptSpell();
			/* if      (skiner->GetLevel() <= 12) {
				skiner->BotSay("I need to be level 13 or higher for this...");
			} */
			if 	((skiner->GetLevel() >= 1) && (skiner->GetLevel() <= 13)) {
				skiner->BotSay("Casting Skin like Wood...");
				skiner->CastToNPC()->CastSpell(26, t->GetID(), 1, -1, -1);
			}
			else if ((skiner->GetLevel() >= 14) && (skiner->GetLevel() <= 23)) {
				skiner->BotSay("Casting Skin like Rock...");
				skiner->CastToNPC()->CastSpell(263, t->GetID(), 1, -1, -1);
			}
			else if ((skiner->GetLevel() >= 24) && (skiner->GetLevel() <= 35)) { 
				skiner->BotSay("Casting Skin like Steel...");
				skiner->CastToNPC()->CastSpell(421, t->GetID(), 1, -1, -1);
			}
			else if ((skiner->GetLevel() >= 36) && (skiner->GetLevel() <= 45)) { 
				skiner->BotSay("Casting Skin like Diamond...");
				skiner->CastToNPC()->CastSpell(422, t->GetID(), 1, -1, -1);
			}
			else if ((skiner->GetLevel() >= 46) && (skiner->GetLevel() <= 56)) { 
				skiner->BotSay("Casting Skin like Nature...");
				skiner->CastToNPC()->CastSpell(423, t->GetID(), 1, -1, -1);
			}
			else if ((skiner->GetLevel() >= 57) && (skiner->GetLevel() <= 58)) { 
				skiner->BotSay("Casting Natureskin...");
				skiner->CastToNPC()->CastSpell(1559, t->GetID(), 1, -1, -1);
			}
			else if ((skiner->GetLevel() >= 59) && (skiner->GetLevel() <= 59)) { 
				skiner->BotSay("Casting Protection of the Cabbage...");
				skiner->CastToNPC()->CastSpell(2188, t->GetID(), 1, -1, -1);
			}
			else if ((skiner->GetLevel() >= 60) && (skiner->GetLevel() <= 62)) { 
				skiner->BotSay("Casting Protection of the Glades...");
				skiner->CastToNPC()->CastSpell(1442, t->GetID(), 1, -1, -1);
			}
			else if (skiner->GetLevel() >= 63){ 
				skiner->BotSay("Casting Protection of the Nine...");
				skiner->CastToNPC()->CastSpell(3234, t->GetID(), 1, -1, -1);
			}
		}
		return;
	}

//BotHelpWindow(Client* client, int MobClass)
//HelpTest
	if((!strcasecmp(sep->arg[1], "testcleric")) &&(!c->IsGrouped())){
		entity_list.BotHelpWindow(c,1);
		c->Message(15, "Testing Help window ...");
		return;
	}
	else if((!strcasecmp(sep->arg[1], "testdruid")) &&(!c->IsGrouped())){
		entity_list.BotHelpWindow(c,2);
		c->Message(15, "Testing Druid Help window ...");
		return;
	}
	else if((!strcasecmp(sep->arg[1], "testwizard")) &&(!c->IsGrouped())){
		entity_list.BotHelpWindow(c,3);
		c->Message(15, "Testing Wizard Help window ...");
		return;
	}
	else if((!strcasecmp(sep->arg[1], "testenchanter")) &&(!c->IsGrouped())){
		entity_list.BotHelpWindow(c,4);
		c->Message(15, "Testing Enchanter Help window ...");
		return;
	}

//Tracking
	if((!strcasecmp(sep->arg[1], "track")) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "track") && c->IsGrouped()) {
		Mob *Tracker = NULL;
		int32 TrackerClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case RANGER:
							Tracker = g->members[i];
							TrackerClass = RANGER;
							break;
						case BARD:
							// If we haven't found a tracker yet, use bard.
							if(TrackerClass == 0) {
								Tracker = g->members[i];
								TrackerClass = BARD;
							}
							break;
						case DRUID:
							// Unless we have a ranger, druid is next best.
							if(TrackerClass != RANGER) {
								Tracker = g->members[i];
								TrackerClass = DRUID;
							}
							break;
						default:
							break;
					}
				}
			}
			int Level = (BotLevel);
			int RangeR = (Level*80); //Ranger
			int RangeD = (Level*30); //Druid
			int RangeB = (Level*20); //Bard
			switch(TrackerClass) {
				case RANGER:
					if(!strcasecmp(sep->arg[2], "all")) {
						Tracker->BotSay("Tracking everything", c->GetName());
						entity_list.ShowSpawnWindow(c, RangeR, false);
					}
					else if(!strcasecmp(sep->arg[2], "rare")) { 
						Tracker->BotSay("Selective tracking", c->GetName());
						entity_list.ShowSpawnWindow(c, RangeR, true);
					}
					else if(!strcasecmp(sep->arg[2], "near")) { 
						Tracker->BotSay("Tracking mobs nearby", c->GetName());
						entity_list.ShowSpawnWindow(c, RangeD, false);
					}
					else 
						Tracker->BotSay("You want to [track all], [track near], or [track rare]?", c->GetName());
						
					break;

				case BARD:

					if(TrackerClass != RANGER)
					Tracker->BotSay("Tracking up", c->GetName());
					entity_list.ShowSpawnWindow(c, RangeB, false);
					break;

				case DRUID:

					if(TrackerClass = BARD)
					Tracker->BotSay("Tracking up", c->GetName());
					entity_list.ShowSpawnWindow(c, RangeD, false);
					break;

				default:
					c->Message(15, "You must have a Ranger, Druid, or Bard in your group.");
					break;
			}
		}
		return;
	}

//Cure
	if((!strcasecmp(sep->arg[1], "cure")) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if ((!strcasecmp(sep->arg[1], "cure")) && (c->IsGrouped())) {
		Mob *Curer = NULL;
		int32 CurerClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case CLERIC:
							Curer = g->members[i];
							CurerClass = CLERIC;
							break;
						case SHAMAN:
							if(CurerClass != CLERIC) {
								Curer = g->members[i];
								CurerClass = SHAMAN;
							}
							break;
						case DRUID:
							if (CurerClass == 0) {
								Curer = g->members[i];
								CurerClass = DRUID;
							}
							break;
						default:
							break;
					}
				}
			}
			switch(CurerClass) {
				case CLERIC:
					Curer->InterruptSpell();
					if	(!strcasecmp(sep->arg[2], "poison") && (BotLevel >= 1))  {
						Curer->BotSay("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToNPC()->Bot_Command_Cure(1, Curer->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "disease") && (BotLevel >= 4)) {
						Curer->BotSay("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToNPC()->Bot_Command_Cure(2, Curer->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "curse") && (BotLevel >= 8)) {
						Curer->BotSay("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToNPC()->Bot_Command_Cure(3, Curer->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "blindness") && (BotLevel >= 3)) {
						Curer->BotSay("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToNPC()->Bot_Command_Cure(4, Curer->GetLevel());
					}
					else if (((!strcasecmp(sep->arg[2], "curse")) && (BotLevel <= 8))
					|| ((!strcasecmp(sep->arg[2], "blindness")) && (BotLevel <= 3)) 
					|| ((!strcasecmp(sep->arg[2], "disease")) && (BotLevel <= 4))
					|| ((!strcasecmp(sep->arg[2], "poison")) && (BotLevel <= 1))) {
						Curer->BotSay("I don't have the needed level yet", sep->arg[2]);
					}
					else
					Curer->BotSay("Do you want [cure poison], [cure disease], [cure curse], or [cure blindness]?", c->GetName());

					break;

				case SHAMAN:
					Curer->InterruptSpell();
					if	(!strcasecmp(sep->arg[2], "detrimental") && (BotLevel >= 69))  {
						Curer->BotSay("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToNPC()->Bot_Command_Cure(5, Curer->GetLevel());
					}
					else if	(!strcasecmp(sep->arg[2], "poison") && (BotLevel >= 2))  {
						Curer->BotSay("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToNPC()->Bot_Command_Cure(1, Curer->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "disease") && (BotLevel >= 1)) {
						Curer->BotSay("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToNPC()->Bot_Command_Cure(2, Curer->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "curse")) {
						Curer->BotSay("I don't have that spell", sep->arg[2]);
					}
					else if(!strcasecmp(sep->arg[2], "blindness") && (BotLevel >= 7)) {
						Curer->BotSay("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToNPC()->Bot_Command_Cure(4, Curer->GetLevel());
					}
					else if (((!strcasecmp(sep->arg[2], "blindness")) && (BotLevel <= 7)) 
					|| ((!strcasecmp(sep->arg[2], "detrimental")) && (BotLevel <= 68))
					|| ((!strcasecmp(sep->arg[2], "disease")) && (BotLevel <= 1))
					|| ((!strcasecmp(sep->arg[2], "poison")) && (BotLevel <= 2))) {
						Curer->BotSay("I don't have the needed level yet", sep->arg[2]);
					}
					else 
					Curer->BotSay("Do you want [cure detrimental], [cure poison], [cure disease], or [cure blindness]?", c->GetName());

					break;

				case DRUID:
					Curer->InterruptSpell();
					if	(!strcasecmp(sep->arg[2], "poison") && (BotLevel >= 5)) {
						Curer->BotSay("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToNPC()->Bot_Command_Cure(1, Curer->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "disease") && (BotLevel >= 4)) {
						Curer->BotSay("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToNPC()->Bot_Command_Cure(2, Curer->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "curse")) { // Fire level 1
						Curer->BotSay("I don't have that spell", sep->arg[2]);
					}
					else if(!strcasecmp(sep->arg[2], "blindness") && (BotLevel >= 13)) {
						Curer->BotSay("I don't have that spell", sep->arg[2]);
					}
					else if (((!strcasecmp(sep->arg[2], "disease")) && (BotLevel <= 4))
					|| ((!strcasecmp(sep->arg[2], "poison")) && (BotLevel <= 5))) {
						Curer->BotSay("I don't have the needed level yet", sep->arg[2]) ;
					}
					else 
					Curer->BotSay("Do you want [cure poison], or [cure disease]?", c->GetName());

					break;

				default:
					c->Message(15, "You must have a Cleric, Shaman, or Druid in your group.");
					break;
			}
		}
		return;
	}

//Mez
	if((!strcasecmp(sep->arg[1], "ai")) && (!strcasecmp(sep->arg[2], "mez")) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if((!strcasecmp(sep->arg[1], "ai")) && (!strcasecmp(sep->arg[2], "mez"))){
		Mob *target = c->GetTarget();
        if((target == NULL) || (target == c )|| (target->IsBot()) || ((target->IsPet()) && (target->GetOwner()->IsBot()))){
            c->Message(15, "You must select a monster");
            return;
        }
		if(c->IsGrouped()){
			bool hasmezzer = false;
			Group *g = c->GetGroup();
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g && g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == ENCHANTER)){
					hasmezzer = true;
					g->members[i]->InterruptSpell();
					g->members[i]->BotSay("Trying to mez %s", target->GetCleanName());
					g->members[i]->CastToNPC()->Bot_Command_MezzTarget(target,1,0,0);
					break;
				}
			}
			if(!hasmezzer) {
				c->Message(15, "You must have an Enchanter in your group.");
			}
		}
        return;
	}

//Lore (Identify item)
	if((!strcasecmp(sep->arg[1], "lore")) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "lore")) {
		if(c->IsGrouped()){
			bool hascaster = false;
			Group *g = c->GetGroup();
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g && g->members[i] && g->members[i]->IsBot()) {
					uint8 casterlevel = g->members[i]->GetLevel();
					switch(g->members[i]->GetClass()) {
						case ENCHANTER:
							if(casterlevel >= 15) {
								hascaster = true;
							}
							break;
						case WIZARD:
							if(casterlevel >= 14) {
								hascaster = true;
							}
							break;
						case NECROMANCER:
							if(casterlevel >= 17) {
								hascaster = true;
							}
							break;
						case MAGICIAN:
							if(casterlevel >= 13) {
								hascaster = true;
							}
							break;
						default:
							break;
					}
					if(hascaster) {
						g->members[i]->InterruptSpell();
						g->members[i]->BotSay("Trying to Identify your item...");
						g->members[i]->CastSpell(305, c->GetID(), 1, -1, -1);
						break;
					}
				}
			}
			if(!hascaster) {
				c->Message(15, "You don't see anyone in your group that can cast Identify.");
			}
		}
		else {
			c->Message(15, "You don't see anyone in your group that can cast Identify.");
		}
		return;
	}

//Resurrect
	if(((!strcasecmp(sep->arg[1], "resurrectme")) || (!strcasecmp(sep->arg[1], "ressurrectme")) || 
	   (!strcasecmp(sep->arg[1], "ressurectme")) || (!strcasecmp(sep->arg[1], "rez"))) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if((!strcasecmp(sep->arg[1], "resurrectme")) || (!strcasecmp(sep->arg[1], "ressurrectme")) || 
	   (!strcasecmp(sep->arg[1], "ressurectme")) || (!strcasecmp(sep->arg[1], "rez"))){
		Mob *target = c->GetTarget();
		if(target == NULL || !target->IsCorpse()){
            c->Message(15, "You must select a corpse");
            return;
	    }
		if(c->IsGrouped()){
			bool hasrezzer = false;
			Group *g = c->GetGroup();
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g && g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == CLERIC)){
					hasrezzer = true;
					Mob *rezzer = g->members[i];
				if (BotLevel <= 17 ){
					rezzer->BotSay("I need to be at least level 18.", sep->arg[2]) ;
					break;
				}
				else
					rezzer->InterruptSpell();
					rezzer->BotSay("Trying to rez %s", target->GetCleanName());
					rezzer->CastToNPC()->Bot_Command_RezzTarget(target);
					break;
				}
			}
			if(!hasrezzer) {
				c->Message(15, "You must have a Cleric in your group.");
			}
		}
		else {
			c->Message(15, "You must have a Cleric in your group.");
		}
        return;
	}

//Temperance
	if((!strcasecmp(sep->arg[1], "temperance")) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if((!strcasecmp(sep->arg[1], "temperance")) && (c->IsGrouped())) {
	    if (classicStat > 0) {
		    c->Message(15, "Spell not available in Classic2012.");
		    return;
	    }
		Mob *t = c->GetTarget();
		if ((t == NULL)  || (t->IsNPC()) && (!t->IsBot())) {
			c->Message(15, "You must select a player or bot in the zone.");
			return;
		}
 		Mob *Tempr;
		bool hasTempr = false;
		Group *g = c->GetGroup();
		bool Special = (RuleB(EQOffline, AXCustom));
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == CLERIC)) {
				      hasTempr = true;
				      Mob *Tempr = g->members[i];
				    if (Special) {
					  const int hasTemp = (database.BotTempLookup(c->CharacterID()));
					  if((hasTemp == 0) && (BotLevel >= 40)){
						    Tempr->BotSay("We haven't completed the Bot Spell Scriber's request yet.");
						    return;
					    }
					  else if(hasTemp == 0){
						    Tempr->BotSay("I have to be at least level 40 for my Temperance spell, and you need to talk to the Bot Spell Scriber.");
						    return;
						  }
				      } 
			      //hasTemp == 1 for regular Temperance
			      if (BotLevel <= 39){
				      Tempr->BotSay("I can't cast this spell tell I'm level 40.");
				      return;
				}
			      if (BotLevel >= 40){
				      Tempr->InterruptSpell();
				      Tempr->BotSay("Casting Temperance...");
				      Tempr->CastToNPC()->CastSpell(3692, t->GetID(), 1, -1, -1);
				      return;
				}
			    }
			}
			if(!hasTempr) {
				c->Message(15, "You must have a Cleric in your group.");
			}
		}
		else {
			c->Message(15, "You must have a Cleric in your group.");
		}
        return;
	}

//Selos
	if((!strcasecmp(sep->arg[1], "selos")) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if((!strcasecmp(sep->arg[1], "selos")) && (!strcasecmp(sep->arg[2], "\0"))){
		c->Message(15, "Usage:#bot selos on/off.");
		return;
	}
	if((!strcasecmp(sep->arg[1], "selos")) && (c->IsGrouped())) {
		//hasSelos == 1 for All Selos Spells	  
		bool hasSelos = false;
		Group *g = c->GetGroup();
		int32 charid = (c->CharacterID());
		bool Special = (RuleB(EQOffline, AXCustom));
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
			    if(g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == BARD)) {
				  hasSelos = true;
				      Mob *Selos = g->members[i];
				      const int hasSelos = (database.BotSelosLookup(c->CharacterID()));
				      if((hasSelos == 0) && (BotLevel >= 5)){
					    Selos->BotSay("We haven't completed the Bot Spell Scriber's request yet.");
					    return;
					   }
				      else if(hasSelos == 0){
					    Selos->BotSay("I have to be at least level 5 for my Selos spells, and you need to talk to the Bot Spell Scriber.");
					    return;
					   }
				      else if (!zone->CanCastOutdoor()) {
					    Selos->BotSay("I can't cast this spell indoors", c->GetName());
					    return;
					   }
				      if (BotLevel <= 4){
					    Selos->BotSay("I can't cast this spell tell I'm level 5.");
					    return;
					  }
				      if ((BotLevel >= 5) && (!strcasecmp(sep->arg[2], "on"))){
					if (BotLevel <= 50)
					  Selos->BotSay("Selos on.");
					else
					  Selos->BotSay("Bard Speed Scotty!");
					database.UpdateBotSelos(2,charid);
					Selos->SetBotSelos(true);
					return;
					}
				      if ((BotLevel >= 5) && (!strcasecmp(sep->arg[2], "off"))){
					if (BotLevel <= 50)
					  Selos->BotSay("Selos off.");
					else
					  Selos->BotSay("Bard Speed off.");
				      database.UpdateBotSelos(1,charid);
				      Selos->SetBotSelos(false);
				      return;
				      }
			       }
			}
			if(!hasSelos) {
				c->Message(15, "You must have a Bard in your group.");
			}
		}
		else {
			c->Message(15, "You must have a Bard in your group.");
		}
        return;
	}
	
//Change Bot Look
  if (!strcasecmp(sep->arg[1], "change")){ 
      if (!c->IsGrouped()) {
	    c->Message(15, "You need to group with a bot for this");
	    return;
      }
     else if (!strcasecmp(sep->arg[2], "\0")){
	    c->Message(15, "Usage: #bot change [face] [haircolor] [hair] [beard] [beardcolor] [eyes].");
	    c->Message(15, "Example: #bot change face 8");
	    return;
     }
     else if ((c->GetTarget() == NULL) || (!c->GetTarget()->IsBot())) {
	    c->Message(15, "You must target your bot first.");
	    return;
     }
     else if (!strcasecmp(sep->arg[2], "haircolor") || !strcasecmp(sep->arg[2], "hair") || !strcasecmp(sep->arg[2], "beard") ||
	  !strcasecmp(sep->arg[2], "beardcolor") || !strcasecmp(sep->arg[2], "face") || !strcasecmp(sep->arg[2], "eyes")){
	 // !strcasecmp(sep->arg[2], "heritage") || !strcasecmp(sep->arg[2], "tattoo") || !strcasecmp(sep->arg[2], "details")){
	  char errbuf[MYSQL_ERRMSG_SIZE];
	  char *query = 0;
	  int32 affected_rows = 0;
	  int32 thisBot = t->GetNPCTypeID();
		if(c->GetTarget() && c->GetTarget()->IsBot()) {
			if  (sep->IsNumber(3)) {
				if (database.GetBotOwner(c->GetTarget()->GetNPCTypeID()) == c->CharacterID()) {
					Mob *target = c->GetTarget()->CastToNPC();
					int16 Race = target->GetRace();
					int8 Gender = target->GetGender();
					int8 Texture = 0xFF;
					int8 HelmTexture = 0xFF;
					int8 HairStyle = target->GetHairStyle();
					int8 HairColor = target->GetHairColor();
					int8 BeardColor = target->GetBeardColor();
					int8 EyeColor1 = target->GetEyeColor1();
					int8 EyeColor2 = target->GetEyeColor2();
						
					int8 LuclinFace = target->GetLuclinFace();
					int8 Beard = target->GetBeard();
					int32 DrakkinHeritage = target->GetDrakkinHeritage();
					int32 DrakkinTattoo = target->GetDrakkinTattoo();
					int32 DrakkinDetails = target->GetDrakkinDetails();
					float Size = target->GetSize();

					if (!strcasecmp(sep->arg[2], "hair")){
						HairStyle = atoi(sep->arg[3]);
						if(database.RunQuery(query, MakeAnyLenString(&query, "UPDATE npc_types SET luclin_hairstyle=%i WHERE id=%i AND isbot = 1", HairStyle, thisBot), errbuf, 0, &affected_rows)) {
						}
						else{
						  c->Message(15, "Coudn't save to database.");
						  safe_delete_array(query)
						  return;
						}
					  safe_delete_array(query);
					}
					if (!strcasecmp(sep->arg[2], "haircolor")){
						HairColor = atoi(sep->arg[3]);
						if(database.RunQuery(query, MakeAnyLenString(&query, "UPDATE npc_types SET luclin_haircolor=%i WHERE id=%i AND isbot = 1", HairColor, thisBot), errbuf, 0, &affected_rows)) {
						}
						else{
						  c->Message(15, "Coudn't save to database.");
						  safe_delete_array(query)
						  return;
						}
					  safe_delete_array(query);
					}
					if (!strcasecmp(sep->arg[2], "beard") || !strcasecmp(sep->arg[2], "beardcolor")) {
						if (!Gender || Race == 8) {
							if (!strcasecmp(sep->arg[2], "beard")){
							      Beard = atoi(sep->arg[3]);
							      if(database.RunQuery(query, MakeAnyLenString(&query, "UPDATE npc_types SET luclin_beard=%i WHERE id=%i AND isbot = 1", Beard, thisBot), errbuf, 0, &affected_rows)) {
							      }
							      else{
								c->Message(15, "Coudn't save to database.");
								safe_delete_array(query)
								return;
							      }
							   safe_delete_array(query);
							}
							if (!strcasecmp(sep->arg[2], "beardcolor")){
							      BeardColor = atoi(sep->arg[3]);
							      if(database.RunQuery(query, MakeAnyLenString(&query, "UPDATE npc_types SET luclin_beardcolor=%i WHERE id=%i AND isbot = 1", BeardColor, thisBot), errbuf, 0, &affected_rows)) {
							      }
							      else{
								c->Message(15, "Coudn't save to database.");
								safe_delete_array(query)
								return;
							      }
							   safe_delete_array(query);
							}
						} else {
							c->Message(15, "Must be a male bot, or dwarf.");
							return;
						}
					}
					if (!strcasecmp(sep->arg[2], "face")){ 
						LuclinFace = atoi(sep->arg[3]);
						if(database.RunQuery(query, MakeAnyLenString(&query, "UPDATE npc_types SET face=%i WHERE id=%i AND isbot = 1", LuclinFace, thisBot), errbuf, 0, &affected_rows)) {
						}
						else{
						  c->Message(15, "Coudn't save to database.");
						  safe_delete_array(query)
						  return;
						}
					  safe_delete_array(query);
					}
					if (!strcasecmp(sep->arg[2], "eyes")) {
						EyeColor1 = EyeColor2 = atoi(sep->arg[3]);
						c->Message(0, "Eye Values = 0 - 11");
						if(database.RunQuery(query, MakeAnyLenString(&query, "UPDATE npc_types SET luclin_eyecolor=%i WHERE id=%i AND isbot = 1", EyeColor1, thisBot), errbuf, 0, &affected_rows)) {
						}
						else{
						  c->Message(15, "Coudn't save to database.");
						  safe_delete_array(query)
						  return;
						}
					  safe_delete_array(query);
					}
					//We don't use Drakkin yet
					/*
					if(!strcasecmp(sep->arg[2], "heritage") || !strcasecmp(sep->arg[2], "tattoo") || !strcasecmp(sep->arg[2], "details")) {
						if(Race == 522) {
							if(!strcasecmp(sep->arg[2], "heritage")) {
								DrakkinHeritage = atoi(sep->arg[3]);
								c->Message(0, "Heritage Values = 0 - 6");
							}
							if(!strcasecmp(sep->arg[2], "tattoo")) {
								DrakkinTattoo = atoi(sep->arg[3]);
								c->Message(0, "Tattoo Values = 0 - 7");
							}
							if(!strcasecmp(sep->arg[2], "details")) {
								DrakkinDetails = atoi(sep->arg[3]);
								c->Message(0, "Details Values = 0 - 7");
							}
						}
						else {
							c->Message(15, "Drakkin race only.");
							return;
						}
					}
					*/
					target->SendIllusionPacket(Race, Gender, Texture, HelmTexture, HairColor, BeardColor,
												EyeColor1, EyeColor2, HairStyle, LuclinFace, Beard, 0xFF,
												DrakkinHeritage, DrakkinTattoo, DrakkinDetails, Size);
					/*
					if(target->CastToNPC()->Save())
						c->Message(15, "%s saved.", target->GetCleanName());
					else
						c->Message(15, "%s save failed!", target->GetCleanName());
					*/

					c->Message(15,"Feature changed.");
				} else {
					c->Message(15, "You must own the bot to make changes.");
				}
			} else {
				c->Message(15, "Requires a value.");
				c->Message(15, "Example: #bot change face [numerical value]");
				
			}
		} else {
			c->Message(15,"A bot needs to be targetted.");
		}
		return;
	}
    }
//Tash (Enchanters' Tashan)
    if((!strcasecmp(sep->arg[1], "tash")) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if ((!strcasecmp(sep->arg[1], "tash")) && (c->IsGrouped())) {
		Mob *t = c->GetTarget();
		if((t == NULL || t->IsClient() || t->IsBot() || (t->IsPet() && t->GetOwner()->IsBot()))){
			c->Message(15, "You must select a monster");
			return;
		}
		Mob *Tashr;
		bool hasTashr = false;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == ENCHANTER)) {
					hasTashr = true;
					Mob *Tashr = g->members[i];
					const int TashID = (Tashr->GetBotTashLevel());
					if((TashID == 0) && (BotLevel >= 2)){
						Tashr->BotSay("I need to see to the Bot Spell Scriber for this spell.");
						return;
					}
					else if(TashID == 0){
						Tashr->BotSay("I have to be at least level 2 for my Tashan spell, and we need to talk to the Bot Spell Scriber.");
						return;
					}
					else if (BotLevel <= 1){
						Tashr->BotSay("I can't cast this spell tell I'm level 2.");
						return;
					}
					if (!Tashr->CheckLosFN(t)){
						Tashr->BotSay("I don't have line of sight", sep->arg[2]);
						return;
						}
					int MaxTashID = 0;
					uint8 botLevel = g->members[i]->GetLevel();
					if (botLevel >= 72) MaxTashID = 6;
					else if (botLevel >= 61) MaxTashID = 5;
					else if (botLevel >= 57) MaxTashID = 4;
					else if (botLevel >= 41) MaxTashID = 3;
					else if (botLevel >= 18) MaxTashID = 2;
					if ((TashID >= 1) && (TashID < MaxTashID)){
						Tashr->BotSay("I have a newer spell available, we need to see the spell scriber...");
						//return;
					}				
					if ((BotLevel >= 2) && (TashID >= 1)){
						Tashr->InterruptSpell();
						Tashr->BotSay("Casting Tashan...");
						Tashr->CastToNPC()->CastSpell(676, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((BotLevel >= 18) && (TashID >= 2)){
						Tashr->InterruptSpell();
						Tashr->BotSay("Casting Tashani...");
						Tashr->CastToNPC()->CastSpell(677, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((BotLevel >= 41) && (TashID >= 3)){ //Coin of Tash quest needed
						Tashr->InterruptSpell();
						Tashr->BotSay("Casting Tashania...");
						Tashr->CastToNPC()->CastSpell(678, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((BotLevel >= 57) && (TashID >= 4)){
						Tashr->InterruptSpell();
						Tashr->BotSay("Casting Tashanian...");
						Tashr->CastToNPC()->CastSpell(1702, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((BotLevel >= 61) && (TashID >= 5)){
						Tashr->InterruptSpell();
						Tashr->BotSay("Casting Howl of Tashan...");
						Tashr->CastToNPC()->CastSpell(3342, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((BotLevel >= 72) && (TashID >= 6)){
						Tashr->InterruptSpell();
						Tashr->BotSay("Casting Echo of Tashan...");
						Tashr->CastToNPC()->CastSpell(10608, t->GetID(), 1, -1, -1);
						return;
					}
				}
			}
			if(!hasTashr) {
				c->Message(15, "You must have an Enchanter in your group.");
			}
		}
		else {
			c->Message(15, "You must have an Enchanter in your group.");
		}
		return;
	}

//wtash (Enchanters' AE tashan)
	if((!strcasecmp(sep->arg[1], "wtash")) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if ((!strcasecmp(sep->arg[1], "wtash")) && (c->IsGrouped())) {
		Mob *t = c->GetTarget();
		if((t == NULL || t->IsClient() || t->IsBot() || (t->IsPet() && t->GetOwner()->IsBot()))){
			c->Message(15, "You must select a monster");
			return;
		}
		Mob *Wtashr;
		bool hasWtashr = false;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == ENCHANTER)) {
					hasWtashr = true;
					Mob *Wtashr = g->members[i];
					const int hasWtashr = (database.BotWtashrLookup(c->CharacterID()));
					if((hasWtashr == 0) && (BotLevel >= 55)){
						Wtashr->BotSay("I need to see to the Bot Spell Scriber for this spell.");
						return;
					}
					else if(hasWtashr == 0){
						Wtashr->BotSay("I have to be at least level 55 for my Tashan spell, and we need to talk to the Bot Spell Scriber.");
						return;
					}
					else if (BotLevel <= 54){
						Wtashr->BotSay("I can't cast this spell tell I'm level 55.");
						return;
					}
					else if ((BotLevel >=60) && ((hasWtashr == 1))){
						Wtashr->BotSay("I have a newer spell available, we need to see the spell scriber...");
						//return;
					}				
					if ((BotLevel >= 55) && (hasWtashr == 1)){
						Wtashr->InterruptSpell();
						Wtashr->BotSay("Casting Wind of Tashani...");
						Wtashr->CastToNPC()->CastSpell(1699, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((BotLevel >= 60) && (hasWtashr == 2)){
						Wtashr->InterruptSpell();
						Wtashr->BotSay("Casting Wind of Tashanian...");
						Wtashr->CastToNPC()->CastSpell(1704, t->GetID(), 1, -1, -1);
						return;
					}
				}
			}
			if(!hasWtashr) {
				c->Message(15, "You must have an Enchanter in your group.");
			}
		}
		else {
			c->Message(15, "You must have an Enchanter in your group.");
		}
		return;
	}

//Magepet
	if((!strcasecmp(sep->arg[1], "magepet")) && (!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "magepet")) {
		if(!strcasecmp(sep->arg[2], "\0")) {
			c->Message(15, "#bot magepet [earth|water|air|fire|monster] - Select the pet type you want your Mage bot to use.");
			return;
		}
		if(c->GetTarget() && c->GetTarget()->IsBot() && (c->GetTarget()->GetClass() == MAGICIAN) && c->GetTarget()->GetPet()){
			if(database.GetBotOwner(c->GetTarget()->GetNPCTypeID()) == c->CharacterID()){
				int botlevel = c->GetTarget()->GetLevel();
				c->GetTarget()->SetPetChooser(true);
				if(botlevel == 1){
					c->GetTarget()->BotSay("I don't have any pets yet.");
					return;
				}
				if(!strcasecmp(sep->arg[2], "water")){
					c->GetTarget()->SetPetChooserID(1);
					database.SetMagePet(1, c->GetTarget()->GetNPCTypeID());
					c->GetTarget()->GetPet()->Say_StringID(PET_GETLOST_STRING);
					c->GetTarget()->SetPetID(0);
				}
				else if(!strcasecmp(sep->arg[2], "fire")){
					if(botlevel < 3)
					{
						c->GetTarget()->BotSay("I don't have that pet yet.");
						return;
					}
					else{
						c->GetTarget()->SetPetChooserID(2);
						database.SetMagePet(2, c->GetTarget()->GetNPCTypeID());
						c->GetTarget()->GetPet()->Say_StringID(PET_GETLOST_STRING);
						c->GetTarget()->SetPetID(0);
					}
				}
				else if(!strcasecmp(sep->arg[2], "air")){
					if(botlevel < 4){
						c->GetTarget()->BotSay("I don't have that pet yet.");
						return;
					}
					else{
						c->GetTarget()->SetPetChooserID(3);
						database.SetMagePet(3, c->GetTarget()->GetNPCTypeID());
						c->GetTarget()->GetPet()->Say_StringID(PET_GETLOST_STRING);
						c->GetTarget()->SetPetID(0);
					}
				}
				else if(!strcasecmp(sep->arg[2], "earth")){
					if(botlevel < 5){
						c->GetTarget()->BotSay("I don't have that pet yet.");
						return;
					}
					else{
						c->GetTarget()->SetPetChooserID(4);
						database.SetMagePet(4, c->GetTarget()->GetNPCTypeID());
						c->GetTarget()->GetPet()->Say_StringID(PET_GETLOST_STRING);
						c->GetTarget()->SetPetID(0);
					}
				}
				else if(!strcasecmp(sep->arg[2], "monster")){
					if(botlevel < 30){
						c->GetTarget()->BotSay("I don't have that pet yet.");
						return;
					}
					else{
						c->GetTarget()->SetPetChooserID(5);
						database.SetMagePet(5, c->GetTarget()->GetNPCTypeID());
						c->GetTarget()->GetPet()->Say_StringID(PET_GETLOST_STRING);
						c->GetTarget()->SetPetID(0);
					}
				}
			}
		}
		else{
			c->Message(15, "You must target your Magician bot and it needs to have an existing pet summoned first.");
		}
		return;
	}

//Pacify
	if (((!strcasecmp(sep->arg[1], "target")) && (!strcasecmp(sep->arg[2], "calm")) && (!c->IsGrouped())) ||
		((!strcasecmp(sep->arg[1], "pacify"))  && (!c->IsGrouped()))) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if((!strcasecmp(sep->arg[1], "target")) && (!strcasecmp(sep->arg[2], "calm")) || (!strcasecmp(sep->arg[1], "pacify"))){
	    //Pacify Delay
	    if (CheckPacify.GetRemainingTime() < 10)
			CheckPacify.Disable();
		if (CheckPacify.Enabled()){
			c->Message(15, "Not ready yet.");
			return;
		}
		if (!CheckPacify.Enabled()){
			CheckPacify.Start(6010);
		}
	    //End Delay
		Mob *pacer = NULL;
		Mob *target = c->GetTarget();
		if(target == NULL || target->IsClient() || target->IsBot() || target->IsPet() && target->GetOwner()->IsBot())
			c->Message(15, "You must select a monster");
		else {
			int32 pacerClass = 0;
			if(c->IsGrouped()) {
				Group *g = c->GetGroup();
				for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
					if((g) && (g->members[i]) && (g->members[i]->IsBot())) {
						switch (g->members[i]->GetClass()) {
							case ENCHANTER:
								pacer = g->members[i];
								pacerClass = ENCHANTER;
								break;
							case CLERIC:
								if (pacerClass == 0){
									pacer = g->members[i];
									pacerClass = CLERIC;
								}
								break;
							default:
								break;
						}
					}
				}
				if (pacerClass !=0) {
					pacer->InterruptSpell();
					pacer->BotSay("Trying to pacify %s", target->GetCleanName());
					if (!pacer->CheckLosFN(t)){
					     pacer->BotSay("I don't have line of sight", sep->arg[2]);
					     return;
					}
					if(pacer->CastToNPC()->Bot_Command_CalmTarget(target)) {
						if(target->FindType(SE_Lull) || target->FindType(SE_Harmony) || target->FindType(SE_Calm))
							pacer->BotSay( "Successfully pacified %s.", target->GetCleanName());
						else
							pacer->BotSay("Failed to pacify %s.", target->GetCleanName());
					}
					else
						pacer->BotSay("Failed to pacify %s.", target->GetCleanName());
				}
				if ((pacer == 0) || (pacerClass == 0)) {
					c->Message(15, "You must have an Enchanter or Cleric in your group.");
					return; 
				}
			}
		}
		if (pacer == 0) {
			return;
		}
		return;
	}

//Charm
	if((!strcasecmp(sep->arg[1], "Charm")) &&(!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "charm")){
		if (target == NULL) {
			c->Message(15, "Target something!");
			return;
		}
		if(target->IsPet()) {
			c->Message(15, "You can't charm a pet.");
			return;
		}
		if((target->IsClient()) || (target->IsBot()) || ((target->IsPet()) && (target->GetOwner()->IsBot()))){
			c->Message(15, "You must select a monster");
			return;
		}
		int32 DBtype = c->GetTarget()->GetBodyType();
		Mob *Charmer = NULL;
		int32 CharmerClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case ENCHANTER:
							Charmer = g->members[i];
							CharmerClass = ENCHANTER;
							break;
						case NECROMANCER:
							if(CharmerClass != ENCHANTER){
								Charmer = g->members[i];
								CharmerClass = NECROMANCER;
							}
							break;
						case DRUID:
							if (CharmerClass == 0){
								Charmer = g->members[i];
								CharmerClass = DRUID;
							}
							break;
						default:
							break;
					}
				}
			}
			switch(CharmerClass) {
				case ENCHANTER:
					if(BotLevel >= 11) {
						Charmer->InterruptSpell();
						Charmer->BotSay("Trying to charm %s", target->GetCleanName());
						Charmer->CastToNPC()->Bot_Command_CharmTarget (1,target);
					}
					else if (BotLevel <= 10){
						Charmer->BotSay("I don't have the needed level yet", sep->arg[2]);
					}
					else{
						Charmer->BotSay("Mob level is too high or can't be charmed", c->GetName());
					}
					break;
				case NECROMANCER:
					if((BotLevel >= 18) && (DBtype == 3)) {
						Charmer->InterruptSpell();
						Charmer->BotSay("Trying to Charm %s", target->GetCleanName());
						Charmer->CastToNPC()->Bot_Command_CharmTarget (2,target);
					}
					else if (BotLevel <= 17){
						Charmer->BotSay("I don't have the needed level yet", sep->arg[2]);
					}
					else if (DBtype != 3){
						Charmer->BotSay("Mob Is not undead...", c->GetName());
					}
					break;
				case DRUID:
					if((BotLevel >= 13) && (DBtype == 21)) {
						Charmer->InterruptSpell();
						Charmer->BotSay("Trying to charm %s", target->GetCleanName());
						Charmer->CastToNPC()->Bot_Command_CharmTarget (3,target);
					}
					else if (BotLevel <= 12){
						Charmer->BotSay("I don't have the needed level yet", sep->arg[2]);
					}
					else if (DBtype != 21) {
						Charmer->BotSay("Mob is not an animal...", c->GetName());
					}
					break;
				default:
					c->Message(15, "You must have an Enchanter, Necromancer or Druid in your group.");
					break;
			}
		}
		return;
	}
	
//Remove Bot's Pet
	if((!strcasecmp(sep->arg[1], "pet")) && (!strcasecmp(sep->arg[2], "remove")) &&(!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "pet") && !strcasecmp(sep->arg[2], "remove")) {
        if(c->GetTarget() != NULL) {
			if (c->IsGrouped() && c->GetTarget()->IsBot() && (database.GetBotOwner(c->GetTarget()->GetNPCTypeID()) == c->CharacterID()) && 
				((c->GetTarget()->GetClass() == NECROMANCER) || (c->GetTarget()->GetClass() == ENCHANTER) || (c->GetTarget()->GetClass() == DRUID))) {
				if(c->GetTarget()->IsBotCharmer()) {
					c->GetTarget()->SetBotCharmer(false);
					c->GetTarget()->BotSay("Using a summoned pet.");
				}
				else {
					if(c->GetTarget()->GetPet())
					{
						c->GetTarget()->GetPet()->Say_StringID(PET_GETLOST_STRING);
						c->GetTarget()->GetPet()->BotKill();
						c->GetTarget()->SetPetID(0);
					}
					c->GetTarget()->SetBotCharmer(true);
					c->GetTarget()->BotSay("Available for Charm command.");
				}
			}
            else {
                c->Message(15, "You must target your Enchanter, Necromancer, or Druid bot.");
            }
        }
        else {
            c->Message(15, "You must target an Enchanter, Necromancer, or Druid bot.");
        }
		return;
	}

//Dire Charm
	if((!strcasecmp(sep->arg[1], "dire")) && (!strcasecmp(sep->arg[2], "Charm")) &&(!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "Dire") && !strcasecmp(sep->arg[2], "Charm")){
		if (target == NULL){
			c->Message(15, "Target something!");
			return;
		}
		if(target->IsPet()){
			c->Message(15, "You can't charm a pet.");
			return;
		}
		if((target->IsClient()) || (target->IsBot()) || ((target->IsPet()) && (target->GetOwner()->IsBot()))){
			c->Message(15, "You must select a monster");
			return;
		}
		int32 DBtype = c->GetTarget()->GetBodyType();
		Mob *Direr = NULL;
		int32 DirerClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case ENCHANTER:
							Direr = g->members[i];
							DirerClass = ENCHANTER;
							break;
						case NECROMANCER:
							if(DirerClass != ENCHANTER){
								Direr = g->members[i];
								DirerClass = NECROMANCER;
							}
							break;
						case DRUID:
							if (DirerClass == 0){
								Direr = g->members[i];
								DirerClass = DRUID;
							}
							break;
						default:
							break;
					}
				}
			}
			switch(DirerClass) {
				case ENCHANTER:
					if	((BotLevel >= 60) && (target->GetLevel() <= 56)) {
						Direr->InterruptSpell();
						Direr->BotSay("Trying to dire charm %s", target->GetCleanName());
						Direr->CastToNPC()->Bot_Command_DireTarget (1,target);
					}
					else if	((BotLevel >= 60) && (target->GetLevel()  > 56)) {
					Direr->BotSay("Targets level is too high.", c->GetName());  
					}
					else if((BotLevel >= 55) && (target->GetLevel() <= 46)) {
						Direr->InterruptSpell();
						Direr->BotSay("Trying to dire charm %s", target->GetCleanName());
						Direr->CastToNPC()->Bot_Command_DireTarget (1,target);
					}
					else if	((BotLevel >= 55) && (target->GetLevel()  > 46)) {
					Direr->BotSay("Targets level is too high.", c->GetName());  
					}
					else if (BotLevel <  55){
						Direr->BotSay("I don't have the needed level yet", sep->arg[2]);
					}
					else
						Direr->BotSay("Target can't be charmed", c->GetName());
					break;
				case NECROMANCER:
					if	((BotLevel >= 60) && (DBtype == 3) && (target->GetLevel() <= 56)) {
						Direr->InterruptSpell();
						Direr->BotSay("Trying to dire charm %s", target->GetCleanName());
						Direr->CastToNPC()->Bot_Command_DireTarget (2,target);
					}
					else if	((BotLevel >= 60) && (DBtype == 3) && (target->GetLevel()  > 56)) {
					Direr->BotSay("Targets level is too high.", c->GetName());  
					}
					else if((BotLevel >= 55) && (DBtype == 3) && (target->GetLevel() <= 46)) {
						Direr->InterruptSpell();
						Direr->BotSay("Trying to dire charm %s", target->GetCleanName());
						Direr->CastToNPC()->Bot_Command_DireTarget (2,target);
					}
					else if	((BotLevel >= 55) && (DBtype == 3) && (target->GetLevel()  > 46)) {
					Direr->BotSay("Targets level is too high.", c->GetName());  
					}
					else if (BotLevel < 55){
						Direr->BotSay("I don't have the needed level yet", sep->arg[2]);
					}
					else if (DBtype != 3){
						Direr->BotSay("Target Is not undead, ...", c->GetName());
					}
					else
						Direr->BotSay("Target can't be charmed", c->GetName());
					break;

				case DRUID:
					if	((BotLevel >= 60) && (DBtype == 21) && (target->GetLevel() <= 56)) {
						Direr->InterruptSpell();
						Direr->BotSay("Trying to dire charm %s", target->GetCleanName());
						Direr->CastToNPC()->Bot_Command_DireTarget (3,target);
					}
					else if	((BotLevel >= 60) && (DBtype == 21) && (target->GetLevel()  > 56)) {
					Direr->BotSay("Targets level is too high.", c->GetName());  
					}
					else if	((BotLevel >= 55) && (DBtype == 21) && (target->GetLevel() <= 46)) {
						Direr->InterruptSpell();
						Direr->BotSay("Trying to dire charm %s", target->GetCleanName());
						Direr->CastToNPC()->Bot_Command_DireTarget (3,target);
					}
					else if	((BotLevel >= 55) && (DBtype == 21) && (target->GetLevel()  > 46)) {
					Direr->BotSay("Targets level is too high.", c->GetName());  
					}
					else if (BotLevel < 55){
						Direr->BotSay("I don't have the needed level yet", sep->arg[2]);
					}
					else if (DBtype != 21){
						Direr->BotSay("Target is not an animal...", c->GetName());
					}
					else
					    Direr->BotSay("Target can't be charmed", c->GetName());
					break;

				default:
					c->Message(15, "You must have an Enchanter, Necromancer or Druid in your group.");
					break;
			}
		}
		return;
	}
	
//Buff Report
	if((!strcasecmp(sep->arg[1], "buffs")) &&(!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	  }
	   if((!strcasecmp(sep->arg[1], "buffs")) &&(c->IsGrouped())) {
	       if ((c->GetTarget() == NULL)  || (c->GetTarget()->IsNPC()) && (!c->GetTarget()->IsBot()) || (c->GetTarget()->IsClient())) {
		c->Message(15, "You must select a Bot in the zone.");
		return;
	        }
	       else
	        c->GetTarget()->CastToMob()->BuffReport(c);
	        return;
	     }

//Evacuate
	if((!strcasecmp(sep->arg[1], "evac")) &&(!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "evac")) {
		Mob *evac = NULL;
		bool hasevac = false;
		if(c->IsGrouped())
		{
			Group *g = c->GetGroup();
			if(g) {
				for(int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					if((g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == DRUID)) 
					|| (g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == WIZARD)))
					{
						hasevac = true;
						evac = g->members[i];
					}
				}
				if(!hasevac) {
					c->Message(15, "You must have a Druid or Wizard in your group.");
				}
			}
		}
		if((hasevac)  && (BotLevel >= 18)) {
		        int CurMana = evac->GetMana();
			evac->InterruptSpell();
			evac->SetMana(CurMana +300);
			if (evac->GetClass() == DRUID){
			  evac->BotSay("Succor incoming!");
			  //evac->CastToClient()->CastSpell(2183, c->GetID(), 1, -1, -1); // Lesser Succor
			  evac->CastToClient()->CastSpell(1567, c->GetID(), 1, -1, -1); // Succor
			  evac->CastToNPC()->Bot_Command_HealTarget (7,c);
			  }
			else{ // Then it's a Wizard :)
			  evac->BotSay("Evacuate incoming!");
			  evac->CastToClient()->CastSpell(1628, c->GetID(), 1, -1, -1); // Evacuate
			  //evac->CastToNPC()->Bot_Command_HealTarget (7,c); // Wizard don't need this since he doesn't heal
			  }
		}
		else if((hasevac)  && (BotLevel <= 17)) {
			evac->BotSay("I'm not level 18 yet.", c->GetName());
		}
		return;
	}
	
//Title
	if((!strcasecmp(sep->arg[1], "title")) &&(!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		c->Message(15, "Usage: #bot title <lastname, a phrase or tag> <Target>.");
		return;
	}
	if ((!strcasecmp(sep->arg[1], "title")) &&  (t == NULL)){
		c->Message(15, "You must select one of your bots.");
		c->Message(15, "Usage: #bot title <lastname, a phrase or tag> <Target>.");
		return;
	}
	if(!strcasecmp(sep->arg[1], "title")){
		if ((!t->IsBot()) || (t == NULL) || (database.GetBotOwner(t->GetNPCTypeID()) != c->CharacterID())){
			c->Message(15, "You must select one of your bots.");
			c->Message(15, "Usage: #bot title <lastname, a phrase or tag> <Target>.");
			return;
		}
		if (t->GetLevel() < 20){
			c->Message(15, "Bot must be at least level 20 for this.");
			c->Message(15, "Usage: #bot title <lastname, a phrase or tag> <Target>.");
			return;
		}
		char* botTitle = sep->arg[2];
		char* botTitle2 = sep->arg[3];
		char* botTitle3 = sep->arg[4];
		char* botTitle4 = sep->arg[5];
		  if (sep->arg[3][0] != '\0'){
		    strcat(botTitle, " ");
		    strcat(botTitle, botTitle2);
		    }
		  if (sep->arg[4][0] != '\0'){
		    strcat(botTitle, " ");
		    strcat(botTitle, botTitle3);
		    }
		  if (sep->arg[5][0] != '\0'){
		    strcat(botTitle, " ");
		    strcat(botTitle, botTitle4);
		    }
		if(strlen(botTitle) < 2){
			c->Message(15, "Not enough characters.");
			c->Message(15, "Usage: #bot title <lastname, a phrase or tag> <Target>.");
			return;
		}
		if(!botTitle || (strlen(botTitle) > 40)) {
			c->Message(15, "Too many characters.");
			c->Message(15, "Usage: #bot title <lastname, a phrase or tag> <Target>.");
			return;
		}
	 int32 botiD = (t->GetNPCTypeID());
	 (database.SetBotTitle(botiD, botTitle));
	 c->Message(15, "Title set, you need to re-log for effect to take.");
	 c->Message(15, "WARNING! mis-use of this command can result in IP ban.");
	 return;		
	}


//Heal
	if((!strcasecmp(sep->arg[1], "heal")) &&(!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "heal")){
		Mob *target = c->GetTarget();
		if ((c->GetTarget() == NULL)  || (c->GetTarget()->IsNPC()) && (!c->GetTarget()->IsBot())) {
			c->Message(15, "You must select a player or bot in the zone.");
			return;
		}
		Mob *Healer = NULL;
		int32 HealerClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case DRUID:
							Healer = g->members[i];
							HealerClass = DRUID;
							break;
						case SHAMAN:
							if(HealerClass != DRUID){
								Healer = g->members[i];
								HealerClass = SHAMAN;
							}
							break;
						case CLERIC:
							if (HealerClass == 0){
								Healer = g->members[i];
								HealerClass = CLERIC;
							}
							break;
						default:
							break;
					}
				}
			}
			int CurMana = Healer->GetMana();
			if(Healer->IsMoving()){
			    Healer->BotSay("I can't be moving for this!");
			    return;
			}
			if (CurMana < 5){
			  Healer->BotSay("Out of mana!");
			  return;
			 }
			if((((BotLevel >= 63) && (BotLevel <= 75)) && (CurMana < 600))||(((BotLevel >= 58) && (BotLevel <= 62)) && (CurMana < 498))||
			   ((((BotLevel >= 53) && (BotLevel <= 57)) && (CurMana < 355))||((BotLevel >= 51) && (BotLevel <= 52)) && (CurMana < 167))||
			   (((BotLevel >= 30) && (BotLevel <= 50)) && (CurMana < 185))||(((BotLevel >= 20) && (BotLevel <= 29)) && (CurMana < 115))||
			   (((BotLevel >= 10) && (BotLevel <= 19)) && (CurMana < 65))||(((BotLevel >= 4) && (BotLevel <= 9)) && (CurMana < 28)) ||
			   (((BotLevel >= 1) && (BotLevel <= 3)) && (CurMana < 10))){
			      Healer->BotSay("Not enough mana!!");
			      return;
			 }
			switch(HealerClass) {
				case SHAMAN:
					Healer->InterruptSpell();
					Healer->BotSay("Trying to heal %s", target->GetCleanName());
					Healer->CastToNPC()->Bot_Command_HealTarget (1,target);
				    break;

				case DRUID:
					Healer->InterruptSpell();
					Healer->BotSay("Trying to heal %s", target->GetCleanName());
					Healer->CastToNPC()->Bot_Command_HealTarget (2,target);
				    break;

				case CLERIC:
					Healer->InterruptSpell();
					Healer->BotSay("Trying to heal %s", target->GetCleanName());
					Healer->CastToNPC()->Bot_Command_HealTarget (3,target);
				    break;

				default:
					c->Message(15, "You must have a Shaman, Druid, or Cleric in your group.");
					break;
			}
		}
		return;
	}

//SHeal Small Heal
	if((!strcasecmp(sep->arg[1], "sheal"))  && (!c->IsGrouped())) {
		c->Message(15, "Usage: #bot sheal <YourHealerBotsName> <Target>.");
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "sheal")) {
		Mob *target = c->GetTarget();
		if ((c->GetTarget() == NULL)  || (c->GetTarget()->IsNPC()) && (!c->GetTarget()->IsBot())){
			c->Message(15, "Usage: #bot sheal <YourHealerBotsName> <Target>.");
			c->Message(15, "You target a player or bot in the zone.");
			return;
		}
		uint32 botId = (database.GetBotIDByBotName(std::string(sep->arg[2])));
		if(!c->GetBotHealer(c, botId)) {
			c->Message(15, "Usage: #bot sheal <YourHealerBotsName> <Target>.");
			c->Message(15, "You don't see \"%s\" anywhere.", sep->arg[2]);
			return;
		}
		if(!c->GetPTimers().Expired(&database, pTimerBotHealReuse, false)) {
			c->Message(15, "Not ready yet.");
			return;
		}
		c->GetPTimers().Start(pTimerBotHealReuse, 5);
		const NPCType* tmp = 0;
		int32 SHealerClass = 0;
		if((tmp = database.GetNPCType(botId))){
		   Mob *SHealer = entity_list.GetMobByNpcTypeID(botId);
		   int CurMana = SHealer->GetMana();
		   if(SHealer->IsMoving()){
		      SHealer->BotSay("I can't be moving for this!");
		      return;
		   }
		   if (CurMana < 5){
		     SHealer->BotSay("Out of mana!");
		     return;
		   }
			switch(SHealer->GetClass()) {
			case DRUID:
				SHealerClass = DRUID;
				break;
			case SHAMAN:
				SHealerClass = SHAMAN;
				break;
			case CLERIC:
				SHealerClass = CLERIC;
				break;
			default:
				break;
			}
			switch(SHealerClass) {
				case SHAMAN:
				    if((((BotLevel >= 63) && (BotLevel <= 75)) && (CurMana < 600))||(((BotLevel >= 58) && (BotLevel <= 62)) && (CurMana < 498))||
				      ((((BotLevel >= 53) && (BotLevel <= 57)) && (CurMana < 355))||((BotLevel >= 51) && (BotLevel <= 52)) && (CurMana < 167))||
				      (((BotLevel >= 30) && (BotLevel <= 50)) && (CurMana < 185))||(((BotLevel >= 20) && (BotLevel <= 29)) && (CurMana < 115))||
				      (((BotLevel >= 10) && (BotLevel <= 19)) && (CurMana < 65))||(((BotLevel >= 4) && (BotLevel <= 9)) && (CurMana < 28)) ||
				      (((BotLevel >= 1) && (BotLevel <= 3)) && (CurMana < 10))){
					SHealer->BotSay("Not enough mana!!");
				    break;
				      }else{
					SHealer->InterruptSpell();
					SHealer->BotSay("Trying to heal %s", target->GetCleanName());
					SHealer->CastToNPC()->Bot_Command_HealTarget (1,target);
				    break;
				      }
				    break;

				case DRUID:
				    if((((BotLevel >= 63) && (BotLevel <= 75)) && (CurMana < 600))||(((BotLevel >= 58) && (BotLevel <= 62)) && (CurMana < 498))||
				      ((((BotLevel >= 53) && (BotLevel <= 57)) && (CurMana < 355))||((BotLevel >= 51) && (BotLevel <= 52)) && (CurMana < 167))||
				      (((BotLevel >= 30) && (BotLevel <= 50)) && (CurMana < 185))||(((BotLevel >= 20) && (BotLevel <= 29)) && (CurMana < 115))||
				      (((BotLevel >= 10) && (BotLevel <= 19)) && (CurMana < 65))||(((BotLevel >= 4) && (BotLevel <= 9)) && (CurMana < 28)) ||
				      (((BotLevel >= 1) && (BotLevel <= 3)) && (CurMana < 10))){
					SHealer->BotSay("Not enough mana!!");
				    break;
				      }else{
					SHealer->InterruptSpell();
					SHealer->BotSay("Trying to heal %s", target->GetCleanName());
					SHealer->CastToNPC()->Bot_Command_HealTarget (2,target);
				    break;
				      }
				    break;

				case CLERIC:
				    if((((BotLevel >= 63) && (BotLevel <= 75)) && (CurMana < 600))||(((BotLevel >= 58) && (BotLevel <= 62)) && (CurMana < 498))||
				      ((((BotLevel >= 53) && (BotLevel <= 57)) && (CurMana < 355))||((BotLevel >= 51) && (BotLevel <= 52)) && (CurMana < 167))||
				      (((BotLevel >= 30) && (BotLevel <= 50)) && (CurMana < 185))||(((BotLevel >= 20) && (BotLevel <= 29)) && (CurMana < 115))||
				      (((BotLevel >= 10) && (BotLevel <= 19)) && (CurMana < 65))||(((BotLevel >= 4) && (BotLevel <= 9)) && (CurMana < 28)) ||
				      (((BotLevel >= 1) && (BotLevel <= 3)) && (CurMana < 10))){
					SHealer->BotSay("Not enough mana!!");
				    break;
				      }else{
					SHealer->InterruptSpell();
					SHealer->BotSay("Trying to heal %s", target->GetCleanName());
					SHealer->CastToNPC()->Bot_Command_HealTarget (3,target);
				    break;
				      }
				    break;				      

				default:
					c->Message(15, "Usage: #bot sheal <YourHealerBotsName> <Target>.");
					c->Message(15, "You need a Shaman, Druid, or Cleric for this command.");
				    break;
			}
		}
		return;
	}

//CHeal Complete Heal 
	if((!strcasecmp(sep->arg[1], "cheal")) && (!c->IsGrouped())) {
		c->Message(15, "Usage: #bot cheal <YourHealerBotsName> <Target>.");
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "cheal")) {
		bool hasCHealer = false;
		Mob *target = c->GetTarget();
		if ((c->GetTarget() == NULL)  || (c->GetTarget()->IsNPC()) && (!c->GetTarget()->IsBot())){
			c->Message(15, "Usage: #bot cheal <YourHealerBotsName> <Target>.");
			c->Message(15, "You must target a player or bot in the zone.");
			return;
		}
		c->GetPTimers().Start(pTimerBotCHealReuse, 15);
		uint32 botId = (database.GetBotIDByBotName(std::string(sep->arg[2])));
		if(!c->GetBotHealer(c, botId)) {
			c->Message(15, "Usage: #bot cheal <YourHealerBotsName> <Target>.");
			c->Message(15, "You don't see \"%s\" anywhere.", sep->arg[2]);
			return;
		}
		const NPCType* tmp = 0;
		int32 SHealerClass = 0;
		int CurMana = entity_list.GetMobByNpcTypeID(botId)->GetMana();		
		if ((tmp = database.GetNPCType(botId))) {
			Mob *CHealer = entity_list.GetMobByNpcTypeID(botId);
			if (CHealer->GetClass() == CLERIC){
				hasCHealer = true;
				if(CHealer->IsMoving()){
					CHealer->BotSay("I can't be moving for this!");
				        return;
				}
				if (BotLevel <= 38 )
				{
					CHealer->BotSay("I'm not level 39 yet.");
					return;
				}
				else if (CurMana < 400){
					CHealer->BotSay("Not enough mana!");
					return;	
				}
				else{
					CHealer->InterruptSpell();
					CHealer->BotSay("Trying to heal %s", target->GetCleanName());
					CHealer->CastToNPC()->CastSpell(13, t->GetID(), 1, -1, -1);
					//CHealer->SetMana(CurMana -400);					
					return;
				}
			    }
			}
			if(!hasCHealer) {
				c->Message(15, "Usage: #bot cheal <YourHealerBotsName> <Target>.");
				c->Message(15, "You need a Cleric for this command.");
			}
		else {
			c->Message(15, "Usage: #bot cheal <YourHealerBotsName> <Target>.");
			c->Message(15, "You need a Cleric for this command.");
		}
        return;
	}

//Subvent (Heal Mana)
	if((!strcasecmp(sep->arg[1], "subvent")) && (!c->IsGrouped())) {
		c->Message(15, "Usage: #bot subvent <YourNecroBotsName> <Target>.");
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "subvent")) {
		bool hasMHealer = false;
		Mob *target = c->GetTarget();
		if ((c->GetTarget() == NULL)  || (c->GetTarget()->IsNPC()) && (!c->GetTarget()->IsBot())){
			c->Message(15, "Usage: #bot subvent <YourNecroBotsName> <Target>.");
			c->Message(15, "You must target a player or bot in the zone.");
			return;
		}
		uint32 botId = (database.GetBotIDByBotName(std::string(sep->arg[2])));
		if(!c->GetBotHealer(c, botId)) {
			c->Message(15, "Usage: #bot subvent <YourNecroBotsName> <Target>.");
			c->Message(15, "You don't see \"%s\" anywhere.", sep->arg[2]);
			return;
		}
		const NPCType* tmp = 0;
		int32 MHealerClass = 0;
		int CurMana = entity_list.GetMobByNpcTypeID(botId)->GetMana();
		if ((tmp = database.GetNPCType(botId))) {
			Mob *MHealer = entity_list.GetMobByNpcTypeID(botId);
			if (MHealer->GetClass() == NECROMANCER){
				hasMHealer = true;
				if(MHealer->IsMoving()){
					MHealer->BotSay("I can't be moving for this!");
				        return;
				}
				if (BotLevel <= 20 ){
					MHealer->BotSay("I'm not level 21 yet.");
					return;
				}
				else{
					MHealer->InterruptSpell();
					MHealer->BotSay("Mana Subvention for %s", target->GetCleanName());
					  if((BotLevel >= 56) && (BotLevel <= 75)) { //Sedulous Subversion
					    if (CurMana < 400){
					      MHealer->BotSay("Not enough mana!") ;
					      return;}
					    MHealer->GetTarget()->SpellOnTarget(1718, t);
					    MHealer->SetMana(CurMana -400); 					    
					   }
					  else if((BotLevel >= 43) && (BotLevel <= 55)) { //Covetous Subversion
					    if (CurMana < 300){
					      MHealer->BotSay("Not enough mana!") ;
					      return;}
					    MHealer->GetTarget()->SpellOnTarget(1515, t);
					    MHealer->SetMana(CurMana -300); 					    
					   }
					  else if((BotLevel >= 21) && (BotLevel <= 42)) { //Rapacious Subvention
					    if (CurMana < 200){
					      MHealer->BotSay("Not enough mana!") ;
					      return;}
					    MHealer->GetTarget()->SpellOnTarget(1514, t);
					    MHealer->SetMana(CurMana -200); 
					   }
					  //MHealer->Bot_Command_HealTarget (6,target);
				        return;
				}
			    }
			}
			if(!hasMHealer) {
				c->Message(15, "Usage: #bot subvent <YourNecroBotsName> <Target>.");
				c->Message(15, "You need a Necromancer for this command.");
			}
		else {
			c->Message(15, "Usage: #bot subvent <YourNecroBotsName> <Target>.");
			c->Message(15, "You need a Necromancer for this command.");
		}
        return;
	}

//PetHeal
	if((!strcasecmp(sep->arg[1], "petheal"))  && (!c->IsGrouped())) {
		c->Message(15, "Usage: #bot petheal <YourHealerBotsName> <PetTarget>.");
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "petheal")) {
		Mob *target = c->GetTarget();
		if((target != NULL) && (target->IsPet())){
			uint32 botId = (database.GetBotIDByBotName(std::string(sep->arg[2])));
			if(!c->GetBotHealer(c, botId)) {
				c->Message(15, "Usage: #bot petheal <YourHealerBotsName> <PetTarget>.");
				c->Message(15, "You don't see \"%s\" anywhere.", sep->arg[2]);
				return;
			}
			const NPCType* tmp = 0;
			int32 PHealerClass = 0;
			if ((tmp = database.GetNPCType(botId))) {
				Mob *PHealer = entity_list.GetMobByNpcTypeID(botId);
				if (PHealer == 0) {
					c->Message(15, "\"%s\" does not match any of your bots names.", sep->arg[2]);
				}
				else if (PHealer->GetTarget()){
					PHealer->InterruptSpell();

					switch(PHealer->GetClass()) {
						case DRUID:
							PHealer->CastToNPC()->Bot_Command_HealTarget (2,target);
							break;
						case SHAMAN:
							PHealer->CastToNPC()->Bot_Command_HealTarget (1,target);
							break;
						case CLERIC:
							PHealer->CastToNPC()->Bot_Command_HealTarget (3,target);
							break;
						default:
							c->Message(15, "You need a Shaman, Druid, or Cleric for this command.");
						break;
					}
				}
			}
	    }
	    else {
			c->Message(15, "Usage: #bot petheal <YourHealerBotsName> <Target>.");
			c->Message(15, "You must target a pet for this.");
			return;
		}
		return;
	}

//Healme
	if((!strcasecmp(sep->arg[1], "healme")) &&(!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "healme")){
		Mob *Healer = NULL;
		int32 HealerClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case DRUID:
							Healer = g->members[i];
							HealerClass = DRUID;
							break;
						case SHAMAN:
							if(HealerClass != DRUID){
								Healer = g->members[i];
								HealerClass = SHAMAN;
							}
							break;
						case CLERIC:
							if ((HealerClass != DRUID) || (HealerClass != SHAMAN)){
								Healer = g->members[i];
								HealerClass = CLERIC;
							}
							break;
						case PALADIN:
							if (HealerClass == 0){
								Healer = g->members[i];
								HealerClass = PALADIN;
							}
							break;
						case SHADOWKNIGHT:
							if (HealerClass == 0){
								Healer = g->members[i];
								HealerClass = SHADOWKNIGHT;
							}
							break;
						case RANGER:
							if (HealerClass == 0){
								Healer = g->members[i];
								HealerClass = RANGER;
							}
							break;
						case BARD:
							if (HealerClass == 0){
								Healer = g->members[i];
								HealerClass = BARD;
							}
							break;
						case ROGUE:
							if (HealerClass == 0){
								Healer = g->members[i];
								HealerClass =ROGUE;
							}
							break;
						case WARRIOR:
							if (HealerClass == 0){
								Healer = g->members[i];
								HealerClass = WARRIOR;
							}
							break;
						case WIZARD:
							if (HealerClass == 0){
								Healer = g->members[i];
								HealerClass = WIZARD;
							}
							break;
						case MAGICIAN:
							if (HealerClass == 0){
								Healer = g->members[i];
								HealerClass = MAGICIAN;
							}
							break;
						case BEASTLORD:
							if (HealerClass == 0){
								Healer = g->members[i];
								HealerClass = BEASTLORD;
							}
							break;
						case BERSERKER:
							if (HealerClass == 0){
								Healer = g->members[i];
								HealerClass = BERSERKER;
							}
							break;
						case ENCHANTER:
							if (HealerClass == 0){
								Healer = g->members[i];
								HealerClass = ENCHANTER;
							}
							break;
						case MONK:
							if (HealerClass == 0){
								Healer = g->members[i];
								HealerClass = MONK;
							}
							break;
						default:
							break;
					}
				}
			}
			int CurMana = Healer->GetMana();
			if ((CurMana > 0) && (CurMana < 7)){
			  Healer->BotSay("Out of mana!");
			  return;
			 }
		       if (CurMana > 0){
			if((((BotLevel >= 63) && (BotLevel <= 75)) && (CurMana < 600))||(((BotLevel >= 58) && (BotLevel <= 62)) && (CurMana < 498))||
			   ((((BotLevel >= 53) && (BotLevel <= 57)) && (CurMana < 355))||((BotLevel >= 51) && (BotLevel <= 52)) && (CurMana < 167))||
			   (((BotLevel >= 30) && (BotLevel <= 50)) && (CurMana < 185))||(((BotLevel >= 20) && (BotLevel <= 29)) && (CurMana < 115))||
			   (((BotLevel >= 10) && (BotLevel <= 19)) && (CurMana < 65))||(((BotLevel >= 4) && (BotLevel <= 9)) && (CurMana < 28)) ||
			   (((BotLevel >= 1) && (BotLevel <= 3)) && (CurMana < 10))){
			      Healer->BotSay("Not enough mana!!");
			      return;
			 }
			}
			switch(HealerClass) {
				case SHAMAN:
						Healer->InterruptSpell();
						Healer->BotSay("Trying to heal you");
						Healer->CastToNPC()->Bot_Command_HealTarget (1,c);
					break;

				case DRUID:
						Healer->InterruptSpell();
						Healer->BotSay("Trying to heal you");
						Healer->CastToNPC()->Bot_Command_HealTarget (2,c);
					break;

				case CLERIC:
						Healer->InterruptSpell();
						Healer->BotSay("Trying to heal you");
						Healer->CastToNPC()->Bot_Command_HealTarget (3,c);
					break;
					
				case PALADIN:
						c->Message(15, "You must have an Shaman, Druid, or Cleric in your group.");
					break;
					
				case WARRIOR:
						c->Message(15, "You must have an Shaman, Druid, or Cleric in your group.");
					break;
					
				case SHADOWKNIGHT:
						c->Message(15, "You must have an Shaman, Druid, or Cleric in your group.");
					break;

				case MONK:
						c->Message(15, "You must have an Shaman, Druid, or Cleric in your group.");
					break;

				case BARD:
						c->Message(15, "You must have an Shaman, Druid, or Cleric in your group.");
					break;

				case ROGUE:
						c->Message(15, "You must have an Shaman, Druid, or Cleric in your group.");
					break;

				case NECROMANCER:
						c->Message(15, "You must have an Shaman, Druid, or Cleric in your group.");
					break;

				case WIZARD:
						c->Message(15, "You must have an Shaman, Druid, or Cleric in your group.");
					break;

				case MAGICIAN:
						c->Message(15, "You must have an Shaman, Druid, or Cleric in your group.");
					break;

				case ENCHANTER:
						c->Message(15, "You must have an Shaman, Druid, or Cleric in your group.");
					break;

				case BEASTLORD:
						c->Message(15, "You must have an Shaman, Druid, or Cleric in your group.");
					break;

				case BERSERKER:
						c->Message(15, "You must have an Shaman, Druid, or Cleric in your group.");
					break;
					
				default:
					c->Message(15, "You must have an Shaman, Druid, or Cleric in your group.");
					break;
			}
		}
	return;
	}

//Slow
	if((!strcasecmp(sep->arg[1], "slow")) &&(!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "slow")){
	    Mob *Slower = NULL;
	    int32 SlowerClass = 0;
	    Group *g = c->GetGroup();
	    Mob *target = c->GetTarget();
		if((target == NULL || target->IsClient() || target->IsBot() || (target->IsPet() && target->GetOwner()->IsBot()))){
			c->Message(15, "You must select a monster");
			return;
		}
		else if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case SHAMAN:
							Slower = g->members[i];
							SlowerClass = SHAMAN;
							break;
						case ENCHANTER:
							if(SlowerClass != SHAMAN){
								Slower = g->members[i];
								SlowerClass = ENCHANTER;
							}
							break;
						case BEASTLORD:
							if (SlowerClass == 0){
								Slower = g->members[i];
								SlowerClass = BEASTLORD;
							}
							break;
						default:
							break;
					}
				}
			}
			switch(SlowerClass) {
				case SHAMAN:
					if (BotLevel <= 4){
						Slower->BotSay("I don't have the needed level yet", sep->arg[2]);
					    break;
						}
					if (!Slower->CheckLosFN(t)){
						Slower->BotSay("I don't have line of sight", sep->arg[2]);
					    break;
						}
						Slower->InterruptSpell();
						Slower->BotSay("Trying to slow your target.");
						Slower->CastToNPC()->Bot_Command_SlowTarget (2,target);
					break;

				case ENCHANTER:
					if (BotLevel <= 8){
						Slower->BotSay("I don't have the needed level yet", sep->arg[2]);
					    break;
						}
					if (!Slower->CheckLosFN(t)){
						Slower->BotSay("I don't have line of sight", sep->arg[2]);
					    break;
						}
						Slower->InterruptSpell();
						Slower->BotSay("Trying to slow your target.");
						Slower->CastToNPC()->Bot_Command_SlowTarget (3,target);
					break;

				case BEASTLORD:
					if (BotLevel <= 19){
						Slower->BotSay("I don't have the needed level yet", sep->arg[2]);
					    break;
						}
					if (!Slower->CheckLosFN(t)){
						Slower->BotSay("I don't have line of sight", sep->arg[2]);
					    break;
						}
						Slower->InterruptSpell();
						Slower->BotSay("Trying to slow your target.");
						Slower->CastToNPC()->Bot_Command_SlowTarget (1,target);
					break;

				default:
					c->Message(15, "You must have an Shaman, Enchanter, or Beastlord in your group.");
					break;
			}
		}
		return;
	}

//Sow
	if((!strcasecmp(sep->arg[1], "sow")) &&(!c->IsGrouped())) {
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if ((!strcasecmp(sep->arg[1], "sow")) && (c->IsGrouped())) {
		if ((c->GetTarget() == NULL)  || (c->GetTarget()->IsNPC()) && (!c->GetTarget()->IsBot())) {
			c->Message(15, "You must select a player or bot in the zone.");
			return;
		}
		Mob *t = c->GetTarget();
		Mob *Sower = NULL;
		int32 SowerClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case DRUID:
							if (BotLevel >= 10){
								Sower = g->members[i];
								SowerClass = DRUID;
							}
							break;
						case BEASTLORD:
							if ((BotLevel >= 24) && (SowerClass != DRUID)){
							  Sower = g->members[i];
							  SowerClass = BEASTLORD;
							}
							break;
						case RANGER:
							if ((BotLevel >= 28) && (SowerClass != DRUID)){
							  Sower = g->members[i];
							  SowerClass = RANGER;
							}
							break;
						case SHAMAN:
							if ((BotLevel >= 9) && (SowerClass == 0 )){
							  Sower = g->members[i];
							  SowerClass = SHAMAN;
							}
							break;
						default:
							break;
					}
				}
			}
			switch(SowerClass) {
				case DRUID:
					Sower->InterruptSpell();
					if (Sower-> IsMoving()){
						Sower->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if      ((!strcasecmp(sep->arg[2], "regular")) && (zone->CanCastOutdoor())  && (Sower->GetLevel() >= 10) ) {
						Sower->BotSay("Casting sow...");
						Sower->CastToNPC()->CastSpell(278, t->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "eagle")) && (zone->CanCastOutdoor())){
						 if (Sower->GetLevel() >= 62) {
						Sower->BotSay("Casting Flight of Eagles...");
						Sower->CastToNPC()->CastSpell(3185, t->GetID(), 1, -1, -1);
						return;
						} 
						else if (Sower->GetLevel() >= 54){
							Sower->BotSay("Casting Spirit of Eagle...");
							Sower->CastToNPC()->CastSpell(2517, t->GetID(), 1, -1, -1);
							return;
						}
						else {
							Sower->BotSay("I'm not level 54 yet.");
							return;
						}
					}
					else if ((!strcasecmp(sep->arg[2], "regular")) && (zone->CanCastOutdoor())  && (Sower->GetLevel() <= 10) ) {
						Sower->BotSay("I'm not level 10 yet.");
					}
					else if ((!strcasecmp(sep->arg[2], "wolf")) && zone->CanCastOutdoor() && (Sower->GetLevel() >= 20)) {
						Sower->BotSay("Casting Wolf Form...");
						Sower->GetTarget()->SpellOnTarget(425, t);
						//Sower->CastToNPC()->CastSpell(425, t->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "group")) && (!strcasecmp(sep->arg[3], "wolf")) &&  (zone->CanCastOutdoor() && (Sower->GetLevel() >= 34))) {
						Sower->BotSay("Casting Share Wolf Form...");
						Sower->CastSpell(428, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "group")) && zone->CanCastOutdoor() && (Sower->GetLevel() >= 34)) {
						Sower->BotSay("Casting Pack Spirit...");
						Sower->CastSpell(169, c->GetID(), 1, -1, -1);
					}					
					else if ((!strcasecmp(sep->arg[2], "wolf")) && (Sower->GetLevel() <= 20)) {
						Sower->BotSay("I'm not level 20 yet.");
					}
					else if ((!strcasecmp(sep->arg[2], "group")) && (Sower->GetLevel() <= 35)) {
						Sower->BotSay("I'm not level 35 yet.");
					}
					else if ((!strcasecmp(sep->arg[2], "feral")) && (Sower->GetLevel() >= 50)) { 
						Sower->BotSay("Casting Feral Pack...");
						Sower->CastSpell(4058, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "feral")) && (Sower->GetLevel() <= 50)) {
						Sower->BotSay("I'm not level 50 yet.");
					}
					else if ((!strcasecmp(sep->arg[2], "shrew")) && (Sower->GetLevel() >= 35)) { 
						Sower->BotSay("Casting Pack Shrew...");
						Sower->CastSpell(4055, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "shrew")) && (Sower->GetLevel() <= 34)) {
						Sower->BotSay("I'm not level 35 yet.");
					}
					else if (((!zone->CanCastOutdoor()) && (!strcasecmp(sep->arg[2], "regular"))) ||
						((!zone->CanCastOutdoor()) && (!strcasecmp(sep->arg[2], "wolf")))) {
						Sower->BotSay("I can't cast this spell indoors, try [sow shrew] if you're 35 or higher, or [sow feral] if you're 50 or higher,", c->GetName());
					}
					else if ((!strcasecmp(sep->arg[2], "wolf")) && (Sower->GetLevel() <= 35)) {
						Sower->BotSay("I'm not level 35 yet.");
					}					
					else if (!zone->CanCastOutdoor()) {
						Sower->BotSay("I can't cast this spell indoors, try [sow shrew] if you're 35 or higher, or [sow feral] if you're 50 or higher,", c->GetName());
					}
					else if (zone->CanCastOutdoor()) {
						Sower->BotSay("I have [sow regular], [sow group], [sow wolf] , [sow group wolf] or [sow eagle] provided we have the proper level. ", c->GetName());
					}
					else if (!zone->CanCastOutdoor()) {
						Sower->BotSay("I can't cast this spell indoors, try [sow shrew] if you're 35 or higher, or [sow feral] if you're 50 or higher,", c->GetName());
					}
					break;

				case SHAMAN:
					Sower->InterruptSpell();
					if (Sower-> IsMoving()){
						Sower->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if      ((!strcasecmp(sep->arg[2], "regular")) && (zone->CanCastOutdoor())  && (Sower->GetLevel() >= 9) ) {
						Sower->BotSay("Casting sow...");
						Sower->CastToNPC()->CastSpell(278, t->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "regular")) && (Sower->GetLevel() <= 8)) {
						Sower->BotSay("I'm not level 9 yet.");
					}
					else if ((!strcasecmp(sep->arg[2], "shrew")) && (Sower->GetLevel() <= 28)) {
						Sower->BotSay("I'm not level 29 yet.");
					}
					else if ((!strcasecmp(sep->arg[2], "shrew")) && (Sower->GetLevel() >= 29)) { 
						Sower->BotSay("Casting Spirit of the Shrew...");
						Sower->CastToNPC()->CastSpell(4054, t->GetID(), 1, -1, -1);
					}
					else if ((!zone->CanCastOutdoor()) && (!strcasecmp(sep->arg[2], "regular"))) {
						Sower->BotSay("I can't cast this spell indoors, try [sow shrew] if you're 29 or higher", c->GetName());
					}
					else {
						Sower->BotSay("Do you want [sow regular] or [sow shrew]?", c->GetName());
					}
					break;

				case RANGER:
					Sower->InterruptSpell();
					if (Sower-> IsMoving()){
						Sower->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if      ((!strcasecmp(sep->arg[2], "regular")) && (zone->CanCastOutdoor())  && (Sower->GetLevel() >= 28) ) {
						Sower->BotSay("Casting sow...");
						Sower->CastToNPC()->CastSpell(278, t->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "regular")) && (Sower->GetLevel() <= 27)) {
						Sower->BotSay("I'm not level 28 yet.");
					}
					else if ((!strcasecmp(sep->arg[2], "shrew")) && (Sower->GetLevel() <= 40)) {
						Sower->BotSay("I'm not level 41 yet.");
					}
					else if ((!strcasecmp(sep->arg[2], "shrew")) && (Sower->GetLevel() >= 41)) { 
						Sower->BotSay("Casting Spirit of the Shrew...");
						Sower->CastToNPC()->CastSpell(4054, t->GetID(), 1, -1, -1);
					}
					else if ((!zone->CanCastOutdoor()) && (!strcasecmp(sep->arg[2], "regular"))) {
						Sower->BotSay("I can't cast this spell indoors, try [sow shrew] if you're 41 or higher", c->GetName());
					}
					else {
						Sower->BotSay("Do you want [sow regular] or [sow shrew]?", c->GetName());
					}
					break;

				case BEASTLORD:
					Sower->InterruptSpell();
					if (Sower-> IsMoving()){
						Sower->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if      ((!strcasecmp(sep->arg[2], "regular")) && (zone->CanCastOutdoor())  && (Sower->GetLevel() >= 28) ) {
						Sower->BotSay("Casting sow...");
						Sower->CastToNPC()->CastSpell(278, t->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "regular")) && (Sower->GetLevel() <= 27)) {
						Sower->BotSay("I'm not level 28 yet.");
					}
					else if ((!strcasecmp(sep->arg[2], "shrew")) && (Sower->GetLevel() <= 38)) {
						Sower->BotSay("I'm not level 39 yet.");
					}
					else if ((!strcasecmp(sep->arg[2], "shrew")) && (Sower->GetLevel() >= 39)) { 
						Sower->BotSay("Casting Spirit of the Shrew...");
						Sower->CastToNPC()->CastSpell(4054, t->GetID(), 1, -1, -1);
					}
					else if ((!zone->CanCastOutdoor()) && (!strcasecmp(sep->arg[2], "regular"))) {
						Sower->BotSay("I can't cast this spell indoors, try [sow shrew] if you're 39 or higher", c->GetName());
					}
					else {
						Sower->BotSay("Do you want [sow regular] or [sow shrew]?", c->GetName());
					}
					break;

				default:
					if (BotLevel <= 9){
					  c->Message(15, "The lowest possible sow is available with a level 9 Shaman, so you have to be level 9");
					break;
					}
					else{
					c->Message(15, "You must have one of the following; level 10 or higher Druid, 9 or higher Shaman, 28 or higher Ranger, 24 or higher Beastlord in your group.");
					break;
					}
					break;
			}
		}
		return;
	}

//Shrink
	if((!strcasecmp(sep->arg[1], "shrink")) &&(!c->IsGrouped())){
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if(!strcasecmp(sep->arg[1], "shrinkme")) {
		c->Message(15, "This command has been changed - try '#bot shrink'.");
		return;
	}
	if ((!strcasecmp(sep->arg[1], "shrink")) && (c->IsGrouped())) {
		Group* mygroup = c->GetGroup();
		if((t == NULL) || (t->IsNPC()) && (!t->IsBot()) || (!t->IsGrouped()) ||
			((mygroup) && (!mygroup->IsGroupMember(t)))) {
			c->Message(15, "Target a player or bot in your group.");
			return;
		}
		Mob *t = c->GetTarget();
		Mob *Shrinker = NULL;
		int32 ShrinkerClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case SHAMAN:
							Shrinker = g->members[i];
							ShrinkerClass = SHAMAN;
							break;
						case BEASTLORD:
							if (ShrinkerClass != SHAMAN){
								Shrinker = g->members[i];
								ShrinkerClass = BEASTLORD;
							}
							break;
						default:
							break;
					}
				}
			}
			switch(ShrinkerClass) {
				case SHAMAN:

					if (BotLevel >= 15) {
						Shrinker->InterruptSpell(); 
						Shrinker->BotSay("Casting Shrink...");
						//Shrinker->CastToBot()->BotRaidSpell(345);
						//Shrinker->CastSpell(345, c->GetID(), 1);
						Shrinker->CastToNPC()->CastSpell(345, t->GetID(), 1, -1, -1);
					}
					else if (BotLevel <= 14) {
						Shrinker->BotSay("I'm not level 15 yet.");
					}
					break;

				case BEASTLORD:

					if (BotLevel >= 23) {
						Shrinker->InterruptSpell();
						Shrinker->BotSay("Casting Shrink...");
						//Shrinker->CastToBot()->BotRaidSpell(345);
						//Shrinker->CastSpell(345, c->GetID(), 1);
						Shrinker->CastToNPC()->CastSpell(345, t->GetID(), 1, -1, -1);
					}
					else if (BotLevel <= 22) {
						Shrinker->BotSay("I'm not level 23 yet.");
					}
					break;

				default:
					c->Message(15, "You must have a Shaman or Beastlord in your group.");
					break;
			}
		}
		return;
	}

//Gate
	if((!strcasecmp(sep->arg[1], "gate")) &&(!c->IsGrouped())){
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if ((!strcasecmp(sep->arg[1], "gate")) && (c->IsGrouped())) {
		Mob *Gater = NULL;
		int32 GaterClass = 0;
		Group *g = c->GetGroup();
		bool Special = (RuleB(EQOffline, AXCustom));
		const int canGate = (database.BotCircleLookup(c->CharacterID())); //Druid Gate spells
		const int canPort = (database.BotPortalLookup(c->CharacterID())); //Wizard Gate spells
	   if (classicStat > 0){
	     if ((!strcasecmp(sep->arg[2], "dulak"))||(!strcasecmp(sep->arg[2], "gunthak"))||(!strcasecmp(sep->arg[2], "nexus"))||
	      (!strcasecmp(sep->arg[2], "twilight"))||(!strcasecmp(sep->arg[2], "pok"))||(!strcasecmp(sep->arg[2], "wos"))||
	      (!strcasecmp(sep->arg[2], "combines"))||(!strcasecmp(sep->arg[2], "divide"))||(!strcasecmp(sep->arg[2], "twilight"))||
	      (!strcasecmp(sep->arg[2], "emerald"))||(!strcasecmp(sep->arg[2], "wakening"))||(!strcasecmp(sep->arg[2], "cobalt"))||
	      (!strcasecmp(sep->arg[2], "dawnshroud"))||(!strcasecmp(sep->arg[2], "grimling"))||(!strcasecmp(sep->arg[2], "bloodfields"))||
	      (!strcasecmp(sep->arg[2], "maiden"))){
		c->Message(15, "Spell not available in Classic2012.");
		return;
	     }
	   }
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case DRUID:
							  Gater = g->members[i];
							  GaterClass = DRUID;
							break;
						case WIZARD:
							if (GaterClass == 0){
							  Gater = g->members[i];
							  GaterClass = WIZARD;
						}
							break;
						default:
							break;
					}
				}
			}
			switch(GaterClass) {
				case DRUID:
				      Gater->InterruptSpell();
				       if ((Special) && (canGate == 0)) {
					    if (BotLevel >= 66){
						      Gater->BotSay("Most Lesser Moonstone and Moonstone gates are trivial for us, we can't gate there anymore. We stll have [Nexus] and [PoK] gates if we complete the Bot Spell Scriber's request.");
						      return;
					      }
					    else if(BotLevel >= 25){
						      Gater->BotSay("We haven't completed the Bot Spell Scriber's request yet.");
						      return;
					      }
					    else{
						      Gater->BotSay("I have to be at least level 25 for my first Circle spells, and you need to talk to the Bot Spell Scriber.");
						      return;
					      }
					}
					if (Gater-> IsMoving()){
					      Gater->BotSay("I can't be moving for this!");
					      return;					  					  
					}
					if ((!strcasecmp(sep->arg[2], "karana")) && (BotLevel >= 25) && (BotLevel <= 65) ) {
						Gater->BotSay("Casting Circle of Karana...");
						Gater->CastSpell(550, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "tox")) && (BotLevel >= 25) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Toxxulia...");
						Gater->CastSpell(552, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "gunthak")) && (BotLevel >= 25) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Gunthak...");
						Gater->CastSpell(15929, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "dulak")) && (BotLevel >= 25) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Dulak...");
						Gater->CastSpell(15930, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "butcher")) && (BotLevel >= 25) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Butcherblock...");
						Gater->CastSpell(553, c->GetID(), 1, -1, -1);
						return;
					}
					else if (((!strcasecmp(sep->arg[2], "karana")) || (!strcasecmp(sep->arg[2], "gunthak")) || (!strcasecmp(sep->arg[2], "dulak")) || (!strcasecmp(sep->arg[2], "tox")) || (!strcasecmp(sep->arg[2], "butcher"))) && (BotLevel < 25)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "surefall")) && (BotLevel >= 26) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Surefall Glade...");
					        Gater->CastSpell(2020, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "nexus")) && (BotLevel >= 26)) { 
						Gater->BotSay("Casting Circle of The Nexus...");
						Gater->CastSpell(2432, c->GetID(), 1, -1, -1);
						return;
					}
					else if (((!strcasecmp(sep->arg[2], "surefall")) || (!strcasecmp(sep->arg[2], "nexus"))) && (BotLevel < 26)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "commons")) && (BotLevel >= 27) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Circle of Commons...");
						Gater->CastSpell(551, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "commons")) && (BotLevel < 27)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "stonebrunt")) && (BotLevel >= 28) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Stonebrunt Mountains...");
						Gater->CastSpell(3792, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "stonebrunt")) && (BotLevel < 28)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}					
					else if ((!strcasecmp(sep->arg[2], "grimling")) && (BotLevel >= 29) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Grimling Forest...");
						Gater->CastSpell(2419, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "grimling")) && (BotLevel < 29)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "lava")) && (BotLevel >= 30) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Lavastorm...");
						Gater->CastSpell(554, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "lava")) && (BotLevel < 30)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}					
					else if ((!strcasecmp(sep->arg[2], "steamfont")) && (BotLevel >= 31) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Steamfont...");
						Gater->CastSpell(557, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "steamfont")) && (BotLevel < 31)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "ro")) && (BotLevel >= 32) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Ro...");
						Gater->CastSpell(555, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "feerrott")) && (BotLevel >= 32) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Feerrott...");
						Gater->CastSpell(556, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "iceclad")) && (BotLevel >= 32) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Iceclad Ocean...");
						Gater->CastSpell(1434, c->GetID(), 1, -1, -1);
						return;
					}
					else if (((!strcasecmp(sep->arg[2], "ro")) || (!strcasecmp(sep->arg[2], "feerrott")) || (!strcasecmp(sep->arg[2], "iceclad"))) && (BotLevel < 32)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
				        if ((Special) && (canGate == 1 )) {
					    if (BotLevel >= 66){
						      Gater->BotSay("Most Lesser Moonstone and Moonstone gates are trivial for us, we can't gate there anymore. We still have [Nexus] and [PoK] gates available. We need to see the Bot Spell Scriber for my Moonstone of Circles quest.");
						      return;
					      }
					    else if(BotLevel <= 32) {
						      Gater->BotSay("I have Lesser Moonstone quest complete, which allows gates to [gunthak], [dulak], [karana], [commons], [tox], [butcher], [lava], [ro], [feerrott], [steamfont], [iceclad], [surefall], [grimling], [nexus],and [stonebrunt]");
						      return;
					      }
					    else if(BotLevel > 32){
						      Gater->BotSay("I have Lesser Moonstone quest complete, which allows gates to [gunthak], [dulak], [karana], [commons], [tox], [butcher], [lava], [ro], [feerrott], [steamfont], [iceclad], [surefall], [grimling], [nexus],and [stonebrunt]. We need to see the Bot Spell Scriber for my Moonstone of Circles quest.");
						      return;
					      }
					}
					if ((!strcasecmp(sep->arg[2], "combines")) && (BotLevel >= 33) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of The Combines...");
						Gater->CastSpell(1517, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "twilight")) && (BotLevel >= 33) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Twilight...");
						Gater->CastSpell(2424, c->GetID(), 1, -1, -1);
						return;
					}
					else if (((!strcasecmp(sep->arg[2], "combines")) || (!strcasecmp(sep->arg[2], "twilight"))) && (BotLevel < 33)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "divide")) && (BotLevel >= 36) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of The Great Divide...");
						Gater->CastSpell(1438, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "misty")) && (BotLevel >= 36) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Misty...");
						Gater->CastSpell(558, c->GetID(), 1, -1, -1);
						return;
					}
					else if (((!strcasecmp(sep->arg[2], "divide")) || (!strcasecmp(sep->arg[2], "misty"))) && (BotLevel < 36)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "dawnshroud")) && (BotLevel >= 37) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Dawnshroud...");
						Gater->CastSpell(2429, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "dawnshroud")) && (BotLevel < 37)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "pok")) && (BotLevel >= 38)) { 
						Gater->BotSay("Casting Circle of Knowledge...");
						Gater->CastSpell(3184, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "pok")) && (BotLevel < 38)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "emerald")) && (BotLevel >= 39) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Wind of the South...");
						Gater->CastSpell(1737, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "emerald")) && (BotLevel < 39)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "wakening")) && (BotLevel >= 40) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Wakening Lands...");
						Gater->CastSpell(1398, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "wakening")) && (BotLevel < 40)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "cobalt")) && (BotLevel >= 42) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of Cobalt Scar...");
						Gater->CastSpell(1440, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "cobalt")) && (BotLevel < 42)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "skyfire")) && (BotLevel >= 44) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Wind of the North...");
						Gater->CastSpell(1736, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "skyfire")) && (BotLevel < 44)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "maiden")) && (BotLevel >= 44) && (BotLevel <= 65)) { 
						Gater->BotSay("Casting Circle of the Maiden...");
						Gater->CastSpell(15931, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "maiden")) && (BotLevel < 44)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
				        if ((Special) && (canGate == 2 )){
					    if (BotLevel >= 66){
						      Gater->BotSay("Most Lesser Moonstone and Moonstone gates are trivial for us, we can't gate there anymore. We still have [Nexus] and [PoK] gates available. We need to see the Bot Spell Scriber for my Greater Moonstone of Circles quest, which will grant us a few more non-trivial gates. ");
						      return;
					      }
					    else if(BotLevel <= 49) {
						      Gater->BotSay("I have Lesser Moonstone and Moonstone quests complete, which allows gates to [gunthak], [dulak], [karana], [commons], [tox], [butcher], [lava], [ro], [feerrott], [steamfont], [misty], [wakening], [iceclad], [divide], [cobalt], [combines], [surefall], [grimling], [twilight], [dawnshroud], [nexus], [pok], [stonebrunt], [emerald], [maiden] and [skyfire].");
						      return;
					      }
					    else {
						      Gater->BotSay("I have Lesser Moonstone and Moonstone quests complete, which allows gates to [gunthak], [dulak], [karana], [commons], [tox], [butcher], [lava], [ro], [feerrott], [steamfont], [misty], [wakening], [iceclad], [divide], [cobalt], [combines], [surefall], [grimling], [twilight], [dawnshroud], [nexus], [pok], [stonebrunt], [emerald], [maiden] and [skyfire]. We need to see the Bot Spell Scriber for my Greater Moonstone of Circles quest.");
						      return;
					      }
					}
					if ((!strcasecmp(sep->arg[2], "bloodfields")) && (BotLevel >= 55)) { 
						Gater->BotSay("Casting Circle of Bloodfields...");
						Gater->CastSpell(6184, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "bloodfields")) && (BotLevel < 55)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "wos")) && (BotLevel >= 64)) { 
						Gater->BotSay("Casting Circle of Slaughter...");
						Gater->CastSpell(6179, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "wos")) && (BotLevel < 64)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					 else if (BotLevel >= 66){
						 Gater->BotSay("Most Lesser Moonstone and Moonstone gates are trivial for us, we can't gate there anymore. We still have [Nexus], [PoK], and Greater Moonstone which are [bloodfields] and [wos].");
						 return;
					}
					else if (classicStat > 0){
						Gater->BotSay("With the proper level I can [gate] to [karana], [commons], [tox], [butcher], [lava], [ro], [feerrott], [steamfont], [misty], [surefall], [stonebrunt], or [skyfire].");
						return;
					}
					else {
						Gater->BotSay("With the proper level I can [gate] to [gunthak], [dulak], [karana], [commons], [tox], [butcher], [lava], [ro], [feerrott], [steamfont], [misty], [wakening], [iceclad], [divide], [cobalt], [combines], [surefall], [grimling], [twilight], [dawnshroud], [nexus], [pok], [stonebrunt], [bloodfields], [emerald], [skyfire], [maiden] or [wos].");
						return;
					}
					break;

				case WIZARD:
				      Gater->InterruptSpell();
					if ((Special) && (canPort == 0)){
					    if (BotLevel >= 66){
					      Gater->BotSay("Most Lesser Moonstone and Moonstone gates are trivial for us, we can't gate there anymore. We stll have [Nexus] and [PoK] gates if we complete the Bot Spell Scriber's request.");
					      return;
					    }
					    else if(BotLevel >= 25){
						  Gater->BotSay("We haven't completed the Bot Spell Scriber's request yet.");
						  return;
					    }
					    else{
						  Gater->BotSay("I have to be at least level 25 for my first portal spells, and you need to talk to the Bot Spell Scriber.");
						  return;
					    }
					}
					if (Gater-> IsMoving()){
					      Gater->BotSay("I can't be moving for this!");
					      return;					  					  
					}
					if ((!strcasecmp(sep->arg[2], "tox")) && (BotLevel >= 25) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Toxxula Portal...");
						Gater->CastSpell(561, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "tox")) && (BotLevel < 25)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "pok")) && (BotLevel >= 27)) {
						Gater->BotSay("Casting Plane of Knowledge Portal...");
						Gater->CastSpell(3180, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "wos")) && (BotLevel >= 27)) {
						Gater->BotSay("Casting Wall of Slaughter Portal...");
						Gater->CastSpell(6178, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "fay")) && (BotLevel >= 27) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Fay Portal...");
						Gater->CastSpell(563, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "nk")) && (BotLevel >= 27) && (BotLevel <= 65)) {
						Gater->BotSay("Casting North Karana Portal...");
						Gater->CastSpell(562, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "wk")) && (BotLevel >= 27) && (BotLevel <= 65)) {
						Gater->BotSay("Casting West Karana Portal...");
						Gater->CastSpell(568, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "stonebrunt")) && (BotLevel >= 27) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Stonebrunt Portal...");
						Gater->CastSpell(3793, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "twilight")) && (BotLevel >= 27) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Twilight Portal...");
						Gater->CastSpell(2425, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "dawnshroud")) && (BotLevel >= 27) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Dawnshroud Portal...");
						Gater->CastSpell(2430, c->GetID(), 1, -1, -1);
						return;
					}
					else if (((!strcasecmp(sep->arg[2], "twilight")) || (!strcasecmp(sep->arg[2], "pok")) ||
						  (!strcasecmp(sep->arg[2], "wos")) || (!strcasecmp(sep->arg[2], "fay")) || 
						  (!strcasecmp(sep->arg[2], "nk")) || (!strcasecmp(sep->arg[2], "wk")) ||  
						  (!strcasecmp(sep->arg[2], "stonebrunt")) || (!strcasecmp(sep->arg[2], "dawnshroud"))) && (BotLevel < 27)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "nexus")) && (BotLevel >= 29)) {
						Gater->BotSay("Casting Nexus Portal...");
						Gater->CastSpell(2944, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "grimling")) && (BotLevel >= 29) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Grimling Forest Portal...");
						Gater->CastSpell(2420, c->GetID(), 1, -1, -1);
						return;
					}
					else if (((!strcasecmp(sep->arg[2], "nexus")) || (!strcasecmp(sep->arg[2], "grimling"))) && (BotLevel < 29)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "nek")) && (BotLevel >= 32) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Nektulos Portal...");
						Gater->CastSpell(564, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "nek")) && (BotLevel < 32)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
				        if ((Special) && (canPort == 1 )){
					    if (BotLevel >= 66){
						      Gater->BotSay("Most Lesser Moonstone and Moonstone gates are trivial for us, we can't gate there anymore. We still have [Nexus] and [PoK] gates available. We need to see the Bot Spell Scriber for my Moonstone of Portals quest.");
						      return;
					      }
					    else if(BotLevel <= 32){
						      Gater->BotSay("I have Lesser Moonstone quest complete, which allows gates to [tox], [pok], [wos], [fay], [nk], [wk], [stonebrunt], [dawnshroud], [grimling], [nexus],and [nek]");
						      return;
					      }
					    else if(BotLevel > 32){
						      Gater->BotSay("I have Lesser Moonstone quest complete, which allows gates to [tox], [pok], [wos], [fay], [nk], [wk], [stonebrunt], [dawnshroud], [grimling], [nexus],and [nek]. We need to see the Bot Spell Scriber for my Moonstone of Portals quest.");
						      return;
					      }
					}
					if ((!strcasecmp(sep->arg[2], "iceclad")) && (BotLevel >= 33) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Iceclad Ocean Portal...");
						Gater->CastSpell(1418, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "iceclad")) && (BotLevel < 33)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					if ((!strcasecmp(sep->arg[2], "twilight")) && (BotLevel >= 33) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Twilight Portal...");
						Gater->CastSpell(2425, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "twilight")) && (BotLevel < 33)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "combines")) && (BotLevel >= 34) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Combines Portal...");
						Gater->CastSpell(1516, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "combines")) && (BotLevel < 34)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "commons")) && (BotLevel >= 35) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Common Portal...");
						Gater->CastSpell(566, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "commons")) && (BotLevel < 35)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "divide")) && (BotLevel >= 36) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Great Divide Portal...");
						Gater->CastSpell(1423, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "skyfire")) && (BotLevel >= 36) && (BotLevel <= 65)) {
						Gater->BotSay("Porting to Skyfire...");
						Gater->CastSpell(1738, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "divide") || (!strcasecmp(sep->arg[2], "skyfire"))) && (BotLevel < 36)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "ro")) && (BotLevel >= 37) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Ro Portal...");
						Gater->CastSpell(567, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "emerald")) && (BotLevel >= 37) && (BotLevel <= 65)) {
						Gater->BotSay("Porting to Emerald Jungle...");
						Gater->CastSpell(1739, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "ro") || (!strcasecmp(sep->arg[2], "emerald"))) && (BotLevel < 37)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "hateplane")) && (BotLevel >= 39) && (BotLevel <= 65)) {
						Gater->BotSay("Porting to Hate Plane...");
						Gater->CastSpell(666, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "airplane")) && (BotLevel >= 39) && (BotLevel <= 65)) {
						Gater->BotSay("Porting to airplane...");
						Gater->CastSpell(674, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "hateplane") || (!strcasecmp(sep->arg[2], "airplane"))) && (BotLevel < 39)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "wakening")) && (BotLevel >= 43) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Wakening Lands Portal...");
						Gater->CastSpell(1399, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "cobalt")) && (BotLevel >= 43) && (BotLevel <= 65)) {
						Gater->BotSay("Casting Cobalt Scar Portal...");
						Gater->CastSpell(1425, c->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "wakening") || (!strcasecmp(sep->arg[2], "cobalt"))) && (BotLevel < 43)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
				        if ((Special) && (canPort == 2 )) {
					    //const int canPort = (database.BotPortalLookup(c->CharacterID()));
					    if (BotLevel >= 66){
						      Gater->BotSay("Most Lesser Moonstone and Moonstone gates are trivial for us, we can't gate there anymore. We still have [Nexus] and [PoK] gates available. We need to see the Bot Spell Scriber for my Greater Moonstone of Portals quest, which will grant us a few more non-trivial gates.");
						      return;
					      }
					    else if (BotLevel <= 49) {
						      Gater->BotSay("I have Lesser Moonstone and Moonstone quests complete, which allows gates to [iceclad], [commons], [combines], [divide], [skyfire], [twilight], [ro], [emerald], [hateplane], [airplane], [wakening], [cobalt], [tox], [pok], [wos], [fay], [nk], [wk], [stonebrunt], [dawnshroud], [grimling], [nexus],and [nek].");
						      return;
					      }
					    else {
						      Gater->BotSay("I have Lesser Moonstone and Moonstone quests complete, which allows gates to [iceclad], [commons], [combines], [divide], [skyfire], [twilight], [ro], [emerald], [hateplane], [airplane], [wakening], [cobalt], [tox], [pok], [wos], [fay], [nk], [wk], [stonebrunt], [dawnshroud], [grimling], [nexus],and [nek]. We need to see the Bot Spell Scriber for my Greater Moonstone of Portals quest.");
						      return;
					      }
					}
					if ((!strcasecmp(sep->arg[2], "bloodfields")) && (BotLevel >= 55)) {
						Gater->BotSay("Casting Bloodfields Portal...");
						Gater->CastSpell(6183, c->GetID(), 1, -1, -1);
						      return;
					}
					else if ((!strcasecmp(sep->arg[2], "bloodfields")) && (BotLevel < 55)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "wos")) && (BotLevel >= 64)) {
						Gater->BotSay("Casting Slaughter Portal...");
						Gater->CastSpell(6183, c->GetID(), 1, -1, -1);
						      return;
					}
					else if ((!strcasecmp(sep->arg[2], "wos")) && (BotLevel < 64)){
						Gater->BotSay("I don't have the needed level yet", sep->arg[2]);
						return;
					}
					else if (BotLevel >= 66){
						 Gater->BotSay("Most Lesser Moonstone and Moonstone gates are trivial for us, we can't gate there anymore. We still have [Nexus], [PoK], and Greater Moonstone which are [bloodfields] and [wos].");
						 return;
					}
					else if (classicStat > 0){
						Gater->BotSay("With the proper level I can [gate] to [commons], [fay], [ro], [tox], [nk], [wk], [stonebrunt], [skyfire], [hateplane], or [airplane].");
						return;
					}
					else {
						Gater->BotSay("With the proper level I can [gate] to [commons], [fay], [ro], [tox], [nk], [wakening], [iceclad], [divide], [cobalt], [combines], [wk], [grimling], [twilight], [dawnshroud], [nexus], [pok], [stonebrunt], [bloodfields], [emerald], [skyfire], [hateplane], [airplane] or [wos].");
						return;
					}
					break;
				default:
					c->Message(15, "You must have a Druid or Wizard in your group.");
					break;
			}
		}
		return;
	}

//Endure Breath
	if((!strcasecmp(sep->arg[1], "endureb")) &&(!c->IsGrouped())){
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if ((!strcasecmp(sep->arg[1], "endureb")) && (c->IsGrouped())) {
		Mob *Endurer = NULL;
		int32 EndurerClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case DRUID:
							  Endurer = g->members[i];
							  EndurerClass = DRUID;
							break;
						case SHAMAN:
							if (EndurerClass != DRUID){
							  Endurer = g->members[i];
							  EndurerClass = SHAMAN;
						}
							break;
						case ENCHANTER:
							if(EndurerClass == 0){
							  Endurer = g->members[i];
							  EndurerClass = ENCHANTER;
						}
							break;
						case RANGER:
							if(EndurerClass == 0) {
							  Endurer = g->members[i];
							  EndurerClass = RANGER;
						}
							break;
						default:
							break;
					}
				}
			}
			switch(EndurerClass) {
				case DRUID:
				      Endurer->InterruptSpell();
					if (Endurer-> IsMoving()){
						Endurer->BotSay("I can't be moving for this!");
						break;					  					  
					}
					else if  (BotLevel <= 6) {
						Endurer->BotSay("I'm not level 6 yet.");
						break;
					}
					else {
						Endurer->BotSay("Casting Enduring Breath...");
						Endurer->CastSpell(86, c->GetID(), 1, -1, -1);
						break;
					}
					break;
				case SHAMAN:
				      Endurer->InterruptSpell();
					if (Endurer-> IsMoving()){
						Endurer->BotSay("I can't be moving for this!");
						break;					  					  
					}
					if (BotLevel >= 12) { 
						Endurer->BotSay("Casting Enduring Breath...");
						Endurer->CastSpell(86, c->GetID(), 1, -1, -1);
						break;
					}
					else if (BotLevel <= 12) {
						Endurer->BotSay("I'm not level 12 yet.");
					}
					break;
				case RANGER:
				      Endurer->InterruptSpell();
					if (Endurer-> IsMoving()){
						Endurer->BotSay("I can't be moving for this!");
						break;					  					  
					}
					if (BotLevel >= 20){
						Endurer->BotSay("Casting Enduring Breath...");
						Endurer->CastSpell(86, c->GetID(), 1, -1, -1);
						break;
					}
					else if (BotLevel <= 20) {
						Endurer->BotSay("I'm not level 20 yet.");
					}
					break;
				case ENCHANTER:
				      Endurer->InterruptSpell();
					if (Endurer-> IsMoving()){
						Endurer->BotSay("I can't be moving for this!");
						break;					  					  
					}
					if(BotLevel >= 12) {
						Endurer->BotSay("Casting Enduring Breath...");
						Endurer->CastSpell(86, c->GetID(), 1, -1, -1);
						break;
					}
					else if (BotLevel <= 12) {
						Endurer->BotSay("I'm not level 12 yet.");
					}
					break;
				default:
					c->Message(15, "You must have a Druid, Shaman, Ranger, or Enchanter in your group.");
					break;
			}
		}
	return;
	}

//Invisible
	if((!strcasecmp(sep->arg[1], "invis")) &&(!c->IsGrouped())){
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if ((!strcasecmp(sep->arg[1], "invis")) && (t == NULL)) {
		c->Message(15, "Target a player or bot in your group.");
		return;
	}
	if ((!strcasecmp(sep->arg[1], "invis")) && (c->IsGrouped())) {
		Mob *t = c->GetTarget();
		Group* mygroup = c->GetGroup();
		//Angelox: This renders the spell group-only
		if((t == NULL) || (t->IsNPC()) && (!t->IsBot()) || (!t->IsGrouped()) ||
			((t->IsBot()) && (database.GetBotOwner(t->GetNPCTypeID()) != c->CharacterID())) || 
			((mygroup) && (!mygroup->IsGroupMember(t)))) {
			c->Message(15, "Target a player or bot in your group.");
			return;
		}
	  /* if((t->IsBot()) && (database.GetBotOwner(t->GetNPCTypeID()) != c->CharacterID()))){
	     c->Message(15,"Choose a target in your group.");
	     return;
		}
	  if((mygroup) && (!mygroup->IsGroupMember(t))){
	     c->Message(15,"Choose a player in your group.");
	     return;
		} */
		Mob *Inviser = NULL;   //invis live
		Mob *UInviser = NULL;  //invis undead
		int32 InviserClass = 0;
		int32 UInviserClass = 0;
		Group *g = c->GetGroup();
		int resul1 = (strcasecmp(sep->arg[2], ("live")));
		int resul2 = (strcasecmp(sep->arg[2], ("undead")));
		int resul3 = (strcasecmp(sep->arg[2], ("see")));
		if ((g) && (t != NULL)) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case NECROMANCER:
							 UInviser = g->members[i];
							 UInviserClass = NECROMANCER;
							break;
						case ENCHANTER:
							 Inviser = g->members[i];
							 InviserClass = ENCHANTER;
						       if(UInviserClass != NECROMANCER ){
							 UInviser = g->members[i];
							 UInviserClass = ENCHANTER;
						}
							break;
						case MAGICIAN:
							if (InviserClass != ENCHANTER){
							  Inviser = g->members[i];
							  InviserClass = MAGICIAN;
						}
							break;
						case WIZARD:
							if((InviserClass) != (ENCHANTER)){
							  if((InviserClass) != (MAGICIAN)){
							    Inviser = g->members[i];
							    InviserClass = WIZARD;
							  }
						}
							 if (UInviserClass == 0){
							  UInviser = g->members[i];
							  UInviserClass = WIZARD;
						}
							break;
						case DRUID:
							if((InviserClass) != (ENCHANTER)){
							  if((InviserClass) != (MAGICIAN)){
							   if((InviserClass) != (WIZARD)){
							     Inviser = g->members[i];
							     InviserClass = DRUID;
							   }
							  }
						}
							break;
						case SHAMAN:
							if((InviserClass) != (ENCHANTER)){
							  if((InviserClass) != (MAGICIAN)){
							   if((InviserClass) != (WIZARD)){
							    if((InviserClass) != (DRUID)){     
							     Inviser = g->members[i];
							     InviserClass = SHAMAN;
							   }
							  }
						         }
						}
							break;
						case BEASTLORD:
							if((InviserClass) != (ENCHANTER)){
							  if((InviserClass) != (MAGICIAN)){
							   if((InviserClass) != (WIZARD)){
							    if((InviserClass) != (DRUID)){
							     if((InviserClass) != (SHAMAN)){	      
							      Inviser = g->members[i];
							      InviserClass = BEASTLORD;
							     }
							    }
						           }
						          }
						}
							break;
						case SHADOWKNIGHT:
							if((UInviserClass) != (ENCHANTER)){
							  if((UInviserClass) != (NECROMANCER)){
							     UInviser = g->members[i];
							     UInviserClass = SHADOWKNIGHT;
							   }
						}
						case CLERIC:
							if((UInviserClass) != (ENCHANTER)){
							  if((UInviserClass) != (NECROMANCER)){
							   if((UInviserClass) != (SHADOWKNIGHT)){
							     UInviser = g->members[i];
							     UInviserClass = CLERIC;
							   }
							  }
						}
						case PALADIN:
							if(UInviserClass == 0){
							       UInviser = g->members[i];
							       UInviserClass = CLERIC;
						}
							break;
						case RANGER:
							if(InviserClass == 0){
							       Inviser = g->members[i];
							       InviserClass = RANGER;
						}
							break;
						default:
							break;
					}
				}
			}
			switch(InviserClass) {
				case ENCHANTER:
				      Inviser->InterruptSpell();
					if (Inviser-> IsMoving()){
						Inviser->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if  ((Inviser->GetLevel() <= 3) && (!strcasecmp(sep->arg[2], "live"))) {
						Inviser->BotSay("I'm not level 4 yet.");
						return;
					}
					else if ((!t->IsInvisible(c))&& (!t->invisible_undead) && (Inviser->GetLevel() >= 4) && (!strcasecmp(sep->arg[2], "live"))) { 
						Inviser->BotSay("Casting invisibilty...");
						Inviser->CastToNPC()->CastSpell(42, t->GetID(), 1, -1, -1);
						return;
					}
					else if  ((Inviser->GetLevel() <= 5) && (!strcasecmp(sep->arg[2], "see"))) {
						Inviser->BotSay("I'm not level 6 yet.");
						return;
					}
					else if ((Inviser->GetLevel() >= 6) && (!strcasecmp(sep->arg[2], "see"))) { 
						Inviser->BotSay("Casting see invisible...");
						Inviser->CastToNPC()->CastSpell(80, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((t->IsInvisible(c)) || (t->invisible_undead)) { 
						c->Message(15, "Target already invis-buffed.");
						return;
					}
					else if ((InviserClass == ENCHANTER) && (resul2 !=0)) {
						Inviser->BotSay("Do you want [invis live] or [invis see] ?", c->GetName());
					}
						break;
				case MAGICIAN:
				      Inviser->InterruptSpell();
					if (Inviser-> IsMoving()){
						Inviser->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if  (!strcasecmp(sep->arg[2], "undead") && (UInviserClass == 0)) {
						Inviser->BotSay("I don't have that spell.");
						return;
					}
					else if  ((Inviser->GetLevel() <= 7) && (!strcasecmp(sep->arg[2], "live"))) {
						Inviser->BotSay("I'm not level 8 yet.");
						return;
					}
					else if ((!t->IsInvisible(c))&& (!t->invisible_undead) && (Inviser->GetLevel() >= 8) && (!strcasecmp(sep->arg[2], "live"))) { 
						Inviser->BotSay("Casting invisibilty...");
						Inviser->CastToNPC()->CastSpell(42, t->GetID(), 1, -1, -1);
						return;
					}
					else if  ((Inviser->GetLevel() <= 15) && (!strcasecmp(sep->arg[2], "see"))) {
						Inviser->BotSay("I'm not level 16 yet.");
						return;
					}
					else if ((Inviser->GetLevel() >= 16) && (!strcasecmp(sep->arg[2], "see"))) { 
						Inviser->BotSay("Casting see invisible...");
						Inviser->CastToNPC()->CastSpell(80, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((t->IsInvisible(c)) || (t->invisible_undead)) { 
						c->Message(15, "Target already invis-buffed.");
						return;
					}
					else if ((InviserClass == MAGICIAN) && (resul2 !=0)) {
						Inviser->BotSay("Do you want [invis live] or [invis see]?", c->GetName());
					}
						break;
				case WIZARD:
				      Inviser->InterruptSpell();
					if (Inviser-> IsMoving()){
						Inviser->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if  ((Inviser->GetLevel() <= 15) && (!strcasecmp(sep->arg[2], "live"))) {
						Inviser->BotSay("I'm not level 16 yet.");
						return;
					}
					else if ((!t->IsInvisible(c))&& (!t->invisible_undead) && (t->GetLevel() >= 16) && (!strcasecmp(sep->arg[2], "live"))) { 
						Inviser->BotSay("Casting invisibilty...");
						Inviser->CastToNPC()->CastSpell(42, t->GetID(), 1, -1, -1);
						return;
					}
					else if  ((Inviser->GetLevel() <= 3) && (!strcasecmp(sep->arg[2], "see"))) {
						Inviser->BotSay("I'm not level 4 yet.");
						return;
					}
					else if ((Inviser->GetLevel() >= 4) && (!strcasecmp(sep->arg[2], "see"))) { 
						Inviser->BotSay("Casting see invisible...");
						Inviser->CastToNPC()->CastSpell(80, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((t->IsInvisible(c)) || (t->invisible_undead)) { 
						c->Message(15, "Target already invis-buffed.");
						return;
					}
					else  if ((InviserClass == WIZARD) && (resul2 !=0))  {
						Inviser->BotSay("Do you want [invis live] or [invis see] ?", c->GetName());
					}
						break;
				case DRUID:
				      Inviser->InterruptSpell();
					if (Inviser-> IsMoving()){
						Inviser->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if  ((!strcasecmp(sep->arg[2], "undead")) && (UInviserClass == 0) && (UInviserClass == 0)) {
						Inviser->BotSay("I don't have that spell...");
						return;
					}
					else if  ((Inviser->GetLevel() <= 3) && (!strcasecmp(sep->arg[2], "live"))) {
						Inviser->BotSay("I'm not level 4 yet.");
						return;
					}
					else if ((!t->IsInvisible(c))&& (!t->invisible_undead) && (Inviser->GetLevel() >= 18) && (!strcasecmp(sep->arg[2], "live"))) { 
						Inviser->BotSay("Casting Superior Camouflage...");
						Inviser->CastToNPC()->CastSpell(34, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((!t->IsInvisible(c))&& (!t->invisible_undead) && (Inviser->GetLevel() >= 4) && (!strcasecmp(sep->arg[2], "live")) && (zone->CanCastOutdoor())) { 
						Inviser->BotSay("Casting Camouflage...");
						Inviser->CastToNPC()->CastSpell(247, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((Inviser->GetLevel() >= 4) && (Inviser->GetLevel() <= 17) && (!strcasecmp(sep->arg[2], "live")) && (!zone->CanCastOutdoor())) { 
						Inviser->BotSay("I can't cast this spell indoors...");
						return;
					}
					else if  ((Inviser->GetLevel() <= 12) && (!strcasecmp(sep->arg[2], "see"))) {
						Inviser->BotSay("I'm not level 13 yet.");
						return;
					}
					else if ((Inviser->GetLevel() >= 13) && (!strcasecmp(sep->arg[2], "see"))) { 
						Inviser->BotSay("Casting see invisible...");
						Inviser->CastToNPC()->CastSpell(80, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((t->IsInvisible(c)) || (t->invisible_undead)) { 
						c->Message(15, "Target already invis-buffed.");
						return;
					}
					else if ((InviserClass == DRUID) && (resul2 !=0)){
						Inviser->BotSay("Do you want [invis live] or [invis see] ?", c->GetName());
					}
						break;
				case SHAMAN:
				      Inviser->InterruptSpell();
					if (Inviser-> IsMoving()){
						Inviser->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if  (!strcasecmp(sep->arg[2], "undead") && (UInviserClass == 0)) {
						Inviser->BotSay("I don't have that spell.");
						return;
					}
					else if  ((Inviser->GetLevel() <= 26) && (!strcasecmp(sep->arg[2], "live"))) {
						Inviser->BotSay("I'm not level 27 yet.");
						return;
					}
					else if ((!t->IsInvisible(c))&& (!t->invisible_undead) && (Inviser->GetLevel() >= 27) && (!strcasecmp(sep->arg[2], "live"))) { 
						Inviser->BotSay("Casting invisibilty...");
						Inviser->CastToNPC()->CastSpell(42, t->GetID(), 1, -1, -1);
						return;
					}
					else if  ((Inviser->GetLevel() <= 6) && (!strcasecmp(sep->arg[2], "see"))) {
						Inviser->BotSay("I'm not level 7 yet.");
						return;
					}
					else if ((Inviser->GetLevel() >= 7) && (!strcasecmp(sep->arg[2], "see"))) { 
						Inviser->BotSay("Casting Spirit Sight...");
						Inviser->CastToNPC()->CastSpell(79, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((t->IsInvisible(c)) || (t->invisible_undead)) { 
						c->Message(15, "Target already invis-buffed.");
						return;
					}
					else if ((InviserClass == SHAMAN) && (resul2 !=0))  {
						Inviser->BotSay("Do you want [invis live] or [invis see] ?", c->GetName());
					}
						break;
				case BEASTLORD:
				      Inviser->InterruptSpell();
					if (Inviser-> IsMoving()){
						Inviser->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if  (!strcasecmp(sep->arg[2], "undead") && (UInviserClass == 0)) {
						Inviser->BotSay("I don't have that spell.");
						return;
					}
					else if  ((Inviser->GetLevel() <= 42) && (!strcasecmp(sep->arg[2], "live"))) {
						Inviser->BotSay("I'm not level 43 yet.");
						return;
					}
					else if ((!t->IsInvisible(c))&& (!t->invisible_undead) && (Inviser->GetLevel() >= 43) && (!strcasecmp(sep->arg[2], "live"))) { 
						Inviser->BotSay("Casting invisibilty...");
						Inviser->CastToNPC()->CastSpell(42, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((t->IsInvisible(c)) || (t->invisible_undead)) { 
						c->Message(15, "Target alreadyinvis-buffed.");
						return;
					}
					else if ((InviserClass ==BEASTLORD) && (resul2 !=0))  {
						Inviser->BotSay("Do you want [invis live] or [invis see] ?", c->GetName());
					}
						break;
				case RANGER:
				      Inviser->InterruptSpell();
					if (Inviser-> IsMoving()){
						Inviser->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if  ((!strcasecmp(sep->arg[2], "undead")) && (UInviserClass == 0) && (UInviserClass == 0)) {
						Inviser->BotSay("I don't have that spell...");
						return;
					}
					else if  ((Inviser->GetLevel() <= 13) && (!strcasecmp(sep->arg[2], "live"))) {
						Inviser->BotSay("I'm not level 14 yet.");
						return;
					}
					else if ((!t->IsInvisible(c))&& (!t->invisible_undead) && (Inviser->GetLevel() >= 47) && (!strcasecmp(sep->arg[2], "live"))) { 
						Inviser->BotSay("Casting Superior Camouflage...");
						Inviser->CastToNPC()->CastSpell(34, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((!t->IsInvisible(c))&& (!t->invisible_undead) && (Inviser->GetLevel() >= 14) && (!strcasecmp(sep->arg[2], "live")) && (zone->CanCastOutdoor())) { 
						Inviser->BotSay("Casting Camouflage...");
						Inviser->CastToNPC()->CastSpell(247, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((Inviser->GetLevel() >= 14) && (Inviser->GetLevel() <= 47) && (!strcasecmp(sep->arg[2], "live")) && (!zone->CanCastOutdoor())) { 
						Inviser->BotSay("I can't cast this spell indoors...");
						return;
					}
					else if  ((Inviser->GetLevel() <= 32) && (!strcasecmp(sep->arg[2], "see"))) {
						Inviser->BotSay("I'm not level 32 yet.");
						return;
					}
					else if ((Inviser->GetLevel() >= 32) && (!strcasecmp(sep->arg[2], "see"))) { 
						Inviser->BotSay("Casting see invisible...");
						Inviser->CastToNPC()->CastSpell(80, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((t->IsInvisible(c)) || (t->invisible_undead)) { 
						c->Message(15, "Target already invis-buffed.");
						return;
					}
					else if ((InviserClass == RANGER) && (resul2 !=0)){
						Inviser->BotSay("Do you want [invis live] or [invis see] ?", c->GetName());
					}
						break;
				    }
			switch(UInviserClass) {
				case ENCHANTER:
				      UInviser->InterruptSpell();
					if (UInviser-> IsMoving()){
						UInviser->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if  ((UInviser->GetLevel() <= 13) && (!strcasecmp(sep->arg[2], "undead"))) {
						UInviser->BotSay("I'm not level 14 yet.");
						return;
					}
					else if ((t->IsInvisible(c)) || (t->invisible_undead)) { 
						c->Message(15, "Target already invis-buffed.");
						return;
					}
					else if ((!t->IsInvisible(c)) && (!t->invisible_undead) && (UInviser->GetLevel() >= 14) && (!strcasecmp(sep->arg[2], "undead"))) {
						UInviser->BotSay("Casting invis undead...");
						UInviser->CastToNPC()->CastSpell(235, t->GetID(), 1, -1, -1);
					}
					else if (UInviserClass == ENCHANTER)  {
						UInviser->BotSay("Do you want [invis undead]?", c->GetName());
					}
						break;
				case WIZARD:
				      UInviser->InterruptSpell();
					if (UInviser-> IsMoving()){
						UInviser->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if  ((UInviser->GetLevel() <= 38) && (!strcasecmp(sep->arg[2], "undead"))) {
						UInviser->BotSay("I'm not level 39 yet.");
						return;
					}
					else if ((t->IsInvisible(c)) || (t->invisible_undead)) { 
						c->Message(15, "Target already invis-buffed.");
						return;
					}
					else if ((!t->IsInvisible(c))&& (!t->invisible_undead) && (UInviser->GetLevel() >= 39) && (!strcasecmp(sep->arg[2], "undead"))) {
						UInviser->BotSay("Casting invis undead...");
						UInviser->CastSpell(235, c->GetID(), 1, -1, -1);
					}
					else if (UInviserClass == WIZARD)  {
						UInviser->BotSay("Do you want [invis undead]?", c->GetName());
					}
						break;
				case NECROMANCER:
				      UInviser->InterruptSpell();
					if (UInviser-> IsMoving()){
						UInviser->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if ((t->IsInvisible(c)) || (t->invisible_undead)) { 
						c->Message(15, "Target already invis-buffed.");
						return;
					}
					else if ((!t->IsInvisible(c))&& (!t->invisible_undead) && (!strcasecmp(sep->arg[2], "undead"))) {
						UInviser->BotSay("Casting invis undead...");
						UInviser->CastToNPC()->CastSpell(235, t->GetID(), 1, -1, -1);
						return;
					}
					else if ((!strcasecmp(sep->arg[2], "see")) && (InviserClass == 0)) { 
						UInviser->BotSay("I don't have that spell...");
					}
					else if ((!strcasecmp(sep->arg[2], "live")) && (InviserClass == 0)) { 
						UInviser->BotSay("I don't have that spell...");
					}
					else if (((t->IsInvisible(c)) && (InviserClass == 0))|| ((t->invisible_undead) && (InviserClass == 0))) { 
						c->Message(15, "Target already invis-buffed.");
					}
					/*else if ((InviserClass == ENCHANTER) || (InviserClass == DRUID) ||
						(InviserClass == WIZARD) || (InviserClass == MAGICIAN) ||
						(InviserClass == SHAMAN)){
						Inviser->BotSay("We have [invis undead], [invis live] or [invis see]", c->GetName());
					}*/
					else if (UInviserClass == NECROMANCER) {
						UInviser->BotSay("Do you want [invis undead]?", c->GetName());
					}
						break;
				case SHADOWKNIGHT:
				      UInviser->InterruptSpell();
					if  ((UInviser->GetLevel() <= 3) && (!strcasecmp(sep->arg[2], "undead"))) {
						UInviser->BotSay("I'm not level 4 yet.");
						return;
					}
					else if (UInviser-> IsMoving()){
						UInviser->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if ((!strcasecmp(sep->arg[2], "see")) && (InviserClass == 0)) { 
						UInviser->BotSay("I don't have that spell...");
					}
					else if ((!strcasecmp(sep->arg[2], "live")) && (InviserClass == 0)) { 
						UInviser->BotSay("I don't have that spell...");
					}
					else if ((t->IsInvisible(c)) || (t->invisible_undead)) { 
						c->Message(15, "Target already invis-buffed.");
						return;
					}
					else if ((!t->IsInvisible(c))&& (!t->invisible_undead) && (UInviser->GetLevel() >= 39) && (!strcasecmp(sep->arg[2], "undead"))) {
						UInviser->BotSay("Casting invis undead...");
						UInviser->CastSpell(235, c->GetID(), 1, -1, -1);
					}
					else if (UInviserClass == SHADOWKNIGHT)  {
						UInviser->BotSay("Do you want [invis undead]?", c->GetName());
					}
						break;
				case CLERIC:
				      UInviser->InterruptSpell();
					if  ((UInviser->GetLevel() <= 10) && (!strcasecmp(sep->arg[2], "undead"))) {
						UInviser->BotSay("I'm not level 11 yet.");
						return;
					}
					else if (UInviser-> IsMoving()){
						UInviser->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if ((!strcasecmp(sep->arg[2], "see")) && (InviserClass == 0)) { 
						UInviser->BotSay("I don't have that spell...");
					}
					else if ((!strcasecmp(sep->arg[2], "live")) && (InviserClass == 0)) { 
						UInviser->BotSay("I don't have that spell...");
					}
					else if ((t->IsInvisible(c)) || (t->invisible_undead)) { 
						c->Message(15, "Target already invis-buffed.");
						return;
					}
					else if ((!t->IsInvisible(c))&& (!t->invisible_undead) && (UInviser->GetLevel() >= 39) && (!strcasecmp(sep->arg[2], "undead"))) {
						UInviser->BotSay("Casting invis undead...");
						UInviser->CastSpell(235, c->GetID(), 1, -1, -1);
					}
					else if (UInviserClass == CLERIC)  {
						UInviser->BotSay("Do you want [invis undead]?", c->GetName());
					}
						break;
				case PALADIN:
				      UInviser->InterruptSpell();
					if  ((UInviser->GetLevel() <= 16) && (!strcasecmp(sep->arg[2], "undead"))) {
						UInviser->BotSay("I'm not level 17 yet.");
						return;
					}
					else if (UInviser-> IsMoving()){
						UInviser->BotSay("I can't be moving for this!");
						return;					  					  
					}
					else if ((!strcasecmp(sep->arg[2], "see")) && (InviserClass == 0)) { 
						UInviser->BotSay("I don't have that spell...");
					}
					else if ((t->IsInvisible(c)) || (t->invisible_undead)) { 
						c->Message(15, "Target already invis-buffed.");
						return;
					}
					else if ((!t->IsInvisible(c))&& (!t->invisible_undead) && (UInviser->GetLevel() >= 39) && (!strcasecmp(sep->arg[2], "undead"))) {
						UInviser->BotSay("Casting invis undead...");
						UInviser->CastSpell(235, c->GetID(), 1, -1, -1);
					}
					else if (UInviserClass == PALADIN)  {
						UInviser->BotSay("Do you want [invis undead]?", c->GetName());
					}
						break;
				default:
					break;
			}
		if ((resul1 !=0) && (resul2 !=0) && (resul3 !=0)) {
		  c->Message(15, "Usage: #bot invis [live] [undead] [see].");
		  c->Message(15, "Pending level and if qualified to cast this spell.");
		 }
		}
	return;
	}

//Set Commands
      if(!strcasecmp(sep->arg[1], "set")){
	 int32 charid = (c->CharacterID());
	 if (!c->IsGrouped()){
	    c->Message(15, "You need to group with a bot for this.");
	    return;
	  }
	Group *g = c->GetGroup();
	if(g) {
	    for(int i=0; i<MAX_GROUP_MEMBERS; i++){
	        Mob *botMember = NULL; 
	        botMember = g->members[i];
		if(g->members[i] && g->members[i]->IsBot()) {
		  if(!strcasecmp(sep->arg[2], "primary")){
		    if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot()) {
		      c->Message(15, "You must target a bot first.");
		      return;
		     }
		    c->Message(15, "Bots range item is temporarily set for primary slot install.");
		    database.UpdateBotLock1(2,charid);
		    target->SetBotPrimary(true);
		  }
		else if(!strcasecmp(sep->arg[2], "snare")){
		  if(!strcasecmp(sep->arg[3], "on")){
		    botMember->SetBotSnare(true);
		    //c->Message(15, "Bots will now use snare-types spells.");
		    database.UpdateBotSnare(1,charid);
		  }
		  else if(!strcasecmp(sep->arg[3], "off")){
		    //c->Message(15, "Bots will NOT use snare-types spells.");
		    database.UpdateBotSnare(2,charid);
		    botMember->SetBotSnare(false);
		  }
		 else if(sep->arg[3][0] == '\0'){      
		    c->Message(15, "Usage: #bot set [snare] [on] or [off].");
		    return;
		 }
		}
		else if(!strcasecmp(sep->arg[2], "root")){
		  if(!strcasecmp(sep->arg[3], "on")){
		    botMember->SetBotRoot(true);
		    //c->Message(15, "Bots will now use root-types spells.");
		    database.UpdateBotRoot(1,charid);
		  }
		  else if(!strcasecmp(sep->arg[3], "off")){
		    botMember->SetBotRoot(false);
		    //c->Message(15, "Bots will NOT use root-types spells.");
		    database.UpdateBotRoot(2,charid);
		  }
		  else if(sep->arg[3][0] == '\0'){      
		    c->Message(15, "Usage: #bot set [root] [on] or [off].");
		    return;
		  }
		}
		else if(!strcasecmp(sep->arg[2], "chat")){
		  if(c->IsBotRaiding()){
		    c->Message(15, "Bot chat disabled during raid sessions.");
		    return;
		  }
		  if(!strcasecmp(sep->arg[3], "on")){
		    botMember->SetBotChat(true);
		    //c->Message(15, "Bots can talk now.");
		    database.UpdateBotSpam(1,charid);
		  }
		  else if(!strcasecmp(sep->arg[3], "off")){
		    botMember->SetBotChat(false);
		    //c->Message(15, "Bots will remain silent.");
		    database.UpdateBotSpam(2,charid);
		    }
		  else if(sep->arg[3][0] == '\0'){      
		    c->Message(15, "Usage: #bot set [chat] [on] or [off].");
		    return;
		  }
		}
		else if(!strcasecmp(sep->arg[2], "taunt")){
		  if (!strcasecmp(sep->arg[3], "off")){
		    database.UpdateBotTaunt(0,charid);
		    botMember->SetBotTauntLevel(0);
		    //c->Message(15, "Taunting disabled.");
		  }
		  else if (!strcasecmp(sep->arg[3], "warrior")){
		    database.UpdateBotTaunt(1,charid);
		    botMember->SetBotTauntLevel(1);
		    //c->Message(15, "Warrior class set to taunt.");
		  }
		  else if (!strcasecmp(sep->arg[3], "paladin")){
		    database.UpdateBotTaunt(2,charid);
		    botMember->SetBotTauntLevel(2);
		    //c->Message(15, "Paladin class set to taunt.");
		  }
		  else if (!strcasecmp(sep->arg[3], "sk")){
		    database.UpdateBotTaunt(3,charid);
		    botMember->SetBotTauntLevel(3);
		   //c->Message(15, "Shadowknight class set to taunt.");
		  }
		  else if (!strcasecmp(sep->arg[3], "ranger")){
		    database.UpdateBotTaunt(4,charid);
		    botMember->SetBotTauntLevel(4);
		    //c->Message(15, "Ranger class set to taunt.");
		  }
		  else if (!strcasecmp(sep->arg[3], "bard")){
		    database.UpdateBotTaunt(5,charid);
		    botMember->SetBotTauntLevel(5);
		    //c->Message(15, "Bard class set to taunt.");
		  }
		  else if (!strcasecmp(sep->arg[3], "on")){
		    database.UpdateBotTaunt(6,charid);
		    botMember->SetBotTauntLevel(6);
		    //c->Message(15, "All taunt classes will taunt.");
		  }
		  else{
		    c->Message(15, "No taunt class available or improper usage.");
		    c->Message(15, "Usage: #bot taunt [on], [off], [warrior], [paladin], [sk], [ranger], [bard].");
		    return;
		  }
		  if (sep->arg[2][0] == '\0'){
		      c->Message(15, "Usage: #bot taunt [on], [off], [warrior], [paladin], [sk], [ranger], [bard].");
		      return;
		     }	
		}
		else {
		  c->Message(15, "Usage: #bot set [primary], [snare] [on] or [off], [root] [on] or [off], [chat] [on] or [off].");
		  c->Message(15, "[taunt] [on], [off], [warrior], [paladin], [sk], [ranger], [bard].");
		  return;
		}
		if (sep->arg[2][0] == '\0'){
		  c->Message(15, "Usage: #bot set [primary], [snare] [on] or [off], [root] [on] or [off], [chat] [on] or [off].");
		  c->Message(15, "[taunt] [on], [off], [warrior], [paladin], [sk], [ranger], [bard].");
		  return;
		}
	    }
	}
	c->Message(15, "Your bot setting has been changed.");
	return;
      }
    }

//Levitate
	if((!strcasecmp(sep->arg[1], "levitate")) &&(!c->IsGrouped())){
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if ((!strcasecmp(sep->arg[1], "levitate")) && (c->IsGrouped())) {
		if((c->GetTarget() == NULL) || (c->GetTarget()->IsNPC()) && (!c->GetTarget()->IsBot()))  {
			c->Message(15, "You must select a player or bot in the zone.");
			return;
		}
		Mob *t = c->GetTarget();
		Mob *Lever = NULL;
		int32 LeverClass = 0;
		Group *g = c->GetGroup();
		Mob *target = c->GetTarget();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case NECROMANCER:
							if (BotLevel >= 41){
							  Lever = g->members[i];
							  LeverClass = NECROMANCER;
						}
							break;
						case RANGER:
							if ((BotLevel >= 35) && (LeverClass != NECROMANCER)){
							  Lever = g->members[i];
							  LeverClass = RANGER;
						}
							break;
						case BEASTLORD:
							if ((BotLevel >= 32) && (LeverClass != NECROMANCER)){
							  Lever = g->members[i];
							  LeverClass = BEASTLORD;
						}
							break;
						case WIZARD:
							if ((BotLevel >= 22) && ((LeverClass != SHAMAN) || (LeverClass != NECROMANCER) ||
							   (LeverClass != DRUID) || (LeverClass != RANGER) ||
							   (LeverClass != BEASTLORD) || (LeverClass != ENCHANTER))){
							  Lever = g->members[i];
							  LeverClass = WIZARD;
						}
							break;
						case DRUID:
							if ((BotLevel >= 14) && ((LeverClass != SHAMAN) || (LeverClass != NECROMANCER) ||
							   (LeverClass != RANGER) || (LeverClass != BEASTLORD))){
							  Lever = g->members[i];
							  LeverClass = DRUID;
						}
							break;
						case ENCHANTER:
							if ((BotLevel >= 14) && ((LeverClass != SHAMAN) || (LeverClass != NECROMANCER) ||
							   (LeverClass != DRUID) || (LeverClass != RANGER) || (LeverClass != BEASTLORD))) {
							  Lever = g->members[i];
							  LeverClass = ENCHANTER;
						}
							break;
						case SHAMAN:
							if ((BotLevel >= 10) && ((LeverClass != NECROMANCER) || (LeverClass != RANGER) || (LeverClass != BEASTLORD))){
							  Lever = g->members[i];
							  LeverClass = SHAMAN;
						}
							break;
						default:
							break;
					}
				}
			}
			switch(LeverClass) {
				case NECROMANCER:
					if(zone->CanCastOutdoor()) {
						Lever->InterruptSpell();
						    if (Lever->GetLevel() >= 45) {
						      Lever->BotSay("Casting Dead Men Floating...");
						      Lever->CastSpell(1391, c->GetID(), 1, -1, -1);
						      return;
						}
						    if (Lever->GetLevel() >= 41){
						      Lever->BotSay("Casting Dead Man Floating...");
						      Lever->CastToNPC()->CastSpell(457, t->GetID(), 1, -1, -1);
						      return;
						}
						    else {
						      Lever->BotSay("I'm not level 41 yet.");
						      return;
						}
					}
					else if (!zone->CanCastOutdoor()) {
						Lever->BotSay("I can't cast this spell indoors", c->GetName());
					}
					break;
					
				case RANGER:
					if((zone->CanCastOutdoor()) && (Lever->GetLevel() >= 35)) {
						Lever->InterruptSpell();
						Lever->BotSay("Casting Levitate...");
						Lever->CastToNPC()->CastSpell(261, t->GetID(), 1, -1, -1);
					}
					else if (!zone->CanCastOutdoor()) {
						Lever->BotSay("I can't cast this spell indoors", c->GetName());
					}
					break;
					
				case BEASTLORD:
					if((zone->CanCastOutdoor()) && (Lever->GetLevel() >= 32)) {
						Lever->InterruptSpell();
						Lever->BotSay("Casting Levitate...");
						Lever->CastToNPC()->CastSpell(261, t->GetID(), 1, -1, -1);
					}
					else if (!zone->CanCastOutdoor()) {
						Lever->BotSay("I can't cast this spell indoors", c->GetName());
					}
					break;
					
				case WIZARD:
					if(zone->CanCastOutdoor()){
						Lever->InterruptSpell();
						Lever->BotSay("Casting Levitate...");
						Lever->CastToClient()->CastSpell(261, c->GetID(), 1, -1, -1);
					}
					else if (!zone->CanCastOutdoor()) {
						Lever->BotSay("I can't cast this spell indoors", c->GetName());
					}
					break;
					
				case ENCHANTER:
					if(zone->CanCastOutdoor()) {
						Lever->InterruptSpell();
						Lever->BotSay("Casting Levitate...");
						Lever->CastToNPC()->CastSpell(261, t->GetID(), 1, -1, -1);
					}
					else if (!zone->CanCastOutdoor()) {
						Lever->BotSay("I can't cast this spell indoors", c->GetName());
					}
					else if (Lever->GetLevel() <= 14) {
						Lever->BotSay("I'm not level 15 yet.");
					}
					break;

				case DRUID:
					if (zone->CanCastOutdoor()) {
						Lever->InterruptSpell();
						Lever->BotSay("Casting Levitate...");
						Lever->CastToNPC()->CastSpell(261, t->GetID(), 1, -1, -1);
						break;
					}
					else if (!zone->CanCastOutdoor()) {
						Lever->BotSay("I can't cast this spell indoors", c->GetName());
					}
					break;

				case SHAMAN:
					if ((zone->CanCastOutdoor()) && (Lever->GetLevel() >= 10)) {
						Lever->InterruptSpell(); 
						Lever->BotSay("Casting Levitate...");
						Lever->CastToNPC()->CastSpell(261, t->GetID(), 1, -1, -1);;
					}
					else if (!zone->CanCastOutdoor()) {
						Lever->BotSay("I can't cast this spell indoors", c->GetName());
					}
					break;

				default:
					c->Message(15, "You need one of the following: 41 Necromancer, 35 Ranger, 32 Beastlord, 22 Wizard, 14 Druid, 14 Enchanter, or 10 Shaman in your group.");
					break;
			}
		}
		return;
	}

//Resists
	if((!strcasecmp(sep->arg[1], "resist")) &&(!c->IsGrouped())){
		c->Message(15, "You need to group with a bot for this");
		return;
	}
	if ((!strcasecmp(sep->arg[1], "resist")) && (c->IsGrouped())) {
		Mob *Resister = NULL;
		int32 ResisterClass = 0;		
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case CLERIC:
							  Resister = g->members[i];
							  ResisterClass = CLERIC;
							break;
						case SHAMAN:
							if(ResisterClass != CLERIC){
							  Resister = g->members[i];
							  ResisterClass = SHAMAN;
						}
							break;
						case DRUID:
							if (ResisterClass == 0){
							  Resister = g->members[i];
							  ResisterClass = DRUID;
						}
							break;
						default:
							break;
					}
				}
			}
			switch(ResisterClass) {
				case CLERIC:
						Resister->InterruptSpell();
					if	(!strcasecmp(sep->arg[2], "poison") && (BotLevel >= 6))  {
						Resister->BotSay("Casting poison protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(1, Resister->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "disease") && (BotLevel >= 11)) {
						Resister->BotSay("Casting disease protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(2, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "fire") && (BotLevel >= 8)) {
						Resister->BotSay("Casting fire protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(3, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "cold") && (BotLevel >= 13)) {
						Resister->BotSay("Casting cold protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(4, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "magic") && (BotLevel >= 16)) {
						Resister->BotSay("Casting magic protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(5, Resister->GetLevel());
					}
					else if (((!strcasecmp(sep->arg[2], "magic")) && (BotLevel <= 15))
					|| ((!strcasecmp(sep->arg[2], "cold")) && (BotLevel <= 12))
					|| ((!strcasecmp(sep->arg[2], "fire")) && (BotLevel <= 7)) 
					|| ((!strcasecmp(sep->arg[2], "disease")) && (BotLevel <= 10))
					|| ((!strcasecmp(sep->arg[2], "poison")) && (BotLevel <= 5))) {
						Resister->BotSay("I don't have the needed level yet", sep->arg[2]);
					}
					else 
					Resister->BotSay("Do you want [resist poison], [resist disease], [resist fire], [resist cold], or [resist magic]?", c->GetName());

					break;

				case SHAMAN:
						Resister->InterruptSpell();
					if	(!strcasecmp(sep->arg[2], "poison") && (BotLevel >= 20))  {
						Resister->BotSay("Casting poison protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(12, Resister->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "disease") && (BotLevel >= 8)) {
						Resister->BotSay("Casting disease protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(13, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "fire") && (BotLevel >= 5)) {
						Resister->BotSay("Casting fire protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(14, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "cold") && (BotLevel >= 1)) {
						Resister->BotSay("Casting cold protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(15, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "magic") && (BotLevel >= 19)) {
						Resister->BotSay("Casting magic protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(16, Resister->GetLevel());
					}
					else if (((!strcasecmp(sep->arg[2], "magic")) && (BotLevel <= 18))
					|| ((!strcasecmp(sep->arg[2], "cold")) && (BotLevel <= 0))
					|| ((!strcasecmp(sep->arg[2], "fire")) && (BotLevel <= 4)) 
					|| ((!strcasecmp(sep->arg[2], "disease")) && (BotLevel <= 7))
					|| ((!strcasecmp(sep->arg[2], "poison")) && (BotLevel <= 19))) {
						Resister->BotSay("I don't have the needed level yet", sep->arg[2]);
					}
					else 
					Resister->BotSay("Do you want [resist poison], [resist disease], [resist fire], [resist cold], or [resist magic]?", c->GetName());

					break;

				case DRUID:
						Resister->InterruptSpell();
					if	(!strcasecmp(sep->arg[2], "poison") && (BotLevel >= 19)) {
						Resister->BotSay("Casting poison protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(7, Resister->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "disease") && (BotLevel >= 19)) {
						Resister->BotSay("Casting disease protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(8, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "fire")) { // Fire level 1
						Resister->BotSay("Casting fire protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(9, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "cold") && (BotLevel >= 13)) {
						Resister->BotSay("Casting cold protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(10, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "magic") && (BotLevel >= 16)) {
						Resister->BotSay("Casting magic protection...", sep->arg[2]);
						Resister->CastToNPC()->Bot_Command_Resist(11, Resister->GetLevel());
					}
					else if (((!strcasecmp(sep->arg[2], "magic")) && (BotLevel <= 15))
					|| ((!strcasecmp(sep->arg[2], "cold")) && (BotLevel <= 12))
					|| ((!strcasecmp(sep->arg[2], "disease")) && (BotLevel <= 18))
					|| ((!strcasecmp(sep->arg[2], "poison")) && (BotLevel <= 18))) {
						Resister->BotSay("I don't have the needed level yet", sep->arg[2]) ;
					}
					else 
					Resister->BotSay("Do you want [resist poison], [resist disease], [resist fire], [resist cold], or [resist magic]?", c->GetName());

					break;

				default:
					c->Message(15, "You must have a Cleric, Shaman, or Druid in your group.");
					break;
			}
		}
		return;
	}

// fez_ajer: Bot auto commands
	if(!strcasecmp(sep->arg[1], "auto")) {

		// Adjust the bot behavior
		if(!strcasecmp(sep->arg[2], "help")) {
			c->Message(15, "#bot auto help - will show this help");
			c->Message(15, "#bot auto info - will give info about your bots behavior.");
			c->Message(15, "#bot auto default - will set the selected bot to default behavior.");
			c->Message(15, "#bot auto mez [on/off] - Automatically mez hostile adds attacking your group.");
			c->Message(15, "#bot auto mez - Works with Enchanter, Bard or Necromancer.");			
			c->Message(15, "#bot auto defend [on/off] - Automatically defend the bot owner when they are attacked.");
			return;
		} else if (!strcasecmp(sep->arg[2], "info")) {
			Group *g = c->GetGroup();
			if(g) {
				bool hasBots = false;

				for(int i=0; i<MAX_GROUP_MEMBERS; i++){
					if(g->members[i] && g->members[i]->IsBot()) {
						hasBots = true;

						c->Message(15, "%s: mez:%s, defend:%s",
							g->members[i]->GetCleanName(),
							//(g->members[i]->GetClass() != ENCHANTER) ? "n/a" : g->members[i]->GetBotAutoMez() ? "on" : "off",
							g->members[i]->GetBotAutoMez() ? "on" : "off",
							g->members[i]->GetBotAutoDefend() ? "on" : "off");
					}
				}

				if (!hasBots)
					c->Message(15, "You are not grouped with any bots.");

			} else {
				c->Message(15, "You are not grouped with any bots.");
			}

			return;
		}

		// Make sure they are targetting a bot
		if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot()) {
			c->Message(15, "You must target a bot first.");
			return;
		}

		// Give them a command to set bot defaults
		if (!strcasecmp(sep->arg[2], "default")) {
			target->SetBotAutoMez(false);
			target->SetBotAutoDefend(false);
			c->Message(15, "%s: mez:%s defend:%s",
				target->GetCleanName(),
				(target->GetClass() != ENCHANTER) ? "n/a" : target->GetBotAutoMez() ? "on" : "off",
				target->GetBotAutoDefend() ? "on" : "off");
			return;
		}

		// Make sure they've specified on or off as parameters
		if (strcasecmp(sep->arg[3], "on") && strcasecmp(sep->arg[3], "off")) {
			c->Message(15, "Usage: #bot auto [mez/defend] [on/off]");
			return;
		}

		// Are we the behavior on or off?
		bool cmdParm = (!strcasecmp(sep->arg[3], "on")) ? true : false;

		if(!strcasecmp(sep->arg[2], "mez")) {
			/* This piece will only allow one bot to mez.
			Group *g = c->GetGroup();
			bool hasBots = false;
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
				hasBots = true;
				   if (hasBots)
				     g->members[i]->SetBotAutoMez(false);
				}
			}
			*/
			if (((target->GetClass() == ENCHANTER) && (BotLevel > 1)) || ((target->GetClass() == BARD) && (BotLevel > 14)) ){
			   //|| ((target->GetClass() == NECROMANCER) && (BotLevel > 21))){
				target->SetBotAutoMez(cmdParm);
				c->Message(15, "%s %s automatically mez mobs.", target->GetCleanName(), cmdParm ? "will" : "will not");
			} else { //Angelox: quoted out Necro cause I can't get it to work.
			      if ((target->GetClass() == ENCHANTER) || (target->GetClass() == BARD)) //|| (target->GetClass() == NECROMANCER))
				c->Message(15, "%s does not have the proper level for mezzing mobs.", target->GetCleanName());
			      else
				c->Message(15, "%s is not capable of mezzing mobs.", target->GetCleanName());
			}
		} else if (!strcasecmp(sep->arg[2], "defend")) {
			target->SetBotAutoDefend(cmdParm);
			c->Message(15, "%s %s automatically defend %s owner.", target->GetCleanName(), cmdParm ? "will" : "will not", (target->GetGender() == 0) ? "his" : (target->GetGender() == 1) ? "her" : "its");
		} else {
			c->Message(15, "Usage: #bot auto [mez/defend] [on/off]");
		}

		return;
	}
	
// fez_ajer: Bot mana command
	if(!strcasecmp(sep->arg[1], "mana")) {
		Group *g = c->GetGroup();
		if(g) {
			bool hasCasterBots = false;

			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() != WARRIOR) &&
					(g->members[i]->GetClass() != MONK) && (g->members[i]->GetClass() != BARD) &&
					(g->members[i]->GetClass() != BERSERKER) && (g->members[i]->GetClass() != ROGUE)) {

					hasCasterBots = true;
					g->members[i]->BotSay("I have %0.0f%%%% mana.", g->members[i]->GetManaRatio());
				}
			}

			if (!hasCasterBots)
				c->Message(15, "You are not grouped with any caster bots.");

		} else {
			c->Message(15, "You are not grouped with any bots.");
		}

		return;
	}

// battlerez
	if(!strcasecmp(sep->arg[1], "battlerez")) {
		if(c->GetAggroCount()) {
			if(database.SpawnedBotCount(c->CharacterID()) < c->spawned_bots.size()) {
				if(c->battle_rez_timer.Check(false)) {
					// Perform battle rez
					if(c->IsBotRaiding()) {
					  c->Message(15, "Battlerez disabled in raid mode."); //TODO Fix Battlerez in raid mode
					  return;					  
						BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
						if(br) {
							br->CompareToSpawnedBotList(c);
							c->battle_rez_timer.Disable();
						}
					}
					else if(c->IsGrouped()) {
						Group *g = entity_list.GetGroupByClient(c);
						if(g) {
							std::list<int32>::iterator iter = c->spawned_bots.begin();
							for(int j=0; j<MAX_GROUP_MEMBERS; ++j) {
								if(g->members[j]) {
									if(g->members[j]->IsBot()) {
										if(g->members[j]->GetNPCTypeID() != *iter) {
											// This *iter bot must have died and the next
											// bot is in its group position
											entity_list.RezBotMemeber(iter, 0, j, 0, g, c);
											c->battle_rez_timer.Disable();
											break;
										}
										++iter;
									}
								}
								else {
									// This *iter bot must have died and is the first
									// missing member of the group
									entity_list.RezBotMemeber(iter, 0, j, 0, g, c);
									c->battle_rez_timer.Disable();
									break;
								}
							}
						}
					}
				}
				else {
					if(!c->battle_rez_timer.Enabled()) {
						c->battle_rez_timer.Enable();
						// Set the timer for 10 seconds to simulate
						// the cleric epic cast time.
						c->battle_rez_timer.Start(RuleI(EQOffline, Battlerez), false);
					}
					c->Message(15, "You cannot battle rez for %i seconds", (c->battle_rez_timer.GetRemainingTime()/1000));
				}
			}
			else {
				c->Message(15, "Your bots are alive.");
			}
		}
		else {
			c->Message(15, "Your are not in battle.");
		}
		return;
	}

// offtank
	if(!strcasecmp(sep->arg[1], "offtank")) {
		Mob *target = c->GetTarget();
		Group *g = c->GetGroup();

		if (!target || target->IsClient() || target->IsBot() || (target->IsPet() && target->GetOwner()->IsBot())) {
            c->Message(15, "You must select a mob to offtank");
            return;
        }
		if (!g)
		{
            c->Message(15, "You need to be grouped to offtank a mob");
            return;
		}

		Mob* pOfftanker = 0;
		int highestTankScore = 0;
		BotRaids* br = entity_list.GetBotRaidByMob(c->CastToMob());

		for(int j = 0; j < (br ? MAX_BOT_RAID_GROUPS : 1); j++) {
			g = (br ? br->BotRaidGroups[j] : c->GetGroup());
			if (g) {
				// Try to find the most appropriate offtank
				for(int i = 0; i < MAX_GROUP_MEMBERS; i++) {
					Mob* pMember = g->members[i];
					if(pMember && pMember->IsBot()) {
						// Algorithmn to pick best tank could use some more thought
						int tankScore = (pMember->GetAC() * pMember->GetHP());
						switch(pMember->GetClass()) {
							// Best offtanks
							case PALADIN:
							case SHADOWKNIGHT:
								tankScore *= 3;
								break;

							case WARRIOR:
								tankScore *= 2.5;
								break;

							case BARD:
							case MONK:
							case BEASTLORD:
							case ROGUE:
							case RANGER:	// might as well just lay down and die now!
							case BERSERKER:
								tankScore *= 1;
								break;
							default:
								tankScore *= 0.1;
								break;
						}

						// Prefer that the main tank does not offtank
						if (br) {
							if (br->GetBotMainTank()) {
								if (br->GetBotMainTank()->IsEngaged() && (br->GetBotMainTank()->GetNPCTypeID() == pMember->GetNPCTypeID())) {
									tankScore *= 0.8;
								}
							} else if (br->GetBotSecondTank()) {
								if (br->GetBotSecondTank()->IsEngaged() && (br->GetBotSecondTank()->GetNPCTypeID() == pMember->GetNPCTypeID())) {
									tankScore *= 0.8;
								}
							}
						}
						
						// Favour offtanks that aren't already holding aggro
						// Todo: Factor in the number of mobs the bot is already tanking
						Mob* memberTarget = pMember->GetTarget();
						if (memberTarget && memberTarget->IsEngaged()) {
							Mob* memberTargetTarget = memberTarget->GetHateMost();
							if (memberTargetTarget && (memberTargetTarget->GetNPCTypeID() == pMember->GetNPCTypeID())) {
								tankScore *= 0.8;
							}
						}

						if (tankScore > highestTankScore ) {
							highestTankScore  = tankScore;
							pOfftanker = pMember;
						}
					}
				}
			}
		}
		if (!pOfftanker) {
            c->Message(15, "Could not find a suitable bot to offtank");
            return;
		}

		pOfftanker->BotSay("<< Offtanking %s >>", target->GetCleanName());

		pOfftanker->WipeHateList();
        pOfftanker->SetTarget(target);
		c->SetOrderBotAttack(true);
		pOfftanker->AddToHateList(target, 10);
		c->SetOrderBotAttack(false);
		//target->Taunt(pOfftanker->CastToNPC(), true);
		return;
	}
		
//debug commands
	if(!strcasecmp(sep->arg[1], "debug") && !strcasecmp(sep->arg[2], "inventory")) {
		Mob *target = c->GetTarget();
		if(target && target->IsBot())
        {
			for(int i=0; i<9; i++)
            {
				c->Message(15,"Equiped slot: %i , item: %i \n", i, target->CastToNPC()->GetEquipment(i));
			}
			if(target->CastToNPC()->GetEquipment(8) > 0)
				c->Message(15,"This bot has an item in off-hand.");
		}
        return;
	}

	if(!strcasecmp(sep->arg[1], "debug") && !strcasecmp(sep->arg[2], "botcaracs"))
    {
		Mob *target = c->GetTarget();
		if(target && target->IsBot())
        {
			if(target->CanThisClassDualWield())
                c->Message(15, "This class can dual wield.");
			if(target->CanThisClassDoubleAttack())
				c->Message(15, "This class can double attack.");
		}
		if(target->GetPetID())
			c->Message(15, "I've a pet and its name is %s", target->GetPet()->GetName() );
        return;
	}

	if(!strcasecmp(sep->arg[1], "debug") && !strcasecmp(sep->arg[2], "spells"))
    {
		Mob *target = c->GetTarget();
		if(target && target->IsBot())
        {
            for(int i=0; i<target->CastToNPC()->BotSpellCount(); i++)
            {
				if(target->CastToNPC()->BotGetSpells(i) != 0)
                {
					SPDat_Spell_Struct botspell = spells[target->CastToNPC()->BotGetSpells(i)];
					c->Message(15, "(DEBUG) %s , Slot(%i), Spell (%s) Priority (%i) \n", target->GetName(), i, botspell.name, target->CastToNPC()->BotGetSpellPriority(i));
				}
			}
		}
        return;
	}

//Raid Section
	 if((!zone->CanRaid()) && (!strcasecmp(sep->arg[1], "raid")) && (!strcasecmp(sep->arg[2], "help"))) { 
	      c->Message(15, "You cannot form raid groups in this zone.");
	      return;
	 }
	 if((zone->IsClassic()) && (c->GetTarget() == NULL) && (BotLevel >= 50)) { 
		c->Message(15, "You are in a trivial zone, Target the mob and re-try the command, it must be level 50 or higher.");
		c->Message(15, "WARNING! you are only allowed to attack level 50 or higher mobs in this zone!.");			
		return;
   	 }	    
	 if((zone->IsClassic()) && (BotLevel >= 50) && (target->GetLevel() <= 49) && (!strcasecmp(sep->arg[2], "help"))){
	        c->Message(15, "Targets level is trivial for you, must be at least level 50.");	   
	        c->Message(15, "This zone is trivial for you, try a zone with higher level mobs.");
	        return;
	 }
	if(!strcasecmp(sep->arg[1], "raid") && !strcasecmp(sep->arg[2], "help")){
		c->Message(15, "#bot raid help - will show this help");
		c->Message(15, "#bot raid info - will give info of your raid.");
		c->Message(15, "#bot raid create - will create your raid (you will be the raid leader)");
		c->Message(15, "#bot raid group create - create a group. Your target will be the leader.");
		c->Message(15, "#bot raid invite bot [group leader's name] - Invite your target into that group leader's group.");	
		c->Message(15, "#bot raid disband - Disband the raid.");
		c->Message(15, "#bot raid order maintank - Your target will be flagged as the main tank.");
		c->Message(15, "#bot raid order secondtank - Your target will be flagged as the second tank.");
		c->Message(15, "#bot raid order maintarget - Your target will be flagged as the main raid's target.");
		c->Message(15, "#bot raid order secondtarget - Your target will be flagged as the second raid's target.");
		c->Message(15, "#bot raid order grouptarget [group leader's name] - Your target will be flagged as the target of a specific group.");
		c->Message(15, "#bot raid order task [attack/guard] [group leader's name] - You will give a specific task [attack/guard].");
		c->Message(15, "#bot raid order task [follow/assist] [group1 leader's name] [group2 leader's name] - Group 1 will [follow/assist] Group 2.");
		c->Message(15, "#bot raid order task enraged - Tell your raid to stop attacking to defend against ENRAGED mobs.");
		c->Message(15, "#bot saveraid - save your current group(s) of bots.");
		c->Message(15, "#bot spawnraid - spawns your saved bots.");
		c->Message(15, "#bot groupraid - groups your spawned bots.");
        return;
	}

	if(!strcasecmp(sep->arg[1], "raid")){
	 if (BotLevel < 45){
	      c->Message(15, "You are too low in level for spawning raids. Bot raiding is enabled at level 45 and Later.");
	      return;
	 }
	 if (!c->GetNpcMode()){
	       c->Message(15, "You cannot form raid groups while in client mode - switch to npc mode.");
	       return;
	 }
	 if (((zone->IsClassic()) && (c->GetTarget() == NULL)) || ((!zone->CanRaid()) && (c->GetTarget() == NULL)) || 
	   ((!zone->CanRaid()) && (c->GetTarget() == c)) || ((!zone->CanRaid()) && (c->GetTarget()->IsBot()))){ 
		c->Message(15, "Target the mob and re-try the command.");
		return;
	 }	  
	 if((!zone->CanRaid()) && (BotLevel >= 50) && (target->GetLevel() <= 49)) {
		c->Message(15, "Targets level is trivial for you, must be at least level 50.");	  
		c->Message(15, "You cannot form raid groups in this zone.");
		return;
	 }
	 if((zone->IsClassic()) && (BotLevel >= 50) && (target->GetLevel() <= 49)){
		c->Message(15, "Targets level is trivial for you, must be at least level 50.");	  
		c->Message(15, "This zone is trivial for you, try a zone with higher level mobs.");
		return;
	 }
	 if((zone->CanRaid()) && (sep->arg[2][0] == '\0')) { 
	      c->Message(15, "Not enough input - try [bot] [raid] [help].");
	      return;
	    }
	 if(!strcasecmp(sep->arg[2], "info"))
         {
            if(c->CastToMob()->IsBotRaiding())
            {
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
                if(br) { 
                    br->BotRaidInfo(c);
                }
			}
            else {
                c->Message(15, "You are not in a bot raid.");
            }
            return;
		}

		else if(!strcasecmp(sep->arg[2], "create"))
        {
			if(c->IsBotRaiding())
            {
				c->Message(15, "You are already in a raid!");
				return;
			}
			if(!c->IsGrouped() || ( c->IsGrouped() &&  entity_list.GetGroupByMob(c)->BotGroupCount() < 6))
            {
				c->Message(15, "You must be grouped and have a full group to create a raid.");
				return;
			}
            else {
				BotRaids *br = new BotRaids(c->CastToMob());
				if(br) {
					Group *g = c->GetGroup();
					for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
						if(g->members[i]) {
							g->members[i]->SetBotRaidID(br->GetBotRaidID());
							g->members[i]->SetBotRaiding(true);
							if(g->members[i] && g->members[i]->GetPetID())
							{
								g->members[i]->GetPet()->SetBotRaidID(br->GetBotRaidID());
								g->members[i]->GetPet()->SetBotRaiding(true);
							}
						}
					}
					br->AddBotGroup(g);
				}
			}
            return;
		}

		else if(!strcasecmp(sep->arg[2], "group") && !strcasecmp(sep->arg[3], "create"))
        {
			if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot() || c->GetFeigned()) {
				return;
			}

			if(c->IsBotRaiding()) {
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
				if(br) {
					if(br->GetBotRaidAggro()) {
						c->Message(15, "You can't create bot groups while you are engaged.");
						return;
					}
				}
			}
			else if(c->IsGrouped())
			{
				Group *g = entity_list.GetGroupByClient(c);
				for (int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					if(g && g->members[i] && g->members[i]->IsEngaged())
					{
						c->Message(15, "You can't create bot groups while you are engaged.");
						return;
					}
				}
			}

			if(!c->CastToMob()->IsBotRaiding() && c->GetTarget()->IsBot())
            {
				c->Message(15, "You must have created your raid and your group must be full before doing that!");
				Mob* kmob = c->GetTarget();
				if(kmob != NULL) {
					kmob->BotOwner = NULL;
					kmob->BotKill();
				}
				return;
			}

			if(database.GetBotOwner(c->GetTarget()->GetNPCTypeID()) != c->CharacterID()) 
            {
                c->GetTarget()->Say("I can't be your bot, you are not my owner.");
				return;
			}

			if((c->GetTarget() != NULL) && !c->GetTarget()->IsGrouped() && c->GetTarget()->IsBot())
            {
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
				if(br && (br->RaidBotGroupsCount() >= MAX_BOT_RAID_GROUPS)) {
					Mob *kmob = c->GetTarget();
					if(kmob != NULL) {
						kmob->BotOwner = NULL;
						kmob->BotKill();
					}
					return;
				}

				Mob *gleader = c->GetTarget();
				gleader->SetFollowID(c->GetID());
				gleader->BotOwner = c->CastToMob();
				gleader->SetOwnerID(0);
				gleader->SetBotRaidID(br->GetBotRaidID());
				gleader->SetBotRaiding(true);

				Group *g = new Group(gleader);
				entity_list.AddGroup(g);
				br->AddBotGroup(g);

				// load up leaders gear
				std::string errorMessage = "";
				gleader->EquipBot(gleader->CastToNPC(), &errorMessage);
				if(!errorMessage.empty()) {
					gleader->Say("There was an error loading my equipment");
				}
				gleader->CalcBotStats();
				c->Message(15, "-- RAID -- Group Leader is: %s\n", gleader->GetName());
			}
			else {
				c->Message(15, "You must target your bot first.");
			}
			return;
        }

        else if(!strcasecmp(sep->arg[2], "invite") && !strcasecmp(sep->arg[3], "bot"))
        {
            if(c->GetFeigned()) {
                c->Message(15, "You cannot create raid groups while feigned.");
            }

			if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot()) {
                c->Message(15, "You must target a bot first.");
				return;
			}

			if(database.GetBotOwner(c->GetTarget()->GetNPCTypeID()) != c->CharacterID()) 
            {
                c->GetTarget()->Say("I can not join your bot raid, you are not my owner.");
				return;
			}

			Mob* sictar = entity_list.GetMob(sep->argplus[4]);
			if(!sictar || !sictar->IsGrouped() || entity_list.GetGroupByMob(sictar) == NULL || entity_list.GetGroupByMob(sictar)->GetLeader() != sictar)
            {
				c->Message(15, "You didn't type the correct group leader name.");
				Mob* kmob = c->GetTarget();
				if(kmob != NULL) {
					kmob->BotOwner = NULL;
					kmob->BotKill();
				}
				return;
			}

			if(c->GetTarget()->IsGrouped()) {
                c->Message(15, "You must target an ungrouped bot first.");
				Mob* kmob = c->GetTarget();
				if(kmob != NULL) {
					kmob->BotOwner = NULL;
					kmob->BotKill();
				}
                return;
            }                
			else {
                Mob *inv = c->GetTarget();
				
				Group *g = entity_list.GetGroupByMob(sictar);
				if(g && (g->BotGroupCount() > 5)) {
					inv->Say("I can't get into the group, it's full already.");
					inv->BotOwner = NULL;
					inv->BotKill();
					return;
				}
				if(g && (g->BotGroupCount() < 6))
                {
					inv->SetFollowID(sictar->GetID());
					inv->BotOwner = c->CastToMob();
					inv->SetOwnerID(0);
                    g->AddMember(inv);
					inv->SetBotRaiding(true);
					inv->SetBotRaidID(sictar->GetBotRaidID());

					// Equip newly raid grouped bot
					std::string errorMessage = "";
					inv->EquipBot(inv->CastToNPC(), &errorMessage);
					if(!errorMessage.empty()) {
						inv->Say("There was an error loading my equipment");
					}
					inv->CalcBotStats();
					inv->Say("I have joined %s's raid group.", g->GetLeader()->GetName());
				}
				else
					inv->Say("I can't join the group (You didn't enter the group leader's name or the group is full already. Type #bot raid info\n");
			}
            return;
		}
		else if(!strcasecmp(sep->arg[2], "disband"))
        {
			if(c->IsBotRaiding()) {
				/*database.CleanBotLeader(c->CharacterID());
				BotRaids *brd = entity_list.GetBotRaidByMob(c->CastToMob());
				if(brd) {
					brd->RemoveRaidBots();
					brd = NULL;
				}*/
				Group *g = entity_list.GetGroupByMob(c->CastToMob());
				if(g) {
					bool hasBots = false;
					for(int i=5; i>=0; i--) {
						if(g->members[i] && g->members[i]->IsBot()) {
							hasBots = true;
							//g->members[i]->BotOwner = NULL;
							//g->members[i]->BotKill();
						}
					}
					if(hasBots) {
						//if(g->BotGroupCount() <= 1) {
							g->DisbandGroup();
							hasBots = false;
						//}
					}
				}
				//c->Message(15, "Raid disbanded.");
			}
			//c->SetBotRaidID(0);
			//c->SetBotRaiding(false);
			//database.CleanBotLeader(c->CharacterID());
			return;
		}

		else if(!strcasecmp(sep->arg[2], "order"))
        {
			if(!strcasecmp(sep->arg[3], "maintank"))
            {
				if(c->GetTarget() == NULL)
					return;
				else {
					BotRaids *brc = entity_list.GetBotRaidByMob(c->CastToMob());
					BotRaids *brm = entity_list.GetBotRaidByMob(c->GetTarget());
					if(brc == NULL || brm == NULL || brc != brm)
                        return;
					else {
						brc->RaidWipeHateList();					  
						brc->SetBotMainTank(c->GetTarget());
						c->GetTarget()->Say("I am the Raid Primary Tank, /assist me!");
					}
				}
			}
			else if(!strcasecmp(sep->arg[3], "secondtank"))
            {
				if(c->GetTarget() == NULL)
					return;
				else {
					BotRaids *brc = entity_list.GetBotRaidByMob(c->CastToMob());
					BotRaids *brm = entity_list.GetBotRaidByMob(c->GetTarget());
					if(brc == NULL || brm == NULL || brc != brm)
                        return;
					else {
						brc->RaidWipeHateList();					  
						brc->SetBotSecondTank(c->GetTarget());
						c->GetTarget()->Say("I am the Raid Secondary Tank, /assist me if the Primary Tank dies!");
					}
				}
			}
			else if(!strcasecmp(sep->arg[3], "maintarget"))
            {
				if(entity_list.GetBotRaidByMob(c->CastToMob()) == NULL)
					return;
				else{
					BotRaids *brc = entity_list.GetBotRaidByMob(c->CastToMob());
					if(!brc || !c->GetTarget() || !c->IsAttackAllowed(c->GetTarget()))
					{
						if(brc)
							brc->SetBotMainTarget(NULL);
						return;
					}
					else
					{
						brc->RaidWipeHateList();					  
						brc->SetBotMainTarget(c->GetTarget());
						c->Message(15, "Main target is %s", c->GetTarget()->GetCleanName());
					}
				}
			}
			else if(!strcasecmp(sep->arg[3], "secondtarget"))
            {
				if(entity_list.GetBotRaidByMob(c->CastToMob()) == NULL)
					return;
				else {
					BotRaids *brc = entity_list.GetBotRaidByMob(c->CastToMob());
					if(c->GetTarget() == NULL || !c->GetTarget()->IsAttackAllowed(c) || brc == NULL)
						return;
					else {
						brc->SetBotSecondTarget(c->GetTarget());
					}
				}
			}
			else if(!strcasecmp(sep->arg[3], "grouptarget"))
            {
				if(entity_list.GetBotRaidByMob(c->CastToMob()) == NULL)
					return;
				else {
					BotRaids *brc = entity_list.GetBotRaidByMob(c->CastToMob());
					if(c->GetTarget() == NULL ||c->GetTarget()->IsBot())
                    {
						c->Message(15, "You don't have a target or your target is a bot.");
						return;
                    }
					if(brc) {
						brc->SetBotGroupTarget(c->GetTarget(), entity_list.GetGroupByLeaderName(sep->arg[4]));
					}
				}
			}
			else if(!strcasecmp(sep->arg[3], "task"))
            {
				BotRaids *brc = entity_list.GetBotRaidByMob(c->CastToMob());
				if(brc) {
					if(!strcasecmp(sep->arg[4], "attack"))
					{
						Mob *ctarget = c->GetTarget();
						if(ctarget != NULL) {
							//break invis when you attack
							if(c->invisible) {
								c->BuffFadeByEffect(SE_Invisibility);
								c->BuffFadeByEffect(SE_Invisibility2);
								c->invisible = false;
							}
							if(c->invisible_undead) {
								c->BuffFadeByEffect(SE_InvisVsUndead);
								c->BuffFadeByEffect(SE_InvisVsUndead2);
								c->invisible_undead = false;
							}
							if(c->invisible_animals){
								c->BuffFadeByEffect(SE_InvisVsAnimals);
								c->invisible_animals = false;
							}
							if(c->hidden || c->improved_hidden){
								c->hidden = false;
								c->improved_hidden = false;
								EQApplicationPacket* outapp = new EQApplicationPacket(OP_SpawnAppearance, sizeof(SpawnAppearance_Struct));
								SpawnAppearance_Struct* sa_out = (SpawnAppearance_Struct*)outapp->pBuffer;
								sa_out->spawn_id = c->GetID();
								sa_out->type = 0x03;
								sa_out->parameter = 0;
								entity_list.QueueClients(c, outapp, true);
								safe_delete(outapp);
							}

							if(ctarget && ctarget->IsBot())
								return;

							c->SetOrderBotAttack(true);
							brc->GroupAssignTask(entity_list.GetGroupByLeaderName(sep->arg[5]), 2, ctarget);
							c->SetOrderBotAttack(false);
						}
						else {
							c->Message(15, "You must target a monster.");
						}
					}
					else if(!strcasecmp(sep->arg[4], "guard"))
					{
						brc->RaidWipeHateList();					  
						Mob *ctarget = NULL;
						brc->GroupAssignTask(entity_list.GetGroupByLeaderName(sep->arg[5]), 4, ctarget);
					}
					else if(!strcasecmp(sep->arg[4], "assist"))
					{
						brc->GroupAssignTask(entity_list.GetGroupByLeaderName(sep->arg[5]), 3, entity_list.GetGroupByLeaderName(sep->arg[6]));
					}				
					else if(!strcasecmp(sep->arg[4], "follow"))
					{
						brc->RaidWipeHateList();					  
						brc->GroupAssignTask(entity_list.GetGroupByLeaderName(sep->arg[5]), 1, entity_list.GetGroupByLeaderName(sep->arg[6]));
					}
					else if(!strcasecmp(sep->arg[4], "enraged")) {
						brc->RaidDefendEnraged();
					}
				}
			}
		}
		return;
	}

	if (sep->arg[1][0] > '\0'){
	  if(BotLevel <= 5){ 
	    entity_list.BotHelpWindow(c,1);
	  }
	c->Message(15, "You must have typed in something wrong.");	
	c->Message(15, "Bad argument, type #bot help");	
	return;
    }

}

#endif //EQBOTS

