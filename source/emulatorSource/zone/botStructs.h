#ifndef BOT_STRUCTS
#define BOT_STRUCTS

#ifdef EQBOTS

#include "../common/types.h"

struct BotsAvailableList {
	uint32 BotID;
	char BotName[64];
	uint16 BotClass;
	uint8 BotLevel;
	uint16 BotRace;
};

struct BotInventory {
	uint32 BotID;
	uint32 BotSlotID;
	uint32 ItemID;
};

struct BotGroup {
	uint32 GroupID;
	uint32 BotID;
	uint32 CharacterID;
};

struct SpawnedBotsList {
	char BotName[64];
	char ZoneName[64];
	uint32 BotLeaderCharID;
};

#endif // EQBOTS

#endif // BOT_STRUCTS