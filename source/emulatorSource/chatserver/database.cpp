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
#include "chatchannel.h"

extern Clientlist *CL;
extern string GetMailPrefix();
extern ChatChannelList *ChannelList;

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

void Database::GetAccountStatus(Client *c) {

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if (!RunQuery(query,MakeAnyLenString(&query, "select `status`, `hideme`, `karma` from `account` where `id`='%i' limit 1",
					   c->GetAccountID()),errbuf,&result)){

		_log(CHANNELS__ERROR, "Unable to get account status for character %s, error %s", c->GetName().c_str(), errbuf);

		safe_delete_array(query);

		return;
	}

	safe_delete_array(query);

	row = mysql_fetch_row(result);

	c->SetAccountStatus(atoi(row[0]));
	c->SetHideMe(atoi(row[1]));
	c->SetKarma(atoi(row[2]));

	mysql_free_result(result);

	_log(CHANNELS__TRACE, "Set account status to %i, hideme to %i and karma to %i for %s", c->GetAccountStatus(), c->GetHideMe(), c->GetKarma(), c->GetName().c_str());

}

void Database::UpdateKarma(Client *c)
{
	// If a client connects, but they crash before sending us login credentials, their AccountID will be 0, so don't
	// try and update their karma.
	//
	if(c->GetAccountID() == 0) return;
	
	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if (!RunQuery(query,MakeAnyLenString(&query, "select `karma` from `account` where `id`='%i' limit 1",
		c->GetAccountID()),errbuf,&result)){

		_log(CHANNELS__ERROR, "Unable to get Karma for account %i, error %s", c->GetAccountID(), errbuf);
		safe_delete_array(query);
		return;
	}

	safe_delete_array(query);

	if (mysql_num_rows(result) != 1) {

		mysql_free_result(result);

		return;
	}

	row = mysql_fetch_row(result);

	c->SetKarma(atoi(row[0]));

	mysql_free_result(result);

	_log(CHANNELS__TRACE, "Updated Karma to %i for %s", c->GetKarma(), c->GetName().c_str());
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
		_log(CHANNELS__ERROR, "Bad result from query"); fflush(stdout);

		mysql_free_result(result);

		return -1;
	}

	row = mysql_fetch_row(result);

	int AccountID = atoi(row[0]);

	mysql_free_result(result);

	_log(CHANNELS__TRACE, "Account ID for %s is %i", CharacterName, AccountID); fflush(stdout);

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

		_log(CHANNELS__ERROR, "Error retrieving mailkey from database: %s", errbuf);

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

		_log(CHANNELS__ERROR, "Bad result from FindCharacter query for character %s", CharacterName); fflush(stdout);

		mysql_free_result(result);

		return -1;
	}

	row = mysql_fetch_row(result);

	int CharacterID = atoi(row[0]);

	mysql_free_result(result);

	return CharacterID;

}

bool Database::GetVariable(const char* varname, char* varvalue, int16 varvalue_len) {

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if (!RunQuery(query,MakeAnyLenString(&query, "select `value` from `variables` where `varname`='%s'", varname), errbuf, &result)) {

		_log(CHANNELS__ERROR, "Unable to get message count from database. %s %s", query, errbuf);

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

bool Database::LoadChatChannels() {

	_log(CHANNELS__INIT, "Loading chat channels from the database.");

	char errbuf[MYSQL_ERRMSG_SIZE];
	char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;

	if (!RunQuery(query,MakeAnyLenString(&query, "select `name`,`owner`,`password`, `minstatus` from `chatchannels`"),errbuf,&result)){

		_log(CHANNELS__ERROR, "Failed to load channels. %s %s", query, errbuf);
		safe_delete_array(query);

		return false;
	}

	safe_delete_array(query);

	while((row = mysql_fetch_row(result))) {

		string ChannelName = row[0];
		string ChannelOwner = row[1];
		string ChannelPassword = row[2];

		ChannelList->CreateChannel(ChannelName, ChannelOwner, ChannelPassword, true, atoi(row[3]));
	}

	mysql_free_result(result);

	return true;
}

void Database::SetChannelPassword(string ChannelName, string Password) {

	_log(CHANNELS__TRACE, "Database::SetChannelPassword(%s, %s)", ChannelName.c_str(), Password.c_str());

	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE `chatchannels` set `password`='%s' where `name`='%s'", Password.c_str(),
					     ChannelName.c_str()), errbuf)) {

		_log(CHANNELS__ERROR, "Error updating password in database: %s, %s", query, errbuf);

	}

	safe_delete_array(query);
}

void Database::SetChannelOwner(string ChannelName, string Owner) {

	_log(CHANNELS__TRACE, "Database::SetChannelOwner(%s, %s)", ChannelName.c_str(), Owner.c_str());

	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;

	if(!RunQuery(query, MakeAnyLenString(&query, "UPDATE `chatchannels` set `owner`='%s' where `name`='%s'", Owner.c_str(),
					     ChannelName.c_str()), errbuf)) {

		_log(CHANNELS__ERROR, "Error updating Owner in database: %s, %s", query, errbuf);

	}

	safe_delete_array(query);
}
