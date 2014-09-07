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
#include <iostream>
using namespace std;
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errmsg.h>
#include <mysqld_error.h>
#include <limits.h>
#include <ctype.h>
#include <assert.h>
#include <map>

// Disgrace: for windows compile
#ifdef WIN32
#include <windows.h>
#define snprintf	_snprintf
#define strncasecmp	_strnicmp
#define strcasecmp	_stricmp
#else
#include "../common/unix.h"
#include <netinet/in.h>
#endif

#include "database.h"
#include "../common/eq_packet_structs.h"
#include "../common/MiscFunctions.h"

extern Clientlist *CL;
extern string GetMailPrefix();

Database::Database ()
{
	DBInitVars();
}

/*
Establish a connection to a mysql database with the supplied parameters
*/

Database::Database(const char* host, const char* user, const char* passwd, const char* database, int32 port)
{
	DBInitVars();
	Connect(host, user, passwd, database, port);
}

bool Database::Connect(const char* host, const char* user, const char* passwd, const char* database, int32 port)
{
	int32 errnum= 0;
	char errbuf[MYSQL_ERRMSG_SIZE];
	if (!Open(host, user, passwd, database, port, &errnum, errbuf))
	{
		LogFile->write(EQEMuLog::Error, "Failed to connect to database: Error: %s", errbuf);
		HandleMysqlError(errnum);

		return false;
	}
	else
	{
		LogFile->write(EQEMuLog::Status, "Using database '%s' at %s:%d",database,host,port);
		return true;
	}
}

void Database::DBInitVars() {

}



void Database::HandleMysqlError(int32 errnum) {
}

/*

Close the connection to the database
*/
Database::~Database()
{
}

int Database::FindAccount(const char *CharacterName, Client *c) {

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	c->ClearCharacters();

	c->AddCharacter(CharacterName);

	if (!RunQuery(query,MakeAnyLenString(&query, "select `account_id` from `character_` where `name`='%s' limit 1",
					   CharacterName),errbuf,&result)){

		safe_delete_array(query);

		return -1;
	}

	safe_delete_array(query);

	if (mysql_num_rows(result) != 1) {
		_log(MAIL__ERROR, "Bad result from query"); fflush(stdout);

		mysql_free_result(result);

		return -1;
	}

	row = mysql_fetch_row(result);

	int AccountID = atoi(row[0]);

	mysql_free_result(result);

	_log(MAIL__TRACE, "Account ID for %s is %i", CharacterName, AccountID); fflush(stdout);

	if (!RunQuery(query,MakeAnyLenString(&query, "select `name` from `character_` where `account_id`=%i and `name` !='%s'",
					   AccountID, CharacterName),errbuf,&result)){

		safe_delete_array(query);

		return AccountID;
	}

	safe_delete_array(query);

	for(unsigned int i = 0; i < mysql_num_rows(result); i++) {

		row = mysql_fetch_row(result);

		c->AddCharacter(row[0]);
	}

	mysql_free_result(result);

	return AccountID;
}

bool Database::VerifyMailKey(string CharacterName, int IPAddress, string MailKey) {

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if (!RunQuery(query,MakeAnyLenString(&query, "select `mailkey` from `character_` where `name`='%s' limit 1",
					   CharacterName.c_str()),errbuf,&result)){

		safe_delete_array(query);

		_log(MAIL__ERROR, "Error retrieving mailkey from database: %s", errbuf);

		return false;
	}

	safe_delete_array(query);

	row = mysql_fetch_row(result);

	// The key is the client's IP address (expressed as 8 hex digits) and an 8 hex digit random string generated
	// by world. 
	//
	char CombinedKey[17];

	if(RuleB(Chat, EnableMailKeyIPVerification) == true)
		sprintf(CombinedKey, "%08X%s", IPAddress, MailKey.c_str());
	else
		sprintf(CombinedKey, "%s", MailKey.c_str());
	
	_log(CHANNELS__TRACE, "DB key is [%s], Client key is [%s]", row[0], CombinedKey);

	bool Valid = !strcmp(row[0], CombinedKey);

	mysql_free_result(result);

	return Valid;

}

