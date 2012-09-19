/*
	EQEMu:  Everquest Server Emulator

	Copyright (C) 2001-2008 EQEMu Development Team (http://eqemulator.net)

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

#include "../common/debug.h"
#include "clientlist.h"
#include "../common/opcodemgr.h"
#include "../common/EQStreamFactory.h"
#include "../common/rulesys.h"
#include "database.h"
#include "ChatConfig.h"
#include "chatchannel.h"
#include <list>
#include <signal.h>

volatile bool RunLoops = true;

TimeoutManager          timeout_manager;

Clientlist *CL;

ChatChannelList *ChannelList;

Database database;

string WorldShortName;

RuleManager *rules = new RuleManager();

void CatchSignal(int sig_num) {

	RunLoops = false;
}

string GetMailPrefix() {

	return "SOE.EQ." + WorldShortName + ".";

}

int main() {

	// Check every minute for unused channels we can delete
	//
	Timer ChannelListProcessTimer(60000);

	_log(CHANNELS__INIT, "Starting EQEmu Chat Channel Server");

	if (!ChatConfig::LoadConfig()) {

		_log(CHANNELS__INIT, "Loading server configuration failed.");

		return(1);
	}

	const ChatConfig *Config=ChatConfig::get();

	if(!load_log_settings(Config->LogSettingsFile.c_str()))
		_log(CHANNELS__INIT, "Warning: Unable to read %s", Config->LogSettingsFile.c_str());
	else
		_log(CHANNELS__INIT, "Log settings loaded from %s", Config->LogSettingsFile.c_str());

	WorldShortName = Config->ShortName;

	_log(CHANNELS__INIT, "Connecting to MySQL...");

	if (!database.Connect(
		Config->DatabaseHost.c_str(),
		Config->DatabaseUsername.c_str(),
		Config->DatabasePassword.c_str(),
		Config->DatabaseDB.c_str(),
		Config->DatabasePort)) {
		_log(WORLD__INIT_ERR, "Cannot continue without a database connection.");
		return(1);
	}

	char tmp[64];

	if (database.GetVariable("RuleSet", tmp, sizeof(tmp)-1)) {
		_log(WORLD__INIT, "Loading rule set '%s'", tmp);
		if(!rules->LoadRules(&database, tmp)) {
			_log(CHANNELS__ERROR, "Failed to load ruleset '%s', falling back to defaults.", tmp);
		}
	} else {
		if(!rules->LoadRules(&database, "default")) {
			_log(CHANNELS__INIT, "No rule set configured, using default rules");
		} else {
			_log(CHANNELS__INIT, "Loaded default rule set 'default'", tmp);
		}
	}

	CL = new Clientlist(Config->ChatPort);

	ChannelList = new ChatChannelList();
	
	database.LoadChatChannels();

	if (signal(SIGINT, CatchSignal) == SIG_ERR)	{
		_log(CHANNELS__ERROR, "Could not set signal handler");
		return 0;
	}
	if (signal(SIGTERM, CatchSignal) == SIG_ERR)	{
		_log(CHANNELS__ERROR, "Could not set signal handler");
		return 0;
	}

	while(RunLoops) {

		Timer::SetCurrentTime();

		CL->Process();

		if(ChannelListProcessTimer.Check())
			ChannelList->Process();

		timeout_manager.CheckTimeouts();

		Sleep(100);
	}

	ChannelList->RemoveAllChannels();

	CL->CloseAllConnections();

}

void UpdateWindowTitle(char* iNewTitle) {
#ifdef WIN32
        char tmp[500];
        if (iNewTitle) {
                snprintf(tmp, sizeof(tmp), "World: %s", iNewTitle);
        }
        else {
                snprintf(tmp, sizeof(tmp), "World");
        }
        SetConsoleTitle(tmp);
#endif
}
