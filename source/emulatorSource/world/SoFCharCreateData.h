#ifndef SOFCHARCREATEDATA_H
#define SOFCHARCREATEDATA_H

#pragma pack(1)

struct SoFCCRaceClassData {
	unsigned int Index;
	unsigned int BaseStats[7];
	unsigned int DefaultPointAllocation[7];
};

struct SoFCCStartZoneData {
	unsigned char Unknown1;
	unsigned char Unknown2;
	unsigned char Unknown3;
	unsigned char Unknown4;
	unsigned int Race;
	unsigned int Class;
	unsigned int Deity;
	unsigned int Unknown7;
	unsigned int Zone;
};
	
struct SoFCCData {
	unsigned char Unknown;
	unsigned int RaceClassStatEntryCount;
	SoFCCRaceClassData RCData[109];
	unsigned int Unknown2;
	SoFCCStartZoneData StartZoneData[641];
};


static struct SoFCCData SoFCharCreateInfo = {
	0,
	109,	// Number of Race/Class Combinations
	{
	// Data for most Wizards is missing for some reason. CC still works for them though.
	//
	//     Index         Base Stats                            Default Point Allocation
              {   0, { 103,  70,  87, 105,  60,  80,  60 }, {   0,   5,   5,   5,   0,   5,   0 } }, // Barbarian	Beastlord
              {   1, { 113,  80,  82, 100,  60,  70,  55 }, {  25,   0,   0,   0,   0,   0,   0 } }, //			Berzerker
              {   2, { 103,  80,  92,  95,  60,  70,  55 }, {  25,   5,   0,   0,   0,   0,   0 } }, //			Rogue
              {   3, { 103,  70,  82, 100,  60,  80,  60 }, {   0,   0,   0,   5,   0,  25,   0 } }, //			Shaman
              {   4, { 113,  70,  87, 105,  60,  70,  55 }, {   0,   0,   0,  25,   0,   0,   0 } }, //			Warrior
              {   5, {  65,  75,  90,  70,  99,  93,  60 }, {   0,   0,   0,   5,   0,  25,   0 } }, // Dark Elf	Cleric
              {   6, {  60,  75,  90,  65, 109,  83,  70 }, {   0,   0,   0,   0,   5,   0,  25 } }, //			Enchanter
              {   7, {  60,  75,  90,  75, 109,  83,  60 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Magician
              {   8, {  60,  85,  90,  65, 109,  83,  60 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Necro
              {   9, {  60,  85, 100,  65,  99,  83,  60 }, {  25,   5,   0,   0,   0,   0,   0 } }, //			Rogue
              {  10, {  70,  75,  90,  70, 109,  83,  65 }, {   0,   0,   0,  20,   0,   0,   0 } }, // 		SK
              {  11, {  70,  75,  95,  75,  99,  83,  60 }, {   0,   0,   0,  25,   0,   0,   0 } }, // 		Warrior
              {  12, { 100, 100,  70,  95,  60,  83,  45 }, {  25,   0,   0,   0,   0,   0,   0 } }, // Dwarf		Berzerker
              {  13, {  95,  90,  70,  95,  60,  93,  45 }, {   0,   0,   0,   5,   0,  25,   0 } }, //			Cleric
              {  14, { 100,  90,  70,  95,  60,  88,  55 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			Paladin
              {  15, {  90, 100,  80,  90,  60,  83,  45 }, {  25,   5,   0,   0,   0,   0,   0 } }, //			Rogue 
              {  16, { 100,  90,  75, 100,  60,  83,  45 }, {   0,   0,   0,  25,   0,   0,   0 } }, //			Warrior
              {  17, {  65,  70,  70,  75, 107,  93,  70 }, {   0,   0,   0,   5,   0,  25,   0 } }, // Erudite		Cleric
              {  18, {  60,  70,  70,  70, 117,  83,  80 }, {   0,   0,   0,   0,   5,   0,  25 } }, //			Enchanter
              {  19, {  60,  70,  70,  80, 117,  83,  70 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Magician
              {  20, {  60,  80,  70,  70, 117,  83,  70 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Necro
              {  21, {  70,  70,  70,  75, 107,  88,  80 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			Paladin
              {  22, {  70,  70,  70,  75, 117,  83,  75 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			SK
              {  23, {  65,  85,  85,  75,  98,  77,  60 }, {   0,   0,   0,   5,   0,  25,   0 } }, // Gnome		Cleric
              {  24, {  60,  85,  85,  70, 108,  67,  70 }, {   0,   0,   0,   0,   5,   0,  25 } }, //			Enchanter
              {  25, {  60,  85,  85,  80, 108,  67,  60 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Magician
              {  26, {  60,  95,  85,  70, 108,  67,  60 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Necro
              {  27, {  70,  85,  85,  75,  98,  72,  70 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			Paladin
              {  28, {  60,  95,  95,  70,  98,  67,  60 }, {  25,   5,   0,   0,   0,   0,   0 } }, //			Rogue
              {  29, {  70,  85,  85,  75, 108,  67,  65 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			SK
              {  30, {  70,  85,  90,  80,  98,  67,  60 }, {   0,   0,   0,  25,   0,   0,   0 } }, //			Warrior
              {  31, {  75,  95,  90,  70,  75,  60,  85 }, {   0,   0,   0,   0,   0,   0,  25 } }, // Half Elf	Bard
              {  32, {  70,  85,  90,  80,  75,  70,  75 }, {   0,   0,   0,   5,   0,  25,   0 } }, //			Druid
              {  33, {  80,  85,  90,  75,  75,  65,  85 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			Paladin
              {  34, {  75,  85, 100,  80,  75,  65,  75 }, {   0,  20,   0,   0,   0,   0,   0 } }, //			Ranger
              {  35, {  70,  95, 100,  70,  75,  60,  75 }, {  25,   5,   0,   0,   0,   0,   0 } }, //			Rogue
              {  36, {  80,  85,  95,  80,  75,  60,  75 }, {   0,   0,   0,  25,   0,   0,   0 } }, //			Warrior
              {  37, {  75,  90,  95,  80,  67,  90,  50 }, {   0,   0,   0,   5,   0,  25,   0 } }, // Halfling	Cleric
              {  38, {  70,  90,  95,  85,  67,  90,  50 }, {   0,   0,   0,   5,   0,  25,   0 } }, // 		Druid
              {  39, {  80,  90,  95,  80,  67,  85,  60 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			Paladin
              {  40, {  75,  90, 105,  85,  67,  85,  50 }, {   0,  20,   0,   0,   0,   0,   0 } }, //			Ranger
              {  41, {  70, 100, 105,  75,  67,  80,  50 }, {  25,   5,   0,   0,   0,   0,   0 } }, //			Rogue
              {  42, {  80,  90, 100,  85,  67,  80,  50 }, {   0,   0,   0,  25,   0,   0,   0 } }, //			Warrior
              {  43, {  60,  70,  85,  70,  92, 105,  80 }, {   0,   0,   0,   5,   0,  25,   0 } }, // High Elf	Cleric
              {  44, {  55,  70,  85,  65, 102,  95,  90 }, {   0,   0,   0,   0,   5,   0,  25 } }, //			Enchanter
              {  45, {  55,  70,  85,  75, 102,  95,  80 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Magician
              {  46, {  65,  70,  85,  70,  92, 100,  90 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			Paladin
              {  47, {  80,  85,  75,  75,  75,  75,  85 }, {   0,   0,   0,   0,   0,   0,  25 } }, //	Human		Bard
              {  48, {  80,  75,  75,  80,  75,  85,  75 }, {   0,   0,   0,   5,   0,  25,   0 } }, //			Cleric
              {  49, {  75,  75,  75,  85,  75,  85,  75 }, {   0,   0,   0,   5,   0,  25,   0 } }, //			Druid
              {  50, {  75,  75,  75,  75,  85,  75,  85 }, {   0,   0,   0,   0,   5,   0,  25 } }, //			Enchanter
              {  51, {  75,  75,  75,  85,  85,  75,  75 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Magician
              {  52, {  80,  85,  85,  80,  75,  75,  75 }, {   0,   0,  20,   0,   0,   0,   0 } }, //			Monk
              {  53, {  75,  85,  75,  75,  85,  75,  75 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Necro
              {  54, {  85,  75,  75,  80,  75,  80,  85 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			Paladin
              {  55, {  80,  75,  85,  85,  75,  80,  75 }, {   0,  20,   0,   0,   0,   0,   0 } }, //			Ranger
              {  56, {  75,  85,  85,  75,  75,  75,  75 }, {  25,   5,   0,   0,   0,   0,   0 } }, //			Rogue
              {  57, {  85,  75,  75,  80,  85,  75,  80 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			SK
              {  58, {  85,  75,  80,  85,  75,  75,  75 }, {   0,   0,   0,  25,   0,   0,   0 } }, //			Warrior
              {  59, {  70,  85,  95,  80,  75,  90,  60 }, {   0,   5,   5,   5,   0,   5,   0 } }, // Iksar		Beastlord
              {  60, {  75,  95, 100,  75,  75,  80,  55 }, {   0,   0,  20,   0,   0,   0,   0 } }, //			Monk
              {  61, {  70,  95,  90,  70,  85,  80,  55 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Necro
              {  62, {  80,  85,  90,  75,  85,  80,  60 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			SK
              {  63, {  70,  85,  90,  75,  75,  90,  60 }, {   0,   0,   0,   5,   0,  25,   0 } }, //			Shaman
              {  64, {  80,  85,  95,  80,  75,  80,  55 }, {   0,   0,   0,  25,   0,   0,   0 } }, //			Warrior
              {  65, { 130,  70,  75, 132,  60,  77,  42 }, {   0,   5,   5,   5,   0,   5,   0 } }, // Ogre		Beastlord
              {  66, { 140,  80,  70, 127,  60,  67,  37 }, {  25,   0,   0,   0,   0,   0,   0 } }, //			Berserker
              {  67, { 140,  70,  70, 127,  70,  67,  42 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			SK
              {  68, { 130,  70,  70, 127,  60,  77,  42 }, {   0,   0,   0,   5,   0,  25,   0 } }, //			Shaman
              {  69, { 140,  70,  75, 132,  60,  67,  37 }, {   0,   0,   0,  25,   0,   0,   0 } }, //			Warrior
              {  70, { 108,  75,  88, 119,  52,  70,  45 }, {   0,   5,   5,   5,   0,   5,   0 } }, //	Troll		Beastlord
              {  71, { 118,  85,  83, 114,  52,  60,  40 }, {  25,   0,   0,   0,   0,   0,   0 } }, //			Berserker
              {  72, { 118,  75,  83, 114,  62,  60,  45 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			SK
              {  73, { 108,  75,  83, 114,  52,  70,  45 }, {   0,   0,   0,   5,   0,  25,   0 } }, //			Shaman
              {  74, { 118,  75,  88, 119,  52,  60,  40 }, {   0,   0,   0,  25,   0,   0,   0 } }, //			Warrior
              {  75, {  95,  80,  90,  75,  65,  70,  75 }, {   0,   0,   0,   0,   0,   0,  25 } }, // Vah Shir	Bard
              {  76, {  90,  70,  95,  85,  65,  80,  70 }, {   0,   5,   5,   5,   0,   5,   0 } }, //			Beastlord
              {  77, { 100,  80,  90,  80,  65,  70,  65 }, {  25,   0,   0,   0,   0,   0,   0 } }, //			Berserker
              {  78, {  90,  80, 100,  75,  65,  70,  65 }, {  25,   5,   0,   0,   0,   0,   0 } }, //			Rogue
              {  79, {  90,  70,  90,  80,  65,  80,  70 }, {   0,   0,   0,   5,   0,  25,   0 } }, //			Shaman
              {  80, { 100,  70,  95,  85,  65,  70,  65 }, {   0,   0,   0,  25,   0,   0,   0 } }, //			Warrior
              {  81, {  70,  90,  95,  65,  75,  80,  85 }, {   0,   0,   0,   0,   0,   0,  25 } }, // Wood Elf	Bard
              {  82, {  65,  80,  95,  75,  75,  90,  75 }, {   0,   0,   0,   5,   0,  25,   0 } }, //			Druid
              {  83, {  70,  80, 105,  75,  75,  85,  75 }, {   0,  20,   0,   0,   0,   0,   0 } }, //			Ranger
              {  84, {  65,  90, 105,  65,  75,  80,  75 }, {  25,   5,   0,   0,   0,   0,   0 } }, //			Rogue
              {  85, {  75,  80, 100,  75,  75,  80,  75 }, {   0,   0,   0,  25,   0,   0,   0 } }, //			Warrior
              {  86, {  75, 100, 100,  85,  75,  85,  50 }, {   0,   0,   0,   5,   0,  25,   0 } }, // Froglok		Cleric
              {  87, {  70, 110, 100,  80,  85,  75,  50 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Necro
              {  88, {  80, 100, 100,  85,  75,  80,  60 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			Paladin
              {  89, {  70, 110, 110,  80,  75,  75,  50 }, {  25,   5,   0,   0,   0,   0,   0 } }, //			Rogue
              {  90, {  80, 100, 100,  85,  85,  75,  55 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			SK
              {  91, {  70, 100, 100,  85,  75,  85,  55 }, {   0,   0,   0,   5,   0,  25,   0 } }, //			Shaman
              {  92, {  80, 100, 105,  90,  75,  75,  50 }, {   0,   0,   0,  25,   0,   0,   0 } }, //			Warrior
              {  93, {  70, 100, 100,  90,  85,  75,  50 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Wizard
              {  94, {  80,  75,  90,  90,  85,  80,  75 }, {   0,   0,   0,  25,   0,   0,   0 } }, //	UNKNOWN		UNKNOWN		
              {  95, {  75,  75,  85,  85,  85,  90,  75 }, {   0,   0,   0,   5,   0,  25,   0 } }, // Drakkin		Cleric
              {  96, {  80,  75,  85,  85,  85,  85,  85 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			Paladin
              {  97, {  75,  75,  95,  90,  85,  85,  75 }, {   0,  20,   0,   0,   0,   0,   0 } }, //			Ranger
              {  98, {  80,  75,  85,  85,  95,  80,  80 }, {   0,   0,   0,  20,   0,   0,   0 } }, //			SK
              {  99, {  70,  75,  85,  90,  85,  90,  75 }, {   0,   0,   0,   5,   0,  25,   0 } }, //			Druid
              { 100, {  75,  85,  95,  85,  85,  80,  75 }, {   0,   0,  20,   0,   0,   0,   0 } }, //			Monk
              { 101, {  75,  85,  85,  80,  85,  80,  85 }, {   0,   0,   0,   0,   0,   0,  25 } }, //			Bard
              { 102, {  70,  85,  95,  80,  85,  80,  75 }, {  25,   5,   0,   0,   0,   0,   0 } }, //			Rogue
              { 103, {  70,  85,  85,  80,  95,  80,  75 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Necro
              { 104, {  70,  75,  85,  90,  95,  80,  75 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Magician
              { 105, {  70,  75,  85,  90,  95,  80,  75 }, {   0,   0,   0,   5,  25,   0,   0 } }, //			Wizard
              { 106, {  70,  75,  85,  80,  95,  80,  85 }, {   0,   0,   0,   0,   5,   0,  25 } }, //			Enchanter
              { 107, { 140,  70,  75, 132,  60,  67,  37 }, {   7,   0,   0,  18,   0,   0,   0 } }, //	UNKNOWN		UNKNOWN
              { 108, { 140,  80,  70, 127,  60,  67,  37 }, {  10,   0,   0,  15,   0,   0,   0 } }  // UNKNOWN		UNKNOWN
	},
	641,  // Number of entries in the following table

	{     //  ?    ?    ?    ?   Race Cls Deity  ?  Zone
//               {   0,   8,   0,   0,   1,   1, 201,  58, 394 },  // Human/Warrior/Bertox/crescent
//               {   0,   8,   0,   0,   1,   1, 204,  58, 394 },  // Human/Warrior/Erollsi/crescent
//               {   0,   8,   0,   0,   1,   1, 207,  58, 394 },  // Human/Warrior/Karana/crescent
//               {   0,   8,   0,   0,   1,   1, 206,  58, 394 },  // Human/Warrior/Innoruuk/crescent
//               {   0,   8,   0,   0,   1,   1, 211,  58, 394 },  // Human/Warrior/Rallos Zek/crescent
//               {   0,   8,   0,   0,   1,   1, 396,  58, 394 },  // Human/Warrior/Agnostic/crescent
//               {   0,   8,   0,   0,   1,   1, 212,  58, 394 },  // Human/Warrior/Rodcet/crescent
//               {   0,   8,   0,   0,   1,   1, 208,  58, 394 },  // Human/Warrior/Mithaniel Marr/crescent
              {   0,   0,   0,   0,   1,   1, 396,  58,  10 },  // Human/Warrior/Agnostic/freporte
              {   0,   0,   0,   0,   1,   1, 201,  58,  45 },  // Human/Warrior/Bertox/qcat
              {   0,   0,   0,   0,   1,   1, 207,  58,   1 },  // Human/Warrior/Karana/qeynos
              {   0,   0,   0,   0,   1,   1, 206,  58,  10 },  // Human/Warrior/Innoruuk/freporte
              {   0,   0,   0,   0,   1,   1, 212,  58,   1 },  // Human/Warrior/Rodcet/qeynos
              {   0,   0,   0,   0,   1,   1, 211,  58,  10 },  // Human/Warrior/Rallos Zek/freporte
              {   0,   0,   0,   0,   1,   1, 208,  58,  10 },  // Human/Warrior/Mithaniel Marr/freporte
              {   0,   0,   0,   0,   1,   1, 204,  58,  10 },  // Human/Warrior/Erollsi/freporte
              {   0,   0,   0,   0,   1,   1, 396,  58,   1 },  // Human/Warrior/Agnostic/qeynos
              {   0,   0,   0,   0,   1,   1, 211,  58,   1 },  // Human/Warrior/Rallos Zek/qeynos
//               {   0,   8,   0,   0,   1,   2, 201,  48, 394 },  // Human/Cleric/Bertox/crescent
//               {   0,   8,   0,   0,   1,   2, 207,  48, 394 },  // Human/Cleric/Karana/crescent
//               {   0,   8,   0,   0,   1,   2, 208,  48, 394 },  // Human/Cleric/Mithaniel Marr/crescent
//               {   0,   8,   0,   0,   1,   2, 212,  48, 394 },  // Human/Cleric/Rodcet/crescent
//               {   0,   8,   0,   0,   1,   2, 206,  48, 394 },  // Human/Cleric/Innoruuk/crescent
//               {   0,   8,   0,   0,   1,   2, 204,  48, 394 },  // Human/Cleric/Erollsi/crescent
              {   0,   0,   0,   0,   1,   2, 201,  48,  45 },  // Human/Cleric/Bertox/qcat
              {   0,   0,   0,   0,   1,   2, 206,  48,  10 },  // Human/Cleric/Innoruuk/freporte
              {   0,   0,   0,   0,   1,   2, 207,  48,   1 },  // Human/Cleric/Karana/qeynos
              {   0,   0,   0,   0,   1,   2, 204,  48,   9 },  // Human/Cleric/Erollsi/freportw
              {   0,   0,   0,   0,   1,   2, 212,  48,   2 },  // Human/Cleric/Rodcet/qeynos2
              {   0,   0,   0,   0,   1,   2, 208,  48,   9 },  // Human/Cleric/Mithaniel Marr/freportw
//               {   0,   8,   0,   0,   1,   3, 204,  54, 394 },  // Human/Paladin/Erollsi/crescent
//               {   0,   8,   0,   0,   1,   3, 207,  54, 394 },  // Human/Paladin/Karana/crescent
//               {   0,   8,   0,   0,   1,   3, 208,  54, 394 },  // Human/Paladin/Mithaniel Marr/crescent
//               {   0,   8,   0,   0,   1,   3, 212,  54, 394 },  // Human/Paladin/Rodcet/crescent
              {   0,   0,   0,   0,   1,   3, 207,  54,   1 },  // Human/Paladin/Karana/qeynos
              {   0,   0,   0,   0,   1,   3, 212,  54,   2 },  // Human/Paladin/Rodcet/qeynos2
              {   0,   0,   0,   0,   1,   3, 208,  54,   9 },  // Human/Paladin/Mithaniel Marr/freportw
              {   0,   0,   0,   0,   1,   3, 204,  54,   9 },  // Human/Paladin/Erollsi/freportw
//               {   0,   8,   0,   0,   1,   4, 207,  55, 394 },  // Human/Ranger/Karana/crescent
//               {   0,   8,   0,   0,   1,   4, 215,  55, 394 },  // Human/Ranger/Tunare/crescent
              {   0,   0,   0,   0,   1,   4, 207,  55,   3 },  // Human/Ranger/Karana/qrg
              {   0,   0,   0,   0,   1,   4, 215,  55,   3 },  // Human/Ranger/Tunare/qrg
//               {   0,   8,   0,   0,   1,   5, 201,  57, 394 },  // Human/SK/Bertox/crescent
//               {   0,   8,   0,   0,   1,   5, 206,  57, 394 },  // Human/SK/Innoruuk/crescent
              {   0,   0,   0,   0,   1,   5, 201,  57,  45 },  // Human/SK/Bertox/qcat
              {   0,   0,   0,   0,   1,   5, 206,  57,  10 },  // Human/SK/Innoruuk/freporte
//               {   0,   8,   0,   0,   1,   6, 207,  49, 394 },  // Human/Druid/Karana/crescent
//               {   0,   8,   0,   0,   1,   6, 215,  49, 394 },  // Human/Druid/Tunare/crescent
              {   0,   0,   0,   0,   1,   6, 207,  49,   3 },  // Human/Druid/Karana/qrg
              {   0,   0,   0,   0,   1,   6, 215,  49,   3 },  // Human/Druid/Tunare/qrg
//               {   0,   8,   0,   0,   1,   7, 210,  52, 394 },  // Human/Monk/Quellious/crescent
//               {   0,   8,   0,   0,   1,   7, 396,  52, 394 },  // Human/Monk/Agnostic/crescent
              {   0,   0,   0,   0,   1,   7, 396,  52,   2 },  // Human/Monk/Agnostic/qeynos2
              {   0,   0,   0,   0,   1,   7, 210,  52,   9 },  // Human/Monk/Quellious/freportw
//               {   0,   8,   0,   0,   1,   8, 202,  47, 394 },  // Human/Bard/Brell/crescent
//               {   0,   8,   0,   0,   1,   8, 207,  47, 394 },  // Human/Bard/Karana/crescent
//               {   0,   8,   0,   0,   1,   8, 209,  47, 394 },  // Human/Bard/Prexus/crescent
//               {   0,   8,   0,   0,   1,   8, 211,  47, 394 },  // Human/Bard/Rallos Zek/crescent
//               {   0,   8,   0,   0,   1,   8, 213,  47, 394 },  // Human/Bard/Solusek/crescent
//               {   0,   8,   0,   0,   1,   8, 215,  47, 394 },  // Human/Bard/Tunare/crescent
//               {   0,   8,   0,   0,   1,   8, 396,  47, 394 },  // Human/Bard/Agnostic/crescent
//               {   0,   8,   0,   0,   1,   8, 216,  47, 394 },  // Human/Bard/Veeshan/crescent
//               {   0,   8,   0,   0,   1,   8, 214,  47, 394 },  // Human/Bard/Tribunal/crescent
//               {   0,   8,   0,   0,   1,   8, 212,  47, 394 },  // Human/Bard/Rodcet/crescent
//               {   0,   8,   0,   0,   1,   8, 210,  47, 394 },  // Human/Bard/Quellious/crescent
//               {   0,   8,   0,   0,   1,   8, 208,  47, 394 },  // Human/Bard/Mithaniel Marr/crescent
//               {   0,   8,   0,   0,   1,   8, 204,  47, 394 },  // Human/Bard/Erollsi/crescent
//               {   0,   8,   0,   0,   1,   8, 205,  47, 394 },  // Human/Bard/Bristlebane/crescent
              {   0,   0,   0,   0,   1,   8, 396,  47,  10 },  // Human/Bard/Agnostic/freporte
              {   0,   0,   0,   0,   1,   8, 205,  47,  10 },  // Human/Bard/Bristlebane/freporte
              {   0,   0,   0,   0,   1,   8, 204,  47,  10 },  // Human/Bard/Erollsi/freporte
              {   0,   0,   0,   0,   1,   8, 207,  47,   1 },  // Human/Bard/Karana/qeynos
              {   0,   0,   0,   0,   1,   8, 212,  47,   1 },  // Human/Bard/Rodcet/qeynos
              {   0,   0,   0,   0,   1,   8, 209,  47,  10 },  // Human/Bard/Prexus/freporte
              {   0,   0,   0,   0,   1,   8, 210,  47,  10 },  // Human/Bard/Quellious/freporte
              {   0,   0,   0,   0,   1,   8, 213,  47,  10 },  // Human/Bard/Solusek/freporte
              {   0,   0,   0,   0,   1,   8, 202,  47,  10 },  // Human/Bard/Brell/freporte
              {   0,   0,   0,   0,   1,   8, 211,  47,  10 },  // Human/Bard/Rallos Zek/freporte
              {   0,   0,   0,   0,   1,   8, 216,  47,  10 },  // Human/Bard/Veeshan/freporte
              {   0,   0,   0,   0,   1,   8, 215,  47,  10 },  // Human/Bard/Tunare/freporte
              {   0,   0,   0,   0,   1,   8, 214,  47,  10 },  // Human/Bard/Tribunal/freporte
              {   0,   0,   0,   0,   1,   8, 208,  47,  10 },  // Human/Bard/Mithaniel Marr/freporte
              {   0,   0,   0,   0,   1,   8, 396,  47,   1 },  // Human/Bard/Agnostic/qeynos
              {   0,   0,   0,   0,   1,   8, 209,  47,   1 },  // Human/Bard/Prexus/qeynos
              {   0,   0,   0,   0,   1,   8, 213,  47,   1 },  // Human/Bard/Solusek/qeynos
              {   0,   0,   0,   0,   1,   8, 211,  47,   1 },  // Human/Bard/Rallos Zek/qeynos
              {   0,   0,   0,   0,   1,   8, 216,  47,   1 },  // Human/Bard/Veeshan/qeynos
              {   0,   0,   0,   0,   1,   8, 215,  47,   1 },  // Human/Bard/Tunare/qeynos
              {   0,   0,   0,   0,   1,   8, 214,  47,   1 },  // Human/Bard/Tribunal/qeynos
              {   0,   0,   0,   0,   1,   8, 202,  47,   1 },  // Human/Bard/Brell/qeynos
              {   0,   0,   0,   0,   1,   8, 210,  47,   1 },  // Human/Bard/Quellious/qeynos
              {   0,   0,   0,   0,   1,   8, 205,  47,   1 },  // Human/Bard/Bristlebane/qeynos
//               {   0,   8,   0,   0,   1,   9, 201,  56, 394 },  // Human/Rogue/Bertox/crescent
//               {   0,   8,   0,   0,   1,   9, 206,  56, 394 },  // Human/Rogue/Innoruuk/crescent
//               {   0,   8,   0,   0,   1,   9, 207,  56, 394 },  // Human/Rogue/Karana/crescent
//               {   0,   8,   0,   0,   1,   9, 212,  56, 394 },  // Human/Rogue/Rodcet/crescent
//               {   0,   8,   0,   0,   1,   9, 396,  56, 394 },  // Human/Rogue/Agnostic/crescent
//               {   0,   8,   0,   0,   1,   9, 205,  56, 394 },  // Human/Rogue/Bristlebane/crescent
//               {   0,   8,   0,   0,   1,   9, 204,  56, 394 },  // Human/Rogue/Erollsi/crescent
              {   0,   0,   0,   0,   1,   9, 396,  56,  10 },  // Human/Rogue/Agnostic/freporte
              {   0,   0,   0,   0,   1,   9, 212,  56,   2 },  // Human/Rogue/Rodcet/qeynos2
              {   0,   0,   0,   0,   1,   9, 204,  56,  10 },  // Human/Rogue/Erollsi/freporte
              {   0,   0,   0,   0,   1,   9, 207,  56,   2 },  // Human/Rogue/Karana/qeynos2
              {   0,   0,   0,   0,   1,   9, 201,  56,   2 },  // Human/Rogue/Bertox/qeynos2
              {   0,   0,   0,   0,   1,   9, 206,  56,  10 },  // Human/Rogue/Innoruuk/freporte
              {   0,   0,   0,   0,   1,   9, 205,  56,  10 },  // Human/Rogue/Bristlebane/freporte
              {   0,   0,   0,   0,   1,   9, 396,  56,   2 },  // Human/Rogue/Agnostic/qeynos2
              {   0,   0,   0,   0,   1,   9, 205,  56,   2 },  // Human/Rogue/Bristlebane/qeynos2
//               {   0,   8,   0,   0,   1,  11, 201,  53, 394 },  // Human/Necro/Bertox/crescent
//               {   0,   8,   0,   0,   1,  11, 206,  53, 394 },  // Human/Necro/Innoruuk/crescent
              {   0,   0,   0,   0,   1,  11, 201,  53,  45 },  // Human/Necro/Bertox/qcat
              {   0,   0,   0,   0,   1,  11, 206,  53,  10 },  // Human/Necro/Innoruuk/freporte
//               {   0,   8,   0,   0,   1,  12, 201,  51, 394 },  // Human/Wizard/Bertox/crescent
//               {   0,   8,   0,   0,   1,  12, 204,  51, 394 },  // Human/Wizard/Erollsi/crescent
//               {   0,   8,   0,   0,   1,  12, 207,  51, 394 },  // Human/Wizard/Karana/crescent
//               {   0,   8,   0,   0,   1,  12, 206,  51, 394 },  // Human/Wizard/Innoruuk/crescent
//               {   0,   8,   0,   0,   1,  12, 208,  51, 394 },  // Human/Wizard/Mithaniel Marr/crescent
//               {   0,   8,   0,   0,   1,  12, 213,  51, 394 },  // Human/Wizard/Solusek/crescent
//               {   0,   8,   0,   0,   1,  12, 396,  51, 394 },  // Human/Wizard/Agnostic/crescent
//               {   0,   8,   0,   0,   1,  12, 212,  51, 394 },  // Human/Wizard/Rodcet/crescent
              {   0,   0,   0,   0,   1,  12, 396,  51,   9 },  // Human/Wizard/Agnostic/freportw
              {   0,   0,   0,   0,   1,  12, 213,  51,   9 },  // Human/Wizard/Solusek/freportw
              {   0,   0,   0,   0,   1,  12, 206,  51,  10 },  // Human/Wizard/Innoruuk/freporte
              {   0,   0,   0,   0,   1,  12, 207,  51,   1 },  // Human/Wizard/Karana/qeynos
              {   0,   0,   0,   0,   1,  12, 204,  51,   9 },  // Human/Wizard/Erollsi/freportw
              {   0,   0,   0,   0,   1,  12, 212,  51,   1 },  // Human/Wizard/Rodcet/qeynos
              {   0,   0,   0,   0,   1,  12, 208,  51,   9 },  // Human/Wizard/Mithaniel Marr/freportw
              {   0,   0,   0,   0,   1,  12, 201,  51,  45 },  // Human/Wizard/Bertox/qcat
              {   0,   0,   0,   0,   1,  12, 396,  51,   1 },  // Human/Wizard/Agnostic/qeynos
              {   0,   0,   0,   0,   1,  12, 213,  51,   1 },  // Human/Wizard/Solusek/qeynos
//               {   0,   8,   0,   0,   1,  13, 201,  51, 394 },  // Human/Magician/Bertox/crescent
//               {   0,   8,   0,   0,   1,  13, 207,  51, 394 },  // Human/Magician/Karana/crescent
//               {   0,   8,   0,   0,   1,  13, 208,  51, 394 },  // Human/Magician/Mithaniel Marr/crescent
//               {   0,   8,   0,   0,   1,  13, 212,  51, 394 },  // Human/Magician/Rodcet/crescent
//               {   0,   8,   0,   0,   1,  13, 396,  51, 394 },  // Human/Magician/Agnostic/crescent
//               {   0,   8,   0,   0,   1,  13, 206,  51, 394 },  // Human/Magician/Innoruuk/crescent
//               {   0,   8,   0,   0,   1,  13, 204,  51, 394 },  // Human/Magician/Erollsi/crescent
              {   0,   0,   0,   0,   1,  13, 396,  51,   9 },  // Human/Magician/Agnostic/freportw
              {   0,   0,   0,   0,   1,  13, 212,  51,   1 },  // Human/Magician/Rodcet/qeynos
              {   0,   0,   0,   0,   1,  13, 208,  51,   9 },  // Human/Magician/Mithaniel Marr/freportw
              {   0,   0,   0,   0,   1,  13, 201,  51,  45 },  // Human/Magician/Bertox/qcat
              {   0,   0,   0,   0,   1,  13, 206,  51,  10 },  // Human/Magician/Innoruuk/freporte
              {   0,   0,   0,   0,   1,  13, 207,  51,   1 },  // Human/Magician/Karana/qeynos
              {   0,   0,   0,   0,   1,  13, 204,  51,   9 },  // Human/Magician/Erollsi/freportw
              {   0,   0,   0,   0,   1,  13, 396,  51,   1 },  // Human/Magician/Agnostic/qeynos
//               {   0,   8,   0,   0,   1,  14, 201,  50, 394 },  // Human/Enchanter/Bertox/crescent
//               {   0,   8,   0,   0,   1,  14, 206,  50, 394 },  // Human/Enchanter/Innoruuk/crescent
//               {   0,   8,   0,   0,   1,  14, 208,  50, 394 },  // Human/Enchanter/Mithaniel Marr/crescent
//               {   0,   8,   0,   0,   1,  14, 212,  50, 394 },  // Human/Enchanter/Rodcet/crescent
//               {   0,   8,   0,   0,   1,  14, 396,  50, 394 },  // Human/Enchanter/Agnostic/crescent
//               {   0,   8,   0,   0,   1,  14, 207,  50, 394 },  // Human/Enchanter/Karana/crescent
//               {   0,   8,   0,   0,   1,  14, 204,  50, 394 },  // Human/Enchanter/Erollsi/crescent
              {   0,   0,   0,   0,   1,  14, 396,  50,   9 },  // Human/Enchanter/Agnostic/freportw
              {   0,   0,   0,   0,   1,  14, 208,  50,   9 },  // Human/Enchanter/Mithaniel Marr/freportw
              {   0,   0,   0,   0,   1,  14, 212,  50,   1 },  // Human/Enchanter/Rodcet/qeynos
              {   0,   0,   0,   0,   1,  14, 204,  50,   9 },  // Human/Enchanter/Erollsi/freportw
              {   0,   0,   0,   0,   1,  14, 201,  50,  45 },  // Human/Enchanter/Bertox/qcat
              {   0,   0,   0,   0,   1,  14, 206,  50,  10 },  // Human/Enchanter/Innoruuk/freporte
              {   0,   0,   0,   0,   1,  14, 207,  50,   1 },  // Human/Enchanter/Karana/qeynos
              {   0,   0,   0,   0,   1,  14, 396,  50,   1 },  // Human/Enchanter/Agnostic/qeynos
//               {   0,   8,   0,   0,   2,   1, 211,   4, 394 },  // Barbarian/Warrior/Rallos Zek/crescent
//               {   0,   8,   0,   0,   2,   1, 214,   4, 394 },  // Barbarian/Warrior/Tribunal/crescent
//               {   0,   8,   0,   0,   2,   1, 396,   4, 394 },  // Barbarian/Warrior/Agnostic/crescent
              {   0,   0,   0,   0,   2,   1, 396,   4,  29 },  // Barbarian/Warrior/Agnostic/halas
              {   0,   0,   0,   0,   2,   1, 214,   4,  29 },  // Barbarian/Warrior/Tribunal/halas
              {   0,   0,   0,   0,   2,   1, 211,   4,  29 },  // Barbarian/Warrior/Rallos Zek/halas
//               {   0,   8,   0,   0,   2,   9, 205,   2, 394 },  // Barbarian/Rogue/Bristlebane/crescent
//               {   0,   8,   0,   0,   2,   9, 396,   2, 394 },  // Barbarian/Rogue/Agnostic/crescent
//               {   0,   8,   0,   0,   2,   9, 214,   2, 394 },  // Barbarian/Rogue/Tribunal/crescent
              {   0,   0,   0,   0,   2,   9, 396,   2,  29 },  // Barbarian/Rogue/Agnostic/halas
              {   0,   0,   0,   0,   2,   9, 205,   2,  29 },  // Barbarian/Rogue/Bristlebane/halas
              {   0,   0,   0,   0,   2,   9, 214,   2,  29 },  // Barbarian/Rogue/Tribunal/halas
//              {   0,   8,   0,   0,   2,  10, 214,   3, 394 },  // Barbarian/Shaman/Tribunal/crescent
              {   0,   0,   0,   0,   2,  10, 214,   3,  29 },  // Barbarian/Shaman/Tribunal/halas
//               {   4,   8,   0,   0,   2,  15, 208,   0, 394 },  // Barbarian/Beastlord/Mithaniel Marr/crescent
//               {   4,   8,   0,   0,   2,  15, 214,   0, 394 },  // Barbarian/Beastlord/Tribunal/crescent
              {   4,   0,   0,   0,   2,  15, 208,   0,  29 },  // Barbarian/Beastlord/Mithaniel Marr/halas
              {   4,   0,   0,   0,   2,  15, 214,   0,  29 },  // Barbarian/Beastlord/Tribunal/halas
//               {  64,   8,   0,   0,   2,  16, 211,   1, 394 },  // Barbarian/Berzerker/Rallos Zek/crescent
//               {  64,   8,   0,   0,   2,  16, 396,   1, 394 },  // Barbarian/Berzerker/Agnostic/crescent
//               {  64,   8,   0,   0,   2,  16, 214,   1, 394 },  // Barbarian/Berzerker/Tribunal/crescent
              {  64,   0,   0,   0,   2,  16, 396,   1,  29 },  // Barbarian/Berzerker/Agnostic/halas
              {  64,   0,   0,   0,   2,  16, 211,   1,  29 },  // Barbarian/Berzerker/Rallos Zek/halas
              {  64,   0,   0,   0,   2,  16, 214,   1,  29 },  // Barbarian/Berzerker/Tribunal/halas
//               {   0,   8,   0,   0,   3,   2, 203,  17, 394 },  // Erudite/Cleric/Cazic/crescent
//               {   0,   8,   0,   0,   3,   2, 210,  17, 394 },  // Erudite/Cleric/Quellious/crescent
//               {   0,   8,   0,   0,   3,   2, 209,  17, 394 },  // Erudite/Cleric/Prexus/crescent
              {   0,   0,   0,   0,   3,   2, 203,  17,  75 },  // Erudite/Cleric/Cazic/paineel
              {   0,   0,   0,   0,   3,   2, 210,  17,  24 },  // Erudite/Cleric/Quellious/erudnext
              {   0,   0,   0,   0,   3,   2, 209,  17,  24 },  // Erudite/Cleric/Prexus/erudnext
//               {   0,   8,   0,   0,   3,   3, 209,  21, 394 },  // Erudite/Paladin/Prexus/crescent
//               {   0,   8,   0,   0,   3,   3, 210,  21, 394 },  // Erudite/Paladin/Quellious/crescent
              {   0,   0,   0,   0,   3,   3, 209,  21,  24 },  // Erudite/Paladin/Prexus/erudnext
              {   0,   0,   0,   0,   3,   3, 210,  21,  24 },  // Erudite/Paladin/Quellious/erudnext
//             {   0,   8,   0,   0,   3,   5, 203,  22, 394 },  // Erudite/SK/Cazic/crescent
              {   0,   0,   0,   0,   3,   5, 203,  22,  75 },  // Erudite/SK/Cazic/paineel
//              {   0,   8,   0,   0,   3,  11, 203,  20, 394 },  // Erudite/Necro/Cazic/crescent
              {   0,   0,   0,   0,   3,  11, 203,  20,  75 },  // Erudite/Necro/Cazic/paineel
//               {   0,   8,   0,   0,   3,  12, 209,  19, 394 },  // Erudite/Wizard/Prexus/crescent
//               {   0,   8,   0,   0,   3,  12, 213,  19, 394 },  // Erudite/Wizard/Solusek/crescent
//               {   0,   8,   0,   0,   3,  12, 396,  19, 394 },  // Erudite/Wizard/Agnostic/crescent
//               {   0,   8,   0,   0,   3,  12, 210,  19, 394 },  // Erudite/Wizard/Quellious/crescent
              {   0,   0,   0,   0,   3,  12, 396,  19,  23 },  // Erudite/Wizard/Agnostic/erudnint
              {   0,   0,   0,   0,   3,  12, 209,  19,  23 },  // Erudite/Wizard/Prexus/erudnint
              {   0,   0,   0,   0,   3,  12, 213,  19,  23 },  // Erudite/Wizard/Solusek/erudnint
              {   0,   0,   0,   0,   3,  12, 210,  19,  23 },  // Erudite/Wizard/Quellious/erudnint
//               {   0,   8,   0,   0,   3,  13, 209,  19, 394 },  // Erudite/Magician/Prexus/crescent
//               {   0,   8,   0,   0,   3,  13, 210,  19, 394 },  // Erudite/Magician/Quellious/crescent
//               {   0,   8,   0,   0,   3,  13, 396,  19, 394 },  // Erudite/Magician/Agnostic/crescent
              {   0,   0,   0,   0,   3,  13, 396,  19,  23 },  // Erudite/Magician/Agnostic/erudnint
              {   0,   0,   0,   0,   3,  13, 209,  19,  23 },  // Erudite/Magician/Prexus/erudnint
              {   0,   0,   0,   0,   3,  13, 210,  19,  23 },  // Erudite/Magician/Quellious/erudnint
//               {   0,   8,   0,   0,   3,  14, 209,  18, 394 },  // Erudite/Enchanter/Prexus/crescent
//               {   0,   8,   0,   0,   3,  14, 210,  18, 394 },  // Erudite/Enchanter/Quellious/crescent
//               {   0,   8,   0,   0,   3,  14, 396,  18, 394 },  // Erudite/Enchanter/Agnostic/crescent
              {   0,   0,   0,   0,   3,  14, 396,  18,  23 },  // Erudite/Enchanter/Agnostic/erudnint
              {   0,   0,   0,   0,   3,  14, 210,  18,  23 },  // Erudite/Enchanter/Quellious/erudnint
              {   0,   0,   0,   0,   3,  14, 209,  18,  23 },  // Erudite/Enchanter/Prexus/erudnint
//               {   0,   8,   0,   0,   4,   1, 207,  85, 394 },  // Wood Elf/Warrior/Karana/crescent
//               {   0,   8,   0,   0,   4,   1, 211,  85, 394 },  // Wood Elf/Warrior/Rallos Zek/crescent
//               {   0,   8,   0,   0,   4,   1, 215,  85, 394 },  // Wood Elf/Warrior/Tunare/crescent
//               {   0,   8,   0,   0,   4,   1, 396,  85, 394 },  // Wood Elf/Warrior/Agnostic/crescent
              {   0,   0,   0,   0,   4,   1, 396,  85,  54 },  // Wood Elf/Warrior/Agnostic/gfaydark
              {   0,   0,   0,   0,   4,   1, 207,  85,  54 },  // Wood Elf/Warrior/Karana/gfaydark
              {   0,   0,   0,   0,   4,   1, 211,  85,  54 },  // Wood Elf/Warrior/Rallos Zek/gfaydark
              {   0,   0,   0,   0,   4,   1, 215,  85,  54 },  // Wood Elf/Warrior/Tunare/gfaydark
//              {   0,   8,   0,   0,   4,   4, 215,  83, 394 },  // Wood Elf/Ranger/Tunare/crescent
              {   0,   0,   0,   0,   4,   4, 215,  83,  54 },  // Wood Elf/Ranger/Tunare/gfaydark
//              {   0,   8,   0,   0,   4,   6, 215,  82, 394 },  // Wood Elf/Druid/Tunare/crescent
              {   0,   0,   0,   0,   4,   6, 215,  82,  54 },  // Wood Elf/Druid/Tunare/gfaydark
//               {   0,   8,   0,   0,   4,   8, 202,  81, 394 },  // Wood Elf/Bard/Brell/crescent
//               {   0,   8,   0,   0,   4,   8, 209,  81, 394 },  // Wood Elf/Bard/Prexus/crescent
//               {   0,   8,   0,   0,   4,   8, 396,  81, 394 },  // Wood Elf/Bard/Agnostic/crescent
//               {   0,   8,   0,   0,   4,   8, 216,  81, 394 },  // Wood Elf/Bard/Veeshan/crescent
//               {   0,   8,   0,   0,   4,   8, 215,  81, 394 },  // Wood Elf/Bard/Tunare/crescent
//               {   0,   8,   0,   0,   4,   8, 214,  81, 394 },  // Wood Elf/Bard/Tribunal/crescent
//               {   0,   8,   0,   0,   4,   8, 213,  81, 394 },  // Wood Elf/Bard/Solusek/crescent
//               {   0,   8,   0,   0,   4,   8, 212,  81, 394 },  // Wood Elf/Bard/Rodcet/crescent
//               {   0,   8,   0,   0,   4,   8, 211,  81, 394 },  // Wood Elf/Bard/Rallos Zek/crescent
//               {   0,   8,   0,   0,   4,   8, 210,  81, 394 },  // Wood Elf/Bard/Quellious/crescent
//               {   0,   8,   0,   0,   4,   8, 208,  81, 394 },  // Wood Elf/Bard/Mithaniel Marr/crescent
//               {   0,   8,   0,   0,   4,   8, 204,  81, 394 },  // Wood Elf/Bard/Erollsi/crescent
//               {   0,   8,   0,   0,   4,   8, 207,  81, 394 },  // Wood Elf/Bard/Karana/crescent
//               {   0,   8,   0,   0,   4,   8, 205,  81, 394 },  // Wood Elf/Bard/Bristlebane/crescent
              {   0,   0,   0,   0,   4,   8, 396,  81,  54 },  // Wood Elf/Bard/Agnostic/gfaydark
              {   0,   0,   0,   0,   4,   8, 205,  81,  54 },  // Wood Elf/Bard/Bristlebane/gfaydark
              {   0,   0,   0,   0,   4,   8, 207,  81,  54 },  // Wood Elf/Bard/Karana/gfaydark
              {   0,   0,   0,   0,   4,   8, 208,  81,  54 },  // Wood Elf/Bard/Mithaniel Marr/gfaydark
              {   0,   0,   0,   0,   4,   8, 211,  81,  54 },  // Wood Elf/Bard/Rallos Zek/gfaydark
              {   0,   0,   0,   0,   4,   8, 216,  81,  54 },  // Wood Elf/Bard/Veeshan/gfaydark
              {   0,   0,   0,   0,   4,   8, 215,  81,  54 },  // Wood Elf/Bard/Tunare/gfaydark
              {   0,   0,   0,   0,   4,   8, 214,  81,  54 },  // Wood Elf/Bard/Tribunal/gfaydark
              {   0,   0,   0,   0,   4,   8, 202,  81,  54 },  // Wood Elf/Bard/Brell/gfaydark
              {   0,   0,   0,   0,   4,   8, 213,  81,  54 },  // Wood Elf/Bard/Solusek/gfaydark
              {   0,   0,   0,   0,   4,   8, 210,  81,  54 },  // Wood Elf/Bard/Quellious/gfaydark
              {   0,   0,   0,   0,   4,   8, 209,  81,  54 },  // Wood Elf/Bard/Prexus/gfaydark
              {   0,   0,   0,   0,   4,   8, 212,  81,  54 },  // Wood Elf/Bard/Rodcet/gfaydark
              {   0,   0,   0,   0,   4,   8, 204,  81,  54 },  // Wood Elf/Bard/Erollsi/gfaydark
//               {   0,   8,   0,   0,   4,   9, 205,  84, 394 },  // Wood Elf/Rogue/Bristlebane/crescent
//               {   0,   8,   0,   0,   4,   9, 215,  84, 394 },  // Wood Elf/Rogue/Tunare/crescent
//               {   0,   8,   0,   0,   4,   9, 207,  84, 394 },  // Wood Elf/Rogue/Karana/crescent
//               {   0,   8,   0,   0,   4,   9, 396,  84, 394 },  // Wood Elf/Rogue/Agnostic/crescent
              {   0,   0,   0,   0,   4,   9, 396,  84,  54 },  // Wood Elf/Rogue/Agnostic/gfaydark
              {   0,   0,   0,   0,   4,   9, 215,  84,  54 },  // Wood Elf/Rogue/Tunare/gfaydark
              {   0,   0,   0,   0,   4,   9, 207,  84,  54 },  // Wood Elf/Rogue/Karana/gfaydark
              {   0,   0,   0,   0,   4,   9, 205,  84,  54 },  // Wood Elf/Rogue/Bristlebane/gfaydark
//              {   0,   8,   0,   0,   5,   2, 215,  43, 394 },  // High Elf/Cleric/Tunare/crescent
              {   0,   0,   0,   0,   5,   2, 215,  43,  61 },  // High Elf/Cleric/Tunare/felwithea
//              {   0,   8,   0,   0,   5,   3, 215,  46, 394 },  // High Elf/Paladin/Tunare/crescent
              {   0,   0,   0,   0,   5,   3, 215,  46,  61 },  // High Elf/Paladin/Tunare/felwithea
//               {   0,   8,   0,   0,   5,  12, 204,  45, 394 },  // High Elf/Wizard/Erollsi/crescent
//               {   0,   8,   0,   0,   5,  12, 208,  45, 394 },  // High Elf/Wizard/Mithaniel Marr/crescent
//               {   0,   8,   0,   0,   5,  12, 215,  45, 394 },  // High Elf/Wizard/Tunare/crescent
//               {   0,   8,   0,   0,   5,  12, 396,  45, 394 },  // High Elf/Wizard/Agnostic/crescent
//               {   0,   8,   0,   0,   5,  12, 213,  45, 394 },  // High Elf/Wizard/Solusek/crescent
//               {   0,   8,   0,   0,   5,  12, 207,  45, 394 },  // High Elf/Wizard/Karana/crescent
              {   0,   0,   0,   0,   5,  12, 396,  45,  62 },  // High Elf/Wizard/Agnostic/felwitheb
              {   0,   0,   0,   0,   5,  12, 207,  45,  62 },  // High Elf/Wizard/Karana/felwitheb
              {   0,   0,   0,   0,   5,  12, 204,  45,  62 },  // High Elf/Wizard/Erollsi/felwitheb
              {   0,   0,   0,   0,   5,  12, 213,  45,  62 },  // High Elf/Wizard/Solusek/felwitheb
              {   0,   0,   0,   0,   5,  12, 215,  45,  62 },  // High Elf/Wizard/Tunare/felwitheb
              {   0,   0,   0,   0,   5,  12, 208,  45,  62 },  // High Elf/Wizard/Mithaniel Marr/felwitheb
//               {   0,   8,   0,   0,   5,  13, 204,  45, 394 },  // High Elf/Magician/Erollsi/crescent
//               {   0,   8,   0,   0,   5,  13, 207,  45, 394 },  // High Elf/Magician/Karana/crescent
//               {   0,   8,   0,   0,   5,  13, 208,  45, 394 },  // High Elf/Magician/Mithaniel Marr/crescent
//               {   0,   8,   0,   0,   5,  13, 396,  45, 394 },  // High Elf/Magician/Agnostic/crescent
//               {   0,   8,   0,   0,   5,  13, 215,  45, 394 },  // High Elf/Magician/Tunare/crescent
              {   0,   0,   0,   0,   5,  13, 396,  45,  62 },  // High Elf/Magician/Agnostic/felwitheb
              {   0,   0,   0,   0,   5,  13, 207,  45,  62 },  // High Elf/Magician/Karana/felwitheb
              {   0,   0,   0,   0,   5,  13, 208,  45,  62 },  // High Elf/Magician/Mithaniel Marr/felwitheb
              {   0,   0,   0,   0,   5,  13, 215,  45,  62 },  // High Elf/Magician/Tunare/felwitheb
              {   0,   0,   0,   0,   5,  13, 204,  45,  62 },  // High Elf/Magician/Erollsi/felwitheb
//               {   0,   8,   0,   0,   5,  14, 204,  44, 394 },  // High Elf/Enchanter/Erollsi/crescent
//               {   0,   8,   0,   0,   5,  14, 215,  44, 394 },  // High Elf/Enchanter/Tunare/crescent
//               {   0,   8,   0,   0,   5,  14, 396,  44, 394 },  // High Elf/Enchanter/Agnostic/crescent
//               {   0,   8,   0,   0,   5,  14, 208,  44, 394 },  // High Elf/Enchanter/Mithaniel Marr/crescent
//               {   0,   8,   0,   0,   5,  14, 207,  44, 394 },  // High Elf/Enchanter/Karana/crescent
              {   0,   0,   0,   0,   5,  14, 396,  44,  62 },  // High Elf/Enchanter/Agnostic/felwitheb
              {   0,   0,   0,   0,   5,  14, 207,  44,  62 },  // High Elf/Enchanter/Karana/felwitheb
              {   0,   0,   0,   0,   5,  14, 204,  44,  62 },  // High Elf/Enchanter/Erollsi/felwitheb
              {   0,   0,   0,   0,   5,  14, 215,  44,  62 },  // High Elf/Enchanter/Tunare/felwitheb
              {   0,   0,   0,   0,   5,  14, 208,  44,  62 },  // High Elf/Enchanter/Mithaniel Marr/felwitheb
//               {   0,   8,   0,   0,   6,   1, 206,  11, 394 },  // Dark Elf/Warrior/Innoruuk/crescent
//               {   0,   8,   0,   0,   6,   1, 211,  11, 394 },  // Dark Elf/Warrior/Rallos Zek/crescent
//               {   0,   8,   0,   0,   6,   1, 396,  11, 394 },  // Dark Elf/Warrior/Agnostic/crescent
              {   0,   0,   0,   0,   6,   1, 396,  11,  41 },  // Dark Elf/Warrior/Agnostic/neriakb
              {   0,   0,   0,   0,   6,   1, 211,  11,  41 },  // Dark Elf/Warrior/Rallos Zek/neriakb
              {   0,   0,   0,   0,   6,   1, 206,  11,  41 },  // Dark Elf/Warrior/Innoruuk/neriakb
//              {   0,   8,   0,   0,   6,   2, 206,   5, 394 },  // Dark Elf/Cleric/Innoruuk/crescent
              {   0,   0,   0,   0,   6,   2, 206,   5,  42 },  // Dark Elf/Cleric/Innoruuk/neriakc
//              {   0,   8,   0,   0,   6,   5, 206,  10, 394 },  // Dark Elf/SK/Innoruuk/crescent
              {   0,   0,   0,   0,   6,   5, 206,  10,  42 },  // Dark Elf/SK/Innoruuk/neriakc
//               {   0,   8,   0,   0,   6,   9, 205,   9, 394 },  // Dark Elf/Rogue/Bristlebane/crescent
//               {   0,   8,   0,   0,   6,   9, 206,   9, 394 },  // Dark Elf/Rogue/Innoruuk/crescent
//               {   0,   8,   0,   0,   6,   9, 396,   9, 394 },  // Dark Elf/Rogue/Agnostic/crescent
              {   0,   0,   0,   0,   6,   9, 396,   9,  42 },  // Dark Elf/Rogue/Agnostic/neriakc
              {   0,   0,   0,   0,   6,   9, 205,   9,  42 },  // Dark Elf/Rogue/Bristlebane/neriakc
              {   0,   0,   0,   0,   6,   9, 206,   9,  42 },  // Dark Elf/Rogue/Innoruuk/neriakc
//              {   0,   8,   0,   0,   6,  11, 206,   8, 394 },  // Dark Elf/Necro/Innoruuk/crescent
              {   0,   0,   0,   0,   6,  11, 206,   8,  42 },  // Dark Elf/Necro/Innoruuk/neriakc
//               {   0,   8,   0,   0,   6,  12, 206,   7, 394 },  // Dark Elf/Wizard/Innoruuk/crescent
//               {   0,   8,   0,   0,   6,  12, 213,   7, 394 },  // Dark Elf/Wizard/Solusek/crescent
//               {   0,   8,   0,   0,   6,  12, 396,   7, 394 },  // Dark Elf/Wizard/Agnostic/crescent
              {   0,   0,   0,   0,   6,  12, 396,   7,  41 },  // Dark Elf/Wizard/Agnostic/neriakb
              {   0,   0,   0,   0,   6,  12, 206,   7,  41 },  // Dark Elf/Wizard/Innoruuk/neriakb
              {   0,   0,   0,   0,   6,  12, 213,   7,  41 },  // Dark Elf/Wizard/Solusek/neriakb
//               {   0,   8,   0,   0,   6,  13, 206,   7, 394 },  // Dark Elf/Magician/Innoruuk/crescent
//               {   0,   8,   0,   0,   6,  13, 396,   7, 394 },  // Dark Elf/Magician/Agnostic/crescent
              {   0,   0,   0,   0,   6,  13, 396,   7,  41 },  // Dark Elf/Magician/Agnostic/neriakb
              {   0,   0,   0,   0,   6,  13, 206,   7,  41 },  // Dark Elf/Magician/Innoruuk/neriakb
//               {   0,   8,   0,   0,   6,  14, 206,   6, 394 },  // Dark Elf/Enchanter/Innoruuk/crescent
//               {   0,   8,   0,   0,   6,  14, 396,   6, 394 },  // Dark Elf/Enchanter/Agnostic/crescent
              {   0,   0,   0,   0,   6,  14, 396,   6,  41 },  // Dark Elf/Enchanter/Agnostic/neriakb
              {   0,   0,   0,   0,   6,  14, 206,   6,  41 },  // Dark Elf/Enchanter/Innoruuk/neriakb
//               {   0,   8,   0,   0,   7,   1, 201,  36, 394 },  // Half Elf/Warrior/Bertox/crescent
//               {   0,   8,   0,   0,   7,   1, 212,  36, 394 },  // Half Elf/Warrior/Rodcet/crescent
//               {   0,   8,   0,   0,   7,   1, 396,  36, 394 },  // Half Elf/Warrior/Agnostic/crescent
//               {   0,   8,   0,   0,   7,   1, 215,  36, 394 },  // Half Elf/Warrior/Tunare/crescent
//               {   0,   8,   0,   0,   7,   1, 214,  36, 394 },  // Half Elf/Warrior/Tribunal/crescent
//               {   0,   8,   0,   0,   7,   1, 211,  36, 394 },  // Half Elf/Warrior/Rallos Zek/crescent
//               {   0,   8,   0,   0,   7,   1, 204,  36, 394 },  // Half Elf/Warrior/Erollsi/crescent
//               {   0,   8,   0,   0,   7,   1, 207,  36, 394 },  // Half Elf/Warrior/Karana/crescent
//               {   0,   8,   0,   0,   7,   1, 208,  36, 394 },  // Half Elf/Warrior/Mithaniel Marr/crescent
//               {   0,   8,   0,   0,   7,   1, 209,  36, 394 },  // Half Elf/Warrior/Prexus/crescent
//               {   0,   8,   0,   0,   7,   1, 206,  36, 394 },  // Half Elf/Warrior/Innoruuk/crescent
              {   0,   0,   0,   0,   7,   1, 396,  36,  54 },  // Half Elf/Warrior/Agnostic/gfaydark
              {   0,   0,   0,   0,   7,   1, 208,  36,  10 },  // Half Elf/Warrior/Mithaniel Marr/freporte
              {   0,   0,   0,   0,   7,   1, 211,  36,  54 },  // Half Elf/Warrior/Rallos Zek/gfaydark
              {   0,   0,   0,   0,   7,   1, 215,  36,  54 },  // Half Elf/Warrior/Tunare/gfaydark
              {   0,   0,   0,   0,   7,   1, 214,  36,  54 },  // Half Elf/Warrior/Tribunal/gfaydark
              {   0,   0,   0,   0,   7,   1, 209,  36,  54 },  // Half Elf/Warrior/Prexus/gfaydark
              {   0,   0,   0,   0,   7,   1, 212,  36,   1 },  // Half Elf/Warrior/Rodcet/qeynos
              {   0,   0,   0,   0,   7,   1, 204,  36,  10 },  // Half Elf/Warrior/Erollsi/freporte
              {   0,   0,   0,   0,   7,   1, 201,  36,  45 },  // Half Elf/Warrior/Bertox/qcat
              {   0,   0,   0,   0,   7,   1, 207,  36,   1 },  // Half Elf/Warrior/Karana/qeynos
              {   0,   0,   0,   0,   7,   1, 206,  36,  10 },  // Half Elf/Warrior/Innoruuk/freporte
              {   0,   0,   0,   0,   7,   1, 396,  36,  10 },  // Half Elf/Warrior/Agnostic/freporte
              {   0,   0,   0,   0,   7,   1, 209,  36,  10 },  // Half Elf/Warrior/Prexus/freporte
              {   0,   0,   0,   0,   7,   1, 211,  36,  10 },  // Half Elf/Warrior/Rallos Zek/freporte
              {   0,   0,   0,   0,   7,   1, 214,  36,  10 },  // Half Elf/Warrior/Tribunal/freporte
              {   0,   0,   0,   0,   7,   1, 396,  36,   1 },  // Half Elf/Warrior/Agnostic/qeynos
              {   0,   0,   0,   0,   7,   1, 211,  36,   1 },  // Half Elf/Warrior/Rallos Zek/qeynos
              {   0,   0,   0,   0,   7,   1, 214,  36,   1 },  // Half Elf/Warrior/Tribunal/qeynos
              {   0,   0,   0,   0,   7,   1, 209,  36,   1 },  // Half Elf/Warrior/Prexus/qeynos
//               {   0,   8,   0,   0,   7,   3, 204,  33, 394 },  // Half Elf/Paladin/Erollsi/crescent
//               {   0,   8,   0,   0,   7,   3, 208,  33, 394 },  // Half Elf/Paladin/Mithaniel Marr/crescent
//               {   0,   8,   0,   0,   7,   3, 212,  33, 394 },  // Half Elf/Paladin/Rodcet/crescent
//               {   0,   8,   0,   0,   7,   3, 215,  33, 394 },  // Half Elf/Paladin/Tunare/crescent
//               {   0,   8,   0,   0,   7,   3, 207,  33, 394 },  // Half Elf/Paladin/Karana/crescent
              {   0,   0,   0,   0,   7,   3, 207,  33,   1 },  // Half Elf/Paladin/Karana/qeynos
              {   0,   0,   0,   0,   7,   3, 215,  33,  61 },  // Half Elf/Paladin/Tunare/felwithea
              {   0,   0,   0,   0,   7,   3, 212,  33,   2 },  // Half Elf/Paladin/Rodcet/qeynos2
              {   0,   0,   0,   0,   7,   3, 204,  33,   9 },  // Half Elf/Paladin/Erollsi/freportw
              {   0,   0,   0,   0,   7,   3, 208,  33,   9 },  // Half Elf/Paladin/Mithaniel Marr/freportw
//               {   0,   8,   0,   0,   7,   4, 207,  34, 394 },  // Half Elf/Ranger/Karana/crescent
//               {   0,   8,   0,   0,   7,   4, 215,  34, 394 },  // Half Elf/Ranger/Tunare/crescent
              {   0,   0,   0,   0,   7,   4, 207,  34,   3 },  // Half Elf/Ranger/Karana/qrg
              {   0,   0,   0,   0,   7,   4, 215,  34,  54 },  // Half Elf/Ranger/Tunare/gfaydark
              {   0,   0,   0,   0,   7,   4, 215,  34,   3 },  // Half Elf/Ranger/Tunare/qrg
//               {   0,   8,   0,   0,   7,   6, 207,  32, 394 },  // Half Elf/Druid/Karana/crescent
//               {   0,   8,   0,   0,   7,   6, 215,  32, 394 },  // Half Elf/Druid/Tunare/crescent
              {   0,   0,   0,   0,   7,   6, 207,  32,   3 },  // Half Elf/Druid/Karana/qrg
              {   0,   0,   0,   0,   7,   6, 215,  32,  54 },  // Half Elf/Druid/Tunare/gfaydark
              {   0,   0,   0,   0,   7,   6, 215,  32,   3 },  // Half Elf/Druid/Tunare/qrg
//               {   0,   8,   0,   0,   7,   8, 202,  31, 394 },  // Half Elf/Bard/Brell/crescent
//               {   0,   8,   0,   0,   7,   8, 210,  31, 394 },  // Half Elf/Bard/Quellious/crescent
//               {   0,   8,   0,   0,   7,   8, 212,  31, 394 },  // Half Elf/Bard/Rodcet/crescent
//               {   0,   8,   0,   0,   7,   8, 396,  31, 394 },  // Half Elf/Bard/Agnostic/crescent
//               {   0,   8,   0,   0,   7,   8, 216,  31, 394 },  // Half Elf/Bard/Veeshan/crescent
//               {   0,   8,   0,   0,   7,   8, 215,  31, 394 },  // Half Elf/Bard/Tunare/crescent
//               {   0,   8,   0,   0,   7,   8, 214,  31, 394 },  // Half Elf/Bard/Tribunal/crescent
//               {   0,   8,   0,   0,   7,   8, 213,  31, 394 },  // Half Elf/Bard/Solusek/crescent
//               {   0,   8,   0,   0,   7,   8, 211,  31, 394 },  // Half Elf/Bard/Rallos Zek/crescent
//               {   0,   8,   0,   0,   7,   8, 209,  31, 394 },  // Half Elf/Bard/Prexus/crescent
//               {   0,   8,   0,   0,   7,   8, 204,  31, 394 },  // Half Elf/Bard/Erollsi/crescent
//               {   0,   8,   0,   0,   7,   8, 205,  31, 394 },  // Half Elf/Bard/Bristlebane/crescent
//               {   0,   8,   0,   0,   7,   8, 208,  31, 394 },  // Half Elf/Bard/Mithaniel Marr/crescent
//               {   0,   8,   0,   0,   7,   8, 207,  31, 394 },  // Half Elf/Bard/Karana/crescent
              {   0,   0,   0,   0,   7,   8, 396,  31,  54 },  // Half Elf/Bard/Agnostic/gfaydark
              {   0,   0,   0,   0,   7,   8, 212,  31,   1 },  // Half Elf/Bard/Rodcet/qeynos
              {   0,   0,   0,   0,   7,   8, 214,  31,  54 },  // Half Elf/Bard/Tribunal/gfaydark
              {   0,   0,   0,   0,   7,   8, 202,  31,  54 },  // Half Elf/Bard/Brell/gfaydark
              {   0,   0,   0,   0,   7,   8, 213,  31,  54 },  // Half Elf/Bard/Solusek/gfaydark
              {   0,   0,   0,   0,   7,   8, 210,  31,  54 },  // Half Elf/Bard/Quellious/gfaydark
              {   0,   0,   0,   0,   7,   8, 209,  31,  54 },  // Half Elf/Bard/Prexus/gfaydark
              {   0,   0,   0,   0,   7,   8, 205,  31,  54 },  // Half Elf/Bard/Bristlebane/gfaydark
              {   0,   0,   0,   0,   7,   8, 207,  31,   1 },  // Half Elf/Bard/Karana/qeynos
              {   0,   0,   0,   0,   7,   8, 204,  31,  10 },  // Half Elf/Bard/Erollsi/freporte
              {   0,   0,   0,   0,   7,   8, 208,  31,  10 },  // Half Elf/Bard/Mithaniel Marr/freporte
              {   0,   0,   0,   0,   7,   8, 211,  31,  54 },  // Half Elf/Bard/Rallos Zek/gfaydark
              {   0,   0,   0,   0,   7,   8, 216,  31,  54 },  // Half Elf/Bard/Veeshan/gfaydark
              {   0,   0,   0,   0,   7,   8, 215,  31,  54 },  // Half Elf/Bard/Tunare/gfaydark
              {   0,   0,   0,   0,   7,   8, 396,  31,  10 },  // Half Elf/Bard/Agnostic/freporte
              {   0,   0,   0,   0,   7,   8, 209,  31,  10 },  // Half Elf/Bard/Prexus/freporte
              {   0,   0,   0,   0,   7,   8, 213,  31,  10 },  // Half Elf/Bard/Solusek/freporte
              {   0,   0,   0,   0,   7,   8, 214,  31,  10 },  // Half Elf/Bard/Tribunal/freporte
              {   0,   0,   0,   0,   7,   8, 211,  31,  10 },  // Half Elf/Bard/Rallos Zek/freporte
              {   0,   0,   0,   0,   7,   8, 216,  31,  10 },  // Half Elf/Bard/Veeshan/freporte
              {   0,   0,   0,   0,   7,   8, 215,  31,  10 },  // Half Elf/Bard/Tunare/freporte
              {   0,   0,   0,   0,   7,   8, 202,  31,  10 },  // Half Elf/Bard/Brell/freporte
              {   0,   0,   0,   0,   7,   8, 210,  31,  10 },  // Half Elf/Bard/Quellious/freporte
              {   0,   0,   0,   0,   7,   8, 205,  31,  10 },  // Half Elf/Bard/Bristlebane/freporte
              {   0,   0,   0,   0,   7,   8, 396,  31,   1 },  // Half Elf/Bard/Agnostic/qeynos
              {   0,   0,   0,   0,   7,   8, 211,  31,   1 },  // Half Elf/Bard/Rallos Zek/qeynos
              {   0,   0,   0,   0,   7,   8, 216,  31,   1 },  // Half Elf/Bard/Veeshan/qeynos
              {   0,   0,   0,   0,   7,   8, 215,  31,   1 },  // Half Elf/Bard/Tunare/qeynos
              {   0,   0,   0,   0,   7,   8, 214,  31,   1 },  // Half Elf/Bard/Tribunal/qeynos
              {   0,   0,   0,   0,   7,   8, 202,  31,   1 },  // Half Elf/Bard/Brell/qeynos
              {   0,   0,   0,   0,   7,   8, 213,  31,   1 },  // Half Elf/Bard/Solusek/qeynos
              {   0,   0,   0,   0,   7,   8, 210,  31,   1 },  // Half Elf/Bard/Quellious/qeynos
              {   0,   0,   0,   0,   7,   8, 209,  31,   1 },  // Half Elf/Bard/Prexus/qeynos
              {   0,   0,   0,   0,   7,   8, 205,  31,   1 },  // Half Elf/Bard/Bristlebane/qeynos
//               {   0,   8,   0,   0,   7,   9, 201,  35, 394 },  // Half Elf/Rogue/Bertox/crescent
//               {   0,   8,   0,   0,   7,   9, 205,  35, 394 },  // Half Elf/Rogue/Bristlebane/crescent
//               {   0,   8,   0,   0,   7,   9, 204,  35, 394 },  // Half Elf/Rogue/Erollsi/crescent
//               {   0,   8,   0,   0,   7,   9, 212,  35, 394 },  // Half Elf/Rogue/Rodcet/crescent
//               {   0,   8,   0,   0,   7,   9, 396,  35, 394 },  // Half Elf/Rogue/Agnostic/crescent
//               {   0,   8,   0,   0,   7,   9, 215,  35, 394 },  // Half Elf/Rogue/Tunare/crescent
//               {   0,   8,   0,   0,   7,   9, 207,  35, 394 },  // Half Elf/Rogue/Karana/crescent
              {   0,   0,   0,   0,   7,   9, 396,  35,  54 },  // Half Elf/Rogue/Agnostic/gfaydark
              {   0,   0,   0,   0,   7,   9, 205,  35,  54 },  // Half Elf/Rogue/Bristlebane/gfaydark
              {   0,   0,   0,   0,   7,   9, 201,  35,   2 },  // Half Elf/Rogue/Bertox/qeynos2
              {   0,   0,   0,   0,   7,   9, 207,  35,   2 },  // Half Elf/Rogue/Karana/qeynos2
              {   0,   0,   0,   0,   7,   9, 212,  35,   2 },  // Half Elf/Rogue/Rodcet/qeynos2
              {   0,   0,   0,   0,   7,   9, 215,  35,  54 },  // Half Elf/Rogue/Tunare/gfaydark
              {   0,   0,   0,   0,   7,   9, 204,  35,  10 },  // Half Elf/Rogue/Erollsi/freporte
              {   0,   0,   0,   0,   7,   9, 396,  35,  10 },  // Half Elf/Rogue/Agnostic/freporte
              {   0,   0,   0,   0,   7,   9, 205,  35,  10 },  // Half Elf/Rogue/Bristlebane/freporte
              {   0,   0,   0,   0,   7,   9, 396,  35,   2 },  // Half Elf/Rogue/Agnostic/qeynos2
              {   0,   0,   0,   0,   7,   9, 205,  35,   2 },  // Half Elf/Rogue/Bristlebane/qeynos2
//               {   0,   8,   0,   0,   8,   1, 202,  16, 394 },  // Dward/Warrior/Brell/crescent
//               {   0,   8,   0,   0,   8,   1, 396,  16, 394 },  // Dward/Warrior/Agnostic/crescent
              {   0,   0,   0,   0,   8,   1, 396,  16,  60 },  // Dward/Warrior/Agnostic/kaladima
              {   0,   0,   0,   0,   8,   1, 202,  16,  60 },  // Dward/Warrior/Brell/kaladima
//              {   0,   8,   0,   0,   8,   2, 202,  13, 394 },  // Dward/Cleric/Brell/crescent
              {   0,   0,   0,   0,   8,   2, 202,  13,  67 },  // Dward/Cleric/Brell/kaladimb
//              {   0,   8,   0,   0,   8,   3, 202,  14, 394 },  // Dward/Paladin/Brell/crescent
              {   0,   0,   0,   0,   8,   3, 202,  14,  67 },  // Dward/Paladin/Brell/kaladimb
//               {   0,   8,   0,   0,   8,   9, 202,  15, 394 },  // Dward/Rogue/Brell/crescent
//               {   0,   8,   0,   0,   8,   9, 396,  15, 394 },  // Dward/Rogue/Agnostic/crescent
//               {   0,   8,   0,   0,   8,   9, 205,  15, 394 },  // Dward/Rogue/Bristlebane/crescent
              {   0,   0,   0,   0,   8,   9, 396,  15,  67 },  // Dward/Rogue/Agnostic/kaladimb
              {   0,   0,   0,   0,   8,   9, 205,  15,  67 },  // Dward/Rogue/Bristlebane/kaladimb
              {   0,   0,   0,   0,   8,   9, 202,  15,  67 },  // Dward/Rogue/Brell/kaladimb
//               {  64,   8,   0,   0,   8,  16, 202,  12, 394 },  // Dward/Berzerker/Brell/crescent
//               {  64,   8,   0,   0,   8,  16, 205,  12, 394 },  // Dward/Berzerker/Bristlebane/crescent
//               {  64,   8,   0,   0,   8,  16, 396,  12, 394 },  // Dward/Berzerker/Agnostic/crescent
              {  64,   0,   0,   0,   8,  16, 396,  12,  67 },  // Dward/Berzerker/Agnostic/kaladimb
              {  64,   0,   0,   0,   8,  16, 205,  12,  67 },  // Dward/Berzerker/Bristlebane/kaladimb
              {  64,   0,   0,   0,   8,  16, 202,  12,  67 },  // Dward/Berzerker/Brell/kaladimb
//               {   0,   8,   0,   0,   9,   1, 203,  74, 394 },  // Troll/Warrior/Cazic/crescent
//               {   0,   8,   0,   0,   9,   1, 396,  74, 394 },  // Troll/Warrior/Agnostic/crescent
//               {   0,   8,   0,   0,   9,   1, 211,  74, 394 },  // Troll/Warrior/Rallos Zek/crescent
//               {   0,   8,   0,   0,   9,   1, 206,  74, 394 },  // Troll/Warrior/Innoruuk/crescent
              {   0,   0,   0,   0,   9,   1, 396,  74,  52 },  // Troll/Warrior/Agnostic/gukta
              {   0,   0,   0,   0,   9,   1, 206,  74,  52 },  // Troll/Warrior/Innoruuk/gukta
              {   0,   0,   0,   0,   9,   1, 211,  74,  52 },  // Troll/Warrior/Rallos Zek/gukta
              {   0,   0,   0,   0,   9,   1, 203,  74,  52 },  // Troll/Warrior/Cazic/gukta
//               {   0,   8,   0,   0,   9,   5, 203,  72, 394 },  // Troll/SK/Cazic/crescent
//               {   0,   8,   0,   0,   9,   5, 206,  72, 394 },  // Troll/SK/Innoruuk/crescent
              {   0,   0,   0,   0,   9,   5, 203,  72,  52 },  // Troll/SK/Cazic/gukta
              {   0,   0,   0,   0,   9,   5, 206,  72,  52 },  // Troll/SK/Innoruuk/gukta
//               {   0,   8,   0,   0,   9,  10, 203,  73, 394 },  // Troll/Shaman/Cazic/crescent
//               {   0,   8,   0,   0,   9,  10, 206,  73, 394 },  // Troll/Shaman/Innoruuk/crescent
              {   0,   0,   0,   0,   9,  10, 203,  73,  52 },  // Troll/Shaman/Cazic/gukta
              {   0,   0,   0,   0,   9,  10, 206,  73,  52 },  // Troll/Shaman/Innoruuk/gukta
//               {   4,   8,   0,   0,   9,  15, 203,  70, 394 },  // Troll/Beastlord/Cazic/crescent
//               {   4,   8,   0,   0,   9,  15, 206,  70, 394 },  // Troll/Beastlord/Innoruuk/crescent
              {   4,   0,   0,   0,   9,  15, 203,  70,  52 },  // Troll/Beastlord/Cazic/gukta
              {   4,   0,   0,   0,   9,  15, 206,  70,  52 },  // Troll/Beastlord/Innoruuk/gukta
//               {  64,   8,   0,   0,   9,  16, 203,  71, 394 },  // Troll/Berzerker/Cazic/crescent
//               {  64,   8,   0,   0,   9,  16, 211,  71, 394 },  // Troll/Berzerker/Rallos Zek/crescent
//               {  64,   8,   0,   0,   9,  16, 396,  71, 394 },  // Troll/Berzerker/Agnostic/crescent
//               {  64,   8,   0,   0,   9,  16, 206,  71, 394 },  // Troll/Berzerker/Innoruuk/crescent
              {  64,   0,   0,   0,   9,  16, 396,  71,  52 },  // Troll/Berzerker/Agnostic/gukta
              {  64,   0,   0,   0,   9,  16, 211,  71,  52 },  // Troll/Berzerker/Rallos Zek/gukta
              {  64,   0,   0,   0,   9,  16, 203,  71,  52 },  // Troll/Berzerker/Cazic/gukta
              {  64,   0,   0,   0,   9,  16, 206,  71,  52 },  // Troll/Berzerker/Innoruuk/gukta
//               {   0,   8,   0,   0,  10,   1, 203, 107, 394 },  // Ogre/Warrior/Cazic/crescent
//               {   0,   8,   0,   0,  10,   1, 396, 107, 394 },  // Ogre/Warrior/Agnostic/crescent
//               {   0,   8,   0,   0,  10,   1, 211, 107, 394 },  // Ogre/Warrior/Rallos Zek/crescent
              {   0,   0,   0,   0,  10,   1, 396, 107,  49 },  // Ogre/Warrior/Agnostic/oggok
              {   0,   0,   0,   0,  10,   1, 203, 107,  49 },  // Ogre/Warrior/Cazic/oggok
              {   0,   0,   0,   0,  10,   1, 211, 107,  49 },  // Ogre/Warrior/Rallos Zek/oggok
//               {   0,   8,   0,   0,  10,   5, 203,  67, 394 },  // Ogre/SK/Cazic/crescent
//               {   0,   8,   0,   0,  10,   5, 211,  67, 394 },  // Ogre/SK/Rallos Zek/crescent
              {   0,   0,   0,   0,  10,   5, 203,  67,  49 },  // Ogre/SK/Cazic/oggok
              {   0,   0,   0,   0,  10,   5, 211,  67,  49 },  // Ogre/SK/Rallos Zek/oggok
//              {   0,   8,   0,   0,  10,  10, 211,  68, 394 },  // Ogre/Shaman/Rallos Zek/crescent
              {   0,   0,   0,   0,  10,  10, 211,  68,  49 },  // Ogre/Shaman/Rallos Zek/oggok
//              {   4,   8,   0,   0,  10,  15, 211,  65, 394 },  // Ogre/Beastlord/Rallos Zek/crescent
              {   4,   0,   0,   0,  10,  15, 211,  65,  49 },  // Ogre/Beastlord/Rallos Zek/oggok
//               {  64,   8,   0,   0,  10,  16, 203, 108, 394 },  // Ogre/Berzerker/Cazic/crescent
//               {  64,   8,   0,   0,  10,  16, 396, 108, 394 },  // Ogre/Berzerker/Agnostic/crescent
//               {  64,   8,   0,   0,  10,  16, 211, 108, 394 },  // Ogre/Berzerker/Rallos Zek/crescent
              {  64,   0,   0,   0,  10,  16, 396, 108,  49 },  // Ogre/Berzerker/Agnostic/oggok
              {  64,   0,   0,   0,  10,  16, 211, 108,  49 },  // Ogre/Berzerker/Rallos Zek/oggok
              {  64,   0,   0,   0,  10,  16, 203, 108,  49 },  // Ogre/Berzerker/Cazic/oggok
//               {   0,   8,   0,   0,  11,   1, 202,  42, 394 },  // Halfling/Warrior/Brell/crescent
//               {   0,   8,   0,   0,  11,   1, 396,  42, 394 },  // Halfling/Warrior/Agnostic/crescent
//               {   0,   8,   0,   0,  11,   1, 211,  42, 394 },  // Halfling/Warrior/Rallos Zek/crescent
              {   0,   0,   0,   0,  11,   1, 396,  42,  19 },  // Halfling/Warrior/Agnostic/rivervale
              {   0,   0,   0,   0,  11,   1, 211,  42,  19 },  // Halfling/Warrior/Rallos Zek/rivervale
              {   0,   0,   0,   0,  11,   1, 202,  42,  19 },  // Halfling/Warrior/Brell/rivervale
//              {   0,   8,   0,   0,  11,   2, 205,  37, 394 },  // Halfling/Cleric/Bristlebane/crescent
              {   0,   0,   0,   0,  11,   2, 205,  37,  19 },  // Halfling/Cleric/Bristlebane/rivervale
//              {   0,   8,   0,   0,  11,   3, 207,  39, 394 },  // Halfling/Paladin/Karana/crescent
              {   0,   0,   0,   0,  11,   3, 207,  39,  19 },  // Halfling/Paladin/Karana/rivervale
//              {   0,   8,   0,   0,  11,   4, 207,  40, 394 },  // Halfling/Ranger/Karana/crescent
              {   0,   0,   0,   0,  11,   4, 207,  40,  19 },  // Halfling/Ranger/Karana/rivervale
//              {   0,   8,   0,   0,  11,   6, 207,  38, 394 },  // Halfling/Druid/Karana/crescent
              {   0,   0,   0,   0,  11,   6, 207,  38,  19 },  // Halfling/Druid/Karana/rivervale
//               {   0,   8,   0,   0,  11,   9, 202,  41, 394 },  // Halfling/Rogue/Brell/crescent
//               {   0,   8,   0,   0,  11,   9, 205,  41, 394 },  // Halfling/Rogue/Bristlebane/crescent
//               {   0,   8,   0,   0,  11,   9, 396,  41, 394 },  // Halfling/Rogue/Agnostic/crescent
              {   0,   0,   0,   0,  11,   9, 396,  41,  19 },  // Halfling/Rogue/Agnostic/rivervale
              {   0,   0,   0,   0,  11,   9, 205,  41,  19 },  // Halfling/Rogue/Bristlebane/rivervale
              {   0,   0,   0,   0,  11,   9, 202,  41,  19 },  // Halfling/Rogue/Brell/rivervale
//               {   0,   8,   0,   0,  12,   1, 201,  30, 394 },  // Gnome/Warrior/Bertox/crescent
//               {   0,   8,   0,   0,  12,   1, 396,  30, 394 },  // Gnome/Warrior/Agnostic/crescent
//               {   0,   8,   0,   0,  12,   1, 202,  30, 394 },  // Gnome/Warrior/Brell/crescent
//               {   0,   8,   0,   0,  12,   1, 211,  30, 394 },  // Gnome/Warrior/Rallos Zek/crescent
              {   0,   0,   0,   0,  12,   1, 396,  30,  55 },  // Gnome/Warrior/Agnostic/akanon
              {   0,   0,   0,   0,  12,   1, 211,  30,  55 },  // Gnome/Warrior/Rallos Zek/akanon
              {   0,   0,   0,   0,  12,   1, 202,  30,  55 },  // Gnome/Warrior/Brell/akanon
              {   0,   0,   0,   0,  12,   1, 201,  30,  55 },  // Gnome/Warrior/Bertox/akanon
//               {   0,   8,   0,   0,  12,   2, 201,  23, 394 },  // Gnome/Cleric/Bertox/crescent
//               {   0,   8,   0,   0,  12,   2, 205,  23, 394 },  // Gnome/Cleric/Bristlebane/crescent
//               {   0,   8,   0,   0,  12,   2, 202,  23, 394 },  // Gnome/Cleric/Brell/crescent
              {   0,   0,   0,   0,  12,   2, 201,  23,  55 },  // Gnome/Cleric/Bertox/akanon
              {   0,   0,   0,   0,  12,   2, 202,  23,  55 },  // Gnome/Cleric/Brell/akanon
              {   0,   0,   0,   0,  12,   2, 205,  23,  55 },  // Gnome/Cleric/Bristlebane/akanon
//              {   0,   8,   0,   0,  12,   3, 202,  27, 394 },  // Gnome/Paladin/Brell/crescent
              {   0,   0,   0,   0,  12,   3, 202,  27,  55 },  // Gnome/Paladin/Brell/akanon
//              {   0,   8,   0,   0,  12,   5, 201,  29, 394 },  // Gnome/SK/Bertox/crescent
              {   0,   0,   0,   0,  12,   5, 201,  29,  55 },  // Gnome/SK/Bertox/akanon
//               {   0,   8,   0,   0,  12,   9, 201,  28, 394 },  // Gnome/Rogue/Bertox/crescent
//               {   0,   8,   0,   0,  12,   9, 396,  28, 394 },  // Gnome/Rogue/Agnostic/crescent
//               {   0,   8,   0,   0,  12,   9, 202,  28, 394 },  // Gnome/Rogue/Brell/crescent
//               {   0,   8,   0,   0,  12,   9, 205,  28, 394 },  // Gnome/Rogue/Bristlebane/crescent
              {   0,   0,   0,   0,  12,   9, 396,  28,  55 },  // Gnome/Rogue/Agnostic/akanon
              {   0,   0,   0,   0,  12,   9, 201,  28,  55 },  // Gnome/Rogue/Bertox/akanon
              {   0,   0,   0,   0,  12,   9, 202,  28,  55 },  // Gnome/Rogue/Brell/akanon
              {   0,   0,   0,   0,  12,   9, 205,  28,  55 },  // Gnome/Rogue/Bristlebane/akanon
//              {   0,   8,   0,   0,  12,  11, 201,  26, 394 },  // Gnome/Necro/Bertox/crescent
              {   0,   0,   0,   0,  12,  11, 201,  26,  55 },  // Gnome/Necro/Bertox/akanon
//               {   0,   8,   0,   0,  12,  12, 201,  25, 394 },  // Gnome/Wizard/Bertox/crescent
//               {   0,   8,   0,   0,  12,  12, 202,  25, 394 },  // Gnome/Wizard/Brell/crescent
//               {   0,   8,   0,   0,  12,  12, 213,  25, 394 },  // Gnome/Wizard/Solusek/crescent
//               {   0,   8,   0,   0,  12,  12, 396,  25, 394 },  // Gnome/Wizard/Agnostic/crescent
              {   0,   0,   0,   0,  12,  12, 396,  25,  55 },  // Gnome/Wizard/Agnostic/akanon
              {   0,   0,   0,   0,  12,  12, 201,  25,  55 },  // Gnome/Wizard/Bertox/akanon
              {   0,   0,   0,   0,  12,  12, 202,  25,  55 },  // Gnome/Wizard/Brell/akanon
              {   0,   0,   0,   0,  12,  12, 213,  25,  55 },  // Gnome/Wizard/Solusek/akanon
//               {   0,   8,   0,   0,  12,  13, 201,  25, 394 },  // Gnome/Magician/Bertox/crescent
//               {   0,   8,   0,   0,  12,  13, 396,  25, 394 },  // Gnome/Magician/Agnostic/crescent
//               {   0,   8,   0,   0,  12,  13, 202,  25, 394 },  // Gnome/Magician/Brell/crescent
              {   0,   0,   0,   0,  12,  13, 396,  25,  55 },  // Gnome/Magician/Agnostic/akanon
              {   0,   0,   0,   0,  12,  13, 202,  25,  55 },  // Gnome/Magician/Brell/akanon
              {   0,   0,   0,   0,  12,  13, 201,  25,  55 },  // Gnome/Magician/Bertox/akanon
//               {   0,   8,   0,   0,  12,  14, 201,  24, 394 },  // Gnome/Enchanter/Bertox/crescent
//               {   0,   8,   0,   0,  12,  14, 396,  24, 394 },  // Gnome/Enchanter/Agnostic/crescent
//               {   0,   8,   0,   0,  12,  14, 202,  24, 394 },  // Gnome/Enchanter/Brell/crescent
              {   0,   0,   0,   0,  12,  14, 396,  24,  55 },  // Gnome/Enchanter/Agnostic/akanon
              {   0,   0,   0,   0,  12,  14, 201,  24,  55 },  // Gnome/Enchanter/Bertox/akanon
              {   0,   0,   0,   0,  12,  14, 202,  24,  55 },  // Gnome/Enchanter/Brell/akanon
//              {   1,   8,   0,   0, 128,   1, 203,  64, 394 },  // Iksar/Warrior/Cazic/crescent
              {   1,   0,   0,   0, 128,   1, 203,  64, 106 },  // Iksar/Warrior/Cazic/cabeast
//              {   1,   8,   0,   0, 128,   5, 203,  62, 394 },  // Iksar/SK/Cazic/crescent
              {   1,   0,   0,   0, 128,   5, 203,  62, 106 },  // Iksar/SK/Cazic/cabeast
//              {   1,   8,   0,   0, 128,   7, 203,  60, 394 },  // Iksar/Monk/Cazic/crescent
              {   1,   0,   0,   0, 128,   7, 203,  60, 106 },  // Iksar/Monk/Cazic/cabeast
//              {   1,   8,   0,   0, 128,  10, 203,  63, 394 },  // Iksar/Shaman/Cazic/crescent
              {   1,   0,   0,   0, 128,  10, 203,  63, 106 },  // Iksar/Shaman/Cazic/cabeast
//              {   1,   8,   0,   0, 128,  11, 203,  61, 394 },  // Iksar/Necro/Cazic/crescent
              {   1,   0,   0,   0, 128,  11, 203,  61,  82 },  // Iksar/Necro/Cazic/cabwest
//              {   5,   8,   0,   0, 128,  15, 203,  59, 394 },  // Iksar/Beastlord/Cazic/crescent
              {   5,   0,   0,   0, 128,  15, 203,  59, 106 },  // Iksar/Beastlord/Cazic/cabeast
//              {   4,   8,   0,   0, 130,   1, 396,  80, 394 },  // Vah Shir/Warrior/Agnostic/crescent
              {   4,   0,   0,   0, 130,   1, 396,  80,  74 },  // Vah Shir/Warrior/Agnostic/kerraridge
//              {   4,   8,   0,   0, 130,   8, 396,  75, 394 },  // Vah Shir/Bard/Agnostic/crescent
              {   4,   0,   0,   0, 130,   8, 396,  75,  74 },  // Vah Shir/Bard/Agnostic/kerraridge
//              {   4,   8,   0,   0, 130,   9, 396,  78, 394 },  // Vah Shir/Rogue/Agnostic/crescent
              {   4,   0,   0,   0, 130,   9, 396,  78,  74 },  // Vah Shir/Rogue/Agnostic/kerraridge
//               {   4,   8,   0,   0, 130,  10, 396,  79, 394 },  // Vah Shir/Shaman/Agnostic/crescent
              {   4,   0,   0,   0, 130,  10, 396,  79,  74 },  // Vah Shir/Shaman/Agnostic/kerraridge
//               {   4,   8,   0,   0, 130,  15, 396,  76, 394 },  // Vah Shir/Beastlord/Agnostic/crescent
              {   4,   0,   0,   0, 130,  15, 396,  76,  74 },  // Vah Shir/Beastlord/Agnostic/kerraridge
//               {  68,   8,   0,   0, 130,  16, 396,  77, 394 },  // Vah Shir/Berzerker/Agnostic/crescent
              {  68,   0,   0,   0, 130,  16, 396,  77,  74 },  // Vah Shir/Berzerker/Agnostic/kerraridge
//               {  16,   8,   0,   0, 330,   1, 208,  92, 394 },  // Froglok/Warrior/Mithaniel Marr/crescent
              {  16,   0,   0,   0, 330,   1, 208,  92,  83 },  // Froglok/Warrior/Mithaniel Marr/swampofnohope
//               {  16,   8,   0,   0, 330,   2, 206,  86, 394 },  // Froglok/Cleric/Innoruuk/crescent
//               {  16,   8,   0,   0, 330,   2, 208,  86, 394 },  // Froglok/Cleric/Mithaniel Marr/crescent
              {  16,   0,   0,   0, 330,   2, 206,  86,  83 },  // Froglok/Cleric/Innoruuk/swampofnohope
              {  16,   0,   0,   0, 330,   2, 208,  86,  83 },  // Froglok/Cleric/Mithaniel Marr/swampofnohope
//              {  16,   8,   0,   0, 330,   3, 208,  88, 394 },  // Froglok/Paladin/Mithaniel Marr/crescent
              {  16,   0,   0,   0, 330,   3, 208,  88,  83 },  // Froglok/Paladin/Mithaniel Marr/swampofnohope
//               {  16,   8,   0,   0, 330,   5, 206,  90, 394 },  // Froglok/SK/Innoruuk/crescent
              {  16,   0,   0,   0, 330,   5, 206,  90,  83 },  // Froglok/SK/Innoruuk/swampofnohope
//               {  16,   8,   0,   0, 330,   9, 206,  89, 394 },  // Froglok/Rogue/Innoruuk/crescent
              {  16,   0,   0,   0, 330,   9, 206,  89,  83 },  // Froglok/Rogue/Innoruuk/swampofnohope
//               {  16,   8,   0,   0, 330,  10, 208,  91, 394 },  // Froglok/Shaman/Mithaniel Marr/crescent
              {  16,   0,   0,   0, 330,  10, 208,  91,  83 },  // Froglok/Shaman/Mithaniel Marr/swampofnohope
//               {  16,   8,   0,   0, 330,  11, 206,  87, 394 },  // Froglok/Necro/Innoruuk/crescent
              {  16,   0,   0,   0, 330,  11, 206,  87,  83 },  // Froglok/Necro/Innoruuk/swampofnohope
//               {  16,   8,   0,   0, 330,  12, 208,  93, 394 },  // Froglok/Wizard/Mithaniel Marr/crescent
              {  16,   0,   0,   0, 330,  12, 208,  93,  83 },  // Froglok/Wizard/Mithaniel Marr/swampofnohope
//               {   0,   8,   0,   0, 522,   1, 216,  94, 394 },  // Drakkin/Warrior/Veeshan/crescent
//               {   0,   8,   0,   0, 522,   2, 216,  95, 394 },  // Drakkin/Cleric/Veeshan/crescent
//               {   0,   8,   0,   0, 522,   3, 216,  96, 394 },  // Drakkin/Paladin/Veeshan/crescent
//               {   0,   8,   0,   0, 522,   4, 216,  97, 394 },  // Drakkin/Ranger/Veeshan/crescent
//               {   0,   8,   0,   0, 522,   5, 216,  98, 394 },  // Drakkin/SK/Veeshan/crescent
//               {   0,   8,   0,   0, 522,   6, 216,  99, 394 },  // Drakkin/Druid/Veeshan/crescent
//               {   0,   8,   0,   0, 522,   7, 216, 100, 394 },  // Drakkin/Monk/Veeshan/crescent
//               {   0,   8,   0,   0, 522,   8, 216, 101, 394 },  // Drakkin/Bard/Veeshan/crescent
//               {   0,   8,   0,   0, 522,   9, 216, 102, 394 },  // Drakkin/Rogue/Veeshan/crescent
//               {   0,   8,   0,   0, 522,  11, 216, 103, 394 },  // Drakkin/Necro/Veeshan/crescent
//               {   0,   8,   0,   0, 522,  12, 216, 104, 394 },  // Drakkin/Wizard/Veeshan/crescent
//               {   0,   8,   0,   0, 522,  13, 216, 105, 394 },  // Drakkin/Magician/Veeshan/crescent
//               {   0,   8,   0,   0, 522,  14, 216, 106, 394 }  // Drakkin/Enchanter/Veeshan/crescent
	}
};

#pragma pack()

#endif
