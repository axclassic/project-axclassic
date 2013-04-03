/*  EQEMu:  Everquest Server Emulator
    Copyright (C) 2001-2009  EQEMu Development Team (http://eqemulator.net)

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

#if !defined(_L__SERVLIST__H)
#define _L__SERVLIST__H

#include "../common/debug.h"
#include "../common/EQStreamFactory.h"
#include "../common/EmuTCPConnection.h"
#include "../common/EmuTCPServer.h"
#include "../common/servertalk.h"
#include "../common/packet_dump.h"

#include "LoginMain.h"
#include "inifile.h"
#include "WorldRegistration.h"

#include "EQEmuDatabase.h"

#ifdef WIN32
//	#include <process.h>
	#define snprintf	_snprintf
#if (_MSC_VER < 1500)
        #define vsnprintf       _vsnprintf
#endif

	#define strncasecmp	_strnicmp
	#define strcasecmp  _stricmp
	
#else
	#include <pthread.h>
	#include "../common/unix.h"
	#include <sys/types.h>
	#include <sys/ipc.h>
	#include <sys/sem.h>
	#include <sys/shm.h>
	#ifndef FREEBSD
		union semun {
		    int val;
		    struct semid_ds *buf;
		    ushort *array;
		    struct seminfo *__buf;
		    void *__pad;
		};	  
	#endif

#endif

#include <list>

using namespace std;

struct EQServerEntry {
	uint32 IPAddress;
	ServerLSStatus_Struct Status;
	WorldRegistration *WorldServerReg;
};

class Serverlist {

public:
	Serverlist();
	void Process();
	void SendClientAuth(int32 IPAddress, std::string accountName, std::string userKey, uint32 loginServerAccountID, int32 UniqueServerID);
	void SendServerListPacket(EQStream* Client);
	void SendUserToWorldRequest(int32 IPAddress, int32 UniqueServerID);	

private:
	list<EQServerEntry> EQServers;
	EmuTCPServer* tcps; 
	list<EmuTCPConnection*> ServerConnections;
	Timer *KeepAliveTimer;
	void UpdateServerStatus(int32 IPAddress, ServerLSStatus_Struct* Status);
	// The UniqueServerID is allocated to a server when it connects. It is sent in the ServerList and the client
	// replies with this number indicating which server it wants to connect to.
	int32 UniqueServerID;
	EQEmuDatabase* _db;
	void AddServer(EmuTCPConnection *serverConnection, WorldRegistration *worldRegistrationInfo);
	EmuTCPConnection *FindWorldServer(const uint32 serverIPAddress);
	void RemoveDisconnectedWorldServers();
	EQServerEntry *FindServerEntry(const uint32 serverIPAddress);
	bool RemoveServerEntry(const uint32 serverIPAddress);
	bool RemoveWorldServer(const EmuTCPConnection *worldServerTCPConnection);
};

#endif
