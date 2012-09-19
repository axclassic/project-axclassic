#ifndef DBASYNC_H
#define DBASYNC_H
#include "../common/dbcore.h"
#include "../common/timeoutmgr.h"


class DBAsyncFinishedQueue;
class DBAsyncWork;
class DBAsyncQuery;
class Database;

// Big daddy that owns the threads and does the work
class DBAsync : private Timeoutable {
public:
	enum Status { AddingWork, Queued, Executing, Finished, Canceled };
	enum Type { Read, Write, Both };

	DBAsync(DBcore* iDBC);
	~DBAsync();
	bool	StopThread();

	int32	AddWork(DBAsyncWork** iWork, int32 iDelay = 0);
	bool	CancelWork(int32 iWorkID);
	void	CommitWrites();

	void	AddFQ(DBAsyncFinishedQueue* iDBAFQ);
protected:
	//things related to the processing thread:
	friend ThreadReturnType DBAsyncLoop(void* tmp);
	Mutex	MLoopRunning;
	Condition CInList;
	bool	RunLoop();
	void	Process();
	
private:
	virtual void CheckTimeout();
	
	void	ProcessWork(DBAsyncWork* iWork, bool iSleep = true);
	void	DispatchWork(DBAsyncWork* iWork);
	inline	int32	GetNextID()		{ return pNextID++; }
	DBAsyncWork*	InListPop();
	DBAsyncWork*	InListPopWrite();	// Ignores delay
	void			OutListPush(DBAsyncWork* iDBAW);

	Mutex	MRunLoop;
	bool	pRunLoop;

	DBcore*	pDBC;
	int32	pNextID;
	Mutex	MInList;
	LinkedList<DBAsyncWork*> InList;

	Mutex	MFQList;
	LinkedList<DBAsyncFinishedQueue**> FQList;

	// Mutex for outside access to current work & when current work is being changed.
	// NOT locked when CurrentWork is being accessed by the DBAsync thread.
	// Never change pointer from outside DBAsync thread!
	// Only here for access to thread-safe DBAsyncWork functions.
	Mutex	MCurrentWork;
	DBAsyncWork* CurrentWork;

};

/*
	DB Work Complete Callback:
		This will be called under the DBAsync thread! Never access any non-threadsafe 
		data/functions/classes. (ie: zone, entitylist, client, etc are not threadsafe)
	Function prototype:
		return value:	true if we should delete the data, false if we should keep it
*/
typedef bool(*DBWorkCompleteCallBack)(DBAsyncWork*);

class DBAsyncFinishedQueue {
public:
	DBAsyncFinishedQueue(int32 iTimeout = 90000);
	~DBAsyncFinishedQueue();

	DBAsyncWork*	Pop();
	DBAsyncWork*	PopByWPT(int32 iWPT);
	DBAsyncWork*	Find(int32 iWPT);
	bool			Push(DBAsyncWork* iDBAW);

	void			CheckTimeouts();
private:
	Mutex MLock;
	int32 pTimeout;
	LinkedList<DBAsyncWork*> list;
};

// Container class for multiple queries
class DBAsyncWork {
public:
	DBAsyncWork(Database *db, DBAsyncFinishedQueue* iDBAFQ, int32 iWPT = 0, DBAsync::Type iType = DBAsync::Both, int32 iTimeout = 0);
	DBAsyncWork(Database *db, DBWorkCompleteCallBack iCB, int32 iWPT = 0, DBAsync::Type iType = DBAsync::Both, int32 iTimeout = 0);
	~DBAsyncWork();

	bool			AddQuery(DBAsyncQuery** iDBAQ);
	bool			AddQuery(int32 iQPT, char** iQuery, int32 iQueryLen = 0xFFFFFFFF, bool iGetResultSet = true, bool iGetErrbuf = true);
	int32			WPT();
	DBAsync::Type	Type();

	// Pops finished queries off the work
	DBAsyncQuery*	PopAnswer();
	int32			QueryCount();
	
	Database *GetDB() const { return(m_db); }

	bool			CheckTimeout(int32 iFQTimeout);
	bool			SetWorkID(int32 iWorkID);
	int32			GetWorkID();
protected:
	friend class DBAsync;
	DBAsync::Status	SetStatus(DBAsync::Status iStatus);
	bool			Cancel();
	bool			IsCancled();
	DBAsyncQuery*	PopQuery();	// Get query to be run
	void			PushAnswer(DBAsyncQuery* iDBAQ);	// Push answer back into workset

	// not mutex'd cause only to be accessed from dbasync class
	int32	pExecuteAfter;
private:
	Mutex	MLock;
	int32	pQuestionCount;
	int32	pAnswerCount;
	int32	pWorkID;
	int32	pWPT;
	int32	pTimeout;
	int32	pTSFinish; // timestamp when finished
	DBAsyncFinishedQueue*	pDBAFQ;		//we do now own this pointer
	DBWorkCompleteCallBack	pCB;
	DBAsync::Status			pstatus;
	DBAsync::Type			pType;
	MyQueue<DBAsyncQuery>	todo;
	MyQueue<DBAsyncQuery>	done;
	MyQueue<DBAsyncQuery>	todel;
	Database *const			m_db;		//we do now own this pointer
};

// Container class for the query information
class DBAsyncQuery {
public:
	DBAsyncQuery(int32 iQPT, char** iQuery, int32 iQueryLen = 0xFFFFFFFF, bool iGetResultSet = true, bool iGetErrbuf = true);
	DBAsyncQuery(int32 iQPT, const char* iQuery, int32 iQueryLen = 0xFFFFFFFF, bool iGetResultSet = true, bool iGetErrbuf = true);
	~DBAsyncQuery();

	bool	GetAnswer(char* errbuf = 0, MYSQL_RES** result = 0, int32* affected_rows = 0, int32* last_insert_id = 0, int32* errnum = 0);
	inline int32 QPT()	{ return pQPT; }
protected:
	friend class DBAsyncWork;
	int32		pQPT;

	friend class DBAsync;
	void		Process(DBcore* iDBC);

	void		Init(int32 iQPT, bool iGetResultSet, bool iGetErrbuf);
	DBAsync::Status pstatus;
	char*		pQuery;
	int32		pQueryLen;
	bool		pGetResultSet;
	bool		pGetErrbuf;

	bool		pmysqlsuccess;
	char*		perrbuf;
	int32		perrnum;
	int32		paffected_rows;
	int32		plast_insert_id;
	MYSQL_RES*	presult;
};


void AsyncLoadVariables(DBAsync *dba, Database *db);


#endif

