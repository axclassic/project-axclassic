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
/*
Below are the blob structures for zone state dumping to the database
-Quagmire

create table zone_state_dump (zonename varchar(16) not null primary key, spawn2_count int unsigned not null default 0, 
npc_count int unsigned not null default 0, npcloot_count int unsigned not null default 0, gmspawntype_count int unsigned not null default 0, 
spawn2 mediumblob, npcs mediumblob, npc_loot mediumblob, gmspawntype mediumblob, time timestamp(14));
*/

#ifndef ZONEDUMP_H
#define ZONEDUMP_H
#include "faction.h"
#include "../common/eq_packet_structs.h"
#include "../common/Item.h"

#pragma pack(1)

struct NPCType
{
    char    name[64];
    char    lastname[70];
	
    sint32  cur_hp;
    sint32  max_hp;
	
	float	size;
	float	runspeed;
    int8    gender;
    int16    race;
    int8    class_;
    int8    bodytype;   // added for targettype support
    int8    deity;		//not loaded from DB
    int8    level;
	int32   npc_id;
//	int8    skills[75]; // socket 12-29-01, not loaded from DB
	int8	texture;
	int8	helmtexture;
	int32	loottable_id;
	int32	npc_spells_id;
	sint32	npc_faction_id;
	uint32	merchanttype;
	int32	adventure_template;
	int32	trap_template;
    int8    light;		//not loaded from DB
//    int32    equipment[MAX_MATERIALS];		//not loaded from DB
	
	int16	AC;
	int16	Mana;	//not loaded from DB
	int16	ATK;	//not loaded from DB
	int16	STR;
	int16	STA;
	int16	DEX;
	int16	AGI;
	int16	INT;
	int16	WIS;
	int16	CHA;
	sint16	MR;
	sint16	FR;
	sint16	CR;
	sint16	PR;
	sint16	DR;
	int8	haircolor;
	int8	beardcolor;
	int8	eyecolor1;			// the eyecolors always seem to be the same, maybe left and right eye?
	int8	eyecolor2;
	int8	hairstyle;
	int8	luclinface;			//
	int8	beard;				//
	int32	drakkin_heritage;
	int32	drakkin_tattoo;
	int32	drakkin_details;
	int32  armor_tint[MAX_MATERIALS];
//	int8	aa_title;	////not loaded from DB
	int32	min_dmg;
	int32	max_dmg;
	char	npc_attacks[30];
//	float	fixedZ;
    int16	d_meele_texture1;
	int16	d_meele_texture2;
	int8	prim_melee_type;
	int8	sec_melee_type;
	sint32	hp_regen;
	sint32  mana_regen;
	sint32	aggroradius; // added for AI improvement - neotokyo
//	bool	ipc;
	bool	see_invis;			// See Invis flag added
	bool	see_invis_undead;   // See Invis vs. Undead flag added 
	bool	see_hide;
	bool	see_improved_hide;
	bool	qglobal;
	bool	npc_aggro;
	uint8	spawn_limit;	//only this many may be in zone at a time (0=no limit)
	int8	mount_color;	//only used by horse class
	float	attack_speed;	//%+- on attack delay of the mob.
	int		accuracy_rating;  //10 = 1% accuracy
	bool	findable;		//can be found with find command
	bool	trackable;
	float	slow_mitigation;	// Slow mitigation % in decimal form.
	int8	maxlevel;
	int32	scalerate;
	bool	private_corpse;
	bool	unique_spawn_by_name;
};

struct ZSDump_Spawn2 {
	int32	spawn2_id;
	int32	time_left;
};

struct ZSDump_NPC {
	int32			spawn2_dump_index;
	int32			gmspawntype_index;
	int32			npctype_id;
	sint32			cur_hp;
	int8			corpse; // 0=no, 1=yes, 2=yes and locked
	int32			decay_time_left;
//	needatype		buffs;		// decided not to save these, would be hard because if expired them on bootup, wouldnt take into account the npcai refreshing them, etc
	float			x;
	float			y;
	float			z;
	float			heading;
	uint32			copper;
	uint32			silver;
	uint32			gold;
	uint32			platinum;
};

struct ZSDump_NPC_Loot {
	int32	npc_dump_index;
	int16	itemid;
	sint8	charges;
	sint16	equipSlot;
};

/*
Below are the blob structures for saving player corpses to the database
-Quagmire

create table player_corpses (id int(11) unsigned not null auto_increment primary key, charid int(11) unsigned not null, 
charname varchar(30) not null, zonename varchar(16)not null, x float not null, y float not null, z float not null,
heading float not null, data blob not null, time timestamp(14), index zonename (zonename));
*/

struct ServerLootItem_Struct {
	uint32	item_id;
	sint16	equipSlot;
	int8	charges;
	int16	lootslot;
	uint32 aug1;
	uint32 aug2;
	uint32 aug3;
	uint32 aug4;
	uint32 aug5;
};

struct DBPlayerCorpse_Struct {
	int32	crc;
	bool	locked;
	int32	itemcount;
	int32	exp;
	float	size;
	int8	level;
	int8	race;
	int8	gender;
	int8	class_;
	int8	deity;
	int8	texture;
	int8	helmtexture;
	int32	copper;
	int32	silver;
	int32	gold;
	int32	plat;
	Color_Struct item_tint[9];
	int8 haircolor;
	int8 beardcolor;
	int8 eyecolor1;
	int8 eyecolor2;
	int8 hairstyle;
	int8 face;
	int8 beard;
	int32 drakkin_heritage;
	int32 drakkin_tattoo;
	int32 drakkin_details;
	ServerLootItem_Struct	items[0];
};

namespace classic_db
{
	struct DBPlayerCorpse_Struct {
		int32	crc;
		bool	locked;
		int32	itemcount;
		int32	exp;
		float	size;
		int8	level;
		int8	race;
		int8	gender;
		int8	class_;
		int8	deity;
		int8	texture;
		int8	helmtexture;
		int32	copper;
		int32	silver;
		int32	gold;
		int32	plat;
		Color_Struct item_tint[9];
		int8 haircolor;
		int8 beardcolor;
		int8 eyecolor1;
		int8 eyecolor2;
		int8 hairstyle;
		int8 face;
		int8 beard;
		ServerLootItem_Struct	items[0];
	};
}

struct Door {
	int32	db_id;
	int8	door_id;
	char	zone_name[16];
	char	door_name[32];
	float	pos_x;
	float	pos_y;
	float	pos_z;
	float	heading;
	int		incline;
	int8	opentype;
	int32	guild_id;
	int16	lockpick;
	uint32	keyitem;
	uint32	keyitem2;
	int8	nokeyring;
	int8	trigger_door;
	int8	trigger_type;
	int32	door_param;
	int		invert_state;
	int16	size;
	char	dest_zone[16];
	float	dest_x;
	float	dest_y;
	float	dest_z;
	float	dest_heading;
	int8	is_ldon_door;
};

#pragma pack()

#endif
