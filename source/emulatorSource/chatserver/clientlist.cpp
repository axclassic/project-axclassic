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
#include "chatchannel.h"

#include "../common/EQStreamFactory.h"
#include "../common/EmuTCPConnection.h"
#include "../common/EmuTCPServer.h"
#include <list>
#include <vector>
#include <string>
#include <cstdlib>

using namespace std;

extern Database database;
extern string WorldShortName;
extern string GetMailPrefix();
extern ChatChannelList *ChannelList;
extern Clientlist *CL;

int LookupCommand(const char *ChatCommand) {

	if(!ChatCommand) return -1;

	for(int i = 0; i < CommandEndOfList; i++) {

		if(!strcasecmp(Commands[i].CommandString, ChatCommand))
			return Commands[i].CommandCode;
	}

	return -1;
}

void SendUptime(Client *c) {

	if(!c) return;

	int32 ms = Timer::GetCurrentTime();
	int32 d = ms / 86400000;
	ms -= d * 86400000;
	int32 h = ms / 3600000;
	ms -= h * 3600000;
	int32 m = ms / 60000;
	ms -= m * 60000;
	int32 s = ms / 1000;

	char Buffer[200];

	sprintf(Buffer, "Chat Channel server has been up for %02id %02ih %02im %02is", d, h, m, s);

	c->GeneralChannelMessage(Buffer);
}

Clientlist::Clientlist(int ChatPort) {

	chatsf = new EQStreamFactory(ChatStream, ChatPort);

	ChatOpMgr = new RegularOpcodeManager;

	if(!ChatOpMgr->LoadOpcodes("mail_opcodes.conf"))
		exit(1);

	if (chatsf->Open())
		_log(CHANNELS__INIT,"Client (UDP) Chat listener started on port %i.", ChatPort);
	else {
		_log(CHANNELS__ERROR,"Failed to start client (UDP) listener (port %-4i)", ChatPort);

		exit(1);
	}
}

Client::Client(EQStream *eqs) {

	ClientStream = eqs; 

	CurrentMailBox = 0;

	Announce = false;

	Status = 0;

	HideMe = 0;

	AccountID = 0;

	AllowInvites = true;

	for(int i = 0; i < MAX_JOINED_CHANNELS ; i++)
		JoinedChannels[i] = NULL;

	TotalKarma = 0;
	AttemptedMessages = 0;
	ForceDisconnect = false;

	KarmaGrabUpdateTimer = new Timer(120000); //check every 2 minutes
	GlobalChatLimiterTimer = new Timer(RuleI(Chat, IntervalDurationMS));
}

Client::~Client() {

	CloseConnection();

	LeaveAllChannels(false);

	if(KarmaGrabUpdateTimer)
	{
		delete KarmaGrabUpdateTimer;
		KarmaGrabUpdateTimer = NULL;
	}

	if(GlobalChatLimiterTimer)
	{
		delete GlobalChatLimiterTimer;
		GlobalChatLimiterTimer = NULL;
	}
}

void Client::CloseConnection() {

	ClientStream->RemoveData();

	ClientStream->Close();

	ClientStream->ReleaseFromUse();
}

void Clientlist::CheckForStaleConnections(Client *c) {

	if(!c) return;

	list<Client*>::iterator Iterator;

	for(Iterator = ClientChatConnections.begin(); Iterator != ClientChatConnections.end(); Iterator++) {

		if(((*Iterator) != c) && (c->GetName() == (*Iterator)->GetName())) {

			_log(CHANNELS__CLIENT, "Removing old connection for %s", c->GetName().c_str());

			struct in_addr  in;

			in.s_addr = (*Iterator)->ClientStream->GetRemoteIP();

			_log(CHANNELS__CLIENT, "Client connection from %s:%d closed.", inet_ntoa(in),
										   ntohs((*Iterator)->ClientStream->GetRemotePort()));
			
			safe_delete((*Iterator));

			Iterator = ClientChatConnections.erase(Iterator);
		}
	}
}

