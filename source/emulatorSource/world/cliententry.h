#ifndef CLIENTENTRY_H_
#define CLIENTENTRY_H_

#include "../common/types.h"
#include "../common/md5.h"
//#include "../common/eq_packet_structs.h"
#include "../common/servertalk.h"


#define CLE_Status_Never		-1
#define CLE_Status_Offline		0
#define CLE_Status_Online		1	// Will not overwrite more specific online status
#define CLE_Status_CharSelect	2
#define CLE_Status_Zoning		3
#define CLE_Status_InZone		4

class ZoneServer;
struct ServerClientList_Struct;

class ClientListEntry {
public:
	ClientListEntry(int32 id, int32 iLSID, const char* iLoginName, const char* iLoginKey, sint16 iWorldAdmin = 0, int32 ip = 0, uint8 local=0);
	ClientListEntry(int32 id, int32 iAccID, const char* iAccName, MD5& iMD5Pass, sint16 iAdmin = 0);
	ClientListEntry(int32 id, ZoneServer* iZS, ServerClientList_Struct* scl, sint8 iOnline);
	~ClientListEntry();
	bool	CheckStale();
	void	Update(ZoneServer* zoneserver, ServerClientList_Struct* scl, sint8 iOnline = CLE_Status_InZone);
	void	LSUpdate(ZoneServer* zoneserver);
	void	LSZoneChange(ZoneToZone_Struct* ztz);
	bool	CheckAuth(int32 iLSID, const char* key);
	bool	CheckAuth(const char* iName, MD5& iMD5Password);
	bool	CheckAuth(int32 id, const char* key, int32 ip);
	void	SetOnline(ZoneServer* iZS, sint8 iOnline);
	void	SetOnline(sint8 iOnline = CLE_Status_Online);
	void	SetChar(int32 iCharID, const char* iCharName);
	inline sint8		Online()		{ return pOnline; }
	inline const int32	GetID()	 const	{ return id; }
	inline const int32	GetIP()	 const	{ return pIP; }
	inline void			SetIP(const int32& iIP) { pIP = iIP; }
	inline void			KeepAlive()		{ stale = 0; }
	inline int8			GetStaleCounter()  const { return stale; }
	void	LeavingZone(ZoneServer* iZS = 0, sint8 iOnline = CLE_Status_Offline);
	void	Camp(ZoneServer* iZS = 0);

	// Login Server stuff
	inline int32		LSID()	const		{ return pLSID; }
	inline int32		LSAccountID() const	{ return pLSID; }
	inline const char*	LSName() const		{ return plsname; }
	inline sint16		WorldAdmin() const	{ return pworldadmin; }
	inline const char*	GetLSKey() const	{ return plskey; }

	// Account stuff
	inline int32		AccountID() const		{ return paccountid; }
	inline const char*	AccountName() const		{ return paccountname; }
	inline sint16		Admin() const			{ return padmin; }
	inline void			SetAdmin(int16 iAdmin)	{ padmin = iAdmin; }

	// Character info
	inline ZoneServer*	Server() const		{ return pzoneserver; }
	inline void			ClearServer()		{ pzoneserver = 0; }
	inline int32		CharID() const		{ return pcharid; }
	inline const char*	name() const		{ return pname; }
	inline int32		zone() const		{ return pzone; }
	inline int16		instance() const	{ return pinstance; }
	inline int8			level() const		{ return plevel; }
	inline int8			class_() const		{ return pclass_; }
	inline int16		race() const		{ return prace; }
	inline int8			Anon()				{ return panon; }
	inline int8			TellsOff() const	{ return ptellsoff; }
	inline int32		GuildID() const	{ return pguild_id; }
	inline void			SetGuild(int32 guild_id) { pguild_id = guild_id; }
	inline bool			LFG() const			{ return pLFG; }
	inline int8			GetGM() const		{ return gm; }
	inline void			SetGM(int8 igm)	{ gm = igm; }
	inline void			SetZone(int32 zone) { pzone = zone; }
	inline bool	IsLocalClient() const { return plocal; }
	inline int8			GetLFGFromLevel() const { return pLFGFromLevel; }
	inline int8			GetLFGToLevel() const { return pLFGToLevel; }
	inline bool			GetLFGMatchFilter() const { return pLFGMatchFilter; }
	inline const char*		GetLFGComments() const { return pLFGComments; }

private:
	void	ClearVars(bool iAll = false);

	const int32	id;
	int32	pIP;
	sint8	pOnline;
	int8	stale;

	// Login Server stuff
	int32	pLSID;
	char	plsname[32];
	char	plskey[16];
	sint16	pworldadmin;		// Login server's suggested admin status setting
	bool	plocal;

	// Account stuff
	int32	paccountid;
	char	paccountname[32];
	MD5		pMD5Pass;
	sint16	padmin;

	// Character info
	ZoneServer* pzoneserver;
	int32	pzone;
	int16	pinstance;
	int32	pcharid;
	char	pname[64];
	int8	plevel;
	int8	pclass_;
	int16	prace;
	int8	panon;
	int8	ptellsoff;
	int32	pguild_id;
	bool	pLFG;
	int8	gm;
	int8	pLFGFromLevel;
	int8	pLFGToLevel;
	bool	pLFGMatchFilter;
	char	pLFGComments[64];
};


#endif /*CLIENTENTRY_H_*/
