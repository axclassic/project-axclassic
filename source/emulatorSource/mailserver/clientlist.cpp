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
#include "../common/MiscFunctions.h"

#include "clientlist.h"
#include "database.h"

#include "../common/EQStreamFactory.h"
#include "../common/EmuTCPConnection.h"
#include "../common/EmuTCPServer.h"
#include <list>
#include <vector>
#include <string>
#include <cstdlib>
#include <algorithm>

using namespace std;

extern Database database;
extern string WorldShortName;
extern string GetMailPrefix();

Clientlist::Clientlist(int MailPort) {

	mailsf = new EQStreamFactory(MailStream, MailPort);
	MailOpMgr = new RegularOpcodeManager;

	if(!MailOpMgr->LoadOpcodes("mail_opcodes.conf"))
		exit(1);

	if (mailsf->Open()) {
		_log(MAIL__INIT,"Client (UDP) Mail listener started on port %i.", MailPort);
	} else {
		_log(MAIL__ERROR,"Failed to start client (UDP) listener (port %-4i)", MailPort);
		exit(1);
	}
}


vector<string> ParseRecipients(string RecipientString) {

	// This method parses the Recipient List in the mailto command, which can look like this example:
	//
	// "Baalinor <SOE.EQ.BTG2.Baalinor>, 
	// -Friends <SOE.EQ.BTG2.Playedtest SOE.EQ.BTG2.Dyetest>, 
	// Guild <SOE.EQ.BTG2.Dsfvxcbcx SOE.EQ.BTG2.Necronor>, SOE.EQ.BTG2.luccerathe, SOE.EQ.BTG2.codsas
	//
	// First, it splits it up at commas, so it looks like this:
	//
	// Baalinor <SOE.EQ.BTG2.Baalinor>
	// -Friends <SOE.EQ.BTG2.Playedtest SOE.EQ.BTG2.Dyetest>
	// Guild <SOE.EQ.BTG2.Dsfvxcbcx SOE.EQ.BTG2.Necronor>
	// SOE.EQ.BTG2.luccerathe
	// SOE.EQ.BTG2
	//
	// Then, if an entry has a '<' in it, it extracts the text between the < and >
	// If the text between the < and > has a space in it, then there are multiple addresses in there, so those are extracted.
	//
	// The prefix (SOE.EQ.<Shortname>) is discarded, the names are normalised so they begin with a single upper case character
	// followed by lower case.
	//
	// The vector is sorted and any duplicates discarded, so the vector we return, in our example, looks like this:
	//
	// Baalinor
	// -Playedtest
	// -Dyetest
	// Dsfvxcbcx
	// Necronor
	// Luccerathe
	// Codsas
	//
	// The '-' prefix indicates 'Secret To' (like BCC:)
	//
	vector<string> RecipientList;

	string Secret;

	string::size_type CurrentPos, Comma, FirstLT, LastGT, Space, LastPeriod;

	CurrentPos = 0;

	while(CurrentPos != string::npos) {

		Comma = RecipientString.find_first_of(",", CurrentPos);

		if(Comma == string::npos) {

			RecipientList.push_back(RecipientString.substr(CurrentPos));

			break;
		}
		RecipientList.push_back(RecipientString.substr(CurrentPos, Comma - CurrentPos));

		CurrentPos = Comma + 2;
	}

	vector<string>::iterator Iterator;

	Iterator = RecipientList.begin();

	while(Iterator != RecipientList.end()) {

		if((*Iterator)[0] == '-') {

			Secret = "-";

			while((*Iterator)[0] == '-')
				(*Iterator) = (*Iterator).substr(1);
		}
		else
			Secret = "";

		FirstLT = (*Iterator).find_first_of("<");

		if(FirstLT != string::npos) {

			LastGT = (*Iterator).find_last_of(">");

			if(LastGT != string::npos) {

				(*Iterator) = (*Iterator).substr(FirstLT + 1, LastGT - FirstLT - 1);

				if((*Iterator).find_first_of(" ") != string::npos) {

					string Recips = (*Iterator);

					RecipientList.erase(Iterator);

					CurrentPos = 0;

					while(CurrentPos != string::npos) {

						Space = Recips.find_first_of(" ", CurrentPos);

						if(Space == string::npos) {

							RecipientList.push_back(Secret + Recips.substr(CurrentPos));

							break;
						}
						RecipientList.push_back(Secret + Recips.substr(CurrentPos, 
									Space - CurrentPos));
						CurrentPos = Space + 1;
					}
					Iterator = RecipientList.begin();

					continue;
				}
			}
		}

		
		(*Iterator) = Secret + (*Iterator);
				
		Iterator++;

	}

	for(Iterator = RecipientList.begin(); Iterator != RecipientList.end(); Iterator++) {

		if((*Iterator).length() > 0) {

			if((*Iterator)[0] == '-')
				Secret = "-";
			else
				Secret = "";

			LastPeriod = (*Iterator).find_last_of(".");

			if(LastPeriod != string::npos)  {

				(*Iterator) = (*Iterator).substr(LastPeriod + 1);
			
				for(unsigned int i = 0; i < (*Iterator).length(); i++) {

					if(i == 0)
						(*Iterator)[i] = toupper((*Iterator)[i]);
					else
						(*Iterator)[i] = tolower((*Iterator)[i]);
				}

				(*Iterator) = Secret + (*Iterator);
			}
		}

	}

	sort(RecipientList.begin(), RecipientList.end());

	vector<string>::iterator new_end_pos = unique(RecipientList.begin(), RecipientList.end());

	RecipientList.erase(new_end_pos, RecipientList.end());

	return RecipientList;

}