void Clientlist::Process() {

	EQStream *eqs;

	while((eqs = chatsf->Pop())) {

		struct in_addr  in;

		in.s_addr = eqs->GetRemoteIP();

		_log(CHANNELS__CLIENT, "New Client UDP Chat connection from %s:%d", inet_ntoa(in), ntohs(eqs->GetRemotePort()));

		eqs->SetOpcodeManager(&ChatOpMgr);

		Client *c = new Client(eqs);

		ClientChatConnections.push_back(c);
	}

	list<Client*>::iterator Iterator;

	for(Iterator = ClientChatConnections.begin(); Iterator != ClientChatConnections.end(); Iterator++) {

		(*Iterator)->ProcessKarma();
		if((*Iterator)->ClientStream->CheckClosed()) {

			struct in_addr  in;

			in.s_addr = (*Iterator)->ClientStream->GetRemoteIP();

			_log(CHANNELS__CLIENT, "Client connection from %s:%d closed.", inet_ntoa(in),
										   ntohs((*Iterator)->ClientStream->GetRemotePort()));
			
			safe_delete((*Iterator));

			Iterator = ClientChatConnections.erase(Iterator);

			if(Iterator == ClientChatConnections.end())
				break;

			continue;
		}

		EQApplicationPacket *app = 0;

		bool KeyValid = true;

		while( KeyValid && !(*Iterator)->GetForceDisconnect() &&
		       (app = (EQApplicationPacket *)(*Iterator)->ClientStream->PopPacket())) {

			_pkt(CHANNELS__PACKETS, app);

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

					_log(CHANNELS__TRACE, "Received login for user %s with key %s", MailBox, Key);

					if(!database.VerifyMailKey(CharacterName, (*Iterator)->ClientStream->GetRemoteIP(), Key)) {

						_log(CHANNELS__ERROR, "Chat Key for %s does not match, closing connection.", MailBox);

						KeyValid = false;

						break;
					}

					(*Iterator)->SetAccountID(database.FindAccount(CharacterName.c_str(), (*Iterator)));

					database.GetAccountStatus((*Iterator));

					(*Iterator)->SendMailBoxes();

					CheckForStaleConnections((*Iterator));

					break;
				}

				case OP_Mail: {

					const char *PacketBuffer = (const char*)app->pBuffer;
					
					string CommandString = (const char*)app->pBuffer;

					if(CommandString.length() == 0)
						break;

					if(isdigit(CommandString[0])) {

						(*Iterator)->SendChannelMessageByNumber(CommandString);

						break;
					}

					if(CommandString[0] == '#') {

						(*Iterator)->SendChannelMessage(CommandString);

						break;
					}

					string Command, Parameters;

					string::size_type Space = CommandString.find_first_of(" ");

					if(Space != string::npos) { 

						Command = CommandString.substr(0, Space);

						string::size_type ParametersStart = CommandString.find_first_not_of(" ", Space);

						if(ParametersStart != string::npos)
							Parameters = CommandString.substr(ParametersStart);
					}
					else
						Command = CommandString;

					int CommandCode = LookupCommand(Command.c_str());

					switch(CommandCode) {

						case CommandJoin:
							(*Iterator)->JoinChannels(Parameters);
							break;

						case CommandLeaveAll:
							(*Iterator)->LeaveAllChannels();
							break;

						case CommandLeave:
							(*Iterator)->LeaveChannels(Parameters);
							break;

						case CommandListAll:
							ChannelList->SendAllChannels((*Iterator));
							break;
						
						case CommandList:
							(*Iterator)->ProcessChannelList(Parameters);
							break;

						case CommandSet:
							(*Iterator)->LeaveAllChannels(false);
							(*Iterator)->JoinChannels(Parameters);
							break;

						case CommandAnnounce:
							(*Iterator)->ToggleAnnounce();
							break;

						case CommandSetOwner:
							(*Iterator)->SetChannelOwner(Parameters);
							break;

						case CommandOPList:
							(*Iterator)->OPList(Parameters);
							break;

						case CommandInvite:
							(*Iterator)->ChannelInvite(Parameters);
							break;

						case CommandGrant:
							(*Iterator)->ChannelGrantModerator(Parameters);
							break;

						case CommandModerate:
							(*Iterator)->ChannelModerate(Parameters);
							break;

						case CommandVoice:
							(*Iterator)->ChannelGrantVoice(Parameters);
							break;

						case CommandKick:
							(*Iterator)->ChannelKick(Parameters);
							break;

						case CommandPassword:
							(*Iterator)->SetChannelPassword(Parameters);
							break;
				
						case CommandToggleInvites:
							(*Iterator)->ToggleInvites();
							break;

						case CommandAFK:
							break;

						case CommandUptime:
							SendUptime((*Iterator));
							break;
				
						default:
							(*Iterator)->SendHelp();
							_log(CHANNELS__ERROR, "Unhandled OP_Mail command: %s", PacketBuffer);
					}

					break;
				}

				default: {

					_log(CHANNELS__ERROR, "Unhandled chat opcode %8X", opcode);
					break;
				}
			}
			safe_delete(app);

		}
		if(!KeyValid || (*Iterator)->GetForceDisconnect()) {

			struct in_addr  in;

			in.s_addr = (*Iterator)->ClientStream->GetRemoteIP();

			_log(CHANNELS__TRACE, "Force disconnecting client: %s:%d, KeyValid=%i, GetForceDisconnect()=%i",
					      inet_ntoa(in), ntohs((*Iterator)->ClientStream->GetRemotePort()),
					      KeyValid, (*Iterator)->GetForceDisconnect());

			(*Iterator)->ClientStream->Close();

			safe_delete((*Iterator));

			Iterator = ClientChatConnections.erase(Iterator);

			if(Iterator == ClientChatConnections.end())
				break;
		}

	}

}

void Clientlist::CloseAllConnections() {


	list<Client*>::iterator Iterator;

	for(Iterator = ClientChatConnections.begin(); Iterator != ClientChatConnections.end(); Iterator++) {

		_log(CHANNELS__TRACE, "Removing client %s", (*Iterator)->GetName().c_str());

		(*Iterator)->CloseConnection();
	}
}

void Client::AddCharacter(const char *CharacterName) {

	if(!CharacterName) return;

	string s = CharacterName;

	Characters.push_back(s);
}

void Client::SendMailBoxes() {

	int Count = Characters.size();

	int PacketLength = 10;

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
	VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0);

	_pkt(CHANNELS__PACKETS, outapp);

	QueuePacket(outapp);

	safe_delete(outapp);
}

Client *Clientlist::FindCharacter(string CharacterName) {

	list<Client*>::iterator Iterator;

	for(Iterator = ClientChatConnections.begin(); Iterator != ClientChatConnections.end(); Iterator++) {

		if((*Iterator)->GetName() == CharacterName)
			return ((*Iterator));

	}

	return NULL;
}

void Client::AddToChannelList(ChatChannel *JoinedChannel) {

	if(!JoinedChannel) return;

	for(int i = 0; i < MAX_JOINED_CHANNELS; i++)
		if(JoinedChannels[i] == NULL) {
			JoinedChannels[i] = JoinedChannel;
			_log(CHANNELS__TRACE, "Added Channel %s to slot %i for %s", JoinedChannel->GetName().c_str(), i + 1, GetName().c_str());
			return;
		}
}

void Client::RemoveFromChannelList(ChatChannel *JoinedChannel) {

	for(int i = 0; i < MAX_JOINED_CHANNELS; i++)
		if(JoinedChannels[i] == JoinedChannel) {

			// Shuffle all the channels down. Client likes them all nice and consecutive.
			//
			for(int j = i; j < (MAX_JOINED_CHANNELS - 1); j++)
				JoinedChannels[j] = JoinedChannels[j + 1];

			JoinedChannels[MAX_JOINED_CHANNELS - 1] = NULL;

			break;
		}
}

