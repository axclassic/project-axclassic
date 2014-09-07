#ifndef ZONELIST_H_
#define ZONELIST_H_

#include "../common/types.h"
#include "../common/eqtime.h"
#include "../common/timer.h"
#include "../common/linked_list.h"
#include <vector>

class WorldTCPConnection;
class ServerPacket;
class ZoneServer;

class ZSList
{
public:
	enum { MaxLockedZones = 10 };
	
	static void ShowUpTime(WorldTCPConnection* con, const char* adminname = 0);

	ZSList();
	~ZSList();
	ZoneServer* FindByName(const char* zonename);
	ZoneServer* FindByID(int32 ZoneID);
	ZoneServer* FindByZoneID(int32 ZoneID);
	ZoneServer*	FindByPort(int16 port);
	ZoneServer* FindByInstanceID(int32 InstanceID);
	
	void	SendChannelMessage(const char* from, const char* to, int8 chan_num, int8 language, const char* message, ...);
	void	SendChannelMessageRaw(const char* from, const char* to, int8 chan_num, int8 language, const char* message);
	void	SendEmoteMessage(const char* to, int32 to_guilddbid, sint16 to_minstatus, int32 type, const char* message, ...);
	void	SendEmoteMessageRaw(const char* to, int32 to_guilddbid, sint16 to_minstatus, int32 type, const char* message);

	void	SendZoneStatus(const char* to, sint16 admin, WorldTCPConnection* connection);

	void	SendTimeSync();	
	void	Add(ZoneServer* zoneserver);
	void	Process();
	void	KillAll();
	bool	SendPacket(ServerPacket* pack);
	bool	SendPacket(uint32 zoneid, ServerPacket* pack);
	bool	SendPacket(uint32 zoneid, uint16 instanceid, ServerPacket* pack);
	inline int32	GetNextID()		{ return NextID++; }
	void	RebootZone(const char* ip1,int16 port, const char* ip2, int32 skipid, int32 zoneid = 0);
	int32	TriggerBootup(int32 iZoneID, int32 iInstanceID = 0);
	void	SOPZoneBootup(const char* adminname, int32 ZoneServerID, const char* zonename, bool iMakeStatic = false);
	EQTime	worldclock;
	bool	SetLockedZone(int16 iZoneID, bool iLock);
	bool	IsZoneLocked(int16 iZoneID);
	void	ListLockedZones(const char* to, WorldTCPConnection* connection);
	Timer*	shutdowntimer;
	Timer*	reminder;
	void	NextGroupIDs(int32 &start, int32 &end);
	void	SendLSZones();
	uint16  GetAvailableZonePort();

	int GetZoneCount();
	void GetZoneIDList(std::vector<int32> &zones);
	
protected:
	int32 NextID;
	LinkedList<ZoneServer*> list;
	int16	pLockedZones[MaxLockedZones];
	int32 CurGroupID;
	uint16 LastAllocatedPort;
	
	
};













#endif /*ZONELIST_H_*/
