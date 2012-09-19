#ifndef EQ_SOPCODES_H
#define EQ_SOPCODES_H

#define EQEMU_PROTOCOL_VERSION	"0.3.10"

#include "../common/types.h"
#include "../common/packet_functions.h"
#include "../common/eq_packet_structs.h"

#define SERVER_TIMEOUT	45000	// how often keepalive gets sent - Angelox: Default 45000
#define INTERSERVER_TIMER					10000
#define LoginServer_StatusUpdateInterval	15000 //Angelox: Default 15000
#define LoginServer_AuthStale				60000
#define AUTHCHANGE_TIMEOUT					900	// in seconds

#define ServerOP_KeepAlive			0x0001	// packet to test if port is still open
#define ServerOP_ChannelMessage		0x0002	// broadcast/guildsay
#define ServerOP_SetZone			0x0003	// client -> server zoneinfo
#define ServerOP_ShutdownAll		0x0004	// exit(0);
#define ServerOP_ZoneShutdown		0x0005	// unload all data, goto sleep mode
#define ServerOP_ZoneBootup			0x0006	// come out of sleep mode and load zone specified
#define ServerOP_ZoneStatus			0x0007	// Shows status of all zones
#define ServerOP_SetConnectInfo		0x0008	// Tells server address and port #
#define ServerOP_EmoteMessage		0x0009	// Worldfarts
#define ServerOP_ClientList			0x000A	// Update worldserver's client list, for #whos
#define ServerOP_Who				0x000B	// #who
#define ServerOP_ZonePlayer			0x000C  // #zone, or #summon
#define ServerOP_KickPlayer			0x000D  // #kick

#define ServerOP_RefreshGuild		0x000E	// Notice to all zoneservers to refresh their guild cache for ID# in packet (ServerGuildRefresh_Struct)
#define ServerOP_VoiceMacro		0x000F
//#define ServerOP_GuildInvite		0x0010
#define ServerOP_DeleteGuild		0x0011	// ServerGuildID_Struct
//#define ServerOP_GuildJoin		0x0012
#define ServerOP_GuildCharRefresh	0x0013
#define ServerOP_GuildMemberUpdate	0x0014
//#define ServerOP_GuildGMSet		0x0015
//#define ServerOP_GuildGMSetRank	0x0016

#define ServerOP_FlagUpdate			0x0018	// GM Flag updated for character, refresh the memory cache
#define ServerOP_GMGoto				0x0019
#define ServerOP_MultiLineMsg		0x001A
#define ServerOP_Lock				0x001B  // For #lock/#unlock inside server
#define ServerOP_Motd				0x001C  // For changing MoTD inside server.
#define ServerOP_Uptime				0x001D
#define ServerOP_Petition			0x001E
#define	ServerOP_KillPlayer			0x001F
#define ServerOP_UpdateGM			0x0020
#define ServerOP_RezzPlayer			0x0021
#define ServerOP_ZoneReboot			0x0022
#define ServerOP_ZoneToZoneRequest	0x0023
#define ServerOP_AcceptWorldEntrance 0x0024
#define ServerOP_ZAAuth				0x0025
#define ServerOP_ZAAuthFailed		0x0026
#define ServerOP_ZoneIncClient		0x0027	// Incomming client
#define ServerOP_ClientListKA		0x0028
#define ServerOP_ChangeWID			0x0029
#define ServerOP_IPLookup			0x002A
#define ServerOP_LockZone			0x002B
#define ServerOP_ItemStatus			0x002C
#define ServerOP_OOCMute			0x002D
#define ServerOP_Revoke				0x002E
//#define 			0x002F
#define ServerOP_GroupIDReq			0x0030
#define ServerOP_GroupIDReply		0x0031
#define ServerOP_GroupLeave			0x0032	// for disbanding out of zone folks
#define ServerOP_RezzPlayerAccept	0x0033
#define ServerOP_SpawnCondition		0x0034
#define ServerOP_SpawnEvent			0x0035
#define ServerOP_SetLaunchName		0x0036
//#define ServerOP_DeleteGuild		0x0037	//ServerGuildID_Struct
#define ServerOP_SpawnPlayerCorpse	0x0038
#define ServerOP_Consent			0x0039
#define ServerOP_Consent_Response	0x0040
#define ServerOP_ForceGroupUpdate	0x0041
#define ServerOP_OOZGroupMessage	0x0042
#define ServerOP_DisbandGroup		0x0043 //for disbanding a whole group cross zone
#define ServerOP_GroupJoin			0x0044 //for joining ooz folks
#define ServerOP_UpdateSpawn		0x0045
#define ServerOP_SpawnStatusChange	0x0046
#define ServerOP_ReloadTasks		0x0060
#define ServerOP_DepopAllPlayersCorpses	0x0061
#define ServerOP_ReloadTitles		0x0062
#define ServerOP_QGlobalUpdate		0x0063
#define ServerOP_QGlobalDelete		0x0064