int Client::ChannelCount() {

	int NumberOfChannels = 0;

	for(int i = 0; i < MAX_JOINED_CHANNELS; i++)
		if(JoinedChannels[i])
			NumberOfChannels++;

	return NumberOfChannels;

}

void Client::JoinChannels(string ChannelNameList) {

	_log(CHANNELS__TRACE, "Client: %s joining channels %s", GetName().c_str(), ChannelNameList.c_str());

	int NumberOfChannels = ChannelCount();

	string::size_type CurrentPos = ChannelNameList.find_first_not_of(" ");

	while(CurrentPos != string::npos) {

		if(NumberOfChannels == MAX_JOINED_CHANNELS) {

			GeneralChannelMessage("You have joined the maximum number of channels. /leave one before trying to join another.");
			
			break;
		}

		string::size_type Comma = ChannelNameList.find_first_of(", ", CurrentPos);

		if(Comma == string::npos) {

			ChatChannel* JoinedChannel = ChannelList->AddClientToChannel(ChannelNameList.substr(CurrentPos), this);

			if(JoinedChannel)
				AddToChannelList(JoinedChannel);

			break;
		}

		ChatChannel* JoinedChannel = ChannelList->AddClientToChannel(ChannelNameList.substr(CurrentPos, Comma-CurrentPos), this);

		if(JoinedChannel) {

			AddToChannelList(JoinedChannel);

			NumberOfChannels++;
		}

		CurrentPos = ChannelNameList.find_first_not_of(", ", Comma);
	}

	string JoinedChannelsList, ChannelMessage;

	ChannelMessage = "Channels: ";

	char tmp[200];

	int ChannelCount = 0;

	for(int i = 0; i < MAX_JOINED_CHANNELS ; i++) {

		if(JoinedChannels[i] != NULL) {

			if(ChannelCount) {

				JoinedChannelsList = JoinedChannelsList + ",";

				ChannelMessage = ChannelMessage + ",";

			}

			JoinedChannelsList = JoinedChannelsList + JoinedChannels[i]->GetName();

			sprintf(tmp, "%i=%s(%i)", i + 1, JoinedChannels[i]->GetName().c_str(), JoinedChannels[i]->MemberCount(Status));

			ChannelMessage += tmp;

			ChannelCount++;
		}
	}


	EQApplicationPacket *outapp = new EQApplicationPacket(OP_Mail, JoinedChannelsList.length() + 1);

	char *PacketBuffer = (char *)outapp->pBuffer;

	sprintf(PacketBuffer, "%s", JoinedChannelsList.c_str());

	_pkt(CHANNELS__PACKETS, outapp);

	QueuePacket(outapp);

	safe_delete(outapp);

	if(ChannelCount == 0)
		ChannelMessage = "You are not on any channels.";

	outapp = new EQApplicationPacket(OP_ChannelMessage, ChannelMessage.length() + 3);

	PacketBuffer = (char *)outapp->pBuffer;

	VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0x00);
	VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0x00);
	VARSTRUCT_ENCODE_STRING(PacketBuffer, ChannelMessage.c_str());

	_pkt(CHANNELS__PACKETS, outapp);

	QueuePacket(outapp);

	safe_delete(outapp);
}

void Client::LeaveChannels(string ChannelNameList) {

	_log(CHANNELS__TRACE, "Client: %s leaving channels %s", GetName().c_str(), ChannelNameList.c_str());

	string::size_type CurrentPos = 0;

	while(CurrentPos != string::npos) {

		string::size_type Comma = ChannelNameList.find_first_of(", ", CurrentPos);

		if(Comma == string::npos) {

			ChatChannel* JoinedChannel = ChannelList->RemoveClientFromChannel(ChannelNameList.substr(CurrentPos), this);

			if(JoinedChannel)
				RemoveFromChannelList(JoinedChannel);

			break;
		}

		ChatChannel* JoinedChannel = ChannelList->RemoveClientFromChannel(ChannelNameList.substr(CurrentPos, Comma-CurrentPos), this);

		if(JoinedChannel)
			RemoveFromChannelList(JoinedChannel);

		CurrentPos = ChannelNameList.find_first_not_of(", ", Comma);
	}

	string JoinedChannelsList, ChannelMessage;

	ChannelMessage = "Channels: ";

	char tmp[200];

	int ChannelCount = 0;

	for(int i = 0; i < MAX_JOINED_CHANNELS ; i++) {

		if(JoinedChannels[i] != NULL) {

			if(ChannelCount) {

				JoinedChannelsList = JoinedChannelsList + ",";

				ChannelMessage = ChannelMessage + ",";
			}

			JoinedChannelsList = JoinedChannelsList + JoinedChannels[i]->GetName();

			sprintf(tmp, "%i=%s(%i)", i + 1, JoinedChannels[i]->GetName().c_str(), JoinedChannels[i]->MemberCount(Status));

			ChannelMessage += tmp;

			ChannelCount++;
		}
	}


	EQApplicationPacket *outapp = new EQApplicationPacket(OP_Mail, JoinedChannelsList.length() + 1);

	char *PacketBuffer = (char *)outapp->pBuffer;

	sprintf(PacketBuffer, "%s", JoinedChannelsList.c_str());

	_pkt(CHANNELS__PACKETS, outapp);

	QueuePacket(outapp);

	safe_delete(outapp);

	if(ChannelCount == 0)
		ChannelMessage = "You are not on any channels.";

	outapp = new EQApplicationPacket(OP_ChannelMessage, ChannelMessage.length() + 3);

	PacketBuffer = (char *)outapp->pBuffer;

	VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0x00);
	VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0x00);
	VARSTRUCT_ENCODE_STRING(PacketBuffer, ChannelMessage.c_str());

	_pkt(CHANNELS__PACKETS, outapp);

	QueuePacket(outapp);

	safe_delete(outapp);
}

