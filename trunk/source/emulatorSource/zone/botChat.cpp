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
	
  Angelox: This file was created to consolidate and optimize the bots random chat.
*/

#ifdef EQBOTS
#include "../common/debug.h"
#include "../common/MiscFunctions.h"
#include <iostream>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "masterentity.h"
#include "mob.h"
#include "botRaids.h"
#include "npc.h"

#ifdef WIN32
#define strncasecmp	_strnicmp
#define strcasecmp  _stricmp
#endif
/*
Player Races
  1 = Human
  2 = Barbarian
  3 = Erudite,
  4 = Wood Elf
  5 = High Elf
  6 = Dark Elf
  7 = Half Elf
  8 = Dwarf
  9 = Troll
  10 = Ogre
  11 = Halfling
  12 = Gnome
  128 = Iksar
  130 = Vah Shir
  330 = Froglok
  522 = Drakkin

Classes
  1 = Warrior
  2 = Cleric
  3 = Paladin
  4 = Ranger
  5 = Shadowknight
  6 = Druid
  7 = Monk
  8 = Bard
  9 = Rogue
  10 = Shaman
  11 = Necromancer
  12 = Wizard
  13 = Magician
  14 = Enchanter
  15 = Beastlord
  16 = Berserker
 */ 

struct ChatEvent {
   int32 Likelihood;	
   const char *ChatMessage;	
   };

