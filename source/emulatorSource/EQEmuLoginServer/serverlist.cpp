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

#include "serverlist.h"

extern IniFile inifile;

Serverlist::Serverlist() {
	UniqueServerID = 1;

	char errbuf[TCPConnection_ErrorBufferSize];

	KeepAliveTimer = new Timer(5000);

	tcps = new EmuTCPServer(inifile.PortNumber,true);

	if (tcps->Open(inifile.PortNumber, errbuf)) {
		printf("Server (TCP) listener started.\n");
	}
	else {
		printf("Failed to start zone (TCP) listener on port %-4i\n", inifile.PortNumber);
		printf("        %s\n",errbuf);
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

void Serverlist::Process() {
	EmuTCPConnection *tcpc = 0;

	RemoveDisconnectedWorldServers();

	while ((tcpc = tcps->NewQueuePop())) {
		struct in_addr in;
		in.s_addr = tcpc->GetrIP();

#ifdef _DEBUG
		cout << "Total World Server TCP Connections is " << ServerConnections.size() << "." << endl;
		cout << "Total World Server Registrations is " << EQServers.size() << "." << endl;
#endif
		printf("New Server TCP connection from %s:%d\n", inet_ntoa(in),tcpc->GetrPort()); fflush(stdout);

		tcpc->SetPacketMode(EmuTCPConnection::packetModeLogin);

		EmuTCPConnection *TempEmuTCPConn = 0;
		TempEmuTCPConn = FindWorldServer(tcpc->GetrIP());

		if(TempEmuTCPConn == 0)
			ServerConnections.push_back(tcpc);
		else {
			// TODO: Check if the old object was actually removed.
			// TODO: Why shouldnt server server's IP Address + First report Port expressed as a uint32 not be the "unique server id"?
			uint32 TempIPAddress = tcpc->GetrIP();

			cout << "World Server at IP " << TempIPAddress << " is attempting to reconnect." << endl;

			if(RemoveWorldServer(tcpc))
				cout << "Removed TCP connection for world server at IP " << TempIPAddress << "." << endl;
			else
				cout << "WARNING: Unable to remove TCP connection for world server at IP " << TempIPAddress << "." << endl;

			if(RemoveServerEntry(tcpc->GetrIP()))
				cout << "Removed World Registration Entry for world server at IP " << TempIPAddress << "." << endl;
			else
				cout << "WARNING: Unable to remove World Registration Entry for world server at IP " << TempIPAddress << "." << endl;
	
			ServerConnections.push_back(tcpc);
			
			TempEmuTCPConn = 0;
			TempEmuTCPConn = FindWorldServer(TempIPAddress);

			if(TempEmuTCPConn)
				cout << "World Server at IP " << TempIPAddress << " has been successfully re-inserted to network connection list." << endl;
			else
				cout << "WARNING: Unable to re-insert world server at IP " << TempIPAddress << " to network connection list." << endl;
		}
	}


	bool SendKeepAlive= false;

	if(KeepAliveTimer->Check()) {
		SendKeepAlive = true;
	}

	list<EmuTCPConnection*>::iterator Iterator;

	for(Iterator = ServerConnections.begin(); Iterator != ServerConnections.end(); Iterator++) {
		if((*Iterator)->GetState() > 100) {
			if(inifile.Trace) 
				printf("Removing server connection with state %i\n", (*Iterator)->GetState());

			(*Iterator)->Free();
			Iterator = ServerConnections.erase(Iterator);
			if(Iterator == ServerConnections.end())
				break;

			continue;
		}

		if(SendKeepAlive) {
			
			ServerPacket* pack = new ServerPacket(ServerOP_KeepAlive);
			(*Iterator)->SendPacket(pack);
			safe_delete(pack);

		}

		ServerPacket* SP = 0;

		while((SP = (*Iterator)->PopPacket())) {
			if(inifile.Trace)
				printf("Received server Opcode: %8X, Size: %i\n", SP->opcode, SP->size);

			if(inifile.DumpPacketsIn)
				DumpPacket(SP);

			switch(SP->opcode) {
				case ServerOP_NewLSInfo: {
					ServerNewLSInfo_Struct* SLIS = (ServerNewLSInfo_Struct*)SP->pBuffer;
					if(inifile.Trace) {
						printf("ServerOP_LSInfo: ");
						printf("  Name: %s ", SLIS->name);
						printf(" Short: %s ", SLIS->shortname);
						printf(" RAddr: %s ", SLIS->remote_address);
						printf(" LAddr: %s ", SLIS->local_address);
						printf("  Acc : %s ", SLIS->account);
						printf("   Pwd: %s ", SLIS->password);
						printf("  Prot: %s ", SLIS->protocolversion);
						printf("    SV: %s ", SLIS->serverversion);
						printf("  Type: %i\n", SLIS->servertype);
					}

					WorldRegistration *NewWorldReq = new WorldRegistration();
					if(NewWorldReq->Fill(SLIS)) {
						uint32 ServerID = 0;
						string ServerTagDescription;
						uint32 ServerListTypeID = 0;
						string ServerListTypeDescription; // TODO: I probably will remove this
						string AccountName;
						string AccountPassword;

						if(NewWorldReq->GetAccountName().length() > 0 && NewWorldReq->GetAccountPassword().length() > 0) {
							// Request to login as a registered server (Legends or Preferred Server)
							bool RetrievedWorldRegData = false;
							try {
								RetrievedWorldRegData = _db->GetWorldServerRegistrationInfo(NewWorldReq->GetLongServerName(), NewWorldReq->GetShortServerName(), ServerID, ServerTagDescription, ServerListTypeID, ServerListTypeDescription, AccountName, AccountPassword);
							}
							catch(std::exception &Ex) {
								cout << "Error getting world registration from database. The error message is: " << Ex.what() << endl;
							}

							if(RetrievedWorldRegData) {
								if(NewWorldReq->IsSameAccount(AccountName, AccountPassword)) {
									// This is an authorized registered server now...
									NewWorldReq->SetServerID(ServerID);
									NewWorldReq->SetServerTagDescription(ServerTagDescription);
									NewWorldReq->SetServerListTypeID(ServerListTypeID);

									if(NewWorldReq->IsRegisteredServer())
										NewWorldReq->SetAuthorized(true);
									else {
										printf("Server failed world registration, is not a registered server.\n");
										// Something in the world registration object's data didnt pass this last validation step

										// TODO: Log the fact we have declined to allow this server onto the serverlist.
									}
								}
								else {
									printf("Server failed world registration, user and pass do not match.\n");
									// This is an unauthorized, but registered server

									// TODO: Log the fact we have declined to allow this server onto the serverlist.
								}
							}
							else {
								printf("Server failed world registration, failed to get world data from the database.\n");
								// if we get here it is most likely because this request has no sql record as a registered server so we are not going to authorize
								// Let this server remain unauthorized and do not show on serverlist

								// TODO: Log the fact we have declined to allow this server onto the serverlist.
							}
						}
						else {
							printf("Server logging in as unregistered...\n");
							// Request to login as a Standard server (unregistered)

							// TODO: Check to make sure there isn't already another standard server on the serverlist with the same name

							// Set this server to be listed on the serverlist as a Standard server.
							NewWorldReq->SetServerListTypeID(3);
							NewWorldReq->SetAuthorized(true);
						}

						if(NewWorldReq->IsAuthorized()) {
							// TODO: record the IP address from (*Iterator)-> instead of what the IP the world server reported.
							_db->UpdateWorldServerRegistration(NewWorldReq->GetServerID(), NewWorldReq->GetPublicIPAddress());
							printf("***Adding server: %s\n", NewWorldReq->GetLongServerName().c_str());
							AddServer((*Iterator), NewWorldReq);
						}
						else {
							printf("Server failed world registration, Server not Authorized...\n");

							// If we decline to show a server on the serverlist it is because of some type of malformed data we couldn't validate

							// TODO: Log the fact we have declined to allow this server onto the serverlist.
						}
					}

					break;
				}
				// TODO: Deprecate this packet in WORLD
				//case ServerOP_LSInfo: {
				//	ServerLSInfo_Struct* SLIS = (ServerLSInfo_Struct*)SP->pBuffer;

				//	if(inifile.Trace) {
				//		printf("ServerOP_LSInfo: ");
				//		printf("  Name: %s ", SLIS->name);
				//		printf("  Addr: %s ", SLIS->address);
				//		printf("  Acc : %s ", SLIS->account);
				//		printf("   Pwd: %s ", SLIS->password);
				//		printf("  Prot: %s ", SLIS->protocolversion);
				//		printf("    SV: %s ", SLIS->serverversion);
				//		printf("  Type: %i\n", SLIS->servertype);
				//	}

				//	// AddServer((*Iterator), SLIS);

				//	break;

				//}

				case ServerOP_LSStatus: {
					ServerLSStatus_Struct* SLS = (ServerLSStatus_Struct*)SP->pBuffer;

					if(inifile.Trace) {
						printf("ServerOP_LSStatus: ");
						printf("  Status: %i ", SLS->status);
						printf(" Players: %i ", SLS->num_players);
						printf("   Zones: %i\n", SLS->num_zones);
					}
					UpdateServerStatus((*Iterator)->GetrIP(), SLS);

					break;
				}

				case ServerOP_LSZoneShutdown:
				case ServerOP_LSZoneStart:
				case ServerOP_LSZoneBoot:
				case ServerOP_LSZoneSleep: {
					if(inifile.Trace) 
						printf("Zone Status Update\n");
					break;
				}
					

				default: {
					if(inifile.Trace)
						printf("Unhandled server packet 0x%.4X\n", SP->opcode);
					break;
				}
			}
		}
	}
}

//void Serverlist::AddServer(EmuTCPConnection* ServerConnection, ServerLSInfo_Struct* info) {
//	list<EQServerEntry>::iterator Iterator;
//
//	for(Iterator = EQServers.begin(); Iterator != EQServers.end(); Iterator++) {
//
//		if((*Iterator).IPAddress == ServerConnection->GetrIP()) {
//			if(inifile.Trace)
//				printf("AddServer. Found entry for server already. Deleting\n");
//
//			Iterator = EQServers.erase(Iterator);
//			if(Iterator == EQServers.end())
//				break;
//		}
//	}
//
//	EQServerEntry NewServer;
//	NewServer.UniqueServerID = UniqueServerID++;
//	NewServer.ServerConnection = ServerConnection;
//	NewServer.IPAddress = ServerConnection->GetrIP();
//	strcpy(NewServer.Info.name, info->name);
//	strcpy(NewServer.Info.address, info->address);
//	strcpy(NewServer.Info.account, info->account);
//	strcpy(NewServer.Info.password, info->password);
//	strcpy(NewServer.Info.protocolversion, info->protocolversion);
//	strcpy(NewServer.Info.serverversion, info->serverversion);
//	NewServer.Info.servertype = info->servertype;
//
//	NewServer.Status.status = -1;
//	NewServer.Status.num_players = 0;
//	NewServer.Status.num_zones = 0;
//
//	EQServers.push_back(NewServer);
//}

void Serverlist::AddServer(EmuTCPConnection *serverConnection, WorldRegistration *worldRegistrationInfo) {
	list<EQServerEntry>::iterator Iterator;

	for(Iterator = EQServers.begin(); Iterator != EQServers.end(); Iterator++) {
		if((*Iterator).IPAddress == serverConnection->GetrIP()) {
			if(inifile.Trace)
				printf("AddServer. Found entry for server already. Deleting\n");

			Iterator = EQServers.erase(Iterator);
			if(Iterator == EQServers.end())
				break;
		}
	}

	EQServerEntry NewServer;
	NewServer.IPAddress = serverConnection->GetrIP();
	NewServer.WorldServerReg = worldRegistrationInfo;
	NewServer.WorldServerReg->SetUniqueRuntimeID(UniqueServerID++);
	NewServer.Status.status = -1;
	NewServer.Status.num_players = 0;
	NewServer.Status.num_zones = 0;

	EQServers.push_back(NewServer);
}

void Serverlist::UpdateServerStatus(int32 IPAddress, ServerLSStatus_Struct* Status) {
	list<EQServerEntry>::iterator Iterator;

	for(Iterator = EQServers.begin(); Iterator != EQServers.end(); Iterator++) {
		if((*Iterator).IPAddress == IPAddress) {
			if(inifile.Trace)
				printf("Updating status for server: %s\n", (*Iterator).WorldServerReg->GetLongServerName().c_str());

			(*Iterator).Status.status = Status->status;
			(*Iterator).Status.num_players = Status->num_players;
			(*Iterator).Status.num_zones = Status->num_zones;
			break;
		}
	}
}

void Serverlist::SendServerListPacket(EQStream* Client) {
	list<EQServerEntry>::iterator Iterator;
	int PacketSize = sizeof(ServerListHeader_Struct);
	int NumberOfServers = 0;

	for(Iterator = EQServers.begin(); Iterator != EQServers.end(); Iterator++) {
		PacketSize += strlen((*Iterator).WorldServerReg->GetServerListDisplayName().c_str()) + 1 + 8 + strlen((*Iterator).WorldServerReg->GetPublicIPAddress().c_str()) + 1 + 6 + 8;
		NumberOfServers++;
	}

	if(inifile.Trace)
		printf("Packet Size is %i\n", PacketSize); fflush(stdout);

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_ServerListResponse, PacketSize);
	ServerListHeader_Struct *sl = (ServerListHeader_Struct*)outapp->pBuffer;

	sl->Unknown1 = 0x00000004;
	sl->Unknown2 = 0x00000000;
	sl->Unknown3 = 0x01650000;
	// Don't know what the next field is, but setting it to 0xffffffff crashes the client
	// One of these four unknown fields must control whether the login displays the number of users
	// or just whether the server is UP.
	sl->Unknown4 = 0x00000000;
	sl->NumberOfServers = NumberOfServers;

	char *buf = (char *)sl;
	buf = buf + sizeof(ServerListHeader_Struct);

	for(Iterator = EQServers.begin(); Iterator != EQServers.end(); Iterator++) {
		if(Client->GetRemoteIP() == (*Iterator).IPAddress)
			sprintf(buf, (*Iterator).WorldServerReg->GetLocalIPAddress().c_str());
		else
			sprintf(buf, (*Iterator).WorldServerReg->GetPublicIPAddress().c_str());

		buf = buf + strlen(buf) + 1;
		// The next 32 bit word determines if the server is Normal/Preferred/Legends
		// 1 = Normal, 9 = Preferred, 0x30 = Legends
		if((*Iterator).WorldServerReg->IsRegisteredServer()) {
			if((*Iterator).WorldServerReg->GetServerListTypeID() == 1) {
				// List this server as a Legends Server
				*(uint32*)buf = 0x00000030;
			}
			else if((*Iterator).WorldServerReg->GetServerListTypeID() == 2) {
				// List this server as a Preferred Server
				*(uint32*)buf = 0x00000009;
			}
			else {
				// Standard Server
				*(uint32*)buf = 0x00000001;
			}
		}
		else {
			// List this server as a Standard Server
			*(uint32*)buf = 0x00000001;
		}

		buf += 4;
		*(uint32*)buf = (*Iterator).WorldServerReg->GetUniqueRuntimeID();
		buf += 4;
		sprintf(buf, (*Iterator).WorldServerReg->GetServerListDisplayName().c_str());
		buf = buf + strlen(buf) + 1;
		sprintf(buf, "EN");
		buf += 3;
		sprintf(buf, "US");
		buf += 3;
		// The next field is server status:
		// 0 = Up, 1 = Down, 2 = Up, 3 = down, 4 = locked, 5 = locked(down)
		// So it is a bitfield, bit 0 = Up/Down, bit 2 = locked ?
		// TODO: Check server status and send correct status to the serverlist
		//*(uint32*)buf = (*Iterator).Status.status;
		*(uint32*)buf = 0x00000002;
		buf += 4;
		// The next field is the number of users online
		*(uint32*)buf = (*Iterator).Status.num_players;
		buf += 4;
	}

	if(inifile.DumpPacketsOut)
		DumpPacket(outapp);

	Client->QueuePacket(outapp);
	safe_delete(outapp);

}

void Serverlist::SendUserToWorldRequest(int32 IPAddress, int32 UniqueServerID) {

}

void Serverlist::SendClientAuth(int32 IPAddress, std::string accountName, std::string userKey, uint32 loginServerAccountID, int32 UniqueServerID) {
	// This tells the server to expect a connection from the client.
	// The two key pieces of information are the key, which is generated randomly
	// by the server.
	// As well as the key, the other key piece of information is the ip address

	list<EQServerEntry>::iterator Iterator;

	for(Iterator = EQServers.begin(); Iterator != EQServers.end(); Iterator++) {
		if((*Iterator).WorldServerReg->GetUniqueRuntimeID() == UniqueServerID) {
			EmuTCPConnection* tcpc = FindWorldServer((*Iterator).IPAddress);
		
			if(!tcpc || tcpc->GetState() != 100)
				break;

			ServerPacket *outapp = new ServerPacket(ServerOP_LSClientAuth, sizeof(ServerLSClientAuth));
			ServerLSClientAuth* slsca = (ServerLSClientAuth*)outapp->pBuffer;
			
			slsca->lsaccount_id = (int32)loginServerAccountID;
			strncpy(slsca->name, accountName.c_str(), accountName.length() > 30 ? 30 : accountName.length());
			//strcpy(slsca->name, itoa(loginServerAccountID));
			strncpy(slsca->key, userKey.c_str(), 10);
			slsca->lsadmin = 0;
			slsca->worldadmin = 0;
			slsca->ip = IPAddress;
			slsca->local = 1;
			
			if(inifile.Trace)
				printf("Sending Client Auth\n");

			if(inifile.DumpPacketsOut)
				DumpPacket(outapp);

			tcpc->SendPacket(outapp);
			safe_delete(outapp);
		}
	}
}

EmuTCPConnection *Serverlist::FindWorldServer(const uint32 serverIPAddress) {
	EmuTCPConnection *Result = 0;

	if(serverIPAddress > 0) {
		list<EmuTCPConnection*>::iterator Iterator;

		for(Iterator = ServerConnections.begin(); Iterator != ServerConnections.end(); Iterator++) {
			if((*Iterator)->GetrIP() == serverIPAddress) {
				Result = *Iterator;
				break;
			}
		}
	}

	return Result;
}

bool Serverlist::RemoveWorldServer(const EmuTCPConnection *worldServerTCPConnection) {
	bool Result = false;

	if(worldServerTCPConnection) {
		list<EmuTCPConnection*>::iterator Iterator;

		for(Iterator = ServerConnections.begin(); Iterator != ServerConnections.end(); Iterator++) {
			if(*Iterator == worldServerTCPConnection) {
				(*Iterator)->Free();
				Iterator = ServerConnections.erase(Iterator);
				Result = true;
				break;
			}
		}
	}

	return Result;
}

void Serverlist::RemoveDisconnectedWorldServers() {
	list<EmuTCPConnection*>::iterator Iterator;

	for(Iterator = ServerConnections.begin(); Iterator != ServerConnections.end(); Iterator++) {
		if(!(*Iterator)->Connected()) {
			// NOTE: Can't remove the server entry object here based on the IP Address as on a disconnect, the IP now is 0.
			// RemoveServerEntry((*Iterator)->GetrIP());
			Iterator = ServerConnections.erase(Iterator);
			if(Iterator == ServerConnections.end())
				break;
		}
	}
}

EQServerEntry *Serverlist::FindServerEntry(const uint32 serverIPAddress) {
	EQServerEntry *Result = 0;

	list<EQServerEntry>::iterator Iterator;

	for(Iterator = EQServers.begin(); Iterator != EQServers.end(); Iterator++) {
		if((*Iterator).IPAddress == serverIPAddress) {
			Result = &(*Iterator);
			break;
		}
	}

	return Result;
}

bool Serverlist::RemoveServerEntry(const uint32 serverIPAddress) {
	bool Result = false;

	list<EQServerEntry>::iterator Iterator;

	for(Iterator = EQServers.begin(); Iterator != EQServers.end(); Iterator++) {
		if((*Iterator).IPAddress == serverIPAddress) {
			Iterator = EQServers.erase(Iterator);
			Result = true;
			break;
		}
	}
	
	return Result;
}