void Client::LeaveAllChannels(bool SendUpdatedChannelList) {

	for(int i = 0; i < MAX_JOINED_CHANNELS; i++) {

		if(JoinedChannels[i]) {

			ChannelList->RemoveClientFromChannel(JoinedChannels[i]->GetName(), this);

			JoinedChannels[i] = NULL;
		}
	}

	if(SendUpdatedChannelList)
		SendChannelList();
}


void Client::ProcessChannelList(string Input) {

	if(Input.length() == 0) {

		SendChannelList();

		return;
	}

	string ChannelName = Input;

	if(isdigit(ChannelName[0]))
		ChannelName = ChannelSlotName(atoi(ChannelName.c_str()));

	ChatChannel *RequiredChannel = ChannelList->FindChannel(ChannelName);

	if(RequiredChannel) 
		RequiredChannel->SendChannelMembers(this);
	else
		GeneralChannelMessage("Channel " + Input + " not found.");
}



void Client::SendChannelList() {

	string ChannelMessage;

	ChannelMessage = "Channels: ";

	char tmp[200];

	int ChannelCount = 0;

	for(int i = 0; i < MAX_JOINED_CHANNELS ; i++) {

		if(JoinedChannels[i] != NULL) {

			if(ChannelCount)
				ChannelMessage = ChannelMessage + ",";

			sprintf(tmp, "%i=%s(%i)", i + 1, JoinedChannels[i]->GetName().c_str(), JoinedChannels[i]->MemberCount(Status));

			ChannelMessage += tmp;

			ChannelCount++;
		}
	}

	if(ChannelCount == 0)
		ChannelMessage = "You are not on any channels.";

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_ChannelMessage, ChannelMessage.length() + 3);

	char *PacketBuffer = (char *)outapp->pBuffer;

	VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0x00);
	VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0x00);
	VARSTRUCT_ENCODE_STRING(PacketBuffer, ChannelMessage.c_str());

	_pkt(CHANNELS__PACKETS, outapp);

	QueuePacket(outapp);

	safe_delete(outapp);
}

void Client::SendChannelMessage(string Message) {

	string::size_type MessageStart = Message.find_first_of(" ");

	if(MessageStart == string::npos)
		return;

	string ChannelName = Message.substr(1, MessageStart-1);

	_log(CHANNELS__TRACE, "%s tells %s, [%s]", GetName().c_str(), ChannelName.c_str(), Message.substr(MessageStart + 1).c_str());

	ChatChannel *RequiredChannel = ChannelList->FindChannel(ChannelName);

	if(RequiredChannel)
		if(RuleB(Chat, EnableAntiSpam))
		{
			if(!RequiredChannel->IsModerated() || RequiredChannel->HasVoice(GetName()) || RequiredChannel->IsOwner(GetName()) ||
				RequiredChannel->IsModerator(GetName()) || IsChannelAdmin())
			{
				if(GlobalChatLimiterTimer)
				{
					if(GlobalChatLimiterTimer->Check(false))
					{
						GlobalChatLimiterTimer->Start(RuleI(Chat, IntervalDurationMS));
						AttemptedMessages = 0;
					}
				}
				int AllowedMessages = RuleI(Chat, MinimumMessagesPerInterval) + GetKarma();
				AllowedMessages = AllowedMessages > RuleI(Chat, MaximumMessagesPerInterval) ? RuleI(Chat, MaximumMessagesPerInterval) : AllowedMessages; 
				
				if(RuleI(Chat, MinStatusToBypassAntiSpam) <= Status)
					AllowedMessages = 10000;
				
				AttemptedMessages++;
				if(AttemptedMessages > AllowedMessages)
				{
					if(AttemptedMessages > RuleI(Chat, MaxMessagesBeforeKick))
					{
						ForceDisconnect = true;
					}
					if(GlobalChatLimiterTimer)
					{
						char TimeLeft[256];
						sprintf(TimeLeft, "You are currently rate limited, you cannot send more messages for %i seconds.", 
							(GlobalChatLimiterTimer->GetRemainingTime() / 1000));
						GeneralChannelMessage(TimeLeft);
					}
					else
					{
						GeneralChannelMessage("You are currently rate limited, you cannot send more messages for up to 60 seconds.");
					}
				}
				else
				{
					RequiredChannel->SendMessageToChannel(Message.substr(MessageStart+1), this);
				}
			}
			else
				GeneralChannelMessage("Channel " + ChannelName + " is moderated and you have not been granted a voice.");
		}
		else
		{
			if(!RequiredChannel->IsModerated() || RequiredChannel->HasVoice(GetName()) || RequiredChannel->IsOwner(GetName()) ||
				RequiredChannel->IsModerator(GetName()) || IsChannelAdmin())
				RequiredChannel->SendMessageToChannel(Message.substr(MessageStart+1), this);
			else
				GeneralChannelMessage("Channel " + ChannelName + " is moderated and you have not been granted a voice.");
		}

}