#define ServerOP_RaidAdd			0x0100 //in use
#define ServerOP_RaidRemove			0x0101 //in use
#define	ServerOP_RaidDisband		0x0102 //in use
#define ServerOP_RaidLockFlag		0x0103 //in use
#define ServerOP_RaidGroupLeader	0x0104 //in use
#define ServerOP_RaidLeader			0x0105 //in use
#define	ServerOP_RaidGroupSay		0x0106 //in use
#define	ServerOP_RaidSay			0x0107 //in use
#define	ServerOP_DetailsChange		0x0108 //in use

#define ServerOP_UpdateGroup		0x010A //in use
#define ServerOP_RaidGroupDisband	0x010B //in use
#define ServerOP_RaidChangeGroup	0x010C //in use
#define ServerOP_RaidGroupAdd		0x010D
#define ServerOP_RaidGroupRemove	0x010E

#define ServerOP_InstanceUpdateTime 0x014F
#define ServerOP_AdventureCreate	0x0150
#define ServerOP_AdventureAddPlayer 0x0151
#define ServerOP_AdventureDestroy	0x0152
#define ServerOP_AdventureUpdate	0x0153
#define ServerOP_AdventureCount		0x0154
#define ServerOP_AdventureFinish	0x0155
#define ServerOP_AdventureMessage	0x0156

#define ServerOP_WhoAll				0x0210
#define ServerOP_FriendsWho			0x0211
#define ServerOP_LFGMatches			0x0212
#define ServerOP_LFPUpdate			0x0213
#define ServerOP_LFPMatches			0x0214

#define ServerOP_LSInfo				0x1000
#define ServerOP_LSStatus			0x1001
#define ServerOP_LSClientAuth		0x1002
#define ServerOP_LSFatalError		0x1003
#define ServerOP_SystemwideMessage	0x1005
#define ServerOP_ListWorlds			0x1006
#define ServerOP_PeerConnect		0x1007
#define ServerOP_NewLSInfo			0x1008
#define ServerOP_LSRemoteAddr		0x1009
#define ServerOP_LSAccountUpdate		0x100A

#define ServerOP_EncapPacket		0x2007	// Packet within a packet
#define ServerOP_WorldListUpdate	0x2008
#define ServerOP_WorldListRemove	0x2009
#define ServerOP_TriggerWorldListRefresh	0x200A
#define ServerOP_WhoAllReply		0x2010
#define ServerOP_SetWorldTime		0x200B
#define ServerOP_GetWorldTime		0x200C
#define ServerOP_SyncWorldTime		0x200E

#define ServerOP_LSZoneInfo			0x3001
#define ServerOP_LSZoneStart		0x3002
#define ServerOP_LSZoneBoot			0x3003
#define ServerOP_LSZoneShutdown		0x3004
#define ServerOP_LSZoneSleep		0x3005
#define ServerOP_LSPlayerLeftWorld	0x3006
#define ServerOP_LSPlayerJoinWorld	0x3007
#define ServerOP_LSPlayerZoneChange	0x3008

#define	ServerOP_UsertoWorldReq		0xAB00
#define	ServerOP_UsertoWorldResp	0xAB01

#define ServerOP_LauncherConnectInfo	0x3000
#define ServerOP_LauncherZoneRequest	0x3001
#define ServerOP_LauncherZoneStatus		0x3002

