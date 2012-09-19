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

#include "clientlist.h"
#include "SecurityLibrary.h"
#include <iostream>
using namespace std;

extern IniFile inifile;
extern Serverlist *SL;
extern SecurityLibrary EQCrypto;

Clientlist::Clientlist() {
	eqsf = new EQStreamFactory(LoginStream, inifile.PortNumber);
	OpMgr = new RegularOpcodeManager;

	if(!OpMgr->LoadOpcodes(inifile.OPCodePathAndFileName.c_str()))
		exit(1);

	if (eqsf->Open()) {
		_log(WORLD__LS,"Client (UDP) listener started.");
	} else {
		_log(WORLD__LS_ERR,"Failed to start client (UDP) listener (port %-4i)", inifile.PortNumber);
		exit(1);
	}

	_db = new EQEmuDatabase(inifile.DBServerName, inifile.DBCatalogName, inifile.DBUserName, inifile.DBPassword);

	try {
		if(!_db->TestDBConnection()) {
			_log(WORLD__LS_ERR, "Unable to connect to the specified database server. (%s/%s using login account name %s)", _db->GetServerName().c_str(), _db->GetDatabaseName().c_str(), _db->GetDBUsername().c_str());
			throw new std::exception((const std::exception&)"Unable to access accounts table from the specified database. Verify tblLoginServerAccounts table is correct.");
		}
	}
	catch(std::exception &Ex) {
		throw new std::exception(Ex);
	}
}

