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

#include "WorldRegistration.h"

WorldRegistration::WorldRegistration() {
	_serverID = 0;
	_serverListTypeID = 0;
	_uniqueRuntimeID = 0;
	_serverTypeID = 0;
	_isAuthorized = false;
	_isRegisteredServer = false;
}

bool WorldRegistration::SetPublicIPAddress(string publicIPAddress) {
	bool Result = false;
	const int32 MaxInternetIPLengthAsString = 15;

	if(publicIPAddress.length() > 0 && publicIPAddress.length() <= MaxInternetIPLengthAsString) {
		// TODO: More Validation Checking Goes Here
		_publicIPAddress.assign(publicIPAddress);

		Result = true;
	}

	return Result;
}

bool WorldRegistration::SetLocalIPAddress(std::string localIPAddress) {
	bool Result = false;
	const int32 MaxInternetIPLengthAsString = 15;

	if(localIPAddress.length() > 0 && localIPAddress.length() <= MaxInternetIPLengthAsString) {
		// TODO: More Validation Checking Goes Here
		_localIPAddress.assign(localIPAddress);

		Result = true;
	}

	return Result;
}

bool WorldRegistration::SetProtocolVersion(std::string protocolVersion) {
	bool Result = false;

	if(protocolVersion.length() > 0) {
		// TODO: More Validation Checking Goes Here
		_protocolVersion.assign(protocolVersion);

		Result = true;
	}

	return Result;
}

bool WorldRegistration::SetServerVersion(std::string serverVersion) {
	bool Result = false;

	if(serverVersion.length() > 0) {
		// TODO: More Validation Checking Goes Here
		_serverVersion.assign(serverVersion);

		Result = true;
	}

	return Result;
}

bool WorldRegistration::SetServerTypeID(uint32 serverTypeID) {
	bool Result = false;

	if(serverTypeID > 0) {
		// TODO: More Validation Checking Goes Here
		_serverTypeID = serverTypeID;

		Result = true;
	}

	return Result;
}

bool WorldRegistration::SetAccountName(std::string accountName) {
	bool Result = false;

	if(accountName.length() > 0) {
		// TODO: More Validation Checking Goes Here
		// TODO: Research what our official max accountname length is and what are valid characters
		_accountName.assign(accountName);

		Result = true;
	}

	return Result;
}

bool WorldRegistration::SetAccountPassword(std::string accountPassword) {
	bool Result = false;

	if(accountPassword.length() > 0) {
		// TODO: More Validation Checking Goes Here
		// TODO: Research what our official max accountPassword length is and what are valid characters
		_accountPassword.assign(accountPassword);

		Result = true;
	}

	return Result;
}

bool WorldRegistration::SetLongServerName(std::string longServerName) {
	bool Result = false;
	const int32 MaxWorldServerLongNameAllowed = 100;

	if(longServerName.length() > 0 && longServerName.length() <= MaxWorldServerLongNameAllowed) {
		// TODO: More Validation Checking Goes Here
		// TODO: Research what our official max longservername length is and what are valid characters
		_longServerName.assign(longServerName);

		Result = true;
	}

	return Result;
}

bool WorldRegistration::SetShortServerName(std::string shortServerName) {
	bool Result = false;
	const int32 MaxWorldServerShortNameAllowed = 100;

	if(shortServerName.length() > 0 && shortServerName.length() <= MaxWorldServerShortNameAllowed) {
		// TODO: More Validation Checking Goes Here
		// TODO: Research what our official max shortservername length is and what are valid characters
		_shortServerName.assign(shortServerName);

		Result = true;
	}

	return Result;
}

bool WorldRegistration::SetServerTagDescription(std::string serverTagDescription) {
	bool Result = false;
	const int32 MaxServerTagDescAllowed = 100;

	if(serverTagDescription.length() > 0 && serverTagDescription.length() <= MaxServerTagDescAllowed) {
		// TODO: More Validation Checking Goes Here
		// TODO: Research what our official max ServerTagDesc length is and what are valid characters
		_serverTagDescription.assign(serverTagDescription);

		Result = true;
	}

	return Result;
}

bool WorldRegistration::SetServerID(uint32 serverID) {
	bool Result = false;

	if(serverID > 0) {
		// TODO: More Validation Checking Goes Here
		_serverID = serverID;

		Result = true;
	}

	return Result;
}

bool WorldRegistration::SetServerListTypeID(uint32 serverListTypeID) {
	bool Result = false;

	if(serverListTypeID > 0) {
		// TODO: More Validation Checking Goes Here
		_serverListTypeID = serverListTypeID;

		Result = true;
	}

	return Result;
}

bool WorldRegistration::Fill(ServerNewLSInfo_Struct *serverLSInfo) {
	bool Result = false;

	if(serverLSInfo) {
		SetLongServerName(string(serverLSInfo->name));
		SetShortServerName(string(serverLSInfo->shortname));
		SetPublicIPAddress(string(serverLSInfo->remote_address));
		SetLocalIPAddress(string(serverLSInfo->local_address));
		SetAccountName(string(serverLSInfo->account));
		SetAccountPassword(string(serverLSInfo->password));
		SetProtocolVersion(string(serverLSInfo->protocolversion));
		SetServerVersion(string(serverLSInfo->serverversion));
		SetServerTypeID(serverLSInfo->servertype);

		// TODO: Return TRUE only after validation checks pass for each value

		Result = true;
	}

	return Result;
}

bool WorldRegistration::IsRegisteredServer() {
	bool Result = false;

	// TODO: Implement enumeration for serverlisttypeid
	// 1 = Legends 2 = Preferred 3 = Standard
	if((_serverListTypeID == 1 || _serverListTypeID == 2 || _serverListTypeID == 3) && _serverID > 0) {
		if(_accountName.length() > 0 && _accountPassword.length() > 0)
			Result = true;
	}

	return Result;
}

bool WorldRegistration::IsSameAccount(std::string accountName, std::string accountPassword) {
	bool Result = false;

	if(_accountName == accountName && _accountPassword == accountPassword) {
		Result = true;
	}

	return Result;
}

std::string WorldRegistration::GetServerListDisplayName() {
	string Result;

	if(GetServerTagDescription().length() > 0)
		Result.assign(GetLongServerName() + " (" + GetServerTagDescription() + ")");
	else
		Result.assign(GetLongServerName());

	return Result;
}