int Database::FindCharacter(const char *CharacterName) {

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	char *SafeCharName = RemoveApostrophes(CharacterName);

	if (!RunQuery(query,MakeAnyLenString(&query, "select `id` from `character_` where `name`='%s' limit 1",
					   SafeCharName),errbuf,&result)){

		safe_delete_array(query);
		safe_delete_array(SafeCharName);

		return -1;
	}

	safe_delete_array(query);
	safe_delete_array(SafeCharName);

	if (mysql_num_rows(result) != 1) {

		_log(MAIL__ERROR, "Bad result from FindCharacter query for character %s", CharacterName); fflush(stdout);

		mysql_free_result(result);

		return -1;
	}

	row = mysql_fetch_row(result);

	int CharacterID = atoi(row[0]);

	mysql_free_result(result);

	return CharacterID;

}
bool Database::SendMail(string Recipient, string From, string Subject, string Body, string RecipientsString) {

	int CharacterID;

	string CharacterName;

	//printf("Database::SendMail(%s, %s, %s)\n", Recipient.c_str(), From.c_str(), Subject.c_str());

	string::size_type LastPeriod = Recipient.find_last_of(".");
	
	if(LastPeriod == string::npos)
		CharacterName = Recipient;
	else
		CharacterName = Recipient.substr(LastPeriod+1);

	CharacterName[0] = toupper(CharacterName[0]);

	for(unsigned int i = 1; i < CharacterName.length(); i++) 
		CharacterName[i] = tolower(CharacterName[i]);

	CharacterID = FindCharacter(CharacterName.c_str());

	_log(MAIL__TRACE, "SendMail: CharacterID for recipient %s is %i", CharacterName.c_str(), CharacterID);

	if(CharacterID <= 0) return false;

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;

	char *EscSubject = new char[Subject.length() * 2 + 1];
	char *EscBody = new char[Body.length() * 2 + 1];

	DoEscapeString(EscSubject, Subject.c_str(), Subject.length());
	DoEscapeString(EscBody, Body.c_str(), Body.length());

	const char *MailQuery="INSERT INTO `mail` (`charid`, `timestamp`, `from`, `subject`, `body`, `to`, `status`) "
			      "VALUES ('%i', %i, '%s', '%s', '%s', '%s', %i)";

	int32 LastMsgID;

	int Now = time(NULL); // time returns a 64 bit int on Windows at least, which vsnprintf doesn't like.

	if(!RunQuery(query, MakeAnyLenString(&query, MailQuery, CharacterID, Now, From.c_str(), EscSubject, EscBody, 
					     RecipientsString.c_str(), 1), errbuf, 0, 0, &LastMsgID)) {

		_log(MAIL__ERROR, "SendMail: Query %s failed with error %s", query, errbuf);

		safe_delete_array(EscSubject);
		safe_delete_array(EscBody);
		safe_delete_array(query);

		return false;
	}

	_log(MAIL__TRACE, "MessageID %i generated, from %s, to %s", LastMsgID, From.c_str(), Recipient.c_str());

	safe_delete_array(EscSubject);
	safe_delete_array(EscBody);
       	safe_delete_array(query);

	Client *c = CL->IsCharacterOnline(CharacterName);

	if(c) {
		string FQN = GetMailPrefix() + From;

		c->SendNotification(c->GetMailBoxNumber(CharacterName), Subject, FQN, LastMsgID);
	}

	return true;
}

