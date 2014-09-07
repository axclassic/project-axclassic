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
#ifndef WORLDSERVER_H
#define WORLDSERVER_H

#include "../common/worldconn.h"
#include "../common/eq_packet_structs.h"
#include <string>

struct GuildJoin_Struct;
class EQApplicationPacket;
class Client;
class Database;

class WorldServer : public WorldConnection {
public:
	WorldServer();
    virtual ~WorldServer();

	virtual void Process();
	
	void SendGuildJoin(GuildJoin_Struct* gj);
	bool SendChannelMessage(Client* from, const char* to, int8 chan_num, int32 guilddbid, int8 language, const char* message, ...);
	bool SendEmoteMessage(const char* to, int32 to_guilddbid, int32 type, const char* message, ...);
	bool SendEmoteMessage(const char* to, int32 to_guilddbid, sint16 to_minstatus, int32 type, const char* message, ...);
	bool SendVoiceMacro(Client* From, int32 Type, char* Target, int32 MacroNumber, int32 GroupOrRaidID = 0);
	void SetZone(int32 iZoneID, int32 iInstanceID = 0);
	int32 SendGroupIdRequest();
	bool RezzPlayer(EQApplicationPacket* rpack,int32 rezzexp, int16 opcode);
	bool IsOOCMuted() const { return(oocmuted); }
	
	int32 NextGroupID();
	
	void SetLaunchedName(const char *n) { m_launchedName = n; }
	void SetLauncherName(const char *n) { m_launcherName = n; }
	void SendReloadTasks(int Command, int TaskID=0);
	void HandleReloadTasks(ServerPacket *pack);
	void UpdateLFP(int32 LeaderID, int8 Action, int8 MatchFilter, uint32 FromLevel, uint32 ToLevel, uint32 Classes, const char *Comments,
		       GroupLFPMemberEntry *LFPMembers);
	void UpdateLFP(int32 LeaderID, GroupLFPMemberEntry *LFPMembers);
	void StopLFP(int32 LeaderID);
	void HandleLFGMatches(ServerPacket *pack);
	void HandleLFPMatches(ServerPacket *pack);
	
private:
	virtual void OnConnected();
	
	std::string m_launchedName;
	std::string m_launcherName;
	
	bool oocmuted;
	
	int32 cur_groupid;
	int32 last_groupid;
};
#endif

