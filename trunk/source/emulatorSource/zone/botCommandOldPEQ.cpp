/*	EQEMu:	Everquest Server Emulator
Copyright (C) 2001-2002	EQEMu Development Team (http://eqemulator.net)

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
*/

/*

	solar: file created 9/20/03
	
	To add a new command 3 things must be done:
	
	1.  At the bottom of command.h you must add a prototype for it.
	2.  Add the function in this file.
	3.  In the command_init function you must add a call to command_add
	    for your function.  If you want an alias for your command, add
	    a second call to command_add with the descriptin and access args
	    set to NULL and 0 respectively since they aren't used when adding
	    an alias.  The function pointers being equal is makes it an alias.
	    The access level you set with command_add is only a default if
	    the command isn't listed in the addon.ini file.

*/

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
#include "../common/patches/patches.h"

#ifdef EQBOTS

//EQoffline
#include "botRaids.h"

#endif //EQBOTS

// these should be in the headers...
extern WorldServer worldserver;	
extern bool spells_loaded;
extern TaskManager *taskmanager;

#ifdef EMBPERL 
//this should probably be broken up to allow one define to build a ver that _only_ allows plugins
//instead of building both plugins and expression support
const static int PERL_PRIVS = 200; //what admin status is required to use perl?  Think carefully.  If you use low values, you should consider looking into taint and changing the root and etc... (and making a seperate embperl instance)
#include "embperl.h"
#include "embparser.h"
#endif //EMBPERL_PLUGIN

#include "StringIDs.h"
#include "command.h"

//struct cl_struct *commandlist;	// the actual linked list of commands
int commandcount;								// how many commands we have

// this is the pointer to the dispatch function, updated once
// init has been performed to point at the real function
int (*command_dispatch)(Client *,char const *)=command_notavail;


void command_bestz(Client *c, const Seperator *message);
void command_pf(Client *c, const Seperator *message);

map<string, CommandRecord *> commandlist;

//All allocated CommandRecords get put in here so they get deleted on shutdown
LinkedList<CommandRecord *> cleanup_commandlist;


/*
 * command_notavail
 * This is the default dispatch function when commands aren't loaded.
 *
 * Parameters:
 *	 not used
 *
 */
int command_notavail(Client *c, const char *message)
{
	c->Message(13, "Commands not available.");
	return -1;
}

/*****************************************************************************/
/*  the rest below here could be in a dynamically loaded module eventually   */
/*****************************************************************************/

/*

Access Levels:

0		Normal
10	* Steward *
20	* Apprentice Guide *
50	* Guide *
80	* QuestTroupe *
81	* Senior Guide *
85	* GM-Tester *
90	* EQ Support *
95	* GM-Staff *
100	* GM-Admin *
150	* GM-Lead Admin *
160	* QuestMaster *
170	* GM-Areas *
180	* GM-Coder *
200	* GM-Mgmt *
250	* GM-Impossible *

*/

/*
 * command_init
 * initializes the command list, call at startup
 *
 * Parameters:
 *	 none
 *
 * When adding a command, if it's the first time that function pointer is
 * used it is a new command.  If that function pointer is used for another
 * command, the command is added as an alias; description and access level
 * are not used and can be NULL.
 *
 */
int command_init(void) {
	if
	(
		command_add("resetaa","Resets a Player's AA in their profile.",200,command_resetaa) ||
		command_add("bind","Sets your targets bind spot to their current location",200,command_bind) ||
		command_add("sendop","[opcode] - LE's Private test command, leave it alone",200,command_sendop) ||
		command_add("optest","solar's private test command",255,command_optest) ||
		command_add("setstat","Sets the stats to a specific value.",255,command_setstat) ||
		command_add("incstat","Increases or Decreases a client's stats permanently.",200,command_incstat) ||
		command_add("help","[search term] - List available commands and their description, specify partial command as argument to search",0,command_help) ||
		command_add("version","- Display current version of EQEmu server",0,command_version) ||
		command_add("eitem","- Changes item stats",200,command_eitem) ||
		command_add("setfaction","[faction number] - Sets targeted NPC's faction in the database",170,command_setfaction) ||
		command_add("serversidename","- Prints target's server side name",0,command_serversidename) ||
		command_add("testspawn","[memloc] [value] - spawns a NPC for you only, with the specified values set in the spawn struct",200,command_testspawn) ||
		command_add("testspawnkill","- Sends an OP_Death packet for spawn made with #testspawn",200,command_testspawnkill) ||
		command_add("wc","[wear slot] [material] - Sends an OP_WearChange for your target",200,command_wc) ||
		command_add("numauths","- TODO: describe this command",200,command_numauths) ||
		command_add("setanim","[animnum] - Set target's appearance to animnum",200,command_setanim) ||
		command_add("connectworldserver","- Make zone attempt to connect to worldserver",200,command_connectworldserver) ||
		command_add("connectworld",NULL,0,command_connectworldserver) ||
		command_add("serverinfo","- Get OS info about server host",200,command_serverinfo) ||
		command_add("crashtest","- Crash the zoneserver",200,command_crashtest) ||
		command_add("getvariable","[varname] - Get the value of a variable from the database",200,command_getvariable) ||
		command_add("chat","[channel num] [message] - Send a channel message to all zones",200,command_chat) ||
		command_add("showpetspell","[spellid/searchstring] - search pet summoning spells",200,command_showpetspell) ||
	#ifdef IPC
		command_add("ipc","- Toggle an NPC's interactive flag",200,command_ipc) ||
	#endif
		command_add("npcloot","[show/money/add/remove] [itemid/all/money: pp gp sp cp] - Manipulate the loot an NPC is carrying",80,command_npcloot) ||
		command_add("log","- Search character event log",80,command_log) ||
		command_add("gm","- Turn player target's or your GM flag on or off",80,command_gm) ||
		command_add("summon","[charname] - Summons your player/npc/corpse target, or charname if specified",80,command_summon) || 
		command_add("zone","[zonename] [x] [y] [z] - Go to specified zone (coords optional)",50,command_zone) ||
            command_add("peqzone","[zonename] - Go to specified zone, if you have > 75% health",0,command_peqzone) ||
		command_add("showbuffs","- List buffs active on your target or you if no target",50,command_showbuffs) ||
		command_add("movechar","[charname] [zonename] - Move charname to zonename",50,command_movechar) ||
		command_add("viewpetition","[petition number] - View a petition",20,command_viewpetition) ||
		command_add("petitioninfo","[petition number] - Get info about a petition",20,command_petitioninfo) ||
		command_add("delpetition","[petition number] - Delete a petition",20,command_delpetition) ||
		command_add("listnpcs","[name/range] - Search NPCs",20,command_listnpcs) ||
		command_add("date","[yyyy] [mm] [dd] [HH] [MM] - Set EQ time",90,command_date) ||
		command_add("time","[HH] [MM] - Set EQ time",90,command_time) ||
		command_add("timezone","[HH] [MM] - Set timezone. Minutes are optional",90,command_timezone) ||
		command_add("synctod","- Send a time of day update to every client in zone",90,command_synctod) ||
		command_add("invulnerable","[on/off] - Turn player target's or your invulnerable flag on or off",80,command_invul) ||
		command_add("invul",NULL,0,command_invul) ||
		command_add("hideme","[on/off] - Hide yourself from spawn lists.",80,command_hideme) ||
		command_add("gmhideme",NULL,0,command_hideme) ||
		command_add("emote","['name'/'world'/'zone'] [type] [message] - Send an emote message",80,command_emote) ||
		command_add("fov","- Check wether you're behind or in your target's field of view",80,command_fov) ||
		command_add("manastat","- Report your or your target's cur/max mana",80,command_manastat) ||
		command_add("npcstats","- Show stats about target NPC",80,command_npcstats) ||
		command_add("zclip","[min] [max] - modifies and resends zhdr packet",80,command_zclip) ||
		command_add("npccast","[targetname/entityid] [spellid] - Causes NPC target to cast spellid on targetname/entityid",80,command_npccast) ||
		command_add("zstats","- Show info about zone header",80,command_zstats) ||
		command_add("zsave"," - Saves zheader to the database",80,command_zsave) ||
		command_add("permaclass","[classnum] - Change your or your player target's class (target is disconnected)",80,command_permaclass) ||
		command_add("permarace","[racenum] - Change your or your player target's race (zone to take effect)",80,command_permarace) ||
		command_add("permagender","[gendernum] - Change your or your player target's gender (zone to take effect)",80,command_permagender) ||
		command_add("weather","[0/1/2/3] (Off/Rain/Snow/Manual) - Change the weather",80,command_weather) ||
		command_add("zheader","[zonename] - Load zheader for zonename from the database",80,command_zheader) ||
		command_add("zhdr",NULL,0,command_zheader) ||
		command_add("zsky","[skytype] - Change zone sky type",80,command_zsky) ||
		command_add("zcolor","[red] [green] [blue] - Change sky color",80,command_zcolor) ||
		command_add("zuwcoords","[z coord] - Set underworld coord",80,command_zuwcoords) ||
		command_add("zsafecoords","[x] [y] [z] - Set safe coords",80,command_zsafecoords) ||
		command_add("zunderworld","[zcoord] - Sets the underworld using zcoord",80,command_zunderworld) ||
		command_add("spon","- Sends OP_MemorizeSpell",80,command_spon) ||
		command_add("spoff","- Sends OP_ManaChange",80,command_spoff) ||
		command_add("itemtest","- merth's test function",250,command_itemtest) ||
		command_add("gassign","[id] - Assign targetted NPC to predefined wandering grid id",100,command_gassign) ||
		command_add("setitemstatus","[itemid] [status] - Set the minimum admin status required to use itemid",100,command_setitemstatus) ||
		command_add("ai","[factionid/spellslist/con/guard/roambox/stop/start] - Modify AI on NPC target",100,command_ai) ||
		command_add("worldshutdown","- Shut down world and all zones",200,command_worldshutdown) ||
		command_add("sendzonespawns","- Refresh spawn list for all clients in zone",150,command_sendzonespawns) ||
		command_add("dbspawn2","[spawngroup] [respawn] [variance] - Spawn an NPC from a predefined row in the spawn2 table",100,command_dbspawn2) ||
		command_add("copychar","[character name] [new character] [new account id] - Create a copy of a character",100,command_copychar) ||
		command_add("shutdown","- Shut this zone process down",150,command_shutdown) ||
		command_add("delacct","[accountname] - Delete an account",150,command_delacct) ||
		command_add("setpass","[accountname] [password] - Set local password for accountname",150,command_setpass) ||
		command_add("grid","[add/delete] [grid_num] [wandertype] [pausetype] - Create/delete a wandering grid",170,command_grid) ||
		command_add("wp","[add/delete] [grid_num] [pause] [wp_num] - Add/delete a waypoint to/from a wandering grid",170,command_wp) ||
		command_add("wpadd","[circular/random/patrol] [pause] - Add your current location as a waypoint to your NPC target's AI path",170,command_wpadd) ||
		command_add("wpinfo","- Show waypoint info about your NPC target",170,command_wpinfo) ||
		command_add("iplookup","[charname] - Look up IP address of charname",200,command_iplookup) ||
		command_add("size","[size] - Change size of you or your target",50,command_size) ||
		command_add("mana","- Fill your or your target's mana",50,command_mana) ||
		command_add("flymode","[0/1/2] - Set your or your player target's flymode to off/on/levitate",50,command_flymode) ||
		command_add("showskills","- Show the values of your or your player target's skills",50,command_showskills) ||
		command_add("findspell","[searchstring] - Search for a spell",50,command_findspell) ||
		command_add("spfind",NULL,0,command_findspell) ||
		command_add("castspell","[spellid] - Cast a spell",50,command_castspell) ||
		command_add("cast",NULL,0,command_castspell) ||
		command_add("setlanguage","[language ID] [value] - Set your target's language skillnum to value",50,command_setlanguage) ||
		command_add("setskill","[skillnum] [value] - Set your target's skill skillnum to value",50,command_setskill) ||
		command_add("setskillall","[value] - Set all of your target's skills to value",50,command_setskillall) ||
		command_add("setallskill",NULL,0,command_setskillall) ||
		command_add("race","[racenum] - Change your or your target's race.  Use racenum 0 to return to normal",50,command_race) ||
		command_add("gender","[0/1/2] - Change your or your target's  gender to male/female/neuter",50,command_gender) ||
		command_add("makepet","[level] [class] [race] [texture] - Make a pet",50,command_makepet) ||
		command_add("level","[level] - Set your or your target's level",10,command_level) ||
		command_add("spawn","[name] [race] [level] [material] [hp] [gender] [class] [priweapon] [secweapon] [merchantid] - Spawn an NPC",10,command_spawn) ||
		command_add("texture","[texture] [helmtexture] - Change your or your target's appearance, use 255 to show equipment",10,command_texture) ||
		command_add("npctypespawn","[npctypeid] [factionid] - Spawn an NPC from the db",10,command_npctypespawn) ||
		command_add("dbspawn",NULL,0,command_npctypespawn) ||
		command_add("heal","- Completely heal your target",10,command_heal) ||
		command_add("appearance","[type] [value] - Send an appearance packet for you or your target",150,command_appearance) ||
		command_add("charbackup","[list/restore] - Query or restore character backups",150,command_charbackup) ||
		command_add("nukeitem","[itemid] - Remove itemid from your player target's inventory",150,command_nukeitem) ||
		command_add("peekinv","[worn/cursor/inv/bank/trade/all] - Print out contents of your player target's inventory",100,command_peekinv) ||
		command_add("findnpctype","[search criteria] - Search database NPC types",100,command_findnpctype) ||
		command_add("viewnpctype","[npctype id] - Show info about an npctype",100,command_viewnpctype) ||
		command_add("reloadstatic","- Reload Static Zone Data",150,command_reloadstatic) ||
		command_add("reloadquest","- Clear quest cache",150,command_reloadqst) ||
		command_add("reloadqst",NULL,0,command_reloadqst) ||
		command_add("reloadpl",NULL,0,command_reloadqst) ||
		command_add("reloadzonepoints","- Reload zone points from database",150,command_reloadzps) ||
		command_add("reloadzps",NULL,0,command_reloadzps) ||
		command_add("zoneshutdown","[shortname] - Shut down a zone server",150,command_zoneshutdown) ||
		command_add("zonebootup","[ZoneServerID] [shortname] - Make a zone server boot a specific zone",150,command_zonebootup) ||
		command_add("kick","[charname] - Disconnect charname",150,command_kick) ||
		command_add("attack","[targetname] - Make your NPC target attack targetname",150,command_attack) ||
		command_add("lock","- Lock the worldserver",150,command_lock) ||
		command_add("unlock","- Unlock the worldserver",150,command_unlock) ||
		command_add("motd","[new motd] - Set message of the day",150,command_motd) ||
		command_add("listpetition","- List petitions",50,command_listpetition) ||
		command_add("equipitem","[slotid(0-21)] - Equip the item on your cursor into the specified slot",50,command_equipitem) ||
		command_add("zonelock","[list/lock/unlock] - Set/query lock flag for zoneservers",100,command_zonelock) ||
		command_add("corpse","- Manipulate corpses, use with no arguments for help",50,command_corpse) ||
		command_add("fixmob","[nextrace|prevrace|gender|nexttexture|prevtexture|nexthelm|prevhelm] - Manipulate appearance of your NPC target",100,command_fixmob) ||
		command_add("gmspeed","[on/off] - Turn GM speed hack on/off for you or your player target",100,command_gmspeed) ||
		command_add("title","[text] - Set your or your player target's title",50,command_title) ||
		command_add("spellinfo","[spellid] - Get detailed info about a spell",10,command_spellinfo) ||
		command_add("lastname","[new lastname] - Set your or your player target's lastname",50,command_lastname) ||
		command_add("memspell","[slotid] [spellid] - Memorize spellid in the specified slot",50,command_memspell) ||
		command_add("save","- Force your player or player corpse target to be saved to the database",50,command_save) ||
		command_add("showstats","- Show details about you or your target",50,command_showstats) ||
		command_add("depop","- Depop your NPC target",50,command_depop) ||
		command_add("depopzone","- Depop the zone",100,command_depopzone) ||
		command_add("repop","[delay] - Repop the zone with optional delay",100,command_repop) ||
		command_add("spawnstatus","- Show respawn timer status",100,command_spawnstatus) ||
		command_add("nukebuffs","- Strip all buffs on you or your target",50,command_nukebuffs) ||
		command_add("freeze","- Freeze your target",80,command_freeze) ||
		command_add("unfreeze","- Unfreeze your target",80,command_unfreeze) ||
		command_add("pvp","[on/off] - Set your or your player target's PVP status",100,command_pvp) ||
		command_add("setxp","[value] - Set your or your player target's experience",100,command_setxp) ||
		command_add("setexp",NULL,0,command_setxp) ||
		command_add("setaaxp","[value] - Set your or your player target's AA experience",100,command_setaaxp) ||
		command_add("setaaexp",NULL,0,command_setaaxp) ||
		command_add("setaapts","[value] - Set your or your player target's available AA points",100,command_setaapts) ||
		command_add("setaapoints",NULL,0,command_setaapts) ||
		command_add("name","[newname] - Rename your player target",150,command_name) ||
		command_add("npcspecialattk","[flagchar] [perm] - Set NPC special attack flags.  Flags are E(nrage) F(lurry) R(ampage) S(ummon).",80,command_npcspecialattk) ||
		command_add("npcspecialattack",NULL,0,command_npcspecialattk) ||
		command_add("npcspecialatk",NULL,0,command_npcspecialattk) ||
		command_add("kill","- Kill your target",100,command_kill) ||
		command_add("haste","[percentage] - Set your haste percentage",100,command_haste) ||
		command_add("damage","[amount] - Damage your target",100,command_damage) ||
		command_add("zonespawn","- Not implemented",250,command_zonespawn) ||
		command_add("npcspawn","[create/add/update/remove/delete] - Manipulate spawn DB",170,command_npcspawn) ||
		command_add("spawnfix","- Find targeted NPC in database based on its X/Y/heading and update the database to make it spawn at your current location/heading.",170,command_spawnfix) ||
		command_add("npcedit","[column] [value] - Mega NPC editing command",100,command_npcedit) ||
		command_add("qglobal","[on/off/view] - Toggles qglobal functionality on an NPC",100,command_qglobal) ||
		command_add("loc","- Print out your or your target's current location and heading",0,command_loc) ||
		command_add("goto","[x] [y] [z] - Teleport to the provided coordinates or to your target",10,command_goto) ||
#ifdef BUGTRACK
		command_add("bugtrack","[bug description] - Report a bug",0,command_bug) ||
#endif
#ifdef EMBPERL_PLUGIN
#ifdef EMBPERL_EVAL_COMMANDS
		command_add("plugin","(sub) [args] - execute a plugin",PERL_PRIVS,command_embperl_plugin) ||
		command_add("peval","(expression) - execute some perl",PERL_PRIVS,command_embperl_eval) ||
#endif //EMBPERL_EVAL_COMMANDS
#endif //EMBPERL_PLUGIN
		command_add("iteminfo","- Get information about the item on your cursor",10,command_iteminfo) ||
		command_add("uptime","[zone server id] - Get uptime of worldserver, or zone server if argument provided",10,command_uptime) ||
		command_add("flag","[status] [acctname] - Refresh your admin status, or set an account's admin status if arguments provided",0,command_flag) ||
		command_add("guild","- Guild manipulation commands.  Use argument help for more info.",10,command_guild) ||
		command_add("guilds",NULL,0,command_guild) ||
		command_add("zonestatus","- Show connected zoneservers, synonymous with /servers",150,command_zonestatus) ||
		command_add("manaburn","- Use AA Wizard class skill manaburn on target",10,command_manaburn) ||
		command_add("viewmessage","[id] - View messages in your tell queue",100,command_viewmessage) ||
		command_add("viewmessages",NULL,0,command_viewmessage) ||
		command_add("doanim","[animnum] [type] - Send an EmoteAnim for you or your target",50,command_doanim) ||
		command_add("face","TODO: describe this command",250,command_face) ||
		command_add("scribespells","[level] - Scribe all spells for you or your player target that are usable by them, up to level specified. (may freeze client for a few seconds)",150,command_scribespells) ||
		command_add("unscribespells","Clear out your or your player target's spell book.",180,command_unscribespells) ||
		command_add("scribespell", "[spellid] - Scribe specified spell in your target's spell book.", 180, command_scribespell) ||
		command_add("unscribespell", "[spellid] - Unscribe specified spell from your target's spell book.", 180, command_unscribespell) ||
		command_add("interrupt","[message id] [color] - Interrupt your casting.  Arguments are optional.",50,command_interrupt) ||
		command_add("d1","[type] [spell] [damage] - Send an OP_Action packet with the specified values",200,command_d1) ||
		command_add("summonitem","[itemid] [charges] - Summon an item onto your cursor.  Charges are optional.",200,command_summonitem) ||
		command_add("si",NULL,200,command_summonitem) ||
		command_add("giveitem","[itemid] [charges] - Summon an item onto your target's cursor.  Charges are optional.",200,command_giveitem) ||
		command_add("gi",NULL,200,command_giveitem) ||
		command_add("itemsearch","[search criteria] - Search for an item",10,command_itemsearch) ||
		command_add("search",NULL,0,command_itemsearch) ||
		command_add("stun","[duration] - Stuns you or your target for duration",100,command_stun) ||
		command_add("finditem",NULL,0,command_itemsearch) ||
#ifdef PACKET_PROFILER
		command_add("packetprofile","- Dump packet profile for target or self.",250,command_packetprofile) || 
#endif
#ifdef EQPROFILE
		command_add("profiledump","- Dump profiling info to logs",250,command_profiledump) || 
		command_add("profilereset","- Reset profiling info",250,command_profilereset) || 
#endif

		command_add("opcode","- opcode management",250,command_opcode) || 
		command_add("logs","[status|normal|error|debug|quest|all] - Subscribe to a log type",250,command_logs) ||
		command_add("nologs","[status|normal|error|debug|quest|all] - Unsubscribe to a log type",250,command_nologs) ||
		command_add("datarate","[rate] - Query/set datarate",100,command_datarate) ||
		command_add("ban","[name] - Ban by character name",150,command_ban) ||
		command_add("ipban","[IP address] - Ban IP by character name",200,command_ipban) ||
		command_add("oocmute","[1/0] - Mutes OOC chat",200,command_oocmute) ||
		command_add("revoke","[charname] [1/0] - Makes charname unable to talk on OOC",200,command_revoke) ||
		command_add("checklos","- Check for line of sight to your target",50,command_checklos) ||
		command_add("los",NULL,0,command_checklos) ||
		command_add("setadventurepoints","- Set your or your player target's available adventure points",150,command_set_adventure_points) ||
		command_add("npcsay","[message] - Make your NPC target say a message.",150,command_npcsay) ||
		command_add("npcshout","[message] - Make your NPC target shout a message.",150,command_npcshout) ||
		command_add("timers","- Display persisten timers for target",200,command_timers) ||
		command_add("hp","- Refresh your HP bar from the server.",0,command_hp) ||
		command_add("pf","- ",0,command_pf) ||
		command_add("logsql","- enable SQL logging",200,command_logsql) ||
		command_add("bestz","- Ask map for a good Z coord for your x,y coords.",0,command_bestz) ||
		command_add("ginfo","- get group info on target.",20,command_ginfo) ||
		command_add("fear","- view and edit fear grids and hints",200,command_fear) ||
		command_add("path","- view and edit pathing",200,command_path) ||
		command_add("flags","- displays the flags of you or your target",0,command_flags) ||
		command_add("flagedit","- Edit zone flags on your target",100,command_flagedit) ||
		command_add("mlog","- Manage log settings",250,command_mlog) ||
		command_add("aggro","(range) [-v] - Display aggro information for all mobs 'range' distance from your target. -v is verbose faction info.",80,command_aggro) ||
		command_add("hatelist"," - Display hate list for target.", 80,command_hatelist) ||
		command_add("npcemote","[message] - Make your NPC target emote a message.",150,command_npcemote) ||
		command_add("serverrules","- Read this server's rules",0,command_serverrules) ||
		command_add("acceptrules","[acceptrules] - Accept the EQEmu Agreement",0,command_acceptrules) ||
		command_add("rules","(subcommand) - Manage server rules", 250, command_rules) ||
		command_add("task","(subcommand) - Task system commands", 150, command_task) ||
		command_add("guildcreate","[guildname] - Creates an approval setup for guild name specified",0,command_guildcreate) ||
		command_add("guildapprove","[guildapproveid] - Approve a guild with specified ID (guild creator receives the id)",0,command_guildapprove) ||
		command_add("guildlist","[guildapproveid] - Lists character names who have approved the guild specified by the approve id",0,command_guildlist) ||
		command_add("altactivate", "[argument] - activates alternate advancement abilities, use altactivate help for more information", 0, command_altactivate) ||
		command_add("refundaa", "Refunds your target's AA points, will disconnect them in the process as well.", 100, command_refundaa) ||

#ifdef EQBOTS

		command_add("bot"," Type \"#bot help\" to the see the list of available commands for bots.", 0, command_bot) ||

#endif //EQBOTS

		command_add("traindisc","[level] - Trains all the disciplines usable by the target, up to level specified. (may freeze client for a few seconds)",150,command_traindisc) ||
		command_add("setgraveyard","[zone name] - Creates a graveyard for the specified zone based on your target's LOC.", 200, command_setgraveyard) ||
		command_add("deletegraveyard","[zone name] - Deletes the graveyard for the specified zone.", 200, command_deletegraveyard) ||
		command_add("getplayerburriedcorpsecount","- Get the target's total number of burried player corpses.", 100, command_getplayerburriedcorpsecount) ||
		command_add("summonburriedplayercorpse","- Summons the target's oldest burried corpse, if any exist.", 100, command_summonburriedplayercorpse) ||
		command_add("refreshgroup","- Refreshes Group.", 0, command_refreshgroup) ||
command_add("advnpcspawn","[maketype|makegroup|addgroupentry|addgroupspawn][removegroupspawn|movespawn|editgroupbox|cleargroupbox]",150,command_advnpcspawn)	
		)
	{
		command_deinit();
		return -1;
	}
	
	map<string, CommandRecord *>::iterator cur,end;
	cur = commandlist.begin();
	end = commandlist.end();
	map<string,uint8> command_settings;
	map<string,uint8>::iterator itr;
	database.GetCommandSettings(command_settings);
	for(; cur != end; cur++) {
		if ((itr=command_settings.find(cur->first))!=command_settings.end())
		{
			cur->second->access = itr->second;
#if EQDEBUG >=5
			LogFile->write(EQEMuLog::Debug, "command_init(): - Command '%s' set to access level %d." , cur->first.c_str(), itr->second);
#endif
		}
		else
		{
#ifdef COMMANDS_WARNINGS
			if(cur->second->access == 0)
				LogFile->write(EQEMuLog::Status, "command_init(): Warning: Command '%s' defaulting to access level 0!" , cur->first.c_str());
#endif
		}
	}
	
	command_dispatch = command_realdispatch;

	return commandcount;
}

/*
 * command_deinit
 * clears the command list, freeing resources
 *
 * Parameters:
 *	 none
 *
 */
void command_deinit(void)
{
/*	LinkedListIterator<CommandRecord *> cur(cleanup_commandlist);
	while(cur.MoreElements()) {
		CommandRecord *tmp = cur.GetData();
		safe_delete(tmp);
		cur.Advance();
	}
*/	commandlist.clear();
	
	command_dispatch = command_notavail;
	commandcount = 0;
}

/*
 * command_add
 * adds a command to the command list; used by command_init
 *
 * Parameters:
 *	 command_string	- the command ex: "spawn"
 *	 desc		- text description of command for #help
 *	 access		- default access level required to use command
 *	 function		- pointer to function that handles command
 *
 */
int command_add(const char *command_string, const char *desc, int access, CmdFuncPtr function)
{
	if(function == NULL)
		return(-1);
	
	string cstr(command_string);
	
	if(commandlist.count(cstr) != 0) {
		LogFile->write(EQEMuLog::Error, "command_add() - Command '%s' is a duplicate - check command.cpp." , command_string);
		return(-1);
	}
	
	//look for aliases...
	map<string, CommandRecord *>::iterator cur,end,del;
	cur = commandlist.begin();
	end = commandlist.end();
	for(; cur != end; cur++) {
		if(cur->second->function == function) {
			int r;
			for(r = 1; r < CMDALIASES; r++) {
				if(cur->second->command[r] == NULL) {
					cur->second->command[r] = command_string;
					break;
				}
			}
			commandlist[cstr] = cur->second;
			return(0);
		}
	}
	
	CommandRecord *c = new CommandRecord;
	cleanup_commandlist.Append(c);
	c->desc = desc;
	c->access = access;
	c->function = function;
	memset(c->command, 0, sizeof(c->command));
	c->command[0] = command_string;
	
	commandlist[cstr] = c;
	
	commandcount++;
	return 0;
}


#ifdef EMBPERL_COMMANDS
/*
 * command_add_perl
 * adds a command to the command list, as a perl function
 *
 * Parameters:
 *	 command_string	- the command ex: "spawn"
 *	 desc		- text description of command for #help
 *	 access		- default access level required to use command
 *
 */
int command_add_perl(const char *command_string, const char *desc, int access) {
	string cstr(command_string);

	if(commandlist.count(cstr) != 0) {
#ifdef COMMANDS_PERL_OVERRIDE
		//print a warning so people dont get too confused when this happens
		LogFile->write(EQEMuLog::Status, "command_add_perl() - Perl Command '%s' is overriding the compiled command." , command_string);	
		CommandRecord *tmp = commandlist[cstr];
		safe_delete(tmp);
#else
		LogFile->write(EQEMuLog::Error, "command_add_perl() - Command '%s' is a duplicate - check commands.pl." , command_string);
		return(-1);
#endif
	}
	
	CommandRecord *c = new CommandRecord;
	c->desc = desc;
	c->access = access;
	c->function = NULL;
	
	commandlist[cstr] = c;
	
	commandcount++;
	return 0;

}

//clear out any perl commands.
//should restore any overridden C++ commands, but thats a lot of work.
void command_clear_perl() {
	map<string, CommandRecord *>::iterator cur,end,del;
	cur = commandlist.begin();
	end = commandlist.end();
	for(; cur != end;) {
		del = cur;
		cur++;
		if(del->second->function == NULL) {
			safe_delete(del->second);
			commandlist.erase(del);
		}
	}
}

#endif //EMBPERL_COMMANDS


/*
 *
 * command_realdispatch
 * Calls the correct function to process the client's command string.
 * Called from Client::ChannelMessageReceived if message starts with
 * command character (#).
 *
 * Parameters:
 *	 c			- pointer to the calling client object
 *	 message		- what the client typed
 *
 */
int command_realdispatch(Client *c, const char *message)
{
	_ZP(command_realdispatch);
	
	
    Seperator sep(message, ' ', 10, 100, true); //changed by Eglin: "three word argument" should be considered 1 arg
	
	command_logcommand(c, message);
	
	string cstr(sep.arg[0]+1);
	
	if(commandlist.count(cstr) != 1) {
		c->Message(13, "Command '%s' not recognized.", sep.arg[0]+1);
		return(-1);
	}
	
	CommandRecord *cur = commandlist[cstr];
	if(c->Admin() < cur->access){
		c->Message(13,"Your access level is not high enough to use this command.");
		return(-1);
	}
	
#ifdef COMMANDS_LOGGING
	if(cur->access >= COMMANDS_LOGGING_MIN_STATUS) {
		LogFile->write(EQEMuLog::Commands, "%s (%s) used command: %s (target=%s)", c->GetName(), c->AccountName(), message, c->GetTarget()?c->GetTarget()->GetName():"NONE");
	}
#endif
	
	if(cur->function == NULL) {
#ifdef EMBPERL_COMMANDS
		//dispatch perl command
		PerlembParser *embparse = (PerlembParser *) parse;
		embparse->ExecCommand(c, &sep);
#else
		LogFile->write(EQEMuLog::Error, "Command '%s' has a null function, but perl commands are diabled!\n", cstr.c_str());
		return(-1);
#endif
	} else {
		//dispatch C++ command
		cur->function(c, &sep);	// dispatch command
	}
	return 0;
	
}

void command_logcommand(Client *c, const char *message)
{
	int admin=c->Admin();

	bool continueevents=false;
	switch (zone->loglevelvar){ //catch failsafe
		case 9: { // log only LeadGM
			if ((admin>= 150) && (admin <200))
				continueevents=true;
			break;
		}
		case 8: { // log only GM
			if ((admin>= 100) && (admin <150))
				continueevents=true;
			break;
		}
		case 1: {
			if ((admin>= 200))
				continueevents=true;
			break;
		}
		case 2: {
			if ((admin>= 150))
				continueevents=true;
			break;
		}
		case 3: {
			if ((admin>= 100))
				continueevents=true;
			break;
		}
		case 4: {
			if ((admin>= 80))
				continueevents=true;
			break;
		}
		case 5: {
			if ((admin>= 20))
				continueevents=true;
			break;
		}
		case 6: {
			if ((admin>= 10))
				continueevents=true;
			break;
		}
		case 7: {
				continueevents=true;
				break;
		}
	}
	
	if (continueevents)
		database.logevents(
			c->AccountName(),
			c->AccountID(),
			admin,c->GetName(),
			c->GetTarget()?c->GetTarget()->GetName():"None",
			"Command",
			message,
			1
		);
}


/*
 * commands go below here
 */
void command_setstat(Client* c, const Seperator* sep){
	if(sep->arg[1][0] && sep->arg[2][0] && c->GetTarget()!=0 && c->GetTarget()->IsClient()){
		c->GetTarget()->CastToClient()->SetStats(atoi(sep->arg[1]),atoi(sep->arg[2]));
	}
	else{
		c->Message(0,"This command is used to permanently increase or decrease a players stats.");
		c->Message(0,"Usage: #setstat {type} {value the stat should be}");
		c->Message(0,"Types: Str: 0, Sta: 1, Agi: 2, Dex: 3, Int: 4, Wis: 5, Cha: 6");
	}
}

void command_incstat(Client* c, const Seperator* sep){
	if(sep->arg[1][0] && sep->arg[2][0] && c->GetTarget()!=0 && c->GetTarget()->IsClient()){
		c->GetTarget()->CastToClient()->IncStats(atoi(sep->arg[1]),atoi(sep->arg[2]));
	}
	else{
		c->Message(0,"This command is used to permanently increase or decrease a players stats.");
		c->Message(0,"Usage: #setstat {type} {value by which to increase or decrease}");
		c->Message(0,"Note: The value is in increments of 2, so a value of 3 will actually increase the stat by 6");
		c->Message(0,"Types: Str: 0, Sta: 1, Agi: 2, Dex: 3, Int: 4, Wis: 5, Cha: 6");
	}
}

void command_resetaa(Client* c,const Seperator *sep){
	if(c->GetTarget()!=0 && c->GetTarget()->IsClient()){
		c->GetTarget()->CastToClient()->ResetAA();
		c->Message(13,"Successfully reset %s's AAs",c->GetTarget()->GetName());
	}
	else
		c->Message(0,"Usage: Target a client and use #resetaa to reset the AA data in their Profile.");
}

void command_sendop(Client *c,const Seperator *sep){

	// This part of the patch was just to allow me to test the rez confirmation box.
	// #sendop <spellid> with the various rez spells to see the box with % rez included.
	
	int RezSpell = 0;

	if(sep->arg[1][0]) {
		RezSpell = atoi(sep->arg[1]);
	}

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_RezzRequest, sizeof(Resurrect_Struct));
	Resurrect_Struct *rs = (Resurrect_Struct*)outapp->pBuffer;

	strcpy(rs->your_name, c->GetName());
	strcpy(rs->rezzer_name, "A Cleric01");
	rs->spellid = RezSpell;
	DumpPacket(outapp);
	c->QueuePacket(outapp);
	safe_delete(outapp);
	return;

	/*if(sep->arg[1][0] && sep->arg[2][0])
	{
		c->Message_StringID(atoi(sep->arg[1]),atoi(sep->arg[2]),sep->arg[3],sep->arg[4],sep->arg[5],sep->arg[6],sep->arg[7],sep->arg[8]);
	}
	else
		c->Message(0,"type,string id, message1...");*/
	/*
		clientupdate lvl and such
			int32	level; //new level


	*/


      /*
	if(sep->arg[1][0] && sep->arg[2][0]){
		EQApplicationPacket* outapp = new EQApplicationPacket((EmuOpcode)atoi(sep->arg[1]),sizeof(GMName_Struct));
		GMName_Struct* gms=(GMName_Struct*)outapp->pBuffer;
		memset(outapp->pBuffer,0,outapp->size);
		strcpy(gms->gmname,c->GetName());
		strcpy(gms->oldname,c->GetName());
		strcpy(gms->newname,sep->arg[3]);
		if(sep->arg[4][0])
			gms->badname=atoi(sep->arg[4]);
		c->QueuePacket(outapp);
		safe_delete(outapp);
	}
      */
	/*
		else{
			EQApplicationPacket* outapp = new EQApplicationPacket(121,atoi(sep->arg[2]));
			memset(outapp->pBuffer,0,outapp->size);
			int8 offset=atoi(sep->arg[3]);
			if(offset<outapp->size && sep->arg[4][0])
				outapp->pBuffer[offset]=atoi(sep->arg[4]);
			offset++;
			if(offset<outapp->size && sep->arg[5][0])
				outapp->pBuffer[offset+3]=atoi(sep->arg[5]);
			offset++;
			if(offset<outapp->size && sep->arg[6][0])
				outapp->pBuffer[offset+3]=atoi(sep->arg[6]);
			offset++;
			if(offset<outapp->size && sep->arg[7][0])
				outapp->pBuffer[offset]=atoi(sep->arg[7]);
			offset++;
			if(offset<outapp->size && sep->arg[8][0])
				outapp->pBuffer[offset]=atoi(sep->arg[8]);
			offset++;
			if(offset<outapp->size && sep->arg[9][0])
				outapp->pBuffer[offset]=atoi(sep->arg[9]);
			c->QueuePacket(outapp);
			safe_delete(outapp);
		}*/
		//c->SetStats(atoi(sep->arg[1]),atoi(sep->arg[2]));
	//}
		/*EQApplicationPacket* outapp = new EQApplicationPacket(atoi(sep->arg[1]), sizeof(PlayerAA_Struct));
		memcpy(outapp->pBuffer,c->GetAAStruct(),outapp->size);
		c->QueuePacket(outapp);
		safe_delete(outapp);
	}
	else
		c->Message(15,"Invalid opcode!");
		*/
	
}

void command_optest(Client *c, const Seperator *sep)
{
	EQApplicationPacket *outapp = new EQApplicationPacket(OP_MoneyUpdate, sizeof(MoneyUpdate_Struct));
	MoneyUpdate_Struct *mu = (MoneyUpdate_Struct *)outapp->pBuffer;
	mu->platinum = sep->arg[1][0] ? atoi(sep->arg[1]) : 0;
	mu->gold = sep->arg[2][0] ? atoi(sep->arg[2]): 0;
	mu->silver = sep->arg[3][0] ? atoi(sep->arg[3]) : 0;
	mu->copper = sep->arg[4][0] ? atoi(sep->arg[4]): 0;
	c->QueuePacket(outapp);
	safe_delete(outapp);

/*
	EQApplicationPacket outapp;
	if(sep->arg[1][0])
	{
		c->CreateDespawnPacket(&outapp);
	  DeleteSpawn_Struct* ds = (DeleteSpawn_Struct*)outapp.pBuffer;
    ds->spawn_id = 1000;
	}
	else
	{
		c->CreateSpawnPacket(&outapp, c);
	 	NewSpawn_Struct* ns = (NewSpawn_Struct*)outapp.pBuffer;
		ns->spawn.spawn_id = 1000;
		ns->spawn.npc = 0;
		ns->spawn.afk = 0xFF;
		strcpy(ns->spawn.name, "Testing");
		ns->spawn.x += 5;
		ns->spawn.y += 5;
	}

	entity_list.QueueClients(c, &outapp);
*/
	

/*
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_MemorizeSpell, sizeof(MemorizeSpell_Struct));
	MemorizeSpell_Struct* mem = (MemorizeSpell_Struct*)outapp->pBuffer;
	mem->slot = sep->arg[1][0] ? atoi(sep->arg[1]) : 0;
	mem->spell_id = sep->arg[2][0] ? atoi(sep->arg[2]) : 15;
	mem->scribing = 0;
	c->QueuePacket(outapp);

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_Action, sizeof(Action_Struct));
	Action_Struct *act = (Action_Struct *)outapp->pBuffer;
	act->target = c->GetTarget() ? c->GetTarget()->GetID() : c->GetID();
	act->source = c->GetID();
	act->level = sep->arg[3][0] ? atoi(sep->arg[3]) : c->GetLevel();
//	act->heading = sep->arg[4][0] ? atof(sep->arg[4]) : c->GetHeading() * 2;
	int val = hextoi(sep->arg[4]);
	memcpy(&act->heading, &val, 4);
	act->type = sep->arg[1][0] ? atoi(sep->arg[1]) : 0;
	act->spell = sep->arg[2][0] ? atoi(sep->arg[2]): 0;
	act->unknown29 = sep->arg[5][0] ? atoi(sep->arg[5]): 0;
	act->unknown23 = sep->arg[6][0] ? atoi(sep->arg[6]): 0;
	act->unknown18 = sep->arg[7][0] ? atoi(sep->arg[7]): 0;
	act->unknown16 = sep->arg[8][0] ? atoi(sep->arg[8]): 0;
	act->unknown08 = sep->arg[9][0] ? atoi(sep->arg[9]): 0;
	act->unknown06 = sep->arg[10][0] ? atoi(sep->arg[10]): 0x0A;
	c->QueuePacket(outapp);
	DumpPacket(outapp);
	printf("\n");
	safe_delete(outapp);
*/

/*
	EQApplicationPacket *outapp = new EQApplicationPacket(OP_MoveDoor, sizeof(MoveDoor_Struct));
	MoveDoor_Struct *md = (MoveDoor_Struct *)outapp->pBuffer;
	md->doorid = sep->arg[1][0] ? atoi(sep->arg[1]) : 0;
	md->action = sep->arg[2][0] ? atoi(sep->arg[2]): 0;
	entity_list.QueueClients(c, outapp);
	safe_delete(outapp);

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_Damage, sizeof(CombatDamage_Struct));
	CombatDamage_Struct *cd = (CombatDamage_Struct *)outapp->pBuffer;
	cd->target = c->GetTarget() ? c->GetTarget()->GetID() : c->GetID();
	cd->source = c->GetID();
	cd->type = sep->arg[1][0] ? atoi(sep->arg[1]) : 0;
	cd->spellid = sep->arg[2][0] ? atoi(sep->arg[2]) : 0;
	cd->damage = sep->arg[3][0] ? atoi(sep->arg[3]) : 0;
	cd->unknown15[0] = sep->arg[4][0] ? atoi(sep->arg[4]) : 0;
	cd->unknown15[1] = sep->arg[5][0] ? atoi(sep->arg[5]) : 0;
	cd->unknown19 = sep->arg[6][0] ? atoi(sep->arg[6]) : 0;
	entity_list.QueueClients(c, outapp);
	safe_delete(outapp);
*/
}

void command_help(Client *c, const Seperator *sep)
{
	int commands_shown=0;

	c->Message(0, "Available EQEMu commands:");
	
	map<string, CommandRecord *>::iterator cur,end;
	cur = commandlist.begin();
	end = commandlist.end();
	
	for(; cur != end; cur++) {
		if(sep->arg[1][0]) {		
			if(cur->first.find(sep->arg[1]) == string::npos) {
				continue;
			}
		}
		
		if(c->Admin() < cur->second->access)
			continue;
  		commands_shown++;
		c->Message(0, "	%c%s %s", COMMAND_CHAR, cur->first.c_str(), cur->second->desc == NULL?"":cur->second->desc);
	}
	c->Message(0, "%d command%s listed.", commands_shown, commands_shown!=1?"s":"");
	
}

void command_version(Client *c, const Seperator *sep)
{
	c->Message(0, "Current version information.");
	c->Message(0, "	%s", CURRENT_ZONE_VERSION);
	c->Message(0, "	Compiled on: %s at %s", COMPILE_DATE, COMPILE_TIME);
	c->Message(0, "	Last modified on: %s", LAST_MODIFIED);
}

void command_eitem(Client *c, const Seperator *sep)
{
#ifdef SHAREMEM
	c->Message(0, "Error: Function doesnt work in ShareMem mode");
#else
	char hehe[255];
	if(strstr(sep->arg[2],"classes"))
		snprintf(hehe,255,"%s %s",sep->arg[3],strstr(sep->argplus[0],sep->arg[3]));
	else
		strcpy(hehe,sep->arg[3]);
	database.SetItemAtt(sep->arg[2],hehe,atoi(sep->arg[1]));
#endif
}

void command_setfaction(Client *c, const Seperator *sep)
{
	if((sep->arg[1][0] == 0 || strcasecmp(sep->arg[1],"*")==0) || ((c->GetTarget()==0) || (c->GetTarget()->IsClient())))
		c->Message(0, "Usage: #setfaction [faction number]");
	else
	{
		char errbuf[MYSQL_ERRMSG_SIZE];
		char *query = 0;
		c->Message(15,"Setting NPC %u to faction %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->argplus[1]));
		database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set npc_faction_id=%i where id=%i",atoi(sep->argplus[1]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
		c->LogSQL(query);
		safe_delete_array(query);
	}
}

void command_serversidename(Client *c, const Seperator *sep)
{
	if(c->GetTarget())
		c->Message(0, c->GetTarget()->GetName());
	else
		c->Message(0, "Error: no target");
}

void command_testspawnkill(Client *c, const Seperator *sep)
{
/*	EQApplicationPacket* outapp = new EQApplicationPacket(OP_Death, sizeof(Death_Struct));
	Death_Struct* d = (Death_Struct*)outapp->pBuffer;
	d->corpseid = 1000;
	//	d->unknown011 = 0x05;
	d->spawn_id = 1000;
	d->killer_id = c->GetID();
	d->damage = 1;
	d->spell_id = 0;
	d->type = BASH;
	d->bindzoneid = 0;
	c->FastQueuePacket(&outapp);*/
}

void command_testspawn(Client *c, const Seperator *sep)
{
	if (sep->IsNumber(1)) {
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_NewSpawn, sizeof(NewSpawn_Struct));
		NewSpawn_Struct* ns = (NewSpawn_Struct*)outapp->pBuffer;
		c->FillSpawnStruct(ns, c);
		strcpy(ns->spawn.name, "Test");
		ns->spawn.spawnId = 1000;
		ns->spawn.NPC = 1;
		if (sep->IsHexNumber(2)) {
			if (strlen(sep->arg[2]) >= 3) // 0x00, 1 byte
				*(&((int8*) &ns->spawn)[atoi(sep->arg[1])]) = hextoi(sep->arg[2]);
			else if (strlen(sep->arg[2]) >= 5) // 0x0000, 2 bytes
				*((int16*) &(((int8*) &ns->spawn)[atoi(sep->arg[1])])) = hextoi(sep->arg[2]);
			else if (strlen(sep->arg[2]) >= 9) // 0x0000, 2 bytes
				*((int32*) &(((int8*) &ns->spawn)[atoi(sep->arg[1])])) = hextoi(sep->arg[2]);
			else
				c->Message(0, "Error: unexpected hex string length");
		}
		else {
			strcpy((char*) (&((int8*) &ns->spawn)[atoi(sep->arg[1])]), sep->argplus[2]);
		}
		EncryptSpawnPacket(outapp);
		c->FastQueuePacket(&outapp);
	}
	else
		c->Message(0, "Usage: #testspawn [memloc] [value] - spawns a NPC for you only, with the specified values set in the spawn struct");
}

void command_wc(Client *c, const Seperator *sep)
{
	if(sep->argnum < 2)
	{
		c->Message(0, "Usage: #wc [wear slot] [material]");
	}
	else if(c->GetTarget() == NULL) {
		c->Message(13, "You must have a target to do a wear change.");
	}
	else
	{
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_WearChange, sizeof(WearChange_Struct));
		WearChange_Struct* wc = (WearChange_Struct*)outapp->pBuffer;
		wc->spawn_id = c->GetTarget()->GetID();
		wc->wear_slot_id = atoi(sep->arg[1]);
		wc->material = atoi(sep->arg[2]);
		entity_list.QueueClients(c, outapp);
		safe_delete(outapp);
	}
}

void command_numauths(Client *c, const Seperator *sep)
{
	c->Message(0, "NumAuths: %i", zone->CountAuth());
	c->Message(0, "Your WID: %i", c->GetWID());
}

void command_setanim(Client *c, const Seperator *sep)
{
	if (c->GetTarget() && sep->IsNumber(1)) {
		int num = atoi(sep->arg[1]);
		if(num < 0 || num >= _eaMaxAppearance) {
		c->Message(0, "Invalid animation number, between 0 and %d", _eaMaxAppearance-1);
		}
		c->GetTarget()->SetAppearance(EmuAppearance(num));
	} else
		c->Message(0, "Usage: #setanim [animnum]");
}

void command_connectworldserver(Client *c, const Seperator *sep)
{
	if(worldserver.Connected())
		c->Message(0, "Error: Already connected to world server");
	else
	{
		c->Message(0, "Attempting to connect to world server...");
		worldserver.AsyncConnect();
	}
}

void command_serverinfo(Client *c, const Seperator *sep)
{
#ifdef WIN32
	char intbuffer [sizeof(unsigned long)];
	c->Message(0, "Operating system information.");
	c->Message(0, "	%s", Ver_name);
	c->Message(0, "	Build number: %s", ultoa(Ver_build, intbuffer, 10));
	c->Message(0, "	Minor version: %s", ultoa(Ver_min, intbuffer, 10));
	c->Message(0, "	Major version: %s", ultoa(Ver_maj, intbuffer, 10));
	c->Message(0, "	Platform Id: %s", ultoa(Ver_pid, intbuffer, 10));
#else
char buffer[255];
	c->Message(0, "Operating system information: %s",GetOS(buffer));
#endif
}

void command_crashtest(Client *c, const Seperator *sep)
{
	c->Message(0,"Alright, now we get an GPF ;) ");
	char* gpf=0;
	memcpy(gpf, "Ready to crash", 30);
}

void command_getvariable(Client *c, const Seperator *sep)
{
	char tmp[512];
	if (database.GetVariable(sep->argplus[1], tmp, sizeof(tmp)))
		c->Message(0, "%s = %s", sep->argplus[1], tmp);
	else
		c->Message(0, "GetVariable(%s) returned false", sep->argplus[1]);
}

void command_chat(Client *c, const Seperator *sep)
{
	if (sep->arg[2][0] == 0)
		c->Message(0, "Usage: #chat [channum] [message]");
	else
		if (!worldserver.SendChannelMessage(0, 0, (uint8) atoi(sep->arg[1]), 0, 0, sep->argplus[2]))
			c->Message(0, "Error: World server disconnected");
}

void command_showpetspell(Client *c, const Seperator *sep)
{
	if (sep->arg[1][0] == 0)
		c->Message(0, "Usage: #ShowPetSpells [spellid | searchstring]");
	else if (!spells_loaded)
		c->Message(0, "Spells not loaded");
	else if (Seperator::IsNumber(sep->argplus[1]))
	{
		int spellid = atoi(sep->argplus[1]);
		if (spellid <= 0 || spellid >= SPDAT_RECORDS)
			c->Message(0, "Error: Number out of range");
		else
			c->Message(0, "	%i: %s, %s", spellid, spells[spellid].teleport_zone, spells[spellid].name);
	}
	else
	{
		int count=0;
		char sName[64];
		char sCriteria[65];
		strncpy(sCriteria, sep->argplus[1], 64);
		strupr(sCriteria);
		for (int i = 0; i < SPDAT_RECORDS; i++)
		{
			if (spells[i].name[0] != 0 && (spells[i].effectid[0] == SE_SummonPet || spells[i].effectid[0] == SE_NecPet))
			{
				strcpy(sName, spells[i].teleport_zone);
				strupr(sName);
				char* pdest = strstr(sName, sCriteria);
				if ((pdest != NULL) && (count <=20))
				{
					c->Message(0, "	%i: %s, %s", i, spells[i].teleport_zone, spells[i].name);
					count++;
				}
				else if (count > 20)
					break;
			}
		}
		if (count > 20)
			c->Message(0, "20 spells found... max reached.");
		else
			c->Message(0, "%i spells found.", count);
	}
}

#ifdef IPC
void command_ipc(Client *c, const Seperator *sep)
{
	if (c->GetTarget() && c->GetTarget()->IsNPC())
	{
		if (c->GetTarget()->CastToNPC()->IsInteractive())
		{
			c->GetTarget()->CastToNPC()->interactive = false;
			c->Message(0, "Disabling IPC");
		}
		else
		{
			c->GetTarget()->CastToNPC()->interactive = true;
			c->Message(0, "Enabling IPC");
		}
	}
	else
		c->Message(0, "Error: You must target an NPC");
}
#endif /* IPC */

void command_npcloot(Client *c, const Seperator *sep)
{
	if (c->GetTarget() == 0)
		c->Message(0, "Error: No target");
	// #npcloot show
	else if (strcasecmp(sep->arg[1], "show") == 0)
	{
		if (c->GetTarget()->IsNPC())
			c->GetTarget()->CastToNPC()->QueryLoot(c);
		else if (c->GetTarget()->IsCorpse())
			c->GetTarget()->CastToCorpse()->QueryLoot(c);
		else
			c->Message(0, "Error: Target's type doesnt have loot");
	}
	// These 2 types are *BAD* for the next few commands
	else if (c->GetTarget()->IsClient() || c->GetTarget()->IsCorpse())
		c->Message(0, "Error: Invalid target type, try a NPC =).");
	// #npcloot add
	else if (strcasecmp(sep->arg[1], "add") == 0)
	{
		// #npcloot add item
		if (c->GetTarget()->IsNPC() && sep->IsNumber(2))
		{
			int32 item = atoi(sep->arg[2]);
			if (database.GetItem(item))
			{
				if (sep->arg[3][0] != 0 && sep->IsNumber(3))
					c->GetTarget()->CastToNPC()->AddItem(item, atoi(sep->arg[3]), 0);
				else
					c->GetTarget()->CastToNPC()->AddItem(item, 1, 0);
				c->Message(0, "Added item(%i) to the %s's loot.", item, c->GetTarget()->GetName());
			}
			else
				c->Message(0, "Error: #npcloot add: Item(%i) does not exist!", item);
		}
		else if (!sep->IsNumber(2))
			c->Message(0, "Error: #npcloot add: Itemid must be a number.");
		else
			c->Message(0, "Error: #npcloot add: This is not a valid target.");
	}
	// #npcloot remove
	else if (strcasecmp(sep->arg[1], "remove") == 0)
	{
		//#npcloot remove all
		if (strcasecmp(sep->arg[2], "all") == 0)
			c->Message(0, "Error: #npcloot remove all: Not yet implemented.");
		//#npcloot remove itemid
		else
		{
			if(c->GetTarget()->IsNPC() && sep->IsNumber(2))
			{
				int32 item = atoi(sep->arg[2]);
				c->GetTarget()->CastToNPC()->RemoveItem(item);
				c->Message(0, "Removed item(%i) from the %s's loot.", item, c->GetTarget()->GetName());
			}
			else if (!sep->IsNumber(2))
				c->Message(0, "Error: #npcloot remove: Item must be a number.");
			else
				c->Message(0, "Error: #npcloot remove: This is not a valid target.");
		}
	}
	// #npcloot money
	else if (strcasecmp(sep->arg[1], "money") == 0)
	{
		if (c->GetTarget()->IsNPC() && sep->IsNumber(2) && sep->IsNumber(3) && sep->IsNumber(4) && sep->IsNumber(5))
		{
			if ((atoi(sep->arg[2]) < 34465 && atoi(sep->arg[2]) >= 0) && (atoi(sep->arg[3]) < 34465 && atoi(sep->arg[3]) >= 0) && (atoi(sep->arg[4]) < 34465 && atoi(sep->arg[4]) >= 0) && (atoi(sep->arg[5]) < 34465 && atoi(sep->arg[5]) >= 0))
			{
				c->GetTarget()->CastToNPC()->AddCash(atoi(sep->arg[5]), atoi(sep->arg[4]), atoi(sep->arg[3]), atoi(sep->arg[2]));
				c->Message(0, "Set %i Platinum, %i Gold, %i Silver, and %i Copper as %s's money.", atoi(sep->arg[2]), atoi(sep->arg[3]), atoi(sep->arg[4]), atoi(sep->arg[5]), c->GetTarget()->GetName());
			}
			else
				c->Message(0, "Error: #npcloot money: Values must be between 0-34465.");
		}
		else
			c->Message(0, "Usage: #npcloot money platinum gold silver copper");
	}
	else
		c->Message(0, "Usage: #npcloot [show/money/add/remove] [itemid/all/money: pp gp sp cp]");
}

void command_log(Client *c, const Seperator *sep)
{
	if(strlen(sep->arg[4]) == 0 || strlen(sep->arg[1]) == 0 || strlen(sep->arg[2]) == 0 || (strlen(sep->arg[3]) == 0 && atoi(sep->arg[3]) == 0))
	{
		c->Message(0,"#log <type> <byaccountid/bycharname> <querytype> <details> <target/none> <timestamp>");
		c->Message(0,"(Req.) Types: 1) Command, 2) Merchant Buying, 3) Merchant Selling, 4) Loot, 5) Money Loot 6) Trade");
		c->Message(0,"(Req.) byaccountid/bycharname: choose either byaccountid or bycharname and then set querytype to effect it");
		c->Message(0,"(Req.) Details are information about the event, for example, partially an items name, or item id.");
		c->Message(0,"Timestamp allows you to set a date to when the event occured: YYYYMMDDHHMMSS (Year,Month,Day,Hour,Minute,Second). It can be a partial timestamp.");
		c->Message(0,"Note: when specifying a target, spaces in EQEMu use '_'");
		return;
		// help
	}
	CharacterEventLog_Struct* cel = new CharacterEventLog_Struct;
	memset(cel,0,sizeof(CharacterEventLog_Struct));
	if(strcasecmp(sep->arg[2], "byaccountid") == 0)
		database.GetEventLogs("",sep->arg[5],atoi(sep->arg[3]),atoi(sep->arg[1]),sep->arg[4],sep->arg[6],cel);
	else if(strcasecmp(sep->arg[2], "bycharname") == 0)
		database.GetEventLogs(sep->arg[3],sep->arg[5],0,atoi(sep->arg[1]),sep->arg[4],sep->arg[6],cel);
	else
	{
		c->Message(0,"Incorrect query type, use either byaccountid or bycharname");
		safe_delete(cel);
		return;
	}
	if(cel->count != 0)
	{
		int32 count = 0;
		bool cont = true;
		while(cont)
		{
			if(count >= cel->count)
				cont = false;
			else if(cel->eld[count].id != 0)
			{
				c->Message(0,"ID: %i AccountName: %s AccountID: %i Status: %i CharacterName: %s TargetName: %s",cel->eld[count].id,cel->eld[count].accountname,cel->eld[count].account_id,cel->eld[count].status,cel->eld[count].charactername,cel->eld[count].targetname);

				c->Message(0,"LogType: %s Timestamp: %s LogDetails: %s",cel->eld[count].descriptiontype,cel->eld[count].timestamp,cel->eld[count].details);
			}
			else
				cont = false;
			count++;
			if(count > 20)
			{
				c->Message(0,"Please refine search.");
				cont = false;
			}
		}
	}
	c->Message(0,"End of Query");
	safe_delete(cel);
}

void command_gm(Client *c, const Seperator *sep)
{
	bool state=atobool(sep->arg[1]);
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient())
		t=c->GetTarget()->CastToClient();

	if(sep->arg[1][0] != 0) {
		t->SetGM(state);
		c->Message(0, "%s is %s a GM.", t->GetName(), state?"now":"no longer");
	}
	else
		c->Message(0, "Usage: #gm [on/off]");
}

// there's no need for this, as /summon already takes care of it
// this command is here for reference but it is not added to the
// list above

//To whoever wrote the above: And what about /kill, /zone, /zoneserver, etc?
//There is a reason for the # commands: so that admins can specifically enable certain
//commands for their users.  Some might want users to #summon but not to /kill.  Cant do that if they are a GM
//Added back - LE
void command_summon(Client *c, const Seperator *sep)
{
	Mob *t;

	if(sep->arg[1][0] != 0)		// arg specified
	{
		Client* client = entity_list.GetClientByName(sep->arg[1]);
		if (client != 0)	// found player in zone
			t=client->CastToMob();
		else 
		{
			if (!worldserver.Connected())
				c->Message(0, "Error: World server disconnected.");
			else
			{ // player is in another zone
				// @merth: Taking this command out until we test the factor of 8 in ServerOP_ZonePlayer
				//c->Message(0, "Summoning player from another zone not yet implemented.");
				//return;

				ServerPacket* pack = new ServerPacket(ServerOP_ZonePlayer, sizeof(ServerZonePlayer_Struct));
				ServerZonePlayer_Struct* szp = (ServerZonePlayer_Struct*) pack->pBuffer;
				strcpy(szp->adminname, c->GetName());
				szp->adminrank = c->Admin();
				szp->ignorerestrictions = 2;
				strcpy(szp->name, sep->arg[1]);
				strcpy(szp->zone, zone->GetShortName());
				szp->x_pos = c->GetX(); // @merth: May need to add a factor of 8 in here..
				szp->y_pos = c->GetY();
				szp->z_pos = c->GetZ();
				worldserver.SendPacket(pack);
				safe_delete(pack);
			}
			return;
		}
	}
	else if(c->GetTarget())		// have target
		t=c->GetTarget();
	else
	{
		/*if(c->Admin() < 150)
			c->Message(0, "You need a NPC/corpse target for this command");
		else*/
			c->Message(0, "Usage: #summon [charname] Either target or charname is required");
		return;
	}

	if (t->IsNPC())
	{ // npc target
		c->Message(0, "Summoning NPC %s to %1.1f, %1.1f, %1.1f", t->GetName(), c->GetX(), c->GetY(), c->GetZ());
		t->CastToNPC()->GMMove(c->GetX(), c->GetY(), c->GetZ(), c->GetHeading());
		t->CastToNPC()->SaveGuardSpot(true);
	}
	else if (t->IsCorpse())
	{ // corpse target
		c->Message(0, "Summoning corpse %s to %1.1f, %1.1f, %1.1f", t->GetName(), c->GetX(), c->GetY(), c->GetZ());
		t->CastToCorpse()->GMMove(c->GetX(), c->GetY(), c->GetZ(), c->GetHeading());
	}
	else if (t->IsClient())
	{
		/*if(c->Admin() < 150)
		{
			c->Message(0, "You may not summon a player.");
			return;
		}*/
		t->CastToClient()->cheat_timer.Start(3500,false);
		c->Message(0, "Summoning player %s to %1.1f, %1.1f, %1.1f", t->GetName(), c->GetX(), c->GetY(), c->GetZ());
		t->CastToClient()->MovePC(zone->GetZoneID(), c->GetX(), c->GetY(), c->GetZ(), c->GetHeading(), 2, GMSummon);
	}
}

void command_zone(Client *c, const Seperator *sep)
{
 	if(c->Admin() < commandZoneToCoords &&
 		(sep->IsNumber(2) || sep->IsNumber(3) || sep->IsNumber(4))) {
 		c->Message(0, "Your status is not high enough to zone to specific coordinates.");
 		return;
 	}
 	
 	uint16 zoneid = 0;
	
	if (sep->IsNumber(1))
	{
		if(atoi(sep->arg[1])==26 && (c->Admin() < commandZoneToSpecials)){ //cshome
				c->Message(0, "Only Guides and above can goto that zone.");
				return;
		}
		zoneid = atoi(sep->arg[1]);
	}
	else if (sep->arg[1][0] == 0)
	{
		c->Message(0, "Usage: #zone [zonename]");
		c->Message(0, "Optional Usage: #zone [zonename] y x z");
		return;
	}
	else if (zone->GetZoneID() == 184 && c->Admin() < commandZoneToSpecials) {	// Zone: 'Load'
		c->Message(0, "The Gods brought you here, only they can send you away.");
		return;
	} else {
		if((strcasecmp(sep->arg[1], "cshome")==0) && (c->Admin() < commandZoneToSpecials)){
			c->Message(0, "Only Guides and above can goto that zone.");
			return;
		}
		
		zoneid = database.GetZoneID(sep->arg[1]);
		if(zoneid == 0) {
			c->Message(0, "Unable to locate zone '%s'", sep->arg[1]);
			return;
		}
	}
		
	if (sep->IsNumber(2) || sep->IsNumber(3) || sep->IsNumber(4)){
		//zone to specific coords
		c->CastToClient()->cheat_timer.Start(3500,false);
		c->MovePC(zoneid, atof(sep->arg[2]), atof(sep->arg[3]), atof(sep->arg[4]), 0.0f, 0);
		}
	else
		//zone to safe coords
		c->MovePC(zoneid, 0.0f, 0.0f, 0.0f, 0.0f, 0, ZoneToSafeCoords);
}

void command_showbuffs(Client *c, const Seperator *sep)
{
	if (c->GetTarget() == 0)
		c->CastToMob()->ShowBuffs(c);
	else
		c->GetTarget()->CastToMob()->ShowBuffs(c);
}
void command_peqzone(Client *c, const Seperator *sep)
{
       if(!c->GetPTimers().Expired(&database, pTimerPeqzoneReuse, false)) {
               c->Message(13,"Ability recovery time not yet met.");
               return;
       }
       if(c->GetHPRatio() < 75) {
               c->Message(0, "You cannot use this command with less than 75 percent health.");
               return;
       }
       //this isnt perfect, but its better...
       if(
                  c->IsInvisible(c)
               || c->IsRooted()
               || c->IsStunned()
               || c->IsMezzed()
               || c->AutoAttackEnabled()
       ) {
               c->Message(0, "You cannot use this command in your current state. Settle down and wait.");
               return;
       }

       uint32 zoneid = 0;
       if (sep->arg[1][0] == 0)
       {
               c->Message(0, "Usage: #peqzone [zonename]");
               return;
       } else {
               if((strcasecmp(sep->arg[1], "cshome")==0) && (c->Admin() < commandZoneToSpecials)){
                       c->Message(0, "Only Guides and above can goto that zone.");
                       return;
               }

               zoneid = database.GetZoneID(sep->arg[1]);
               if(zoneid == 0) {
                       c->Message(0, "Unable to locate zone '%s'", sep->arg[1]);
                       return;
               }
               if(zoneid == 39 ||zoneid == 187 || zoneid == 188 || zoneid == 71 || zoneid == 162 || zoneid == 76 || zoneid == 186 || zoneid == 105 || zoneid == 124 || zoneid == 89 || zoneid == 128 || zoneid == 189 || zoneid == 108 || zoneid == 158 || zoneid  == 200 || zoneid == 201 || zoneid > 228 || (zoneid > 203 && zoneid < 224)) {
                       c->Message(13, "You cannot use this command to enter that zone!");
                       return;               
               }
               if(zoneid == zone->GetZoneID()) {
                       c->Message(13, "You cannot use this command on the zone you are in!");
                       return;
               }
               if (sep->IsNumber(2) || sep->IsNumber(3) || sep->IsNumber(4) || sep->IsNumber(5)) {
                       c->Message(0, "Usage: #peqzone [zonename]");
			     return;
               }
       }
 
       //a couple good ol cripling effects.
       c->SpellOnTarget(4454, c); //Cursed Keeper's Blight
       c->SpellOnTarget(2209, c); //Tendrils of Apathy

       //zone to safe coords
       c->CastToClient()->cheat_timer.Start(3500,false);
       c->GetPTimers().Start(pTimerPeqzoneReuse, 900);
       c->MovePC(zoneid, 0.0f, 0.0f, 0.0f, 0.0f, 0, ZoneToSafeCoords);
}
void command_movechar(Client *c, const Seperator *sep)
{
	if(sep->arg[1][0]==0 || sep->arg[2][0] == 0)
		c->Message(0, "Usage: #movechar [charactername] [zonename]");
	else if (c->Admin() < commandMovecharToSpecials && strcasecmp(sep->arg[2], "cshome") == 0 || strcasecmp(sep->arg[2], "load") == 0 || strcasecmp(sep->arg[2], "load2") == 0)
		c->Message(0, "Invalid zone name");
	else
	{
		int32 tmp = database.GetAccountIDByChar(sep->arg[1]);
		if (tmp)
		{
			if (c->Admin() >= commandMovecharSelfOnly || tmp == c->AccountID())
				if (!database.MoveCharacterToZone((char*) sep->arg[1], (char*) sep->arg[2]))
					c->Message(0, "Character Move Failed!");
				else
					c->Message(0, "Character has been moved.");
			else
				c->Message(13,"You cannot move characters that are not on your account.");
		}
		else
			c->Message(0, "Character Does Not Exist");
	}
}

void command_viewpetition(Client *c, const Seperator *sep)
{
	if (sep->arg[1][0] == 0)
		c->Message(0, "Usage: #viewpetition (petition number) Type #listpetition for a list");
	else
	{
		char errbuf[MYSQL_ERRMSG_SIZE];
		char *query = 0;
		int queryfound = 0;
		MYSQL_RES *result;
		MYSQL_ROW row;
		c->Message(13,"	ID : Character Name , Petition Text");
		if (database.RunQuery(query, MakeAnyLenString(&query, "SELECT petid, charname, petitiontext from petitions order by petid"), errbuf, &result))
		{
			while ((row = mysql_fetch_row(result)))
			{
				if (strcasecmp(row[0],sep->argplus[1])== 0)
				{
					queryfound=1;
					c->Message(15, " %s:	%s , %s ",row[0],row[1],row[2]);
				}
			}
			LogFile->write(EQEMuLog::Normal,"View petition request from %s, petition number:", c->GetName(), atoi(sep->argplus[1]) );
			if (queryfound==0)
				c->Message(13,"There was an error in your request: ID not found! Please check the Id and try again.");
			mysql_free_result(result);
		}
		safe_delete_array(query);
	}
}

void command_petitioninfo(Client *c, const Seperator *sep)
{
	if (sep->arg[1][0] == 0)
		c->Message(0, "Usage: #petitioninfo (petition number) Type #listpetition for a list");
	else
	{
		char errbuf[MYSQL_ERRMSG_SIZE];
		char *query = 0;
		int queryfound = 0;
		MYSQL_RES *result;
		MYSQL_ROW row;

		if (database.RunQuery(query, MakeAnyLenString(&query, "SELECT petid, charname, accountname, zone, charclass, charrace, charlevel from petitions order by petid"), errbuf, &result))
		{
			while ((row = mysql_fetch_row(result)))
				if (strcasecmp(row[0],sep->argplus[1])== 0)
				{
					queryfound=1;
					c->Message(13,"	ID : %s Character Name: %s Account Name: %s Zone: %s Character Class: %s Character Race: %s Character Level: %s",row[0],row[1],row[2],row[3],row[4],row[5],row[6]);
				}
			LogFile->write(EQEMuLog::Normal,"Petition information request from %s, petition number:", c->GetName(), atoi(sep->argplus[1]) );
			if (queryfound==0)
				c->Message(13,"There was an error in your request: ID not found! Please check the Id and try again.");
			mysql_free_result(result);
		}
		safe_delete_array(query);
	}
}

void command_delpetition(Client *c, const Seperator *sep)
{
	if (sep->arg[1][0] == 0 || strcasecmp(sep->arg[1],"*")==0)
		c->Message(0, "Usage: #delpetition (petition number) Type #listpetition for a list");
	else {
		char errbuf[MYSQL_ERRMSG_SIZE];
		char *query = 0;
		c->Message(13,"Attempting to delete petition number: %i",atoi(sep->argplus[1]));
		if (database.RunQuery(query, MakeAnyLenString(&query, "DELETE from petitions where petid=%i",atoi(sep->argplus[1])), errbuf)) {
			LogFile->write(EQEMuLog::Normal,"Delete petition request from %s, petition number:", c->GetName(), atoi(sep->argplus[1]) );
		}
		safe_delete_array(query);
	}
}

void command_listnpcs(Client *c, const Seperator *sep)
{
	if (strcasecmp(sep->arg[1], "all") == 0)
		entity_list.ListNPCs(c,sep->arg[1],sep->arg[2],0);
	else if(sep->IsNumber(1) && sep->IsNumber(2))
		entity_list.ListNPCs(c,sep->arg[1],sep->arg[2],2);
	else if(sep->arg[1][0] != 0)
		entity_list.ListNPCs(c,sep->arg[1],sep->arg[2],1);
	else {
		c->Message(0, "Usage of #listnpcs:");
		c->Message(0, "#listnpcs [#] [#] (Each number would search by ID, ex. #listnpcs 1 30, searches 1-30)");
		c->Message(0, "#listnpcs [name] (Would search for a npc with [name])");
	}
}

void command_date(Client *c, const Seperator *sep)
{
	//yyyy mm dd hh mm local
	if(sep->arg[3][0]==0 || !sep->IsNumber(1) || !sep->IsNumber(2) || !sep->IsNumber(3)) {
		c->Message(13, "Usage: #date yyyy mm dd [HH MM]");
	}
	else {
		int h=0, m=0;
		TimeOfDay_Struct eqTime;
		zone->zone_time.getEQTimeOfDay( time(0), &eqTime);
		if(!sep->IsNumber(4))
		h=eqTime.hour;
		else
			h=atoi(sep->arg[4]);
		if(!sep->IsNumber(5))
			m=eqTime.minute;
		else
			m=atoi(sep->arg[5]);
		c->Message(13, "Setting world time to %s-%s-%s %i:%i...", sep->arg[1], sep->arg[2], sep->arg[3], h, m);
		zone->SetDate(atoi(sep->arg[1]), atoi(sep->arg[2]), atoi(sep->arg[3]), h, m);
	}
}

void command_timezone(Client *c, const Seperator *sep)
{
	if(sep->arg[1][0]==0 && !sep->IsNumber(1)) {
		c->Message(13, "Usage: #timezone HH [MM]");
		c->Message(13, "Current timezone is: %ih %im", zone->zone_time.getEQTimeZoneHr(), zone->zone_time.getEQTimeZoneMin());
	}
	else {
		if(sep->arg[2]=="")
			strcpy(sep->arg[2], "0");
		c->Message(13, "Setting timezone to %s h %s m", sep->arg[1], sep->arg[2]);
		int32 ntz=(atoi(sep->arg[1])*60)+atoi(sep->arg[2]);
		zone->zone_time.setEQTimeZone(ntz);
		database.SetZoneTZ(zone->GetZoneID(), ntz);

		// Update all clients with new TZ.
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_TimeOfDay, sizeof(TimeOfDay_Struct));
		TimeOfDay_Struct* tod = (TimeOfDay_Struct*)outapp->pBuffer;
		zone->zone_time.getEQTimeOfDay(time(0), tod);
		entity_list.QueueClients(c, outapp);
		safe_delete(outapp);
	}
}

void command_synctod(Client *c, const Seperator *sep)
{
	c->Message(13, "Updating Time/Date for all clients in zone...");
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_TimeOfDay, sizeof(TimeOfDay_Struct));
	TimeOfDay_Struct* tod = (TimeOfDay_Struct*)outapp->pBuffer;
	zone->zone_time.getEQTimeOfDay(time(0), tod);
	entity_list.QueueClients(c, outapp);
	safe_delete(outapp);
}

void command_invul(Client *c, const Seperator *sep)
{
	bool state=atobool(sep->arg[1]);
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient())
		t=c->GetTarget()->CastToClient();

	if(sep->arg[1][0] != 0) {
		t->SetInvul(state);
		c->Message(0, "%s is %s invulnerable from attack.", t->GetName(), state?"now":"no longer");
	}
	else
		c->Message(0, "Usage: #invulnerable [on/off]");
}

void command_hideme(Client *c, const Seperator *sep)
{
  bool state=atobool(sep->arg[1]);

  if(sep->arg[1][0]==0)
		c->Message(0, "Usage: #hideme [on/off]");
	else
	{
		c->SetHideMe(state);
		c->Message_StringID(MT_Broadcasts, c->GetHideMe() ? NOW_INVISIBLE : NOW_VISIBLE, c->GetName());
	}
}

void command_emote(Client *c, const Seperator *sep)
{
	if (sep->arg[3][0] == 0)
		c->Message(0, "Usage: #emote [name | world | zone] type# message");
	else {
		if (strcasecmp(sep->arg[1], "zone") == 0){
			char* newmessage=0;
			if(strstr(sep->arg[3],"^")==0)
				entity_list.Message(0, atoi(sep->arg[2]), sep->argplus[3]);
			else{
				for(newmessage = strtok((char*)sep->arg[3],"^");newmessage!=NULL;newmessage=strtok(NULL, "^"))
					entity_list.Message(0, atoi(sep->arg[2]), newmessage);
			}
		}
		else if (!worldserver.Connected())
			c->Message(0, "Error: World server disconnected");
		else if (strcasecmp(sep->arg[1], "world") == 0)
			worldserver.SendEmoteMessage(0, 0, atoi(sep->arg[2]), sep->argplus[3]);
		else
			worldserver.SendEmoteMessage(sep->arg[1], 0, atoi(sep->arg[2]), sep->argplus[3]);
	}
}

void command_fov(Client *c, const Seperator *sep)
{
	if(c->GetTarget())
		if(c->BehindMob(c->GetTarget(), c->GetX(), c->GetY()))
			c->Message(0, "You are behind mob %s, it is looking to %d", c->GetTarget()->GetName(), c->GetTarget()->GetHeading());
		else
			c->Message(0, "You are NOT behind mob %s, it is looking to %d", c->GetTarget()->GetName(), c->GetTarget()->GetHeading());
	else
		c->Message(0, "I Need a target!");
}

void command_manastat(Client *c, const Seperator *sep)
{
	Mob *target=c->GetTarget()?c->GetTarget():c;
	
	c->Message(0, "Mana for %s:", target->GetName());
	c->Message(0, "  Current Mana: %d",target->GetMana());
	c->Message(0, "  Max Mana: %d",target->GetMaxMana());
}

void command_npcstats(Client *c, const Seperator *sep)
{
	if (c->GetTarget() == 0)
		c->Message(0, "ERROR: No target!");
	else if (!c->GetTarget()->IsNPC())
		c->Message(0, "ERROR: Target is not a NPC!");
	else {
		c->Message(0, "NPC Stats:");
		c->Message(0, "  Name: %s   NpcID: %u",c->GetTarget()->GetName(), c->GetTarget()->GetNPCTypeID());
		c->Message(0, "  Race: %i  Level: %i  Class: %i",c->GetTarget()->GetRace(), c->GetTarget()->GetLevel(), c->GetTarget()->GetClass());
		c->Message(0, "  Material: %i",c->GetTarget()->GetTexture());
		c->Message(0, "  Current HP: %i  Max HP: %i", c->GetTarget()->GetHP(), c->GetTarget()->GetMaxHP());
		//c->Message(0, "Weapon Item Number: %s",c->GetTarget()->GetWeapNo());
		c->Message(0, "  Gender: %i  Size: %f  Bodytype: %d",c->GetTarget()->GetGender(),c->GetTarget()->GetSize(), c->GetTarget()->GetBodyType());
		c->Message(0, "  Runspeed: %f  Walkspeed: %f", c->GetTarget()->GetRunspeed(), c->GetTarget()->GetWalkspeed());
		c->Message(0,"Spawn Group: %i",c->GetTarget()->CastToNPC()->GetSp2());
		c->GetTarget()->CastToNPC()->QueryLoot(c);
	}
}

void command_zclip(Client *c, const Seperator *sep)
{
	// modifys and resends zhdr packet
	if(sep->arg[2][0]==0)
		c->Message(0, "Usage: #zclip <min clip> <max clip>");
	else if(atoi(sep->arg[1])<=0)
		c->Message(0, "ERROR: Min clip can not be zero or less!");
	else if(atoi(sep->arg[2])<=0)
		c->Message(0, "ERROR: Max clip can not be zero or less!");
	else if(atoi(sep->arg[1])>atoi(sep->arg[2]))
		c->Message(0, "ERROR: Min clip is greater than max clip!");
	else {
		zone->newzone_data.minclip = atof(sep->arg[1]);
		zone->newzone_data.maxclip = atof(sep->arg[2]);
		if(sep->arg[3][0]!=0)
			zone->newzone_data.fog_minclip[0]=atof(sep->arg[3]);
		if(sep->arg[4][0]!=0)
			zone->newzone_data.fog_minclip[1]=atof(sep->arg[4]);
		if(sep->arg[5][0]!=0)
			zone->newzone_data.fog_maxclip[0]=atof(sep->arg[5]);
		if(sep->arg[6][0]!=0)
			zone->newzone_data.fog_maxclip[1]=atof(sep->arg[6]);
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_NewZone, sizeof(NewZone_Struct));
		memcpy(outapp->pBuffer, &zone->newzone_data, outapp->size);
		entity_list.QueueClients(c, outapp);
		safe_delete(outapp);
	}
}

void command_npccast(Client *c, const Seperator *sep)
{
	if (c->GetTarget() && c->GetTarget()->IsNPC() && !sep->IsNumber(1) && sep->arg[1] != 0 && sep->IsNumber(2)) {
		Mob* spelltar = entity_list.GetMob(sep->arg[1]);
		if (spelltar)
			c->GetTarget()->CastSpell(atoi(sep->arg[2]), spelltar->GetID());
		else
			c->Message(0, "Error: %s not found", sep->arg[1]);
	}
	else if (c->GetTarget() && c->GetTarget()->IsNPC() && sep->IsNumber(1) && sep->IsNumber(2) ) {
		Mob* spelltar = entity_list.GetMob(atoi(sep->arg[1]));
		if (spelltar) 
			c->GetTarget()->CastSpell(atoi(sep->arg[2]), spelltar->GetID());
		else
			c->Message(0, "Error: target ID %i not found", atoi(sep->arg[1]));
	}
	else
		c->Message(0, "Usage: (needs NPC targeted) #npccast targetname/entityid spellid");
}

void command_zstats(Client *c, const Seperator *sep)
{
	c->Message(0, "Zone Header Data:");
	c->Message(0, "Sky Type: %i", zone->newzone_data.sky);
	c->Message(0, "Fog Colour: Red: %i; Blue: %i; Green %i", zone->newzone_data.fog_red[0], zone->newzone_data.fog_green[0], zone->newzone_data.fog_blue[0]);
	c->Message(0, "Safe Coords: %f, %f, %f", zone->newzone_data.safe_x, zone->newzone_data.safe_y, zone->newzone_data.safe_z);
	c->Message(0, "Underworld Coords: %f", zone->newzone_data.underworld);
	c->Message(0, "Clip Plane: %f - %f", zone->newzone_data.minclip, zone->newzone_data.maxclip);
}

void command_permaclass(Client *c, const Seperator *sep)
{
  Client *t=c;
  
  if(c->GetTarget() && c->GetTarget()->IsClient())
    t=c->GetTarget()->CastToClient();
  
	if(sep->arg[1][0]==0) {
		c->Message(0,"Usage: #permaclass <classnum>");
	}
  else if(!t->IsClient())
		c->Message(0,"Target is not a client.");
	else {
		c->Message(0, "Setting %s's class...Sending to char select.", t->GetName());
		LogFile->write(EQEMuLog::Normal,"Class change request from %s for %s, requested class:%i", c->GetName(), t->GetName(), atoi(sep->arg[1]) );
		t->SetBaseClass(atoi(sep->arg[1]));
		t->Save();
		t->Kick();
	}
}

void command_permarace(Client *c, const Seperator *sep)
{
  Client *t=c;
  
  if(c->GetTarget() && c->GetTarget()->IsClient())
    t=c->GetTarget()->CastToClient();
  
	if(sep->arg[1][0]==0) {
		c->Message(0,"Usage: #permarace <racenum>");
		c->Message(0,"NOTE: Not all models are global. If a model is not global, it will appear as a human on character select and in zones without the model.");
	}
  else if(!t->IsClient())
		c->Message(0,"Target is not a client.");
	else {
		c->Message(0, "Setting %s's race - zone to take effect",t->GetName());
		LogFile->write(EQEMuLog::Normal,"Permanant race change request from %s for %s, requested race:%i", c->GetName(), t->GetName(), atoi(sep->arg[1]) );
		int32 tmp = Mob::GetDefaultGender(atoi(sep->arg[1]), t->GetBaseGender());
		t->SetBaseRace(atoi(sep->arg[1]));
		t->SetBaseGender(tmp);
		t->Save();
		t->SendIllusionPacket(atoi(sep->arg[1]));
	}
}

void command_permagender(Client *c, const Seperator *sep)
{
  Client *t=c;
  
  if(c->GetTarget() && c->GetTarget()->IsClient())
    t=c->GetTarget()->CastToClient();
  
	if(sep->arg[1][0]==0) {
		c->Message(0,"Usage: #permagender <gendernum>");
		c->Message(0,"Gender Numbers: 0=Male, 1=Female, 2=Neuter");
	}
  else if(!t->IsClient())
		c->Message(0,"Target is not a client.");
	else {
		c->Message(0, "Setting %s's gender - zone to take effect",t->GetName());
		LogFile->write(EQEMuLog::Normal,"Permanant gender change request from %s for %s, requested gender:%i", c->GetName(), t->GetName(), atoi(sep->arg[1]) );
		t->SetBaseGender(atoi(sep->arg[1]));
		t->Save();
		t->SendIllusionPacket(atoi(sep->arg[1]));
	}
}

void command_weather(Client *c, const Seperator *sep)
{
	if (!(sep->arg[1][0] == '0' || sep->arg[1][0] == '1' || sep->arg[1][0] == '2' || sep->arg[1][0] == '3')) {
		c->Message(0, "Usage: #weather <0/1/2/3> - Off/Rain/Snow/Manual.");
	}
	else if(zone->zone_weather == 0) {
		if(sep->arg[1][0] == '3')	{ // Put in modifications here because it had a very good chance at screwing up the client's weather system if rain was sent during snow -T7
			if(sep->arg[2][0] != 0 && sep->arg[3][0] != 0) {
				c->Message(0, "Sending weather packet... TYPE=%s, INTENSITY=%s", sep->arg[2], sep->arg[3]);
				zone->zone_weather = atoi(sep->arg[2]);
				EQApplicationPacket* outapp = new EQApplicationPacket(OP_Weather, 8);
				outapp->pBuffer[0] = atoi(sep->arg[2]);
				outapp->pBuffer[4] = atoi(sep->arg[3]); // This number changes in the packets, intensity?
				entity_list.QueueClients(c, outapp);
				safe_delete(outapp);
			}
			else {
				c->Message(0, "Manual Usage: #weather 3 <type> <intensity>");
			}
		}
		else if(sep->arg[1][0] == '2')	{
			entity_list.Message(0, 0, "Snowflakes begin to fall from the sky.");
			zone->zone_weather = 2;
			EQApplicationPacket* outapp = new EQApplicationPacket(OP_Weather, 8);
			outapp->pBuffer[0] = 0x01;
			outapp->pBuffer[4] = 0x02; // This number changes in the packets, intensity?
			entity_list.QueueClients(c, outapp);
			safe_delete(outapp);
		}
		else if(sep->arg[1][0] == '1')	{
			entity_list.Message(0, 0, "Raindrops begin to fall from the sky.");
			zone->zone_weather = 1;
			EQApplicationPacket* outapp = new EQApplicationPacket(OP_Weather, 8);
			outapp->pBuffer[4] = 0x01; // This is how it's done in Fear, and you can see a decent distance with it at this value
			entity_list.QueueClients(c, outapp);
			safe_delete(outapp);
		}
	}
	else {
		if(zone->zone_weather == 1)	{ // Doing this because if you have rain/snow on, you can only turn one off.
			entity_list.Message(0, 0, "The sky clears as the rain ceases to fall.");
			zone->zone_weather = 0;
			EQApplicationPacket* outapp = new EQApplicationPacket(OP_Weather, 8);
			// To shutoff weather you send an empty 8 byte packet (You get this everytime you zone even if the sky is clear)
			entity_list.QueueClients(c, outapp);
			safe_delete(outapp);
		}
		else if(zone->zone_weather == 2) {
			entity_list.Message(0, 0, "The sky clears as the snow stops falling.");
			zone->zone_weather = 0;
			EQApplicationPacket* outapp = new EQApplicationPacket(OP_Weather, 8);
			// To shutoff weather you send an empty 8 byte packet (You get this everytime you zone even if the sky is clear)
			outapp->pBuffer[0] = 0x01; // Snow has it's own shutoff packet
			entity_list.QueueClients(c, outapp);
			safe_delete(outapp);
		}
		else {
			entity_list.Message(0, 0, "The sky clears.");
			zone->zone_weather = 0;
			EQApplicationPacket* outapp = new EQApplicationPacket(OP_Weather, 8);
			// To shutoff weather you send an empty 8 byte packet (You get this everytime you zone even if the sky is clear)
			entity_list.QueueClients(c, outapp);
			safe_delete(outapp);
		}
	}
}

void command_zheader(Client *c, const Seperator *sep)
{
	// sends zhdr packet
	if(sep->arg[1][0]==0) {
		c->Message(0, "Usage: #zheader <zone name>");
	}
	else if(database.GetZoneID(sep->argplus[1])==0)
		c->Message(0, "Invalid Zone Name: %s", sep->argplus[1]);
	else {
		
		if (zone->LoadZoneCFG(sep->argplus[1], true))
			c->Message(0, "Successfully loaded zone header for %s from database.", sep->argplus[1]);
		else
			c->Message(0, "Failed to load zone header %s from database", sep->argplus[1]);
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_NewZone, sizeof(NewZone_Struct));
		memcpy(outapp->pBuffer, &zone->newzone_data, outapp->size);
		entity_list.QueueClients(c, outapp);
		safe_delete(outapp);
	}
}

void command_zsky(Client *c, const Seperator *sep)
{
	// modifys and resends zhdr packet
	if(sep->arg[1][0]==0)
		c->Message(0, "Usage: #zsky <sky type>");
	else if(atoi(sep->arg[1])<0||atoi(sep->arg[1])>255)
		c->Message(0, "ERROR: Sky type can not be less than 0 or greater than 255!");
	else {
		zone->newzone_data.sky = atoi(sep->arg[1]);
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_NewZone, sizeof(NewZone_Struct));
		memcpy(outapp->pBuffer, &zone->newzone_data, outapp->size);
		entity_list.QueueClients(c, outapp);
		safe_delete(outapp);
	}
}

void command_zcolor(Client *c, const Seperator *sep)
{
	// modifys and resends zhdr packet
	if (sep->arg[3][0]==0)
		c->Message(0, "Usage: #zcolor <red> <green> <blue>");
	else if (atoi(sep->arg[1])<0||atoi(sep->arg[1])>255)
		c->Message(0, "ERROR: Red can not be less than 0 or greater than 255!");
	else if (atoi(sep->arg[2])<0||atoi(sep->arg[2])>255)
		c->Message(0, "ERROR: Green can not be less than 0 or greater than 255!");
	else if (atoi(sep->arg[3])<0||atoi(sep->arg[3])>255)
		c->Message(0, "ERROR: Blue can not be less than 0 or greater than 255!");
	else {
		for (int z=0; z<4; z++) {
			zone->newzone_data.fog_red[z] = atoi(sep->arg[1]);
			zone->newzone_data.fog_green[z] = atoi(sep->arg[2]);
			zone->newzone_data.fog_blue[z] = atoi(sep->arg[3]);
		}
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_NewZone, sizeof(NewZone_Struct));
		memcpy(outapp->pBuffer, &zone->newzone_data, outapp->size);
		entity_list.QueueClients(c, outapp);
		safe_delete(outapp);
	}
}

void command_spon(Client *c, const Seperator *sep)
{
	c->MemorizeSpell(0, SPELLBAR_UNLOCK, memSpellSpellbar);
}

void command_spoff(Client *c, const Seperator *sep)
{
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_ManaChange, 0);
	outapp->priority = 5;
	c->QueuePacket(outapp);
	safe_delete(outapp);
}

void command_itemtest(Client *c, const Seperator *sep)
{
	char chBuffer[8192] = {0};
	//@merth: Using this to determine new item layout
	FILE* f = NULL;
	if (!(f = fopen("c:\\EQEMUcvs\\ItemDump.txt", "rb"))) {
		c->Message(13, "Error: Could not open c:\\EQEMUcvs\\ItemDump.txt");
		return;
	}
		
	fread(chBuffer, sizeof(chBuffer), sizeof(char), f);
	fclose(f);
		
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_ItemLinkResponse, strlen(chBuffer)+5);
	memcpy(&outapp->pBuffer[4], chBuffer, strlen(chBuffer));
	c->QueuePacket(outapp);
	safe_delete(outapp);
}

void command_gassign(Client *c, const Seperator *sep)
{
	if (sep->IsNumber(1) && c->GetTarget() && c->GetTarget()->IsNPC())
	{
		database.AssignGrid(
			c,
			(c->GetTarget()->CastToNPC()->org_x),
			(c->GetTarget()->CastToNPC()->org_y),
			atoi(sep->arg[1])
		);
	}
	else
		c->Message(0,"Usage: #gassign [num] - must have an npc target!");
}

void command_setitemstatus(Client *c, const Seperator *sep)
{
	if (sep->IsNumber(1) && sep->IsNumber(2)) {
		int32 tmp = atoi(sep->arg[1]);
		if (tmp >= 0xFFFF)
			c->Message(0, "Item# out of range");
		else if (!database.DBSetItemStatus(tmp, atoi(sep->arg[2])))
			c->Message(0, "DB query failed");
		else {
			c->Message(0, "Item updated");
			ServerPacket* pack = new ServerPacket(ServerOP_ItemStatus, 5);
			*((int32*) &pack->pBuffer[0]) = tmp;
			*((int8*) &pack->pBuffer[4]) = atoi(sep->arg[2]);
			worldserver.SendPacket(pack);
			delete pack;
		}
	}
	else
		c->Message(0, "Usage: #setitemstatus [itemid] [status]");
}

void command_ai(Client *c, const Seperator *sep)
{
	Mob *target=c->GetTarget();

	if (strcasecmp(sep->arg[1], "factionid") == 0) {
		if (target && sep->IsNumber(2)) {
			if (target->IsNPC())
				target->CastToNPC()->SetNPCFactionID(atoi(sep->arg[2]));
			else
				c->Message(0, "%s is not an NPC.", target->GetName());
		}
		else
			c->Message(0, "Usage: (targeted) #ai factionid [factionid]");
	}
	else if (strcasecmp(sep->arg[1], "spellslist") == 0) {
		if (target && sep->IsNumber(2) && atoi(sep->arg[2]) >= 0) {
			if (target->IsNPC())
				target->CastToNPC()->AI_AddNPCSpells(atoi(sep->arg[2]));
			else
				c->Message(0, "%s is not an NPC.", target->GetName());
		}
		else
			c->Message(0, "Usage: (targeted) #ai spellslist [npc_spells_id]");
	}
	else if (strcasecmp(sep->arg[1], "con") == 0) {
		if (target && sep->arg[2][0] != 0) {
			Mob* tar2 = entity_list.GetMob(sep->arg[2]);
			if (tar2)
				c->Message(0, "%s considering %s: %i", target->GetName(), tar2->GetName(), tar2->GetReverseFactionCon(target));
			else
				c->Message(0, "Error: %s not found.", sep->arg[2]);
		}
		else
			c->Message(0, "Usage: (targeted) #ai con [mob name]");
	}
	else if (strcasecmp(sep->arg[1], "guard") == 0) {
		if (target && target->IsNPC())
			target->CastToNPC()->SaveGuardSpot();
		else
			c->Message(0, "Usage: (targeted) #ai guard - sets npc to guard the current location (use #summon to move)");
	}
	else if (strcasecmp(sep->arg[1], "roambox") == 0) {
		if (target && target->IsAIControlled() && target->IsNPC()) {
			if ((sep->argnum == 6 || sep->argnum == 7) && sep->IsNumber(2) && sep->IsNumber(3) && sep->IsNumber(4) && sep->IsNumber(5) && sep->IsNumber(6)) {
				int32 tmp = 2500;
				if (sep->IsNumber(7))
					tmp = atoi(sep->arg[7]);
				target->CastToNPC()->AI_SetRoambox(atof(sep->arg[2]), atof(sep->arg[3]), atof(sep->arg[4]), atof(sep->arg[5]), atof(sep->arg[6]), tmp);
			}
			else if ((sep->argnum == 3 || sep->argnum == 4) && sep->IsNumber(2) && sep->IsNumber(3)) {
				int32 tmp = 2500;
				if (sep->IsNumber(4))
					tmp = atoi(sep->arg[4]);
				target->CastToNPC()->AI_SetRoambox(atof(sep->arg[2]), atof(sep->arg[3]), tmp);
			}
			else {
				c->Message(0, "Usage: #ai roambox dist max_x min_x max_y min_y [delay]");
				c->Message(0, "Usage: #ai roambox dist roamdist [delay]");
			}
		}
		else
			c->Message(0, "You need a AI NPC targeted");
	}
	else if (strcasecmp(sep->arg[1], "stop") == 0 && c->Admin() >= commandToggleAI) {
		if (target) {
			if (target->IsAIControlled())
				target->AI_Stop();
			else
				c->Message(0, "Error: Target is not AI controlled");
		}
		else
			c->Message(0, "Usage: Target a Mob with AI enabled and use this to turn off their AI.");
	}
	else if (strcasecmp(sep->arg[1], "start") == 0 && c->Admin() >= commandToggleAI) {
		if (target) {
			if (!target->IsAIControlled())
				target->AI_Start();
			else
				c->Message(0, "Error: Target is already AI controlled");
		}
		else
			c->Message(0, "Usage: Target a Mob with AI disabled and use this to turn on their AI.");
	}
	else {
		c->Message(0, "#AI Sub-commands");
		c->Message(0, "  factionid");
		c->Message(0, "  spellslist");
		c->Message(0, "  con");
		c->Message(0, "  guard");
	}
}

void command_worldshutdown(Client *c, const Seperator *sep)
{
	// GM command to shutdown world server and all zone servers
	int32 time=0;
	int32 interval=0;
	if (worldserver.Connected()) {
		if(sep->IsNumber(1) && sep->IsNumber(2) && ((time=atoi(sep->arg[1]))>0) && ((interval=atoi(sep->arg[2]))>0)) {
			worldserver.SendEmoteMessage(0,0,15,"<SYSTEMWIDE MESSAGE>:SYSTEM MSG:World coming down in %i seconds, everyone log out before this time.",time);
			c->Message(0, "Sending shutdown packet now, World will shutdown in: %i Seconds with an interval of: %i",time,interval);
			ServerPacket* pack = new ServerPacket(ServerOP_ShutdownAll,sizeof(WorldShutDown_Struct));
			WorldShutDown_Struct* wsd = (WorldShutDown_Struct*)pack->pBuffer;
			wsd->time=time*1000;
			wsd->interval=(interval*1000);
			worldserver.SendPacket(pack);
			safe_delete(pack);
		}
		else if(strcasecmp(sep->arg[1], "now") == 0){
			worldserver.SendEmoteMessage(0,0,15,"<SYSTEMWIDE MESSAGE>:SYSTEM MSG:World coming down, everyone log out now.");
			c->Message(0, "Sending shutdown packet");
			ServerPacket* pack = new ServerPacket;
			pack->opcode = ServerOP_ShutdownAll;
			pack->size=0;	
			worldserver.SendPacket(pack);
			safe_delete(pack);
		}
		else if(strcasecmp(sep->arg[1], "disable") == 0){
			c->Message(0, "Shutdown prevented, next time I may not be so forgiving...");
			ServerPacket* pack = new ServerPacket(ServerOP_ShutdownAll,sizeof(WorldShutDown_Struct));
			WorldShutDown_Struct* wsd = (WorldShutDown_Struct*)pack->pBuffer;
			wsd->time=0;
			wsd->interval=0;
			worldserver.SendPacket(pack);
			safe_delete(pack);
		}
		else{
			c->Message(0,"#worldshutdown - Shuts down the server and all zones.");
			c->Message(0,"Usage: #worldshutdown now - Shuts down the server and all zones immediately.");
			c->Message(0,"Usage: #worldshutdown disable - Stops the server from a previously scheduled shut down.");
			c->Message(0,"Usage: #worldshutdown [timer] [interval] - Shuts down the server and all zones after [timer] seconds and sends warning every [interval] seconds.");
		}
	}
	else
		c->Message(0, "Error: World server disconnected");
}

void command_sendzonespawns(Client *c, const Seperator *sep)
{
	entity_list.SendZoneSpawns(c);
}

void command_zsave(Client *c, const Seperator *sep)
{
	if(zone->SaveZoneCFG())
		c->Message(13, "Zone header saved successfully.");
		else
		c->Message(13, "ERROR: Zone header data was NOT saved.");
}

void command_dbspawn2(Client *c, const Seperator *sep)
{

	if (sep->IsNumber(1) && sep->IsNumber(2) && sep->IsNumber(3)) {
		LogFile->write(EQEMuLog::Normal,"Spawning database spawn");
		uint16 cond = 0;
		sint16 cond_min = 0;
		if(sep->IsNumber(4)) {
			cond = atoi(sep->arg[4]);
			if(sep->IsNumber(5))
				cond_min = atoi(sep->arg[5]);
		}
		database.CreateSpawn2(c, atoi(sep->arg[1]), zone->GetShortName(), c->GetHeading(), c->GetX(), c->GetY(), c->GetZ(), atoi(sep->arg[2]), atoi(sep->arg[3]), cond, cond_min);
	}
	else {
		c->Message(0, "Usage: #dbspawn2 spawngroup respawn variance [condition_id] [condition_min]");
	}
}

void command_copychar(Client *c, const Seperator *sep)
{
	if(sep->arg[1][0]==0 || sep->arg[2][0] == 0 || sep->arg[3][0] == 0)
		c->Message(0, "Usage: #copychar [character name] [new character] [new account id]");
	//CheckUsedName.... TRUE=No Char, FALSE=Char/Error
	//If there is no source...
	else if (database.CheckUsedName((char*)sep->arg[1])) {
		c->Message(0, "Source character not found!");
	}
	else {
		//If there is a name is not used....
		if (database.CheckUsedName((char*) sep->arg[2])) {
			if (!database.CopyCharacter((char*) sep->arg[1], (char*) sep->arg[2], atoi(sep->arg[3])))
				c->Message(0, "Character copy operation failed!");
			else
				c->Message(0, "Character copy complete.");
		}
		else
			c->Message(0, "Target character already exists!");
	}
}

void command_shutdown(Client *c, const Seperator *sep)
{
	CatchSignal(2);
}

void command_delacct(Client *c, const Seperator *sep)
{
	if(sep->arg[1][0] == 0)
		c->Message(0, "Format: #delacct accountname");
	else
		if (database.DeleteAccount(sep->arg[1]))
			c->Message(0, "The account was deleted.");
		else
			c->Message(0, "Unable to delete account.");
}

void command_setpass(Client *c, const Seperator *sep)
{
	if(sep->argnum != 2)
		c->Message(0, "Format: #setpass accountname password");
	else {
		sint16 tmpstatus = 0;
		int32 tmpid = database.GetAccountIDByName(sep->arg[1], &tmpstatus);
		if (!tmpid)
			c->Message(0, "Error: Account not found");
		else if (tmpstatus > c->Admin())
			c->Message(0, "Cannot change password: Account's status is higher than yours");
		else if (database.SetLocalPassword(tmpid, sep->arg[2]))
			c->Message(0, "Password changed.");
		else
			c->Message(0, "Error changing password.");
	}
}

void command_grid(Client *c, const Seperator *sep)
{
	if (strcasecmp("max",sep->arg[1]) == 0)
		c->Message(0, "Highest grid ID in this zone: %d", database.GetHighestGrid(zone->GetZoneID()));
	else if (strcasecmp("add",sep->arg[1]) == 0)
		database.ModifyGrid(c, false,atoi(sep->arg[2]),atoi(sep->arg[3]), atoi(sep->arg[4]),zone->GetZoneID());
	else if (strcasecmp("delete",sep->arg[1]) == 0)
		database.ModifyGrid(c, true,atoi(sep->arg[2]),0,0,zone->GetZoneID());
	else {
		c->Message(0,"Usage: #grid add/delete grid_num wandertype pausetype");
		c->Message(0,"Usage: #grid max - displays the highest grid ID used in this zone (for add)");
	}
}

void command_wp(Client *c, const Seperator *sep)
{
	int wp = atoi(sep->arg[4]);

	if (strcasecmp("add",sep->arg[1]) == 0) {
		if (wp == 0) //AndMetal: default to highest if it's left blank, or we enter 0
			wp = database.GetHighestWaypoint(zone->GetZoneID(), atoi(sep->arg[2])) + 1;
		database.AddWP(c, atoi(sep->arg[2]),wp, c->GetX(), c->GetY(), c->GetZ(), atoi(sep->arg[3]),zone->GetZoneID());
	}
	else if (strcasecmp("delete",sep->arg[1]) == 0)
		database.DeleteWaypoint(c, atoi(sep->arg[2]),wp,zone->GetZoneID());
	else
		c->Message(0,"Usage: #wp add/delete grid_num pause wp_num");
}

void command_iplookup(Client *c, const Seperator *sep)
{
	ServerPacket* pack = new ServerPacket(ServerOP_IPLookup, sizeof(ServerGenericWorldQuery_Struct) + strlen(sep->argplus[1]) + 1);
	ServerGenericWorldQuery_Struct* s = (ServerGenericWorldQuery_Struct *) pack->pBuffer;
	strcpy(s->from, c->GetName());
	s->admin = c->Admin();
	if (sep->argplus[1][0] != 0)
		strcpy(s->query, sep->argplus[1]);
	worldserver.SendPacket(pack);
	safe_delete(pack);
}

void command_size(Client *c, const Seperator *sep)
{
	if (!sep->IsNumber(1))
		c->Message(0, "Usage: #size [0 - 255]");
	else {
		float newsize = atof(sep->arg[1]);
		if (newsize > 255)
			c->Message(0, "Error: #size: Size can not be greater than 255.");
		else if (newsize < 0)
			c->Message(0, "Error: #size: Size can not be less than 0.");
		else
			if (c->GetTarget())
				c->GetTarget()->ChangeSize(newsize, true);
			else
				c->ChangeSize(newsize, true);
	}
}

void command_mana(Client *c, const Seperator *sep)
{
	Mob *t;
	
	t = c->GetTarget() ? c->GetTarget() : c;

	if(t->IsClient())
		t->CastToClient()->SetMana(t->CastToClient()->CalcMaxMana());
	else
		t->SetMana(t->CalcMaxMana());
}

void command_flymode(Client *c, const Seperator *sep)
{
  Client *t=c;

	if (strlen(sep->arg[1]) == 1 && !(sep->arg[1][0] == '0' || sep->arg[1][0] == '1' || sep->arg[1][0] == '2'))
		c->Message(0, "#flymode [0/1/2]");
	else {
		if(c->GetTarget() && c->GetTarget()->IsClient())
			t=c->GetTarget()->CastToClient();
		t->SendAppearancePacket(AT_Levitate, atoi(sep->arg[1]));
		if (sep->arg[1][0] == '1')
			c->Message(0, "Turning %s's Flymode ON", t->GetName());
		else if (sep->arg[1][0] == '2')
			c->Message(0, "Turning %s's Flymode LEV", t->GetName());
		else
			c->Message(0, "Turning %s's Flymode OFF", t->GetName());
	}
}

void command_showskills(Client *c, const Seperator *sep)
{
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient())
		t=c->GetTarget()->CastToClient();

	c->Message(0, "Skills for %s", t->GetName());
	for (SkillType i=_1H_BLUNT; i <= HIGHEST_SKILL; i=(SkillType)(i+1))
		c->Message(0, "Skill [%d] is at [%d]", i, t->GetSkill(i));
}

void command_findspell(Client *c, const Seperator *sep)
{
	if (sep->arg[1][0] == 0)
		c->Message(0, "Usage: #FindSpell [spellname]");
	else if (!spells_loaded)
		c->Message(0, "Spells not loaded");
	else if (Seperator::IsNumber(sep->argplus[1])) {
		int spellid = atoi(sep->argplus[1]);
		if (spellid <= 0 || spellid >= SPDAT_RECORDS) {
			c->Message(0, "Error: Number out of range");
		}
		else {
			c->Message(0, "  %i: %s", spellid, spells[spellid].name);
		}
	}
	else {
		int count=0;
		//int iSearchLen = strlen(sep->argplus[1])+1;
		char sName[64];
		char sCriteria[65];
		strncpy(sCriteria, sep->argplus[1], 64);
		strupr(sCriteria);
		for (int i=0; i<SPDAT_RECORDS; i++) {
			if (spells[i].name[0] != 0) {
				strcpy(sName, spells[i].name);

				strupr(sName);
				char* pdest = strstr(sName, sCriteria);
				if ((pdest != NULL) && (count <=20)) {
					c->Message(0, "  %i: %s", i, spells[i].name);
					count++;
				}
				else if (count > 20)
					break;
			}
		}
		if (count > 20)
			c->Message(0, "20 spells found... max reached.");
		else
			c->Message(0, "%i spells found.", count);
	}
}

void command_castspell(Client *c, const Seperator *sep)
{
	if (!sep->IsNumber(1))
		c->Message(0, "Usage: #CastSpell spellid");
	else {
		int16 spellid = atoi(sep->arg[1]);
		/*
		Spell restrictions.
		*/
		if ((spellid == 2859 || spellid == 841 || spellid == 300 || spellid == 2314 ||
			spellid == 3716 || spellid == 911 || spellid == 3014 || spellid == 982 ||
			spellid == 905 || spellid == 2079 || spellid == 1218 || spellid == 819 ||
			spellid >= 780 && spellid <= 785 || spellid >= 1200 && spellid <= 1205 ||
			spellid >= 1342 && spellid <= 1348 || spellid == 1923 || spellid == 1924 || spellid == 3355) &&
			c->Admin() < commandCastSpecials)
			c->Message(13, "Unable to cast spell.");
		else if (spellid >= SPDAT_RECORDS)
			c->Message(0, "Error: #CastSpell: Arguement out of range");
		else
			if (c->GetTarget() == 0)
				if(c->Admin() >= commandInstacast)
					c->SpellFinished(spellid, 0, 10, 0);
				else
					c->CastSpell(spellid, 0, 10, 0);
			else
				if(c->Admin() >= commandInstacast)
					c->SpellFinished(spellid, c->GetTarget(), 10, 0);
				else
					c->CastSpell(spellid, c->GetTarget()->GetID(), 10, 0);
	}
}

void command_setlanguage(Client *c, const Seperator *sep) 
{
	if ( strcasecmp( sep->arg[1], "list" ) == 0 )
	{
		c->Message(0, "Languages:");
		c->Message(0, "     (0) Common Tongue");
		c->Message(0, "     (1) Barbarian");
		c->Message(0, "     (2) Erudian");
		c->Message(0, "     (3) Elvish");
		c->Message(0, "     (4) Dark Elvish");
		c->Message(0, "     (5) Dwarvish");
		c->Message(0, "     (6) Troll");
		c->Message(0, "     (7) Ogre");
		c->Message(0, "     (8) Gnomish");
		c->Message(0, "     (9) Halfling");
		c->Message(0, "    (10) Thieves Cant");
		c->Message(0, "    (11) Old Erudian");
		c->Message(0, "    (12) Elder Elvish");
		c->Message(0, "    (13) Froglok");
		c->Message(0, "    (14) Goblin");
		c->Message(0, "    (15) Gnoll");
		c->Message(0, "    (16) Combine Tongue");
		c->Message(0, "    (17) Elder Teir`Dal");
		c->Message(0, "    (18) Lizardman");
		c->Message(0, "    (19) Orcish");
		c->Message(0, "    (20) Faerie");
		c->Message(0, "    (21) Dragon");
		c->Message(0, "    (22) Elder Dragon");
		c->Message(0, "    (23) Dark Speech");
		c->Message(0, "    (24) Vah Shir");
		c->Message(0, "    (25) Unknown1");
		c->Message(0, "    (26) Unknown2");
	}
	else if( c->GetTarget() == 0 )
	{
		c->Message(0, "Error: #setlanguage: No target.");
	}
	else if( !c->GetTarget()->IsClient() )
	{
		c->Message(0, "Error: Target must be a player.");
	}
	else if (
				!sep->IsNumber(1) || atoi(sep->arg[1]) < 0 || atoi(sep->arg[1]) > 26 ||
				!sep->IsNumber(2) || atoi(sep->arg[2]) < 0 || atoi(sep->arg[2]) > 100
			)
	{
		c->Message(0, "Usage: #setlanguage [language ID] [value] (0-26, 0-100)");
		c->Message(0, "Try #setlanguage list for a list of language IDs");
	}
	else
	{
		LogFile->write(EQEMuLog::Normal,"Set language request from %s, target:%s lang_id:%i value:%i", c->GetName(), c->GetTarget()->GetName(), atoi(sep->arg[1]), atoi(sep->arg[2]) );
		int8 langid = (int8)atoi(sep->arg[1]);
		int8 value = (int8)atoi(sep->arg[2]);
		c->GetTarget()->CastToClient()->SetLanguageSkill( langid, value );
	}
}

void command_setskill(Client *c, const Seperator *sep)
{
	if (c->GetTarget() == NULL) {
		c->Message(0, "Error: #setskill: No target.");
	}
	else if (!c->GetTarget()->IsClient()) {
		c->Message(0, "Error: #setskill: Target must be a client.");
	}
	else if (	
						!sep->IsNumber(1) || atoi(sep->arg[1]) < 0 || atoi(sep->arg[1]) > HIGHEST_SKILL ||
						!sep->IsNumber(2) || atoi(sep->arg[2]) < 0 || atoi(sep->arg[2]) > HIGHEST_CAN_SET_SKILL
					)
	{
		c->Message(0, "Usage: #setskill skill x ");
		c->Message(0, "       skill = 0 to %d", HIGHEST_SKILL);
		c->Message(0, "       x = 0 to %d", HIGHEST_CAN_SET_SKILL);
	}
	else {
		LogFile->write(EQEMuLog::Normal,"Set skill request from %s, target:%s skill_id:%i value:%i", c->GetName(), c->GetTarget()->GetName(), atoi(sep->arg[1]), atoi(sep->arg[2]) );
		int skill_num = atoi(sep->arg[1]);
		int16 skill_value = atoi(sep->arg[2]);
		if(skill_num < HIGHEST_SKILL)
			c->GetTarget()->CastToClient()->SetSkill((SkillType)skill_num, skill_value);
	}
}

void command_setskillall(Client *c, const Seperator *sep)
{
	if (c->GetTarget() == 0)
		c->Message(0, "Error: #setallskill: No target.");
	else if (!c->GetTarget()->IsClient())
		c->Message(0, "Error: #setskill: Target must be a client.");
	else if (!sep->IsNumber(1) || atoi(sep->arg[1]) < 0 || atoi(sep->arg[1]) > HIGHEST_CAN_SET_SKILL) {
		c->Message(0, "Usage: #setskillall value ");
		c->Message(0, "       value = 0 to %d", HIGHEST_CAN_SET_SKILL);
	}
	else {
		if (c->Admin() >= commandSetSkillsOther || c->GetTarget()==c || c->GetTarget()==0) {
			LogFile->write(EQEMuLog::Normal,"Set ALL skill request from %s, target:%s", c->GetName(), c->GetTarget()->GetName());
			int16 level = atoi(sep->arg[1]);
			for(SkillType skill_num=_1H_BLUNT;skill_num <= HIGHEST_SKILL;skill_num=(SkillType)(skill_num+1)) {
				c->GetTarget()->CastToClient()->SetSkill(skill_num, level);
			}
		}
		else
			c->Message(0, "Error: Your status is not high enough to set anothers skills");
	}
}

void command_race(Client *c, const Seperator *sep)
{
  Mob *t=c->CastToMob();

	// @merth: Need to figure out max race for LoY/LDoN: going with upper bound of 500 now for testing
	if (sep->IsNumber(1) && atoi(sep->arg[1]) >= 0 && atoi(sep->arg[1]) <= 500) {
		if ((c->GetTarget()) && c->Admin() >= commandRaceOthers)
			t=c->GetTarget();
		t->SendIllusionPacket(atoi(sep->arg[1]));
	}
	else
		c->Message(0, "Usage: #race [0-500]  (0 for back to normal)");
}

void command_gender(Client *c, const Seperator *sep)
{
  Mob *t=c->CastToMob();

	if (sep->IsNumber(1) && atoi(sep->arg[1]) >= 0 && atoi(sep->arg[1]) <= 500) {
		if ((c->GetTarget()) && c->Admin() >= commandGenderOthers)
			t=c->GetTarget();
		t->SendIllusionPacket(t->GetRace(), atoi(sep->arg[1]));
	}
	else
		c->Message(0, "Usage: #gender [0/1/2]");
}

void command_makepet(Client *c, const Seperator *sep)
{
	if (sep->arg[1][0] == '\0')
		c->Message(0, "Usage: #makepet pet_type_name (will not survive across zones)");
	else
		c->MakePet(0, sep->arg[1]);
}

void command_level(Client *c, const Seperator *sep)
{
	int16 level = atoi(sep->arg[1]);
	if ((level <= 0) || ((level > RuleI(Character, MaxLevel)) && (c->Admin() < commandLevelAboveCap)) )
		c->Message(0, "Error: #Level: Invalid Level");
	else if (c->Admin() < 100)
		c->SetLevel(level, true);
	else if (!c->GetTarget())
		c->Message(0, "Error: #Level: No target");
	else
		if (!c->GetTarget()->IsNPC() && ((c->Admin() < commandLevelNPCAboveCap) && (level > RuleI(Character, MaxLevel))))
			c->Message(0, "Error: #Level: Invalid Level");
		else
			c->GetTarget()->SetLevel(level, true);
	if(c->GetTarget() && c->GetTarget()->IsClient())
		c->GetTarget()->CastToClient()->SendLevelAppearance();
}

void command_spawn(Client *c, const Seperator *sep)
{
	// Image's Spawn Code -- Rewrite by Scruffy
	if (sep->arg[1][0] != 0){
		Client* client = entity_list.GetClientByName(sep->arg[1]);
		if(client){
				c->Message(0,"You cannot spawn a mob with the same name as a character!");
				return;
		}
	}
	#if EQDEBUG >= 11
		LogFile->write(EQEMuLog::Debug,"#spawn Spawning:");
	#endif
	
	// Well it needs a name!!!
	NPC* npc = NPC::SpawnNPC(sep->argplus[1], c->GetX(), c->GetY(), c->GetZ(), c->GetHeading(), c);
	if (npc) {
		// Disgrace: add some loot to it!
		npc->AddCash();
/*
		int itemcount = MakeRandomInt(1,5);
		for (int counter=0; counter<itemcount; counter++) {
			const Item_Struct* item = 0;
			while (item == 0)
			item = database.GetItem(rand() % 33000);
			npc->AddItem(item, 0, 0);
		}
*/
	}
	else {
		c->Message(0, "Format: #spawn name race level material hp gender class priweapon secweapon merchantid bodytype - spawns a npc those parameters.");
		c->Message(0, "Name Format: NPCFirstname_NPCLastname - All numbers in a name are stripped and \"_\" characters become a space.");
		c->Message(0, "Note: Using \"-\" for gender will autoselect the gender for the race. Using \"-\" for HP will use the calculated maximum HP.");
	}
}

void command_texture(Client *c, const Seperator *sep)
{
	if (sep->IsNumber(1) && atoi(sep->arg[1]) >= 0 && atoi(sep->arg[1]) <= 255) {
		int tmp;
		if (sep->IsNumber(2) && atoi(sep->arg[2]) >= 0 && atoi(sep->arg[2]) <= 255)
			tmp = atoi(sep->arg[2]);
		else if (atoi(sep->arg[1]) == 255)
			tmp = atoi(sep->arg[1]);
		else if ((c->GetRace() > 0 && c->GetRace() <= 12) || c->GetRace() == 128 || c->GetRace() == 130)
			tmp = 0;
		else
			tmp = atoi(sep->arg[1]);
		if ((c->GetTarget()) && (c->Admin() >= commandTextureOthers))
			c->GetTarget()->SendIllusionPacket(c->GetTarget()->GetRace(), 0xFF, atoi(sep->arg[1]), tmp);
		else
			c->SendIllusionPacket(c->GetRace(), 0xFF, atoi(sep->arg[1]), tmp);
	}
	else
		c->Message(0, "Usage: #texture [texture] [helmtexture]  (0-255, 255 for show equipment)");
}

void command_npctypespawn(Client *c, const Seperator *sep)
{
	if (sep->IsNumber(1)) {
		const NPCType* tmp = 0;
		if ((tmp = database.GetNPCType(atoi(sep->arg[1])))) {
			//tmp->fixedZ = 1;
			NPC* npc = new NPC(tmp, 0, c->GetX(), c->GetY(), c->GetZ(), c->GetHeading());
			if (npc && sep->IsNumber(2))
				npc->SetNPCFactionID(atoi(sep->arg[2]));

				npc->AddLootTable();
			entity_list.AddNPC(npc);
		}
		else
			c->Message(0, "NPC Type %i not found", atoi(sep->arg[1]));
	}
	else
		c->Message(0, "Usage: #npctypespawn npctypeid factionid");

}

void command_heal(Client *c, const Seperator *sep)
{
	if (c->GetTarget()==0)
		c->Message(0, "Error: #Heal: No Target.");
	else
		c->GetTarget()->Heal();
}

void command_appearance(Client *c, const Seperator *sep)
{
	Mob *t=c->CastToMob();

	// sends any appearance packet
	// Dev debug command, for appearance types
	if (sep->arg[2][0] == 0)
		c->Message(0, "Usage: #appearance type value");
	else {
		if ((c->GetTarget()))
			t=c->GetTarget();
		t->SendAppearancePacket(atoi(sep->arg[1]), atoi(sep->arg[2]));
		c->Message(0, "Sending appearance packet: target=%s, type=%s, value=%s", t->GetName(), sep->arg[1], sep->arg[2]);
	}
}

void command_charbackup(Client *c, const Seperator *sep)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES* result;
	MYSQL_ROW row;
	if (strcasecmp(sep->arg[1], "list") == 0) {
		int32 charid = 0;
		if (sep->IsNumber(2))
			charid = atoi(sep->arg[2]);
		else
			database.GetAccountIDByChar(sep->arg[2], &charid);
		if (charid) {
			if (database.RunQuery(query, MakeAnyLenString(&query, 
				"Select id, backupreason, charid, account_id, zoneid, DATE_FORMAT(ts, '%%m/%%d/%%Y %%H:%%i:%%s') "
				" from character_backup where charid=%u", charid), errbuf, &result)) {
				safe_delete(query);
				int32 x = 0;
				while ((row = mysql_fetch_row(result))) {
					c->Message(0, " %u: %s, %s (%u), reason=%u", atoi(row[0]), row[5], database.GetZoneName(atoi(row[4])), atoi(row[4]), atoi(row[1]));
					x++;
				}
				c->Message(0, " %u backups found.", x);
				mysql_free_result(result);
			}
			else {
				c->Message(13, "Query error: '%s' %s", query, errbuf);
				safe_delete(query);
			}
		}
		else
			c->Message(0, "Usage: #charbackup list [char name/id]");
	}
	else if (strcasecmp(sep->arg[1], "restore") == 0) {
		int32 charid = 0;
		if (sep->IsNumber(2))
			charid = atoi(sep->arg[2]);
		else
			database.GetAccountIDByChar(sep->arg[2], &charid);
		
		if (charid && sep->IsNumber(3)) {
			int32 cbid = atoi(sep->arg[3]);
			if (database.RunQuery(query, MakeAnyLenString(&query, 
				"Insert into character_backup (backupreason, charid, account_id, name, profile, level, class, x, y, z, zoneid, alt_adv) "
				" select 1, id, account_id, name, profile, level, class, x, y, z, zoneid, alt_adv from character_ where id=%u", charid), errbuf)) {
				if (database.RunQuery(query, MakeAnyLenString(&query, 
					"update character_ inner join character_backup on character_.id = character_backup.charid "
					" set character_.name = character_backup.name, "
					" character_.profile = character_backup.profile, "
					" character_.level = character_backup.level, "
					" character_.class = character_backup.class, "
					" character_.x = character_backup.x, "
					" character_.y = character_backup.y, "
					" character_.z = character_backup.z, "
					" character_.zoneid = character_backup.zoneid "
					" where character_backup.charid=%u and character_backup.id=%u", charid, cbid), errbuf)) {
					safe_delete(query);
					c->Message(0, "Character restored.");
				}
				else {
					c->Message(13, "Query error: '%s' %s", query, errbuf);
					safe_delete(query);
				}
			}
			else {
				c->Message(13, "Query error: '%s' %s", query, errbuf);
				safe_delete(query);
			}
		}
		else
			c->Message(0, "Usage: #charbackup list [char name/id]");
	}
	else {
		c->Message(0, "#charbackup sub-commands:");
		c->Message(0, "  list [char name/id]");
		c->Message(0, "  restore [char name/id] [backup#]");
	}
}

void command_nukeitem(Client *c, const Seperator *sep)
{
	int numitems, itemid;

	if (c->GetTarget() && c->GetTarget()->IsClient() && (sep->IsNumber(1) || sep->IsHexNumber(1))) {
		itemid=sep->IsNumber(1)?atoi(sep->arg[1]):hextoi(sep->arg[1]);
		numitems = c->GetTarget()->CastToClient()->NukeItem(itemid);
		c->Message(0, " %u items deleted", numitems);
	}
	else
		c->Message(0, "Usage: (targted) #nukeitem itemnum - removes the item from the player's inventory");
}

void command_peekinv(Client *c, const Seperator *sep)
{
	// Displays what the server thinks the user has in inventory
	if (!c->GetTarget() || !c->GetTarget()->IsClient()) {
		c->Message(0, "You must have a PC target selected for this command");
		return;
	}
		
	bool bAll = (strcasecmp(sep->arg[1], "all") == 0);
	bool bFound = false;
	Client* client = c->GetTarget()->CastToClient();
	const Item_Struct* item = NULL;
	c->Message(0, "Displaying inventory for %s...", client->GetName());
		
	if (bAll || (strcasecmp(sep->arg[1], "worn")==0)) {
		// Worn items
		bFound = true;
		for (sint16 i=0; i<=21; i++) {
			const ItemInst* inst = client->GetInv().GetItem(i);
			item = (inst) ? inst->GetItem() : NULL;
			c->Message((item==0), "WornSlot: %i, Item: %i (%s)", i,
				((item==0)?0:item->ID), ((item==0)?"null":item->Name));
		}
	}
	if (bAll || (strcasecmp(sep->arg[1], "inv")==0)) {
		// Personal inventory items
		bFound = true;
		for (sint16 i=22; i<=29; i++) {
			const ItemInst* inst = client->GetInv().GetItem(i);
			item = (inst) ? inst->GetItem() : NULL;
			c->Message((item==0), "InvSlot: %i, Item: %i (%s)", i,
			((item==0)?0:item->ID), ((item==0)?"null":item->Name));
			
			if (inst && inst->IsType(ItemClassContainer)) {
				for (uint8 j=0; j<10; j++) {
					const ItemInst* instbag = client->GetInv().GetItem(i, j);
					item = (instbag) ? instbag->GetItem() : NULL;
					c->Message((item==0), "   InvBagSlot: %i (Slot #%i, Bag #%i), Item: %i (%s)",
						Inventory::CalcSlotId(i, j),
						i, j, ((item==0)?0:item->ID),
						((item==0)?"null":item->Name));
				}
			}
		}
	}
	if (bAll || (strcasecmp(sep->arg[1], "cursor")==0)) {
		// Personal inventory items
		bFound = true;
		iter_queue it;
		int i=0;
		for(it=client->GetInv().cursor_begin();it!=client->GetInv().cursor_end();it++,i++) {
			const ItemInst* inst = *it;
			item = (inst) ? inst->GetItem() : NULL;
			c->Message((item==0), "CursorSlot: %i, Depth: %i, Item: %i (%s)", SLOT_CURSOR,i,
				((item==0)?0:item->ID), ((item==0)?"null":item->Name));
			
			if (inst && inst->IsType(ItemClassContainer)) {
				for (uint8 j=0; j<10; j++) {
					const ItemInst* instbag = client->GetInv().GetItem(SLOT_CURSOR, j);
					item = (instbag) ? instbag->GetItem() : NULL;
					c->Message((item==0), "   CursorBagSlot: %i (Slot #%i, Bag #%i), Item: %i (%s)",
						Inventory::CalcSlotId(SLOT_CURSOR, j),
						SLOT_CURSOR, j, ((item==0)?0:item->ID),
						((item==0)?"null":item->Name));
				}
			}
		}
	}
	if (bAll || (strcasecmp(sep->arg[1], "bank")==0)) {
		// Bank and shared bank items
		bFound = true;
		sint16 i = 0;
		for (i=2000; i<=2015; i++) {
			const ItemInst* inst = client->GetInv().GetItem(i);
			item = (inst) ? inst->GetItem() : NULL;
			c->Message((item==0), "BankSlot: %i, Item: %i (%s)", i,
				((item==0)?0:item->ID), ((item==0)?"null":item->Name));
				
			if (inst && inst->IsType(ItemClassContainer)) {
				for (uint8 j=0; j<10; j++) {
					const ItemInst* instbag = client->GetInv().GetItem(i, j);
					item = (instbag) ? instbag->GetItem() : NULL;
					c->Message((item==0), "   BankBagSlot: %i (Slot #%i, Bag #%i), Item: %i (%s)",
						Inventory::CalcSlotId(i, j),
						i, j, ((item==0)?0:item->ID),
						((item==0)?"null":item->Name));
				}
			}
		}
		for (i=2500; i<=2501; i++) {
			const ItemInst* inst = client->GetInv().GetItem(i);
			item = (inst) ? inst->GetItem() : NULL;
			c->Message((item==0), "ShBankSlot: %i, Item: %i (%s)", i,
				((item==0)?0:item->ID), ((item==0)?"null":item->Name));
			
			if (inst && inst->IsType(ItemClassContainer)) {
				for (uint8 j=0; j<10; j++) {
					const ItemInst* instbag = client->GetInv().GetItem(i, j);
					item = (instbag) ? instbag->GetItem() : NULL;
					c->Message((item==0), "   ShBankBagSlot: %i (Slot #%i, Bag #%i), Item: %i (%s)",
						Inventory::CalcSlotId(i, j),
						i, j, ((item==0)?0:item->ID),
						((item==0)?"null":item->Name));
				}
			}
		}
	}
	if (bAll || (strcasecmp(sep->arg[1], "trade")==0)) {
		// Items in trade window (current trader only, not the other trader)
		bFound = true;
		for (sint16 i=3000; i<=3007; i++) {
			const ItemInst* inst = client->GetInv().GetItem(i);
			item = (inst) ? inst->GetItem() : NULL;
			c->Message((item==0), "TradeSlot: %i, Item: %i (%s)", i,
				((item==0)?0:item->ID), ((item==0)?"null":item->Name));
			
			if (inst && inst->IsType(ItemClassContainer)) {
				for (uint8 j=0; j<10; j++) {
					const ItemInst* instbag = client->GetInv().GetItem(i, j);
					item = (instbag) ? instbag->GetItem() : NULL;
					c->Message((item==0), "   TradeBagSlot: %i (Slot #%i, Bag #%i), Item: %i (%s)",
						Inventory::CalcSlotId(i, j),
						i, j, ((item==0)?0:item->ID),
						((item==0)?"null":item->Name));
				
				}
			}
		}
	}
		
	if (!bFound) {
		c->Message(0, "Usage: #peekinv [worn|cursor|inv|bank|trade|all]");
		c->Message(0, "  Displays a portion of the targetted user's inventory");
		c->Message(0, "  Caution: 'all' is a lot of information!");
	}
}

void command_findnpctype(Client *c, const Seperator *sep)
{
   if(sep->arg[1][0] == 0)
      c->Message(0, "Usage: #findnpctype [search criteria]");
   else
   {
      int id;
      int count;
      const int maxrows = 20;
      char errbuf[MYSQL_ERRMSG_SIZE];
	   char *query;
	   MYSQL_RES *result;
	   MYSQL_ROW row;

      query = new char[256];

      // If id evaluates to 0, then search as if user entered a string.
      if ((id = atoi((const char *)sep->arg[1])) == 0)
         MakeAnyLenString(&query,
            "SELECT id,name"
            " FROM npc_types WHERE name LIKE '%%%s%%'",
            sep->arg[1]);
      // Otherwise, look for just that npc id.
      else
         MakeAnyLenString(&query,
            "SELECT id,name FROM npc_types WHERE id=%i", id);

      // If query runs successfully.
      if (database.RunQuery(query, strlen(query), errbuf, &result))
	   {
         count = 0;

         // Process each row returned.
		   while((row = mysql_fetch_row(result)))
		   {
            // Limit to returning maxrows rows.
            if (++count > maxrows)
            {
               c->Message (0,
                  "%i npc types shown. Too many results.", maxrows);
               break;
            }
            c->Message (0, "  %s: %s", row[0], row[1]);
         }

         // If we did not hit the maxrows limit.
         if (count <= maxrows)
            c->Message (0, "Query complete. %i rows shown.", count);
         // No matches found.
         else if (count == 0)
            c->Message (0, "No matches found for %s.", sep->arg[1]);

         mysql_free_result(result);
      }
      // If query failed.
      else
      {
         c->Message (0, "Error querying database.");
         c->Message (0, query);
      }

	   safe_delete_array(query);
   }
}

void command_viewnpctype(Client *c, const Seperator *sep)
{
	if (!sep->IsNumber(1))
		c->Message(0, "Usage: #viewnpctype [npctype id]");
	else
	{
		uint32 npctypeid=atoi(sep->arg[1]);
		const NPCType* npct = database.GetNPCType(npctypeid);
		if (npct) {
			c->Message(0, " NPCType Info, ");
			c->Message(0, "  NPCTypeID: %u", npct->npc_id);
			c->Message(0, "  Name: %s", npct->name);
			c->Message(0, "  Level: %i", npct->level);
			c->Message(0, "  Race: %i", npct->race);
			c->Message(0, "  Class: %i", npct->class_);
			c->Message(0, "  MinDmg: %i", npct->min_dmg);
			c->Message(0, "  MaxDmg: %i", npct->max_dmg);
			c->Message(0, "  Attacks: %s", npct->npc_attacks);
			c->Message(0, "  Spells: %i", npct->npc_spells_id);
			c->Message(0, "  Loot Table: %i", npct->loottable_id);
			c->Message(0, "  NPCFactionID: %i", npct->npc_faction_id);
		}
		else
			c->Message(0, "NPC #%d not found", npctypeid);
	}
}

void command_reloadqst(Client *c, const Seperator *sep)
{
	c->Message(0, "Clearing quest memory cache.");
	parse->ReloadQuests();
}

void command_reloadzps(Client *c, const Seperator *sep)
{
	database.LoadStaticZonePoints(&zone->zone_point_list,zone->GetShortName());
	c->Message(0, "Reloading server zone_points.");
}

void command_zoneshutdown(Client *c, const Seperator *sep)
{
	if (!worldserver.Connected())
		c->Message(0, "Error: World server disconnected");
	else if (sep->arg[1][0] == 0)
		c->Message(0, "Usage: #zoneshutdown zoneshortname");
	else {
		ServerPacket* pack = new ServerPacket(ServerOP_ZoneShutdown, sizeof(ServerZoneStateChange_struct));
		ServerZoneStateChange_struct* s = (ServerZoneStateChange_struct *) pack->pBuffer;
		strcpy(s->adminname, c->GetName());
		if (sep->arg[1][0] >= '0' && sep->arg[1][0] <= '9')
			s->ZoneServerID = atoi(sep->arg[1]);
		else
			s->zoneid = database.GetZoneID(sep->arg[1]);
		worldserver.SendPacket(pack);
		safe_delete(pack);
	}
}

void command_zonebootup(Client *c, const Seperator *sep)
{
	if (!worldserver.Connected())
		c->Message(0, "Error: World server disconnected");
	else if (sep->arg[2][0] == 0) {
		c->Message(0, "Usage: #zonebootup ZoneServerID# zoneshortname");
	}
	else {
		ServerPacket* pack = new ServerPacket(ServerOP_ZoneBootup, sizeof(ServerZoneStateChange_struct));
		ServerZoneStateChange_struct* s = (ServerZoneStateChange_struct *) pack->pBuffer;
		s->ZoneServerID = atoi(sep->arg[1]);
		strcpy(s->adminname, c->GetName());
		s->zoneid = database.GetZoneID(sep->arg[2]);
		s->makestatic = (bool) (strcasecmp(sep->arg[3], "static") == 0);
		worldserver.SendPacket(pack);
		safe_delete(pack);
	}
}

void command_kick(Client *c, const Seperator *sep)
{
	if (sep->arg[1][0] == 0)
		c->Message(0, "Usage: #kick [charname]");
	else {
		Client* client = entity_list.GetClientByName(sep->arg[1]);
		if (client != 0) {
			if (client->Admin() <= c->Admin()) {
				client->Message(0, "You have been kicked by %s",c->GetName());
				EQApplicationPacket* outapp = new EQApplicationPacket(OP_GMKick,0);
				client->QueuePacket(outapp);
				client->Kick();
				c->Message(0, "Kick: local: kicking %s", sep->arg[1]);
			}
		}
		else if (!worldserver.Connected())
			c->Message(0, "Error: World server disconnected");
		else {
			ServerPacket* pack = new ServerPacket(ServerOP_KickPlayer, sizeof(ServerKickPlayer_Struct));
			ServerKickPlayer_Struct* skp = (ServerKickPlayer_Struct*) pack->pBuffer;
			strcpy(skp->adminname, c->GetName());
			strcpy(skp->name, sep->arg[1]);
			skp->adminrank = c->Admin();
			worldserver.SendPacket(pack);
			safe_delete(pack);
		}
	}
}

void command_attack(Client *c, const Seperator *sep)
{
	if (c->GetTarget() && c->GetTarget()->IsNPC() && sep->arg[1] != 0) {
		Mob* sictar = entity_list.GetMob(sep->argplus[1]);
		if (sictar)
			c->GetTarget()->CastToNPC()->AddToHateList(sictar, 1, 0);
		else
			c->Message(0, "Error: %s not found", sep->arg[1]);
	}
	else
		c->Message(0, "Usage: (needs NPC targeted) #attack targetname");
}

void command_lock(Client *c, const Seperator *sep)
{
	ServerPacket* outpack = new ServerPacket(ServerOP_Lock, sizeof(ServerLock_Struct));
	ServerLock_Struct* lss = (ServerLock_Struct*) outpack->pBuffer;
	strcpy(lss->myname, c->GetName());
	lss->mode = 1;
	worldserver.SendPacket(outpack);
	safe_delete(outpack);
}

void command_unlock(Client *c, const Seperator *sep)
{
	ServerPacket* outpack = new ServerPacket(ServerOP_Lock, sizeof(ServerLock_Struct));
	ServerLock_Struct* lss = (ServerLock_Struct*) outpack->pBuffer;
	strcpy(lss->myname, c->GetName());
	lss->mode = 0;
	worldserver.SendPacket(outpack);
	safe_delete(outpack);
}

void command_motd(Client *c, const Seperator *sep)
{
	ServerPacket* outpack = new ServerPacket(ServerOP_Motd, sizeof(ServerMotd_Struct));
	ServerMotd_Struct* mss = (ServerMotd_Struct*) outpack->pBuffer;
	strncpy(mss->myname, c->GetName(),64);
	strncpy(mss->motd, sep->argplus[1],512);
	worldserver.SendPacket(outpack);
	safe_delete(outpack);
}

void command_listpetition(Client *c, const Seperator *sep)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	int blahloopcount=0;
	if (database.RunQuery(query, MakeAnyLenString(&query, "SELECT petid, charname, accountname from petitions order by petid"), errbuf, &result)) {
		LogFile->write(EQEMuLog::Normal,"Petition list requested by %s", c->GetName());
		while ((row = mysql_fetch_row(result))) {
			if (blahloopcount==0) {
				blahloopcount=1;
				c->Message(13,"	ID : Character Name , Account Name");
			}
			c->Message(15, " %s:	%s , %s ",row[0],row[1],row[2]);
		}
		mysql_free_result(result);
	}
	safe_delete_array(query);
}

void command_equipitem(Client *c, const Seperator *sep)
{
	uint32 slot_id = atoi(sep->arg[1]);
	if (sep->IsNumber(1) && (slot_id>=0) && (slot_id<=21)) {
		const ItemInst* inst = c->GetInv().GetItem(SLOT_CURSOR);
		if (inst && inst->IsType(ItemClassCommon)) {
			EQApplicationPacket* outapp = new EQApplicationPacket(OP_MoveItem, sizeof(MoveItem_Struct));
			MoveItem_Struct* mi	= (MoveItem_Struct*)outapp->pBuffer;
			mi->from_slot		= SLOT_CURSOR;
			mi->to_slot			= slot_id;
			mi->number_in_stack	= inst->GetCharges();
				
			// Save move changes
			c->SwapItem(mi);
			c->FastQueuePacket(&outapp);
			
			// @merth: also send out a wear change packet?
		}
		else if (inst == NULL)
			c->Message(13, "Error: There is no item on your cursor");
		else
			c->Message(13, "Error: Item on your cursor cannot be equipped");
	}
	else
		c->Message(0, "Usage: #equipitem slotid[0-21] - equips the item on your cursor to the position");
}

void command_zonelock(Client *c, const Seperator *sep)
{
	ServerPacket* pack = new ServerPacket(ServerOP_LockZone, sizeof(ServerLockZone_Struct));
	ServerLockZone_Struct* s = (ServerLockZone_Struct*) pack->pBuffer;
	strncpy(s->adminname, c->GetName(), sizeof(s->adminname));
	if (strcasecmp(sep->arg[1], "list") == 0) {
		s->op = 0;
		worldserver.SendPacket(pack);
	}
	else if (strcasecmp(sep->arg[1], "lock") == 0 && c->Admin() >= commandLockZones) {
		int16 tmp = database.GetZoneID(sep->arg[2]);
		if (tmp) {
			s->op = 1;
			s->zoneID = tmp;
			worldserver.SendPacket(pack);
		}
		else
			c->Message(0, "Usage: #zonelock lock [zonename]");
	}
	else if (strcasecmp(sep->arg[1], "unlock") == 0 && c->Admin() >= commandLockZones) {
		int16 tmp = database.GetZoneID(sep->arg[2]);
		if (tmp) {
			s->op = 2;
			s->zoneID = tmp;
			worldserver.SendPacket(pack);
		}
		else
			c->Message(0, "Usage: #zonelock unlock [zonename]");
	}
	else {
		c->Message(0, "#zonelock sub-commands");
		c->Message(0, "  list");
		if(c->Admin() >= commandLockZones)
		{
			c->Message(0, "  lock [zonename]");
			c->Message(0, "  unlock [zonename]");
		}
	}
	safe_delete(pack);
}

void command_corpse(Client *c, const Seperator *sep)
{
	Mob *target=c->GetTarget();

	if (strcasecmp(sep->arg[1], "DeletePlayerCorpses") == 0 && c->Admin() >= commandEditPlayerCorpses) {
		sint32 tmp = entity_list.DeletePlayerCorpses();
		if (tmp >= 0)
			c->Message(0, "%i corpses deleted.", tmp);
		else
			c->Message(0, "DeletePlayerCorpses Error #%i", tmp);
	}
	else if (strcasecmp(sep->arg[1], "delete") == 0) {
		if (target == 0 || !target->IsCorpse())
			c->Message(0, "Error: Target the corpse you wish to delete");
		else if (target->IsNPCCorpse()) {

			c->Message(0, "Depoping %s.", target->GetName());
			target->CastToCorpse()->Delete();
		}
		else if (c->Admin() >= commandEditPlayerCorpses) {
			c->Message(0, "Deleting %s.", target->GetName());
			target->CastToCorpse()->Delete();
		}
		else
			c->Message(0, "Insufficient status to delete player corpse.");
	}
	else if (strcasecmp(sep->arg[1], "ListNPC") == 0) {
		entity_list.ListNPCCorpses(c);
	}
	else if (strcasecmp(sep->arg[1], "ListPlayer") == 0) {
		entity_list.ListPlayerCorpses(c);
	}
	else if (strcasecmp(sep->arg[1], "DeleteNPCCorpses") == 0) {
		sint32 tmp = entity_list.DeleteNPCCorpses();
		if (tmp >= 0)
			c->Message(0, "%d corpses deleted.", tmp);
		else
			c->Message(0, "DeletePlayerCorpses Error #%d", tmp);
	}
	else if (strcasecmp(sep->arg[1], "charid") == 0 && c->Admin() >= commandEditPlayerCorpses) {
		if (target == 0 || !target->IsPlayerCorpse())
			c->Message(0, "Error: Target must be a player corpse.");
		else if (!sep->IsNumber(2))
			c->Message(0, "Error: charid must be a number.");
		else
			c->Message(0, "Setting CharID=%u on PlayerCorpse '%s'", target->CastToCorpse()->SetCharID(atoi(sep->arg[2])), target->GetName());
	}
	else if (strcasecmp(sep->arg[1], "ResetLooter") == 0) {
		if (target == 0 || !target->IsCorpse())
			c->Message(0, "Error: Target the corpse you wish to reset");
		else
			target->CastToCorpse()->ResetLooter();
	}
	else if (strcasecmp(sep->arg[1], "RemoveCash") == 0) {
		if (target == 0 || !target->IsCorpse())
			c->Message(0, "Error: Target the corpse you wish to remove the cash from");
		else if (!target->IsPlayerCorpse() || c->Admin() >= commandEditPlayerCorpses) {
			c->Message(0, "Removing Cash from %s.", target->GetName());
			target->CastToCorpse()->RemoveCash();
		}

		else
			c->Message(0, "Insufficient status to modify player corpse.");
	}

	else if (strcasecmp(sep->arg[1], "lock") == 0) {
		if (target == 0 || !target->IsCorpse())
			c->Message(0, "Error: Target must be a corpse.");
		else {
			target->CastToCorpse()->Lock();
			c->Message(0, "Locking %s...", target->GetName());
		}
	}
	else if (strcasecmp(sep->arg[1], "unlock") == 0) {
		if (target == 0 || !target->IsCorpse())
			c->Message(0, "Error: Target must be a corpse.");
		else {
			target->CastToCorpse()->UnLock();
			c->Message(0, "Unlocking %s...", target->GetName());
		}
	}
	else if (sep->arg[1][0] == 0 || strcasecmp(sep->arg[1], "help") == 0) {
		c->Message(0, "#Corpse Sub-Commands:");
		c->Message(0, "  DeleteNPCCorpses");
		c->Message(0, "  Delete - Delete targetted corpse");
		c->Message(0, "  ListNPC");
		c->Message(0, "  ListPlayer");
		c->Message(0, "  Lock - GM locks the corpse - cannot be looted by non-GM");
		c->Message(0, "  UnLock");
		c->Message(0, "  RemoveCash");
		c->Message(0, "  [to remove items from corpses, loot them]");
		c->Message(0, "Lead-GM status required to delete/modify player corpses");
		c->Message(0, "  DeletePlayerCorpses");
		c->Message(0, "  CharID [charid] - change player corpse's owner");
	}
	else
		c->Message(0, "Error, #corpse sub-command not found");
}

void command_fixmob(Client *c, const Seperator *sep)
{
	Mob *target=c->GetTarget();

	if (!sep->arg[1])
		c->Message(0,"Usage: #fixmob [nextrace|prevrace|gender|nexttexture|prevtexture|nexthelm|prevhelm]");
	else if (!target)
		c->Message(0,"Error: this command requires an NPC target");
	else if (strcasecmp(sep->arg[1], "nextrace") == 0) {
		// Set to next race
		if (target->GetRace() == 473) {
			target->SendIllusionPacket(0);
			c->Message(0, "Race=0");
		}
		else {
			target->SendIllusionPacket(target->GetRace()+1);
			c->Message(0, "Race=%i",target->GetRace());
		}
	}
	else if (strcasecmp(sep->arg[1], "prevrace") == 0) {
		// Set to previous race
		if (target->GetRace() == 0) {
			target->SendIllusionPacket(473);
			c->Message(0, "Race=%i",473);
		}
		else {
			target->SendIllusionPacket(target->GetRace()-1);
			c->Message(0, "Race=%i",target->GetRace());
		}
	}
	else if (strcasecmp(sep->arg[1], "gender") == 0) {
		// Cycle through the 3 gender modes
		if (target->GetGender() == 0) {
			target->SendIllusionPacket(target->GetRace(), 2);
			c->Message(0, "Gender=%i",2);
		}
		else {
			target->SendIllusionPacket(target->GetRace(), target->GetGender()-1);
			c->Message(0, "Gender=%i",target->GetGender());
		}
	}
	else if (strcasecmp(sep->arg[1], "nexttexture") == 0) {
		// Set to next texture
		if (target->GetTexture() == 25) {
			target->SendIllusionPacket(target->GetRace(), target->GetGender(), 0);
			c->Message(0, "Texture=0");
		}
		else {
			target->SendIllusionPacket(target->GetRace(), target->GetGender(), target->GetTexture()+1);
			c->Message(0, "Texture=%i",target->GetTexture());
		}
	}
	else if (strcasecmp(sep->arg[1], "prevtexture") == 0) {
		// Set to previous texture
		if (target->GetTexture() == 0) {
			target->SendIllusionPacket(target->GetRace(), target->GetGender(), 25);
			c->Message(0, "Texture=%i",25);
		}
		else {
			target->SendIllusionPacket(target->GetRace(), target->GetGender(), target->GetTexture()-1);
			c->Message(0, "Texture=%i",target->GetTexture());
		}
	}
	else if (strcasecmp(sep->arg[1], "nexthelm") == 0) {
		// Set to next helm.  Only noticed a difference on giants.
		if (target->GetHelmTexture() == 25) {
			target->SendIllusionPacket(target->GetRace(), target->GetGender(), target->GetTexture(), 0);
			c->Message(0, "HelmTexture=0");
		}
		else {
			target->SendIllusionPacket(target->GetRace(), target->GetGender(), target->GetTexture(), target->GetHelmTexture()+1);
			c->Message(0, "HelmTexture=%i",target->GetHelmTexture());
		}
	}
	else if (strcasecmp(sep->arg[1], "prevhelm") == 0) {
		// Set to previous helm.  Only noticed a difference on giants.
		if (target->GetHelmTexture() == 0) {
			target->SendIllusionPacket(target->GetRace(), target->GetGender(), target->GetTexture(), 25);
			c->Message(0, "HelmTexture=%i",25);
		}
		else {
			target->SendIllusionPacket(target->GetRace(), target->GetGender(), target->GetTexture(), target->GetHelmTexture()-1);
			c->Message(0, "HelmTexture=%i",target->GetHelmTexture());
		}
	}
}
void command_gmspeed(Client *c, const Seperator *sep)
{
	bool state=atobool(sep->arg[1]);
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient())
		t=c->GetTarget()->CastToClient();

	if(sep->arg[1][0] != 0) {
		database.SetGMSpeed(t->AccountID(), state?1:0);
		c->Message(0, "Turning GMSpeed %s for %s (zone to take effect)", state?"On":"Off",t->GetName());
	}
	else
		c->Message(0, "Usage: #gmspeed [on/off]");
}

void command_title(Client *c, const Seperator *sep)
{
	if (sep->arg[1][0]==0)
		c->Message(0, "Usage: #title [remove|text] - remove or set title to 'text'");
	else {
		Mob *target_mob = c->GetTarget();
		if(!target_mob)
			target_mob = c;
		if(!target_mob->IsClient()) {
			c->Message(13, "#title only works on players.");
			return;
		}
		Client *t = target_mob->CastToClient();
		
		bool removed = false;
		if(!strcasecmp(sep->arg[1], "remove")) {
			t->SetAATitle("");
			removed = true;
		} else
			t->SetAATitle(sep->arg[1]);
		t->Save();
		
		if(removed) {
			c->Message(13, "%s's title has been removed. They must zone for it to take effect.", t->GetName(), sep->arg[1]);
			if(t != c)
				t->Message(13, "Your title has been removed. You must zone for it to take effect.", sep->arg[1]);
		} else {
			c->Message(13, "%s's title has been changed to '%s'. They must zone for it to take effect.", t->GetName(), sep->arg[1]);
			if(t != c)
				t->Message(13, "Your title has been changed to '%s'. You must zone for it to take effect.", sep->arg[1]);
		}
	}
}

void command_spellinfo(Client *c, const Seperator *sep)
{
	if(sep->arg[1][0]==0)
		c->Message(0, "Usage: #spellinfo [spell_id]");
	else {
		short int spell_id=atoi(sep->arg[1]);
		const struct SPDat_Spell_Struct *s=&spells[spell_id];
		c->Message(0, "Spell info for spell #%d:", spell_id);
		c->Message(0, "  name: %s", s->name);
		c->Message(0, "  player_1: %s", s->player_1);
		c->Message(0, "  teleport_zone: %s", s->teleport_zone);
		c->Message(0, "  you_cast: %s", s->you_cast);
		c->Message(0, "  other_casts: %s", s->other_casts);
		c->Message(0, "  cast_on_you: %s", s->cast_on_you);
		c->Message(0, "  spell_fades: %s", s->spell_fades);
		c->Message(0, "  range: %f", s->range);
		c->Message(0, "  aoerange: %f", s->aoerange);
		c->Message(0, "  pushback: %f", s->pushback);
		c->Message(0, "  pushup: %f", s->pushup);
		c->Message(0, "  cast_time: %d", s->cast_time);
		c->Message(0, "  recovery_time: %d", s->recovery_time);
		c->Message(0, "  recast_time: %d", s->recast_time);
		c->Message(0, "  buffdurationformula: %d", s->buffdurationformula);
		c->Message(0, "  buffduration: %d", s->buffduration);
		c->Message(0, "  AEDuration: %d", s->AEDuration);
		c->Message(0, "  mana: %d", s->mana);
		c->Message(0, "  base[12]: %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d", s->base[0], s->base[1], s->base[2], s->base[3], s->base[4], s->base[5], s->base[6], s->base[7], s->base[8], s->base[9], s->base[10], s->base[11]);
		c->Message(0, "  base22[12]: %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d", s->base2[0], s->base2[1], s->base2[2], s->base2[3], s->base2[4], s->base2[5], s->base2[6], s->base2[7], s->base2[8], s->base2[9], s->base2[10], s->base2[11]);
		c->Message(0, "  max[12]: %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d", s->max[0], s->max[1], s->max[2], s->max[3], s->max[4], s->max[5], s->max[6], s->max[7], s->max[8], s->max[9], s->max[10], s->max[11]);
		c->Message(0, "  icon: %d", s->icon);
		c->Message(0, "  memicon: %d", s->memicon);
		c->Message(0, "  components[4]: %d, %d, %d, %d", s->components[0], s->components[1], s->components[2], s->components[3]);
		c->Message(0, "  component_counts[4]: %d, %d, %d, %d", s->component_counts[0], s->component_counts[1], s->component_counts[2], s->component_counts[3]);
		c->Message(0, "  NoexpendReagent[4]: %d, %d, %d, %d", s->NoexpendReagent[0], s->NoexpendReagent[1], s->NoexpendReagent[2], s->NoexpendReagent[3]);
		c->Message(0, "  formula[12]: 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x", s->formula[0], s->formula[1], s->formula[2], s->formula[3], s->formula[4], s->formula[5], s->formula[6], s->formula[7], s->formula[8], s->formula[9], s->formula[10], s->formula[11]);
		c->Message(0, "  LightType: %d", s->LightType);
		c->Message(0, "  goodEffect: %d", s->goodEffect);
		c->Message(0, "  Activated: %d", s->Activated);
		c->Message(0, "  resisttype: %d", s->resisttype);
		c->Message(0, "  effectid[12]: 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x", s->effectid[0], s->effectid[1], s->effectid[2], s->effectid[3], s->effectid[4], s->effectid[5], s->effectid[6], s->effectid[7], s->effectid[8], s->effectid[9], s->effectid[10], s->effectid[11]);
		c->Message(0, "  targettype: %d", s->targettype);
		c->Message(0, "  basediff: %d", s->basediff);
		c->Message(0, "  skill: %d", s->skill);
		c->Message(0, "  zonetype: %d", s->zonetype);
		c->Message(0, "  EnvironmentType: %d", s->EnvironmentType);
		c->Message(0, "  TimeOfDay: %d", s->TimeOfDay);
		c->Message(0, "  classes[15]: %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
			s->classes[0], s->classes[1], s->classes[2], s->classes[3], s->classes[4],
			s->classes[5], s->classes[6], s->classes[7], s->classes[8], s->classes[9],
			s->classes[10], s->classes[11], s->classes[12], s->classes[13], s->classes[14]);
		c->Message(0, "  CastingAnim: %d", s->CastingAnim);
		c->Message(0, "  TargetAnim: %d", s->TargetAnim);
		c->Message(0, "  SpellAffectIndex: %d", s->SpellAffectIndex);
		c->Message(0, " RecourseLink: %d", s->RecourseLink);
	}
}

void command_lastname(Client *c, const Seperator *sep)
{
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient())
		t=c->GetTarget()->CastToClient();
	LogFile->write(EQEMuLog::Normal,"#lastname request from %s for %s", c->GetName(), t->GetName());

	if(strlen(sep->arg[1]) <= 70)
		t->ChangeLastName(sep->arg[1]);
	else
		c->Message(0, "Usage: #lastname <lastname> where <lastname> is less than 70 chars long");
}

void command_memspell(Client *c, const Seperator *sep)
{
	uint32 slot;
	int16 spell_id;

	if (!(sep->IsNumber(1) && sep->IsNumber(2)))
	{
		c->Message(0, "Usage: #MemSpell slotid spellid");
	}
	else
	{
		slot = atoi(sep->arg[1]) - 1;
		spell_id = atoi(sep->arg[2]);
		if (slot > MAX_PP_MEMSPELL || spell_id >= SPDAT_RECORDS)
		{
			c->Message(0, "Error: #MemSpell: Arguement out of range");
		}
		else
		{
			c->MemSpell(spell_id, slot);
			c->Message(0, "Spell slot changed, have fun!");
		}
	}
}

void command_save(Client *c, const Seperator *sep)
{
	if (c->GetTarget() == 0)
		c->Message(0, "Error: no target");
	else if (c->GetTarget()->IsClient()) {
		if (c->GetTarget()->CastToClient()->Save(2))
			c->Message(0, "%s successfully saved.", c->GetTarget()->GetName());
		else
			c->Message(0, "Manual save for %s failed.", c->GetTarget()->GetName());
	}
	else if (c->GetTarget()->IsPlayerCorpse()) {
		if (c->GetTarget()->CastToMob()->Save())
			c->Message(0, "%s successfully saved. (dbid=%u)", c->GetTarget()->GetName(), c->GetTarget()->CastToCorpse()->GetDBID());
		else
			c->Message(0, "Manual save for %s failed.", c->GetTarget()->GetName());
	}
	else
		c->Message(0, "Error: target not a Client/PlayerCorpse");
}

void command_showstats(Client *c, const Seperator *sep)
{
	if (c->GetTarget() != 0 )
		c->GetTarget()->ShowStats(c);
	else
		c->ShowStats(c);
}

void command_bind(Client *c, const Seperator *sep)
{
	if (c->GetTarget() != 0 ) {
		if (c->GetTarget()->IsClient())
			c->GetTarget()->CastToClient()->SetBindPoint();
		else
			c->Message(0, "Error: target not a Player");
	 } else
		c->SetBindPoint();
}

void command_depop(Client *c, const Seperator *sep)
{
	if (c->GetTarget() == 0 || !(c->GetTarget()->IsNPC() || c->GetTarget()->IsNPCCorpse()))
		c->Message(0, "You must have a NPC target for this command. (maybe you meant #depopzone?)");
	else {
		c->Message(0, "Depoping '%s'.", c->GetTarget()->GetName());
		c->GetTarget()->Depop();
	}
}

void command_depopzone(Client *c, const Seperator *sep)
{
	zone->Depop();
	c->Message(0, "Zone depoped.");
}

void command_repop(Client *c, const Seperator *sep)
{
	int timearg = 1;
	if (sep->arg[1] && strcasecmp(sep->arg[1], "force") == 0) {
		timearg++;
		
		char errbuf[MYSQL_ERRMSG_SIZE];
		char *query = 0;
		database.RunQuery(query, MakeAnyLenString(&query, "UPDATE spawn2 SET timeleft=0 WHERE zone='%s'",zone->GetShortName()), errbuf);
		safe_delete_array(query);
		
		c->Message(0, "Zone depop: Force resetting spawn timers.");
	}
	if (sep->IsNumber(timearg)) {
		c->Message(0, "Zone depoped. Repop in %i seconds", atoi(sep->arg[timearg]));
		zone->Repop(atoi(sep->arg[timearg])*1000);
	}
	else {
		c->Message(0, "Zone depoped. Repoping now.");
		zone->Repop();
	}
}

void command_spawnstatus(Client *c, const Seperator *sep)
{
	if((sep->arg[1][0] == 'e') | (sep->arg[1][0] == 'E'))
	{
		// show only enabled spawns
		zone->ShowEnabledSpawnStatus(c);
	}
	else if((sep->arg[1][0] == 'd') | (sep->arg[1][0] == 'D'))
	{
		// show only disabled spawns
		zone->ShowDisabledSpawnStatus(c);
	}
	else if((sep->arg[1][0] == 'a') | (sep->arg[1][0] == 'A'))
	{
		// show all spawn staus with no filters
		zone->SpawnStatus(c);
	}
	else if(sep->IsNumber(1))
	{
		// show spawn status by spawn2 id
		zone->ShowSpawnStatusByID(c, atoi(sep->arg[1]));
	}
	else if(strcmp(sep->arg[1], "help") == 0)
	{
		c->Message(0, "Usage: #spawnstatus <[a]ll | [d]isabled | [e]nabled | {Spawn2 ID}>");
	}
	else {
		zone->SpawnStatus(c);
	}
}

void command_nukebuffs(Client *c, const Seperator *sep)
{
	if (c->GetTarget() == 0)
		c->BuffFadeAll();
	else
		c->GetTarget()->BuffFadeAll();
}

void command_zuwcoords(Client *c, const Seperator *sep)
{
	// modifys and resends zhdr packet
	if(sep->arg[1][0]==0)
		c->Message(0, "Usage: #zuwcoords <under world coords>");
	else {
		zone->newzone_data.underworld = atof(sep->arg[1]);
		//float newdata = atof(sep->arg[1]);
		//memcpy(&zone->zone_header_data[130], &newdata, sizeof(float));
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_NewZone, sizeof(NewZone_Struct));
		memcpy(outapp->pBuffer, &zone->newzone_data, outapp->size);
		entity_list.QueueClients(c, outapp);
		safe_delete(outapp);
	}
}

void command_zunderworld(Client *c, const Seperator *sep)
{
	if(sep->arg[1][0]==0)
		c->Message(0, "Usage: #zunderworld <zcoord>");
	else {
		zone->newzone_data.underworld = atof(sep->arg[1]);
	}
}

void command_zsafecoords(Client *c, const Seperator *sep)
{
	// modifys and resends zhdr packet
	if(sep->arg[3][0]==0)
		c->Message(0, "Usage: #zsafecoords <safe x> <safe y> <safe z>");
	else {
		zone->newzone_data.safe_x = atof(sep->arg[1]);
		zone->newzone_data.safe_y = atof(sep->arg[2]);
		zone->newzone_data.safe_z = atof(sep->arg[3]);
		//float newdatax = atof(sep->arg[1]);
		//float newdatay = atof(sep->arg[2]);
		//float newdataz = atof(sep->arg[3]);
		//memcpy(&zone->zone_header_data[114], &newdatax, sizeof(float));
		//memcpy(&zone->zone_header_data[118], &newdatay, sizeof(float));
		//memcpy(&zone->zone_header_data[122], &newdataz, sizeof(float));
		//zone->SetSafeCoords();
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_NewZone, sizeof(NewZone_Struct));
		memcpy(outapp->pBuffer, &zone->newzone_data, outapp->size);
		entity_list.QueueClients(c, outapp);
		safe_delete(outapp);
	}
}

void command_freeze(Client *c, const Seperator *sep)
{
	if (c->GetTarget() != 0)
		c->GetTarget()->SendAppearancePacket(AT_Anim, ANIM_FREEZE);
	else
		c->Message(0, "ERROR: Freeze requires a target.");
}

void command_unfreeze(Client *c, const Seperator *sep)
{
	if (c->GetTarget() != 0)
		c->GetTarget()->SendAppearancePacket(AT_Anim, ANIM_STAND);
	else
		c->Message(0, "ERROR: Unfreeze requires a target.");
}

void command_pvp(Client *c, const Seperator *sep)
{
	bool state=atobool(sep->arg[1]);
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient())
		t=c->GetTarget()->CastToClient();

	if(sep->arg[1][0] != 0) {
		t->SetPVP(state);
		c->Message(0, "%s now follows the ways of %s.", t->GetName(), state?"discord":"order");
	}
	else
		c->Message(0, "Usage: #pvp [on/off]");
}

void command_setxp(Client *c, const Seperator *sep)
{
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient())
		t=c->GetTarget()->CastToClient();

	if (sep->IsNumber(1)) {
		if (atoi(sep->arg[1]) > 9999999)
			c->Message(0, "Error: Value too high.");
		else
			t->AddEXP(atoi(sep->arg[1]));
	}
	else
		c->Message(0, "Usage: #setxp number");
}

void command_name(Client *c, const Seperator *sep)
{
	Client *target;
	
	if( (strlen(sep->arg[1]) == 0) || (!(c->GetTarget() && c->GetTarget()->IsClient())) )
		c->Message(0, "Usage: #name newname (requires player target)");
	else
	{
		target = c->GetTarget()->CastToClient();
		char *oldname = strdup(target->GetName());
		if(target->ChangeFirstName(sep->arg[1], c->GetName()))
		{
			c->Message(0, "Successfully renamed %s to %s", oldname, sep->arg[1]);
			// solar: until we get the name packet working right this will work
			c->Message(0, "Sending player to char select.");
			target->Kick();
		}
		else
			c->Message(13, "ERROR: Unable to rename %s.  Check that the new name '%s' isn't already taken.", oldname, sep->arg[2]);
		free(oldname);
	}
}

void command_npcspecialattk(Client *c, const Seperator *sep)
{
	if (c->GetTarget()==0 || c->GetTarget()->IsClient() || strlen(sep->arg[1]) <= 0 || strlen(sep->arg[2]) <= 0)
		c->Message(0, "Usage: #npcspecialattk *flagchar* *permtag* (Flags are E(nrage) F(lurry) R(ampage) S(ummon), permtag is 1 = True, 0 = False).");
	else {
		c->GetTarget()->CastToNPC()->NPCSpecialAttacks(sep->arg[1],atoi(sep->arg[2]));
		c->Message(0, "NPC Special Attack set.");
	}
}

void command_kill(Client *c, const Seperator *sep)
{
	if (!c->GetTarget()) {
		c->Message(0, "Error: #Kill: No target.");
	}
	else
		if (!c->GetTarget()->IsClient() || c->GetTarget()->CastToClient()->Admin() <= c->Admin())
			c->GetTarget()->Kill();
}

void command_haste(Client *c, const Seperator *sep)
{
	// Kaiyodo - #haste command to set client attack speed. Takes a percentage (100 = twice normal attack speed)
	if(sep->arg[1][0] != 0) {
		int16 Haste = atoi(sep->arg[1]);
		if(Haste > 85)
			Haste = 85;
		c->SetExtraHaste(Haste);
		// SetAttackTimer must be called to make this take effect, so player needs to change
		// the primary weapon.
		c->Message(0, "Haste set to %d%% - Need to re-equip primary weapon before it takes effect", Haste);
	}
	else
		c->Message(0, "Usage: #haste [percentage]");
}

void command_damage(Client *c, const Seperator *sep)
{
	if (c->GetTarget()==0)
		c->Message(0, "Error: #Damage: No Target.");
	else if (!sep->IsNumber(1)) {
		c->Message(0, "Usage: #damage x");
	}
	else {
		sint32 nkdmg = atoi(sep->arg[1]);
		if (nkdmg > 2100000000)
			c->Message(0, "Enter a value less then 2,100,000,000.");
		else
			c->GetTarget()->Damage(c, nkdmg, SPELL_UNKNOWN, HAND_TO_HAND, false);
	}
}

void command_zonespawn(Client *c, const Seperator *sep)
{
	c->Message(0, "This command is not yet implemented.");
	return;
	
/* solar: this was kept from client.cpp verbatim (it was commented out) */
	//	if (target && target->IsNPC()) {
	//		Message(0, "Inside main if.");
	//		if (strcasecmp(sep->arg[1], "add")==0) {
	//			Message(0, "Inside add if.");
	//			database.DBSpawn(1, StaticGetZoneName(this->GetPP().current_zone), target->CastToNPC());
	//		}
	//		else if (strcasecmp(sep->arg[1], "update")==0) {
	//			database.DBSpawn(2, StaticGetZoneName(this->GetPP().current_zone), target->CastToNPC());
	//		}
	//		else if (strcasecmp(sep->arg[1], "remove")==0) {
	//			if (strcasecmp(sep->arg[2], "all")==0) {
	//				database.DBSpawn(4, StaticGetZoneName(this->GetPP().current_zone));
	//			}
	//			else {
	//				if (database.DBSpawn(3, StaticGetZoneName(this->GetPP().current_zone), target->CastToNPC())) {
	//					Message(0, "#zonespawn: %s removed successfully!", target->GetName());
	//					target->CastToNPC()->Death(target, target->GetHP());
	//				}
	//			}
	//		}
	//		else
	//			Message(0, "Error: #dbspawn: Invalid command. (Note: EDIT and REMOVE are NOT in yet.)");
	//		if (target->CastToNPC()->GetNPCTypeID() > 0) {
	//			Message(0, "Spawn is type %i", target->CastToNPC()->GetNPCTypeID());
	//		}
	//	}
	//	else if(!target || !target->IsNPC())
	//		Message(0, "Error: #zonespawn: You must have a NPC targeted!");
	//	else
	//		Message(0, "Usage: #zonespawn [add|edit|remove|remove all]");
}

void command_npcspawn(Client *c, const Seperator *sep)
{
	Mob *target=c->GetTarget();

	if (target && target->IsNPC()) {
		if (strcasecmp(sep->arg[1], "create") == 0) {
			database.NPCSpawnDB(0, zone->GetShortName(), c, target->CastToNPC());
			c->Message(0, "%s created successfully!", target->GetName());
		}
		else if (strcasecmp(sep->arg[1], "add") == 0) {
			database.NPCSpawnDB(1, zone->GetShortName(), c, target->CastToNPC(), atoi(sep->arg[2]));
			c->Message(0, "%s added successfully!", target->GetName());
		}
		else if (strcasecmp(sep->arg[1], "update") == 0) {
			database.NPCSpawnDB(2, zone->GetShortName(), c, target->CastToNPC());
			c->Message(0, "%s updated!", target->GetName());
		}
		else if (strcasecmp(sep->arg[1], "remove") == 0) {
			database.NPCSpawnDB(3, zone->GetShortName(), c, target->CastToNPC());
			c->Message(0, "%s removed successfully from database!", target->GetName());
			target->Depop(false);
		}
		else if (strcasecmp(sep->arg[1], "delete") == 0) {
			database.NPCSpawnDB(4, zone->GetShortName(), c, target->CastToNPC());
			c->Message(0, "%s deleted from database!", target->GetName());
			target->Depop(false);
		}
		else {
			c->Message(0, "Error: #npcspawn: Invalid command.");
			c->Message(0, "Usage: #npcspawn [create|add|update|remove|delete]");
		}
	}
	else
		c->Message(0, "Error: #npcspawn: You must have a NPC targeted!");
}

void command_spawnfix(Client *c, const Seperator *sep) {
	Mob *t = c->GetTarget();
	if (!t || !t->IsNPC())
		c->Message(0, "Error: #spawnfix: Need an NPC target.");
	else {
		Spawn2* s2 = t->CastToNPC()->respawn2;
		char errbuf[MYSQL_ERRMSG_SIZE];
		char *query = 0;

		if(!s2) {
			c->Message(0, "#spawnfix FAILED -- cannot determine which spawn entry in the database this mob came from.");
		}
		else
		{
			if(database.RunQuery(query, MakeAnyLenString(&query, "UPDATE spawn2 SET x='%f', y='%f', z='%f', heading='%f' WHERE id='%i'",c->GetX(), c->GetY(), c->GetZ(), c->GetHeading(),s2->GetID()), errbuf))
			{
				c->LogSQL(query);
				c->Message(0, "Updating coordinates successful.");
				t->Depop(false);
			}
			else
			{
				c->Message(13, "Update failed! MySQL gave the following error:");
				c->Message(13, errbuf);
		  	}
			safe_delete_array(query);
		}
	} 
}

void command_loc(Client *c, const Seperator *sep)
{
	Mob *t=c->GetTarget()?c->GetTarget():c->CastToMob();
	
	c->Message(0, "%s's Location (XYZ): %1.1f, %1.1f, %1.1f; heading=%1.1f", t->GetName(), t->GetX(), t->GetY(), t->GetZ(), t->GetHeading());
}

void command_goto(Client *c, const Seperator *sep)
{
	// Pyro's goto function
	if (sep->arg[1][0] == '\0' && c->GetTarget())
		c->MovePC(c->GetTarget()->GetX(), c->GetTarget()->GetY(), c->GetTarget()->GetZ(), c->GetTarget()->GetHeading());
	else if (!(sep->IsNumber(1) && sep->IsNumber(2) && sep->IsNumber(3)))
		c->Message(0, "Usage: #goto [x y z]");
	else
		c->MovePC(atof(sep->arg[1]), atof(sep->arg[2]), atof(sep->arg[3]), 0.0f);
}

#ifdef BUGTRACK
void command_bug(Client *c, const Seperator *sep)
{
	if (sep->argplus[1][0] == 0)
		c->Message(0, "Usage: #bug details ");
	else  {
		LogFile->write(EQEMuLog::Normal,"Sending bug report:", atoi(sep->argplus[1]) );
		BugDatabase bugdatabase;
		bugdatabase.UploadBug(sep->argplus[1], CURRENT_VERSION, c->AccountName());
		#ifdef EQDEBUG
			LogFile->write(EQEMuLog::Debug,"Bug uploaded deleteing local bug object:");
		#endif
		safe_delete(&bugdatabase);
	}
}
#endif

void command_iteminfo(Client *c, const Seperator *sep)
{
	const ItemInst* inst = c->GetInv()[SLOT_CURSOR];
	
	if (!inst)
		c->Message(13, "Error: You need an item on your cursor for this command");
	else {
		const Item_Struct* item = inst->GetItem();
		c->Message(0, "ID: %i Name: %s", item->ID, item->Name);
		c->Message(0, "  Lore: %s  ND: %i  NS: %i  Type: %i", (item->LoreFlag) ? "true":"false", item->NoDrop, item->NoRent, item->ItemClass);
		c->Message(0, "  IDF: %s  Size: %i  Weight: %i  icon_id: %i  Price: %i", item->IDFile, item->Size, item->Weight, item->Icon, item->Price);
		if (c->Admin() >= 200)
			c->Message(0, "MinStatus: %i", database.GetItemStatus(item->ID));
		if (item->ItemClass==ItemClassBook)
			c->Message(0, "  This item is a Book: %s", item->Filename);
		else if (item->ItemClass==ItemClassContainer)
			c->Message(0, "  This item is a container with %i slots", item->BagSlots);
		else {
			c->Message(0, "  equipableSlots: %u equipable Classes: %u", item->Slots, item->Classes);
			c->Message(0, "  Magic: %i  SpellID: %i  Proc Level: %i DBCharges: %i  CurCharges: %i", item->Magic, item->Click.Effect, item->Click.Level, item->MaxCharges, inst->GetCharges());
			c->Message(0, "  EffectType: 0x%02x  CastTime: %.2f", (int8) item->Click.Type, (double) item->CastTime/1000);
			c->Message(0, "  Material: 0x02%x  Color: 0x%08x  Skill: %i", item->Material, item->Color, item->ItemType);
			c->Message(0, " Required level: %i Required skill: %i Recommended level:%i", item->ReqLevel,  item->RecSkill, item->RecLevel);
			c->Message(0, " Skill mod: %i percent: %i", item->SkillModType, item->SkillModValue);
			c->Message(0, " BaneRace: %i BaneBody: %i BaneDMG: %i", item->BaneDmgRace, item->BaneDmgBody, item->BaneDmgAmt);
		}
	}
}

void command_uptime(Client *c, const Seperator *sep)
{
	if (!worldserver.Connected())
		c->Message(0, "Error: World server disconnected");
	else
	{
		ServerPacket* pack = new ServerPacket(ServerOP_Uptime, sizeof(ServerUptime_Struct));
		ServerUptime_Struct* sus = (ServerUptime_Struct*) pack->pBuffer;
		strcpy(sus->adminname, c->GetName());
		if (sep->IsNumber(1) && atoi(sep->arg[1]) > 0) 
			sus->zoneserverid = atoi(sep->arg[1]);
		worldserver.SendPacket(pack);
		safe_delete(pack);
	}
}

void command_flag(Client *c, const Seperator *sep)
{
	if(sep->arg[2][0] == 0) {
		c->UpdateAdmin();
		c->Message(0, "Refreshed your admin flag from DB.");
	}
	else if (!sep->IsNumber(1) || atoi(sep->arg[1]) < -2 || atoi(sep->arg[1]) > 255 || strlen(sep->arg[2]) == 0)
		c->Message(0, "Usage: #flag [status] [acctname]");

	else if (c->Admin() < commandChangeFlags) {
//this check makes banning players by less than this level
//impossible, but i'll leave it in anyways
		c->Message(0, "You may only refresh your own flag, doing so now.");
		c->UpdateAdmin();
	}
	else {
		if (atoi(sep->arg[1]) > c->Admin())
			c->Message(0, "You cannot set people's status to higher than your own");
		else if (atoi(sep->arg[1]) < 0 && c->Admin() < commandBanPlayers)
			c->Message(0, "You have too low of status to suspend/ban");
		else if (!database.SetAccountStatus(sep->argplus[2], atoi(sep->arg[1])))
			c->Message(0, "Unable to set GM Flag.");
		else {
			c->Message(0, "Set GM Flag on account.");
			ServerPacket* pack = new ServerPacket(ServerOP_FlagUpdate, 6);
			*((int32*) pack->pBuffer) = database.GetAccountIDByName(sep->argplus[2]);
			*((sint16*) &pack->pBuffer[4]) = atoi(sep->arg[1]);
			worldserver.SendPacket(pack);
			delete pack;
		}
	}
}

void command_time(Client *c, const Seperator *sep)
{
	// image - Redone by Scruffy
	char timeMessage[255];
	int minutes=0;
	if(sep->IsNumber(1)) {
		if(sep->IsNumber(2)) {
			minutes=atoi(sep->arg[2]);
		}
		c->Message(13, "Setting world time to %s:%i (Timezone: 0)...", sep->arg[1], minutes);
		zone->SetTime(atoi(sep->arg[1])+1, minutes);
	}
	else {
		c->Message(13, "To set the Time: #time HH [MM]");
		TimeOfDay_Struct eqTime;
		zone->zone_time.getEQTimeOfDay( time(0), &eqTime);
		sprintf(timeMessage,"%02d:%s%d %s (Timezone: %ih %im)",
			((eqTime.hour - 1) % 12) == 0 ? 12 : ((eqTime.hour - 1) % 12),
			(eqTime.minute < 10) ? "0" : "",
			eqTime.minute,
			(eqTime.hour >= 13) ? "pm" : "am",
			zone->zone_time.getEQTimeZoneHr(),
			zone->zone_time.getEQTimeZoneMin()
			);
		c->Message(13, "It is now %s.", timeMessage);
#if EQDEBUG >= 11
		LogFile->write(EQEMuLog::Debug,"Recieved timeMessage:%s", timeMessage);
#endif
	}
}

void command_guild(Client *c, const Seperator *sep)
{
	int admin=c->Admin();
	Mob *target=c->GetTarget();

	if (strcasecmp(sep->arg[1], "help") == 0) {
		/*
		c->Message(0, "Guild commands:");
		c->Message(0, "  #guild status [name] - shows guild and rank of target");
		c->Message(0, "  #guild info guildnum - shows info/current structure");
		c->Message(0, "  #guild invite [charname]");
		c->Message(0, "  #guild remove [charname]");
		c->Message(0, "  #guild promote rank [charname]");
		c->Message(0, "  #guild demote rank [charname]");
		c->Message(0, "  /guildmotd [newmotd]    (use 'none' to clear)");
		c->Message(0, "  #guild edit rank title newtitle");
		c->Message(0, "  #guild edit rank permission 0/1");
		c->Message(0, "  #guild leader newleader (they must be rank0)");
		*/
			c->Message(0, "GM Guild commands:");
			c->Message(0, "  #guild list - lists all guilds on the server");
			c->Message(0, "  #guild create {guildleader charname or CharID} guildname");
			c->Message(0, "  #guild delete guildID");
			c->Message(0, "  #guild rename guildID newname");
			c->Message(0, "  #guild set charname guildID    (0=no guild)");
			c->Message(0, "  #guild setrank charname rank");
			//c->Message(0, "  #guild gmedit guilddbid rank title newtitle");
			//c->Message(0, "  #guild gmedit guilddbid rank permission 0/1");
			c->Message(0, "  #guild setleader guildID {guildleader charname or CharID}");
			//c->Message(0, "  #guild setdoor guildEQID");
	}
	else if (strcasecmp(sep->arg[1], "status") == 0 || strcasecmp(sep->arg[1], "stat") == 0) {
		Client* client = 0;
		if (sep->arg[2][0] != 0)
			client = entity_list.GetClientByName(sep->argplus[2]);
		else if (target != 0 && target->IsClient())
			client = target->CastToClient();
		if (client == 0)
			c->Message(0, "You must target someone or specify a character name");
		else if ((client->Admin() >= minStatusToEditOtherGuilds && admin < minStatusToEditOtherGuilds) && client->GuildID() != c->GuildID()) // no peeping for GMs, make sure tell message stays the same
			c->Message(0, "You must target someone or specify a character name.");
		else {
			if (client->IsInAGuild())
				c->Message(0, "%s is not in a guild.", client->GetName());
			else if (guild_mgr.IsGuildLeader(client->GuildID(), client->CharacterID()))
				c->Message(0, "%s is the leader of <%s> rank: %s", client->GetName(), guild_mgr.GetGuildName(client->GuildID()), guild_mgr.GetRankName(client->GuildID(), client->GuildRank()));
			else
				c->Message(0, "%s is a member of <%s> rank: %s", client->GetName(), guild_mgr.GetGuildName(client->GuildID()), guild_mgr.GetRankName(client->GuildID(), client->GuildRank()));
		}
	}
	else if (strcasecmp(sep->arg[1], "info") == 0) {
		if (sep->arg[2][0] == 0 && c->IsInAGuild()) {
			if (admin >= minStatusToEditOtherGuilds)
				c->Message(0, "Usage: #guildinfo guild_id");
			else
				c->Message(0, "You're not in a guild");
		}
		else {
			int32 tmp = GUILD_NONE;
			if (sep->arg[2][0] == 0)
				tmp = c->GuildID();
			else if (admin >= minStatusToEditOtherGuilds)
				tmp = atoi(sep->arg[2]);
			
			if(tmp != GUILD_NONE)
				guild_mgr.DescribeGuild(c, tmp);
		}
	}
	/*
	else if (strcasecmp(sep->arg[1], "edit") == 0) {
		if (c->GuildDBID() == 0)
			c->Message(0, "You arent in a guild!");
		else if (!sep->IsNumber(2))
			c->Message(0, "Error: invalid rank #.");
		else if (atoi(sep->arg[2]) < 0 || atoi(sep->arg[2]) > GUILD_MAX_RANK)
			c->Message(0, "Error: invalid rank #.");
		else if (!c->GuildRank() == 0)
			c->Message(0, "You must be rank %s to use edit.", guilds[c->GuildEQID()].rank[0].rankname);
		else if (!worldserver.Connected())
			c->Message(0, "Error: World server dirconnected");
		else {
			if (!helper_guild_edit(c, c->GuildDBID(), c->GuildEQID(), atoi(sep->arg[2]), sep->arg[3], sep->argplus[4])) {
				c->Message(0, "  #guild edit rank title newtitle");
				c->Message(0, "  #guild edit rank permission 0/1");
			}
			else {
				ServerPacket* pack = new ServerPacket(ServerOP_RefreshGuild, 5);
				sint32 geqid=c->GuildEQID();
				memcpy(pack->pBuffer, &geqid, 4);
				worldserver.SendPacket(pack);
				safe_delete(pack);
			}
		}
	}
	else if (strcasecmp(sep->arg[1], "gmedit") == 0 && admin >= 100) {
		if (!sep->IsNumber(2))
			c->Message(0, "Error: invalid guilddbid.");
		else if (!sep->IsNumber(3))
			c->Message(0, "Error: invalid rank #.");
		else if (atoi(sep->arg[3]) < 0 || atoi(sep->arg[3]) > GUILD_MAX_RANK)
			c->Message(0, "Error: invalid rank #.");
		else if (!worldserver.Connected())
			c->Message(0, "Error: World server dirconnected");
		else {
			int32 eqid = database.GetGuildEQID(atoi(sep->arg[2]));
			if (eqid == GUILD_NONE)
				c->Message(0, "Error: Guild not found");
			else if (!helper_guild_edit(c, atoi(sep->arg[2]), eqid, atoi(sep->arg[3]), sep->arg[4], sep->argplus[5])) {
				c->Message(0, "  #guild gmedit guilddbid rank title newtitle");
				c->Message(0, "  #guild gmedit guilddbid rank permission 0/1");
			}
			else {
				ServerPacket* pack = new ServerPacket(ServerOP_RefreshGuild, 5);
				memcpy(pack->pBuffer, &eqid, 4);
				worldserver.SendPacket(pack);
				safe_delete(pack);
			}
		}
	}
	*/
	else if (strcasecmp(sep->arg[1], "set") == 0) {
		if (!sep->IsNumber(3))
			c->Message(0, "Usage: #guild set charname guildgbid (0 = clear guildtag)");
		else {
			uint32 guild_id = atoi(sep->arg[3]);
			
			if(guild_id == 0)
				guild_id = GUILD_NONE;
			else if(!guild_mgr.GuildExists(guild_id)) {
				c->Message(13, "Guild %d does not exist.", guild_id);
				return;
			}
			
			int32 charid = database.GetCharacterID(sep->arg[2]);
			if(charid == 0) {
				c->Message(13, "Unable to find character '%s'", charid);
				return;
			}
			
			//we could do the checking we need for guild_mgr.CheckGMStatus, but im lazy right now
			if(admin < minStatusToEditOtherGuilds) {
				c->Message(13, "Access denied.");
				return;
			}
			
			if(guild_id == GUILD_NONE) {
				_log(GUILDS__ACTIONS, "%s: Removing %s (%d) from guild with GM command.", c->GetName(),
					sep->arg[2], charid);
			} else {
				_log(GUILDS__ACTIONS, "%s: Putting %s (%d) into guild %s (%d) with GM command.", c->GetName(),
					sep->arg[2], charid,
					guild_mgr.GetGuildName(guild_id), guild_id);
			}
			
			if(!guild_mgr.SetGuild(charid, guild_id, GUILD_MEMBER)) {
				c->Message(13, "Error putting '%s' into guild %d", sep->arg[2], guild_id);
			} else {
				c->Message(0, "%s has been put into guild %d", sep->arg[2], guild_id);
			}
		}
	}
	/*else if (strcasecmp(sep->arg[1], "setdoor") == 0 && admin >= minStatusToEditOtherGuilds) {

		if (!sep->IsNumber(2))
			c->Message(0, "Usage: #guild setdoor guildEQid (0 = delete guilddoor)");
		else {
// guild doors
			if((!guilds[atoi(sep->arg[2])].databaseID) && (atoi(sep->arg[2])!=0) )
			{

				c->Message(0, "These is no guild with this guildEQid");
			}
			else {
				c->SetIsSettingGuildDoor(true);
				c->Message(0, "Click on a door you want to become a guilddoor");
				c->SetSetGuildDoorID(atoi(sep->arg[2]));
			}
		}
	}*/
	else if (strcasecmp(sep->arg[1], "setrank") == 0) {
		int rank = atoi(sep->arg[3]);
		if (!sep->IsNumber(3))
			c->Message(0, "Usage: #guild setrank charname rank");
		else if (rank < 0 || rank > GUILD_MAX_RANK)
			c->Message(0, "Error: invalid rank #.");
		else {
			int32 charid = database.GetCharacterID(sep->arg[2]);
			if(charid == 0) {
				c->Message(13, "Unable to find character '%s'", charid);
				return;
			}
			
			//we could do the checking we need for guild_mgr.CheckGMStatus, but im lazy right now
			if(admin < minStatusToEditOtherGuilds) {
				c->Message(13, "Access denied.");
				return;
			}
			
			_log(GUILDS__ACTIONS, "%s: Setting %s (%d)'s guild rank to %d with GM command.", c->GetName(),
				sep->arg[2], charid, rank);
			
			if(!guild_mgr.SetGuildRank(charid, rank))
				c->Message(13, "Error while setting rank %d on '%s'.", rank, sep->arg[2]);
			else
				c->Message(0, "%s has been set to rank %d", sep->arg[2], rank);
		}
	}
	else if (strcasecmp(sep->arg[1], "create") == 0) {
		if (sep->arg[3][0] == 0)
			c->Message(0, "Usage: #guild create {guildleader charname or CharID} guild name");
		else if (!worldserver.Connected())
			c->Message(0, "Error: World server dirconnected");
		else {
			int32 leader = 0;
			if (sep->IsNumber(2)) {
				leader = atoi(sep->arg[2]);
			} else if((leader=database.GetCharacterID(sep->arg[2])) != 0) {
				//got it from the db..
			} else {
				c->Message(13, "Unable to find char '%s'", sep->arg[2]);
				return;
			}
			if (leader == 0) {
				c->Message(0, "Guild leader not found.");
				return;
			}

			int32 tmp = guild_mgr.FindGuildByLeader(leader);
			if (tmp != GUILD_NONE) {
				c->Message(0, "Error: %s already is the leader of DB# %i '%s'.", sep->arg[2], tmp, guild_mgr.GetGuildName(tmp));
			}
			else {
			
				if(admin < minStatusToEditOtherGuilds) {
					c->Message(13, "Access denied.");
					return;
				}
				
				int32 id = guild_mgr.CreateGuild(sep->argplus[3], leader);
				
				_log(GUILDS__ACTIONS, "%s: Creating guild %s with leader %d with GM command. It was given id %lu.", c->GetName(),
					sep->argplus[3], leader, id);
				
				if (id == GUILD_NONE)
					c->Message(0, "Guild creation failed.");
				else {
					c->Message(0, "Guild created: Leader: %i, number %i: %s", leader, id, sep->argplus[3]);
					
					if(!guild_mgr.SetGuild(leader, id, GUILD_LEADER))
						c->Message(0, "Unable to set guild leader's guild in the database. Your going to have to run #guild set");
				}
				
			}
		}
	}
	else if (strcasecmp(sep->arg[1], "delete") == 0) {
		if (!sep->IsNumber(2))
			c->Message(0, "Usage: #guild delete guildID");
		else if (!worldserver.Connected())
			c->Message(0, "Error: World server dirconnected");
		else {
			int32 id = atoi(sep->arg[2]);
			
			if(!guild_mgr.GuildExists(id)) {
				c->Message(0, "Guild %d does not exist!", id);
				return;
			}
			
			if(admin < minStatusToEditOtherGuilds) {
				//this person is not allowed to just edit any guild, check this guild's min status.
				if(c->GuildID() != id) {
					c->Message(13, "Access denied to edit other people's guilds");
					return;
				} else if(!guild_mgr.CheckGMStatus(id, admin)) {
					c->Message(13, "Access denied to edit your guild with GM commands.");
					return;
				}
			}

			_log(GUILDS__ACTIONS, "%s: Deleting guild %s (%d) with GM command.", c->GetName(), 
				guild_mgr.GetGuildName(id), id);
			
			if (!guild_mgr.DeleteGuild(id))
				c->Message(0, "Guild delete failed.");
			else {
				c->Message(0, "Guild %d deleted.", id);
			}
		}
	}
	else if (strcasecmp(sep->arg[1], "rename") == 0) {
		if ((!sep->IsNumber(2)) || sep->arg[3][0] == 0)
			c->Message(0, "Usage: #guild rename guildID newname");
		else if (!worldserver.Connected())
			c->Message(0, "Error: World server dirconnected");
		else {
			int32 id = atoi(sep->arg[2]);
			
			if(!guild_mgr.GuildExists(id)) {
				c->Message(0, "Guild %d does not exist!", id);
				return;
			}
			
			if(admin < minStatusToEditOtherGuilds) {
				//this person is not allowed to just edit any guild, check this guild's min status.
				if(c->GuildID() != id) {
					c->Message(13, "Access denied to edit other people's guilds");
					return;
				} else if(!guild_mgr.CheckGMStatus(id, admin)) {
					c->Message(13, "Access denied to edit your guild with GM commands.");
					return;
				}
			}

			_log(GUILDS__ACTIONS, "%s: Renaming guild %s (%d) to '%s' with GM command.", c->GetName(), 
				guild_mgr.GetGuildName(id), id, sep->argplus[3]);
			
			if (!guild_mgr.RenameGuild(id, sep->argplus[3]))
				c->Message(0, "Guild rename failed.");
			else {
				c->Message(0, "Guild %d renamed to %s", id, sep->argplus[3]);
			}
		}
	}
	else if (strcasecmp(sep->arg[1], "setleader") == 0) {
		if (sep->arg[3][0] == 0 || !sep->IsNumber(2))
			c->Message(0, "Usage: #guild setleader guild_id {guildleader charname or CharID}");
		else if (!worldserver.Connected())
			c->Message(0, "Error: World server dirconnected");
		else {
			int32 leader = 0;
			if (sep->IsNumber(2)) {
				leader = atoi(sep->arg[2]);
			} else if((leader=database.GetCharacterID(sep->arg[2])) != 0) {
				//got it from the db..
			} else {
				c->Message(13, "Unable to find char '%s'", sep->arg[2]);
				return;
			}

			int32 tmpdb = guild_mgr.FindGuildByLeader(leader);
			if (leader == 0)
				c->Message(0, "New leader not found.");
			else if (tmpdb != 0) {
				c->Message(0, "Error: %s already is the leader of guild # %i", sep->arg[2], tmpdb);
			}
			else {
				int32 id = atoi(sep->arg[2]);
				
				if(!guild_mgr.GuildExists(id)) {
					c->Message(0, "Guild %d does not exist!", id);
					return;
				}
			
				if(admin < minStatusToEditOtherGuilds) {
					//this person is not allowed to just edit any guild, check this guild's min status.
					if(c->GuildID() != id) {
						c->Message(13, "Access denied to edit other people's guilds");
						return;
					} else if(!guild_mgr.CheckGMStatus(id, admin)) {
						c->Message(13, "Access denied to edit your guild with GM commands.");
						return;
					}
				}
				
				_log(GUILDS__ACTIONS, "%s: Setting leader of guild %s (%d) to %d with GM command.", c->GetName(), 
					guild_mgr.GetGuildName(id), id, leader);
				
				if(!guild_mgr.SetGuildLeader(id, leader))
					c->Message(0, "Guild leader change failed.");
				else {
					c->Message(0, "Guild leader changed: guild # %d, Leader: %s", id, sep->argplus[3]);
				}
			}
		}
	}
	else if (strcasecmp(sep->arg[1], "list") == 0) {
		if(admin < minStatusToEditOtherGuilds) {
			c->Message(13, "Access denied.");
			return;
		}
		guild_mgr.ListGuilds(c);
	}
	else {
		c->Message(0, "Unknown guild command, try #guild help");
	}
}
/*
bool helper_guild_edit(Client *c, int32 dbid, int32 eqid, int8 rank, const char* what, const char* value) {
	struct GuildRankLevel_Struct grl;
	strcpy(grl.rankname, guild_mgr.GetRankName(eqid, rank));
	grl.demote = guilds[eqid].rank[rank].demote;
	grl.heargu = guilds[eqid].rank[rank].heargu;
	grl.invite = guilds[eqid].rank[rank].invite;
	grl.motd = guilds[eqid].rank[rank].motd;
	grl.promote = guilds[eqid].rank[rank].promote;
	grl.remove = guilds[eqid].rank[rank].remove;
	grl.speakgu = guilds[eqid].rank[rank].speakgu;
	grl.warpeace = guilds[eqid].rank[rank].warpeace;

	if (strcasecmp(what, "title") == 0) {
		if (strlen(value) > 100)
			c->Message(0, "Error: Title has a maxium length of 100 characters.");
		else
			strcpy(grl.rankname, value);
	}
	else if (rank == 0)
		c->Message(0, "Error: Rank 0's permissions can not be changed.");
	else {
		if (!(strlen(value) == 1 && (value[0] == '0' || value[0] == '1')))

			return false;
		if (strcasecmp(what, "demote") == 0)
			grl.demote = (value[0] == '1');
		else if (strcasecmp(what, "heargu") == 0)
			grl.heargu = (value[0] == '1');
		else if (strcasecmp(what, "invite") == 0)
			grl.invite = (value[0] == '1');
		else if (strcasecmp(what, "motd") == 0)
			grl.motd = (value[0] == '1');
		else if (strcasecmp(what, "promote") == 0)
			grl.promote = (value[0] == '1');
		else if (strcasecmp(what, "remove") == 0)

			grl.remove = (value[0] == '1');
		else if (strcasecmp(what, "speakgu") == 0)
			grl.speakgu = (value[0] == '1');
		else if (strcasecmp(what, "warpeace") == 0)
			grl.warpeace = (value[0] == '1');
		else
			c->Message(0, "Error: Permission name not recognized.");
	}
	if (!database.EditGuild(dbid, rank, &grl))
		c->Message(0, "Error: database.EditGuild() failed");
	return true;
}*/

void command_zonestatus(Client *c, const Seperator *sep)
{
	if (!worldserver.Connected())
		c->Message(0, "Error: World server disconnected");
	else {
		ServerPacket* pack = new ServerPacket(ServerOP_ZoneStatus, strlen(c->GetName())+2);
		memset(pack->pBuffer, (int8) c->Admin(), 1);
		strcpy((char *) &pack->pBuffer[1], c->GetName());
		worldserver.SendPacket(pack);
		delete pack;
	}
}

void command_manaburn(Client *c, const Seperator *sep)
{
	Mob* target=c->GetTarget();

	if (c->GetTarget() == 0)
		c->Message(0, "#Manaburn needs a target.");
	else {
		int cur_level=c->GetAA(MANA_BURN);//ManaBurn ID
		if (c->DistNoRootNoZ(*target) > 200)
			c->Message(0,"You are too far away from your target.");
		else {
			if(cur_level == 1) {
				if(c->IsAttackAllowed(target))
				{
					c->SetMana(0);
					int nukedmg=(c->GetMana())*2;
					if (nukedmg>0)
					{
						target->Damage(c, nukedmg, 2751, ABJURE/*hackish*/);
						c->Message(4,"You unleash an enormous blast of magical energies.");
					}
					LogFile->write(EQEMuLog::Normal,"Manaburn request from %s, damage: %d", c->GetName(), nukedmg);
				}
			}
			else
				c->Message(0, "You have not learned this skill.");
		}
	}
}

void command_viewmessage(Client *c, const Seperator *sep)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	if(sep->arg[1][0]==0)
	{
		if (database.RunQuery(query, MakeAnyLenString(&query, "SELECT id,date,receiver,sender,message from tellque where receiver='%s'",c->GetName()), errbuf, &result))
		{
			if (mysql_num_rows(result)>0)
			{
				c->Message(0,"You have messages waiting for you to view.");
				c->Message(0,"Type #Viewmessage <Message ID> to view the message.");
				c->Message(0," ID , Message Sent Date, Message Sender");
				while ((row = mysql_fetch_row(result)))
					c->Message(0,"ID: %s Sent Date: %s Sender: %s ",row[0],row[1],row[3]);
			}
			else
				c->Message(0,"You have no new messages");
				mysql_free_result(result);
		}
		safe_delete_array(query);
	}
	else
	{
		if (database.RunQuery(query, MakeAnyLenString(&query, "SELECT id,date,receiver,sender,message from tellque where id=%s",sep->argplus[1]), errbuf, &result))
		{
			if (mysql_num_rows(result)==1)
			{
				row = mysql_fetch_row(result);
				mysql_free_result(result);
				if (strcasecmp((const char *) c->GetName(), (const char *) row[2]) == 0)
				{
					c->Message(15,"ID: %s,Sent Date: %s,Sender: %s,Message: %s",row[0],row[1],row[3],row[4]);
					database.RunQuery(query, MakeAnyLenString(&query, "Delete from tellque where id=%s",row[0]), errbuf);
				}
				else
					c->Message(13,"Invalid Message Number, check the number and try again.");
			}
			else
				c->Message(13,"Invalid Message Number, check the number and try again.");
		}
		safe_delete_array(query);
	}
}

void command_doanim(Client *c, const Seperator *sep)
{
	if (!sep->IsNumber(1))
		c->Message(0, "Usage: #DoAnim [number]");
	else
		if (c->Admin() >= commandDoAnimOthers)
			if (c->GetTarget() == 0)
				c->Message(0, "Error: You need a target.");
			else
				c->GetTarget()->DoAnim(atoi(sep->arg[1]),atoi(sep->arg[2]));
		else
			c->DoAnim(atoi(sep->arg[1]),atoi(sep->arg[2]));
}

void command_face(Client *c, const Seperator *sep)
{
	c->Message(0,"This command is not yet implemented.");

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_Illusion, sizeof(Illusion_Struct));
	Illusion_Struct* is = (Illusion_Struct*) outapp->pBuffer;
		
	strcpy(is->charname, c->GetPP().name);
	is->race		= c->GetBaseRace();
	is->gender		= c->GetBaseGender();
		
	// @merth: these need to be implemented
	/*
	is->texture		= 0x00;
	is->helmtexture	= 0x00;
	is->haircolor	= 0x00;
	is->beardcolor	= c->GetFace();
	is->eyecolor1	= 0xFF;
	is->eyecolor2	= 0xFF;
	is->hairstyle	= 0xFF;
	is->luclinface	= 0xFF;
	*/
	
	entity_list.QueueClients(c, outapp);
	safe_delete(outapp);
}

void command_scribespells(Client *c, const Seperator *sep)
{
	int level;
	int16 book_slot;
	int16 curspell;
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient() && c->GetGM())
		t=c->GetTarget()->CastToClient();

	if(!sep->arg[1][0])
	{
		c->Message(0, "FORMAT: #scribespells <level>");
		return;
	}

	level = atoi(sep->arg[1]);

	if(level < 1)
	{
		c->Message(0, "ERROR: Enter a level greater than 1.");
		return;
	}

	t->Message(0, "Scribing spells to spellbook.");
	if(t != c)
		c->Message(0, "Scribing spells for %s.", t->GetName());
	LogFile->write(EQEMuLog::Normal, "Scribe spells request for %s from %s, level: %d", t->GetName(), c->GetName(), level);

	for(curspell = 0, book_slot = 0; curspell < SPDAT_RECORDS && book_slot < MAX_PP_SPELLBOOK; curspell++)
	{
		if
		(
			spells[curspell].classes[WARRIOR] != 0 && // check if spell exists
			spells[curspell].classes[t->GetPP().class_-1] <= level && 
			spells[curspell].skill != 52
		)
		{
			if(!IsDiscipline(curspell)){
				t->ScribeSpell(curspell, book_slot++);
			}
		}
	}
}

void command_scribespell(Client *c, const Seperator *sep) {
	int16 spell_id = 0;
	int16 book_slot = -1;
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient() && c->GetGM())
		t=c->GetTarget()->CastToClient();

	if(!sep->arg[1][0]) {
		c->Message(0, "FORMAT: #scribespell <spellid>");
		return;
	}

	spell_id = atoi(sep->arg[1]);

	if(IsValidSpell(spell_id)) {
		t->Message(0, "Scribing spell: %s (%i) to spellbook.", spells[spell_id].name, spell_id);

		if(t != c)
			c->Message(0, "Scribing spell: %s (%i) for %s.", spells[spell_id].name, spell_id, t->GetName());

		LogFile->write(EQEMuLog::Normal, "Scribe spell: %s (%i) request for %s from %s.", spells[spell_id].name, spell_id, t->GetName(), c->GetName());

		if (spells[spell_id].classes[WARRIOR] != 0 && spells[spell_id].skill != 52 && spells[spell_id].classes[t->GetPP().class_ - 1] > 0 && !IsDiscipline(spell_id)) {
			book_slot = t->GetNextAvailableSpellBookSlot();

			if(book_slot >= 0 && t->FindSpellBookSlotBySpellID(spell_id) < 0)
				t->ScribeSpell(spell_id, book_slot);
			else {
				t->Message(13, "Unable to scribe spell: %s (%i) to your spellbook.", spells[spell_id].name, spell_id);

				if(t != c)
					c->Message(13, "Unable to scribe spell: %s (%i) for %s.", spells[spell_id].name, spell_id, t->GetName());
			}
		}
		else
			c->Message(13, "Your target can not scribe this spell.");
	}
	else
		c->Message(13, "Spell ID: %i is an unknown spell and cannot be scribed.", spell_id);
}

void command_unscribespell(Client *c, const Seperator *sep) {
	int16 spell_id = 0;
	int16 book_slot = -1;
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient() && c->GetGM())
		t=c->GetTarget()->CastToClient();

	if(!sep->arg[1][0]) {
		c->Message(0, "FORMAT: #unscribespell <spellid>");
		return;
	}

	spell_id = atoi(sep->arg[1]);

	if(IsValidSpell(spell_id)) {
		book_slot = t->FindSpellBookSlotBySpellID(spell_id);

		if(book_slot >= 0) {
			t->UnscribeSpell(book_slot);

			t->Message(0, "Unscribing spell: %s (%i) from spellbook.", spells[spell_id].name, spell_id);

			if(t != c)
				c->Message(0, "Unscribing spell: %s (%i) for %s.", spells[spell_id].name, spell_id, t->GetName());

			LogFile->write(EQEMuLog::Normal, "Unscribe spell: %s (%i) request for %s from %s.", spells[spell_id].name, spell_id, t->GetName(), c->GetName());
		}
		else {
			t->Message(13, "Unable to unscribe spell: %s (%i) from your spellbook. This spell is not scribed.", spells[spell_id].name, spell_id);

			if(t != c)
				c->Message(13, "Unable to unscribe spell: %s (%i) for %s due to spell not scribed.", spells[spell_id].name, spell_id, t->GetName());
		}
	}
}

void command_unscribespells(Client *c, const Seperator *sep)
{
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient() && c->GetGM())
		t=c->GetTarget()->CastToClient();
	
	t->UnscribeSpellAll();
}

void command_wpinfo(Client *c, const Seperator *sep)
{
	Mob *t=c->GetTarget();

	if (t == NULL || !t->IsNPC()) {
		c->Message(0,"You must target an NPC to use this.");
		return;
	}
	
	NPC *n = t->CastToNPC();
	n->DisplayWaypointInfo(c);
}

void command_wpadd(Client *c, const Seperator *sep)
{
	int	type1=0,
		type2=1,
		pause=14;	// Defaults for a new grid if the arguments are omitted from the command

	Mob *t=c->GetTarget();
	if (t && t->IsNPC())
	{	Spawn2* s2info = t->CastToNPC()->respawn2;

		if(s2info == NULL)	// Can't figure out where this mob's spawn came from... maybe a dynamic mob created by #spawn
		{	c->Message(0,"#wpadd FAILED -- Can't determine which spawn record in the database this mob came from!");
			return;
		}
		else 
		{   if (sep->arg[1] && !strcasecmp(strlwr(sep->arg[1]),"circular")) type1=0;
		if (sep->arg[1] && !strcasecmp(strlwr(sep->arg[1]),"random"))	type1=2;
		if (sep->arg[1] && !strcasecmp(strlwr(sep->arg[1]),"patrol"))	type1=3;
		if (sep->arg[2] && atoi(sep->arg[2]) > 0)	pause=atoi(sep->arg[2]);
		    int32 tmp_grid = database.AddWPForSpawn(c, s2info->GetID(), c->GetX(),c->GetY(),c->GetZ(), pause, type1, type2, zone->GetZoneID());
		if (tmp_grid)
			t->CastToNPC()->SetGrid(tmp_grid);
		t->CastToNPC()->AssignWaypoints(t->CastToNPC()->GetGrid());
	}
	}
	else
		c->Message(0,"Usage: #wpadd [circular/random/patrol] [pause]");
} /*** END command_wpadd ***/


void command_interrupt(Client *c, const Seperator *sep)
{
	int16 ci_message=0x01b7, ci_color=0x0121;

	if(sep->arg[1][0])
		ci_message=atoi(sep->arg[1]);
	if(sep->arg[2][0])
		ci_color=atoi(sep->arg[2]);

	c->InterruptSpell(ci_message, ci_color);
}

void command_d1(Client *c, const Seperator *sep)
{
	EQApplicationPacket app(OP_Action, sizeof(Action_Struct));
	Action_Struct* a = (Action_Struct*)app.pBuffer;
	a->target = c->GetTarget()->GetID();
	a->source = c->GetID();
	a->type = atoi(sep->arg[1]);
	a->spell = atoi(sep->arg[2]);
	a->sequence = atoi(sep->arg[3]);
	app.priority = 1;
	entity_list.QueueCloseClients(c, &app);
}

void command_summonitem(Client *c, const Seperator *sep)
{
	if (!sep->IsNumber(1))
		c->Message(0, "Usage: #summonitem [item id] [charges], charges are optional");
	else {
		int32 itemid = atoi(sep->arg[1]);
		if (database.GetItemStatus(itemid) > c->Admin())
			c->Message(13, "Error: Insufficient status to summon this item.");
		else if (sep->argnum==2 && sep->IsNumber(2)) {
			c->SummonItem(itemid, atoi(sep->arg[2]) );
		} else if (sep->argnum==3) {
			c->SummonItem(itemid, atoi(sep->arg[2]), atoi(sep->arg[3]) );
		} else if (sep->argnum==4)
			c->SummonItem(itemid, atoi(sep->arg[2]), atoi(sep->arg[3]), atoi(sep->arg[4]) );
		else if (sep->argnum==5)
			c->SummonItem(itemid, atoi(sep->arg[2]), atoi(sep->arg[3]), atoi(sep->arg[4]), atoi(sep->arg[5]) );
		else if (sep->argnum==6)
			c->SummonItem(itemid, atoi(sep->arg[2]), atoi(sep->arg[3]), atoi(sep->arg[4]), atoi(sep->arg[5]), atoi(sep->arg[6]) );
		else if (sep->argnum==7)
			c->SummonItem(itemid, atoi(sep->arg[2]), atoi(sep->arg[3]), atoi(sep->arg[4]), atoi(sep->arg[5]), atoi(sep->arg[6]), atoi(sep->arg[7]) );
		else {
			c->SummonItem(itemid);
		}
	}
}

void command_giveitem(Client *c, const Seperator *sep)
{
	if (!sep->IsNumber(1)) {
		c->Message(13, "Usage: #summonitem [item id] [charges], charges are optional");
	} else if(c->GetTarget() == NULL) {
		c->Message(13, "You must target a client to give the item to.");
	} else if(!c->GetTarget()->IsClient()) {
		c->Message(13, "You can only give items to players with this command.");
	} else {
		Client *t = c->GetTarget()->CastToClient();
		int32 itemid = atoi(sep->arg[1]);
		if (database.GetItemStatus(itemid) > c->Admin())
			c->Message(13, "Error: Insufficient status to summon this item.");
		else if (sep->argnum==2 && sep->IsNumber(2)) {
			t->SummonItem(itemid, atoi(sep->arg[2]) );
		} else if (sep->argnum==3) {
			t->SummonItem(itemid, atoi(sep->arg[2]), atoi(sep->arg[3]) );
		} else if (sep->argnum==4)
			t->SummonItem(itemid, atoi(sep->arg[2]), atoi(sep->arg[3]), atoi(sep->arg[4]) );
		else if (sep->argnum==5)
			t->SummonItem(itemid, atoi(sep->arg[2]), atoi(sep->arg[3]), atoi(sep->arg[4]), atoi(sep->arg[5]) );
		else if (sep->argnum==6)
			t->SummonItem(itemid, atoi(sep->arg[2]), atoi(sep->arg[3]), atoi(sep->arg[4]), atoi(sep->arg[5]), atoi(sep->arg[6]) );
		else if (sep->argnum==7)
			t->SummonItem(itemid, atoi(sep->arg[2]), atoi(sep->arg[3]), atoi(sep->arg[4]), atoi(sep->arg[5]), atoi(sep->arg[6]), atoi(sep->arg[7]) );
		else {
			t->SummonItem(itemid);
		}
	}
}

void command_itemsearch(Client *c, const Seperator *sep)
{
	if (sep->arg[1][0] == 0)
		c->Message(0, "Usage: #itemsearch [search string]");
	else
	{
		const char *search_criteria=sep->argplus[1];

		const Item_Struct* item = 0;
		if (Seperator::IsNumber(search_criteria)) {
			item = database.GetItem(atoi(search_criteria));
			if (item)
				c->Message(0, "  %i: %s", (int) item->ID, item->Name);
			else
				c->Message(0, "Item #%s not found", search_criteria);
			return;
		}
#ifdef SHAREMEM
		int count=0;
		//int iSearchLen = strlen(search_criteria)+1;
		char sName[64];
		char sCriteria[255];
		strn0cpy(sCriteria, search_criteria, sizeof(sCriteria));
		strupr(sCriteria);
		char* pdest;
		int32 it = 0;
		while ((item = database.IterateItems(&it))) {
			strn0cpy(sName, item->Name, sizeof(sName));
			strupr(sName);
			pdest = strstr(sName, sCriteria);
			if (pdest != NULL) {
				c->Message(0, "  %i: %s", (int) item->ID, item->Name);
				count++;
			}
			if (count == 20)
				break;
		}
		if (count == 20)
			c->Message(0, "20 items shown...too many results.");
		else
			c->Message(0, "%i items found", count);
#endif
	}
}

void command_datarate(Client *c, const Seperator *sep)
{
//	EQStream *eqs = c->Connection();

	if (sep->arg[1][0] == 0) {
		//c->Message(0, "Datarate: %1.1f", eqs->GetDataRate());
		//if (c->Admin() >= commandChangeDatarate) {
			//c->Message(0, "Dataflow: %i", eqs->GetDataFlow());
			//c->Message(0, "Datahigh: %i", eqs->GetDataHigh());
		//}
	}
	else if (sep->IsNumber(1) && atof(sep->arg[1]) > 0 && (c->Admin() >= commandChangeDatarate || atof(sep->arg[1]) <= 25)) {
		//eqs->SetDataRate(atof(sep->arg[1]));
		//c->Message(0, "Datarate: %1.1f", eqs->GetDataRate());
	}
	else
		c->Message(0, "Usage: #DataRate [new data rate in kb/sec, max 25]");
}

void command_setaaxp(Client *c, const Seperator *sep)
{
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient())
		t=c->GetTarget()->CastToClient();
	
	if (sep->IsNumber(1)) {
		t->SetEXP(t->GetEXP(), atoi(sep->arg[1]), false);
		if(sep->IsNumber(2) && sep->IsNumber(3)) {
			t->SetLeadershipEXP(atoi(sep->arg[2]), atoi(sep->arg[3]));
		}
	} else
		c->Message(0, "Usage: #setaaxp <new AA XP value> (<new Group AA XP value> <new Raid XP value>)");
}

void command_setaapts(Client *c, const Seperator *sep)
{
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient())
		t=c->GetTarget()->CastToClient();

	if(sep->arg[1][0] == '\0' || sep->arg[2][0] == '\0')
		c->Message(0, "Usage: #setaapts <AA|group|raid> <new AA points value>");
	else if(atoi(sep->arg[2]) <= 0 || atoi(sep->arg[2]) > 200)
		c->Message(0, "You must have a number greater than 0 for points and no more than 200.");
	else if(!strcasecmp(sep->arg[1], "group")) {
		t->SetLeadershipEXP(atoi(sep->arg[2])*GROUP_EXP_PER_POINT, t->GetRaidEXP());
	} else if(!strcasecmp(sep->arg[1], "raid")) {
		t->SetLeadershipEXP(t->GetGroupEXP(), atoi(sep->arg[2])*RAID_EXP_PER_POINT);
	} else {
		t->SetEXP(t->GetEXP(),t->GetMaxAAXP()*atoi(sep->arg[2]),false);
		t->SendAAStats();
		t->SendAATable();
	}
}

void command_stun(Client *c, const Seperator *sep)
{
	Mob *t=c->CastToMob();
	int32 duration;

	if(sep->arg[1][0])
	{
		duration = atoi(sep->arg[1]);
		if(c->GetTarget())
			t=c->GetTarget();
		if(t->IsClient())
			t->CastToClient()->Stun(duration);
		else
			t->CastToNPC()->Stun(duration);
	}
	else
		c->Message(0, "Usage: #stun [duration]");
}

#ifdef EMBPERL_PLUGIN
#ifdef EMBPERL_EVAL_COMMANDS

void command_embperl_plugin(Client *c, const Seperator *sep)
{
       if(sep->arg[1][0] == 0)
       {
               c->Message(0, "Usage: #plugin (subname) [arguments]");
               return;
       }

       Embperl * perl;
       if(!parse || !(perl = ((PerlembParser *)parse)->getperl()))
       {
               c->Message(0, "Error: Perl module not loaded");
               return;
       }

       std::string exports = "$plugin::printbuff='';$plugin::ip='";
               struct in_addr ip; ip.s_addr = c->GetIP();
               exports += inet_ntoa(ip);
               exports += "';$plugin::name=qq(";
               exports += c->GetName();
               exports += ");package plugin;";
       perl->eval(exports.c_str());

       std::string fqsubname("plugin::");
       fqsubname.append(sep->arg[1]);

       //convert args into a vector of strings.
       std::vector<std::string> args;
       for(int i = 2; i < sep->argnum; ++i)
       {
               args.push_back(sep->arg[i]);
       }

       try
       {
               perl->dosub(fqsubname.c_str(), &args);
               std::string output = perl->getstr("$plugin::printbuff");
               if(output.length())
                       c->Message(0, "%s", output.c_str());
       }
       catch(const char * err)
       {
               c->Message(0, "Error executing plugin: %s", perl->lasterr().c_str());
       }

       perl->eval("package main;");

}

void command_embperl_eval(Client *c, const Seperator *sep)
{
       if(sep->arg[1][0] == 0)
       {
               c->Message(0, "Usage: #peval (expr)");
               return;
       }

       Embperl * perl;
       if(!parse || !(perl = ((PerlembParser *)parse)->getperl()))
       {
               c->Message(0, "Error: Perl module not loaded");
               return;
       }

       std::string exports = "$plugin::printbuff='';$plugin::ip='";
               struct in_addr ip; ip.s_addr = c->GetIP();
               exports += inet_ntoa(ip);
               exports += "';$plugin::name=qq(";
               exports += c->GetName();
               exports += ");";
       perl->eval(exports.c_str());

       try
       {
               std::string cmd = std::string("package plugin;") + std::string(sep->msg + sizeof("peval "));
               perl->eval(cmd.c_str());
               std::string output = perl->getstr("$plugin::printbuff");
               if(output.length())
                       c->Message(0, "%s", output.c_str());
       }
       catch(const char * err)
       {
               c->Message(0, "Error: %s", perl->lasterr().c_str());
       }

       perl->eval("package main;");

}

#endif //EMBPERL_EVAL_COMMANDS
#endif //EMBPERL_PLUGIN

void command_ban(Client *c, const Seperator *sep)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if(sep->arg[1][0] == 0)
	{
		c->Message(0, "Usage:  #ban [charname]");
	}
	else
	{
		database.RunQuery(query, MakeAnyLenString(&query, "SELECT account_id from character_ where name = '%s'", sep->arg[1]), errbuf, &result);
		if(query)
		{
			safe_delete_array(query);
			query=NULL;
		}
		if(mysql_num_rows(result))
		{
			row = mysql_fetch_row(result);
			mysql_free_result(result);
			database.RunQuery(query, MakeAnyLenString(&query, "UPDATE account set status = -2 where id = %i", atoi(row[0])), errbuf, 0);
			c->Message(13,"Account number %i with the character %s has been banned.", atoi(row[0]), sep->arg[1]);
		}
		else {
			c->Message(13,"Character does not exist.");
		}
		if(query)
		{
			safe_delete_array(query);
			query=NULL;
		}
	}
}

void command_ipban(Client *c, const Seperator *sep)
{
	if(sep->arg[1] == 0)
	{
		c->Message(0, "Usage:  #ipban [xxx.xxx.xxx.xxx]");
	} else {
		if(database.AddBannedIP(sep->arg[1], c->GetName())) {
			c->Message(0, "%s has been successfully added to the Banned_IPs table by %s",sep->arg[1], c->GetName());
		} else {
			c->Message(0, "IPBan Failed (IP address is possibly already in the table?)");
		}
	}
}

void command_revoke(Client *c, const Seperator *sep)
{
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	
	if(sep->arg[1][0] == 0 || sep->arg[2][0] == 0)
	{
		c->Message(0, "Usage:  #revoke [charname] [1/0]");
	}
	else
	{
		int32 tmp = database.GetAccountIDByChar(sep->arg[1]);
		if(tmp)
		{
			int flag = sep->arg[2][0] == '1' ? true : false;
			database.RunQuery(query, MakeAnyLenString(&query, "UPDATE account set revoked=%d where id = %i", flag, tmp), errbuf, 0);
			c->Message(13,"%s account number %i with the character %s.", flag?"Revoking":"Unrevoking", tmp, sep->arg[1]);
			Client* revokee = entity_list.GetClientByAccID(tmp);
			if(revokee)
			{
				c->Message(0, "Found %s in this zone.", revokee->GetName());
				revokee->SetRevoked(flag);
			}
			else
			{
#if EQDEBUG >= 6
				c->Message(0, "Couldn't find %s in this zone, passing request to worldserver.", sep->arg[1]);
#endif
				ServerPacket * outapp = new ServerPacket (ServerOP_Revoke,sizeof(RevokeStruct));
				RevokeStruct* revoke = (RevokeStruct*)outapp->pBuffer;
				strncpy(revoke->adminname, c->GetName(), 64);
				strncpy(revoke->name, sep->arg[1], 64);
				revoke->toggle = flag;
				worldserver.SendPacket(outapp);
				safe_delete(outapp);
			}
		}
		else {
			c->Message(13,"Character does not exist.");
		}
		if(query)
		{
			safe_delete_array(query);
			query=NULL;
		}
	}
}

void command_oocmute(Client *c, const Seperator *sep)
{
	if(sep->arg[1][0] == 0 || !(sep->arg[1][0] == '1' || sep->arg[1][0] == '0'))
		c->Message(0, "Usage:  #oocmute [1/0]");
	else {
	ServerPacket * outapp = new ServerPacket (ServerOP_OOCMute,1);
	*(outapp->pBuffer)=atoi(sep->arg[1]);
	worldserver.SendPacket(outapp);
	safe_delete(outapp);
	}
}

void command_checklos(Client *c, const Seperator *sep)
{
	if(c->GetTarget())
	{
//		if(c->CheckLos(c->GetTarget()))
		if(c->CheckLosFN(c->GetTarget()))
			c->Message(0, "You have LOS to %s", c->GetTarget()->GetName());
		else
			c->Message(0, "You do not have LOS to %s", c->GetTarget()->GetName());
	}
	else
	{
		c->Message(0, "ERROR: Target required");
	}
}

void command_set_adventure_points(Client *c, const Seperator *sep)
{
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient())
		t=c->GetTarget()->CastToClient();

	if(!sep->arg[1][0])
	{
		c->Message(0, "Usage: #setadventurepoints [points]");
		return;
	}

	c->Message(0, "Updating adventure points for %s", t->GetName());
//	t->GetPP().ldon_available_points=atoi(sep->arg[1]);
	t->UpdateLDoNPoints(0, 1);
}

void command_npcsay(Client *c, const Seperator *sep)
{
	if(c->GetTarget() && c->GetTarget()->IsNPC() && sep->arg[1][0])
	{
		c->GetTarget()->Say(sep->argplus[1]);
	}
	else
	{
		c->Message(0, "Usage: #npcsay message (requires NPC target");
	}
}

void command_npcshout(Client *c, const Seperator *sep)
{
	if(c->GetTarget() && c->GetTarget()->IsNPC() && sep->arg[1][0])
	{
		c->GetTarget()->Shout(sep->argplus[1]);
	}
	else
	{
		c->Message(0, "Usage: #npcshout message (requires NPC target");
	}
}

void command_timers(Client *c, const Seperator *sep) {
	if(!c->GetTarget() || !c->GetTarget()->IsClient()) {
		c->Message(0,"Need a player target for timers.");
		return;
	}
	Client *them = c->GetTarget()->CastToClient();
	
	vector< pair<pTimerType, PersistentTimer *> > res;
	them->GetPTimers().ToVector(res);
	
	c->Message(0,"Timers for target:");
	
	int r;
	int l = res.size();
	for(r = 0; r < l; r++) {
		c->Message(0,"Timer %d: %d seconds remain.", res[r].first, res[r].second->GetRemainingTime());
	}
}

void command_npcemote(Client *c, const Seperator *sep)
{
	if(c->GetTarget() && c->GetTarget()->IsNPC() && sep->arg[1][0])
	{
		c->GetTarget()->Emote(sep->argplus[1]);
	}
	else
	{
		c->Message(0, "Usage: #npcemote message (requires NPC target");
	}
}

void command_npcedit(Client *c, const Seperator *sep)
{
if (!c->GetTarget() || !c->GetTarget()->IsNPC())
		{
			c->Message(0, "Error: Must have NPC targeted");
			return;
		}
   if ( strcasecmp( sep->arg[1], "help" ) == 0 ) {
   
      c->Message(0, "Help File for #npcedit. Syntax for commands are:");
      c->Message(0, "#npcedit Name - Sets an NPCs name");
      c->Message(0, "#npcedit Lastname - Sets an NPCs lastname");
      c->Message(0, "#npcedit Level - Sets an NPCs level");
      c->Message(0, "#npcedit Race - Sets an NPCs race");
      c->Message(0, "#npcedit Class - Sets an NPCs class");
      c->Message(0, "#npcedit Bodytype - Sets an NPCs bodytype");
      c->Message(0, "#npcedit HP - Sets an NPCs hitpoints");
      c->Message(0, "#npcedit Gender - Sets an NPCs gender");
      c->Message(0, "#npcedit Texture - Sets an NPCs texture");
      c->Message(0, "#npcedit Helmtexture - Sets an NPCs helmtexture");
      c->Message(0, "#npcedit Size - Sets an NPCs size");
      c->Message(0, "#npcedit Hpregen - Sets an NPCs hitpoint regen rate per tick");
      c->Message(0, "#npcedit Manaregen - Sets an NPCs mana regen rate per tick");
      c->Message(0, "#npcedit Loottable - Sets the lootable ID for an NPC ");
      c->Message(0, "#npcedit Merchantid - Sets the merchant ID for an NPC");
      c->Message(0, "#npcedit Spell - Sets the npc spells list ID for an NPC");
      c->Message(0, "#npcedit Faction - Sets the NPCs faction id");
      c->Message(0, "#npcedit Mindmg - Sets an NPCs minimum damage");
      c->Message(0, "#npcedit Maxdmg - Sets an NPCs maximum damage");
      c->Message(0, "#npcedit Aggroradius - Sets an NPCs aggro radius");
      c->Message(0, "#npcedit Social - Set to 1 if an NPC should assist others on its faction");
      c->Message(0, "#npcedit Runspeed - Sets an NPCs run speed");
      c->Message(0, "#npcedit MR - Sets an NPCs magic resistance");
      c->Message(0, "#npcedit PR - Sets an NPCs poisen resistance");
      c->Message(0, "#npcedit DR - Sets an NPCs disease resistance");
      c->Message(0, "#npcedit FR - Sets an NPCs fire resistance");
      c->Message(0, "#npcedit CR - Sets an NPCs cold resistance");
      c->Message(0, "#npcedit Seeinvis - Sets an NPCs ability to see invis");   
      c->Message(0, "#npcedit Seeinvisundead - Sets an NPCs ability to see through invis vs. undead");   
      c->Message(0, "#npcedit Seehide - Sets an NPCs ability to see through hide");
	  c->Message(0, "#npcedit Seeimprovedhide - Sets an NPCs ability to see through improved hide");
      c->Message(0, "#npcedit AC - Sets an NPCs armor class");
      c->Message(0, "#npcedit npcaggro - Sets an NPC's npc_aggro flag");
      c->Message(0, "#npcedit qglobal - Sets an NPC's quest global flag");
      c->Message(0, "#npcedit limit - Sets an NPC's spawn limit counter");
      c->Message(0, "#npcedit Attackspeed - Sets an NPC's attack speed modifier");
      c->Message(0, "#npcedit findable - Sets an NPC's findable flag");
      
   }
   else if ( strcasecmp( sep->arg[1], "name" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has the name %s",c->GetTarget()->CastToNPC()->GetNPCTypeID(),(sep->argplus[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set name='%s' where id=%i",(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }

   else if ( strcasecmp( sep->arg[1], "lastname" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has the lastname %s",c->GetTarget()->CastToNPC()->GetNPCTypeID(),(sep->argplus[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set lastname='%s' where id=%i",(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "race" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has the race %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set race=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "class" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u is now class %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set class=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "bodytype" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has type %i bodytype ",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set bodytype=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "hp" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has %i Hitpoints",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set hp=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "gender" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u is now gender %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set gender=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "texture" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now uses texture %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set texture=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "helmtexture" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now uses helmtexture %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set helmtexture=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "size" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u is now size %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set size=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "hpregen" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now regens %i hitpoints per tick",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set hp_regen_rate=%i where hp_regen_rate=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "manaregen" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now regens %i mana per tick",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set mana_regen_rate=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "loottable" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u is now on loottable_id %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set loottable_id=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "merchantid" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now is merchant_id %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set merchant_id=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "spell" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now uses spell list %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set npc_spells_id=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "faction" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u is now faction %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set npc_faction_id=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "mindmg" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now hits for a min of %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set mindmg=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "maxdmg" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now hits for a max of %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set maxdmg=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "aggroradius" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has an aggro radius of %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set aggroradius=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "social" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u social status is now %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set social=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "runspeed" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u is now runs at %f",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atof(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set runspeed=%f where id=%i",atof(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "MR" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has a magic resist of %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set MR=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "DR" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has a disease resist of %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set DR=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "CR" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has a cold resist of %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set CR=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "FR" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has a fire resist of %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set FR=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "PR" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has a poisen resist of %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set PR=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "seeinvis" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has seeinvis set to %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set see_invis=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "seeinvisundead" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has seeinvisundead set to %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set see_invis_undead=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "seehide" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has seehide set to %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set see_hide=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "seeimprovedhide" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has seeimprovedhide set to %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set see_improved_hide=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "AC" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has %i armor class",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->argplus[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set ac=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "level" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u is now level %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set level=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "qglobal" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"Quest globals have been %d for NPCID %u",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2])==0?"disabled":"enabled");
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set qglobal=%i where id=%i",atoi(sep->argplus[2])==0?0:1,c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "npcaggro" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u will now %s other NPCs with negative faction npc_value",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2])==0?"not aggro":"aggro");
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set npc_aggro=%i where id=%i",atoi(sep->argplus[2])==0?0:1,c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "limit" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has a spawn limit of %i",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->argplus[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set limit=%i where id=%i",atoi(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "Attackspeed" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u now has attack_speed set to %f",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atof(sep->arg[2]));
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set attack_speed=%f where id=%i",atof(sep->argplus[2]),c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }
   else if ( strcasecmp( sep->arg[1], "findable" ) == 0 )
   {
      char errbuf[MYSQL_ERRMSG_SIZE];
      char *query = 0;
      c->Message(15,"NPCID %u is now %s",c->GetTarget()->CastToNPC()->GetNPCTypeID(),atoi(sep->arg[2])==0?"not findable":"findable");
      database.RunQuery(query, MakeAnyLenString(&query, "update npc_types set findable=%i where id=%i",atoi(sep->argplus[2])==0?0:1,c->GetTarget()->CastToNPC()->GetNPCTypeID()), errbuf);
      c->LogSQL(query);
      safe_delete_array(query);
   }

   else if((sep->arg[1][0] == 0 || strcasecmp(sep->arg[1],"*")==0) || ((c->GetTarget()==0) || (c->GetTarget()->IsClient())))
   {   
      c->Message(0, "Type #npcedit help for more info");
   }
}

#ifdef PACKET_PROFILER
void command_packetprofile(Client *c, const Seperator *sep) {
	Client *t = c;
	if(c->GetTarget() && c->GetTarget()->IsClient()) {
		t = c->GetTarget()->CastToClient();
	}
	c->DumpPacketProfile();
}
#endif

#ifdef EQPROFILE
void command_profiledump(Client *c, const Seperator *sep) {
	DumpZoneProfile();
}

void command_profilereset(Client *c, const Seperator *sep) {
	ResetZoneProfile();
}
#endif

void command_opcode(Client *c, const Seperator *sep) {
#ifndef WIN32
#warning rewrite this...
#endif
	if(!strcasecmp( sep->arg[1], "reload" )) {
		ReloadAllPatches();
		c->Message(0, "Opcodes for all patches have been reloaded");
	}
	
/*	if(ZoneOpcodeManager == NULL) {
		c->Message(13, "It seems that the server is not using an opcode translator.");
		return;
	}
	
	if(!strcasecmp( sep->arg[1], "mode" )) {
		OpcodeManager *new_mgr, *old_mgr;
		if(!strcasecmp( sep->arg[2], "shared" )) {
			new_mgr = new SharedOpcodeManager();
		} else if(!strcasecmp( sep->arg[2], "private" )) {
			new_mgr = new RegularOpcodeManager();
		} else {
			c->Message(13, "You specified an invalid manager type. Options: shared | private");
			return;
		}
		if(!new_mgr->LoadOpcodes(OPCODES_FILE)) {
			LogFile->write(EQEMuLog::Error, "Loading new opcode manager failed. Not switching");
			c->Message(13, "Loading new opcode manager failed. Not switching");
			return;
		}
		
		old_mgr = ZoneOpcodeManager;
		ZoneOpcodeManager = new_mgr;
		safe_delete(old_mgr);
		
		c->Message(0, "Opcodes mode has been changed to '%s'", sep->arg[2]);
	} else if(!strcasecmp( sep->arg[1], "reload" )) {
		if(!ZoneOpcodeManager->Mutable()) {
			c->Message(13, "Your opcode manager is not editable. Only private opcode manager can be edited right now.");
			return;
		}
		((MutableOpcodeManager *) ZoneOpcodeManager)->ReloadOpcodes(OPCODES_FILE);
		c->Message(0, "Opcodes have been reloaded");
	} else if(!strcasecmp( sep->arg[1], "get" )) {
		EmuOpcode op = ZoneOpcodeManager->NameSearch(sep->arg[2]);
		if(op == OP_Unknown) {
			c->Message(0, "Opcode '%s' is unknown.", sep->arg[2]);
		} else {
			uint16 eq_op = ZoneOpcodeManager->EmuToEQ(op);
			c->Message(0, "Opcode '%s' is 0x%.4x", sep->arg[2], eq_op);
		}
	} else if(!strcasecmp( sep->arg[1], "set" )) {
		if(!ZoneOpcodeManager->Mutable()) {
			c->Message(13, "Your opcode manager is not editable. Only private opcode manager can be edited right now.");
			return;
		}
		//find the named opcode
		EmuOpcode op = ZoneOpcodeManager->NameSearch(sep->arg[2]);
		if(op == OP_Unknown) {
			c->Message(13, "Unable to locate opcode named '%s'", sep->arg[2]);
			return;
		}
		
		//turn the second value into a number
		uint32 newop = 0;
		if(sscanf(sep->arg[3], "0x%x", &newop) != 1) {
			c->Message(13, "Unable to read your opcode value. It hsould be of the form 0x0000");
			return;
		}
		
		//set it
		((MutableOpcodeManager *)ZoneOpcodeManager)->SetOpcode(op, newop);
		if(newop == 0) {
			c->Message(0, "Opcode '%s' has been cleared.");
		} else {
			c->Message(0, "Opcode '%s' has been set to 0x%.4x.", sep->arg[2], newop);
		}
	} else {
		c->Message(0, "Usage: #opcodes [command]");
		c->Message(0, "Commands:");
		c->Message(0, "  mode [shared|private] - Switch to a new opcode manager of this type.");
		c->Message(0, "  reload - Reloads your opcodes.conf");
		c->Message(0, "  get [name] - Get the value for the opcode name.");
		c->Message(0, "  set [name] [value 0x..] - Set an opcode in game (temporary).");
		c->Message(0, "  search [value 0x..] - Try to find the name for an opcode.");
	}
	
	*/
}

void command_logsql(Client *c, const Seperator *sep) {
	if(!strcasecmp( sep->arg[1], "off" )) {
		c->ChangeSQLLog(NULL);
	} else if(sep->arg[1][0] != '\0') {
		c->ChangeSQLLog(sep->argplus[1]);
	} else {
		c->Message(0, "Usage: #logsql (file name)");
	}
}

void command_logs(Client *c, const Seperator *sep)
{
#ifdef CLIENT_LOGS
	Client *t = c;
	if(c->GetTarget() && c->GetTarget()->IsClient()) {
		t = c->GetTarget()->CastToClient();
	}
	
	if(!strcasecmp( sep->arg[1], "status" ) )
		client_logs.subscribe(EQEMuLog::Status, t);
	else if(!strcasecmp( sep->arg[1], "normal" ) )
		client_logs.subscribe(EQEMuLog::Normal, t);
	else if(!strcasecmp( sep->arg[1], "error" ) )
		client_logs.subscribe(EQEMuLog::Error, t);
	else if(!strcasecmp( sep->arg[1], "debug" ) )
		client_logs.subscribe(EQEMuLog::Debug, t);
	else if(!strcasecmp( sep->arg[1], "quest" ) )
		client_logs.subscribe(EQEMuLog::Quest, t);
	else if(!strcasecmp( sep->arg[1], "all" ) )
		client_logs.subscribeAll(t);
	else {
		c->Message(0, "Usage: #logs [status|normal|error|debug|quest|all]");
		return;
	}
	if(c != t)
		c->Message(0, "%s have been subscribed to %s logs.", t->GetName(), sep->arg[1]);
	t->Message(0, "You have been subscribed to %s logs.", sep->arg[1]);
#else
	c->Message(0, "Client logs are disabled in this server's build.");
#endif
}

void command_nologs(Client *c, const Seperator *sep)
{
#ifdef CLIENT_LOGS
	Client *t = c;
	if(c->GetTarget() && c->GetTarget()->IsClient()) {
		t = c;
	}
	
	if(!strcasecmp( sep->arg[1], "status" ) )
		client_logs.unsubscribe(EQEMuLog::Status, t);
	else if(!strcasecmp( sep->arg[1], "normal" ) )
		client_logs.unsubscribe(EQEMuLog::Normal, t);
	else if(!strcasecmp( sep->arg[1], "error" ) )
		client_logs.unsubscribe(EQEMuLog::Error, t);
	else if(!strcasecmp( sep->arg[1], "debug" ) )
		client_logs.unsubscribe(EQEMuLog::Debug, t);
	else if(!strcasecmp( sep->arg[1], "quest" ) )
		client_logs.unsubscribe(EQEMuLog::Quest, t);
	else if(!strcasecmp( sep->arg[1], "all" ) )
		client_logs.unsubscribeAll(t);
	else {
		c->Message(0, "Usage: #logs [status|normal|error|debug|quest|all]");
		return;
	}
	
	c->Message(0, "You have been unsubscribed from %s logs.", sep->arg[1]);
#else
	c->Message(0, "Client logs are disabled in this server's build.");
#endif
}

void command_qglobal(Client *c, const Seperator *sep) {
	//Cisyouc: In-game switch for qglobal column
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	if(sep->arg[1][0] == 0) {
		c->Message(0, "Syntax: #qglobal [on/off/view]. Requires NPC target.");
		return;
	}
	Mob *t = c->GetTarget();
	if(!t || !t->IsNPC()) {
		c->Message(13, "NPC Target Required!");
		return;
	}
	if(!strcasecmp(sep->arg[1], "on"))
	{
		if(!database.RunQuery(query, MakeAnyLenString(&query, "UPDATE npc_types SET qglobal=1 WHERE id='%i'", t->GetNPCTypeID()), errbuf, 0))
		{
			c->Message(15, "Could not update database.");
		}
		else
		{
			c->LogSQL(query);
			c->Message(15, "Success! Changes take effect on zone reboot.");
		}
		safe_delete(query);
	}
	else if(!strcasecmp(sep->arg[1], "off"))
	{
		if(!database.RunQuery(query, MakeAnyLenString(&query, "UPDATE npc_types SET qglobal=0 WHERE id='%i'", t->GetNPCTypeID()), errbuf, 0))
		{
			c->Message(15, "Could not update database.");
		}
		else
		{
			c->LogSQL(query);
			c->Message(15, "Success! Changes take effect on zone reboot.");
		}
		safe_delete(query);
	}
	else if(!strcasecmp(sep->arg[1], "view"))
	{
		const NPCType *type = database.GetNPCType(t->GetNPCTypeID());
		if(!type) {
			c->Message(15, "Invalid NPC type.");
		} else if(type->qglobal) {
			c->Message(15, "This NPC has quest globals active.");
		} else {
			c->Message(15, "This NPC has quest globals disabled.");
		}
	} else {
		c->Message(15, "Invalid action specified.");
	}
}

void command_fear(Client *c, const Seperator *sep) {
	//super-command for editing fear grids and hints
//	char errbuf[MYSQL_ERRMSG_SIZE];
//	char *query = 0;
	if(sep->arg[1][0] == '\0' || !strcasecmp(sep->arg[1], "help")) {
		c->Message(0, "Syntax: #fear [view|close|add|link|list|del].");
		c->Message(0, "...view - spawn an NPC at each fear grid point, and fear hint");
		c->Message(0, "...close - spawn an NPC at the closest fear point");
		c->Message(0, "...path [##] [draw|npc] - draw a path (or spawn an NPC) at each fear point for ## hops");
//		c->Message(0, "...add [force|disjoint]- add a new fear hint point where your standing");
//		c->Message(0, "....... force requires this point not move when combining nodes");
//		c->Message(0, "....... disjoint marks the graph connected to this node as a valid disjoint graph");
//		c->Message(0, "...link [id1] [id2] - make a fear hint link between two hint points");
//		c->Message(0, "...list - show a list of all fear hint points for this zone");
//		c->Message(0, "...find [range] - show a list of all fear hint points eithin range of you");
//		c->Message(0, "...del [id] - remove the fear hint 'id'");
//		c->Message(0, "...start - fears your target until you #fear stop them");
//		c->Message(0, "...stop - Stops fear on your target");
		return;
	}
	
	if(!strcasecmp(sep->arg[1], "view")) {
		if(zone->pathing == NULL) {
			c->Message(13, "There is no fear grid file loaded for this zone.");
			return;
		}
		
		int32 count = zone->pathing->CountNodes();
		int32 r;
		char buf[128];
		PathNode_Struct *node = zone->pathing->GetNode(0); //assumes nodes are stored in a linear array
		for(r = 0; r < count; r++, node++) {
			sprintf(buf, "Fear_Point%d 3", r);
			NPC* npc = NPC::SpawnNPC(buf, node->x, node->y, node->z, c->GetHeading(), NULL);
			if(npc == NULL)
				c->Message(13, "Unable to spawn new NPC marker.");
			//do we need to do anything else?
		}
	} else if(!strcasecmp(sep->arg[1], "path")) {
		if(zone->pathing == NULL) {
			c->Message(13, "There is no fear grid file loaded for this zone.");
			return;
		}
		
		int dist = atoi(sep->arg[2]);
		char buf[128];
		
		FindPerson_Point it;
		vector<FindPerson_Point> pts;
		pts.reserve(dist+2);
		bool path_mode = (strcasecmp(sep->arg[3], "npc") != 0);
		
		MobFearState fs;
		
		sprintf(buf, "Close_Fear_Link%d_ 3", dist);
		if(!zone->pathing->FindNearestFear(&fs, c->GetX(), c->GetY(), c->GetZ())) {
			c->Message(13, "Unable to locate a closest fear path.");
			return;
		}
		
		if(path_mode) {
			it.x = c->GetX();
			it.y = c->GetY();
			it.z = c->GetZ();
			pts.push_back(it);
			it.x = fs.x;
			it.y = fs.y;
			it.z = fs.z;
			pts.push_back(it);
		} else {
			NPC* npc = NPC::SpawnNPC(buf, fs.x, fs.y, fs.z, c->GetHeading(), NULL);
			if(npc == NULL)
				c->Message(13, "Unable to spawn new NPC marker.");
		}
		
		for(dist--; dist > 0; dist--) {
			sprintf(buf, "Close_Fear_Link%d_ 3", dist);
			if(!zone->pathing->NextFearPath(&fs)) {
				c->Message(13, "Unable to locate next fear path.");
				return;
			}
			
			if(path_mode) {
				it.x = fs.x;
				it.y = fs.y;
				it.z = fs.z;
				pts.push_back(it);
			} else {
				/*NPC* npc = */NPC::SpawnNPC(buf, fs.x, fs.y, fs.z, c->GetHeading(), NULL);
			}
		}
		
		if(path_mode) {
			c->SendPathPacket(pts);
		}
		
	} else if(!strcasecmp(sep->arg[1], "close")) {
		if(zone->pathing == NULL) {
			c->Message(13, "There is no fear grid file loaded for this zone.");
			return;
		}
		MobFearState fs;
		
		if(!zone->pathing->FindNearestFear(&fs, c->GetX(), c->GetY(), c->GetZ())) {
			c->Message(13, "Unable to locate a closest fear path.");
			return;
		}
		
		NPC* npc = NPC::SpawnNPC("Close_Fear_Point 2", fs.x, fs.y, fs.z, c->GetHeading(), NULL);
		if(npc == NULL)
			c->Message(13, "Unable to spawn new NPC marker.");
		
	} else if(!strcasecmp(sep->arg[1], "see")) {
		
		vector<FindPerson_Point> points;
		
		Mob* target = c->GetTarget();
		
		if(target == NULL) {
			//empty length packet == not found.
			EQApplicationPacket outapp(OP_FindPersonReply, 0);
			c->QueuePacket(&outapp);
			return;
		}
		
		c->Message(13, "Found NPC '%s'\n", target->GetName());
		
		//fill in the path array...
		points.resize(4);
		points[0].x = c->GetX();
		points[0].y = c->GetY();
		points[0].z = c->GetZ();
		points[1].x = target->GetX();
		points[1].y = target->GetY();
		points[1].z = target->GetZ();
		points[2].x = 10;
		points[2].y = 10;
		points[2].z = 10;
		points[3].x = 0;
		points[3].y = 0;
		points[3].z = 0;
		
		
		
		if(points.size() == 0) {
			//empty length packet == not found.
			EQApplicationPacket outapp(OP_FindPersonReply, 0);
			c->QueuePacket(&outapp);
			return;
		}
		
		int len = sizeof(FindPersonResult_Struct) + points.size() * sizeof(FindPerson_Point);
		EQApplicationPacket *outapp = new EQApplicationPacket(OP_FindPersonReply, len);
		FindPersonResult_Struct* fpr=(FindPersonResult_Struct*)outapp->pBuffer;
		
		vector<FindPerson_Point>::iterator cur, end;
		cur = points.begin();
		end = points.end();
		int r;
		for(r = 0; cur != end; cur++, r++) {
			fpr->path[r] = *cur;
		}
		cur--;	//last element.
		fpr->dest = *cur;
		
		c->FastQueuePacket(&outapp);
	} else {
		c->Message(15, "Invalid action specified. use '#fear help' for help");
	}
}

void command_path(Client *c, const Seperator *sep) {
	//super-command for editing fear grids and hints
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	if(sep->arg[1][0] == '\0' || !strcasecmp(sep->arg[1], "help")) {
		c->Message(0, "Syntax: #path [view|close|add|link|list|del].");
		c->Message(0, "...view - spawn an NPC at each path grid point, and fear hint");
		c->Message(0, "...close - spawn an NPC at the closest path point");
		c->Message(0, "...show [draw|npc] [x] [y] [z]- draw a path (or spawn an NPC) at each path point to x,y,z");
		c->Message(0, "...to [draw|npc] - draw a path (or spawn an NPC) at each path point to your target");
		c->Message(0, "...add [force|disjoint]- add a new path hint point where your standing");
		c->Message(0, "....... force requires this point not move when combining nodes");
		c->Message(0, "....... disjoint marks the graph connected to this node as a valid disjoint graph");
		c->Message(0, "...list - show a list of all path hint points for this zone");
		c->Message(0, "...find [range] - show a list of all path hint points within range of you");
		c->Message(0, "...del [id] - remove the path hint 'id'");
//		c->Message(0, "...start - fears your target until you #fear stop them");
//		c->Message(0, "...stop - Stops fear on your target");
		return;
	}
	
	if(!strcasecmp(sep->arg[1], "add")) {
		int force = 0;
		int disjoint = 0;
		if(!strcasecmp(sep->arg[2], "force")) {
			force = 1;
			if(!strcasecmp(sep->arg[1], "disjoint"))
				disjoint = 1;
		} else if(!strcasecmp(sep->arg[2], "disjoint")) {
			disjoint = 1;
		}
		if(!database.RunQuery(query, MakeAnyLenString(&query, 
			"INSERT INTO fear_hints (zone,x,y,z,forced,disjoint) VALUES('%s',%f,%f,%f,%d,%d)",
			zone->GetShortName(), c->GetX(), c->GetY(), c->GetZ(), force, disjoint), errbuf))
		{
			c->Message(15, "Error adding hint: %s", errbuf);
		} else {
			c->LogSQL(query);
			c->Message(15, "Success! Path hint point added.");
		}
		safe_delete(query);
	} else if(!strcasecmp(sep->arg[1], "del")) {
		if(!database.RunQuery(query, MakeAnyLenString(&query, 
			"DELETE FROM fear_hints WHERE zone='%s' AND id=%d",
			zone->GetShortName(), atoi(sep->arg[2])), errbuf))
		{
			c->Message(15, "Error adding hint: %s", errbuf);
		} else {
			c->LogSQL(query);
			c->Message(15, "Success! Path hint point added.");
		}
		safe_delete(query);
	} else if(!strcasecmp(sep->arg[1], "list")) {
		MYSQL_RES *result;
		MYSQL_ROW row;
		if (database.RunQuery(query, MakeAnyLenString(&query, 
			"SELECT id,x,y,z FROM fear_hints WHERE zone='%s'",
			zone->GetShortName()), errbuf, &result))
		{
			c->Message(0, "Path Hints for %s:", zone->GetShortName());
			while ((row = mysql_fetch_row(result)))
			{
				c->Message(0, "[%s]: (%s, %s, %s)", row[0], row[1], row[2], row[3]);
			}
			mysql_free_result(result);
		} else {
			c->Message(0, "Unable to query path hints: %s", errbuf);
		}
		safe_delete_array(query);
	} else if(!strcasecmp(sep->arg[1], "find")) {
		float range = atof(sep->arg[2]);
		if(range < 1) {
			c->Message(0, "Invalid range.");
			return;
		}
		
		MYSQL_RES *result;
		MYSQL_ROW row;
		if (database.RunQuery(query, MakeAnyLenString(&query, 
			"SELECT id,x,y,z FROM fear_hints WHERE zone='%s' AND (x*x+y*y) < %f",
			zone->GetShortName(), range*range), errbuf, &result))
		{
			c->Message(0, "Path Hints for %s within %.3f:", zone->GetShortName(), range);
			while ((row = mysql_fetch_row(result)))
			{
				c->Message(0, "[%s]: (%s, %s, %s)", row[0], row[1], row[2], row[3]);
			}
			mysql_free_result(result);
		} else {
			c->Message(0, "Unable to query path hints: %s", errbuf);
		}
		safe_delete_array(query);
	} else if(!strcasecmp(sep->arg[1], "view")) {
		if(zone->pathing == NULL) {
			c->Message(13, "There is no path grid file loaded for this zone.");
			return;
		}
		
		int32 count = zone->pathing->CountNodes();
		int32 r;
		char buf[128];
		PathNode_Struct *node = zone->pathing->GetNode(0); //assumes nodes are stored in a linear array
		for(r = 0; r < count; r++, node++) {
			sprintf(buf, "Path_Point%d 3", r);
			NPC* npc = NPC::SpawnNPC(buf, node->x, node->y, node->z, c->GetHeading(), NULL);
			if(npc == NULL)
				c->Message(13, "Unable to spawn new NPC marker.");
			//do we need to do anything else?
		}
	} else if(!strcasecmp(sep->arg[1], "show") || !strcasecmp(sep->arg[1], "to")) {
		if(zone->pathing == NULL) {
			c->Message(13, "There is no path grid file loaded for this zone.");
			return;
		}
		
		char buf[128];
		
		FindPerson_Point it;
		vector<FindPerson_Point> pts;
		bool path_mode = (strcasecmp(sep->arg[2], "npc") != 0);
		
		PathFindingState ps;
		ps.x = c->GetX();
		ps.y = c->GetY();
		ps.z = c->GetZ();
		float x,y,z;
		if(!strcasecmp(sep->arg[1], "to")) {
			Mob *t = c->GetTarget();
			if(t == NULL) {
				c->Message(13, "You must have a target to path to them.");
				return;
			}
			x = ps.dest_x = t->GetX();
			y = ps.dest_y = t->GetY();
			z = ps.dest_z = t->GetZ();
		} else {
			x = ps.dest_x = atof(sep->arg[3]);
			y = ps.dest_y = atof(sep->arg[4]);
			z = ps.dest_z = atof(sep->arg[5]);
		}
		
		if(!zone->pathing->InitPathFinding(&ps, false)) {
			if(zone->pathing->InitPathFinding(&ps, true)) {
				c->Message(13, "Unable to locate a clean path, but found one without LOS to endpoints.");
			} else {
				c->Message(13, "Unable to locate a path to (%.3f,%.3f,%.3f)", x, y, z);
				return;
			}
		}
		
		c->Message(0, "Showing pathing to (%.3f,%.3f,%.3f)", x, y, z);
		
		int d = 0;
		if(path_mode) {
			//initial position
			it.x = c->GetX();
			it.y = c->GetY();
			it.z = c->GetZ();
			pts.push_back(it);
			//first path node
			it.x = ps.x;
			it.y = ps.y;
			it.z = ps.z;
			pts.push_back(it);
		} else {
			sprintf(buf, "Close_Path_Link%d_ 3", d++);
			NPC* npc = NPC::SpawnNPC(buf, ps.x, ps.y, ps.z, c->GetHeading(), NULL);
			if(npc == NULL)
				c->Message(13, "Unable to spawn new NPC marker.");
		}
		c->Message(0, "First node (%.3f,%.3f,%.3f)", ps.x, ps.y, ps.z);
		
		for(; zone->pathing->NextPathFinding(&ps); d++) {
			sprintf(buf, "Close_Path_Link%d_ 3", d);

			c->Message(0, "Next (%.3f,%.3f,%.3f)", ps.x, ps.y, ps.z);
						
			if(path_mode) {
				it.x = ps.x;
				it.y = ps.y;
				it.z = ps.z;
				pts.push_back(it);
			} else {
				/*NPC* npc = */NPC::SpawnNPC(buf, ps.x, ps.y, ps.z, c->GetHeading(), NULL);
			}
		}
		
		if(path_mode) {
			c->SendPathPacket(pts);
		}
		
	} else if(!strcasecmp(sep->arg[1], "close")) {
		if(zone->pathing == NULL) {
			c->Message(13, "There is no fear grid file loaded for this zone.");
			return;
		}
		MobFearState fs;
		
		if(!zone->pathing->FindNearestFear(&fs, c->GetX(), c->GetY(), c->GetZ())) {
			c->Message(13, "Unable to locate a closest fear path.");
			return;
		}
		
		NPC* npc = NPC::SpawnNPC("Close_Fear_Point 2", fs.x, fs.y, fs.z, c->GetHeading(), NULL);
		if(npc == NULL)
			c->Message(13, "Unable to spawn new NPC marker.");
	} else {
		c->Message(15, "Invalid action specified. use '#path help' for help");
	}
}

void Client::Undye() {
	for (int cur_slot = 0; cur_slot < 9 ; cur_slot++ ){
		int8 slot2=SlotConvert(cur_slot);
		ItemInst* inst = m_inv.GetItem(slot2);
		if(inst != NULL) {
			inst->SetColor(inst->GetItem()->Color);
			database.SaveInventory(CharacterID(), inst, slot2);
		}
		m_pp.item_tint[cur_slot].rgb.use_tint = 0;
		SendWearChange(cur_slot);
	}
}

void command_undye(Client *c, const Seperator *sep)
{
	if(c->GetTarget() && c->GetTarget()->IsClient())
	{
		c->GetTarget()->CastToClient()->Undye();
	}
	else
	{
		c->Message(0, "ERROR: Client target required");
	}
}

void command_ginfo(Client *c, const Seperator *sep)
{
	if(c->GetTarget() && c->GetTarget()->IsClient())
	{
		Client *t = c->GetTarget()->CastToClient();
		Group *g = t->GetGroup();
		if(!g) {
			c->Message(0, "This client is not in a group");
			return;
		}
		
		c->Message(0, "Group #%lu:", g->GetID());
		
		uint32 r;
		for(r = 0; r < MAX_GROUP_MEMBERS; r++) {
			if(g->members[r] == NULL) {
				if(g->membername[r][0] == '\0')
					continue;
				c->Message(0, "...Zoned Member: %s", g->membername[r]);
			} else {
				c->Message(0, "...In-Zone Member: %s (0x%x)", g->membername[r], g->members[r]);
			}
		}
		
	}
	else
	{
		c->Message(0, "ERROR: Client target required");
	}
}

void command_hp(Client *c, const Seperator *sep)
{
	c->SendHPUpdate();
	c->SendManaUpdatePacket();
}

void command_aggro(Client *c, const Seperator *sep)
{
	if(c->GetTarget() == NULL || !c->GetTarget()->IsNPC()) {
		c->Message(0, "Error: you must have an NPC target.");
		return;
	}
	float d = atof(sep->arg[1]);
	if(d == 0.0f) {
		c->Message(13, "Error: distance argument required.");
		return;
	}
	bool verbose = false;
	if(sep->arg[2][0] == '-' && sep->arg[2][1] == 'v' && sep->arg[2][2] == '\0') {
		verbose = true;
	}
	
	entity_list.DescribeAggro(c, c->GetTarget()->CastToNPC(), d, verbose);
}

void command_pf(Client *c, const Seperator *sep)
{
	if(c->GetTarget())
	{
		Mob *who = c->GetTarget();
		c->Message(0, "POS: (%.2f, %.2f, %.2f)", who->GetX(), who->GetY(), who->GetZ());
		c->Message(0, "WP: (%.2f, %.2f, %.2f) (%d/%d)", who->GetCWPX(), who->GetCWPY(), who->GetCWPZ(), who->GetCWP(), who->IsNPC()?who->CastToNPC()->GetMaxWp():-1);
		c->Message(0, "TAR: (%.2f, %.2f, %.2f)", who->tarx, who->tary, who->tarz);
		c->Message(0, "TARV: (%.2f, %.2f, %.2f)", who->tar_vx, who->tar_vy, who->tar_vz);
		c->Message(0, "|TV|=%.2f index=%d", who->tar_vector, who->tar_ndx);
		c->Message(0, "pause=%d RAspeed=%d", who->GetCWPP(), who->GetRunAnimSpeed());
	} else {
		c->Message(0, "ERROR: target required");
	}
}

void command_bestz(Client *c, const Seperator *sep) {
	if (zone->map == NULL) {
		c->Message(0,"Maps deactivated in this zone.");
		return;
	}
	
	NodeRef pnode;
	if(c->GetTarget()) {
		pnode = zone->map->SeekNode( zone->map->GetRoot(), c->GetTarget()->GetX(), c->GetTarget()->GetY() );
	} else {
		pnode = zone->map->SeekNode( zone->map->GetRoot(), c->GetX(), c->GetY() );
	}
	if (pnode == NODE_NONE) {
		c->Message(0,"Unable to find your node.");
		return;
	}
	
	VERTEX me;
	me.x = c->GetX();
	me.y = c->GetY();
	me.z = c->GetZ() + (c->GetSize()==0.0?6:c->GetSize()) * HEAD_POSITION;
	VERTEX hit;
	VERTEX bme(me);
	bme.z -= 500;
	
	float best_z = zone->map->FindBestZ(pnode, me, &hit, NULL);
	
	float best_z2 = -999990;
	if(zone->map->LineIntersectsNode(pnode, me, bme, &hit, NULL)) {
		best_z2 = hit.z;
	}
	
	if (best_z != -999999)
	{
		c->Message(0,"Z is %.3f or %.3f at (%.3f, %.3f).", best_z, best_z2, me.x, me.y);
	}
	else
	{
		c->Message(0,"Found no Z.");
	}

	if(zone->watermap == NULL) {
		c->Message(0,"Water Region Map not loaded for this zone");
	} else {
		WaterRegionType RegionType;
		float z;
		
		if(c->GetTarget())  {
			z=c->GetTarget()->GetZ();
			RegionType = zone->watermap->BSPReturnRegionType(1,  c->GetTarget()->GetX(), c->GetTarget()->GetY(), z);
			c->Message(0,"InWater returns %d", zone->watermap->InWater(c->GetTarget()->GetX(), c->GetTarget()->GetY(), z));
			c->Message(0,"InLava returns %d", zone->watermap->InLava(c->GetTarget()->GetX(), c->GetTarget()->GetY(), z));
									 
		}
		else {
			z=c->GetZ();
			RegionType = zone->watermap->BSPReturnRegionType(1, c->GetX(), c->GetY(),z);
			c->Message(0,"InWater returns %d", zone->watermap->InWater(c->GetX(), c->GetY(), z));
					c->Message(0,"InLava returns %d", zone->watermap->InLava(c->GetX(), c->GetY(), z));
	
		}
	
		switch(RegionType) {
			case RegionTypeNormal:	{ c->Message(0,"There is nothing special about the region you are in!"); break; }
			case RegionTypeWater:	{ c->Message(0,"You/your target are in Water."); break; }
			case RegionTypeLava:	{ c->Message(0,"You/your target are in Lava."); break; }
			default:  c->Message(0,"You/your target are in an unknown region type."); 
		}
	}


}


void command_reloadstatic(Client *c, const Seperator *sep) {
	c->Message(0, "Reloading zone static data...");
	zone->ReloadStaticData();
}

void command_flags(Client *c, const Seperator *sep) {
	Client *t = c;
	
	if(c->Admin() >= minStatusToSeeOthersZoneFlags) {
		Mob *tgt = c->GetTarget();
		if(tgt != NULL && tgt->IsClient())
			t = tgt->CastToClient();
	}
	
	t->SendZoneFlagInfo(c);
}

void command_flagedit(Client *c, const Seperator *sep) {
	//super-command for editing zone flags
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;
	if(sep->arg[1][0] == '\0' || !strcasecmp(sep->arg[1], "help")) {
		c->Message(0, "Syntax: #flagedit [lockzone|unlockzone|listzones|give|take].");
		c->Message(0, "...lockzone [zone id/short] [flag name] - Set the specified flag name on the zone, locking the zone");
		c->Message(0, "...unlockzone [zone id/short] - Removes the flag requirement from the specified zone");
		c->Message(0, "...listzones - List all zones which require a flag, and their flag's name");
		c->Message(0, "...give [zone id/short] - Give your target the zone flag for the specified zone.");
		c->Message(0, "...take [zone id/short] - Take the zone flag for the specified zone away from your target");
		c->Message(0, "...Note: use #flags to view flags on a person");
		return;
	}
	
	if(!strcasecmp(sep->arg[1], "lockzone")) {
		uint32 zoneid = 0;
		if(sep->arg[2][0] != '\0') {
			zoneid = atoi(sep->arg[2]);
			if(zoneid < 1) {
				zoneid = database.GetZoneID(sep->arg[2]);
			}
		}
		if(zoneid < 1) {
			c->Message(13, "zone required. see help.");
			return;
		}
		
		char flag_name[128];
		if(sep->argplus[3][0] == '\0') {
			c->Message(13, "flag name required. see help.");
			return;
		}
		database.DoEscapeString(flag_name, sep->argplus[3], 64);
		flag_name[127] = '\0';
		
		if(!database.RunQuery(query, MakeAnyLenString(&query, 
			"UPDATE zone SET flag_needed='%s' WHERE zoneidnumber=%d",
			flag_name, zoneid), errbuf))
		{
			c->Message(13, "Error updating zone: %s", errbuf);
		} else {
			c->LogSQL(query);
			c->Message(15, "Success! Zone %s now requires a flag, named %s", database.GetZoneName(zoneid), flag_name);
		}
		safe_delete(query);
	} else if(!strcasecmp(sep->arg[1], "unlockzone")) {
		uint32 zoneid = 0;
		if(sep->arg[2][0] != '\0') {
			zoneid = atoi(sep->arg[2]);
			if(zoneid < 1) {
				zoneid = database.GetZoneID(sep->arg[2]);
			}
		}
		if(zoneid < 1) {
			c->Message(13, "zone required. see help.");
			return;
		}
		
		if(!database.RunQuery(query, MakeAnyLenString(&query, 
			"UPDATE zone SET flag_needed='' WHERE zoneidnumber=%d",
			zoneid), errbuf))
		{
			c->Message(15, "Error updating zone: %s", errbuf);
		} else {
			c->LogSQL(query);
			c->Message(15, "Success! Zone %s no longer requires a flag.", database.GetZoneName(zoneid));
		}
		safe_delete(query);
	} else if(!strcasecmp(sep->arg[1], "listzones")) {
		MYSQL_RES *result;
		MYSQL_ROW row;
		if (database.RunQuery(query, MakeAnyLenString(&query, 
			"SELECT zoneidnumber,short_name,long_name,flag_needed FROM zone WHERE flag_needed != ''"
			), errbuf, &result))
		{
			c->Message(0, "Zones which require flags:");
			while ((row = mysql_fetch_row(result)))
			{
				c->Message(0, "Zone %s (%s,%s) requires key %s", row[2], row[0], row[1], row[3]);
			}
			mysql_free_result(result);
		} else {
			c->Message(13, "Unable to query zone flags: %s", errbuf);
		}
		safe_delete_array(query);
	} else if(!strcasecmp(sep->arg[1], "give")) {
		uint32 zoneid = 0;
		if(sep->arg[2][0] != '\0') {
			zoneid = atoi(sep->arg[2]);
			if(zoneid < 1) {
				zoneid = database.GetZoneID(sep->arg[2]);
			}
		}
		if(zoneid < 1) {
			c->Message(13, "zone required. see help.");
			return;
		}
		
		Mob *t = c->GetTarget();
		if(t == NULL || !t->IsClient()) {
			c->Message(13, "client target required");
			return;
		}
		
		t->CastToClient()->SetZoneFlag(zoneid);
	} else if(!strcasecmp(sep->arg[1], "give")) {
		uint32 zoneid = 0;
		if(sep->arg[2][0] != '\0') {
			zoneid = atoi(sep->arg[2]);
			if(zoneid < 1) {
				zoneid = database.GetZoneID(sep->arg[2]);
			}
		}
		if(zoneid < 1) {
			c->Message(13, "zone required. see help.");
			return;
		}
		
		Mob *t = c->GetTarget();
		if(t == NULL || !t->IsClient()) {
			c->Message(13, "client target required");
			return;
		}
		
		t->CastToClient()->ClearZoneFlag(zoneid);
	} else {
		c->Message(15, "Invalid action specified. use '#flagedit help' for help");
	}
}

void command_mlog(Client *c, const Seperator *sep) {
	//super-command for managing log settings
	if(sep->arg[1][0] == '\0' || !strcasecmp(sep->arg[1], "help")) {
		c->Message(0, "Syntax: #mlog [subcommand].");
		c->Message(0, "-- Mob Logging Togglers --");
		c->Message(0, "...target [on|off] - Set logging enabled for your target");
		c->Message(0, "...all [on|off] - Set logging enabled for all mobs and clients (prolly a bad idea)");
		c->Message(0, "...mobs [on|off] - Set logging enabled for all mobs");
		c->Message(0, "...clients [on|off] - Set logging enabled for all clients");
		c->Message(0, "...radius [on|off] [radius] - Set logging enable for all mobs and clients within `radius`");
		c->Message(0, "-------------");
		c->Message(0, "-- Log Settings --");
		c->Message(0, "...list [category] - List all log types in specified category, or all categories if none specified.");
		c->Message(0, "...setcat [category] [on|off] - Enable/Disable all types in a specified category");
		c->Message(0, "...set [type] [on|off] - Enable/Disable the specified log type");
		c->Message(0, "...load [filename] - Load log type settings from the file `filename`");
		return;
	}
	bool onoff;
	string on("on");
	string off("off");
	
	if(!strcasecmp(sep->arg[1], "target")) {
		if(on == sep->arg[2]) onoff = true;
		else if(off == sep->arg[2]) onoff = false;
		else { c->Message(13, "Invalid argument. Expected on/off."); return; }
		
		Mob *tgt = c->GetTarget();
		if(tgt == NULL) {
			c->Message(13, "You must have a target for this command.");
			return;
		}
		
		if(onoff)
			tgt->EnableLogging();
		else
			tgt->DisableLogging();
		
		c->Message(0, "Logging has been enabled on %s", tgt->GetName());
	} else if(!strcasecmp(sep->arg[1], "all")) {
		if(on == sep->arg[2]) onoff = true;
		else if(off == sep->arg[2]) onoff = false;
		else { c->Message(13, "Invalid argument '%s'. Expected on/off.", sep->arg[2]); return; }
		
		entity_list.RadialSetLogging(c, onoff, true, true);
		
		c->Message(0, "Logging has been enabled for all entities");
	} else if(!strcasecmp(sep->arg[1], "mobs")) {
		if(on == sep->arg[2]) onoff = true;
		else if(off == sep->arg[2]) onoff = false;
		else { c->Message(13, "Invalid argument '%s'. Expected on/off.", sep->arg[2]); return; }
		
		entity_list.RadialSetLogging(c, onoff, false, true);
		
		c->Message(0, "Logging has been enabled for all mobs");
	} else if(!strcasecmp(sep->arg[1], "clients")) {
		if(on == sep->arg[2]) onoff = true;
		else if(off == sep->arg[2]) onoff = false;
		else { c->Message(13, "Invalid argument '%s'. Expected on/off.", sep->arg[2]); return; }
		
		entity_list.RadialSetLogging(c, onoff, true, false);
		
		c->Message(0, "Logging has been enabled for all clients");
	} else if(!strcasecmp(sep->arg[1], "radius")) {
		if(on == sep->arg[2]) onoff = true;
		else if(off == sep->arg[2]) onoff = false;
		else { c->Message(13, "Invalid argument '%s'. Expected on/off.", sep->arg[2]); return; }
		
		float radius = atof(sep->arg[3]);
		if(radius <= 0) {
			c->Message(13, "Invalid radius %f", radius);
			return;
		}
		
		entity_list.RadialSetLogging(c, onoff, false, true, radius);
		
		c->Message(0, "Logging has been enabled for all entities within %f", radius);
	} else if(!strcasecmp(sep->arg[1], "list")) {
		int r;
		if(sep->arg[2][0] == '\0') {
			c->Message(0, "Listing all log categories:");
			for(r = 0; r < NUMBER_OF_LOG_CATEGORIES; r++) {
				c->Message(0, "Category %d: %s", r, log_category_names[r]);
			}
		} else {
			//first we have to find the category ID.
			for(r = 0; r < NUMBER_OF_LOG_CATEGORIES; r++) {
				if(!strcasecmp(log_category_names[r], sep->arg[2]))
					break;
			}
			if(r == NUMBER_OF_LOG_CATEGORIES) {
				c->Message(13, "Unable to find category '%s'", sep->arg[2]);
				return;
			}
			int logcat = r;
			c->Message(0, "Types for category %d: %s", logcat, log_category_names[logcat]);
			for(r = 0; r < NUMBER_OF_LOG_TYPES; r++) {
				if(log_type_info[r].category != logcat)
					continue;
				c->Message(0, "...%d: %s (%s)", r, log_type_info[r].name, is_log_enabled(LogType(r))?"enabled":"disabled");
			}
		}
	} else if(!strcasecmp(sep->arg[1], "setcat")) {
		if(on == sep->arg[3]) onoff = true;
		else if(off == sep->arg[3]) onoff = false;
		else { c->Message(13, "Invalid argument %s. Expected on/off.", sep->arg[3]); return; }
		
		int r;
		//first we have to find the category ID.
		for(r = 0; r < NUMBER_OF_LOG_CATEGORIES; r++) {
			if(!strcasecmp(log_category_names[r], sep->arg[2]))
				break;
		}
		if(r == NUMBER_OF_LOG_CATEGORIES) {
			c->Message(13, "Unable to find category '%s'", sep->arg[2]);
			return;
		}
		
		LogCategory logcat = LogCategory(r);
		for(r = 0; r < NUMBER_OF_LOG_TYPES; r++) {
			if(log_type_info[r].category != logcat)
				continue;
			
			if(onoff) {
				log_enable(LogType(r));
				c->Message(0, "Log type %s (%d) has been enabled", log_type_info[r].name, r);
			} else {
				log_disable(LogType(r));
				c->Message(0, "Log type %s (%d) has been disabled", log_type_info[r].name, r);
			}
		}
	} else if(!strcasecmp(sep->arg[1], "set")) {
		if(on == sep->arg[3]) onoff = true;
		else if(off == sep->arg[3]) onoff = false;
		else { c->Message(13, "Invalid argument %s. Expected on/off.", sep->arg[3]); return; }
		
		//first we have to find the category ID.
		int r;
		for(r = 0; r < NUMBER_OF_LOG_TYPES; r++) {
			if(!strcasecmp(log_type_info[r].name, sep->arg[2]))
				break;
		}
		if(r == NUMBER_OF_LOG_TYPES) {
			c->Message(13, "Unable to find log type %s", sep->arg[2]);
			return;
		}
		
		if(onoff) {
			log_enable(LogType(r));
			c->Message(0, "Log type %s (%d) has been enabled", log_type_info[r].name, r);
		} else {
			log_disable(LogType(r));
			c->Message(0, "Log type %s (%d) has been disabled", log_type_info[r].name, r);
		}
	} else {
		c->Message(15, "Invalid action specified. use '#mlog help' for help");
	}
}

void command_serverrules(Client *c, const Seperator *sep)
{
	c->SendRules(c);
}

void command_acceptrules(Client *c, const Seperator *sep)
{
	if(!database.GetAgreementFlag(c->AccountID()))
	{
		database.SetAgreementFlag(c->AccountID());
		c->SendAppearancePacket(AT_Anim, ANIM_STAND);
		c->Message(0,"It is recorded you have agreed to the rules.");
	}
}

void command_guildcreate(Client *c, const Seperator *sep)
{
	char founders[3];
	if (database.GetVariable("GuildCreation", founders, 3));
	{
		if(strlen(sep->argplus[1])>4 && strlen(sep->argplus[1])<16)
		{
			guild_mgr.AddGuildApproval(sep->argplus[1],c);
		}
		else
		{
			c->Message(0,"Guild name must be more than 4 characters and less than 16.");
		}
	}
}

void command_guildapprove(Client *c, const Seperator *sep)
{
	guild_mgr.AddMemberApproval(atoi(sep->arg[1]),c);
}

void command_guildlist(Client *c, const Seperator *sep)
{
	GuildApproval* tmp = guild_mgr.FindGuildByIDApproval(atoi(sep->arg[1]));
	if(tmp)
	{
		tmp->ApprovedMembers(c);
	}
	else
		c->Message(0,"Could not find reference id.");
}

void command_hatelist(Client *c, const Seperator *sep) {
	Mob *target = c->GetTarget();
	if(target == NULL) {
		c->Message(0, "Error: you must have a target.");
		return;
	}
	
	c->Message(0, "Display hate list for %s..", target->GetName());
	target->PrintHateListToClient(c);
}


void command_rules(Client *c, const Seperator *sep) {
	//super-command for managing rules settings
	if(sep->arg[1][0] == '\0' || !strcasecmp(sep->arg[1], "help")) {
		c->Message(0, "Syntax: #rules [subcommand].");
		c->Message(0, "-- Rule Set Manipulation  --");
		c->Message(0, "...listsets - List avaliable rule sets");
		c->Message(0, "...current - gives the name of the ruleset currently running in this zone");
		c->Message(0, "...reload - Reload the selected ruleset in this zone");
		c->Message(0, "...switch (ruleset name) - Change the selected ruleset and load it");
		c->Message(0, "...load (ruleset name)  - Load a ruleset in just this zone without changing the selected set");
//too lazy to write this right now:
//		c->Message(0, "...wload (ruleset name) - Load a ruleset in all zones without changing the selected set");
		c->Message(0, "...store [ruleset name]  - Store the running ruleset as the specified name");
		c->Message(0, "---------------------");
		c->Message(0, "-- Running Rule Manipulation  --");
		c->Message(0, "...reset - Reset all rules to their default values");
		c->Message(0, "...set (rule) (value) - Set the specified rule to the specified value locally only");
		c->Message(0, "...setdb (rule) (value) - Set the specified rule to the specified value locally and in the DB");
		c->Message(0, "...list [catname] - List all rules in the specified category (or all categiries if omitted)");
//		c->Message(0, "...values (catname) - List the value of all rules in the specified category");
		return;
	}
	
	if(!strcasecmp(sep->arg[1], "current")) {
		c->Message(0, "Currently running ruleset '%s' (%d)", rules->GetActiveRuleset(), rules->GetActiveRulesetID());
	} else if(!strcasecmp(sep->arg[1], "listsets")) {
		std::map<int, std::string> sets;
		if(!rules->ListRulesets(&database, sets)) {
			c->Message(13, "Failed to list rule sets!");
			return;
		}
		
		c->Message(0, "Avaliable rule sets:");
		std::map<int, std::string>::iterator cur, end;
		cur = sets.begin();
		end = sets.end();
		for(; cur != end; cur++) {
			c->Message(0, "(%d) %s", cur->first, cur->second.c_str());
		}
	} else if(!strcasecmp(sep->arg[1], "reload")) {
		rules->LoadRules(&database, rules->GetActiveRuleset());
		c->Message(0, "The active ruleset (%s (%d)) has been reloaded", rules->GetActiveRuleset(), rules->GetActiveRulesetID());
	} else if(!strcasecmp(sep->arg[1], "switch")) {
		//make sure this is a valid rule set..
		int rsid = rules->GetRulesetID(&database, sep->arg[2]);
		if(rsid < 0) {
			c->Message(13, "Unknown rule set '%s'", sep->arg[2]);
			return;
		}
		if(!database.SetVariable("RuleSet", sep->arg[2])) {
			c->Message(13, "Failed to update variables table to change selected rule set");
			return;
		}
		
		//TODO: we likely want to reload this ruleset everywhere...
		rules->LoadRules(&database, sep->arg[2]);
		
		c->Message(0, "The selected ruleset has been changed to (%s (%d)) and reloaded locally", sep->arg[2], rsid);
	} else if(!strcasecmp(sep->arg[1], "load")) {
		//make sure this is a valid rule set..
		int rsid = rules->GetRulesetID(&database, sep->arg[2]);
		if(rsid < 0) {
			c->Message(13, "Unknown rule set '%s'", sep->arg[2]);
			return;
		}
		rules->LoadRules(&database, sep->arg[2]);
		c->Message(0, "Loaded ruleset '%s' (%d) locally", sep->arg[2], rsid);
	} else if(!strcasecmp(sep->arg[1], "store")) {
		if(sep->argnum == 1) {
			//store current rule set.
			rules->SaveRules(&database);
			c->Message(0, "Rules saved");
		} else if(sep->argnum == 2) {
			rules->SaveRules(&database, sep->arg[2]);
			int prersid = rules->GetActiveRulesetID();
			int rsid = rules->GetRulesetID(&database, sep->arg[2]);
			if(rsid < 0) {
				c->Message(13, "Unable to query ruleset ID after store, it most likely failed.");
			} else {
				c->Message(0, "Stored rules as ruleset '%s' (%d)", sep->arg[2], rsid);
				if(prersid != rsid) {
					c->Message(0, "Rule set %s (%d) is now active in this zone", sep->arg[2], rsid);
				}
			}
		} else {
			c->Message(13, "Invalid argument count, see help.");
			return;
		}
	} else if(!strcasecmp(sep->arg[1], "reset")) {
		rules->ResetRules();
		c->Message(0, "The running ruleset has been set to defaults");
	} else if(!strcasecmp(sep->arg[1], "set")) {
		if(sep->argnum != 3) {
			c->Message(13, "Invalid argument count, see help.");
			return;
		}
		if(!rules->SetRule(sep->arg[2], sep->arg[3])) {
			c->Message(13, "Failed to modify rule");
		} else {
			c->Message(0, "Rule modified locally.");
		}
	} else if(!strcasecmp(sep->arg[1], "setdb")) {
		if(sep->argnum != 3) {
			c->Message(13, "Invalid argument count, see help.");
			return;
		}
		if(!rules->SetRule(sep->arg[2], sep->arg[3], &database, true)) {
			c->Message(13, "Failed to modify rule");
		} else {
			c->Message(0, "Rule modified locally and in the database.");
		}
	} else if(!strcasecmp(sep->arg[1], "list")) {
		if(sep->argnum == 1) {
			std::vector<const char *> rule_list;
			if(!rules->ListCategories(rule_list)) {
				c->Message(13, "Failed to list categories!");
				return;
			}
			c->Message(0, "Rule Categories:");
			std::vector<const char *>::iterator cur, end;
			cur = rule_list.begin();
			end = rule_list.end();
			for(; cur != end; cur++) {
				c->Message(0, " %s", *cur);
			}
		} else if(sep->argnum == 2) {
			const char *catfilt = NULL;
			if(std::string("all") != sep->arg[2])
				catfilt = sep->arg[2];
			std::vector<const char *> rule_list;
			if(!rules->ListRules(catfilt, rule_list)) {
				c->Message(13, "Failed to list rules!");
				return;
			}
			c->Message(0, "Rules in category %s:", sep->arg[2]);
			std::vector<const char *>::iterator cur, end;
			cur = rule_list.begin();
			end = rule_list.end();
			for(; cur != end; cur++) {
				c->Message(0, " %s", *cur);
			}
		} else {
			c->Message(13, "Invalid argument count, see help.");
		}
	} else {
		c->Message(15, "Invalid action specified. use '#rules help' for help");
	}
}


void command_task(Client *c, const Seperator *sep) {
	//super-command for managing tasks
	if(sep->arg[1][0] == '\0' || !strcasecmp(sep->arg[1], "help")) {
		c->Message(0, "Syntax: #task [subcommand].");
		c->Message(0, "-- Task System Commands  --");
		c->Message(0, "...show - List active tasks for a client");
		c->Message(0, "...update <TaskID> <ActivityID> [Count]");
		c->Message(0, "...reloadall - Reload all Task information from the database");
		c->Message(0, "...reload task <TaskID> - Reload Task and Activity informnation for a single task");
		c->Message(0, "...reload lists - Reload goal/reward list information");
		c->Message(0, "...reload prox - Reload proximity information");
		c->Message(0, "...reload sets - Reload task set information");
		return;
	}

	if(!strcasecmp(sep->arg[1], "show")) {
		if(c->GetTarget() && c->GetTarget()->IsClient()) 
			c->GetTarget()->CastToClient()->ShowClientTasks();
		else
			c->ShowClientTasks();

		return;
	}

	if(!strcasecmp(sep->arg[1], "update")) {
		if(sep->argnum>=3) {
			int TaskID = atoi(sep->arg[2]);
			int ActivityID = atoi(sep->arg[3]);
			int Count=1;

			if(sep->argnum>=4) {
				Count = atoi(sep->arg[4]);
				if(Count <= 0)
					Count = 1;
			}
			c->Message(15, "Updating Task %i, Activity %i, Count %i", TaskID, ActivityID, Count);	
			c->UpdateTaskActivity(TaskID, ActivityID, Count);
		}
		return;
	}
	if(!strcasecmp(sep->arg[1], "reloadall")) {
		c->Message(15, "Sending reloadtasks to world");
		worldserver.SendReloadTasks(RELOADTASKS);
		c->Message(15, "Back again");
		return;
	}

	if(!strcasecmp(sep->arg[1], "reload")) {
		if(sep->arg[2][0] != '\0') {
			if(!strcasecmp(sep->arg[2], "lists")) {
				c->Message(15, "Sending reload lists to world");
				worldserver.SendReloadTasks(RELOADTASKGOALLISTS);
				c->Message(15, "Back again");
				return;
			}
			if(!strcasecmp(sep->arg[2], "prox")) {
				c->Message(15, "Sending reload proximities to world");
				worldserver.SendReloadTasks(RELOADTASKPROXIMITIES);
				c->Message(15, "Back again");
				return;
			}
			if(!strcasecmp(sep->arg[2], "sets")) {
				c->Message(15, "Sending reload task sets to world");
				worldserver.SendReloadTasks(RELOADTASKSETS);
				c->Message(15, "Back again");
				return;
			}
			if(!strcasecmp(sep->arg[2], "task") && (sep->arg[3][0] != '\0')) {
				int TaskID = atoi(sep->arg[3]);
				if((TaskID > 0) && (TaskID < MAXTASKS)) {
					c->Message(15, "Sending reload task %i to world");
					worldserver.SendReloadTasks(RELOADTASKS, TaskID);
					c->Message(15, "Back again");
					return;
				}
			}
		}

	}
	c->Message(0, "Unable to interpret command. Type #task help");

}

void command_altactivate(Client *c, const Seperator *sep){
	if(sep->arg[1][0] == '\0'){
		c->Message(10, "Invalid argument, usage:");
		c->Message(10, "#altactivate list - lists the AA ID numbers that are available to you");
		c->Message(10, "#altactivate time [argument] - returns the time left until you can use the AA with the ID that matches the argument.");
		c->Message(10, "#altactivate [argument] - activates the AA with the ID that matches the argument.");
		return;
	}
	if(!strcasecmp(sep->arg[1], "help")){
		c->Message(10, "Usage:");
		c->Message(10, "#altactivate list - lists the AA ID numbers that are available to you");
		c->Message(10, "#altactivate time [argument] - returns the time left until you can use the AA with the ID that matches the argument.");
		c->Message(10, "#altactivate [argument] - activates the AA with the ID that matches the argument.");
		return;
	}
	if(!strcasecmp(sep->arg[1], "list")){
		c->Message(10, "You have access to the following AA Abilities:");
		int x, val;
		SendAA_Struct* saa = NULL;
		for(x = 0; x < aaHighestID; x++){
			if(AA_Actions[x][0].spell_id || AA_Actions[x][0].action){ //if there's an action or spell associated we assume it's a valid
				val = 0;					//and assume if they don't have a value for the first rank then it isn't valid for any rank
				saa = NULL;
				val = c->GetAA(x);
				if(val){
					saa = zone->FindAA(x);
					c->Message(10, "%d: %s %d", x, saa->name, val);
				}
			}	
		}
	}
	else if(!strcasecmp(sep->arg[1], "time")){
		int ability = atoi(sep->arg[2]);
		if(c->GetAA(ability)){
			int remain = c->GetPTimers().GetRemainingTime(pTimerAAStart + ability);
			if(remain)
				c->Message(10, "You may use that ability in %d minutes and %d seconds.", (remain/60), (remain%60));
			else
				c->Message(10, "You may use that ability now.");
		}
		else{
			c->Message(10, "You do not have access to that ability.");
		}
	}
	else
	{
		c->ActivateAA((aaID) atoi(sep->arg[1]));
	}
}

void command_refundaa(Client *c, const Seperator *sep){
	Client* refundee = NULL;
	int curpt = 0;
	bool refunded = false;
	if(c){
		if(c->GetTarget()){
			if(c->GetTarget()->IsClient())
				refundee = c->GetTarget()->CastToClient();
			else
				c->Message(0, "Your target must be a client.");
		}
		else{
			c->Message(0, "You must have a target selected.");
		}

		if(refundee){
			for(int x1=0;x1<aaHighestID;x1++){
				curpt = refundee->GetAA(x1);
				if(curpt > 0){
					SendAA_Struct* curaa = zone->FindAA(x1);
					if(curaa){
						refundee->SetAA(x1, 0);
						for(int x2=0;x2<curpt;x2++){ //add up all the AA points pt by pt to get the correct cost
							refundee->GetPP().aapoints += curaa->cost + (curaa->cost_inc * x2);
							refunded = true;
						}
					}
					else //aa doesn't exist.. but if they bought it then it had at least a cost of 1 point each
					{ //so give back what we can
						refundee->GetPP().aapoints += curpt;
						refundee->SetAA(x1, 0);
						refunded = true;
					}
				}
			}
		}
	}
	if(refunded){
		refundee->Save(); //save of course
		refundee->Kick(); //client gets all buggy if we don't immediatly relog so just force it on them
	}
}

#ifdef EQBOTS

// Franck-add: EQoffline
void command_bot(Client *c, const Seperator *sep) {
	if(sep->arg[1][0] == '\0') {
		c->Message(15, "Bad argument, type #bot help");
		return;
	}
	if(!strcasecmp( sep->arg[1], "help") && !strcasecmp( sep->arg[2], "\0")){
		c->Message(15, "List of commands availables for bots :");
		c->Message(15, "#bot help - show this");
		c->Message(15, "#bot create [name] [class (id)] [race (id)] [model (male/female)] - create a permanent bot. See #bot help create.");
		c->Message(15, "#bot help create - show all the race/class id. (make it easier to create bots)");
		c->Message(15, "#bot delete - completely destroy forever the targeted bot and all its items.");
		c->Message(15, "#bot list - show your bots.");
		c->Message(15, "#bot spawn [botid] - spawn a bot from its ID (use list to see all the bots). ");
        c->Message(15, "#bot group add [target] - make the targetted bot joigning your group.");
		c->Message(15, "#bot group remove [target} - kick the targetted bot from your group (it will die also).");
		c->Message(15, "#bot group order [follow/guard/attack (target)] - Give orders [follow/guard/attack (target)] to your grouped bots.");
		c->Message(15, "#bot inventory list [target] - show the inventory (and the slots IDs) of the targetted bot.");
		c->Message(15, "#bot inventory remove [slotid] [target] - remove the item at the given slot in the inventory of the targetted bot.");
		c->Message(15, "#bot update [target] - you must type that command once you gain a level.");
		c->Message(15, "#bot group summon - It will summon all your grouped bots to you.");
		c->Message(15, "#bot summon - It will summon your targeted bot to you.");
		c->Message(15, "#bot ai mez [target] - If you're grouped with an enchanter, he will mez your target.");
		c->Message(15, "#bot rogue picklock - You must have a targeted rogue bot in your group and be right on the door.");
		c->Message(15, "#bot cure [poison|disease|curse|blindness] - You must have a Cleric in your group.");
		c->Message(15, "#bot bindme - You must have a Cleric in your group to get Bind Affinity cast on you.");
		c->Message(15, "#bot raid [commands] (#bot raid help will show some help).");
		return;
	}

	if(!strcasecmp(sep->arg[1], "create")) {
		if(sep->arg[2][0] == '\0' || sep->arg[3][0] == '\0' || sep->arg[4][0] == '\0' || sep->arg[5][0] == '\0' || sep->arg[6][0] != '\0') {
			c->Message(15, "Usage: #bot create [name] [class(id)] [race(id)] [gender (male/female)]");
			return;
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
		int base_hp = (5)+(1*lm/10) + (((bsta-Post255)*1*lm/3000));

		// save bot to the database
		char errbuf[MYSQL_ERRMSG_SIZE];
		char *query = 0;
		MYSQL_RES *result;
		MYSQL_ROW row;
		const char* lname = "Bot";

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
				else if(database.RunQuery(query, MakeAnyLenString(&query, "INSERT INTO npc_types (name,lastname,level,race,class,bodytype,hp,gender,size,hp_regen_rate,mana_regen_rate,npc_spells_id,npc_faction_id,runspeed,MR,CR,DR,FR,PR,AC,STR,STA,DEX,AGI,_INT,WIS,CHA,isbot,ATK) VALUES ('%s','%s', %i, %i, %i, %i, %i, %i, %f, %i, %i, %i, %i, %f, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i)", botName,lname,1,atoi(sep->arg[4]),atoi(sep->arg[3]),1,base_hp,gender,bsize,10,10,spellid,0,c->GetRunspeed(),MR,CR,DR,FR,PR,bac,bstr,bsta,bdex,bagi,bint,bwis,bcha,1,ATK), errbuf, 0)) {
					if(database.RunQuery(query, MakeAnyLenString(&query, "SELECT MAX(id) from npc_types where name='%s' and isBot=1", sep->arg[2]), errbuf, &result)) {
						if(row = mysql_fetch_row(result)) {
							database.SetBotOwner(atoi(row[0]), c->AccountID());
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
		c->Message(15, "Usage: #bot create [name] [class(1-16)] [race(1-12,128,130,330)] [gender (male/female)]");
		return;
	}

	if(!strcasecmp(sep->arg[1], "delete") ) {
		if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot())
        {
            c->Message(15, "You must target a bot!");
			return;
		}
		else if(database.GetBotOwner(c->GetTarget()->GetNPCTypeID()) != c->AccountID())
        {
            c->Message(15, "You can't delete a bot that you don't own.");
			return;
		}

		if(database.DeleteBot(c->GetTarget()->GetNPCTypeID())) {
			c->GetTarget()->Say("...but why?!! We had such good adventures together! gaahhh...glrrrk...");
			c->GetTarget()->BotOwner = NULL;
			c->GetTarget()->Kill();
			c->Message(15, "Bot successfully deleted!");
		}
		else {
			c->Message(15, "Error deleting Bot!");
		}
	}

	if(!strcasecmp(sep->arg[1], "list") ){
		
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

				if((database.GetBotOwner(atoi(row[0])) == c->CharacterID()) || (database.GetBotOwner(atoi(row[0])) == c->AccountID()))
					c->Message(15,"(YOUR BOT) ID: %s -- Name: %s -- Class: %s -- Race: %s -- ", row[0], row[1], crow, rrrow);
			}				
		}
		mysql_free_result(result);
		safe_delete_array(query);
		return;
	}

	if(!strcasecmp(sep->arg[1], "spawn") ){
		if(database.GetBotOwner(atoi(sep->arg[2])) == 0)
        {
			database.SetBotOwner(atoi(sep->arg[2]), c->AccountID());
		}
		else if(database.GetBotOwner(atoi(sep->arg[2])) == c->CharacterID())
		{
			database.UpdateBotOwner(c->AccountID(), c->CharacterID());
		}
		else if(database.GetBotOwner(atoi(sep->arg[2])) != c->AccountID())
        {
            c->Message(15,"You can't spawn a bot that you don't own.");
			return;
		}

		if(c->IsEngaged() || c->GetFeigned())
        {
            c->Message(15, "You can't summon bots while you are engaged or feigned.");
			return;
		}
		if(c->IsGrouped())
        {
			Group *g = entity_list.GetGroupByClient(c);
			for (int i=0; i<MAX_GROUP_MEMBERS; i++)
            {
                if(g && g->members[i] && g->members[i]->IsEngaged())
                {
                    c->Message(15, "You can't summon bots while you are engaged.");
					return;
				}
			}
		}
		
		const NPCType* tmp = 0;
		if ((tmp = database.GetNPCType(atoi(sep->arg[2]))))
        {
			Mob *mtmp = entity_list.GetMobByNpcTypeID(atoi(sep->arg[2]));
			if(mtmp && entity_list.IsMobInZone(mtmp))
            {
				c->Message(15, "This bot is already in the zone.");
				return;
			}

			NPC* npc = new NPC(tmp, 0, c->GetX(), c->GetY(), c->GetZ(), c->GetHeading());

			// As the mob is in the DB, we need to calc its level, HP, Mana.
			// First, the mob must have the same level as his leader
			npc->SetLevel(c->GetLevel());
			npc->CastToMob()->SetBotRaiding(false);
			entity_list.AddNPC(npc);
			npc->CastToMob()->Say("I am ready for battle.");
		}
		else {
            c->Message(15, "BotID: %i not found", atoi(sep->arg[2]));
        }
        return;
    }

	if(!strcasecmp(sep->arg[1], "rogue") && !strcasecmp(sep->arg[2], "picklock")) {
		if((c->GetTarget() == NULL) || (c->GetTarget() == c) || !c->GetTarget()->IsBot() || (c->GetTarget()->GetClass() != ROGUE)) {
            c->Message(15, "You must target a rogue bot!");
			return;
		}
		entity_list.OpenDoorsNear(c->GetTarget()->CastToNPC());
	}

	if(!strcasecmp(sep->arg[1], "summon")) {
		if((c->GetTarget() == NULL) || (c->GetTarget() == c) || !c->GetTarget()->IsBot() || c->GetTarget()->IsPet())
        {
            c->Message(15, "You must target a bot!");
			return;
		}
		if(c->GetTarget()->IsMob() && !c->GetTarget()->IsPet())
        {
            Mob *b = c->GetTarget();

			// Is our target "botable" ?
			if(b && !b->IsBot()){
				c->Message(15, "You must target a bot!");
				return;
			}
			if(b && (database.GetBotOwner(b->GetNPCTypeID()) != c->CharacterID()) && (database.GetBotOwner(b->GetNPCTypeID()) != c->AccountID()))
			{
				b->Say("You can only summon your own bots.");
				return;
			}
			if(b) {
				b->Warp(c->GetX(), c->GetY(), c->GetZ());
			}
		}
	}

	if(!strcasecmp(sep->arg[1], "group") && !strcasecmp(sep->arg[2], "add"))
    {
		if(c->IsEngaged() || c->GetFeigned()) {
            c->Message(15, "You cannot create bot groups while engaged or feigned!");
			return;
		}

		if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot())
        {
            c->Message(15, "You must target a bot!");
			return;
		}

		if(c->GetTarget()->IsClient())
        {
			c->Message(15, "You can't invite clients this way.");
			return;
		}

		if ( c->IsGrouped() )
        {
            Group *g = entity_list.GetGroupByClient(c);
			if(g && (g->BotGroupCount() > 5))
            {
                c->Message(15, "There is no more room in your group.");
				Mob* kmob = c->GetTarget();
				if(kmob != NULL) {
					kmob->BotOwner = NULL;
					kmob->Kill();
				}
				return;
			}
		}

		if(c->IsGrouped()) {
            Group *g = entity_list.GetGroupByClient(c);
			if(g && (c->CastToMob() != g->members[0])) {
				c->Message(15, "Only the group leader can invite bots.");
				Mob* kmob = c->GetTarget();
				if(kmob != NULL) {
					kmob->BotOwner = NULL;
					kmob->Kill();
				}
				return;
			}
		}

		if(c->GetTarget()->IsMob() && !c->GetTarget()->IsPet())
        {
            Mob *b = c->GetTarget();

			// Is our target "botable" ?
			if(b && !b->IsBot()){
				b->Say("I can't be a bot!");
				return;
			}

			if((database.GetBotOwner(b->GetNPCTypeID()) != c->CharacterID()) && (database.GetBotOwner(b->GetNPCTypeID()) != c->AccountID()))
            {
                b->Say("I can't be your bot, you are not my owner.");
				return;
			}

			// Is he already grouped ?
			if(b->IsGrouped())
            {
                b->Say("I'm already grouped!");
				return;
			}

			// else, we do:
			//1: Set its leader
			b->Say("I'm becoming %s\'s bot!", c->GetName());
			database.SetBotLeader(b->GetID(), c->GetID());
		
			//2: Set the follow ID so he's following its leader
			b->SetFollowID(c->GetID());
			b->BotOwner = c->CastToMob();
			b->SetOwnerID(0);
			c->CastToMob()->SetOwnerID(0);
			
			//3:  invite it to the group
			if(!c->IsGrouped()) {
				Group *g = new Group(c->CastToMob());
				g->AddMember(b);
				entity_list.AddGroup(g);
			}
			else {
				c->GetGroup()->AddMember(b);
			}

			if(c->IsBotRaiding()) {
				b->SetBotRaiding(true);
				b->SetBotRaidID(c->CastToMob()->GetBotRaidID());
			}

			int itemID = 0;
			const Item_Struct* item2 = NULL;
			for(int i=0; i<22; i++) {
				itemID = database.GetBotItemBySlot(b->GetNPCTypeID(), i);
				if(itemID != 0) {
					item2 = database.GetItem(itemID);
					switch(i) {
						case 0:
						case 1:
						case 3:
						case 4:
						case 5:
						case 6:
						case 8:
						case 11:
						case 15:
						case 16:
						case 20:
						case 21:
							b->CastToNPC()->AddLootDrop(item2, &b->CastToNPC()->itemlist, 1, true, false);
							break;
						case 2:
						case 7:
						case 9:
						case 10:
						case 12:
						case 13:
						case 14:
						case 17:
						case 18:
						case 19:
							b->CastToNPC()->AddLootDrop(item2, &b->CastToNPC()->itemlist, 1, true, true);
							break;
					}
				}
			}
			b->CalcBotStats();
		}
		return;
	}

	if(!strcasecmp(sep->arg[1], "group") && !strcasecmp(sep->arg[2], "remove")) {
        if(c->GetTarget() != NULL) {
            if(c->IsGrouped() && c->GetTarget()->IsBot() && c->GetTarget()->IsGrouped() && (c->GetGroup() == entity_list.GetGroupByMob(c->GetTarget()))) {
				int16 botID = c->GetTarget()->GetID();
				c->GetTarget()->Say("Bot Deactivated");
				c->GetTarget()->BotOwner = NULL;
				c->GetTarget()->Kill();
			}
            else {
                c->Message(15, "You must target a bot first.");
            }
        }
        else {
            c->Message(15, "You must target a bot first.");
        }
		return;
	}

    if(!strcasecmp(sep->arg[1], "group") && !strcasecmp(sep->arg[2], "order"))
    {
		if(!strcasecmp(sep->arg[3], "follow"))
        {
			if(c->IsBotRaiding()) {
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
				br->FollowGuardCmd(c, false);
			}
			else if(c->IsGrouped())
            {
				Group *g = c->GetGroup();
				if(g) {
					int32 botfollowid = 0;
					const char* botfollowname;
					for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
						if(g->members[i] && g->members[i]->IsBot()) {
							if(botfollowid == 0) {
								botfollowid = g->members[i]->GetID();
								botfollowname = g->members[i]->GetCleanName();
								g->members[i]->SetFollowID(c->GetID());
								g->members[i]->Say("Following %s.", c->GetName());
							}
							else {
								g->members[i]->SetFollowID(botfollowid);
							}
							g->members[i]->WhipeHateList();
							g->members[i]->Say("Following %s.", botfollowname);
						}
					}
				}
			}
		}
		else if(!strcasecmp(sep->arg[3], "guard"))
        {
			if(c->IsBotRaiding()) {
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
				br->FollowGuardCmd(c, true);
			}
			else if(c->IsGrouped())
            {
				Group *g = c->GetGroup();
				if(g) {
					for(int i=0; i<MAX_GROUP_MEMBERS; i++)
					{
						if(g->members[i] && g->members[i]->IsBot()) {
                            g->members[i]->SetFollowID(0);
							g->members[i]->WhipeHateList();
							g->members[i]->Say("Guarding here.");
						}
					}
				}
			}
		}
		else if(!strcasecmp(sep->arg[3], "attack"))
        {
			if((c->GetTarget() != c->CastToMob()) && c->IsGrouped() && (c->GetTarget() != NULL) && c->IsAttackAllowed(c->GetTarget()))
            {
				Group *g = c->GetGroup();
				if(g) {
					for(int i=0; i<MAX_GROUP_MEMBERS; i++)
					{
						if(g->members[i] && g->members[i]->IsBot()) {
							g->members[i]->WhipeHateList();
							g->members[i]->Say("Attacking %s.", c->GetTarget()->GetCleanName());
                            g->members[i]->AddToHateList(c->GetTarget(),150,150);
						}
					}
				}
			}
            else {
                c->Message(15, "You must target a monster.");
            }
        }
        return;
	}

    if(!strcasecmp(sep->arg[1], "inventory") && !strcasecmp(sep->arg[2], "list"))
    {
        if(c->GetTarget() != NULL)
        {
            if(c->GetTarget()->IsBot() && (c->GetTarget()->BotOwner == c->CastToMob()))
            {
                Mob* b = c->GetTarget();	
                int x = database.GetBotItemsNumber(b->GetNPCTypeID() );
                for(int i=0; i<22 ; i++)
                {
                    if(database.GetBotItemBySlot(b->GetNPCTypeID(), i) == 0)
                    {
                        c->Message(15, "No item in the slot = %i",i);
                        continue;
                    }
                    if(database.GetBotItemBySlot(b->GetNPCTypeID(),i) != 0 && i != 8 && i != 14) {
                        const Item_Struct* item2 = database.GetItem(database.GetBotItemBySlot(b->GetNPCTypeID(), i));
                        c->Message(15, "Equiped Item %s in the slot %i \n.",item2->Name ,i);
                    }
                    if(database.GetBotItemBySlot(b->GetNPCTypeID(), i) != 0 && i == 8) {
                        const Item_Struct* item2 = database.GetItem(database.GetBotItemBySlot(b->GetNPCTypeID(), i));
                        c->Message(15, "Equiped Item %s in the slot %i \n.",item2->Name ,i);
                    }
                    if ( database.GetBotItemBySlot(b->GetNPCTypeID(),i) != 0 && i == 14) {
                        const Item_Struct* item2 = database.GetItem( database.GetBotItemBySlot(b->GetNPCTypeID(),i) );
                        c->Message(15, "Equiped Item %s in the slot %i \n.", item2->Name ,i);
                    }
                }
            }
            else {
                c->Message(15, "You must target a bot first.");
            }
        }
        else {
            c->Message(15, "You must target a bot first.");
        }
		return;
	}
	
	if(!strcasecmp(sep->arg[1], "inventory") && !strcasecmp(sep->arg[2], "remove")) {
        if((c->GetTarget() == NULL) || (sep->arg[3] == '\0') || !c->GetTarget()->IsBot())
        {
			c->Message(15, "Usage: #bot inventory remove [slotid] (You must have a bot targetted) ");
			return;
		}		
		else if(c->GetTarget()->IsBot() && (c->GetTarget()->BotOwner == c->CastToMob()))
        {
			int sid = atoi(sep->arg[3]);
			if(sid > 21 || sid < 0) {
				c->Message(15, "A bot has 21 slots in its invent, please choose a slot between 0 and 21. (#bot inventory list [target])");
				return;
			}
			if(database.GetBotItemBySlot(c->GetTarget()->GetNPCTypeID(), sid) != NULL)
            {
                const Item_Struct *itm = database.GetItem(database.GetBotItemBySlot(c->GetTarget()->GetNPCTypeID(), sid));
				const ItemInst* itminst = new ItemInst(itm,0);
				c->PushItemOnCursor(*itminst,true);
                Mob *gearbot = c->GetTarget();
				for(int i=0; i<9; i++)
                {
                    if(gearbot->GetEquipment(i) == database.GetBotItemBySlot(gearbot->GetNPCTypeID(), sid))
                    {
                        gearbot->CastToNPC()->RemoveItem(gearbot->GetEquipment(i));
                        gearbot->CastToNPC()->BotRemoveEquipItem(i);
                        break;
					}
				}
				database.RemoveBotItemBySlot(gearbot->GetNPCTypeID(), sid);
				gearbot->CalcBotStats();
				gearbot->Say("My slot %i is now free, %s.",sid, c->GetName());
			}
			else {
				c->GetTarget()->Say("The slot %i is already free.",sid);
			}
		}
		return;
	}

	if(!strcasecmp(sep->arg[1], "update")) {
        // Congdar: add IsEngaged check for exploit to keep bots alive by repeatedly using #bot update.
        if(c->GetTarget() != NULL)
        {
			if(c->GetTarget()->IsBot() && (c->GetLevel() <= c->GetTarget()->GetLevel())) {
					c->Message(15, "This bot has already been updated.");
					return;
			}
			if(c->GetTarget()->IsBot() && (c->GetTarget()->BotOwner == c->CastToMob()) && !c->GetTarget()->IsEngaged() && !c->GetFeigned()) {
                Mob *bot = c->GetTarget();
                bot->SetLevel(c->GetLevel());
				bot->CalcBotStats();
            }
            else {
				if(c->GetTarget()->IsEngaged() || c->GetFeigned()) {
					c->Message(15, "You cannot update while engaged or feigned.");
				}
				else {
					c->Message(15, "You must target a bot first");
				}
            }
        }
        else {
			c->Message(15, "You must target a bot first");
        }
        return;
	}

	if(!strcasecmp(sep->arg[1], "group") && !strcasecmp(sep->arg[2], "summon") ) {
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
					if(g->members[i] && g->members[i]->IsBot())
					{
						g->members[i]->GMMove(c->GetX(), c->GetY(), c->GetZ());
						if(g->members[i]->HasPet()) {
							g->members[i]->GetPet()->GMMove(c->GetX(), c->GetY(), c->GetZ());
						}
					}
				}
			}
		}
        return;
	}

	if(!strcasecmp(sep->arg[1], "bindme")) {
		Mob *binder = NULL;
		bool hasbinder = false;
		if(c->IsGrouped())
		{
			Group *g = c->GetGroup();
			if(g) {
				for(int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					if(g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == CLERIC))
					{
						hasbinder = true;
						binder = g->members[i];
					}
				}
				if(!hasbinder) {
					c->Message(15, "You must have a Cleric in your group.");
				}
			}
		}
		if(hasbinder) {
			binder->Say("Attempting to bind you %s.", c->GetName());
			binder->CastToNPC()->CastSpell(35, c->GetID(), 1, -1, -1);
		}
	}
	
	if(!strcasecmp(sep->arg[1], "cure")) {
		Mob *curer = NULL;
		bool hascurer = false;
		if(c->IsGrouped())
		{
			Group *g = c->GetGroup();
			if(g) {
				for(int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					if(g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == CLERIC))
					{
						hascurer = true;
						curer = g->members[i];
					}
				}
				if(!hascurer) {
					c->Message(15, "You must have a Cleric in your group.");
				}
			}
		}
		if(hascurer) {
			if(!strcasecmp(sep->arg[2], "poison")) {
				curer->Say("Trying to cure us of %s.", sep->arg[2]);
				curer->CastToNPC()->Bot_Command_Cure(1, curer->GetLevel());
			}
			else if(!strcasecmp(sep->arg[2], "disease")) {
				curer->Say("Trying to cure us of %s.", sep->arg[2]);
				curer->CastToNPC()->Bot_Command_Cure(2, curer->GetLevel());
			}
			else if(!strcasecmp(sep->arg[2], "curse")) {
				curer->Say("Trying to cure us of %s.", sep->arg[2]);
				curer->CastToNPC()->Bot_Command_Cure(3, curer->GetLevel());
			}
			else if(!strcasecmp(sep->arg[2], "blindness")) {
				curer->Say("Trying to cure us of %s.", sep->arg[2]);
				curer->CastToNPC()->Bot_Command_Cure(4, curer->GetLevel());
			}
		}
		return;
	}

	if(!strcasecmp(sep->arg[1], "ai") && !strcasecmp(sep->arg[2], "mez"))
    {
		Mob *target = c->GetTarget();
        if(target == NULL || target == c || target->IsBot() || target->IsPet() && target->GetOwner()->IsBot())
        {
            c->Message(15, "You must select a monster");
            return;
        }
		
		if(c->IsGrouped())
        {
			bool hasmezzer = false;
			Group *g = c->GetGroup();
			for(int i=0; i<MAX_GROUP_MEMBERS; i++)
            {
				if(g && g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == ENCHANTER))
                {
					hasmezzer = true;
					Mob *mezzer = g->members[i];
                    mezzer->Say("Trying to mez %s \n", target->GetCleanName());
					mezzer->CastToNPC()->Bot_Command_MezzTarget(target);
				}
			}
			if(!hasmezzer) {
				c->Message(15, "You must have an Enchanter in your group.");
			}
		}
        return;
	}
	
	// debug commands
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
		if(target->HasPet())
			c->Message(15, "I've a pet and its name is %s", target->GetPet()->GetName() );
        return;
	}

	if(!strcasecmp(sep->arg[1], "debug") && !strcasecmp(sep->arg[2], "spells"))
    {
		Mob *target = c->GetTarget();
		if(target && target->IsBot())
        {
            for(int i=0; i<16; i++)
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

	// EQoffline - Raids
	if(!strcasecmp(sep->arg[1], "raid") && !strcasecmp(sep->arg[2], "help"))
    {
		c->Message(15, "#bot raid help - will show this help");
		c->Message(15, "#bot raid info - will give info of your raid.");
		c->Message(15, "#bot raid create - will create your raid (you will be the raid leader)");
		c->Message(15, "#bot raid group create [target] - create a group. Your target will be the leader.");
		c->Message(15, "#bot raid invite bot [target] [group leader's name000] - Invite your target into your target leader000's group.");	
//		c->Message(15, "#bot raid remove group [group leader's name] - Remove target's group from your raid.");
		c->Message(15, "#bot raid disband - Disband the raid.");
		c->Message(15, "#bot raid order maintank [target] - Your target will be flagged as the main tank.");
		c->Message(15, "#bot raid order secondtank [target] - Your target will be flagged as the second tank.");
		c->Message(15, "#bot raid order maintarget [target] - Your target will be flagged as the main raid's target.");
		c->Message(15, "#bot raid order secondtarget [target] - Your target will be flagged as the second raid's target.");
		c->Message(15, "#bot raid order grouptarget [group leader's name] [target] - Your target will be flagged as the target of a specific group.");
		c->Message(15, "#bot raid order task [attack/guard] [group leader's name] - You will give a specific task [attack/guard].");
		c->Message(15, "#bot raid order task [follow/assist] [group1 leader's name] [group2 leader's name] - Group 1 will [follow/assist] Group 2.");
		c->Message(15, "#bot raid order task enraged - Tell your raid to stop attacking to defend against ENRAGED mobs.");
        return;
	}

	if(!strcasecmp(sep->arg[1], "raid"))
    {

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
						}
					}
					br->AddBotGroup(g);
				}
			}
            return;
		}

		else if(!strcasecmp(sep->arg[2], "group") && !strcasecmp(sep->arg[3], "create"))
        {
			if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot() || c->IsEngaged() || c->GetFeigned()) {
				return;
			}

			if(!c->CastToMob()->IsBotRaiding() && c->GetTarget()->IsBot())
            {
				c->Message(15, "You must have created your raid and your group must be full before doing that!");
				Mob* kmob = c->GetTarget();
				if(kmob != NULL) {
					kmob->BotOwner = NULL;
					kmob->Kill();
				}
				return;
			}

			if((database.GetBotOwner(c->GetTarget()->GetNPCTypeID()) != c->CharacterID()) && (database.GetBotOwner(c->GetTarget()->GetNPCTypeID()) != c->AccountID()))
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
						kmob->Kill();
					}
					return;
				}

				Mob *gleader = c->GetTarget();
				database.SetBotLeader(gleader->GetID(), c->GetID());
				gleader->SetFollowID(c->GetID());
				gleader->BotOwner = c->CastToMob();
				gleader->SetOwnerID(0);
				gleader->SetBotRaidID(br->GetBotRaidID());
				gleader->SetBotRaiding(true);

				Group *g = new Group(gleader);
				entity_list.AddGroup(g);
				br->AddBotGroup(g);

				// load up leaders gear
				int itemID = 0;
				const Item_Struct* item2 = NULL;
				for(int i=0; i<22; i++) {
					itemID = database.GetBotItemBySlot(gleader->GetNPCTypeID(), i);
					if(itemID != 0) {
						item2 = database.GetItem(itemID);
						switch(i) {
							case 0:
							case 1:
							case 3:
							case 4:
							case 5:
							case 6:
							case 8:
							case 11:
							case 15:
							case 16:
							case 20:
							case 21:
								gleader->CastToNPC()->AddLootDrop(item2, &gleader->CastToNPC()->itemlist, 1, true, false);
								break;
							case 2:
							case 7:
							case 9:
							case 10:
							case 12:
							case 13:
							case 14:
							case 17:
							case 18:
							case 19:
								gleader->CastToNPC()->AddLootDrop(item2, &gleader->CastToNPC()->itemlist, 1, true, true);
								break;
						}
					}
				}
				gleader->CalcBotStats();
				c->Message(15, "-- RAID -- Group Leader is: %s\n", gleader->GetCleanName());
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

			if((database.GetBotOwner(c->GetTarget()->GetNPCTypeID()) != c->CharacterID()) && (database.GetBotOwner(c->GetTarget()->GetNPCTypeID()) != c->AccountID()))
            {
                c->GetTarget()->Say("I join your bot raid, you are not my owner.");
				return;
			}

			Mob* sictar = entity_list.GetMob(sep->argplus[4]);
			if(!sictar || !sictar->IsGrouped() || entity_list.GetGroupByMob(sictar) == NULL || entity_list.GetGroupByMob(sictar)->GetLeader() != sictar)
            {
				c->Message(15, "You didn't type the correct group leader name.");
				Mob* kmob = c->GetTarget();
				if(kmob != NULL) {
					kmob->BotOwner = NULL;
					kmob->Kill();
				}
				return;
			}

			if(c->GetTarget()->IsGrouped()) {
                c->Message(15, "You must target an ungrouped bot first.");
				Mob* kmob = c->GetTarget();
				if(kmob != NULL) {
					kmob->BotOwner = NULL;
					kmob->Kill();
				}
                return;
            }                
			else {
                Mob *inv = c->GetTarget();
				
				Group *g = entity_list.GetGroupByMob(sictar);
				if(g && (g->BotGroupCount() > 5)) {
					inv->Say("I can't get into the group, it's full already.");
					inv->BotOwner = NULL;
					inv->Kill();
					return;
				}
				if(g && (g->BotGroupCount() < 6))
                {
					database.SetBotLeader(inv->GetID(), c->GetID());
					inv->SetFollowID(sictar->GetID());
					inv->BotOwner = c->CastToMob();
					inv->SetOwnerID(0);
                    g->AddMember(inv);
					inv->SetBotRaiding(true);
					inv->SetBotRaidID(sictar->GetBotRaidID());

					// Equip newly raid grouped bot
					int itemID = 0;
					const Item_Struct* item2 = NULL;
					for(int i=0; i<22; i++) {
						itemID = database.GetBotItemBySlot(inv->GetNPCTypeID(), i);
						if(itemID != 0) {
							item2 = database.GetItem(itemID);
							switch(i) {
								case 0:
								case 1:
								case 3:
								case 4:
								case 5:
								case 6:
								case 8:
								case 11:
								case 15:
								case 16:
								case 20:
								case 21:
									inv->CastToNPC()->AddLootDrop(item2, &inv->CastToNPC()->itemlist, 1, true, false);
									break;
								case 2:
								case 7:
								case 9:
								case 10:
								case 12:
								case 13:
								case 14:
								case 17:
								case 18:
								case 19:
									inv->CastToNPC()->AddLootDrop(item2, &inv->CastToNPC()->itemlist, 1, true, true);
									break;
							}
						}
					}
					inv->CalcBotStats();
					inv->Say("I have joined %s's raid group.", g->GetLeader()->GetCleanName());
				}
				else
					inv->Say("I can't join the group (You didn't enter the group leader's name or the group is full already. Type #bot raid info\n");
			}
            return;
		}

/*		else if(!strcasecmp(sep->arg[2], "remove") && !strcasecmp(sep->arg[3], "group")) {
            // Congdar: rewrote due to zone crashing on me
            if(entity_list.GetRaidByMob(c->CastToMob()) == NULL ) {
				return;
            }
			else {
				BotRaids *mybr = entity_list.GetRaidByMob(c->CastToMob());
                Group *mygtr = entity_list.GetGroupByLeaderName(sep->arg[4]);
                if(mybr && mygtr) {
                    if(strcmp(mybr->GetLeader()->GetName(), mygtr->GetLeaderName()) == 0) {
                        c->Message(15, "All bot groups are disbanded, use #bot raid disband\n");
                    }
                    else {
                        mybr->RemoveGroup(mygtr);
                    }
                }
			}
            return;
		}
*/
		else if(!strcasecmp(sep->arg[2], "disband"))
        {
			if(c->IsBotRaiding()) {
				int16 cmid = c->GetID();
				BotRaids *brd = entity_list.GetBotRaidByMob(c->CastToMob());
				if(brd) {
					brd->RemoveRaidBots();
					brd = NULL;
				}
				if(c->IsGrouped()) {
					Group *g = entity_list.GetGroupByMob(c->CastToMob());
					if(g) {
						bool hasBots = false;
						for(int i=5; i>=0; i--) {
							if(g->members[i] && g->members[i]->IsBot()) {
								hasBots = true;
								g->members[i]->BotOwner = NULL;
								g->members[i]->Kill();
							}
						}
						if(hasBots) {
							hasBots = false;
							if(g->BotGroupCount() <= 1) {
								g->DisbandGroup();
							}
						}
					}
				}
				database.CleanBotLeader(cmid);
				c->Message(15, "Raid disbanded.");
			}
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
					if( c->GetTarget() == NULL || !c->GetTarget()->IsAttackAllowed(c) || brc == NULL)
						return;
					else{
						brc->SetBotMainTarget(c->GetTarget());
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
							brc->GroupAssignTask(entity_list.GetGroupByLeaderName(sep->arg[5]), 2, ctarget);
						}
						else {
							c->Message(15, "You must target a monster.");
						}
					}
					else if(!strcasecmp(sep->arg[4], "guard"))
					{
						Mob *ctarget = NULL;
						brc->GroupAssignTask(entity_list.GetGroupByLeaderName(sep->arg[5]), 4, ctarget);
					}
					else if(!strcasecmp(sep->arg[4], "assist"))
					{
						brc->GroupAssignTask(entity_list.GetGroupByLeaderName(sep->arg[5]), 3, entity_list.GetGroupByLeaderName(sep->arg[6]));
					}				
					else if(!strcasecmp(sep->arg[4], "follow"))
					{
						brc->GroupAssignTask(entity_list.GetGroupByLeaderName(sep->arg[5]), 1, entity_list.GetGroupByLeaderName(sep->arg[6]));
					}
					else if(!strcasecmp(sep->arg[4], "enraged")) {
						brc->RaidDefendEnraged();
					}
				}
			}
		}
	}	
}

#endif //EQBOTS

void command_traindisc(Client *c, const Seperator *sep)
{
	int level;
	int16 book_slot;
	int16 curspell;
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient() && c->GetGM())
		t=c->GetTarget()->CastToClient();

	if(!sep->arg[1][0])
	{
		c->Message(0, "FORMAT: #traindisc <level>");
		return;
	}

	level = atoi(sep->arg[1]);

	if(level < 1 || level > 70)
	{
		c->Message(0, "ERROR: Enter a level between 1 and 70 inclusive.");
		return;
	}

	t->Message(0, "Training disciplines");
	if(t != c)
		c->Message(0, "Training disciplines for %s.", t->GetName());
	LogFile->write(EQEMuLog::Normal, "Train disciplines request for %s from %s, level: %d", t->GetName(), c->GetName(), level);

	for(curspell = 0, book_slot = 0; curspell < SPDAT_RECORDS && book_slot < MAX_PP_SPELLBOOK; curspell++)
	{
		if
		(
			spells[curspell].classes[WARRIOR] != 0 && // check if spell exists
			spells[curspell].classes[t->GetPP().class_-1] <= level && 
			spells[curspell].skill != 52
		)
		{
			if(IsDiscipline(curspell)){
				for(int r = 0; r < MAX_PP_DISCIPLINES; r++) {
					if(t->GetPP().disciplines.values[r] == curspell) {
						t->Message(13, "You already know this discipline.");
						r = MAX_PP_DISCIPLINES;
					} else if(t->GetPP().disciplines.values[r] == 0) {
						t->GetPP().disciplines.values[r] = curspell;
						t->SendDisciplineUpdate();
						t->Message(0, "You have learned a new discipline!");
						r = MAX_PP_DISCIPLINES;
					}
				}
			}
		}
	}
}

void command_setgraveyard(Client *c, const Seperator *sep)
{
	int32 zoneid = 0;
	int32 graveyard_id = 0;
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient() && c->GetGM())
		t=c->GetTarget()->CastToClient();

	if(!sep->arg[1][0]) {
		c->Message(0, "Usage: #setgraveyard [zonename]");
		return;
	}
	
	zoneid = database.GetZoneID(sep->arg[1]);

	if(zoneid > 0) {
		graveyard_id = database.NewGraveyardRecord(zoneid, t->GetX(), t->GetY(), t->GetZ(), t->GetHeading());

		if(graveyard_id > 0) {
			c->Message(0, "Successfuly added a new record for this graveyard!");
			if(database.AddGraveyardIDToZone(zoneid, graveyard_id) > 0) {
				c->Message(0, "Successfuly added this new graveyard for the zone %s.", sep->arg[1]);
				// TODO: Set graveyard data to the running zone process.
				c->Message(0, "Done!");
			}
			else
				c->Message(0, "Unable to add this new graveyard to the zone %s.", sep->arg[1]);
		}
		else {
			c->Message(0, "Unable to create a new graveyard record in the database.");
		}
	}
	else {
		c->Message(0, "Unable to retrieve a ZoneID for the zone: %s", sep->arg[1]);
	}

	return;
}

void command_deletegraveyard(Client *c, const Seperator *sep)
{
	int32 zoneid = 0;
	int32 graveyard_id = 0;
	
	if(!sep->arg[1][0]) {
		c->Message(0, "Usage: #deletegraveyard [zonename]");
		return;
	}

	zoneid = database.GetZoneID(sep->arg[1]);
	graveyard_id = database.GetZoneGraveyardID(zoneid);
	
	if(zoneid > 0 & graveyard_id > 0) {
		if(database.DeleteGraveyard(zoneid, graveyard_id))
			c->Message(0, "Successfuly deleted graveyard %u for zone %s.", graveyard_id, sep->arg[1]);
		else
			c->Message(0, "Unable to delete graveyard %u for zone %s.", graveyard_id, sep->arg[1]);
	}
	else {
		if(zoneid <= 0)
			c->Message(0, "Unable to retrieve a ZoneID for the zone: %s", sep->arg[1]);
		else if(graveyard_id <= 0)
			c->Message(0, "Unable to retrieve a valid GraveyardID for the zone: %s", sep->arg[1]);
	}

	return;
}

void command_summonburriedplayercorpse(Client *c, const Seperator *sep)
{
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient() && c->GetGM())
		t = c->GetTarget()->CastToClient();
	else {
		c->Message(0, "You must first select a target!");
		return;
	}
	
	Corpse* PlayerCorpse = database.SummonBurriedPlayerCorpse(t->CharacterID(), t->GetZoneID(), t->GetX(), t->GetY(), t->GetZ(), t->GetHeading());

	if(PlayerCorpse)
		PlayerCorpse->Spawn();
	else
		c->Message(0, "Your target doesn't have any burried corpses.");

	return;
}

void command_getplayerburriedcorpsecount(Client *c, const Seperator *sep)
{
	Client *t=c;

	if(c->GetTarget() && c->GetTarget()->IsClient() && c->GetGM())
		t = c->GetTarget()->CastToClient();
	else {
		c->Message(0, "You must first select a target!");
		return;
	}
	
	int32 CorpseCount = database.GetPlayerBurriedCorpseCount(t->CharacterID());

	if(CorpseCount > 0)
		c->Message(0, "Your target has a total of %u burried corpses.", CorpseCount);
	else
		c->Message(0, "Your target doesn't have any burried corpses.");

	return;
}

void command_refreshgroup(Client *c, const Seperator *sep)
{
	if(!c)
		return;

	Group *g = c->GetGroup();

	if(!g)
		return;

	database.RefreshGroupFromDB(c);
	//g->SendUpdate(7, c);
}

void command_advnpcspawn(Client *c, const Seperator *sep)
 {
 	Mob *target=c->GetTarget();
 	char errbuf[MYSQL_ERRMSG_SIZE];
 	char *query = 0;
 	MYSQL_RES *result;
     MYSQL_ROW row;
 	int32 tmp = 0;
 	int32 tmp2 = 0;
     int32 last_insert_id = 0;
 
 		if (strcasecmp(sep->arg[1], "maketype") == 0){
 			if(target && target->IsNPC())
 			{
 			database.NPCSpawnDB(6, zone->GetShortName(), c, target->CastToNPC());
 			}
 			else
 			c->Message(0, "Target Required!");
 		}
 		else if (strcasecmp(sep->arg[1], "makegroup") == 0) {
 			if(sep->arg[2])
 			{
 				if (!database.RunQuery(query, MakeAnyLenString(&query, "INSERT INTO spawngroup (name,spawn_limit,dist,max_x,min_x,max_y,min_y,delay) VALUES (\"%s\",%i,%f,%f,%f,%f,%f,%i)", sep->arg[2], (sep->arg[3]?atoi(sep->arg[3]):0), (sep->arg[4]?atof(sep->arg[4]):0), (sep->arg[5]?atof(sep->arg[5]):0), (sep->arg[6]?atof(sep->arg[6]):0), (sep->arg[7]?atof(sep->arg[7]):0), (sep->arg[8]?atof(sep->arg[8]):0), (sep->arg[9]?atoi(sep->arg[9]):0)), errbuf, 0, 0, &last_insert_id)) 
 				{
 					c->Message(0, "Invalid Arguments -- MySQL gave the following error:");
 					c->Message(13, errbuf);
 				}
 				else
 				{
 				c->LogSQL(query);
 				c->Message(0, "Group ID %i created successfully!", last_insert_id);
 				}
 				safe_delete_array(query);
 			}
 			else
 			{
 				c->Message(0, "Format: #advnpdspawn makegroup <name> [spawn limit] [dist] [max x] [min x] [max y] [min y] [delay]");
 			}
 		}
 		else if (strcasecmp(sep->arg[1], "addgroupentry") == 0) {
 			if(atoi(sep->arg[2]) && atoi(sep->arg[3]) && atoi(sep->arg[4]))
 			{
 				if (!database.RunQuery(query, MakeAnyLenString(&query, "INSERT INTO spawnentry (spawngroupID,npcID,chance) VALUES (%i,%i,%i)", atoi(sep->arg[2]), atoi(sep->arg[3]), atoi(sep->arg[4]), errbuf, 0, 0, &last_insert_id)))
 				{
 					c->Message(0, "Invalid Arguments -- MySQL gave the following error:");
 					c->Message(13, errbuf);
 				}
 				else
 				{
 				c->LogSQL(query);
 				c->Message(0, "NPC %i added to group %i with %i chance!", atoi(sep->arg[3]), atoi(sep->arg[2]), atoi(sep->arg[4]) );
 				}
 				safe_delete(query);
 			}
 			else
 			{
 				c->Message(0, "Format: #advnpdspawn addgroupentry <spawnggroupID> <npcID> <chance>");
 			}
 		}
 		else if (strcasecmp(sep->arg[1], "editgroupbox") == 0) {
 			if(atof(sep->arg[2]) && atof(sep->arg[3]) && atof(sep->arg[4]) && atof(sep->arg[5]) && atof(sep->arg[6]) && atof(sep->arg[7]) && atof(sep->arg[8]))
 			{
 				if (!database.RunQuery(query, MakeAnyLenString(&query, "UPDATE spawngroup SET dist='%f',max_x='%f',min_x='%f',max_y='%f',min_y='%f',delay='%i' WHERE id='%i'", atof(sep->arg[3]),atof(sep->arg[4]),atof(sep->arg[5]),atof(sep->arg[6]),atof(sep->arg[7]),atoi(sep->arg[8]),atoi(sep->arg[2]), errbuf, 0, 0, &last_insert_id)))
 				{
 					c->Message(0, "Invalid Arguments -- MySQL gave the following error:");
 					c->Message(13, errbuf);
 				}
 				else
 				{
 				c->LogSQL(query);
 				c->Message(0, "Group ID %i created successfully!", last_insert_id);
 				}
 				safe_delete_array(query);
 			}
 			else
 			{
 				c->Message(0, "Format: #advnpdspawn editgroupbox <spawngroupID> <dist> <max x> <min x> <max y> <min y> <delay>");
 			}
 		}
 		else if (strcasecmp(sep->arg[1], "cleargroupbox") == 0) {
 			if(atoi(sep->arg[2]))
 			{
 				if (!database.RunQuery(query, MakeAnyLenString(&query, "UPDATE spawngroup SET dist='0',max_x='0',min_x='0',max_y='0',min_y='0',delay='0' WHERE id='%i'",atoi(sep->arg[2])), errbuf, 0, 0, &last_insert_id)) 
 				{
 					c->Message(0, "Invalid Arguments -- MySQL gave the following error:");
 					c->Message(13, errbuf);
 				}
 				else
 				{
 				c->LogSQL(query);
 				c->Message(0, "Group ID %i created successfully!", last_insert_id);
 				}
 				safe_delete_array(query);
 			}
 			else
 			{
 				c->Message(0, "Format: #advnpdspawn cleargroupbox <spawngroupID>");
 			}
 		}
 		else if (strcasecmp(sep->arg[1], "addgroupspawn") == 0 && atoi(sep->arg[2])!=0) {
 			database.NPCSpawnDB(5, zone->GetShortName(), c, 0, atoi(sep->arg[2]));
 			c->Message(0, "Mob of group %i added successfully!", atoi(sep->arg[2]));
 		}
 		else if (strcasecmp(sep->arg[1], "removegroupspawn") == 0) {
 			if (!target || !target->IsNPC())
 				c->Message(0, "Error: Need an NPC target.");
 			else {
 				Spawn2* s2 = target->CastToNPC()->respawn2;
 
 				if(!s2) {
 					c->Message(0, "removegroupspawn FAILED -- cannot determine which spawn entry in the database this mob came from.");
 				}
 				else
 				{
 					if(database.RunQuery(query, MakeAnyLenString(&query, "DELETE FROM spawn2 WHERE id='%i'",s2->GetID()), errbuf))
 					{
 						c->LogSQL(query);
 						c->Message(0, "Spawnpoint Removed successfully.");
 						target->Depop(false);
 					}
 					else
 					{
 						c->Message(13, "Update failed! MySQL gave the following error:");
 						c->Message(13, errbuf);
 	  				}
 					safe_delete_array(query);
 				}
 			} 
 		}
 		else if (strcasecmp(sep->arg[1], "movespawn") == 0) {
 			if (!target || !target->IsNPC())
 				c->Message(0, "Error: Need an NPC target.");
 			else {
 				Spawn2* s2 = target->CastToNPC()->respawn2;
 
 				if(!s2) {
 					c->Message(0, "movespawn FAILED -- cannot determine which spawn entry in the database this mob came from.");
 				}
 				else
 				{
 					if(database.RunQuery(query, MakeAnyLenString(&query, "UPDATE spawn2 SET x='%f', y='%f', z='%f', heading='%f' WHERE id='%i'",c->GetX(), c->GetY(), c->GetZ(), c->GetHeading(),s2->GetID()), errbuf))
 					{
 						c->LogSQL(query);
 						c->Message(0, "Updating coordinates successful.");
 						target->CastToNPC()->GMMove(c->GetX(), c->GetY(), c->GetZ(), c->GetHeading());
 						target->CastToNPC()->SaveGuardSpot(true);
 						target->SendPosition();
 					}
 					else
 					{
 						c->Message(13, "Update failed! MySQL gave the following error:");
 						c->Message(13, errbuf);
 	  				}
 					safe_delete_array(query);
 				}
 			} 
 		}
 		else if (strcasecmp(sep->arg[1], "testload") == 0 && atoi(sep->arg[2])!=0) {
 			database.LoadSpawnGroupsByID(atoi(sep->arg[2]),&zone->spawn_group_list);
 			c->Message(0, "Group %i loaded successfully!", atoi(sep->arg[2]));
 		}
 		else {
 			c->Message(0, "Error: #advnpcspawn: Invalid command.");
 			c->Message(0, "Usage: #advnpcspawn [maketype|makegroup|addgroupentry|addgroupspawn]");
 			c->Message(0, "Usage: #advnpcspawn [removegroupspawn|movespawn|editgroupbox|cleargroupbox]");
 		}
 }