void Database::SendHeaders(Client *c) {

	/*int UnknownField1 = 0;*/	//unused
	int UnknownField2 = 25015275;
	int UnknownField3 = 1;

	int CharacterID = FindCharacter(c->MailBoxName().c_str());
	_log(MAIL__TRACE, "Sendheaders for %s, CharID is %i", c->MailBoxName().c_str(), CharacterID);
	if(CharacterID <= 0)
		return;


	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if (!RunQuery(query,MakeAnyLenString(&query, "select `msgid`,`timestamp`,`from`,`subject`, `status` from `mail` "
						     "where `charid`=%i", CharacterID),errbuf,&result)){

		safe_delete_array(query);

		return ;
	}

	safe_delete_array(query);

	char Buf[100];

	int NumRows = mysql_num_rows(result);

	int HeaderCountPacketLength = 0;
	
	sprintf(Buf, "%i", c->GetMailBoxNumber());
	HeaderCountPacketLength += (strlen(Buf) + 1);

	sprintf(Buf, "%i", UnknownField2);
	HeaderCountPacketLength += (strlen(Buf) + 1);

	sprintf(Buf, "%i", UnknownField3);
	HeaderCountPacketLength += (strlen(Buf) + 1);

	sprintf(Buf, "%i", NumRows);
	HeaderCountPacketLength += (strlen(Buf) + 1);

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_MailHeaderCount, HeaderCountPacketLength);

	char *PacketBuffer = (char *)outapp->pBuffer;

	VARSTRUCT_ENCODE_INTSTRING(PacketBuffer, c->GetMailBoxNumber());
	VARSTRUCT_ENCODE_INTSTRING(PacketBuffer, UnknownField2);
	VARSTRUCT_ENCODE_INTSTRING(PacketBuffer, UnknownField3);
	VARSTRUCT_ENCODE_INTSTRING(PacketBuffer, NumRows);

	_pkt(MAIL__PACKETS, outapp);

	c->QueuePacket(outapp);

	safe_delete(outapp);

	int RowNum = 0;

	while((row = mysql_fetch_row(result))) {


		int HeaderPacketLength = 0;

		sprintf(Buf, "%i", c->GetMailBoxNumber());
		HeaderPacketLength = HeaderPacketLength + strlen(Buf) + 1;
		sprintf(Buf, "%i", UnknownField2);
		HeaderPacketLength = HeaderPacketLength + strlen(Buf) + 1;
		sprintf(Buf, "%i", RowNum);
		HeaderPacketLength = HeaderPacketLength + strlen(Buf) + 1;

		HeaderPacketLength = HeaderPacketLength + strlen(row[0]) + 1;
		HeaderPacketLength = HeaderPacketLength + strlen(row[1]) + 1;
		HeaderPacketLength = HeaderPacketLength + strlen(row[4]) + 1;
		HeaderPacketLength = HeaderPacketLength + GetMailPrefix().length() + strlen(row[2]) + 1;
		HeaderPacketLength = HeaderPacketLength + strlen(row[3]) + 1;

		outapp = new EQApplicationPacket(OP_MailHeader, HeaderPacketLength);

		PacketBuffer = (char *)outapp->pBuffer;

		VARSTRUCT_ENCODE_INTSTRING(PacketBuffer, c->GetMailBoxNumber());
		VARSTRUCT_ENCODE_INTSTRING(PacketBuffer, UnknownField2);
		VARSTRUCT_ENCODE_INTSTRING(PacketBuffer, RowNum);
		VARSTRUCT_ENCODE_STRING(PacketBuffer, row[0]);
		VARSTRUCT_ENCODE_STRING(PacketBuffer, row[1]);
		VARSTRUCT_ENCODE_STRING(PacketBuffer, row[4]);
		VARSTRUCT_ENCODE_STRING(PacketBuffer, GetMailPrefix().c_str()); PacketBuffer--;
		VARSTRUCT_ENCODE_STRING(PacketBuffer, row[2]);
		VARSTRUCT_ENCODE_STRING(PacketBuffer, row[3]);

		_pkt(MAIL__PACKETS, outapp);

		c->QueuePacket(outapp);

		safe_delete(outapp);

		RowNum++;
	}

	mysql_free_result(result);

}

void Database::SendBody(Client *c, int MessageNumber) {

	int CharacterID = FindCharacter(c->MailBoxName().c_str());

	_log(MAIL__TRACE, "SendBody: MsgID %i, to %s, CharID is %i", MessageNumber, c->MailBoxName().c_str(), CharacterID);

	if(CharacterID <= 0)
		return;

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if (!RunQuery(query,MakeAnyLenString(&query, "select `msgid`, `body`, `to` from `mail` "
						     "where `charid`=%i and `msgid`=%i", CharacterID, MessageNumber), errbuf, &result)){
		safe_delete_array(query);

		return ;
	}

	safe_delete_array(query);

	if (mysql_num_rows(result) != 1) {

		mysql_free_result(result);

		return;
	}

	row = mysql_fetch_row(result);

	_log(MAIL__TRACE, "Message: %i  body (%i bytes)", MessageNumber, strlen(row[1]));

	int PacketLength = 12 + strlen(row[0]) + strlen(row[1]) + strlen(row[2]);

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_MailSendBody,PacketLength);

	char *PacketBuffer = (char *)outapp->pBuffer;

	VARSTRUCT_ENCODE_INTSTRING(PacketBuffer, c->GetMailBoxNumber());
	VARSTRUCT_ENCODE_STRING(PacketBuffer,row[0]);
	VARSTRUCT_ENCODE_STRING(PacketBuffer,row[1]);
	VARSTRUCT_ENCODE_STRING(PacketBuffer,"1");
	VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0);
	VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0x0a);
	VARSTRUCT_ENCODE_STRING(PacketBuffer, "TO:"); PacketBuffer--;
	VARSTRUCT_ENCODE_STRING(PacketBuffer, row[2]); PacketBuffer--; // Overwrite the null terminator
	VARSTRUCT_ENCODE_TYPE(uint8, PacketBuffer, 0x0a);

	mysql_free_result(result);

	_pkt(MAIL__PACKETS, outapp);

	c->QueuePacket(outapp);

	safe_delete(outapp);


}

