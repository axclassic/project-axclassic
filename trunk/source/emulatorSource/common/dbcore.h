#ifndef DBCORE_H
#define DBCORE_H

#ifdef WIN32
	#include <winsock.h>
	#include <windows.h>
	//#include <winsock.h>
#endif
#include <mysql.h>
#include "../common/DBMemLeak.h"
#include "../common/types.h"
#include "../common/Mutex.h"
#include "../common/linked_list.h"
#include "../common/queue.h"
#include "../common/timer.h"
#include "../common/Condition.h"

class DBcore {
public:
	enum eStatus { Closed, Connected, Error };

	DBcore();
	~DBcore();
	eStatus	GetStatus() { return pStatus; }
	bool	RunQuery(const char* query, int32 querylen, char* errbuf = 0, MYSQL_RES** result = 0, int32* affected_rows = 0, int32* last_insert_id = 0, int32* errnum = 0, bool retry = true);
	int32	DoEscapeString(char* tobuf, const char* frombuf, int32 fromlen);
	void	ping();
	MYSQL*	getMySQL(){ return &mysql; }
	
	static bool	ReadDBINI(char *host, char *user, char *pass, char *db, int32 &port, bool &compress, bool *items);
protected:
	bool	Open(const char* iHost, const char* iUser, const char* iPassword, const char* iDatabase, int32 iPort, int32* errnum = 0, char* errbuf = 0, bool iCompress = false, bool iSSL = false);
private:
	bool	Open(int32* errnum = 0, char* errbuf = 0);

	MYSQL	mysql;
	Mutex	MDatabase;
	eStatus pStatus;

	char*	pHost;
	char*	pUser;
	char*	pPassword;
	char*	pDatabase;
	bool	pCompress;
	int32	pPort;
	bool	pSSL;

};


#endif