void Client::SendChannelMessageByNumber(string Message) {

	string::size_type MessageStart = Message.find_first_of(" ");

	if(MessageStart == string::npos)
		return;

	int ChannelNumber = atoi(Message.substr(0, MessageStart).c_str());

	if((ChannelNumber < 1) || (ChannelNumber > MAX_JOINED_CHANNELS)) {

		GeneralChannelMessage("Invalid channel name/number specified.");

		return;
	}

	ChatChannel *RequiredChannel = JoinedChannels[ChannelNumber-1];

	if(!RequiredChannel) {

		GeneralChannelMessage("Invalid channel name/number specified.");

		return;
	}

	_log(CHANNELS__TRACE, "%s tells %s, [%s]", GetName().c_str(), RequiredChannel->GetName().c_str(), 
						   Message.substr(MessageStart + 1).c_str());

	if(RuleB(Chat, EnableAntiSpam))
	{
		if(!RequiredChannel->IsModerated() || RequiredChannel->HasVoice(GetName()) || RequiredChannel->IsOwner(GetName()) ||
			RequiredChannel->IsModerator(GetName()))
		{
				if(GlobalChatLimiterTimer)
				{
					if(GlobalChatLimiterTimer->Check(false))
					{
						GlobalChatLimiterTimer->Start(RuleI(Chat, IntervalDurationMS));
						AttemptedMessages = 0;
					}
				}
				else
				{
					printf("GlobalChatLimiterTimer does not exist Check 1\n");
				}
				int AllowedMessages = RuleI(Chat, MinimumMessagesPerInterval) + GetKarma();
				AllowedMessages = AllowedMessages > RuleI(Chat, MaximumMessagesPerInterval) ? RuleI(Chat, MaximumMessagesPerInterval) : AllowedMessages; 
				if(RuleI(Chat, MinStatusToBypassAntiSpam) <= Status)
					AllowedMessages = 10000;

				AttemptedMessages++;
				if(AttemptedMessages > AllowedMessages)
				{
					if(AttemptedMessages > RuleI(Chat, MaxMessagesBeforeKick))
					{
						ForceDisconnect = true;
					}
					if(GlobalChatLimiterTimer)
					{
						char TimeLeft[256];
						sprintf(TimeLeft, "You are currently rate limited, you cannot send more messages for %i seconds.", 
							(GlobalChatLimiterTimer->GetRemainingTime() / 1000));
						GeneralChannelMessage(TimeLeft);
					}
					else
					{
						GeneralChannelMessage("You are currently rate limited, you cannot send more messages for up to 60 seconds.");
					}
				}
				else
				{
					RequiredChannel->SendMessageToChannel(Message.substr(MessageStart+1), this);
				}
		}
		else
			GeneralChannelMessage("Channel " + RequiredChannel->GetName() + " is moderated and you have not been granted a voice.");
	}
	else
	{
		if(!RequiredChannel->IsModerated() || RequiredChannel->HasVoice(GetName()) || RequiredChannel->IsOwner(GetName()) ||
			RequiredChannel->IsModerator(GetName()))
			RequiredChannel->SendMessageToChannel(Message.substr(MessageStart+1), this);
		else
			GeneralChannelMessage("Channel " + RequiredChannel->GetName() + " is moderated and you have not been granted a voice.");
	}

}

void Client::SendChannelMessage(string ChannelName, string Message, Client *Sender) {

	if(!Sender) return;

	string FQSenderName = WorldShortName + "." + Sender->GetName();

	int PacketLength = ChannelName.length() + Message.length() + FQSenderName.length() + 3;

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_ChannelMessage, PacketLength);

	char *PacketBuffer = (char *)outapp->pBuffer;

	VARSTRUCT_ENCODE_STRING(PacketBuffer, ChannelName.c_str());
	VARSTRUCT_ENCODE_STRING(PacketBuffer, FQSenderName.c_str());
	VARSTRUCT_ENCODE_STRING(PacketBuffer, Message.c_str());

	_pkt(CHANNELS__PACKETS, outapp);
	QueuePacket(outapp);

	safe_delete(outapp);
}

void Client::ToggleAnnounce() {

	string Message = "Announcing now ";

	if(Announce) 
		Message += "off";
	else
		Message += "on";

	Announce = !Announce;

	GeneralChannelMessage(Message);
}

void Client::AnnounceJoin(ChatChannel *Channel, Client *c) {

	if(!Channel || !c) return;

	int PacketLength = Channel->GetName().length() + c->GetName().length() + 2;

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_ChannelAnnounceJoin, PacketLength);

	char *PacketBuffer = (char *)outapp->pBuffer;

	VARSTRUCT_ENCODE_STRING(PacketBuffer, Channel->GetName().c_str());
	VARSTRUCT_ENCODE_STRING(PacketBuffer, c->GetName().c_str());

	_pkt(CHANNELS__PACKETS, outapp);

	QueuePacket(outapp);

	safe_delete(outapp);
}

void Client::AnnounceLeave(ChatChannel *Channel, Client *c) {

	if(!Channel || !c) return;

	int PacketLength = Channel->GetName().length() + c->GetName().length() + 2;

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_ChannelAnnounceLeave, PacketLength);

	char *PacketBuffer = (char *)outapp->pBuffer;

	VARSTRUCT_ENCODE_STRING(PacketBuffer, Channel->GetName().c_str());
	VARSTRUCT_ENCODE_STRING(PacketBuffer, c->GetName().c_str());

	_pkt(CHANNELS__PACKETS, outapp);

	QueuePacket(outapp);

	safe_delete(outapp);
}

void Client::GeneralChannelMessage(const char *Characters) {

	if(!Characters) return;

	string Message = Characters;

	GeneralChannelMessage(Message);

}

void Client::GeneralChannelMessage(string Message) {

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_ChannelMessage, Message.length() + 3);
	char *PacketBuffer = (char *)outapp->pBuffer;
	VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0x00);
	VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0x00);
	VARSTRUCT_ENCODE_STRING(PacketBuffer, Message.c_str());

	_pkt(CHANNELS__PACKETS, outapp);
	QueuePacket(outapp);

	safe_delete(outapp);
}