//Med Chat Enchanter
ChatEvent ChatTable0[] = {   //Begin at ChatTable0, not ChatTable1!
   {1, "afk making coffe."},
   {1, "Are we going to hunt something worthwhile eventually or just keep screwing around?"},
   {1, "Is anyone else getting some serious lag?"},
   {2, "Hang on guys, wife faction dropping. Brb"}, //male
   {4, "AFK, need to put on another pot of coffee."},
   {6, "Bio break, back in a moment."},
   {4, "That last mob reminded me of my boss."},
   {2, "My parents need help, back in a few mins."},
   {6, "Medding %0.0f%%%% Mana, We gonna roll on the next drop?"},
   {4, "Medding for Mana, I don't think Clerics should be entitled to all gem loots."}, //Non Cleric.
   {8, "Medding for Mana, Telephone's ringing, brb."},
   {2, "Clerics are the back bone of EQ, You cant do squat with out us, therefor, give me all your plats!"}, //Cleric
   {1, "Guys, how long is this group gonna stay together cause I just got invited to hate raid."}, //Wiz, Cleric, Chanter Level over 40.
   {10, "Smoke Break."},
   {8, "I wonder if my mom is going to bring me some food. I'm starving. I've been sitting at this computer for over 20 hours straight now."},
   {8, "Ok, sorry if I'm a little unresponsive. I'm at work right now and my boss is making his rounds."},
   {7, "SJust spilled soda on my keyboard... hope it continues to work."},
   {5, "My mom is yelling at me... she says I'm addicted to EverQuest. It's true I haven't taken a shower in a week and rarely leave the basement except to use bathroom. That's not addicted though, is it?"},
   {6, "I'm eating some fresh Pizza Hut. Anyone want some?"},
   {200, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Med Chat Enchanter Female over level 13
ChatEvent ChatTable1[] = {
   {6, "Medding for Mana, potty break!"},//female
   {6, "I need to get a life!"}, //female
   {4, "AFK, need to put on another pot of coffee."},
   {2, "Bio break, back in a moment."},
   {4, "That last mob reminded me of my boss."},
   {8, "Anyone need some crack?"}, //Enchanter over level 14
   {6, "Casting Crack"}, //Enchanter over level 14
   {2, "Dammit, brb, kids killing each other."}, //Female
   {8, "Medding %0.0f%%%% Mana, We gonna roll on the next drop?"},
   {6, "Medding for Mana, I don't think Clerics should be entitled to all gem loots."}, //Non Cleric.
   {6, "Medding for Mana, Telephone's ringing, brb."},
   {8, "I wonder if my mom is going to bring me some food. I'm starving. I've been sitting at this computer for over 20 hours straight now."},
   {8, "Ok, sorry if I'm a little unresponsive. I'm at work right now and my boss is making his rounds."},
   {7, "SJust spilled soda on my keyboard... hope it continues to work."},
   {5, "My mom is yelling at me... she says I'm addicted to EverQuest. It's true I haven't taken a shower in a week and rarely leave the basement except to use bathroom. That's not addicted though, is it?"},
   {6, "I'm eating some fresh Pizza Hut. Anyone want some?"},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Med Chat Enchanter Female under level 14
ChatEvent ChatTable2[] = {
   {6, "Medding for Mana, potty break!"},//female
   {6, "I need to get a life!"}, //female
   {4, "AFK, need to put on another pot of coffee."},
   {2, "Bio break, back in a moment."},
   {4, "That last mob reminded me of my boss."},
   {2, "Dammit, brb, kids killing each other."}, //Female
   {8, "Medding %0.0f%%%% Mana, We gonna roll on the next drop?"},
   {6, "Medding for Mana, I don't think Clerics should be entitled to all gem loots."}, //Non Cleric.
   {6, "Medding for Mana, Telephone's ringing, brb."},
   {1, "Guys, how long is this group gonna stay together cause I just got invited to hate raid."}, //Wiz, Cleric, Chanter Level over 40.
   {8, "Smoke Break."},
   {8, "I wonder if my mom is going to bring me some food. I'm starving. I've been sitting at this computer for over 20 hours straight now."},
   {8, "Ok, sorry if I'm a little unresponsive. I'm at work right now and my boss is making his rounds."},
   {7, "SJust spilled soda on my keyboard... hope it continues to work."},
   {5, "My mom is yelling at me... she says I'm addicted to EverQuest. It's true I haven't taken a shower in a week and rarely leave the basement except to use bathroom. That's not addicted though, is it?"},
   {6, "I'm eating some fresh Pizza Hut. Anyone want some?"},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Med Chat Cleric
ChatEvent ChatTable3[] = {
   {1, "afk making coffe."},
   {1, "We wiped because there was not enuf cleric nukes!"},
   {1, "Okay, that's kind of disgusting. My friend just told me her druid just foraged up some dingleberries"},
   {1, "Umm.... guys? I got to go. My babysitter just caught me up again. OMG, hel pme! Ssshe's spanking me!!!!"},
   {1, "Wonderful, my roommate is cooking again. Can I get resist poison, please?"},
   {6, "Hang on guys, wife faction dropping. Brb"}, //male
   {4, "AFK, need to put on another pot of coffee."},
   {4, "Bio break, back in a moment."},
   {3, "Anyone have any dots?"},
   {4, "That last mob reminded me of my boss."},
   {5, "My parents need help, back in a few mins."},
   {6, "Medding %0.0f%%%% Mana, We gonna roll on the next drop?"},
   {4, "Medding for Mana, I think Clerics are entitled to all gem loots."}, //Cleric
   {2, "AFK Gotta drop the kids at the pool."}, //Cleric
   {8, "Medding for Mana, Telephone's ringing, brb."},
   {2, "Clerics are the back bone of EQ, You cant do squat with out us, therefor, give me all your plats!"}, //Cleric
   {1, "Guys, how long is this group gonna stay together cause I just got invited to hate raid."}, //Wiz, Cleric, Chanter Level over 40.
   {6, "MoK is the clerics best friend... Besides a chanter of course"},
   {6, "Smoke Break."},
   {2, "tell So you want me to go to the other side of the world, risk death, to res you... for 100 plat?"},
   {3, "Oh you want Symbol? give me a peridot."},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Med Chat Cleric Female
ChatEvent ChatTable4[] = {
   {6, "Medding for Mana, potty break!"},//female
   {4, "afk making coffe."},
   {2, "tell So you want me to go to the other side of the world, risk death, to res you... for 100 plat?"},
   {2, "Seriously, what's with the loot mongering? You a ninja or something? Share some of that wealth."},
   {4, "Is anyone else getting some serious lag?"},
   {1, "So... anyone wanna cyber? Oops, I mean go to another zone."},
   {2, "Are we going to hunt something worthwhile eventually or just keep screwing around?"},
   {4, "Sorry ya died, i healed the mob on accident"},
   {4, "I need to get a life!"}, //female
   {3, "AFK, need to put on another pot of coffee."},
   {1, "Bio break, back in a moment."},
   {3, "Anyone have any dots?"},
   {2, "That last mob reminded me of my boss."},
   {6, "Dammit, brb, kids killing each other."}, //Female
   {4, "My parents need help, back in a few mins."},
   {6, "Medding %0.0f%%%% Mana, We gonna roll on the next drop?"},
   {4, "Medding for Mana, I think Clerics are entitled to all gem loots."}, //Cleric
   {7, "AFK Gotta drop the kids at the pool."}, //Cleric
   {6, "Medding for Mana, Telephone's ringing, brb."},
   {2, "Clerics are the back bone of EQ, You cant do squat with out us, therefor, give me all your plats!"}, //Cleric
   {1, "Guys, how long is this group gonna stay together cause I just got invited to hate raid."}, //Wiz, Cleric, Chanter Level over 40.
   {8, "Smoke Break."},
   {1, "BRB - going to do a rez for a guildie."},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Med Chat Druid
ChatEvent ChatTable5[] = {
   {1, "afk making coffe."},
   {4, "Hang on guys, wife faction dropping. Brb"}, //male
   {8, "AFK, need to put on another pot of coffee."},
   {4, "Bio break, back in a moment."},
   {6, "That last mob reminded me of my boss."},
   {2, "My parents need help, back in a few mins."},
   {4, "Medding %0.0f%%%% Mana, We gonna roll on the next drop?"},
   {1, "Medding for Mana, I don't think Clerics should be entitled to all gem loots."}, //Non Cleric.
   {6, "Medding for Mana, Telephone's ringing, brb."},
   {8, "Smoke Break."},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Med Chat Druid Female over level 8 Outdoor
ChatEvent ChatTable6[] = {
   {4, "Medding for Mana, potty break!"},//female
   {4, "afk making coffe."},
   {4, "I need to get a life!"}, //female
   {4, "Anybody need SoW?"}, //Druid, outdoor, over level 9
   {4, "AFK, need to put on another pot of coffee."},
   {4, "Bio break, back in a moment."},
   {4, "That last mob reminded me of my boss."},
   {4, "Dammit, brb, kids killing each other."}, //Female
   {4, "My parents need help, back in a few mins."},
   {4, "Medding %0.0f%%%% Mana, We gonna roll on the next drop?"},
   {4, "Medding for Mana, Telephone's ringing, brb."},
   {4, "Smoke Break."},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Med Chat Druid Female under level 9 Outdoor
ChatEvent ChatTable7[] = {
   {4, "Medding for Mana, potty break!"},//female
   {4, "I need to get a life!"}, //female
   {4, "Can't wait tell I get SoW!"}, //under level 9 Druid
   {4, "AFK, need to put on another pot of coffee."},
   {4, "Bio break, back in a moment."},
   {4, "That last mob reminded me of my boss."},
   {4, "Dammit, brb, kids killing each other."}, //Female
   {4, "My parents need help, back in a few mins."},
   {4, "Medding %0.0f%%%% Mana, We gonna roll on the next drop?"},
   {4, "AFK Gotta drop the kids at the pool."}, //Cleric
   {4, "Medding for Mana, Telephone's ringing, brb."},
   {4, "Smoke Break."},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Med Chat Necromancer
ChatEvent ChatTable8[] = {
   {6, "afk making coffe."},
   {1, "AFK, need to put on another pot of coffee."},
   {8, "Bio break, back in a moment."},
   {4, "That last mob reminded me of my boss."},
   {2, "My parents need help, back in a few mins."},
   {8, "Medding %0.0f%%%% Mana, We gonna roll on the next drop?"},
   {4, "Medding for Mana, Telephone's ringing, brb."},
   {6, "Smoke Break."},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Med Chat Wizard
ChatEvent ChatTable9[] = {
   {6, "afk making coffie."},
   {4, "Hang on guys, wife faction dropping. Brb"}, //male
   {1, "AFK, need to put on another pot of coffee."},
   {6, "Bio break, back in a moment."},
   {2, "That last mob reminded me of my boss."},
   {6, "My parents need help, back in a few mins."},
   {4, "Medding %0.0f%%%% Mana, We gonna roll on the next drop?"},
   {4, "Medding for Mana, Telephone's ringing, brb."},
   {1, "Guys, how long is this group gonna stay together cause I just got invited to hate raid."}, //Wiz, Cleric, Chanter Level over 40.
   {6, "Smoke Break."},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Med Chat Iksar
ChatEvent ChatTable10[] = {
   {1, "afk making coffe."},
   {6, "AFK, need to put on another pot of coffee."},
   {4, "Bio break, back in a moment."},
   {2, "That last mob reminded me of my boss."},
   {4, "My parents need help, back in a few mins."},
   {8, "Gotta drain the Iksar, back in 2 mins."}, // Race 128 IKSAR
   {6, "Medding %0.0f%%%% Mana, We gonna roll on the next drop?"},
   {4, "Medding for Mana, I don't think Clerics should be entitled to all gem loots."}, //Non Cleric.
   {6, "Medding for Mana, Telephone's ringing, brb."},
   {4, "Smoke Break."},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Med Chat Rest of the casters
ChatEvent ChatTable11[] = {
   {1, "afk making coffe."},
   {6, "AFK, need to put on another pot of coffee."},
   {4, "Bio break, back in a moment."},
   {2, "That last mob reminded me of my boss."},
   {6, "My parents need help, back in a few mins."},
   {6, "Medding %0.0f%%%% Mana, We gonna roll on the next drop?"},
   {1, "Medding for Mana, I don't think Clerics should be entitled to all gem loots."}, //Non Cleric.
   {4, "Medding for Mana, Telephone's ringing, brb."},
   {8, "Smoke Break."},
   {4, "KS'er!"},
   {6, "Where's your pet, dude?"},
   {3, "GTG or Good to GO!"},
   {8, "I wonder if my mom is going to bring me some food. I'm starving. I've been sitting at this computer for over 20 hours straight now."},
   {8, "Ok, sorry if I'm a little unresponsive. I'm at work right now and my boss is making his rounds."},
   {7, "SJust spilled soda on my keyboard... hope it continues to work."},
   {5, "My mom is yelling at me... she says I'm addicted to EverQuest. It's true I haven't taken a shower in a week and rarely leave the basement except to use bathroom. That's not addicted though, is it?"},
   {6, "I'm eating some fresh Pizza Hut. Anyone want some?"},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Engaged Caster Cleric no Mana
ChatEvent ChatTable12[] = {
   {6, "Hello? We don't have any mana!!"},
   {6, "EVAC EVAC EVAC!"}, //Cleric
   {2, "I am manaless!"},
   {6, "Danger! I'm OOM!"},
   {4, "Hey guys, hold up! OOM!"},
   {4, "It's your funeral, I'm OOM! (out of Mana)."},
   {8, "No Mana! Gating soon.. be back to rez you all."},//Cleric
   {4, "OOM! We're going to die soon!."},
   {2, "tell Oh, hai! Meet you in 10, gotta ditch this loser group."},
   {20, "OOM! I HAVE NO MANA!"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Engaged Caster no Mana
ChatEvent ChatTable13[] = {
   {8, "Hello? I don't have any mana!!"},
   {4, "I am manaless!"},
   {6, "Danger! I'm OOM!"},
   {4, "Hey guys, hold up! OOM!"},
   {8, "It's your funeral, I'm OOM! (out of Mana)."},
   {4, "OOM! We're going to die soon!."},
   {1, "tell Oh, hai! Meet you in 10, gotta ditch this loser group."},
   {20, "OOM! NO MANA!"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Engaged Caster Cleric Low Mana less than 100 hp
ChatEvent ChatTable14[] = {
   {8, "Low on mana, medding."},
   {6, "Ya know, If you had better gear I would not have to heal you so much."}, //Cleric
   {6, "What would you all be without us Clerics?"}, //Cleric
   {8, "swing faster, i am taking a nap."}, //Cleric
   {2, "tell Ever hunted in Gunthak? Psh, we hunted the wall for hours and no drops."},
   {16, "Why is it hitting me?! taunt harder!"},//Cleric & (GetHP() < 100)
   {6, "I need to med some."},
   {1, "tell Oh, hai! Meet you in 10, gotta ditch this loser group."},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Engaged Caster Cleric Low Mana
ChatEvent ChatTable15[] = {
   {8, "Low on mana, medding."},
   {6, "Ya know, If you had better gear I would not have to heal you so much."}, //Cleric
   {6, "What would you all be without us Clerics?"}, //Cleric
   {8, "swing faster, i am taking a nap."}, //Cleric
   {6, "I need to med some."},
   {2, "tell Ever hunted in Gunthak? Psh, we hunted the wall for hours and no drops."},
   {1, "tell Oh, hai! Meet you in 10, gotta ditch this loser group."},
   {1, "Running out of mana here!"},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Engaged Caster Low Mana
ChatEvent ChatTable16[] = {
   {8, "Low on mana, medding."},
   {9, "Why is the Cleric Nuking?!?"}, //Non Cleric
   {2, "tell Ever hunted in Gunthak? Psh, we hunted the wall for hours and no drops."},
   {6, "I need to med some."},
   {4, "Mana low! Finish up or start running."},
   {3, "Start making the funeral arrangements, cause we about to loose some players."},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Follow Chat indoor zone 58 (Crushbone)
ChatEvent ChatTable17[] = {
   {4, "Better exerience and loots in here."},
   {1, "WtF!?!"},
   {2, "I think we're goin the wrong way!."},
   {6, "AFK on autofollow, don make any fast moves."},
   {6, "Lets camp the Dvnn!"},
   {4, "Where we goin?"},
   {4, "Wait up guys!"},
   {2, "Anyone wanna see me moonwalk?"},
   {2, "Has anyone seen my corpse?"},
   {2, "I wonder what Verant nerfed today!"},
   {2, "I think I lost y'all!"},
   {4, "Does ANYBODY know where were going?"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Follow Chat indoor zone 44 (Najena)
ChatEvent ChatTable18[] = {
   {4, "Better exerience and loots in here."},
   {1, "WtF!?!"},
   {2, "I think we're goin the wrong way!."},
   {4, "AFK on autofollow, don make any fast moves."},
   {6, "I need to get into the Drelzna room for some J-Boots."},
   {4, "Where we goin?"},
   {4, "Wait up guys!"},
   {2, "Anyone wanna see me moonwalk?."},
   {2, "I wonder what Verant nerfed today!"},
   {2, "I think I lost y'all!"},
   {3, "Does ANYBODY know where were going?"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Follow Chat indoor zone
ChatEvent ChatTable19[] = {
   {4, "Better exerience and loots in here."},
   {1, "WtF!?!"},
   {2, "I think we're goin the wrong way!."},
   {6, "AFK on autofollow, don make any fast moves."},
   {4, "Where we goin?"},
   {4, "Wait up guys!"},
   {2, "Anyone wanna see me moonwalk?."},
   {2, "I wonder what Verant nerfed today!"},
   {2, "I think I lost y'all!"},
   {4, "Does ANYBODY know where were going?"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Follow Chat outdoor zone Bard
ChatEvent ChatTable20[] = {
   {4, "Run Forest, Run!"},
   {7, "Bard speed Scotty!"},
   {2, "Auto-follow sucks!"},
   {6, "AFK on autofollow, don't make any fast moves."},
   {4, "Where we goin?"},
   {4, "Wait up guys!"},
   {2, "Anyone wanna see me moonwalk?."},
   {2, "I wonder what Verant nerfed today!"},
   {2, "I think I lost you"},
   {1, "Does ANYBODY know where were going?"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Follow Chat outdoor zone GFay (54)
ChatEvent ChatTable21[] = {
   {4, "Run Forest, Run!"},
   {9, "Lets go hunt Lesser Fay by the z-in!"},
   {2, "Auto-follow sucks!"},
   {6, "AFK on autofollow, don't make any fast moves."},
   {4, "Where we goin?"},
   {4, "Wait up guys!"},
   {2, "Anyone wanna see me moonwalk?."},
   {2, "I wonder what Verant nerfed today!"},
   {2, "I think I lost you"},
   {5, "Does ANYBODY know where were going?"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Follow Chat outdoor zone Steamfont (56)
ChatEvent ChatTable22[] = {
   {4, "Run Forest, Run!"},
   {9, "Lets hunt the Mino caves!"},
   {2, "Auto-follow sucks!"},
   {6, "AFK on autofollow, don't make any fast moves."},
   {4, "Where we goin?"},
   {4, "Wait up guys!"},
   {2, "Anyone wanna see me moonwalk?."},
   {1, "I wonder what Verant nerfed today!"},
   {2, "I think I lost you"},
   {5, "Does ANYBODY know where were going?"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Follow Chat outdoor zone
ChatEvent ChatTable23[] = {
   {4, "Run Forest, Run!"},
   {5, "Anyone got food?"},
   {2, "Auto-follow sucks!"},
   {6, "AFK on autofollow, don't make any fast moves."},
   {4, "Where we goin?"},
   {4, "Wait up guys!"},
   {2, "Anyone wanna see me moonwalk?."},
   {1, "I wonder what Verant nerfed today!"},
   {2, "I think I lost you"},
   {5, "Anyone got water?"},
   {6, "Does ANYBODY know where were going?"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Engaged Caster Cleric less than 100 hp
ChatEvent ChatTable24[] = {
   {6, "Ya know, If you had better gear I would not have to heal you so much."}, //Cleric
   {6, "What would you all be without us Clerics?"}, //Cleric
   {8, "swing faster, i am taking a nap."}, //Cleric
   {2, "tell Ever hunted in Gunthak? Psh, we hunted the wall for hours and no drops."},
   {16, "Why is it hitting me?! taunt harder!"},//Cleric & (GetHP() < 100)
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Engaged Caster Cleric
ChatEvent ChatTable25[] = {
   {6, "Ya know, If you had better gear I would not have to heal you so much."}, //Cleric
   {6, "What would you all be without us Clerics?"}, //Cleric
   {8, "swing faster, i am taking a nap."}, //Cleric
   {4, "Two for one deal, today only. When you group with me, you get me and my good looks."},
   {4, "Are a gnome and dwarf basically the same thing? What's the differences?"},
   {1, "Can whoever is whoring out MacroQuest please stop trying to ping flood me off. I'm lagging to heck and back. I already said I'm sorry. I didn't mean to call you a cheater."},
   {4, "Okay, whoever is sending me cheesy come-on lines please stop. I'm not interested."},
   {4, "You guys gonna start puttin out some real dps or are we going to take a million years to kill every trash mob?"},
   {4, "Fellas, hold up. I think I just agroed my cat. Gimme a sec to beat it down."},
   {4, "Ok, sorry if I'm a little unresponsive. I'm at work right now and my boss is making his rounds."},
   {4, "Okay, whoever is sending me cheesy come-on lines please stop. I'm not interested."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Engaged Caster
ChatEvent ChatTable26[] = {
   {6, "Why is the Cleric Nuking?!?"}, //Non Cleric
   {2, "tell Ever hunted in Gunthak? Psh, we hunted the wall for hours and no drops."},
   {4, "Let's do this!"},
   {6, "Feel my wrath!"},
   {6, "Feel my fury!"},
   {3, "/me gets better at semi-AFK playing (67)"},
   {3, "I'm lagging so bad I think I'm still stuck in the last fight."},
   {6, "Taking bets on whose gonna to die first"},
   {2, "Okay... I'm sorry guys but I have an emergency here. My dog just ate my game card for next month!"},
   {6, "Taste the awesome force of my power!"},
   {2, "I want to buy a horse... not look like one. How do you change the face settings again?"},
   {1, "Stop touching me!"},
   {3, "How do I get my experience bar to move?"},
   {2, "Anyone know some bugs I can exploit? I need some cash."},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Engaged Tanks Warrior
ChatEvent ChatTable27[] = {
   {6, "Attacking %s, ASSIST ME!!"}, 
   {6, "Be prepared to heal me!"},
   {8, "<<<< %s >>>> is INCOMMING!!"}, 
   {2, "Why are we even hunting here?"},
   {6, "WooT!"},
   {8, "%s is good and mad at me, now... Attack!"},
   {80, "Taunting %s"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Engaged Tanks Paladin
ChatEvent ChatTable28[] = {
   {6, "I'm tanking %s, assist me!"}, 
   {6, "WooT!"},
   {8, "%s is good and mad at me, now... Attack!"},
   {6, "Attacking %s, ASSIST ME!!"}, 
   {2, "I will serve thee with the honor and dedication that only a noble knight can possess."},
   {2, "Did someone just kick me?"},
   {80, "Taunting %s"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Engaged Tanks SK
ChatEvent ChatTable29[] = {
   {6, "Anyone want some weed?"}, 
   {6, "Why are we even hunting here?"},
   {8, "Just hiding in the shadows... waiting to HT some sorry mob."}, 
   {6, "Why is the Cleric Nuking?!?"},
   {80, "Taunting %s"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Engaged Tanks Ranger
ChatEvent ChatTable30[] = {
   {6, "Why are you using that? PGT is awesomer."}, 
   {6, "Rangerrr in da howse teh flesh. You ready for taht? Cant touch this!"},
   {8, "Rangers do it in the wild."},
   {8, "Seriously, what's with the loot mongering? You a ninja or something? Share some of that wealth."},
   {2, "Did someone just kick me?"},
   {80, "Taunting %s"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Engaged Tanks Bard
ChatEvent ChatTable31[] = {
   {6, "Bards do it while singing in the shower."}, 
   {6, "You going to give me an instrument with some real mods on it or do you just want me to play my skin flute over here?"},
   {8, "I'm a Clerics best friend."}, 
   {2, "I call the next drop. I don't care what it is. I don't even care if I can use it. I call it."},
   {80, "Taunting %s"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Enchanter Mezzer
ChatEvent ChatTable32[] = {
   {8, "I've got %s sleepin like a baby."}, 
   {2, "You know, mez lasts longer on %s when you don't hit them."},
   {8, "Mezzing %s for fun and profit."}, 
   {2, "Mezzing %s to prevent your imminent deaths!"},
   {8, "Doin my job, %s mezzed until the next idiot hits 'em."}, 
   {2, "%s mezzed, don't DOT my target!"},
   {8, "Who pulled this mess?!"}, 
   {80, "Mezzing << %s >>"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Bard Mezzer
ChatEvent ChatTable33[] = {
   {8, "I've got %s sleepin like a baby."}, 
   {4, "You know, mez lasts longer on %s when you don't hit them."},
   {8, "Mezzing %s for fun and profit."}, 
   {4, "Mezzing %s to prevent your imminent deaths!"},
   {8, "Doin my job, %s mezzed until the next idiot hits 'em."},
   {1, "FYI, I'm doing the pee pee dance at my computer. But I think I can hold out for a few more hours. Go on. Let's continue."},
   {1, "How much plat you think I can buy for a hundred bucks?"},
   {4, "%s mezzed, don't DOT my target!"},
   {8, "Who pulled this mess?!"}, 
   {80, "Mezzing << %s >>"},
   {-1, ""}   //This needs to be at the end of EACH table.
};
//Med Chat Druid Female over level 8 Indoors
ChatEvent ChatTable34[] = {
   {4, "Medding for Mana, potty break!"},//female
   {4, "afk making coffe."},
   {4, "I need to get a life!"}, //female
   {4, "AFK, need to put on another pot of coffee."},
   {4, "Bio break, back in a moment."},
   {4, "That last mob reminded me of my boss."},
   {4, "Dammit, brb, kids killing each other."}, //Female
   {4, "My parents need help, back in a few mins."},
   {4, "Medding %0.0f%%%% Mana, We gonna roll on the next drop?"},
   {4, "Medding for Mana, Telephone's ringing, brb."},
   {4, "Smoke Break."},
   {100, "Medding for Mana. I have %0.0f%%%%."},
   {-1, ""}   //This needs to be at the end of EACH table.
};

ChatEvent *ChatTables[] = {
   ChatTable0, //Med Chat Enchanter
   ChatTable1, //Med Chat Enchanter Female over level 13
   ChatTable2, //Med Chat Enchanter Female under level 14
   ChatTable3, //Med Chat Cleric 
   ChatTable4, //Med Chat Cleric Female
   ChatTable5, //Med Chat Druid
   ChatTable6, //Med Chat Druid Female over level 8 Outdoor
   ChatTable7, //Med Chat Druid Female under level 9 Outdoor
   ChatTable8, //Med Chat Necromancer
   ChatTable9, //Med Chat Wizard
   ChatTable10, //Med Chat Iksar
   ChatTable11, //Med Chat Rest of the casters
   ChatTable12, //Engaged Caster Cleric no Mana
   ChatTable13, //Engaged Caster no Mana
   ChatTable14, //Engaged Caster Cleric Low Mana & Hp less than 100
   ChatTable15, //Engaged Caster Cleric Low Mana
   ChatTable16, //Engaged Caster Low Mana
   ChatTable17, //Follow Chat indoor zone 58 (Crushbone)
   ChatTable18, //Follow Chat indoor zone 44 (Najena)
   ChatTable19, //Follow Chat indoor
   ChatTable20, //Follow Chat outdoor zone Bard
   ChatTable21, //Follow Chat outdoor zone Lesser Fay (54)
   ChatTable22, //Follow Chat outdoor zone Steamfont (56)
   ChatTable23, //Follow Chat outdoor
   ChatTable24, //Engaged Caster Cleric Hp less than 100
   ChatTable25, //Engaged Caster Cleric 
   ChatTable26, //Engaged Caster
   ChatTable27, //Warrior Tanks
   ChatTable28, //Paladin Tanks
   ChatTable29, //SK Tanks
   ChatTable30, //Ranger Tanks
   ChatTable31, //Bard Tanks
   ChatTable32, //Enchanter Mezzer
   ChatTable33, //Bard Mezzer
   ChatTable34, //Med Chat Druid Female Indoors
   (ChatEvent *)0 //This needs to be at the end of THIS table-of-tables!
};

int *LikelihoodTotals;

void Mob::CalculateChatListMetrics() {
   int TableCount = -1;
   ChatEvent *Table;
   do {
      Table = ChatTables[++TableCount];
   } while (Table != (ChatEvent *)0);
   if (TableCount > 0) {
      LikelihoodTotals = new int[TableCount];
      for (int Table = 0; Table < TableCount; Table++) {
         LikelihoodTotals[Table] = 0;
         int EventCount = -1;
         int Likelihood = 0;
         do {
            LikelihoodTotals[Table] += Likelihood;
            Likelihood = ChatTables[Table][++EventCount].Likelihood;
         } while (Likelihood >= 0);
      };
   };
};

void Mob::SayRandomBotMessage(int Table) {   //NOTE! Table >= 0 and Table < total-of-tables
  Mob *target = GetTarget();
  Mob *mezMob = BotGetMobToMez(1,0,0);
  Mob *hate_top = target->GetHateMost();
  int zoNe = zone->GetZoneID();
  bool outDoor = zone->CanCastOutdoor();
  bool isSitting = GetAppearance() == eaSitting;
  bool isStanding = GetAppearance() == eaStanding;
  bool folloWing = IsMoving();
   if (LikelihoodTotals > 0) {
      int Selection = MakeRandomInt(1, LikelihoodTotals[Table]);
      int Entry = 0;
      while (Selection > ChatTables[Table][Entry].Likelihood) {
         Selection -= ChatTables[Table][Entry++].Likelihood;
      };
      if ((isSitting) && (!GetBotAutoMez())){
	BotSay(ChatTables[Table][Entry].ChatMessage, GetManaRatio());
      }
      else if (GetBotAutoMez()) {
	if (GetTarget() == NULL)
	  return;
	if ((hate_top != target) && (mezMob))
	BotSay(ChatTables[Table][Entry].ChatMessage, mezMob->GetCleanName());
      }
      else if ((IsEngaged()) && (!GetBotAutoMez())){
	if ((IsATaunter()) && (GetTarget()))
	  if (GetTarget() == NULL)
	    return;
	  else
	    BotSay(ChatTables[Table][Entry].ChatMessage, target->GetCleanName());
	else
	  BotSay(ChatTables[Table][Entry].ChatMessage, GetManaRatio());
      }
      else if (folloWing){
	BotSay(ChatTables[Table][Entry].ChatMessage);
      }
   };
};
//Angelox: This piece was crashing zones - I think because of NULL target issues.
/* 
void Mob::SayRandomMessage() {
 if(!IsBotRaiding()){
  Mob *target = GetTarget();
  int zoNe = zone->GetZoneID();
  bool outDoor = zone->CanCastOutdoor();
  bool isSitting = GetAppearance() == eaSitting;
  bool isStanding = GetAppearance() == eaStanding;
  bool folloWing = IsMoving();
   if ((isSitting) && (!IsEngaged())){
     if (MakeRandomInt(1,100) < 3){
       if ((GetClass() == ENCHANTER) && (GetGender() == 1) && (GetLevel() > 13))
        SayRandomBotMessage(1);
       else if ((GetClass() == ENCHANTER) && (GetGender() == 1) && (GetLevel() < 14))
	 SayRandomBotMessage(2);
       else if (GetClass() == ENCHANTER)
	 SayRandomBotMessage(0);
       else if ((GetClass() == CLERIC) && (GetGender() == 1))
	 SayRandomBotMessage(4);
       else if (GetClass() == CLERIC)
	 SayRandomBotMessage(3);
       else if ((GetClass() == DRUID) && (GetGender() == 1) && (GetLevel() > 8) && (!outDoor))
         SayRandomBotMessage(6);
       else if ((GetClass() == DRUID) && (GetGender() == 1) && (GetLevel() < 9) && (!outDoor))
	 SayRandomBotMessage(7);
       else if (GetClass() == DRUID)
	 SayRandomBotMessage(34);
       else if (GetRace() == IKSAR)
	 SayRandomBotMessage(10);
       else if (GetClass() == NECROMANCER)
	 SayRandomBotMessage(8);
       else if (GetClass() == WIZARD)
	 SayRandomBotMessage(9);
        else
	 SayRandomBotMessage(11);
      }
    }
   else if(IsEngaged()){
     if ((IsATaunter()) && target){ //Tanks
       if (GetClass() == WARRIOR)
	SayRandomBotMessage(27);
       else if (GetClass() == PALADIN)
	SayRandomBotMessage(28);
       else if (GetClass() == SHADOWKNIGHT)
	SayRandomBotMessage(29);
       else if (GetClass() == RANGER)
	SayRandomBotMessage(30);
       else if (GetClass() == BARD)
	SayRandomBotMessage(31);
     SetBotTaunter(false);
    }
    if (IsCasterEngaged()){
      if (IsAMezzer()){
       // if ((CastToNPC()->BotGetMobToMez(1,0,0) == NULL) || target == NULL)
	// return;
        if (MakeRandomInt(1,100) < 40){
          if (GetClass() == ENCHANTER)
	   SayRandomBotMessage(32);
         else if (GetClass() == BARD)
	    SayRandomBotMessage(33);
        } 
      SetBotMezzer(false);
      } 
      else if((GetManaRatio() > 0) && (GetManaRatio() < 5)){ //Engaged OOM
        if (MakeRandomInt(1,100) < 10){
         if (GetClass() == CLERIC)
	   SayRandomBotMessage(12);
         else
	   SayRandomBotMessage(13);
         }
       }
      else if ((!((int)GetManaRatio() % 12)) && ((int)GetManaRatio() < 5)){ //Engaged Low mana
        if (MakeRandomInt(1,100) < 10){
          if (GetClass() == CLERIC){ 
  	    if (GetHP() < 100)
	     SayRandomBotMessage(14);
            else
	     SayRandomBotMessage(15);
          }
        SayRandomBotMessage(16);
       }
      }
      else {  //Engaged casters
        if (MakeRandomInt(1,120) < 3){
          if (GetClass() == CLERIC){
	    if (GetHP() < 100)
	     SayRandomBotMessage(24);
            else
	     SayRandomBotMessage(25);
	    }
          else
	   SayRandomBotMessage(26);
          }
        }
       SetCasterEngaged(false);
      }
    }
   else if ((folloWing) && (!IsATaunter())){
    if (MakeRandomInt(1,420) < 2){
      if (zoNe == 58)
       SayRandomBotMessage(17);
      else if (zoNe == 44)
       SayRandomBotMessage(18);
      else if (zoNe == 54)
       SayRandomBotMessage(21);
      else if (zoNe == 56)
       SayRandomBotMessage(22);
      else if(GetClass() == BARD)
	SayRandomBotMessage(20);
      else if (outDoor)
       SayRandomBotMessage(23);
      else if (!outDoor)
       SayRandomBotMessage(19);
    }
   }
  }
};
*/

#endif //EQBOTS