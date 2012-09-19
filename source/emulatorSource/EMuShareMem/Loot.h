#include "../common/types.h"
#include "../common/eq_packet_structs.h"
#include "../common/EMuShareMem.h"

#pragma pack(1)
struct MMFLoot_Struct {
	bool				Loaded;
	uint32				MaxLootTableID;
	uint32				LootTableCount;
	uint32				LootTableOffset;
	uint32				MaxLootDropID;
	uint32				LootDropCount;
	uint32				LootDropOffset;
	uint32				datamax;
	uint32				dataindex;
	uint8				data[0];
};
#pragma pack()

bool	pDLLLoadLoot(CALLBACK_DBLoadLoot cbDBLoadLoot, 
					 int32 iLootTableStructsize, int32 iLootTableCount, int32 iMaxLootTable,
					 int32 iLootTableEntryStructsize, int32 iLootTableEntryCount,
					 int32 iLootDropStructsize, int32 iLootDropCount, int32 iMaxLootDrop,
					 int32 iLootDropEntryStructsize, int32 iLootDropEntryCount
					 );
bool	pAddLootTable(int32 id, const LootTable_Struct* lts);
bool	pAddLootDrop(int32, const LootDrop_Struct* lds);
const LootTable_Struct*		pGetLootTable(uint32 id);
const LootDrop_Struct*		pGetLootDrop(uint32 id);