static void ProcessMailTo(Client *c, const char *inbuf) {

	_log(MAIL__TRACE, "MAILTO: From %s, %s", c->MailBoxName().c_str(), inbuf);
		
	vector<string> Recipients;

	string MailMessage = inbuf;

	string::size_type FirstQuote = MailMessage.find_first_of("\"", 0);

	string::size_type NextQuote = MailMessage.find_first_of("\"", FirstQuote + 1);

	string RecipientsString = MailMessage.substr(FirstQuote+1, NextQuote-FirstQuote - 1);

	Recipients = ParseRecipients(RecipientsString);

	// Now extract the subject field. This is in quotes if it is more than one word
	//
	string Subject;

	string::size_type SubjectStart = NextQuote + 2;

	string::size_type SubjectEnd;

	if(MailMessage.substr(SubjectStart, 1) == "\"") {

		SubjectEnd = MailMessage.find_first_of("\"", SubjectStart + 1);

		Subject = MailMessage.substr(SubjectStart + 1, SubjectEnd - SubjectStart - 1);

		SubjectEnd += 2;

	}
	else {
		SubjectEnd = MailMessage.find_first_of(" ", SubjectStart);

		Subject = MailMessage.substr(SubjectStart, SubjectEnd - SubjectStart);

		SubjectEnd++;

	}
	string Body = MailMessage.substr(SubjectEnd);

	bool Success = true;

	RecipientsString.clear();

	int VisibleRecipients = 0;

	for(unsigned int i = 0; i<Recipients.size(); i++) {

		if(Recipients[i][0] == '-') {

			Recipients[i] = Recipients[i].substr(1);

		}
		else {
			if(VisibleRecipients > 0)

				RecipientsString += ", ";

			VisibleRecipients++;

			RecipientsString = RecipientsString + GetMailPrefix() + Recipients[i];
		}
	}
	if(VisibleRecipients == 0)
		RecipientsString = "<UNDISCLOSED RECIPIENTS>";

	for(unsigned int i=0; i<Recipients.size(); i++) {

		if(!database.SendMail(Recipients[i], c->MailBoxName(), Subject, Body, RecipientsString)) {

			_log(MAIL__ERROR, "Failed in SendMail(%s, %s, %s, %s)", Recipients[i].c_str(),
					  c->MailBoxName().c_str(), Subject.c_str(), RecipientsString.c_str());

			int PacketLength = 10 + Recipients[i].length() + Subject.length();

			// Failure
			EQApplicationPacket *outapp = new EQApplicationPacket(OP_MailDeliveryStatus, PacketLength);

			char *PacketBuffer = (char *)outapp->pBuffer;

			VARSTRUCT_ENCODE_STRING(PacketBuffer, "1");
			VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0x20);
			VARSTRUCT_ENCODE_STRING(PacketBuffer, Recipients[i].c_str());
			VARSTRUCT_ENCODE_STRING(PacketBuffer, Subject.c_str());
			VARSTRUCT_ENCODE_STRING(PacketBuffer, "0");
			VARSTRUCT_ENCODE_TYPE(uint16, PacketBuffer, 0x3237);
			VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0x0);

			_pkt(MAIL__PACKETS, outapp);

			c->QueuePacket(outapp);

			safe_delete(outapp);

			Success = false;
		}
	}
						
	if(Success) {
		// Success
		EQApplicationPacket *outapp = new EQApplicationPacket(OP_MailDeliveryStatus, 10);

		char *PacketBuffer = (char *)outapp->pBuffer;

		VARSTRUCT_ENCODE_STRING(PacketBuffer, "1");
		VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0);
		VARSTRUCT_ENCODE_STRING(PacketBuffer, "test"); // Doesn't matter what we send in this text field.
		VARSTRUCT_ENCODE_STRING(PacketBuffer, "1");

		_pkt(MAIL__PACKETS, outapp);

		c->QueuePacket(outapp);

		safe_delete(outapp);
	}


}
void Clientlist::Process() {

	EQStream *eqs;

	while((eqs = mailsf->Pop())) {

		struct in_addr  in;

		in.s_addr = eqs->GetRemoteIP();

		_log(MAIL__CLIENT, "New Client UDP Mail connection from %s:%d", inet_ntoa(in), ntohs(eqs->GetRemotePort()));

		eqs->SetOpcodeManager(&MailOpMgr);

		Client *c = new Client(eqs);

		ClientMailConnections.push_back(c);
	}

	list<Client*>::iterator Iterator;

	for(Iterator = ClientMailConnections.begin(); Iterator != ClientMailConnections.end(); Iterator++) {

		if((*Iterator)->ClientStream->CheckClosed()) {

			struct in_addr  in;

			in.s_addr = (*Iterator)->ClientStream->GetRemoteIP();

			_log(MAIL__CLIENT, "Client connection from %s:%d closed.", inet_ntoa(in),
										   ntohs((*Iterator)->ClientStream->GetRemotePort()));
			
			safe_delete((*Iterator));

			Iterator = ClientMailConnections.erase(Iterator);

			if(Iterator == ClientMailConnections.end())
				break;

			continue;
		}

		EQApplicationPacket *app = 0;

		bool KeyValid = true;

		while( KeyValid && (app = (EQApplicationPacket *)(*Iterator)->ClientStream->PopPacket())) {

			_pkt(MAIL__PACKETS, app);

			EmuOpcode opcode = app->GetOpcode();

			switch(opcode) {

				case OP_MailLogin: {

					char *PacketBuffer = (char *)app->pBuffer;

					char MailBox[64];

					char Key[64];

					VARSTRUCT_DECODE_STRING(MailBox, PacketBuffer);

					// Check to see if we are running with a version of world that inserts a Connection Type
					// indicator at the start of the mailkey, and skip past it if so.
					if(strlen(PacketBuffer) == 9)
						PacketBuffer++;

					VARSTRUCT_DECODE_STRING(Key, PacketBuffer);

					string MailBoxString = MailBox, CharacterName;

					// Strip off the SOE.EQ.<shortname>.
					//
					string::size_type LastPeriod = MailBoxString.find_last_of(".");

					if(LastPeriod == string::npos)
						CharacterName = MailBoxString;
					else
						CharacterName = MailBoxString.substr(LastPeriod + 1);

					_log(MAIL__TRACE, "Received login for mailbox %s with key %s", MailBox, Key);

					if(!database.VerifyMailKey(CharacterName, (*Iterator)->ClientStream->GetRemoteIP(), Key)) {

						_log(MAIL__ERROR, "Mail Key for %s does not match, closing connection.", MailBox);

						KeyValid = false;

						break;
					}

					database.FindAccount(CharacterName.c_str(), (*Iterator));

					(*Iterator)->SendMailBoxes();

					CheckForStaleConnections((*Iterator));

					break;
				}

				case OP_Mail: {
					const char *inbuf = (const char*)app->pBuffer;

					if((app->size >= 11) && !strncmp(inbuf, "getheaders", 10)) { // getheaders

						database.SendHeaders((*Iterator));

					}
					else if((app->size >= 8) && !strncmp(inbuf, "getbody", 7)) {

							string GetBodyCommand = inbuf;

							database.SendBody((*Iterator), atoi(GetBodyCommand.substr(8).c_str()));
					}
					else if((app->size >= 7) && !strncmp(inbuf, "mailto", 6)) {

							ProcessMailTo((*Iterator), inbuf);
					}
					else if((app->size >= 17) && !strncmp(inbuf, "setmessagestatus", 16)) {

						int MessageNumber;

						int Status;

						string SetMessageCommand = inbuf;

						switch(SetMessageCommand[17]) {

							case 'R': // READ
								Status = 3;
								break;

							case 'T': // TRASH
								Status = 4;
								break;

							default: // DELETE
								Status = 0;

						}
						string::size_type NumStart = SetMessageCommand.find_first_of("123456789", 18);

						while(NumStart != string::npos) {

							string::size_type NumEnd = SetMessageCommand.find_first_of(" ", NumStart);

							if(NumEnd == string::npos) {

								MessageNumber = atoi(SetMessageCommand.substr(NumStart).c_str());

								database.SetMessageStatus(MessageNumber, Status);

								break;
							}

							MessageNumber = atoi(SetMessageCommand.substr(NumStart, NumEnd-NumStart).c_str());

							database.SetMessageStatus(MessageNumber, Status);

							NumStart = SetMessageCommand.find_first_of("123456789", NumEnd);
						}
					}
					else if((app->size >= 14) && !strncmp(inbuf, "selectmailbox", 13)) {

						string SelectMailBoxCommand = inbuf;

						string::size_type NumStart = SelectMailBoxCommand.find_first_of("0123456789", 13);

						int MailBoxNumber = atoi(SelectMailBoxCommand.substr(NumStart).c_str());

						_log(MAIL__TRACE, "%s Change to mailbox %i", (*Iterator)->MailBoxName().c_str(), MailBoxNumber);

						(*Iterator)->SetMailBox(MailBoxNumber);

						_log(MAIL__TRACE, "New mailbox is %s", (*Iterator)->MailBoxName().c_str());
						
						EQApplicationPacket *outapp = new EQApplicationPacket(OP_MailboxChange, 2);

						char *buf = (char *)outapp->pBuffer;

						VARSTRUCT_ENCODE_INTSTRING(buf, MailBoxNumber);
						
						_pkt(MAIL__PACKETS, outapp);

						(*Iterator)->QueuePacket(outapp);

						safe_delete(outapp);
					}
					else if((app->size >= 18) && !strncmp(inbuf, "setmailforwarding", 17)) {
						// This is sent to turn mail forwarding to your Station email account on/off
						// Not implemented.
						_log(MAIL__TRACE, "Unimplemented command: %s", inbuf);
					}
					else
						_log(MAIL__ERROR, "Unhandled OP_Mail command: %s", inbuf);

					break;
				}

				default: {
					_log(MAIL__ERROR, "Unhandled mail opcode %8X", opcode);
					break;
				}
			}
			safe_delete(app);

		}
		if(!KeyValid) {
			(*Iterator)->ClientStream->Close();

			safe_delete((*Iterator));

			Iterator = ClientMailConnections.erase(Iterator);

			if(Iterator == ClientMailConnections.end())
				break;
		}

	}

}