void Client::SetChannelPassword(string ChannelPassword) {

	string::size_type PasswordStart = ChannelPassword.find_first_not_of(" ");

	if(PasswordStart == string::npos) {
		string Message = "Incorrect syntax: /chat password <new password> <channel name>";
		GeneralChannelMessage(Message);
		return;
	}

	string::size_type Space = ChannelPassword.find_first_of(" ", PasswordStart);

	if(Space == string::npos) {
		string Message = "Incorrect syntax: /chat password <new password> <channel name>";
		GeneralChannelMessage(Message);
		return;
	}

	string Password = ChannelPassword.substr(PasswordStart, Space - PasswordStart);

	string::size_type ChannelStart = ChannelPassword.find_first_not_of(" ", Space);

	if(ChannelStart == string::npos) {
		string Message = "Incorrect syntax: /chat password <new password> <channel name>";
		GeneralChannelMessage(Message);
		return;
	}

	string ChannelName = ChannelPassword.substr(ChannelStart);

	if((ChannelName.length() > 0) && isdigit(ChannelName[0]))
		ChannelName = ChannelSlotName(atoi(ChannelName.c_str()));

	string Message;

	if(!strcasecmp(Password.c_str(), "remove")) {
		Password.clear();
		Message = "Password REMOVED on channel " + ChannelName;
	}
	else
		Message = "Password change on channel " + ChannelName;

	_log(CHANNELS__TRACE, "Set password of channel [%s] to [%s] by %s", ChannelName.c_str(), Password.c_str(), GetName().c_str());

	ChatChannel *RequiredChannel = ChannelList->FindChannel(ChannelName);

	if(!RequiredChannel) {
		string Message = "Channel not found.";
		GeneralChannelMessage(Message);
		return;
	}

	if(!RequiredChannel->IsOwner(GetName()) && !RequiredChannel->IsModerator(GetName()) && !IsChannelAdmin()) {
		string Message = "You do not own or have moderator rights on channel " + ChannelName;
		GeneralChannelMessage(Message);
		return;
	}

	RequiredChannel->SetPassword(Password);

	GeneralChannelMessage(Message);

}

void Client::SetChannelOwner(string CommandString) {

	string::size_type PlayerStart = CommandString.find_first_not_of(" ");

	if(PlayerStart == string::npos) {
		string Message = "Incorrect syntax: /chat setowner <player> <channel>";
		GeneralChannelMessage(Message);
		return;
	}

	string::size_type Space = CommandString.find_first_of(" ", PlayerStart);

	if(Space == string::npos) {
		string Message = "Incorrect syntax: /chat setowner <player> <channel>";
		GeneralChannelMessage(Message);
		return;
	}

	string NewOwner = CapitaliseName(CommandString.substr(PlayerStart, Space - PlayerStart));

	string::size_type ChannelStart = CommandString.find_first_not_of(" ", Space);

	if(ChannelStart == string::npos) {
		string Message = "Incorrect syntax: /chat setowner <player> <channel>";
		GeneralChannelMessage(Message);
		return;
	}

	string ChannelName = CapitaliseName(CommandString.substr(ChannelStart));

	if((ChannelName.length() > 0) && isdigit(ChannelName[0]))
		ChannelName = ChannelSlotName(atoi(ChannelName.c_str()));

	_log(CHANNELS__TRACE, "Set owner of channel [%s] to [%s]", ChannelName.c_str(), NewOwner.c_str());

	ChatChannel *RequiredChannel = ChannelList->FindChannel(ChannelName);

	if(!RequiredChannel) {
		GeneralChannelMessage("Channel " + ChannelName + " not found.");
		return;
	}

	if(!RequiredChannel->IsOwner(GetName()) && !IsChannelAdmin()) {
		string Message = "You do not own channel " + ChannelName;
		GeneralChannelMessage(Message);
		return;
	}

	if(database.FindCharacter(NewOwner.c_str()) < 0) {

		GeneralChannelMessage("Player " + NewOwner + " does not exist.");
		return;
	}

	RequiredChannel->SetOwner(NewOwner);

	if(RequiredChannel->IsModerator(NewOwner))
		RequiredChannel->RemoveModerator(NewOwner);

	GeneralChannelMessage("Channel owner changed.");

}

void Client::OPList(string CommandString) {

	string::size_type ChannelStart = CommandString.find_first_not_of(" ");
 
	if(ChannelStart == string::npos) {
		string Message = "Incorrect syntax: /chat oplist <channel>";
		GeneralChannelMessage(Message);
		return;
	}

	string ChannelName = CapitaliseName(CommandString.substr(ChannelStart));

	if((ChannelName.length() > 0) && isdigit(ChannelName[0]))
		ChannelName = ChannelSlotName(atoi(ChannelName.c_str()));

	ChatChannel *RequiredChannel = ChannelList->FindChannel(ChannelName);

	if(!RequiredChannel) {
		GeneralChannelMessage("Channel " + ChannelName + " not found.");
		return;
	}

	RequiredChannel->SendOPList(this);
}

void Client::ChannelInvite(string CommandString) {

	string::size_type PlayerStart = CommandString.find_first_not_of(" ");

	if(PlayerStart == string::npos) {
		string Message = "Incorrect syntax: /chat invite <player> <channel>";
		GeneralChannelMessage(Message);
		return;
	}

	string::size_type Space = CommandString.find_first_of(" ", PlayerStart);

	if(Space == string::npos) {
		string Message = "Incorrect syntax: /chat invite <player> <channel>";
		GeneralChannelMessage(Message);
		return;
	}

	string Invitee = CapitaliseName(CommandString.substr(PlayerStart, Space - PlayerStart));

	string::size_type ChannelStart = CommandString.find_first_not_of(" ", Space);

	if(ChannelStart == string::npos) {
		string Message = "Incorrect syntax: /chat invite <player> <channel>";
		GeneralChannelMessage(Message);
		return;
	}

	string ChannelName = CapitaliseName(CommandString.substr(ChannelStart));

	if((ChannelName.length() > 0) && isdigit(ChannelName[0]))
		ChannelName = ChannelSlotName(atoi(ChannelName.c_str()));

	_log(CHANNELS__TRACE, "[%s] invites [%s] to channel [%s]", GetName().c_str(), Invitee.c_str(), ChannelName.c_str());

	Client *RequiredClient = CL->FindCharacter(Invitee);

	if(!RequiredClient) {

		GeneralChannelMessage(Invitee + " is not online.");
		return;
	}

	if(RequiredClient == this) {

		GeneralChannelMessage("You cannot invite yourself to a channel.");
		return;
	}

	if(!RequiredClient->InvitesAllowed()) {

		GeneralChannelMessage("That player is not currently accepting channel invitations.");
		return;
	}

	ChatChannel *RequiredChannel = ChannelList->FindChannel(ChannelName);

	if(!RequiredChannel) {

		GeneralChannelMessage("Channel " + ChannelName + " not found.");
		return;
	}

	if(!RequiredChannel->IsOwner(GetName()) && !RequiredChannel->IsModerator(GetName())) {

		string Message = "You do not own or have moderator rights to channel " + ChannelName;

		GeneralChannelMessage(Message);
		return;
	}

	if(RequiredChannel->IsClientInChannel(RequiredClient)) {

		GeneralChannelMessage(Invitee + " is already in that channel");

		return;
	}

	RequiredChannel->AddInvitee(Invitee);

	RequiredClient->GeneralChannelMessage(GetName() + " has invited you to join channel " + ChannelName);

	GeneralChannelMessage("Invitation sent to " + Invitee + " to join channel " + ChannelName);

}

