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

#if !defined(_L__CLELIST__H)
#define _L__CLELIST__H

#include "../common/debug.h"
#include "../common/opcodemgr.h"
#include "../common/EQStreamType.h"
#include "../common/EQStreamFactory.h"

#include "serverlist.h"
#include "LoginMain.h"
#include "inifile.h"
#include "AuthCredential.h"
#include "EQEmuDatabase.h"


#include <list>

class Clientlist {

public:
	Clientlist();
	void Process();

private:
	EQStreamFactory *eqsf;
	list<EQStream*> ClientConnections;
	OpcodeManager *OpMgr;
	list<AuthCredential*> _credentials;
	EQEmuDatabase* _db;
};

#endif
