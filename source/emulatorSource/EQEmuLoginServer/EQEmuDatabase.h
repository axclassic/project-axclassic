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

#if !defined(_L__EQDATAB__H)
#define _L__EQDATAB__H

#include "../common/debug.h"
#include "../common/MiscFunctions.h"

#include <mysql.h>
#include <stdlib.h>

#include <string>
using std::string;

#include <sstream>
using std::ostringstream;

using namespace std;

#include <ctime>
#include <iostream>

#pragma comment ( lib, "libmysql" )

class EQEmuDatabase 
{
public:
	EQEmuDatabase(string serverName, string databaseName, string dbUsername, string dbPassword);

	void SetDBUsername(string dbUsername) { _dbUsername = dbUsername; }
	void SetDBPassword(string dbPassword) { _dbPassword = dbPassword; }
	void SetDatabaseName(string databaseName) { _databaseName = databaseName; }
	void SetServerName(string serverName) { _serverName = serverName; }
	string GetDBUsername() const { return _dbUsername; }
	string GetDBPassword() const { return _dbPassword; }
	string GetDatabaseName() const { return _databaseName; }
	string GetServerName() const { return _serverName; }

	bool GetLoginDataByLSAccountName(string lsAccountName, string &accountPassword, uint32 &lsAccountID);
	bool GetWorldServerRegistrationInfo(string longServerName, string shortServerName, 
		uint32 &serverID, string &serverTagDesc, uint32 &serverListTypeID, string &serverListTypeDesc, 
		string &accountName, string &accountPassword);
	void UpdateLSAccountData(uint32 lsAccountID, string lastIPAddress);
	void UpdateWorldServerRegistration(uint32 serverID, string serverIP);
	bool TestDBConnection();

protected:
	string _dbUsername;
	string _dbPassword;
	string _databaseName;
	string _serverName;
	MYSQL *_mysql;

};

#endif
