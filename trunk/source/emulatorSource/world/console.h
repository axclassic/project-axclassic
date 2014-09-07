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
#ifndef CONSOLE_H
#define CONSOLE_H

#define CONSOLE_TIMEOUT 600000
enum {
	consoleLoginStatus = 50,	//ability to log in, basic commands.
	httpLoginStatus = 100,		//can log into the HTTP interface
	consoleFlagStatus = 200,	//flag
	consoleKickStatus = 150,	//kick
	consoleLockStatus = 150,	//world lock/unlock
	consoleZoneStatus = 150,	//zone up/down/lock
	consolePassStatus = 200,	//change password
	consoleWorldStatus = 200,	//world shutdown
	consoleOpcodesStatus = 250
};

#define CONSOLE_STATE_USERNAME 0
#define CONSOLE_STATE_PASSWORD 1
#define CONSOLE_STATE_CONNECTED 2
#define CONSOLE_STATE_CLOSED 3

#include "../common/linked_list.h"
#include "../common/timer.h"
#include "../common/queue.h"
#include "../common/EmuTCPConnection.h"
#include "WorldTCPConnection.h"
#include "../common/Mutex.h"

struct ServerChannelMessage_Struct;

class Console : public WorldTCPConnection {
public:
	Console(EmuTCPConnection* itcpc);
	virtual ~Console();
	virtual inline bool IsConsole() { return true; }

	bool Process();
	void Send(const char* message);
	sint16 Admin() { return admin; }
	int32 GetIP() { return tcpc->GetrIP(); }
	int16 GetPort() { return tcpc->GetrPort(); }
	void ProcessCommand(const char* command);
	void Die();

	bool SendChannelMessage(const ServerChannelMessage_Struct* scm);
	bool SendEmoteMessage(int32 type, const char* message, ...);
	bool SendEmoteMessageRaw(int32 type, const char* message);
	void SendEmoteMessage(const char* to, int32 to_guilddbid, sint16 to_minstatus, int32 type, const char* message, ...);
	void SendEmoteMessageRaw(const char* to, int32 to_guilddbid, sint16 to_minstatus, int32 type, const char* message);
	void SendMessage(int8 newline, const char* message, ...);

	const char* GetName() { return paccountname; }
	const char* AccountName() { return paccountname; }
	int32 AccountID() { return paccountid; }
private:
	EmuTCPConnection* tcpc;

	Timer timeout_timer;
	Timer prompt_timer;

	void SendPrompt();

	int32 paccountid;
	char paccountname[30];
	bool pAcceptMessages;

	int8 state;

	sint16 admin;
	uchar textbuf[1024];
	int bufindex;
};

class ConsoleList
{
public:
	ConsoleList() {}
	~ConsoleList() {}
		
	void Add(Console* con);
	void Process();
	void KillAll();

	void SendChannelMessage(const ServerChannelMessage_Struct* scm);
	void SendConsoleWho(WorldTCPConnection* connection, const char* to, sint16 admin, char** output, int32* outsize, int32* outlen);
	void SendEmoteMessage(int32 type, const char* message, ...);
	void SendEmoteMessageRaw(int32 type, const char* message);
	Console* FindByAccountName(const char* accname);
private:
	LinkedList<Console*> list;
};
#endif
