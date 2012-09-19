/*  EQEMu:  Everquest Server Emulator
    Copyright (C) 2001-2006  EQEMu Development Team (http://eqemulator.net)

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

#include "bugdb.h"

#define buguploadhost "mysql.eqemu.net"
#define buguploaduser "eqemu_bug"
#define buguploadpassword "bugssuck"
#define buguploaddatabase "eqemubug"


//New Class for bug tracking connection.  I felt it was safer to use a new class, with less methods available to connect
//to the shared database.  Also, this limits the possibilty of something accidently mixing up the connections by keeping
//it completely seperate.

#ifdef BUGTRACK
BugDatabase::BugDatabase()
{
#ifdef EQDEBUG
	cout << "Creating BugDatabase object!" << endl;
#endif
	mysql_init(&mysqlbug);
	if (!mysql_real_connect(&mysqlbug, buguploadhost, buguploaduser, buguploadpassword,buguploaddatabase,0,NULL,0))
	{
	cerr << "Failed to connect to database: Error: " << mysql_error(&mysqlbug) << endl;
	}
	else
	{
	cout << "Connected!" << endl;
 	}

}

bool BugDatabase::RunQuery(const char* query, int32 querylen, char* errbuf, MYSQL_RES** result, int32* affected_rows, int32* errnum, bool retry) {
	if (errnum)
		*errnum = 0;
	if (errbuf)
		errbuf[0] = 0;
	bool ret = false;
	LockMutex lock(&MBugDatabase);
	if (mysql_real_query(&mysqlbug, query, querylen)) {
		if (mysql_errno(&mysqlbug) == CR_SERVER_LOST) {
			if (retry) {
				cout << "Database Error: Lost connection, attempting to recover...." << endl;
				ret = RunQuery(query, querylen, errbuf, result, affected_rows, errnum, false);
			}
			else {
				if (errnum)
					*errnum = mysql_errno(&mysqlbug);
				if (errbuf)
					snprintf(errbuf, MYSQL_ERRMSG_SIZE, "#%i: %s", mysql_errno(&mysqlbug), mysql_error(&mysqlbug));
				cout << "DB Query Error #" << mysql_errno(&mysqlbug) << ": " << mysql_error(&mysqlbug) << endl;
				ret = false;
			}
		}
		else {
			if (errnum)
				*errnum = mysql_errno(&mysqlbug);
			if (errbuf)
				snprintf(errbuf, MYSQL_ERRMSG_SIZE, "#%i: %s", mysql_errno(&mysqlbug), mysql_error(&mysqlbug));
#ifdef EQDEBUG
			cout << "DB Query Error #" << mysql_errno(&mysqlbug) << ": " << mysql_error(&mysqlbug) << endl;
#endif
			ret = false;
		}
	}
	else {
		if (affected_rows) {
			*affected_rows = mysql_affected_rows(&mysqlbug);
		}
		if (result && mysql_field_count(&mysqlbug)) {
			*result = mysql_store_result(&mysqlbug);
			if (*result) {
				ret = true;
			}
			else {
#ifdef EQDEBUG
				cout << "DB Query Error: No Result" << endl;
#endif
				if (errnum)
					*errnum = UINT_MAX;
				if (errbuf)
					strcpy(errbuf, "Database::RunQuery: No Result");
				ret = false;
			}
		}
		else {
			ret = true;
		}
	}
	return ret;
}


bool BugDatabase::UploadBug(const char* bugdetails, const char* version,const char* loginname) {
	
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query=0;
	//char* end=0;

        MYSQL_RES *result;
	//MYSQL_ROW row;
	
#ifdef EQDEBUG
	cout << "Version is : " << version << endl;
	cout << "Loginname is : " << loginname << endl;
#endif

	if (RunQuery(query, MakeAnyLenString(&query, "insert into eqemubugs set loginname='%s', version='%s', bugtxt='%s'", loginname, version, bugdetails), errbuf, &result))
	{
	safe_delete_array(query);
	mysql_free_result(result);
	//mysql_close(conn);
	cout << "Successful bug report" << endl;
	return true;
	}
	else
	{
	safe_delete_array(query);
	//mysql_close(conn);
	cout << "Bug Report submission failed." << endl;
	return false;
	}
	return true;
}

int32 BugDatabase::DoEscapeString(char* tobuf, const char* frombuf, int32 fromlen) {
	LockMutex lock(&MBugDatabase);
	return mysql_real_escape_string(&mysqlbug, tobuf, frombuf, fromlen);
}

BugDatabase::~BugDatabase()
{
#ifdef EQDEBUG	
	cout << "Destroying BugDatabase object" << endl;
#endif
        mysql_close(&mysqlbug);
}

#endif























