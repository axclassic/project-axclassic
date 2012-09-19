#ifndef GUILD_BASE_H_
#define GUILD_BASE_H_

#include "guilds.h"
#include <map>
#include <string>
#include <vector>

class Database;

class CharGuildInfo {
public:
	//fields from `characer_`
	int32	char_id;
	std::string	char_name;
	uint8	class_;
	int16	level;
	int32	time_last_on;
	int32	zone_id;
	
	//fields from `guild_members`
	int32	guild_id;
	int8	rank;
	bool	tribute_enable;
	int32	total_tribute;
	int32	last_tribute;		//timestamp
	bool	banker;
	std::string	public_note;
};

//this object holds guild functionality shared between world and zone.
class BaseGuildManager {
public:
	BaseGuildManager();
	virtual ~BaseGuildManager();
	
	//this must be called before doing anything else with this object
	void SetDatabase(Database *db) { m_db = db; }
	
	bool LoadGuilds();
	bool RefreshGuild(uint32 guild_id);
	
	//guild edit actions.
	int32	CreateGuild(const char* name, int32 leader_char_id);
	bool	DeleteGuild(int32 guild_id);
	bool	RenameGuild(int32 guild_id, const char* name);
	bool	SetGuildMOTD(int32 guild_id, const char* motd, const char *setter);
	
	//character edit actions
	bool	SetGuildLeader(int32 guild_id, int32 leader_char_id);
	bool	SetGuild(int32 charid, int32 guild_id, int8 rank);
	bool	SetGuildRank(int32 charid, int8 rank);
	bool	SetBankerFlag(int32 charid, bool is_banker);
	bool	GetBankerFlag(int32 CharID);
	bool	SetTributeFlag(int32 charid, bool enabled);
	bool	SetPublicNote(int32 charid, const char *note);
	
	//queries
	bool	GetCharInfo(const char *char_name, CharGuildInfo &into);
	bool	GetCharInfo(uint32 char_id, CharGuildInfo &into);
	bool	GetEntireGuild(uint32 guild_id, std::vector<CharGuildInfo *> &members);	//caller is responsible for deleting each pointer in the resulting vector.
	bool	GuildExists(uint32 guild_id) const;
	bool	GetGuildMOTD(int32 guild_id, char *motd_buffer, char *setter_buffer) const;
	const char *GetRankName(uint32 guild_id, uint8 rank) const;
	const char *GetGuildName(uint32 guild_id) const;
	bool	GetGuildNameByID(int32 guild_id, std::string &into) const;
	bool	IsGuildLeader(uint32 guild_id, uint32 char_id) const;
	uint8	GetDisplayedRank(uint32 guild_id, uint8 rank, uint32 char_id) const;
	bool	CheckGMStatus(uint32 guild_id, uint8 status) const;
	bool	CheckPermission(uint32 guild_id, uint8 rank, GuildAction act) const;
//	int32	Getguild_id(int32 eqid);
	int32	FindGuildByLeader(int32 leader) const;
//	void	GetGuildMembers(int32 guild_id,GuildMember_Struct* gms);
	int32	NumberInGuild(int32 guild_id);
//	bool	GetGuildRanks(int32 guildeqid, GuildRanks_Struct* gr);
//	bool	EditGuild(int32 guild_id, int8 ranknum, GuildRankLevel_Struct* grl);
	
	uint8 *MakeGuildList(const char *head_name, uint32 &length) const;	//make a guild list packet, returns ownership of the buffer.
	
	static const char *const GuildActionNames[_MaxGuildAction];
	
protected:
	//the methods which must be defined by base classes.
	virtual void SendGuildRefresh(int32 guild_id, bool name, bool motd, bool rank, bool relation) = 0;
	virtual void SendCharRefresh(int32 old_guild_id, int32 guild_id, int32 charid) = 0;
	virtual void SendGuildDelete(int32 guild_id) = 0;
	
	int32	DBCreateGuild(const char* name, int32 leader_char_id);
	bool	DBDeleteGuild(int32 guild_id);
	bool	DBRenameGuild(int32 guild_id, const char* name);
	bool	DBSetGuildLeader(int32 guild_id, int32 leader_char_id);
	bool	DBSetGuildMOTD(int32 guild_id, const char* motd, const char *setter);
	bool	DBSetGuild(int32 charid, int32 guild_id, int8 rank);
	bool	DBSetGuildRank(int32 charid, int8 rank);
	bool	DBSetBankerFlag(int32 charid, bool is_banker);
	bool	DBSetTributeFlag(int32 charid, bool enabled);
	bool	DBSetPublicNote(int32 charid, const char *note);
	bool	_RunQuery(char *&query, int len, const char *errmsg);
//	void	DBSetPublicNote(int32 guild_id,char* charname, char* note);
	
	bool	LocalDeleteGuild(int32 guild_id);
	
	class RankInfo {
	public:
		RankInfo();
		std::string name;
		bool permissions[_MaxGuildAction];
	};
	class GuildInfo {
	public:
		GuildInfo();
		std::string name;
		std::string motd;
		std::string motd_setter;
		int32 leader_char_id;
		uint8 minstatus;
		//tribute is not in here on purpose, since it is only valid in world!
		RankInfo ranks[GUILD_MAX_RANK+1];
	};
	
	std::map<uint32, GuildInfo *> m_guilds;	//we own the pointers in this map
	void ClearGuilds();	//clears internal structure
	
	Database *m_db;	//we do not own this
	
	bool _StoreGuildDB(uint32 guild_id);
	GuildInfo *_CreateGuild(uint32 guild_id, const char *guild_name, uint32 account_id, uint8 minstatus, const char *guild_motd, const char *motd_setter);
	int32 _GetFreeGuildID();
};


#endif /*GUILD_BASE_H_*/