void Database::SetMessageStatus(int MessageNumber, int Status) {

	_log(MAIL__TRACE, "SetMessageStatus %i %i", MessageNumber, Status);

	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;

	if(Status == 0)
		RunQuery(query, MakeAnyLenString(&query, "delete from  `mail` where `msgid`=%i", MessageNumber), errbuf);
	else if (!RunQuery(query, MakeAnyLenString(&query, "update `mail` set `status`=%i where `msgid`=%i", Status, MessageNumber), errbuf)) {

		_log(MAIL__ERROR, "Error updating status %s, %s", query, errbuf);

	}

	safe_delete_array(query);
}

void Database::ExpireMail() {

	_log(MAIL__INIT, "Expiring mail...");

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	int32 AffectedRows;

	if (!RunQuery(query,MakeAnyLenString(&query, "select COUNT(*) from `mail` "),errbuf,&result)){
		_log(MAIL__ERROR, "Unable to get message count from database. %s %s", query, errbuf);
		safe_delete_array(query);
		return ;
	}
	safe_delete_array(query);

	row = mysql_fetch_row(result);

	_log(MAIL__INIT, "There are %s messages in the database.", row[0]);

	mysql_free_result(result);

	// Expire Trash
	if(RuleI(Mail, ExpireTrash) >= 0) {
		if(RunQuery(query, MakeAnyLenString(&query, "delete from  `mail` where `status`=4 and `timestamp` < %i", 
			    time(NULL) - RuleI(Mail, ExpireTrash)), errbuf, 0, &AffectedRows)) {
			    _log(MAIL__INIT, "Expired %i trash messages.", AffectedRows);
		}
		else {
			_log(MAIL__ERROR, "Error expiring trash messages, %s %s", query, errbuf);
		}
		safe_delete_array(query);
	}
	// Expire Read
	if(RuleI(Mail, ExpireRead) >= 0) {
		if(RunQuery(query, MakeAnyLenString(&query, "delete from  `mail` where `status`=3 and `timestamp` < %i", 
			    time(NULL) - RuleI(Mail, ExpireRead)), errbuf, 0, &AffectedRows)) {
			    _log(MAIL__INIT, "Expired %i read messages.", AffectedRows);
		}
		else {
			_log(MAIL__ERROR, "Error expiring read messages, %s %s", query, errbuf);
		}
		safe_delete_array(query);
	}
	// Expire Unread
	if(RuleI(Mail, ExpireUnread) >= 0) {
		if(RunQuery(query, MakeAnyLenString(&query, "delete from  `mail` where `status`=1 and `timestamp` < %i", 
			    time(NULL) - RuleI(Mail, ExpireUnread)), errbuf, 0, &AffectedRows)) {
			    _log(MAIL__INIT, "Expired %i unread messages.", AffectedRows);
		}
		else {
			_log(MAIL__ERROR, "Error expiring unread messages, %s %s", query, errbuf);
		}
		safe_delete_array(query);
	}
}

bool Database::GetVariable(const char* varname, char* varvalue, int16 varvalue_len) {

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if (!RunQuery(query,MakeAnyLenString(&query, "select `value` from `variables` where `varname`='%s'", varname), errbuf, &result)) {

		_log(MAIL__ERROR, "Unable to get message count from database. %s %s", query, errbuf);

		safe_delete_array(query);

		return false;
	}

	safe_delete_array(query);

	if (mysql_num_rows(result) != 1) {

		mysql_free_result(result);

		return false;
	}

	row = mysql_fetch_row(result);

	snprintf(varvalue, varvalue_len, "%s", row[0]);

	mysql_free_result(result);

	return true;
}