/************ PACKET RELATED STRUCT ************/
class ServerPacket
{
public:
	~ServerPacket() { safe_delete_array(pBuffer); }
    ServerPacket(int16 in_opcode = 0, int32 in_size = 0) {
		this->compressed = false;
		size = in_size;
		opcode = in_opcode;
		if (size == 0) {
			pBuffer = 0;
		}
		else {
			pBuffer = new uchar[size];
			memset(pBuffer, 0, size);
		}
	}
	ServerPacket* Copy() {
		if (this == 0) {
			return 0;
		}
		ServerPacket* ret = new ServerPacket(this->opcode, this->size);
		if (this->size)
			memcpy(ret->pBuffer, this->pBuffer, this->size);
		ret->compressed = this->compressed;
		ret->InflatedSize = this->InflatedSize;
		return ret;
	}
	bool Deflate() {
		if (compressed)
			return false;
		if ((!this->pBuffer) || (!this->size))
			return false;
		uchar* tmp = new uchar[this->size + 128];
		int32 tmpsize = DeflatePacket(this->pBuffer, this->size, tmp, this->size + 128);
		if (!tmpsize) {
			safe_delete_array(tmp);
			return false;
		}
		this->compressed = true;
		this->InflatedSize = this->size;
		this->size = tmpsize;
		uchar* tmpdel = this->pBuffer;
		this->pBuffer = tmp;
		safe_delete_array(tmpdel);
		return true;
	}
	bool Inflate() {
		if (!compressed)
			return false;
		if ((!this->pBuffer) || (!this->size))
			return false;
		uchar* tmp = new uchar[InflatedSize];
		int32 tmpsize = InflatePacket(this->pBuffer, this->size, tmp, InflatedSize);
		if (!tmpsize) {
			safe_delete_array(tmp);
			return false;
		}
		compressed = false;
		this->size = tmpsize;
		uchar* tmpdel = this->pBuffer;
		this->pBuffer = tmp;
		safe_delete_array(tmpdel);
		return true;
	}
	int32	size;
	int16	opcode;
	uchar*	pBuffer;
	bool	compressed;
	int32	InflatedSize;
	int32	destination;
};

#pragma pack(1)

struct SPackSendQueue {
	int16 size;
	uchar buffer[0];
};

struct ServerZoneStateChange_struct {
	int32 ZoneServerID;
	char adminname[64];
	int32 zoneid;
	int16 instanceid;
	bool makestatic;
};

struct ServerZoneIncommingClient_Struct {
	int32	zoneid;		// in case the zone shut down, boot it back up
	int16	instanceid; // instance id if it exists for booting up
	int32	ip;			// client's IP address
	int32	wid;		// client's WorldID#
	int32	accid;
	sint16	admin;
	int32	charid;
	bool	tellsoff;
	char	charname[64];
	char	lskey[30];
};

struct ServerChangeWID_Struct {
	int32	charid;
	int32	newwid;
};
struct SendGroup_Struct{
	int8	grouptotal;
	int32	zoneid;
	char	leader[64];
	char	thismember[64];
	char	members[5][64];
};
struct ServerChannelMessage_Struct {
	char  deliverto[64];
	char  to[64];
	char  from[64];
	int8 fromadmin;
	bool  noreply;
	int16 chan_num;
	int32 guilddbid;
	int16  language;
	char  message[0];
};

struct ServerEmoteMessage_Struct {
	char	to[64];
	int32	guilddbid;
	sint16	minstatus;
	int32	type;
	char	message[0];
};

struct ServerVoiceMacro_Struct {
	char	From[64];
	union {
		char	To[64];
		int32	GroupID;
		int32	RaidID;
	};
	int32	Type;
	int32	Voice;
	int32	MacroNumber;
};

struct ServerClientList_Struct {
	int8	remove;
	int32	wid;
	int32	IP;
	int32	zone;
	int16	instance_id;
	sint16	Admin;
	int32	charid;
	char	name[64];
	int32	AccountID;
	char	AccountName[30];
	int32	LSAccountID;
	char	lskey[30];
	int16	race;
	int8	class_;
	int8	level;
	int8	anon;
	bool	tellsoff;
	int32	guild_id;
	bool	LFG;
	int8	gm;
	int8	LFGFromLevel;
	int8	LFGToLevel;
	bool	LFGMatchFilter;
	char	LFGComments[64];
};

struct ServerClientListKeepAlive_Struct {
	int32	numupdates;
	int32	wid[0];
};

struct ServerZonePlayer_Struct {
	char	adminname[64];
	sint16	adminrank;
	int8	ignorerestrictions;
	char	name[64];
	char	zone[25];
	int32	instance_id;
    float	x_pos;
    float	y_pos;
    float	z_pos;
};

struct RezzPlayer_Struct {
	int32	exp;
	int16	rezzopcode;
	//char	packet[160];
	Resurrect_Struct rez;
};