void Client::ChannelModerate(string CommandString) {

	string::size_type ChannelStart = CommandString.find_first_not_of(" ");

	if(ChannelStart == string::npos) {

		string Message = "Incorrect syntax: /chat moderate <channel>";

		GeneralChannelMessage(Message);
		return;
	}

	string ChannelName = CapitaliseName(CommandString.substr(ChannelStart));

	if((ChannelName.length() > 0) && isdigit(ChannelName[0]))
		ChannelName = ChannelSlotName(atoi(ChannelName.c_str()));

	ChatChannel *RequiredChannel = ChannelList->FindChannel(ChannelName);

	if(!RequiredChannel) {

		GeneralChannelMessage("Channel " + ChannelName + " not found.");
		return;
	}

	if(!RequiredChannel->IsOwner(GetName()) && !RequiredChannel->IsModerator(GetName()) && !IsChannelAdmin()) {

		GeneralChannelMessage("You do not own or have moderator rights to channel " + ChannelName);
		return;
	}

	RequiredChannel->SetModerated(!RequiredChannel->IsModerated());

	if(!RequiredChannel->IsClientInChannel(this))
		if(RequiredChannel->IsModerated())
			GeneralChannelMessage("Channel " + ChannelName + " is now moderated.");
		else
			GeneralChannelMessage("Channel " + ChannelName + " is no longer moderated.");

}

void Client::ChannelGrantModerator(string CommandString) {

	string::size_type PlayerStart = CommandString.find_first_not_of(" ");

	if(PlayerStart == string::npos) {

		GeneralChannelMessage("Incorrect syntax: /chat grant <player> <channel>");
		return;
	}

	string::size_type Space = CommandString.find_first_of(" ", PlayerStart);

	if(Space == string::npos) {

		GeneralChannelMessage("Incorrect syntax: /chat grant <player> <channel>");
		return;
	}

	string Moderator = CapitaliseName(CommandString.substr(PlayerStart, Space - PlayerStart));

	string::size_type ChannelStart = CommandString.find_first_not_of(" ", Space);

	if(ChannelStart == string::npos) {

		GeneralChannelMessage("Incorrect syntax: /chat grant <player> <channel>");
		return;
	}

	string ChannelName = CapitaliseName(CommandString.substr(ChannelStart));

	if((ChannelName.length() > 0) && isdigit(ChannelName[0]))
		ChannelName = ChannelSlotName(atoi(ChannelName.c_str()));

	_log(CHANNELS__TRACE, "[%s] gives [%s] moderator rights to channel [%s]", GetName().c_str(), Moderator.c_str(), ChannelName.c_str());

	Client *RequiredClient = CL->FindCharacter(Moderator);

	if(!RequiredClient && (database.FindCharacter(Moderator.c_str()) < 0)) {

		GeneralChannelMessage("Player " + Moderator + " does not exist.");
		return;
	}

	if(RequiredClient == this) {

		GeneralChannelMessage("You cannot grant yourself moderator rights to a channel.");
		return;
	}

	ChatChannel *RequiredChannel = ChannelList->FindChannel(ChannelName);

	if(!RequiredChannel) {

		GeneralChannelMessage("Channel " + ChannelName + " not found.");
		return;
	}

	if(!RequiredChannel->IsOwner(GetName()) && !IsChannelAdmin()) {

		GeneralChannelMessage("You do not own channel " + ChannelName);
		return;
	}

	if(RequiredChannel->IsModerator(Moderator)) {

		RequiredChannel->RemoveModerator(Moderator);

		if(RequiredClient)
			RequiredClient->GeneralChannelMessage(GetName() + " has removed your moderator rights to channel " + ChannelName);

		GeneralChannelMessage("Removing moderator rights from " + Moderator + " to channel " + ChannelName);
	}
	else {
		RequiredChannel->AddModerator(Moderator);
	
		if(RequiredClient)
			RequiredClient->GeneralChannelMessage(GetName() + " has made you a moderator of channel " + ChannelName);

		GeneralChannelMessage(Moderator + " is now a moderator on channel " + ChannelName);
	}

}

