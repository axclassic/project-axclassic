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
#ifndef BUGDB_H_
#define BUGDB_H_



#ifdef BUGTRACK
class BugDatabase
{
public:
	BugDatabase();
	BugDatabase(const char* host, const char* user, const char* passwd, const char* database);

	~BugDatabase();
	bool UploadBug(const char* bugdetail, const char* version, const char* loginname);
protected:
	bool	RunQuery(const char* query, int32 querylen, char* errbuf = 0, MYSQL_RES** result = 0, int32* affected_rows = 0, int32* errnum = 0, bool retry = true);
	int32	DoEscapeString(char* tobuf, const char* frombuf, int32 fromlen);

private:
	MYSQL	mysqlbug;
	Mutex	MBugDatabase;

};
#endif



#endif /*BUGDB_H_*/
