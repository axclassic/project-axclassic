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

#if !defined(_L__AUTHCRED__H)
#define _L__AUTHCRED__H

#include "../common/debug.h"

#include <ctime>
#include <string>
using namespace std;

class AuthCredential {
private:
	string _accountUserName;
	uint32 _accountID;
	uint32 _ipAddress;
	uint16 _port;
	time_t _createTime;
	string _key;
	
	void SetCreateTime(time_t CreateTime);
public:
	AuthCredential();
	void SetAccountUserName(string AccountUserName) { this->_accountUserName = AccountUserName; };
	string GetAccountUserName() { return this->_accountUserName; };
	void SetAccountID(uint32 AccountID) { this->_accountID = AccountID; };
	uint32 GetAccountID() { return this->_accountID; };
	void SetIPAddress(uint32 IPAddress) { this->_ipAddress = IPAddress; };
	uint32 GetIPAddress() { return this->_ipAddress; };
	void SetPort(uint16 Port) { this->_port = Port; };
	uint16 GetPort() { return this->_port; };
	time_t GetCreateTime() { return this->_createTime; };
	void AddCredential(string AccountUserName, uint32 AccountID, uint32 IPAddress, uint16 Port);
	std::string GetKey() { return this->_key; }
	void GenerateKey();
};

#endif
