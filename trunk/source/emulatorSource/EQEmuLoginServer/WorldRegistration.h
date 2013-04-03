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

#if !defined(_L__WORLDREG__H)
#define _L__WORLDREG__H

#include "../common/debug.h"
#include "../common/servertalk.h"

#include "RuntimeCredential.h"

#include <string>
using namespace std;

class WorldRegistration : public RuntimeCredential {
private:
	bool _isRegisteredServer;
	bool _isAuthorized;
	uint32 _serverID;
	string _serverTagDescription;
	uint32 _serverListTypeID;
	int32 _uniqueRuntimeID;
	// The members that follow can hold values which originate from outside the system
	string _longServerName;
	string _shortServerName;
	string _accountName;
	string _accountPassword;
	string _publicIPAddress;
	string _localIPAddress;
	string _protocolVersion;
	string _serverVersion;
	uint32 _serverTypeID;

public:
	WorldRegistration();
	uint32 GetServerID() { return _serverID; };
	string GetServerTagDescription() { return _serverTagDescription; };
	uint32 GetServerListTypeID() { return _serverListTypeID; };
	string GetLongServerName() { return _longServerName; };
	string GetShortServerName() { return _shortServerName; };
	string GetPublicIPAddress() { return _publicIPAddress; };
	string GetLocalIPAddress() { return _localIPAddress; };
	string GetAccountName() { return _accountName; };
	string GetAccountPassword() { return _accountPassword; };
	string GetProtocolVersion() { return _protocolVersion; };
	string GetServerVersion() { return _serverVersion; };
	uint32 GetServerTypeID() { return _serverTypeID; };
	int32 GetUniqueRuntimeID() { return _uniqueRuntimeID; };
	bool SetServerID(uint32 serverID);
	bool SetServerTagDescription(string serverTagDescription);
	bool SetServerListTypeID(uint32 serverListTypeID);
	bool SetLongServerName(string longServerName);
	bool SetShortServerName(string shortServerName);
	bool SetAccountName(string accountName);
	bool SetAccountPassword(string accountPassword);
	void SetUniqueRuntimeID(int32 uniqueRuntimeID) { _uniqueRuntimeID = uniqueRuntimeID; };
	bool SetPublicIPAddress(string publicIPAddress);
	bool SetLocalIPAddress(string localIPAddress);
	bool SetProtocolVersion(string protocolVersion);
	bool SetServerVersion(string serverVersion);
	bool SetServerTypeID(uint32 serverTypeID);
	bool IsRegisteredServer();
	bool IsAuthorized() { return _isAuthorized; };
	bool IsSameAccount(string accountName, string accountPassword);
	void SetAuthorized(bool isAuthorized) { _isAuthorized = isAuthorized; };
	bool Fill(ServerNewLSInfo_Struct *serverLSInfo);
	string GetServerListDisplayName();
};

#endif