struct ServerZoneReboot_Struct {
//	char	ip1[250];
	char	ip2[250];
	int16	port;
	int32	zoneid;
};

struct SetZone_Struct {
	int16	instanceid;
	int32	zoneid;
	bool	staticzone;
};

struct ServerKickPlayer_Struct {
	char adminname[64];
	sint16 adminrank;
	char name[64];
	int32 AccountID;
};

struct ServerLSInfo_Struct {
	char	name[201];				// name the worldserver wants
	char	address[250];			// DNS address of the server
	char	account[31];			// account name for the worldserver
	char	password[31];			// password for the name
	char	protocolversion[25];	// Major protocol version number
	char	serverversion[64];		// minor server software version number
	int8	servertype;				// 0=world, 1=chat, 2=login, 3=MeshLogin
};

struct ServerNewLSInfo_Struct {
	char	name[201];				// name the worldserver wants
	char	shortname[50];				// shortname the worldserver wants
	char	remote_address[125];			// DNS address of the server
	char	local_address[125];			// DNS address of the server
	char	account[31];			// account name for the worldserver
	char	password[31];			// password for the name
	char	protocolversion[25];	// Major protocol version number
	char	serverversion[64];		// minor server software version number
	int8	servertype;				// 0=world, 1=chat, 2=login, 3=MeshLogin
};

struct ServerLSAccountUpdate_Struct {			// for updating info on login server
	char	worldaccount[31];			// account name for the worldserver
	char	worldpassword[31];			// password for the name
	int32	useraccountid;				// player account ID
	char	useraccount[31];			// player account name
	char	userpassword[51];			// player account password
	char	useremail[101];				// player account email address
};

struct ServerLSStatus_Struct {
	sint32 status;
	sint32 num_players;
	sint32 num_zones;
};
struct ZoneInfo_Struct {
	uint32 zone;
	uint16 count;
	uint32 zone_wid;
};
struct ZoneBoot_Struct {
	uint32 zone;
	uint32 instance;
	char compile_time[25];
	uint32 zone_wid;
};
struct ZoneShutdown_Struct {
	uint32 zone;
	uint32 instance;
	uint32 zone_wid;
};
struct ServerLSZoneSleep_Struct {
	uint32 zone;
	uint32 instance;
	uint32 zone_wid;
};

struct ServerLSPlayerJoinWorld_Struct {
	uint32 lsaccount_id;
 	char key[30];
};

struct ServerLSPlayerLeftWorld_Struct {
	uint32 lsaccount_id;
 	char key[30];
};

struct ServerLSPlayerZoneChange_Struct {
	uint32 lsaccount_id;
	uint32 from; // 0 = world
	uint32 to;  // 0 = world
};
struct ServerLSClientAuth {
	int32	lsaccount_id;	// ID# in login server's db
	char	name[30];		// username in login server's db
	char	key[30];		// the Key the client will present
	int8	lsadmin;		// login server admin level
	sint16	worldadmin;		// login's suggested worldadmin level setting for this user, up to the world if they want to obey it
	int32	ip;
	uint8	local;			// 1 if the client is from the local network
};

struct ServerSystemwideMessage {
	int32	lsaccount_id;
	char	key[30];		// sessionID key for verification
	int32	type;
	char	message[0];
};

struct ServerLSPeerConnect {
	int32	ip;
	int16	port;
};

struct ServerConnectInfo {
	char	address[250];
	int16	port;
};

struct ServerGMGoto_Struct {
	char	myname[64];
	char	gotoname[64];
	sint16	admin;
};

struct ServerMultiLineMsg_Struct {
	char	to[64];
	char	message[0];
};

struct ServerLock_Struct {
	char	myname[64]; // User that did it
	int8	mode; // 0 = Unlocked ; 1 = Locked
};

struct ServerMotd_Struct {
	char	myname[64]; // User that set the motd
	char	motd[512]; // the new MoTD
};

struct ServerUptime_Struct {
	int32	zoneserverid;	// 0 for world
	char	adminname[64];
};

struct ServerPetitionUpdate_Struct {
	int32 petid;  // Petition Number
	int8  status; // 0x00 = ReRead DB -- 0x01 = Checkout -- More?  Dunno... lol
};

