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

#include "LoginMain.h"
#include "SecurityLibrary.h"
#include <iostream>

TimeoutManager timeout_manager;

volatile bool RunLoops = true;

Clientlist *CL;
Serverlist *SL;
IniFile inifile;
SecurityLibrary EQCrypto;

void CatchSignal(int sig_num) 
{
	printf("caught signal %i\n", sig_num);
	// This is here because we can't link without it (due to all the core EQEmu stuff we are using).
}

using namespace std;
int main() {
	UpdateWindowTitle(0);

	cout << "EQEmuLoginServer" << endl << endl;

	inifile.Load("eqemulogin.ini");
	cout << "  Using Port: " << inifile.PortNumber << endl;

	if(inifile.DumpPacketsIn) 
		cout << "  Dumping Inbound packets." << endl;

	if(inifile.DumpPacketsOut) 
		cout << "  Dumping Outbound packets." << endl;

	if(inifile.Trace)
		cout << "  Tracing ON." << endl;

	cout << "  Database Server: " << inifile.DBServerName << endl;
	cout << "  Database Catalog: " << inifile.DBCatalogName << endl;

#ifdef _DEBUG
	cout << "  Database UserName: " << inifile.DBUserName << endl;
	cout << "  Database Password: " << inifile.DBPassword << endl;
#endif

	cout << endl << endl;

	if(!EQCrypto.LoadCrypto())
	{
		cout << "Security Module Load Failed." << endl;
	}

	CL = new Clientlist;
	SL = new Serverlist;

	while(RunLoops) {
		Timer::SetCurrentTime();

		CL->Process();
		SL->Process();

		Sleep(100);
	}

}

void UpdateWindowTitle(char* iNewTitle) {
#ifdef WIN32
        char tmp[500];
        if (iNewTitle) {
                snprintf(tmp, sizeof(tmp), "EQEmu Login Server: %s", iNewTitle);
        }
        else {
                snprintf(tmp, sizeof(tmp), "EQEmu Login Server");
        }
		SetConsoleTitle(tmp);

#endif
}
