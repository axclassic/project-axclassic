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

#include "EQEmuDatabase.h"

EQEmuDatabase::EQEmuDatabase(std::string ServerName, std::string DatabaseName, std::string DBUsername, std::string DBPassword) {
	SetServerName(ServerName);
	SetDatabaseName(DatabaseName);
	SetDBUsername(DBUsername);
	SetDBPassword(DBPassword);

	_mysql = mysql_init(NULL);
	if(_mysql)
	{
		if (!mysql_real_connect(_mysql, GetServerName().c_str(), GetDBUsername().c_str(), 
			GetDBPassword().c_str(), GetDatabaseName().c_str(), 0, NULL, 0)) 
		{
			cout << "MYSQL CONNECT FAILED: " << endl;
			cout << GetServerName() << endl;
			cout << GetDBUsername() << endl;
			cout << GetDBPassword() << endl;
			cout << GetDatabaseName() << endl;
		}
	}
}

bool EQEmuDatabase::GetLoginDataByLSAccountName(std::string LSAccountName, std::string &AccountPassword, uint32 &LSAccountID) {
	bool Result = false;
	
	if(!_mysql)
	{
		cout << "NOT CONNECTED TO MYQSL: " << endl;
		return false;
	}

	MYSQL_RES *res;
	MYSQL_ROW row;
	char * mQuery = 0;
	MakeAnyLenString(&mQuery, "SELECT LoginServerID, AccountPassword FROM tblLoginServerAccounts WHERE AccountName = '%s'", LSAccountName.c_str());
	if (mysql_query(_mysql, mQuery)) 
	{
		safe_delete_array(mQuery);
		cout << "Query failed: " << mQuery << endl;
		return false;
	}
	safe_delete_array(mQuery);

	res = mysql_use_result(_mysql);

	if(res)
	{
		while ((row = mysql_fetch_row(res)) != NULL)
		{
			LSAccountID = atoi(row[0]);
			AccountPassword = row[1];
			mysql_free_result(res);
			return true;
		}
	}

	return Result;
}

void EQEmuDatabase::UpdateLSAccountData(uint32 LSAccountID, std::string LastIPAddress) {
	if(!_mysql)
	{
		cout << "NOT CONNECTED TO MYQSL: " << endl;
		return;
	}

	char * mQuery = 0;
	MakeAnyLenString(&mQuery, "UPDATE tblLoginServerAccounts SET LastIPAddress = '%s', LastLoginDate = now() where LoginServerID = %u", LastIPAddress.c_str(), LSAccountID);
	if (mysql_query(_mysql, mQuery)) 
	{
		cout << "Query failed: " << mQuery << endl;
	}
	safe_delete_array(mQuery);
	return;
}

bool EQEmuDatabase::TestDBConnection() {
	if(!_mysql)
	{
		cout << "NOT CONNECTED TO MYQSL: " << endl;
		return false;
	}

	MYSQL_RES *res;
	char * mQuery = 0;
	MakeAnyLenString(&mQuery, "SELECT COUNT(*) FROM tblLoginServerAccounts");
	if (mysql_query(_mysql, mQuery)) 
	{
		safe_delete_array(mQuery);
		cout << "Query failed: " << mQuery << endl;
		return false;
	}
	safe_delete_array(mQuery);

	res = mysql_use_result(_mysql);
	mysql_free_result(res);
	return true;
}

bool EQEmuDatabase::GetWorldServerRegistrationInfo(std::string longServerName, 
		std::string shortServerName, uint32 &serverID, std::string &serverTagDesc, 
		uint32 &serverListTypeID, std::string &serverListTypeDesc, std::string &accountName, 
		std::string &accountPassword) 
{
	bool result = false;
	if(!_mysql)
	{
		cout << "NOT CONNECTED TO MYQSL: " << endl;
		return false;
	}

	MYSQL_RES *res;
	MYSQL_ROW row;
	char * mQuery = 0;
	MakeAnyLenString(&mQuery, "SELECT WSR.ServerID, WSR.ServerTagDescription, SLT.ServerListTypeID, "
		"SLT.ServerListTypeDescription, SAR.AccountName, SAR.AccountPassword FROM tblWorldServerRegistration"
		" AS WSR JOIN tblServerListType AS SLT ON WSR.ServerListTypeID = SLT.ServerListTypeID JOIN "
		"tblServerAdminRegistration AS SAR ON WSR.ServerAdminID = SAR.ServerAdminID WHERE WSR.ServerLongName"
		" = '%s' AND WSR.ServerShortName = '%s'", longServerName.c_str(), shortServerName.c_str()); 
	if (mysql_query(_mysql, mQuery)) 
	{
		safe_delete_array(mQuery);
		cout << "Query failed: " << mQuery << endl;
		return false;
	}
	safe_delete_array(mQuery);

	res = mysql_use_result(_mysql);
	if(res)
	{
		while ((row = mysql_fetch_row(res)) != NULL)
		{
			serverID = atoi(row[0]);
			serverTagDesc.clear();
			serverTagDesc.append(row[1]);
			serverListTypeID = atoi(row[2]);
			serverListTypeDesc.clear();
			serverListTypeDesc.append(row[3]);
			accountName.clear();
			accountName.append(row[4]); 
			accountPassword.clear();
			accountPassword.append(row[5]);
			result = true;
		}
	}
	return result;
}

void EQEmuDatabase::UpdateWorldServerRegistration(uint32 serverID, std::string serverIP) 
{
	if(!_mysql)
	{
		cout << "NOT CONNECTED TO MYQSL: " << endl;
		return;
	}

	char * mQuery = 0;
	MakeAnyLenString(&mQuery, "UPDATE tblWorldServerRegistration SET ServerLastLoginDate = now(), ServerLastIPAddr = '%s' where ServerID = %u", serverIP,  serverID);
	if (mysql_query(_mysql, mQuery)) 
	{
		safe_delete_array(mQuery);
		cout << "Query failed: " << mQuery << endl;
	}
	safe_delete_array(mQuery);
	return;	
}