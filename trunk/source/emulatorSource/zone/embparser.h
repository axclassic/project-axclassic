//extends the parser to include perl
//Eglin

#ifndef EMBPARSER_H
#define EMBPARSER_H

#ifdef EMBPERL

#include "client.h"
#include "parser.h"
#include "embperl.h"
#include "features.h"

#include <string>
#include <map>
#include <queue>
using namespace std;

class Seperator;

typedef enum {
	questDefault = 1,
	questByName,
	questTemplate,
	questByID
} questMode;

typedef enum {
	itemQuestUnloaded = 1,
	itemQuestScale,
	itemQuestLore,
	itemQuestID
} itemQuestMode;

typedef enum {
	pQuestLoaded = 1,
	pQuestUnloaded,
	pQuestEventCast	// player.pl loaded, has an EVENT_CAST sub
} playerQuestMode;

struct EventRecord {
	QuestEventID event;
	int32 objid;
	string data;
	NPC* npcmob;
	ItemInst* iteminst;
	Mob* mob;
	int32 extradata;
};

class PerlembParser : public Parser
{
protected:
	
	//could prolly get rid of this map now, since I check for the
	//actual subroutine in the quest package as opposed to just seeing
	//if they do not have a quest or the default.
	map<int32, questMode> hasQuests;	//npcid -> questMode
	map<std::string, playerQuestMode> playerQuestLoaded; //zone shortname -> playerQuestMode
	map<std::string, itemQuestMode> itemQuestLoaded;		// package name - > itemQuestMode

	queue<EventRecord> eventQueue;		//for events that happen when perl is in use.
	bool eventQueueProcessing;
	
	void HandleQueue();

	void EventCommon(QuestEventID event, int32 objid, const char * data, NPC* npcmob, ItemInst* iteminst, Mob* mob, int32 extradata);
	
	Embperl * perl;
	//export a symbol table of sorts
	virtual void map_funs();
public:
	PerlembParser(void);
	~PerlembParser();
	Embperl * getperl(void) { return perl; };
	//todo, consider making the following two methods static (need to check for perl!=null, first, then)
	bool isloaded(const char *packagename) const;
//	bool isdefault(const char *packagename) const { return perl->geti(std::string("$").append(packagename).append("::isdefault").c_str()); }
	void Event(QuestEventID event, int32 itemid, const char * data, NPC* npcmob, Mob* mob, int32 extradata = 0);
	void Event(QuestEventID event, int32 itemid, const char * data, ItemInst* iteminst, Mob* mob, int32 extradata = 0);
	int LoadScript(int npcid, const char * zone, Mob* activater=0);
	int LoadPlayerScript(const char *zone);
	int LoadItemScript(ItemInst* iteminst, string packagename, itemQuestMode Qtype);
	
	//expose a var to the script (probably parallels addvar))
	//i.e. exportvar("qst1234", "name", "somemob"); 
	//would expose the variable $name='somemob' to the script that handles npc1234
	void ExportHash(const char *pkgprefix, const char *hashname, std::map<string,string> &vals);
	void ExportVar(const char * pkgprefix, const char * varname, const char * value) const;
	void ExportVar(const char * pkgprefix, const char * varname, int value) const;
	void ExportVar(const char * pkgprefix, const char * varname, unsigned int value) const;
	void ExportVar(const char * pkgprefix, const char * varname, float value) const;
	//I don't escape the strings, so use caution!!
	//Same as export var, except value is not quoted, and is evaluated as perl
	void ExportVarComplex(const char * pkgprefix, const char * varname, const char * value) const;
	
	//get an appropriate namespage/packagename from an npcid
	std::string GetPkgPrefix(int32 npcid, bool defaultOK = true);
	//call the appropriate perl handler. afterwards, parse and dispatch the command queue
	//SendCommands("qst1234", "EVENT_SAY") would trigger sub EVENT_SAY() from the qst1234.pl file
	virtual void SendCommands(const char * pkgprefix, const char *event, int32 npcid, Mob* other, Mob* mob, ItemInst* iteminst);
	virtual void ReloadQuests();
	
	int	HasQuestFile(int32 npcid);
	
	bool HasQuestSub(int32 npcid, const char *subname);
	bool PlayerHasQuestSub(const char *subname);
	
#ifdef EMBPERL_COMMANDS
	void ExecCommand(Client *c, Seperator *sep);
#endif
	
};

#endif //EMBPERL

#endif //EMBPARSER_H
