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
#include "MailConfig.h"
//#include <sys/socket.h>
//#include <netinet/in.h>
//#include <arpa/inet.h>
#include <list>

volatile bool RunLoops = true;
TimeoutManager          timeout_manager;

Clientlist *CL;

Database database;

string WorldShortName;
RuleManager *rules = new RuleManager();

void CatchSignal(int sig_num) {
	// This is here because we can't link without it (due to all the core EQEmu stuff we are using).
}

string GetMailPrefix() {

	return "SOE.EQ." + WorldShortName + ".";

}

int main() {

	_log(MAIL__INIT, "Starting EQEmu MailServer");

	if (!MailConfig::LoadConfig()) {
		_log(MAIL__INIT, "Loading server configuration failed.");
		return(1);
	}
	const MailConfig *Config=MailConfig::get();

	if(!load_log_settings(Config->LogSettingsFile.c_str()))
		_log(MAIL__INIT, "Warning: Unable to read %s", Config->LogSettingsFile.c_str());
	else
		_log(MAIL__INIT, "Log settings loaded from %s", Config->LogSettingsFile.c_str());

	WorldShortName = Config->ShortName;

	_log(MAIL__INIT, "Connecting to MySQL...");

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
			_log(MAIL__ERROR, "Failed to load ruleset '%s', falling back to defaults.", tmp);
		}
	} else {
		if(!rules->LoadRules(&database, "default")) {
			_log(MAIL__INIT, "No rule set configured, using default rules");
		} else {
			_log(MAIL__INIT, "Loaded default rule set 'default'", tmp);
		}
	}

	if(!RuleB(Mail, EnableMailSystem)) {
		_log(MAIL__ERROR, "Rule Mail:EnableMailSystem is set to false. Exiting.");
		return(1);
	}

	database.ExpireMail();

	CL = new Clientlist(Config->MailPort);

	while(RunLoops) {
		Timer::SetCurrentTime();

		CL->Process();

		timeout_manager.CheckTimeouts();

		Sleep(100);
	}

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