struct ServerWhoAll_Struct {
	sint16 admin;
	int32 fromid;
	char from[64];
	char whom[64];
	int16 wrace; // FF FF = no race
	int16 wclass; // FF FF = no class
	int16 lvllow; // FF FF = no numbers
	int16 lvlhigh; // FF FF = no numbers
	int16 gmlookup; // FF FF = not doing /who all gm
};

struct ServerFriendsWho_Struct {
	int32 FromID; 
	char  FromName[64];
	char  FriendsString[1];
};

struct ServerKillPlayer_Struct {
	char gmname[64];
	char target[64];
	sint16 admin;
};

struct ServerUpdateGM_Struct {
	char gmname[64];
	bool gmstatus;
};

struct ServerEncapPacket_Struct {
	int32	ToID;	// ID number of the LWorld on the other server
	int16	opcode;
	int16	size;
	uchar	data[0];
};

struct ZoneToZone_Struct {
	char	name[64];
	int32	guild_id;
	int32	requested_zone_id;
	int32	requested_instance_id;
	int32	current_zone_id;
	int32	current_instance_id;
	sint8	response;
	sint16	admin;
	int8	ignorerestrictions;
};

struct WorldToZone_Struct {
	int32	account_id;
	sint8	response;
};
struct WorldShutDown_Struct {
	int32	time;
	int32	interval;
};
struct ServerSyncWorldList_Struct {
	int32	RemoteID;
	int32	ip;
	sint32	status;
	char	name[201];
	char	address[250];
	char	account[31];
	int32	accountid;
	int8	authlevel;
	int8	servertype;		// 0=world, 1=chat, 2=login
	int32	adminid;
	int8	greenname;
	int8	showdown;
	sint32  num_players;
	sint32  num_zones;
	bool	placeholder;
};

struct UsertoWorldRequest_Struct {
	int32	lsaccountid;
	int32	worldid;
	int32	FromID;
	int32	ToID;
};

struct UsertoWorldResponse_Struct {
	int32	lsaccountid;
	int32	worldid;
	sint8	response; // -3) World Full, -2) Banned, -1) Suspended, 0) Denied, 1) Allowed
	int32	FromID;
	int32	ToID;
};

// generic struct to be used for alot of simple zone->world questions
struct ServerGenericWorldQuery_Struct {
	char	from[64];	// charname the query is from
	sint16	admin;		// char's admin level
	char	query[0];	// text of the query
};

struct ServerLockZone_Struct {
	int8	op;
	char	adminname[64];
	int16	zoneID;
};

struct RevokeStruct {
	char adminname[64];
	char name[64];
	bool toggle; //0 off 1 on
};

struct ServerGroupIDReply_Struct {
	int32 start;	//a range of group IDs to use.
	int32 end;
};

struct ServerGroupLeave_Struct {
	int32 zoneid;
	int16 instance_id;
	int32 gid;
	char member_name[64];	//kick this member from the group
};

struct ServerGroupJoin_Struct {
	int32 zoneid;
	int16 instance_id;
	int32 gid;
	char member_name[64];	//this person is joining the group
};

struct ServerForceGroupUpdate_Struct {
	int32 origZoneID;
	int16 instance_id;
	int32 gid;
};

struct ServerGroupChannelMessage_Struct {
	int32 zoneid;
	int16 instanceid;
	int32 groupid;
    char  from[64];
	char  message[0];
};

struct ServerDisbandGroup_Struct {
	int32 zoneid;
	int16 instance_id;
	int32 groupid;
};

struct SimpleName_Struct{
	char name[64];
};

struct ServerSpawnCondition_Struct {
	int32 zoneID;
	uint16 condition_id;
	sint16 value;
};

struct ServerSpawnEvent_Struct {
	int32	zoneID;
	uint32	event_id;
};

//zone->world
struct LaunchName_Struct {
	char launcher_name[32];
	char zone_name[16];
};

struct LauncherConnectInfo {
	char name[64];
};

typedef enum {
	ZR_Start,
	ZR_Restart,
	ZR_Stop
} ZoneRequestCommands;
struct LauncherZoneRequest {
	uint8 command;
	char short_name[17];
};

struct LauncherZoneStatus {
	char short_name[17];
	uint32 start_count;
	uint8 running;
};


struct ServerGuildID_Struct {
	int32 guild_id;
};

struct ServerGuildRefresh_Struct {
	int32 guild_id;
	int8 name_change;
	int8 motd_change;
	int8 rank_change;
	int8 relation_change;
};