void Client::ChannelGrantVoice(string CommandString) {

	string::size_type PlayerStart = CommandString.find_first_not_of(" ");

	if(PlayerStart == string::npos) {

		GeneralChannelMessage("Incorrect syntax: /chat voice <player> <channel>");
		return;
	}

	string::size_type Space = CommandString.find_first_of(" ", PlayerStart);

	if(Space == string::npos) {
		GeneralChannelMessage("Incorrect syntax: /chat voice <player> <channel>");
		return;
	}

	string Voicee = CapitaliseName(CommandString.substr(PlayerStart, Space - PlayerStart));

	string::size_type ChannelStart = CommandString.find_first_not_of(" ", Space);

	if(ChannelStart == string::npos) {
		GeneralChannelMessage("Incorrect syntax: /chat voice <player> <channel>");
		return;
	}

	string ChannelName = CapitaliseName(CommandString.substr(ChannelStart));

	if((ChannelName.length() > 0) && isdigit(ChannelName[0]))
		ChannelName = ChannelSlotName(atoi(ChannelName.c_str()));

	_log(CHANNELS__TRACE, "[%s] gives [%s] voice to channel [%s]", GetName().c_str(), Voicee.c_str(), ChannelName.c_str());

	Client *RequiredClient = CL->FindCharacter(Voicee);

	if(!RequiredClient && (database.FindCharacter(Voicee.c_str()) < 0)) {

		GeneralChannelMessage("Player " + Voicee + " does not exist.");
		return;
	}

	if(RequiredClient == this) {

		GeneralChannelMessage("You cannot grant yourself voice to a channel.");
		return;
	}

	ChatChannel *RequiredChannel = ChannelList->FindChannel(ChannelName);

	if(!RequiredChannel) {

		GeneralChannelMessage("Channel " + ChannelName + " not found.");
		return;
	}

	if(!RequiredChannel->IsOwner(GetName()) && !RequiredChannel->IsModerator(GetName()) && !IsChannelAdmin()) {

		GeneralChannelMessage("You do not own or have moderator rights to channel " + ChannelName);
		return;
	}

	if(RequiredChannel->IsOwner(RequiredClient->GetName()) || RequiredChannel->IsModerator(RequiredClient->GetName())) {

		GeneralChannelMessage("The channel owner and moderators automatically have voice.");
		return;
	}

	if(RequiredChannel->HasVoice(Voicee)) {

		RequiredChannel->RemoveVoice(Voicee);

		if(RequiredClient)
			RequiredClient->GeneralChannelMessage(GetName() + " has removed your voice rights to channel " + ChannelName);

		GeneralChannelMessage("Removing voice from " + Voicee + " in channel " + ChannelName);
	}
	else {
		RequiredChannel->AddVoice(Voicee);
	
		if(RequiredClient)
			RequiredClient->GeneralChannelMessage(GetName() + " has given you voice in channel " + ChannelName);

		GeneralChannelMessage(Voicee + " now has voice in channel " + ChannelName);
	}

}

void Client::ChannelKick(string CommandString) {

	string::size_type PlayerStart = CommandString.find_first_not_of(" ");

	if(PlayerStart == string::npos) {

		GeneralChannelMessage("Incorrect syntax: /chat kick <player> <channel>");
		return;
	}

	string::size_type Space = CommandString.find_first_of(" ", PlayerStart);

	if(Space == string::npos) {

		GeneralChannelMessage("Incorrect syntax: /chat kick <player> <channel>");
		return;
	}

	string Kickee = CapitaliseName(CommandString.substr(PlayerStart, Space - PlayerStart));

	string::size_type ChannelStart = CommandString.find_first_not_of(" ", Space);

	if(ChannelStart == string::npos) {

		GeneralChannelMessage("Incorrect syntax: /chat kick <player> <channel>");
		return;
	}
	string ChannelName = CapitaliseName(CommandString.substr(ChannelStart));

	if((ChannelName.length() > 0) && isdigit(ChannelName[0]))
		ChannelName = ChannelSlotName(atoi(ChannelName.c_str()));

	_log(CHANNELS__TRACE, "[%s] kicks [%s] from channel [%s]", GetName().c_str(), Kickee.c_str(), ChannelName.c_str());

	Client *RequiredClient = CL->FindCharacter(Kickee);

	if(!RequiredClient) {

		GeneralChannelMessage("Player " + Kickee + " is not online.");
		return;
	}

	if(RequiredClient == this) {

		GeneralChannelMessage("You cannot kick yourself out of a channel.");
		return;
	}

	ChatChannel *RequiredChannel = ChannelList->FindChannel(ChannelName);

	if(!RequiredChannel) {

		GeneralChannelMessage("Channel " + ChannelName + " not found.");
		return;
	}

	if(!RequiredChannel->IsOwner(GetName()) && !RequiredChannel->IsModerator(GetName()) && !IsChannelAdmin()) {

		GeneralChannelMessage("You do not own or have moderator rights to channel " + ChannelName);
		return;
	}

	if(RequiredChannel->IsOwner(RequiredClient->GetName())) {

		GeneralChannelMessage("You cannot kick the owner out of the channel.");
		return;
	}

	if(RequiredChannel->IsModerator(Kickee) && !RequiredChannel->IsOwner(GetName())) {

		GeneralChannelMessage("Only the channel owner can kick a moderator out of the channel.");
		return;
	}

	if(RequiredChannel->IsModerator(Kickee))  {

		RequiredChannel->RemoveModerator(Kickee);

		RequiredClient->GeneralChannelMessage(GetName() + " has removed your moderator rights to channel " + ChannelName);

		GeneralChannelMessage("Removing moderator rights from " + Kickee + " to channel " + ChannelName);
	}

	RequiredClient->GeneralChannelMessage(GetName() + " has kicked you from channel " + ChannelName);

	GeneralChannelMessage("Kicked " + Kickee + " from channel " + ChannelName);

	RequiredClient->LeaveChannels(ChannelName);
}

void Client::ToggleInvites() {

	AllowInvites = !AllowInvites;

	if(AllowInvites)
		GeneralChannelMessage("You will now receive channel invitations.");
	else
		GeneralChannelMessage("You will no longer receive channel invitations.");

}

string Client::ChannelSlotName(int SlotNumber) {

	if((SlotNumber < 1 ) || (SlotNumber > MAX_JOINED_CHANNELS))
		return "";

	if(JoinedChannels[SlotNumber - 1] == NULL)
		return "";

	return JoinedChannels[SlotNumber - 1]->GetName();

}

void Client::SendHelp() {

	GeneralChannelMessage("Chat Channel Commands:");

	GeneralChannelMessage("/join, /leave, /leaveall, /list, /announce, /autojoin, ;set");
	GeneralChannelMessage(";oplist, ;grant, ;invite, ;kick, ;moderate, ;password, ;voice");
	GeneralChannelMessage(";setowner, ;toggleinvites");
}

void Client::ProcessKarma()
{
	if(KarmaGrabUpdateTimer)
	{
		if(KarmaGrabUpdateTimer->Check(false))
		{
			KarmaGrabUpdateTimer->Start(120000);
			database.UpdateKarma(this);
		}
	}
}

