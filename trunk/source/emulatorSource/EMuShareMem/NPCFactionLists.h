#include "../common/types.h"
#include "../zone/features.h"
#include "../zone/faction.h"
#include "../common/EMuShareMem.h"

// MMF_MAX_NPCFactionList_ID:  Make sure this is bigger than the highest NPCFactionList ID#
#define MMF_MAX_NPCFactionList_ID		50000

struct MMFNPCFactionLists_Struct {
	uint32			MaxNPCFactionListID;
	uint32			NextFreeIndex;
	uint32			NPCFactionListCount;
	uint32			NPCFactionListIndex[MMF_MAX_NPCFactionList_ID+1];
	NPCFactionList	NPCFactionLists[0];
};

bool	pDLLLoadNPCFactionLists(CALLBACK_DBLoadNPCFactionLists cbDBLoadNPCFactionLists, int32 iNPCFactionListStructSize, sint32* iNPCFactionListCount, int32* iMaxNPCFactionListID, int8 iMaxNPCFactions);
bool	pAddNPCFactionList(uint32 id, const NPCFactionList* nfl);
bool	pSetNPCFaction(int32 id, uint32* factionid, sint32* factionvalue, sint8 *factionnpcvalue);
const NPCFactionList* pGetNPCFactionList(uint32 id);