void Client::AddCharacter(const char *CharacterName) {

	string s = CharacterName;

	Characters.push_back(s);
}

void Client::SendMailBoxes() {

	int Count = Characters.size();

	int PacketLength = 9;

	string s;
	
	for(int i = 0; i < Count; i++) {

		s += GetMailPrefix() + Characters[i];

		if(i != (Count - 1))
			s = s + ",";
	}

	PacketLength += s.length() + 1;

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_MailLogin, PacketLength);

	char *PacketBuffer = (char *)outapp->pBuffer;

	VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 1);
	VARSTRUCT_ENCODE_TYPE(uint32, PacketBuffer, Count);
	VARSTRUCT_ENCODE_TYPE(uint32, PacketBuffer, 0);

	VARSTRUCT_ENCODE_STRING(PacketBuffer, s.c_str());

	_pkt(MAIL__PACKETS, outapp);

	QueuePacket(outapp);

	safe_delete(outapp);
}

int Client::GetMailBoxNumber(string CharacterName) {

	for(unsigned int i = 0; i < Characters.size(); i++)
		if(Characters[i] == CharacterName)
			return i;

	return -1;
}

Client *Clientlist::IsCharacterOnline(string CharacterName) {

	// This method is used to determine if the character we are a sending an email to is connected to the mailserver,
	// so we can send them a new email notification.
	//
	// The way live works is that it sends a notification if a player receives an email for their 'primary' mailbox,
	// i.e. for the character they are logged in as, or for the character whose mailbox they have selected in the
	// mail window.
	//
	list<Client*>::iterator Iterator;

	for(Iterator = ClientMailConnections.begin(); Iterator != ClientMailConnections.end(); Iterator++) {

		int MailBoxNumber = (*Iterator)->GetMailBoxNumber(CharacterName);

		// If the mail is destined for the primary mailbox for this character, or the one they have selected
		//
		if((MailBoxNumber == 0) || (MailBoxNumber == (*Iterator)->GetMailBoxNumber())) 
				return (*Iterator);

	}

	return NULL;
}

