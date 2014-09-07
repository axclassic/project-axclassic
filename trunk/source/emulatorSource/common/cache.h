#include "types.h"

class Cache {
public:
	Cache();
	~Cache();

	const Item_Struct*	GetItem(int32 iID);
	const NPCType*		GetNPCType(int32 iID);
	int32				GetZoneID(const char* zonename);
	const char*			GetZoneName(int32 zoneID, bool ErrorUnknown = false);
private:
	int32				max_zonename;
	char**				zonename_array;
	uint32				max_item;
	Item_Struct**		item_array;
	uint32				max_npc_type;
	NPCType**			npc_type_array;
};

