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
#ifndef ZONESERVER_H
#define ZONESERVER_H

#include "WorldTCPConnection.h"
#include "../common/EmuTCPConnection.h"
#include <string.h>
#include <string>

class Client;
class ServerPacket;


class ZoneServer : public WorldTCPConnection {
public:
	ZoneServer(EmuTCPConnection* itcpc);
    ~ZoneServer();
	virtual inline bool IsZoneServer() { return true; }
	
	bool		Process();
	bool		SendPacket(ServerPacket* pack) { return tcpc->SendPacket(pack); }
	void		SendEmoteMessage(const char* to, int32 to_guilddbid, sint16 to_minstatus, int32 type, const char* message, ...);
	void		SendEmoteMessageRaw(const char* to, int32 to_guilddbid, sint16 to_minstatus, int32 type, const char* message);
	bool		SetZone(int32 iZoneID, int32 iInstanceID = 0,  bool iStaticZone = false);
	void		TriggerBootup(int32 iZoneID = 0, int32 iInstanceID = 0, const char* iAdminName = 0, bool iMakeStatic = false);
	void		Disconnect() { tcpc->Disconnect(); }
	void		IncommingClient(Client* client);
	void		LSBootUpdate(int32 zoneid, int32 iInstanceID = 0, bool startup = false);
	void		LSSleepUpdate(int32 zoneid);
	void		LSShutDownUpdate(int32 zoneid);
	int32		GetPrevZoneID() { return oldZoneID; }
	void		ChangeWID(int32 iCharID, int32 iWID);
	void		SendGroupIDs();

	inline const char*	GetZoneName() const	{ return zone_name; }
	inline const char*	GetZoneLongName() const	{ return long_name; }
	const char*			GetCompileTime() const{ return compiled; }
	void				SetCompile(char* in_compile){ strcpy(compiled,in_compile); }
	inline int32		GetZoneID() const	{ return zoneID; }
	inline int32		GetIP() const		{ return tcpc->GetrIP(); }
	inline int16		GetPort() const		{ return tcpc->GetrPort(); }
	inline const char*	GetCAddress() const	{ return clientaddress; }
	inline int16		GetCPort() const	{ return clientport; }
	inline int32		GetID() const		{ return ID; }
	inline bool			IsBootingUp() const	{ return BootingUp; }
	inline bool			IsStaticZone() const{ return staticzone; }
	inline int32		NumPlayers() const	{ return pNumPlayers; }
	inline void			AddPlayer()			{ pNumPlayers++; }
	inline void			RemovePlayer() 		{ pNumPlayers--; }
	inline const char * GetLaunchName() const { return(launcher_name.c_str()); }
	inline const char * GetLaunchedName() const { return(launched_name.c_str()); }

	inline int32		GetInstanceID() { return instanceID; }
	inline void			SetInstanceID(int32 i) { instanceID = i; }
	//
	//used by wlog() for VC6
	#ifdef NO_VARIADIC_MACROS
	void world_log(LogType type, const char *fmt, ...);
	#endif
private:
	EmuTCPConnection* const tcpc;

	int32	ID;
	char	clientaddress[250];
	int16	clientport;
	bool	BootingUp;
	bool	staticzone;
	bool	authenticated;
	int32	pNumPlayers;
	char	compiled[25];
	char	zone_name[16];
	char	long_name[256];
	int32	zoneID;
	int32	oldZoneID;
	Timer	ls_zboot;
	int32	instanceID;	//instance ids contain a zone id, and a zone version
	std::string launcher_name;	//the launcher which started us
	std::string launched_name;	//the name of the zone we launched.
};


#endif
