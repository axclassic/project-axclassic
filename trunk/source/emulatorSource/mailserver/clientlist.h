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

#ifndef MAILSERVER_CLIENTLIST_H
#define MAILSERVER_CLIENTLIST_H

#include "../common/opcodemgr.h"
#include "../common/EQStreamType.h"
#include "../common/EQStreamFactory.h"
#include "../common/rulesys.h"
#include <list>
#include <vector>

class Client {

public:
	Client(EQStream* eqs) { ClientStream = eqs; CurrentMailBox = 0; }
	~Client() { ClientStream->ReleaseFromUse(); }

	EQStream *ClientStream;
	void AddCharacter(const char *CharacterName);
	void ClearCharacters() { Characters.clear(); }
	string GetName() { if(Characters.size()) return Characters[0]; else return ""; }
	void SendMailBoxes();
	int GetMailBoxNumber() { return CurrentMailBox; }
	int GetMailBoxNumber(string CharacterName);
	string MailBoxName() { return Characters[CurrentMailBox]; }
	void SendNotification(int MailBoxNumber, string From, string Subject, int MessageID);
	void SetMailBox(int NewMailBox) { CurrentMailBox = NewMailBox; }
	inline void QueuePacket(const EQApplicationPacket *p, bool ack_req=true) { ClientStream->QueuePacket(p, ack_req); }

private:
	int CurrentMailBox;
	vector<string> Characters;
};

class Clientlist {

public:
	Clientlist(int MailPort);
	void	Process();
	Client *IsCharacterOnline(string CharacterName);
	void CheckForStaleConnections(Client *c);

private:
	EQStreamFactory *mailsf;

	list<Client*> ClientMailConnections;

	OpcodeManager *MailOpMgr;
};

#endif