void Client::SendNotification(int MailBoxNumber, string Subject, string From, int MessageID) {

	char TimeStamp[100];

	char sMessageID[100];

	char Sequence[100];
	
	sprintf(TimeStamp, "%i", (int)time(NULL));

	sprintf(sMessageID, "%i", MessageID);

	sprintf(Sequence, "%i", 1);

	int PacketLength = 8 + strlen(sMessageID) + strlen(TimeStamp)+ From.length() + Subject.length();

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_MailNew, PacketLength);

	char *PacketBuffer = (char *)outapp->pBuffer;

	VARSTRUCT_ENCODE_INTSTRING(PacketBuffer, MailBoxNumber);
	VARSTRUCT_ENCODE_STRING(PacketBuffer, sMessageID);
	VARSTRUCT_ENCODE_STRING(PacketBuffer, TimeStamp);
	VARSTRUCT_ENCODE_STRING(PacketBuffer, "1"); 
	VARSTRUCT_ENCODE_STRING(PacketBuffer, From.c_str()); 
	VARSTRUCT_ENCODE_STRING(PacketBuffer, Subject.c_str());

	_pkt(MAIL__PACKETS, outapp);

	QueuePacket(outapp);

	safe_delete(outapp);
}

void Clientlist::CheckForStaleConnections(Client *c) {

	if(!c) return;

	list<Client*>::iterator Iterator;

	for(Iterator = ClientMailConnections.begin(); Iterator != ClientMailConnections.end(); Iterator++) {

		if(((*Iterator) != c) && (c->GetName() == (*Iterator)->GetName())) {

			_log(MAIL__CLIENT, "Removing old connection for %s", c->GetName().c_str());

			struct in_addr  in;

			in.s_addr = (*Iterator)->ClientStream->GetRemoteIP();

			_log(MAIL__CLIENT, "Client connection from %s:%d closed.", inet_ntoa(in),
										   ntohs((*Iterator)->ClientStream->GetRemotePort()));
			
			safe_delete((*Iterator));

			Iterator = ClientMailConnections.erase(Iterator);
		}
	}
}
