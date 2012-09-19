#ifndef PATHING_H
#define PATHING_H
#include <algorithm>
#include "map.h"
#include "../common/timer.h"
#include <list>
#include <vector>
#include <algorithm>

using namespace std;

class Client;

#define PATHNODENEIGHBOURS 50

#pragma pack(1)

struct AStarNode
{
	int PathNodeID;
	int Parent;
	float HCost;
	float GCost;
	bool Teleport;
};

struct NeighbourNode {
	sint16 id;
	float distance;
	uint8 Teleport;
	sint16 DoorID;
};

struct PathNode {
	uint16 id;
	VERTEX v;
	float bestz;
	NeighbourNode Neighbours[PATHNODENEIGHBOURS];
};

struct PathFileHeader {
	int32 version;
	int32 PathNodeCount;
};

#pragma pack()

struct PathNodeSortStruct
{
	int id;
	float Distance;
};

enum LOSType{ UnknownLOS, HaveLOS, NoLOS };

class PathManager {

public:
	PathManager();
	~PathManager();


	static PathManager *LoadPathFile(const char *ZoneName);
	bool loadPaths(FILE *fp);
	void PrintPathing();
	list<int> FindRoute(VERTEX Start, VERTEX End);
	list<int> FindRoute(int startID, int endID);

	VERTEX GetPathNodeCoordinates(int NodeNumber, bool BestZ = true);
	bool CheckLosFN(VERTEX a, VERTEX b);
	void SpawnPathNodes();
	void MeshTest();
	void SimpleMeshTest();
	int FindNearestPathNode(VERTEX Position);
	bool NoHazards(VERTEX From, VERTEX To);
	bool NoHazardsAccurate(VERTEX From, VERTEX To);
	void OpenDoors(int Node1, int Node2, Mob* ForWho);

	PathNode* FindPathNodeByCoordinates(float x, float y, float z);
	void ShowPathNodeNeighbours(Client *c);
	int GetRandomPathNode();

	void NodeInfo(Client *c);
	sint32 AddNode(float x, float y, float z, float best_z, sint32 requested_id = 0); //return -1 on failure, else returns the id of this node
	bool DeleteNode(Client *c);
	bool DeleteNode(sint32 id); //returns true on success, false on failure, tries to delete a node from this map
	void ConnectNodeToNode(Client *c, sint32 Node2, sint32 teleport = 0, sint32 doorid = -1); //connects a node both ways
	void ConnectNodeToNode(sint32 Node1, sint32 Node2, sint32 teleport = 0, sint32 doorid = -1);
	void ConnectNode(Client *c, sint32 Node2, sint32 teleport = 0, sint32 doorid = -1); //connects a node one way
	void ConnectNode(sint32 Node1, sint32 Node2, sint32 teleport = 0, sint32 doorid = -1);
	void DisconnectNodeToNode(Client *c, sint32 Node2);
	void DisconnectNodeToNode(sint32 Node1, sint32 Node2);
	void MoveNode(Client *c);
	void DisconnectAll(Client *c);
	bool NodesConnected(PathNode *a, PathNode *b);
	void DumpPath(string filename);
	void ProcessNodesAndSave(string filename);
	void ResortConnections();
	void QuickConnect(Client *c, bool set = false);
	void SortNodes();

private:
	PathFileHeader Head;
	PathNode *PathNodes;
	int QuickConnectTarget;

	int *ClosedListFlag;
};

	
#endif