void Clientlist::Process() {
	EQStream *eqs;

	while(eqs = eqsf->Pop()) {
		struct in_addr in;
		in.s_addr = eqs->GetRemoteIP();

		printf("New Client UDP connection from %s:%d\n", inet_ntoa(in),ntohs(eqs->GetRemotePort())); fflush(stdout);

		eqs->SetOpcodeManager(&OpMgr);
		ClientConnections.push_back(eqs);
	}

	list<EQStream*>::iterator Iterator;

	for(Iterator = ClientConnections.begin(); Iterator != ClientConnections.end(); Iterator++) {
		if((*Iterator)->CheckClosed()) {
			if(inifile.Trace)
				printf("Client connection closed.\n");

			list<AuthCredential*>::iterator CredentialIterator;

			for(CredentialIterator = _credentials.begin(); CredentialIterator != _credentials.end(); CredentialIterator++) {
				if((*CredentialIterator)->GetIPAddress() == (*Iterator)->GetRemoteIP() && (*CredentialIterator)->GetPort() == (*Iterator)->GetRemotePort()) {
					uint32 LoginServerID = (*CredentialIterator)->GetAccountID();
					std::string UserName = (*CredentialIterator)->GetAccountUserName();

					CredentialIterator = _credentials.erase(CredentialIterator);

#ifdef _DEBUG
					cout << "Removed Credential for account " << LoginServerID << "." << endl;
					cout << "There are " << _credentials.size() << " credential record(s)." << endl;
					_log(WORLD__LS, "Removing AuthCredential record for %s (%u)", UserName.c_str(), LoginServerID);
#endif
					
				}

				if(CredentialIterator == _credentials.end())
					break;
			}

			Iterator = ClientConnections.erase(Iterator);
			if(Iterator == ClientConnections.end())
				break;

			continue;
		}

		EQApplicationPacket *app = 0;

		while( (app = (EQApplicationPacket *)(*Iterator)->PopPacket())) {
			if(inifile.DumpPacketsIn)
				DumpPacket(app);

			EmuOpcode opcode = app->GetOpcode();

			if(inifile.Trace)
				printf("Client OPCode: %8X Received\n", opcode); fflush(stdout);

			switch(opcode) {
				case OP_SessionReady: {
					if(inifile.Trace)
						printf("OP_Session_Ready\n");

					const char *ChatMessage = "ChatMessage";
					EQApplicationPacket *outapp = new EQApplicationPacket(OP_ChatMessage, sizeof(LoginChatMessage_Struct) + strlen(ChatMessage));
					LoginChatMessage_Struct* lcms = (LoginChatMessage_Struct *)outapp->pBuffer;
						
					lcms->Unknown0 = 0x0002;
					lcms->Unknown1 = 0x00000000;
					lcms->Unknown2 = 0x01000000;
					lcms->Unknown3 = 0x00000065;
					lcms->Unknown4 = 0x00;
					sprintf(lcms->ChatMessage, ChatMessage);

					if(inifile.DumpPacketsOut)
						DumpPacket(outapp);

					(*Iterator)->QueuePacket(outapp);
					safe_delete(outapp);

					break;
				}

				case OP_Login: {
					if(inifile.Trace)
						printf("OP_Login\n");

					if(inifile.DumpPacketsIn)
						DumpPacket(app);

					if((app->Size()-12) % 8 != 0)
					{
						printf("Login Auth was invalid, size needs to be 12 + data divisible by 64 bits.\n");
					}
					
					bool AccountFound = false;
					std::string UserName;
					std::string PassHash;
					uint32 LSAccountID = 0;
					std::string LSAccountPassword;

					char *CryptoBuffer = EQCrypto.DecryptUsernamePassword((const char*)app->pBuffer, app->Size(), 5);
					PassHash.assign(CryptoBuffer, strlen(CryptoBuffer));
					UserName.assign(CryptoBuffer+strlen(CryptoBuffer)+1, strlen(CryptoBuffer+strlen(CryptoBuffer)+1));

					printf("User: %s\n", UserName.c_str());
					printf("Hash: %s\n", PassHash.c_str());

					if((AccountFound  = _db->GetLoginDataByLSAccountName(UserName, LSAccountPassword, LSAccountID) == false)) 
					{
						printf("Could not find user %s\n", UserName.c_str());
					}

					// TODO: clean up the code block below.
					if(strcmp(PassHash.c_str(), LSAccountPassword.c_str()) == 0) {
						AuthCredential* NewAuth = new AuthCredential();
						NewAuth->AddCredential(UserName, LSAccountID, (*Iterator)->GetRemoteIP(), (*Iterator)->GetRemotePort());
						_credentials.push_back(NewAuth);
#ifdef _DEBUG
						cout << "Creating credential for account " << NewAuth->GetAccountID() << "." << endl;
						cout << "There are " << _credentials.size() << " credential record(s)." << endl;
#endif

						ostringstream TempIPAddress;
						uint32 TempUIntIpAddress = (*Iterator)->GetRemoteIP();
						TempIPAddress << (TempUIntIpAddress & 0xff) << '.' << ((TempUIntIpAddress >> 8) & 0xff) << '.' << ((TempUIntIpAddress >> 16) & 0xff) << '.' << ((TempUIntIpAddress >> 24) & 0xff) << endl;

						_db->UpdateLSAccountData(LSAccountID, TempIPAddress.str());

						EQApplicationPacket *outapp = new EQApplicationPacket(OP_LoginAccepted, 10+80);
						if(inifile.Trace)	
							printf("Output packet size is %i\n", outapp->size);

						LoginLoginRequest_Struct* llrs = (LoginLoginRequest_Struct *)app->pBuffer;
						LoginLoginAccepted_Struct* llas = (LoginLoginAccepted_Struct *)outapp->pBuffer;
						llas->unknown1 = llrs->unknown1;
						llas->unknown2 = llrs->unknown2;
						llas->unknown3 = llrs->unknown3;
						llas->unknown4 = llrs->unknown4;
						llas->unknown5 = llrs->unknown5;
						//llas->unknown6 = 0x00;

						Login_ReplyBlock_Struct * lrbs = new Login_ReplyBlock_Struct;
						memset(lrbs, 0, sizeof(Login_ReplyBlock_Struct));

						lrbs->failed_attempts = 0;
						lrbs->message = 0x01;
						lrbs->lsid = LSAccountID;

						lrbs->unknown3[3] = 0x03;
						lrbs->unknown4[3] = 0x02;
						lrbs->unknown5[0] = 0xe7;
						lrbs->unknown5[1] = 0x03;

						lrbs->unknown6[0] = 0xff;
						lrbs->unknown6[0] = 0xff;
						lrbs->unknown6[0] = 0xff;
						lrbs->unknown6[0] = 0xff;

						lrbs->unknown7[0] = 0xa0;
						lrbs->unknown7[1] = 0x05;

						lrbs->unknown8[3] = 0x02;

						lrbs->unknown9[0] = 0xff;
						lrbs->unknown9[1] = 0x03;

						lrbs->unknown11[0] = 0x63;
						lrbs->unknown12[0] = 0x01;

						NewAuth->GenerateKey();
						memcpy(lrbs->key, NewAuth->GetKey().c_str(), NewAuth->GetKey().size());

						unsigned int enc_size;
						char * enc = EQCrypto.Encrypt((const char*)lrbs, 75, enc_size);
						memcpy(llas->encrypt, enc, 80);

						EQCrypto.DeleteHeap(enc);
						if(inifile.DumpPacketsOut)
							DumpPacket(outapp);

						(*Iterator)->QueuePacket(outapp);
						safe_delete(outapp);
					}
					else {
						// Incorrect userid/password message to client
						EQApplicationPacket *outapp = new EQApplicationPacket(OP_LoginAccepted, sizeof(LoginLoginFailed_Struct));
						if(inifile.Trace)	
							printf("Output packet size is %i\n", outapp->size);

						LoginLoginRequest_Struct* llrs = (LoginLoginRequest_Struct *)app->pBuffer;
						LoginLoginFailed_Struct* llas = (LoginLoginFailed_Struct *)outapp->pBuffer;
						llas->unknown1 = llrs->unknown1;
						llas->unknown2 = llrs->unknown2;
						llas->unknown3 = llrs->unknown3;
						llas->unknown4 = llrs->unknown4;
						llas->unknown5 = llrs->unknown5;
						memcpy(llas->unknown6, FailedLoginResponseData, sizeof(FailedLoginResponseData));

						if(inifile.DumpPacketsOut)
							DumpPacket(outapp);

						(*Iterator)->QueuePacket(outapp);
						safe_delete(outapp);
					}
					EQCrypto.DeleteHeap(CryptoBuffer);
					break;
				}

				case OP_ServerListRequest: {
					if(inifile.Trace)
						printf("SERVER LIST Request\n\n");

					SL->SendServerListPacket(*Iterator);
					break;
				}

				case OP_PlayEverquestRequest: {
					if(inifile.Trace)
						printf("PLAY EVERQUEST Request\n");

					if(inifile.DumpPacketsIn)
						DumpPacket(app);

					EQApplicationPacket *outapp = new EQApplicationPacket(OP_PlayEverquestResponse, sizeof(PlayEverquestResponse_Struct));
					PlayEverquestRequest_Struct *PlayReq = (PlayEverquestRequest_Struct*)app->pBuffer;
					PlayEverquestResponse_Struct *peqrs = (PlayEverquestResponse_Struct*)outapp->pBuffer;
					peqrs->Unknown1 = 0x00000005;
					peqrs->Unknown2 = 0x00000000;
					peqrs->Unknown3 = 0x65010000;
					peqrs->Unknown4 = 0x00000000;
					peqrs->Unknown5 = 0x00000001;

					if(inifile.Trace)
						printf("Sending PLAY EVERQUEST Response\n");

					if(inifile.DumpPacketsOut)
						DumpPacket(outapp);

					(*Iterator)->QueuePacket(outapp);
					safe_delete(outapp);

					std::string UserName;
					std::string UserKey;
					uint32 LoginServerID = 0;
					list<AuthCredential*>::iterator CredentialIterator;

					for(CredentialIterator = _credentials.begin(); CredentialIterator != _credentials.end(); CredentialIterator++) {
						if((*CredentialIterator)->GetIPAddress() == (*Iterator)->GetRemoteIP() && (*CredentialIterator)->GetPort() == (*Iterator)->GetRemotePort()) {
							UserName = (*CredentialIterator)->GetAccountUserName();
							LoginServerID = (*CredentialIterator)->GetAccountID();
							UserKey = (*CredentialIterator)->GetKey();
							CredentialIterator = _credentials.erase(CredentialIterator);
#ifdef _DEBUG
							cout << "Removed Credential for account " << LoginServerID << "." << endl;
							cout << "There are " << _credentials.size() << " credential record(s)." << endl;
							_log(WORLD__LS, "Removing AuthCredential record for %s (%u)", UserName.c_str(), LoginServerID);
#endif
							break;
						}

						if(CredentialIterator == _credentials.end())
							break;
					}

					// TODO: The line below was for minilogin
					// SL->SendClientAuth((*Iterator)->GetRemoteIP(), PlayReq->ServerNumber);

					SL->SendClientAuth((*Iterator)->GetRemoteIP(), UserName, UserKey, LoginServerID, PlayReq->ServerNumber);

					break;
				}

				default: {
					//if(inifile.Trace)
					printf("Unhandled incoming opcode 0x%.4X\n", (int16)opcode);
					DumpPacket(app);
					break;
				}
			}
		}
	}
}