struct ServerGuildCharRefresh_Struct {
	int32 guild_id;
	int32 old_guild_id;
	int32 char_id;
};

//not sure what needs to go in here.
struct ServerGuildMemberUpdate_Struct {
	int32 guild_id;
	int32 char_id;
	//...
};

struct SpawnPlayerCorpse_Struct {
	int32 player_corpse_id;
	int32 zone_id;
};

struct ServerOP_Consent_Struct {
	char grantname[64];
	char ownername[64];
	int8 permission;
	int32 zone_id;
	int16 instance_id;
	int32 message_string_id;
};

struct ReloadTasks_Struct {
	uint32 Command;
	uint32 Parameter;
};

struct ServerDepopAllPlayersCorpses_Struct
{
	uint32 CharacterID;
	int32 ZoneID;
	int16 InstanceID;
};

struct ServerRaidGeneralAction_Struct {
	int32 zoneid;
	int16 instance_id;
	int32 rid;
	int32 gid;
	char playername[64];
};

struct ServerRaidGroupAction_Struct { //add / remove depends on opcode.
	char membername[64]; //member who's adding / leaving
	int32 gid; //group id to send to.
	int32 rid; //raid id to send to. 
};

struct ServerRaidMessage_Struct {
	int32 rid;
	int32 gid;
	char from[64];
	char message[0];
};

struct ServerLFGMatchesRequest_Struct {
	int32	FromID;
	int8	QuerierLevel;
	char	FromName[64];
	int8	FromLevel;
	int8	ToLevel;
	uint32	Classes;
};

struct ServerLFGMatchesResponse_Struct {
	char Name[64];
	int8 Level;
	int8 Class_;
	int16 Zone;
	uint16 GuildID;
	uint16 Anon;
	char Comments[64];
};

struct ServerLFPUpdate_Struct {
	int32 LeaderID;
	int8 Action;
	int8 MatchFilter;
	uint32	FromLevel;
	uint32	ToLevel;
	uint32	Classes;
	char	Comments[64];
	GroupLFPMemberEntry Members[MAX_GROUP_MEMBERS];
};

struct ServerLFPMatchesResponse_Struct {
	uint32	FromLevel;
	uint32	ToLevel;
	uint32	Classes;
	GroupLFPMemberEntry Members[MAX_GROUP_MEMBERS];
	char Comments[64];
};

struct ServerLFPMatchesRequest_Struct {
	int32	FromID;
	int8	FromLevel;
	int8	ToLevel;
	int8	QuerierClass;
	int8	QuerierLevel;
	char	FromName[64];
};

struct UpdateSpawnTimer_Struct {
	int32 id;
	int32 duration;
};

struct ServerInstanceUpdateTime_Struct
{
	int16 instance_id;
	int32 new_duration;
};

struct ServerAdventureCreate_Struct
{
	int32 from_zone_id;
	int16 from_instance_id;
	int32 id;
	int32 adv_template_id;
	sint32 instance_id;
	int32 count;
	int8 status;
	int32 time_created;
	int32 time_zoned;
	int32 time_completed;
};

struct ServerAdventureAddPlayer_Struct
{
	int32 id;
	char player_name[64];
};

struct ServerAdventureDestroy_Struct
{
	int32 id;
};

struct ServerAdventureUpdate_Struct
{
	int32 id;
	int8 new_inst;
	sint32 instance_id;
	int8 new_status;
	int32 status;
	int8 new_timec;
	int32 time_c;
	int8 new_timez;
	int32 time_z;
};

struct ServerAdventureCount_Struct
{
	int32 id;
	int32 count;
};

struct ServerAdventureFinish_Struct
{
	int32 id;
	int8 win_lose;
	int32 points;
	bool update_stats;
};

struct ServerAdventureMessage_Struct
{
	int32 id;
	char message[0];
};

struct ServerSpawnStatusChange_Struct
{
	int32 id;
	bool new_status;
};

struct ServerQGlobalUpdate_Struct
{
	uint32 id;
	char name[64];
	char value[64];
	uint32 npc_id;
	uint32 char_id;
	uint32 zone_id;
	uint32 expdate;
	uint32 from_zone_id;
	uint32 from_instance_id;
};

struct ServerQGlobalDelete_Struct
{
	char name[64];
	uint32 npc_id;
	uint32 char_id;
	uint32 zone_id;
	uint32 from_zone_id;
	uint32 from_instance_id;
};

#pragma pack()

#endif
