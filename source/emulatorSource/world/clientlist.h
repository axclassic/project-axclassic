#ifndef CLIENTLIST_H_
#define CLIENTLIST_H_

#include "../common/eq_packet_structs.h"
#include "../common/linked_list.h"
#include "../common/timer.h"
#include "../common/rulesys.h"
#include "../common/servertalk.h"
#include <vector>
#include <string>

class Client;
class ZoneServer;
class WorldTCPConnection;
class ClientListEntry;
class ServerPacket;
struct ServerClientList_Struct;

class ClientList {
public:
	ClientList();
	~ClientList();
	
	void Process();
	
	//from old ClientList
	void	Add(Client* client);
	Client*	Get(int32 ip, int16 port);
	Client* FindByAccountID(int32 account_id);
	Client* FindByName(char* charname);

	void	ZoneBootup(ZoneServer* zs);
	void	RemoveCLEReferances(ClientListEntry* cle);
	
	
	//from ZSList
	
	void	SendWhoAll(int32 fromid,const char* to, sint16 admin, Who_All_Struct* whom, WorldTCPConnection* connection);
	void	SendFriendsWho(ServerFriendsWho_Struct *FriendsWho, WorldTCPConnection* connection);
	void	SendLFGMatches(ServerLFGMatchesRequest_Struct *LFGMatchesRequest);
	void    ConsoleSendWhoAll(const char* to, sint16 admin, Who_All_Struct* whom, WorldTCPConnection* connection);
	void	SendCLEList(const sint16& admin, const char* to, WorldTCPConnection* connection, const char* iName = 0);

	bool	SendPacket(const char* to, ServerPacket* pack);
	void	SendGuildPacket(int32 guild_id, ServerPacket* pack);
	
	void	ClientUpdate(ZoneServer* zoneserver, ServerClientList_Struct* scl);
	void	CLERemoveZSRef(ZoneServer* iZS);
	ClientListEntry* CheckAuth(int32 iLSID, const char* iKey);
	ClientListEntry* CheckAuth(const char* iName, const char* iPassword);
	ClientListEntry* CheckAuth(int32 id, const char* iKey, int32 ip);
	ClientListEntry* FindCharacter(const char* name);
	ClientListEntry* FindCLEByAccountID(int32 iAccID);
	ClientListEntry* FindCLEByCharacterID(int32 iAccID);
	ClientListEntry* GetCLE(int32 iID);
	void	GetCLEIP(int32 iIP);
	void	EnforceSessionLimit(int32 iLSAccountID);
	void	CLCheckStale();
	void	CLEKeepAlive(int32 numupdates, int32* wid);
	void	CLEAdd(int32 iLSID, const char* iLoginName, const char* iLoginKey, sint16 iWorldAdmin = 0, int32 ip = 0, uint8 local=0);
	void	UpdateClientGuild(int32 char_id, int32 guild_id);
	
	int GetClientCount();
	void GetClients(const char *zone_name, std::vector<ClientListEntry *> &into);

protected:
	inline int32 GetNextCLEID() { return NextCLEID++; }
	
	//this is the list of people actively connected to zone
	LinkedList<Client*> list;
	
	//this is the list of people in any zone, not nescesarily connected to world
	Timer	CLStale_timer;
	int32 NextCLEID;
	LinkedList<ClientListEntry *> clientlist;

};




#endif /*CLIENTLIST_H_*/
