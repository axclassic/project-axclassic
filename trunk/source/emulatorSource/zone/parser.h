#ifndef PARSER_H
#define PARSER_H

#define Parser_MaxVars	1024
#include "../common/timer.h"
#include <string>
#include <list>
#include "event_codes.h"


struct EventList { 
	std::string event;
	std::string command;
};

struct Events {
int32 npcid; 
std::list<EventList*> Event;
};

struct Alias {
	int index;
	int32 npcid;
	char name[100][100];
	char command[100][1024];
};

struct vars {
	std::string name;
	std::string value;
};

struct command_list {
	char command_name[100];
	int param_amount[17];
};


class Parser
{
public:
	Parser();
	virtual ~Parser();
	int mindex;
	const std::string DEFAULT_QUEST_PREFIX;
	
	typedef list<Events*>::iterator iter_events;
	typedef list<EventList*>::iterator iter_eventlist;
	std::list<Events*> MainList;
	std::list<vars*> varlist;
	std::list<Alias*> AliasList;
	int32	npcarrayindex;
	void	AddVar(std::string varname, std::string varval);

	int32	AddNPCQuestID(int32 npcid);
	int32	FindNPCQuestID(sint32 npcid);
	int		CheckAliases(const char * alias, int32 npcid, Mob* npcmob, Mob* mob);
	void	ClearAliasesByNPCID(int32 iNPCID);
	void	ClearCache();
	void	ClearEventsByNPCID(int32 iNPCID);

	void	DelChatAndItemVars(int32 npcid);
	void	DeleteVar(std::string name);

	//void	Event(int event, int32 npcid, const char * data, Mob* npcmob, Mob* mob);
	//changed - Eglin.  more reasonable (IMHO) than changing every single referance to the global pointer.
	//that's what you get for using globals! :)
	virtual void    Event(QuestEventID event, int32 npcid, const char * data, NPC* npcmob, Mob* mob, int32 extradata = 0);

	void	ExCommands(std::string command, std::string parms, int argnums, int32 npcid, Mob* other, Mob* mob );

	void	GetCommandName(char * command1, char * arg);
	int		GetFreeID();
	int		GetItemCount(std::string itemid, int32 npcid);
	sint32	GetNPCqstID(int32 iNPCID);
	std::string	GetVar(std::string varname, int32 npcid);

	void	HandleVars(std::string varname, std::string varparms, std::string& origstring, std::string format, int32 npcid, Mob* mob);

	bool	LoadAttempted(int32 iNPCID);
	void	LoadCommands(const char * filename);
	virtual int 	LoadScript(int npcid, const char * zone, Mob* activater=0);

	void	MakeParms(const char * string, int32 npcid);
	void	MakeVars(std::string text, int32 npcid);

	int		numtok(const char *text, char character);

	int		ParseCommands(std::string text, int line, int justcheck, int32 npcid, Mob* other, Mob* mob, std::string filename=string("none"));
	int		ParseIf(std::string text);
	int		pcalc(const char * string);
	void    ParseVars(std::string& text, int32 npcid, Mob* mob);

	void	Replace(std::string& string1, std::string repstr, std::string rep, int all=0);

	void	scanformat(char *string, const char *format, char arg[10][1024]);
	bool	SetNPCqstID(int32 iNPCID, sint32 iValue);
	char *  strrstr(char* string, const char * sub);
	virtual void	SendCommands(const char * event, int32 npcid, NPC* npcmob, Mob* mob);

	int	HasQuestFile(int32 npcid);
	
	virtual void ReloadQuests();

private:

	int32	pMaxNPCID;
	sint32*	pNPCqstID;
};

extern Parser* parse;

#endif

