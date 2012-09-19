#ifdef BOTS

#include "bot.h"

// TODO: The following declarations are redudant to declarations made in MobAI.cpp. Best move both blocks to a common header file.
const int Z_AGGRO=10;

const int MobAISpellRange=100; // max range of buffs
const int SpellType_Nuke=1;
const int SpellType_Heal=2;
const int SpellType_Root=4;
const int SpellType_Buff=8;
const int SpellType_Escape=16;
const int SpellType_Pet=32;
const int SpellType_Lifetap=64;
const int SpellType_Snare=128;
const int SpellType_DOT=256;
const int SpellType_Dispel=512;

const int SpellTypes_Detrimental = SpellType_Nuke|SpellType_Root|SpellType_Lifetap|SpellType_Snare|SpellType_DOT|SpellType_Dispel;
const int SpellTypes_Beneficial = SpellType_Heal|SpellType_Buff|SpellType_Escape|SpellType_Pet;

#define SpellType_Any		0xFFFF
#ifdef _EQDEBUG
	#define MobAI_DEBUG_Spells	-1
#else
	#define MobAI_DEBUG_Spells	-1
#endif

// This constructor is used during the bot create command
Bot::Bot(NPCType npcTypeData, Client* botOwner) : NPC(&npcTypeData, 0, 0, 0, 0, 0, 0, false) {
	if(botOwner) {
		this->SetBotOwner(botOwner);
		this->_botOwnerCharacterID = botOwner->CharacterID();
	}
	else {
		this->SetBotOwner(0);
		this->_botOwnerCharacterID = 0;
	}

	_lastTotalPlayTime = 0;
	_startTotalPlayTime = time(&_startTotalPlayTime);

	_baseMR = npcTypeData.MR;
	_baseCR = npcTypeData.CR;
	_baseDR = npcTypeData.DR;
	_baseFR = npcTypeData.FR;
	_basePR = npcTypeData.PR;
	_baseAC = npcTypeData.AC;
	_baseSTR = npcTypeData.STR;
	_baseSTA = npcTypeData.STA;
	_baseDEX = npcTypeData.DEX;
	_baseAGI = npcTypeData.AGI;
	_baseINT = npcTypeData.INT;
	_baseWIS = npcTypeData.WIS;
	_baseCHA = npcTypeData.CHA;
	_baseATK = npcTypeData.ATK;
	_baseRace = npcTypeData.race;
	_baseGender = npcTypeData.gender;

	SetBotID(0);
	SetBotSpellID(0);
	SetSpawnStatus(false);
	SetBotArcher(false);
	SetBotCharmer(false);
	SetPetChooser(false);

	this->SetBotRaidID(0);

	// Do this once and only in this constructor
	GenerateAppearance();

	GenerateBaseStats();
	GenerateArmorClass();

	// Calculate HitPoints Last As It Uses Base Stats
	GenerateBaseHitPoints();

	strcpy(this->name, this->GetCleanName());
}

// This constructor is used when the bot is loaded out of the database
Bot::Bot(uint32 botID, uint32 botOwnerCharacterID, uint32 botSpellsID, double totalPlayTime, NPCType npcTypeData) : NPC(&npcTypeData, 0, 0, 0, 0, 0, 0, false) {
	this->_botOwnerCharacterID = botOwnerCharacterID;

	if(this->_botOwnerCharacterID > 0) {
		this->SetBotOwner(entity_list.GetClientByCharID(this->_botOwnerCharacterID));
	}

	_lastTotalPlayTime = totalPlayTime;
	_startTotalPlayTime = time(&_startTotalPlayTime);

	_baseMR = npcTypeData.MR;
	_baseCR = npcTypeData.CR;
	_baseDR = npcTypeData.DR;
	_baseFR = npcTypeData.FR;
	_basePR = npcTypeData.PR;
	_baseAC = npcTypeData.AC;
	_baseSTR = npcTypeData.STR;
	_baseSTA = npcTypeData.STA;
	_baseDEX = npcTypeData.DEX;
	_baseAGI = npcTypeData.AGI;
	_baseINT = npcTypeData.INT;
	_baseWIS = npcTypeData.WIS;
	_baseCHA = npcTypeData.CHA;
	_baseATK = npcTypeData.ATK;
	_baseRace = npcTypeData.race;
	_baseGender = npcTypeData.gender;

	SetBotID(botID);
	SetBotSpellID(botSpellsID);
	SetSpawnStatus(false);
	SetBotArcher(false);
	SetBotCharmer(false);
	SetPetChooser(false);
	
	this->SetBotRaidID(0);

	strcpy(this->name, this->GetCleanName());

	std::string TempErrorMessage;

	EquipBot(&TempErrorMessage);

	if(!TempErrorMessage.empty()) {
		// TODO: log error message to zone error log
		if(GetBotOwner())
			GetBotOwner()->Message(13, TempErrorMessage.c_str());
	}

	GenerateBaseStats();
	GenerateArmorClass();

	// Calculate HitPoints Last As It Uses Base Stats
	GenerateBaseHitPoints();

	CalcBotStats(false);
}

Bot::~Bot() {
	// TODO: dependancy resource deallocation goes here (if any!)
}

void Bot::SetBotID(uint32 botID) {
	this->_botID = botID;
	this->npctype_id = botID;
}

void Bot::SetBotSpellID(uint32 newSpellID) {
	this->_botSpellID = newSpellID;
	this->npc_spells_id = newSpellID;
}

NPCType Bot::FillNPCTypeStruct(uint32 botSpellsID, std::string botName, std::string botLastName, uint8 botLevel, uint16 botRace, uint8 botClass, uint8 gender, float size, uint32 face, uint32 hairStyle, uint32 hairColor, uint32 eyeColor, uint32 eyeColor2, uint32 beardColor, uint32 beard, uint32 drakkinHeritage, uint32 drakkinTattoo, uint32 drakkinDetails, sint16 mr, sint16 cr, sint16 dr, sint16 fr, sint16 pr, sint16 ac, uint16 str, uint16 sta, uint16 dex, uint16 agi, uint16 _int, uint16 wis, uint16 cha, uint16 attack) {
	NPCType BotNPCType;
	int CopyLength = 0;

	CopyLength = botName.copy(BotNPCType.name, 63);
	BotNPCType.name[CopyLength] = '\0';
	CopyLength = 0;

	CopyLength = botLastName.copy(BotNPCType.lastname, 69);
	BotNPCType.lastname[CopyLength] = '\0';
	CopyLength = 0;

	BotNPCType.npc_spells_id = botSpellsID;
	BotNPCType.level = botLevel;
	BotNPCType.race = botRace;
	BotNPCType.class_ = botClass;
	BotNPCType.gender = gender;
	BotNPCType.size = size;
	BotNPCType.luclinface = face;
	BotNPCType.hairstyle = hairStyle;
	BotNPCType.haircolor = hairColor;
	BotNPCType.eyecolor1 = eyeColor;
	BotNPCType.eyecolor2 = eyeColor2;
	BotNPCType.beardcolor = beardColor;
	BotNPCType.beard = beard;
	BotNPCType.drakkin_heritage = drakkinHeritage;
	BotNPCType.drakkin_tattoo = drakkinTattoo;
	BotNPCType.drakkin_details = drakkinDetails;
	BotNPCType.MR = mr;
	BotNPCType.CR = cr;
	BotNPCType.DR = dr;
	BotNPCType.FR = fr;
	BotNPCType.PR = pr;
	BotNPCType.AC = ac;
	BotNPCType.STR = str;
	BotNPCType.STA = sta;
	BotNPCType.DEX = dex;
	BotNPCType.AGI = agi;
	BotNPCType.INT = _int;
	BotNPCType.WIS = wis;
	BotNPCType.CHA = cha;
	BotNPCType.ATK = attack;

	BotNPCType.npc_id = 0;
	BotNPCType.texture = 0;
	BotNPCType.d_meele_texture1 = 0;
	BotNPCType.d_meele_texture2 = 0;
	BotNPCType.qglobal = false;
	BotNPCType.attack_speed = 0;
	BotNPCType.runspeed = 1.25;
	BotNPCType.bodytype = 1;
	BotNPCType.findable = 0;
	BotNPCType.hp_regen = 0;
	BotNPCType.mana_regen = 0;
	BotNPCType.maxlevel = botLevel;

	return BotNPCType;
}

NPCType Bot::CreateDefaultNPCTypeStructForBot(std::string botName, std::string botLastName, uint8 botLevel, uint16 botRace, uint8 botClass, uint8 gender) {
	NPCType Result;
	int CopyLength = 0;

	CopyLength = botName.copy(Result.name, 63);
	Result.name[CopyLength] = '\0';
	CopyLength = 0;

	CopyLength = botLastName.copy(Result.lastname, 69);
	Result.lastname[CopyLength] = '\0';
	CopyLength = 0;

	Result.level = botLevel;
	Result.race = botRace;
	Result.class_ = botClass;
	Result.gender = gender;

	// default values
	Result.maxlevel = botLevel;
	Result.size = 6;
	Result.npc_id = 0;
	Result.bodytype = 1;
	Result.cur_hp = 0;
	Result.drakkin_details = 0;
	Result.drakkin_heritage = 0;
	Result.drakkin_tattoo = 0;
	Result.runspeed = 1.25;
	Result.bodytype = 1;
	Result.findable = 0;
	Result.hp_regen = 0;
	Result.mana_regen = 0;
	Result.texture = 0;
	Result.d_meele_texture1 = 0;
	Result.d_meele_texture2 = 0;
	Result.qglobal = false;
	Result.npc_spells_id = 0;
	Result.attack_speed = 0;
	Result.STR = 75;
	Result.STA = 75;
	Result.DEX = 75;
	Result.AGI = 75;
	Result.WIS = 75;
	Result.INT = 75;
	Result.CHA = 75;
	Result.ATK = 75;
	Result.MR = 25;
	Result.FR = 25;
	Result.DR = 15;
	Result.PR = 15;
	Result.CR = 25;
	Result.AC = 12;

	return Result;
}

void Bot::GenerateBaseStats() {
	int BotSpellID = 0;

	// base stats
	uint16 Strength = _baseSTR;
	uint16 Stamina = _baseSTA;
	uint16 Dexterity = _baseDEX;
	uint16 Agility = _baseAGI;
	uint16 Wisdom = _baseWIS;
	uint16 Intelligence = _baseINT;
	uint16 Charisma = _baseCHA;
	uint16 Attack = _baseATK;
	sint16 MagicResist = _baseMR;
	sint16 FireResist = _baseFR;
	sint16 DiseaseResist = _baseDR;
	sint16 PoisonResist = _basePR;
	sint16 ColdResist = _baseCR;

	switch(this->GetClass()) {
			case 1: // Warrior
				Strength += 10;
				Stamina += 20;
				Agility += 10;
				Dexterity += 10;
				Attack += 12;
				MagicResist += (1 / 2 + 1);
				break;
			case 2: // Cleric
				BotSpellID = 701;
				Strength += 5;
				Stamina += 5;
				Agility += 10;
				Wisdom += 30;
				Attack += 8;
				break;
			case 3: // Paladin
				BotSpellID = 708;
				Strength += 15;
				Stamina += 5;
				Wisdom += 15;
				Charisma += 10;
				Dexterity += 5;
				Attack =+ 17;
				DiseaseResist += 8;
				break;
			case 4: // Ranger
				BotSpellID = 710;
				Strength += 15;
				Stamina += 10;
				Agility += 10;
				Wisdom += 15;
				Attack += 17;
				FireResist += 4;
				ColdResist += 4;
				break;
			case 5: // Shadowknight
				BotSpellID = 709;
				Strength += 10;
				Stamina += 15;
				Intelligence += 20;
				Charisma += 5;
				Attack += 17;
				PoisonResist += 4;
				DiseaseResist += 4;
				break;
			case 6: // DiseaseResistuid
				BotSpellID = 707;
				Stamina += 15;
				Wisdom += 35;
				Attack += 5;
				break;
			case 7: // Monk
				Strength += 5;
				Stamina += 15;
				Agility += 15;
				Dexterity += 15;
				Attack += 17;
				break;
			case 8: // Bard
				BotSpellID = 711;
				Strength += 15;
				Dexterity += 10;
				Charisma += 15;
				Intelligence += 10;
				Attack += 17;
				break;
			case 9: // Rogue
				Strength += 10;
				Stamina += 20;
				Agility += 10;
				Dexterity += 10;
				Attack += 12;
				PoisonResist += 8;
				break;
			case 10: // Shaman
				BotSpellID = 706;
				Stamina += 10;
				Wisdom += 30;
				Charisma += 10;
				Attack += 28;
				break;
			case 11: // NeColdResistomancer
				BotSpellID = 703;
				Dexterity += 10;
				Agility += 10;
				Intelligence += 30;
				Attack += 5;
				break;
			case 12: // Wizard
				BotSpellID = 702;
				Stamina += 20;
				Intelligence += 30;
				Attack += 5;
				break;
			case 13: // Magician
				BotSpellID = 704;
				Stamina += 20;
				Intelligence += 30;
				Attack += 5;
				break;
			case 14: // Enchanter
				BotSpellID = 705;
				Intelligence += 25;
				Charisma += 25;
				Attack += 5;
				break;
			case 15: // Beastlord
				BotSpellID = 712;
				Stamina += 10;
				Agility += 10;
				Dexterity += 5;
				Wisdom += 20;
				Charisma += 5;
				Attack += 31;
				break;
			case 16: // Berserker
				Strength += 10;
				Stamina += 15;
				Dexterity += 15;
				Agility += 10;
				Attack += 25;
				break;
	}

	float BotSize = GetSize();

	switch(this->GetRace()) {
			case 1: // Humans have no race bonus
				break;
			case 2: // Barbarian
				Strength += 28;
				Stamina += 20;
				Agility += 7;
				Dexterity -= 5;
				Wisdom -= 5;
				Intelligence -= 10;
				Charisma -= 20;
				BotSize = 7;
				ColdResist += 10;
				break;
			case 3: // Erudite
				Strength -= 15;
				Stamina -= 5;
				Agility -= 5;
				Dexterity -= 5;
				Wisdom += 8;
				Intelligence += 32;
				Charisma -= 5;
				MagicResist += 5;
				DiseaseResist -= 5;
				break;
			case 4: // Wood Elf
				Strength -= 10;
				Stamina -= 10;
				Agility += 20;
				Dexterity += 5;
				Wisdom += 5;
				BotSize = 5;
				break;
			case 5: // High Elf
				Strength -= 20;
				Stamina -= 10;
				Agility += 10;
				Dexterity -= 5;
				Wisdom += 20;
				Intelligence += 12;
				Charisma += 5;
				break;
			case 6: // Dark Elf
				Strength -= 15;
				Stamina -= 10;
				Agility += 15;
				Wisdom += 8;
				Intelligence += 24;
				Charisma -= 15;
				BotSize = 5;
				break;
			case 7: // Half Elf
				Strength -= 5;
				Stamina -= 5;
				Agility += 15;
				Dexterity += 10;
				Wisdom -= 15;
				BotSize = 5.5;
				break;
			case 8: // Dwarf
				Strength += 15;
				Stamina += 15;
				Agility -= 5;
				Dexterity += 15;
				Wisdom += 8;
				Intelligence -= 15;
				Charisma -= 30;
				BotSize = 4;
				MagicResist -= 5;
				PoisonResist += 5;
				break;
			case 9: // Troll
				Strength += 33;
				Stamina += 34;
				Agility += 8;
				Wisdom -= 15;
				Intelligence -= 23;
				Charisma -= 35;
				BotSize = 8;
				FireResist -= 20;
				break;
			case 10: // Ogre
				Strength += 55;
				Stamina += 77;
				Agility -= 5;
				Dexterity -= 5;
				Wisdom -= 8;
				Intelligence -= 15;
				Charisma -= 38;
				BotSize = 9;
				break;
			case 11: // Halfling
				Strength -= 5;
				Agility += 20;
				Dexterity += 15;
				Wisdom += 5;
				Intelligence -= 8;
				Charisma -= 25;
				BotSize = 3.5;
				PoisonResist += 5;
				DiseaseResist += 5;
				break;
			case 12: // Gnome
				Strength -= 15;
				Stamina -= 5;
				Agility += 10;
				Dexterity += 10;
				Wisdom -= 8;
				Intelligence += 23;
				Charisma -= 15;
				BotSize = 3;
				break;
			case 128: // Iksar
				Strength -= 5;
				Stamina -= 5;
				Agility += 15;
				Dexterity += 10;
				Wisdom += 5;
				Charisma -= 20;
				MagicResist -= 5;
				FireResist -= 5;
				break;
			case 130: // Vah Shir
				Strength += 15;
				Agility += 15;
				Dexterity -= 5;
				Wisdom -= 5;
				Intelligence -= 10;
				Charisma -= 10;
				BotSize = 7;
				MagicResist -= 5;
				FireResist -= 5;
				break;
			case 330: // FireResistoglok
				Strength -= 5;
				Stamina += 5;
				Agility += 25;
				Dexterity += 25;
				Charisma -= 25;
				BotSize = 5;
				MagicResist -= 5;
				FireResist -= 5;
				break;
	}

	this->STR = Strength;
	this->STA = Stamina;
	this->DEX = Dexterity;
	this->AGI = Agility;
	this->WIS = Wisdom;
	this->INT = Intelligence;
	this->CHA = Charisma;
	this->ATK = Attack;
	this->MR = MagicResist;
	this->FR = FireResist;
	this->DR = DiseaseResist;
	this->PR = PoisonResist;
	this->CR = ColdResist;
	SetBotSpellID(BotSpellID);
	this->size = BotSize;
}

void Bot::GenerateAppearance() {
	// Randomize facial appearance
	int iFace = 0;
	if(this->GetRace() == 2) { // Barbarian w/Tatoo
		iFace = MakeRandomInt(0, 79);
	}
	else {
		iFace = MakeRandomInt(0, 7);
	}
	int iHair = 0;
	int iBeard = 0;
	int iBeardColor = 1;
	if(this->GetGender()) {
		iHair = MakeRandomInt(0, 2);
		if(this->GetRace() == 8) { // Dwarven Females can have a beard
			if(MakeRandomInt(1, 100) < 50) {
				iFace += 10;
			}
		}
	}
	else {
		iHair = MakeRandomInt(0, 3);
		iBeard = MakeRandomInt(0, 5);
		iBeardColor = MakeRandomInt(0, 19);
	}
	int iHairColor = MakeRandomInt(0, 19);
	int iEyeColor1 = MakeRandomInt(0, 9);
	int iEyeColor2 = 0;
	if(MakeRandomInt(1, 100) > 96) {
		iEyeColor2 = MakeRandomInt(0, 9);
	}
	else {
		iEyeColor2 = iEyeColor1;
	}

	this->luclinface = iFace;
	this->hairstyle = iHair;
	this->beard = iBeard;
	this->beardcolor = iBeardColor;
	this->haircolor = iHairColor;
	this->eyecolor1 = iEyeColor1;
	this->eyecolor2 = iEyeColor2;
}

void Bot::GenerateArmorClass() {
	// Base AC
	int bac = GetAC();
	switch(this->GetClass()) {
			case WARRIOR:
			case SHADOWKNIGHT:
			case PALADIN:
				bac = bac*1.5;
	}

	this->AC = bac;
}

void Bot::GenerateBaseHitPoints() {
	// Calc Base Hit Points
	/*int16 multiplier = 1;
	switch(this->GetClass()) {
			case WARRIOR:
				multiplier = 220;
				break;
			case DRUID:
			case CLERIC:
			case SHAMAN:
				multiplier = 150;
				break;
			case BERSERKER:
			case PALADIN:
			case SHADOWKNIGHT:
				multiplier = 210;
				break;
			case MONK:
			case BARD:
			case ROGUE:
			case BEASTLORD:
				multiplier = 180;
				break;
			case RANGER:
				multiplier = 200;
				break;
			case MAGICIAN:
			case WIZARD:
			case NECROMANCER:
			case ENCHANTER:
				multiplier = 120;
				break;
	}
	int16 lm = multiplier;*/
	int16 lm = GetClassLevelFactor();
	int16 Post255;

	if((this->GetSTA()-255)/2 > 0)
		Post255 = (this->GetSTA()-255)/2;
	else
		Post255 = 0;

	int new_base_hp = (5)+(GetLevel()*lm/10) + (((this->GetSTA()-Post255)*GetLevel()*lm/3000)) + ((Post255*1)*lm/6000);

	this->base_hp = new_base_hp;
	this->cur_hp = this->base_hp;
}

void Bot::GenerateAABonuses() {
	// General AA bonus
	uint8 botlevel = GetLevel();
	if(botlevel >= 51) {
		//level 51 = 1 AA level
		uint8 botAAlevels = botlevel - 50;
		STR += botAAlevels * 2;	// Innate Strength AAs
		STA += botAAlevels * 2;	// Innate Stamina AAs
		AGI += botAAlevels * 2;	// Innate Agility AAs
		DEX += botAAlevels * 2;	// Innate Dexterity AA
		INT += botAAlevels * 2;	// Innate Intelligence AAs
		WIS += botAAlevels * 2;	// Innate Wisdom AAs
		CHA += botAAlevels * 2;	// Innate Charisma AAs
		FR += botAAlevels * 2;	// Innate Fire Protection AAs
		CR += botAAlevels * 2;	// Innate Cold Protection AAs
		MR += botAAlevels * 2;	// Innate Magic Protection AAs
		PR += botAAlevels * 2;	// Innate Poison Protection AAs
		DR += botAAlevels * 2;	// Innate Disease AAs	
	}
}

bool Bot::IsValidRaceClassCombo() {
	bool Result = false;

	switch(GetRace()) {
		case 1: // Human
			switch(GetClass()) {
				case 1: // Warrior
				case 2: // Cleric
				case 3: // Paladin
				case 4: // Ranger
				case 5: // Shadowknight
				case 6: // Druid
				case 7: // Monk
				case 8: // Bard
				case 9: // Rogue
				case 11: // Necromancer
				case 12: // Wizard
				case 13: // Magician
				case 14: // Enchanter
					Result = true;
					break;
			}
			break;
		case 2: // Barbarian
			switch(GetClass()) {
				case 1: // Warrior
				case 9: // Rogue
				case 10: // Shaman
				case 15: // Beastlord
				case 16: // Berserker
					Result = true;
					break;
			}
			break;
		case 3: // Erudite
				switch(GetClass()) {
			case 2: // Cleric
			case 3: // Paladin
			case 5: // Shadowknight
			case 11: // Necromancer
			case 12: // Wizard
			case 13: // Magician
			case 14: // Enchanter
				Result = true;
				break;
				}
				break;
			case 4: // Wood Elf
				switch(GetClass()) {
			case 1: // Warrior
			case 4: // Ranger
			case 6: // Druid
			case 8: // Bard
			case 9: // Rogue
				Result = true;
				break;
				}
				break;
			case 5: // High Elf
				switch(GetClass()) {
			case 2: // Cleric
			case 3: // Paladin
			case 12: // Wizard
			case 13: // Magician
			case 14: // Enchanter
				Result = true;
				break;
				}
				break;
			case 6: // Dark Elf
				switch(GetClass()) {
			case 1: // Warrior
			case 2: // Cleric
			case 5: // Shadowknight
			case 9: // Rogue
			case 11: // Necromancer
			case 12: // Wizard
			case 13: // Magician
			case 14: // Enchanter
				Result = true;
				break;
				}
				break;
			case 7: // Half Elf
				switch(GetClass()) {
			case 1: // Warrior
			case 3: // Paladin
			case 4: // Ranger
			case 6: // Druid
			case 8: // Bard
			case 9: // Rogue
				Result = true;
				break;
				}
				break;
			case 8: // Dwarf
				switch(GetClass()) {
			case 1: // Warrior
			case 2: // Cleric
			case 3: // Paladin
			case 9: // Rogue
			case 16: // Berserker
				Result = true;
				break;
				}
				break;
			case 9: // Troll
				switch(GetClass()) {
			case 1: // Warrior
			case 5: // Shadowknight
			case 10: // Shaman
			case 15: // Beastlord
			case 16: // Berserker
				Result = true;
				break;
				}
				break;
			case 10: // Ogre
				switch(GetClass()) {
			case 1: // Warrior
			case 5: // Shadowknight
			case 10: // Shaman
			case 15: // Beastlord
			case 16: // Berserker
				Result = true;
				break;
				}
				break;
			case 11: // Halfling
				switch(GetClass()) {
			case 1: // Warrior
			case 2: // Cleric
			case 3: // Paladin
			case 4: // Ranger
			case 6: // Druid
			case 9: // Rogue
				Result = true;
				break;
				}
				break;
			case 12: // Gnome
				switch(GetClass()) {
			case 1: // Warrior
			case 2: // Cleric
			case 3: // Paladin
			case 5: // Shadowknight
			case 9: // Rogue
			case 11: // Necromancer
			case 12: // Wizard
			case 13: // Magician
			case 14: // Enchanter
				Result = true;
				break;
				}
				break;
			case 128: // Iksar
				switch(GetClass()) {
			case 1: // Warrior
			case 5: // Shadowknight
			case 7: // Monk
			case 10: // Shaman
			case 11: // Necromancer
			case 15: // Beastlord
				Result = true;
				break;
				}
				break;
			case 130: // Vah Shir
				switch(GetClass()) {
			case 1: // Warrior
			case 8: // Bard
			case 9: // Rogue
			case 10: // Shaman
			case 15: // Beastlord
			case 16: // Berserker
				Result = true;
				break;
				}
				break;
			case 330: // Froglok
				switch(GetClass()) {
			case 1: // Warrior
			case 2: // Cleric
			case 3: // Paladin
			case 5: // Shadowknight
			case 9: // Rogue
			case 10: // Shaman
			case 11: // Necromancer
			case 12: // Wizard
				Result = true;
				break;
				}
				break;
	}

	return Result;
}

bool Bot::IsValidName() {
	bool Result = false;
	std::string TempBotName = std::string(this->GetCleanName());

	for(int iCounter = 0; iCounter < TempBotName.length(); iCounter++) {
		if(isalpha(TempBotName[iCounter]) || TempBotName[iCounter] == '_') {
			Result = true;
		}
	}

	return Result;
}

bool Bot::IsBotNameAvailable(std::string* errorMessage) {
	bool Result = false;

	if(this->GetCleanName()) {
		char* Query = 0;
		char TempErrorMessageBuffer[MYSQL_ERRMSG_SIZE];
		MYSQL_RES* DatasetResult;
		MYSQL_ROW DataRow;

		if(!database.RunQuery(Query, MakeAnyLenString(&Query, "SELECT COUNT(BotID) FROM bots WHERE Name LIKE '%s'", this->GetCleanName()), TempErrorMessageBuffer, &DatasetResult)) {
			*errorMessage = std::string(TempErrorMessageBuffer);
		}
		else {
			uint32 ExistingNameCount = 0;

			while(DataRow = mysql_fetch_row(DatasetResult)) {
				ExistingNameCount = atoi(DataRow[0]);
				break;
			}

			if(ExistingNameCount == 0)
				Result = true;

			mysql_free_result(DatasetResult);
		}

		safe_delete(Query);
	}

	return Result;
}

bool Bot::Save() {
	bool Result = false;
	std::string errorMessage;

	char* Query = 0;
	char TempErrorMessageBuffer[MYSQL_ERRMSG_SIZE];
	int32 affectedRows = 0;

	if(this->GetBotID() == 0) {
		// New bot record
		uint32 TempNewBotID = 0;
		if(!database.RunQuery(Query, MakeAnyLenString(&Query, "INSERT INTO bots (BotOwnerCharacterID, BotSpellsID, Name, LastName, BotLevel, Race, Class, Gender, Size, Face, LuclinHairStyle, LuclinHairColor, LuclinEyeColor, LuclinEyeColor2, LuclinBeardColor, LuclinBeard, DrakkinHeritage, DrakkinTattoo, DrakkinDetails, MR, CR, DR, FR, PR, AC, STR, STA, DEX, AGI, _INT, WIS, CHA, ATK, LastSpawnDate, TotalPlayTime) VALUES('%u', '%u', '%s', '%s', '%u', '%i', '%i', '%i', '%f', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', '%i', NOW(), 0)", this->_botOwnerCharacterID, this->GetBotSpellID(), this->GetCleanName(), this->lastname, this->GetLevel(), GetRace(), GetClass(), GetGender(), GetSize(), this->GetLuclinFace(), this->GetHairStyle(), GetHairColor(), this->GetEyeColor1(), GetEyeColor2(), this->GetBeardColor(), this->GetBeard(), this->GetDrakkinHeritage(), this->GetDrakkinTattoo(), GetDrakkinDetails(), GetMR(), GetCR(), GetDR(), GetFR(), GetPR(), GetAC(), GetSTR(), GetSTA(), GetDEX(), GetAGI(), GetINT(), GetWIS(), GetCHA(), GetATK()), TempErrorMessageBuffer, 0, &affectedRows, &TempNewBotID)) {
			errorMessage = std::string(TempErrorMessageBuffer);
		}
		else {
			SetBotID(TempNewBotID);
			Result = true;
		}
	}
	else {
		// Update existing bot record
		if(!database.RunQuery(Query, MakeAnyLenString(&Query, "UPDATE bots SET BotOwnerCharacterID = '%u', BotSpellsID = '%u', Name = '%s', LastName = '%s', BotLevel = '%u', Race = '%i', Class = '%i', Gender = '%i', Size = '%f', Face = '%i', LuclinHairStyle = '%i', LuclinHairColor = '%i', LuclinEyeColor = '%i', LuclinEyeColor2 = '%i', LuclinBeardColor = '%i', LuclinBeard = '%i', DrakkinHeritage = '%i', DrakkinTattoo = '%i', DrakkinDetails = '%i', MR = '%i', CR = '%i', DR = '%i', FR = '%i', PR = '%i', AC = '%i', STR = '%i', STA = '%i', DEX = '%i', AGI = '%i', _INT = '%i', WIS = '%i', CHA = '%i', ATK = '%i', LastSpawnDate = NOW(), TotalPlayTime = '%u' WHERE BotID = '%u'", _botOwnerCharacterID, this->GetBotSpellID(), this->GetCleanName(), this->lastname, this->GetLevel(), _baseRace, this->GetClass(), _baseGender, GetSize(), this->GetLuclinFace(), this->GetHairStyle(), GetHairColor(), this->GetEyeColor1(), GetEyeColor2(), this->GetBeardColor(), this->GetBeard(), this->GetDrakkinHeritage(), GetDrakkinTattoo(), GetDrakkinDetails(), _baseMR, _baseCR, _baseDR, _baseFR, _basePR, _baseAC, _baseSTR, _baseSTA, _baseDEX, _baseAGI, _baseINT, _baseWIS, _baseCHA, _baseATK, GetTotalPlayTime(), GetBotID()), TempErrorMessageBuffer, 0, &affectedRows)) {
			errorMessage = std::string(TempErrorMessageBuffer);
		}
		else {
			Result = true;
			time(&_startTotalPlayTime);
		}
	}

	safe_delete(Query);

	if(!errorMessage.empty() || (Result && affectedRows != 1)) {
		if(GetBotOwner() && !errorMessage.empty())
			GetBotOwner()->Message(13, errorMessage.c_str());
		else if(GetBotOwner())
			GetBotOwner()->Message(13, std::string("Unable to save bot to the database.").c_str());

		Result = false;
	}

	return Result;
}

// Returns the current total play time for the bot
uint32 Bot::GetTotalPlayTime() {
	uint32 Result = 0;

	double TempTotalPlayTime = 0;

	time_t currentTime = time(&currentTime);

	TempTotalPlayTime = difftime(currentTime, _startTotalPlayTime);

	TempTotalPlayTime += _lastTotalPlayTime;

	Result = (uint32)TempTotalPlayTime;

	return Result;
}

bool Bot::Process() {
	_ZP(Bot_Process);

	adverrorinfo = 1;
	if (IsStunned() && stunned_timer.Check()) {
		this->stunned = false;
		this->stunned_timer.Disable();
	}

	if (GetDepop()) {
		//Mob* owner = entity_list.GetMob(this->ownerid);
		//if (owner != 0) {
		//	//if(GetBodyType() != BT_SwarmPet)
		//	//    owner->SetPetID(0);
		//	this->ownerid = 0;
		//	this->petid = 0;
		//}
		return false;
	}

	adverrorinfo = 2;

	SpellProcess();

	if (tic_timer.Check()) {
		//60 seconds, or whatever the rule is set to has passed, send this position to everyone to avoid ghosting
		if(/*qglobal_position_update_timer.Check() && */!moving)
			SendPosition();

		BuffProcess();

		if(curfp)
			ProcessFlee();

		int32 bonus = 0;

		if(GetAppearance() == eaSitting)
			bonus+=3;

		//sint32 OOCRegen = 0;
		//if(oocregen > 0){ //should pull from Mob class
		//	OOCRegen += GetMaxHP() * oocregen / 100;
		//}

		//Lieka Edit:  Fixing NPC regen.  NPCs should regen to full during a set duration, not based on their HPs.  Increase NPC's HPs by % of total HPs / tick.
		//if((GetHP() < GetMaxHP()) && !IsPet()) {
		//	if(!IsEngaged()) {//NPC out of combat
		//		if(hp_regen > OOCRegen)
		//			SetHP(GetHP() + hp_regen);
		//		else
		//			SetHP(GetHP() + OOCRegen);
		//	} else
		//		SetHP(GetHP()+hp_regen);
		//} else if(GetHP() < GetMaxHP() && GetOwnerID() !=0) {
		//	if(!IsEngaged()) //pet
		//		SetHP(GetHP()+hp_regen+bonus+(GetLevel()/5));
		//	else
		//		SetHP(GetHP()+hp_regen+bonus);
		//} else 
		//	SetHP(GetHP()+hp_regen);

		if(GetHP() < GetMaxHP())
			SetHP(GetHP() + hp_regen + bonus);

		if(GetMana() < GetMaxMana())
			SetMana(GetMana()+mana_regen+bonus);

		/*Mob *o = GetBotOwner();
		if(o && o->IsClient()) {
		if(!GetDepop()) {
		Client *c = o->CastToClient();
		AdventureDetails *ad = c->GetCurrentAdventure();
		if(ad && ad->ai) {
		if(ad->ai->type == Adventure_Rescue) {
		if(GetNPCTypeID() == ad->ai->type_data) {
		float xDiff = ad->ai->dest_x - GetX();
		float yDiff = ad->ai->dest_y - GetY();
		float zDiff = ad->ai->dest_z - GetZ();
		float dist = ((xDiff * xDiff) + (yDiff * yDiff) + (zDiff * zDiff));
		if(dist < RuleR(Adventure, DistanceForRescueComplete)) {
		zone->UpdateAdventureCount(ad);
		Say("You don't know what this means to me. Thank you so much for finding and saving me from"
		" this wretched place. I'll find my way from here.");
		Depop();
		}
		}
		}
		}
		}
		}*/
	}

	if (sendhpupdate_timer.Check() && IsTargeted()) {
		if(!IsFullHP || cur_hp < max_hp){
			SendHPUpdate();
		}
	}

	if (IsStunned()||IsMezzed())
		return true;

	if (enraged_timer.Check()){
		ProcessEnrage();
	}

	//Handle assists...
	/*if(assist_timer.Check() && !Charmed() && GetTarget() != NULL) {
		entity_list.AIYellForHelp(this, GetTarget());
	}*/

	// Bot AI
	AI_Process();

	if(HasPet())
		PetAIProcess();

	return true;
}

// franck: EQoffline
// Depending of the class:
// -- Cleric, Druid, Shaman, Paladin will first check if there is someone to heal.
// -- Wizard, Mage, Necro will start the nuke.  
// -- TODO : Enchanter will nuke untill it it sees if there is an add. 
bool Bot::AI_EngagedCastCheck() {
	if (GetTarget() && AIautocastspell_timer->Check(false)) {
		_ZP(Bot_AI_Process_engaged_cast);

		AIautocastspell_timer->Disable();	//prevent the timer from going off AGAIN while we are casting.

		int8 botClass = GetClass();
		uint8 botLevel = GetLevel();

		mlog(AI__SPELLS, "Engaged autocast check triggered. Trying to cast healing spells then maybe offensive spells.");

		BotRaids *br = entity_list.GetBotRaidByMob(this);

		if(botClass == CLERIC)
		{
			if(br && GetBotRaidID()) {
				// try to heal the raid main tank
				if(br->GetBotMainTank() && (br->GetBotMainTank()->GetHPRatio() < 80)) {
					if(!Bot_AICastSpell(br->GetBotMainTank(), 80, SpellType_Heal)) {
						if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 80, MobAISpellRange, SpellType_Heal)) {
							if(!Bot_AICastSpell(this, 100, SpellType_Heal)) {
								AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
								return true;
							}
						}
					}
				}
				// try to heal the raid secondar tank
				else if(br->GetBotSecondTank() && (br->GetBotSecondTank()->GetHPRatio() < 80)) {
					if(!Bot_AICastSpell(br->GetBotSecondTank(), 80, SpellType_Heal)) {
						if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 80, MobAISpellRange, SpellType_Heal)) {
							if(!Bot_AICastSpell(this, 100, SpellType_Heal)) {
								AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
								return true;
							}
						}
					}
				}
			}
			if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 100, MobAISpellRange, SpellType_Heal)) {
				if(!Bot_AICastSpell(this, 100, SpellType_Escape)) {
					if(!Bot_AICastSpell(this, 100, SpellType_Heal)) {
						if(!Bot_AICastSpell(GetTarget(), 5, SpellType_DOT | SpellType_Nuke | SpellType_Lifetap | SpellType_Dispel)) {
							AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
							return true;
						}
					}
				}
			}
		}
		else if((botClass == DRUID) || (botClass == SHAMAN) || (botClass == PALADIN) || (botClass == SHADOWKNIGHT) || (botClass == BEASTLORD) || (botClass == RANGER))
		{
			if (!Bot_AICastSpell(this, 100, SpellType_Escape | SpellType_Pet)) {
				if (!Bot_AICastSpell(this, 100, SpellType_Heal)) {
					if (!entity_list.Bot_AICheckCloseBeneficialSpells(this, 80, MobAISpellRange, SpellType_Heal)) {
						if(!Bot_AICastSpell(GetTarget(), 80, SpellType_Root | SpellType_Snare | SpellType_DOT | SpellType_Nuke | SpellType_Lifetap | SpellType_Dispel)) {
							AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
							return true;
						}
					}
				}
			}
		}
		else if((botClass == WIZARD) || (botClass == MAGICIAN) || (botClass == NECROMANCER)) {
			if (!Bot_AICastSpell(this, 100, SpellType_Escape | SpellType_Pet)) {
				if(!Bot_AICastSpell(GetTarget(), 80, SpellType_Root | SpellType_Snare | SpellType_DOT | SpellType_Nuke | SpellType_Lifetap | SpellType_Dispel)) {
					//no spell to cast, try again soon.
					AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
					return true;
				}
			}
		}		
		else if(botClass == ENCHANTER) {
			// TODO: Make enchanter to be able to mez
			if (!Bot_AICastSpell(this, 100, SpellType_Escape | SpellType_Pet)) {
				if(!Bot_AICastSpell(GetTarget(), 80, SpellType_DOT | SpellType_Nuke | SpellType_Dispel)) {
					AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
					return true;
				}
			}
		}
		else if(botClass == BARD) {
			if(!Bot_AICastSpell(this, 100, SpellType_Buff)) {
				if(!Bot_AICastSpell(GetTarget(), 100, SpellType_Nuke | SpellType_Dispel | SpellType_Escape)) {// Bards will use their debuff songs
					AIautocastspell_timer->Start(RandomTimer(10, 50), false);
					return true;
				}					
			}
		}
		else {
			// And for all the others classes..
			if(!Bot_AICastSpell(this, 100, SpellType_Heal | SpellType_Escape)) {                                 // heal itself
				if (!entity_list.Bot_AICheckCloseBeneficialSpells(this, 80, MobAISpellRange, SpellType_Heal)) {	// heal others
					if(!Bot_AICastSpell(GetTarget(), 80, SpellTypes_Detrimental)) {		// nuke..
						AIautocastspell_timer->Start(RandomTimer(500, 2000), false);							// timer 5 t 20 seconds
						return true;
					}
				}
			}
		}

		if(botClass != BARD) {
			AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
		}

		return true;
	}

	return false;
}

void Bot::BotMeditate(bool isSitting) {
	if(isSitting) {
		// If the bot is a caster has less than 99% mana while its not engaged, he needs to sit to meditate
		if(GetManaRatio() < 99.0f) {
			if(mana_timer.Check(true)) {
				SetAppearance(eaSitting, false);
				if(!((int)GetManaRatio() % 24)) {
					Say("Medding for Mana. I have %3.1f%% of %d mana. It is: %d", GetManaRatio(), GetMaxMana(), GetMana());
				}
				int32 level = GetLevel();
				int32 regen = (((GetSkill(MEDITATE)/10)+(level-(level/4)))/4)+4;
				spellbonuses.ManaRegen = 0;
				for(int j=0; j<BUFF_COUNT; j++) {
					if(buffs[j].spellid != 65535) {
						const SPDat_Spell_Struct &spell = spells[buffs[j].spellid];
						for(int i=0; i<EFFECT_COUNT; i++) {
							if(IsBlankSpellEffect(buffs[j].spellid, i))
								continue;
							int effect = spell.effectid[i];
							switch(effect) {
								case SE_CurrentMana:
									spellbonuses.ManaRegen += CalcSpellEffectValue(buffs[j].spellid, i, buffs[j].casterlevel);
									break;
							}
						}
					}
				}
				regen += (spellbonuses.ManaRegen + itembonuses.ManaRegen);
				if(level >= 55) {
					regen += 1;//GetAA(aaMentalClarity);
				}
				if(level >= 56) {
					regen += 1;//GetAA(aaMentalClarity);
				}
				if(level >= 57) {
					regen += 1;//GetAA(aaMentalClarity);
				}
				if(level >= 71) {
					regen += 1;//GetAA(aaBodyAndMindRejuvenation);
				}
				if(level >= 72) {
					regen += 1;//GetAA(aaBodyAndMindRejuvenation);
				}
				if(level >= 73) {
					regen += 1;//GetAA(aaBodyAndMindRejuvenation);
				}
				if(level >= 74) {
					regen += 1;//GetAA(aaBodyAndMindRejuvenation);
				}
				if(level >= 75) {
					regen += 1;//GetAA(aaBodyAndMindRejuvenation);
				}
				regen = (regen * RuleI(Character, ManaRegenMultiplier)) / 100;

				float mana_regen_rate = RuleR(Bots, BotManaRegen);
				if(mana_regen_rate < 1.0f)
					mana_regen_rate = 1.0f;

				regen = regen / mana_regen_rate;

				SetMana(GetMana() + regen);
			}
		}
		else {
			SetAppearance(eaStanding, false);
		}
	}
	else {
		// Let's check our mana in fights..
		if(mana_timer.Check(true)) {
			if((!((int)GetManaRatio() % 12)) && ((int)GetManaRatio() < 10)) {
				Say("Medding for Mana. I have %3.1f%% of %d mana. It is: %d", GetManaRatio(), GetMaxMana(), GetMana());
			}
			int32 level = GetLevel();
			spellbonuses.ManaRegen = 0;
			for(int j=0; j<BUFF_COUNT; j++) {
				if(buffs[j].spellid != 65535) {
					const SPDat_Spell_Struct &spell = spells[buffs[j].spellid];
					for(int i=0; i<EFFECT_COUNT; i++) {
						if(IsBlankSpellEffect(buffs[j].spellid, i))
							continue;
						int effect = spell.effectid[i];
						switch(effect) {
							case SE_CurrentMana:
								spellbonuses.ManaRegen += CalcSpellEffectValue(buffs[j].spellid, i, buffs[j].casterlevel);
								break;
						}
					}
				}
			}
			int32 regen = 2 + spellbonuses.ManaRegen + itembonuses.ManaRegen + (level/5);
			if(level >= 55) {
				regen += 1;//GetAA(aaMentalClarity);
			}
			if(level >= 56) {
				regen += 1;//GetAA(aaMentalClarity);
			}
			if(level >= 57) {
				regen += 1;//GetAA(aaMentalClarity);
			}
			if(level >= 71) {
				regen += 1;//GetAA(aaBodyAndMindRejuvenation);
			}
			if(level >= 72) {
				regen += 1;//GetAA(aaBodyAndMindRejuvenation);
			}
			if(level >= 73) {
				regen += 1;//GetAA(aaBodyAndMindRejuvenation);
			}
			if(level >= 74) {
				regen += 1;//GetAA(aaBodyAndMindRejuvenation);
			}
			if(level >= 75) {
				regen += 1;//GetAA(aaBodyAndMindRejuvenation);
			}
			regen = (regen * RuleI(Character, ManaRegenMultiplier)) / 100;

			float mana_regen_rate = RuleR(Bots, BotManaRegen);
			if(mana_regen_rate < 1.0f)
				mana_regen_rate = 1.0f;

			regen = regen / mana_regen_rate;

			SetMana(GetMana() + regen);
		}
	}
}

bool Bot::BotRangedAttack(Mob* other) {
	//make sure the attack and ranged timers are up
	//if the ranged timer is disabled, then they have no ranged weapon and shouldent be attacking anyhow
	if((attack_timer.Enabled() && !attack_timer.Check(false)) || (ranged_timer.Enabled() && !ranged_timer.Check())) {
		mlog(COMBAT__RANGED, "Bot Archery attack canceled. Timer not up. Attack %d, ranged %d", attack_timer.GetRemainingTime(), ranged_timer.GetRemainingTime());
		Message(0, "Error: Timer not up. Attack %d, ranged %d", attack_timer.GetRemainingTime(), ranged_timer.GetRemainingTime());
		return false;
	}

	const Item_Struct* RangeWeapon = database.GetItem(equipment[MATERIAL_SECONDARY]);
	const Item_Struct* Ammo = database.GetItem(equipment[MATERIAL_PRIMARY]);
	ItemInst* RangeItem = new ItemInst(RangeWeapon);
	ItemInst* AmmoItem = new ItemInst(Ammo);
	mlog(COMBAT__RANGED, "Shooting %s with bow %s (%d) and arrow %s (%d)", other->GetCleanName(), RangeWeapon->Name, RangeWeapon->ID, Ammo->Name, Ammo->ID);
	
	if(!IsAttackAllowed(other) || 
		IsCasting() || 
		DivineAura() ||
		IsStunned() ||
		IsMezzed() ||
		(GetAppearance() == eaDead))
	{
		safe_delete(RangeItem);
		safe_delete(AmmoItem);
		return false;
	}
	
	SendItemAnimation(other, Ammo, ARCHERY);

	// Hit?
	if(!this->CalcBotHitChance(other, ARCHERY, SLOT_PRIMARY)) {
		mlog(COMBAT__RANGED, "Ranged attack missed %s.", other->GetCleanName());
		other->Damage(this, 0, SPELL_UNKNOWN, ARCHERY);
	}
	else {
		mlog(COMBAT__RANGED, "Ranged attack hit %s.", other->GetCleanName());
		
		if(!TryHeadShot(other, ARCHERY)) {
			sint16 WDmg = GetWeaponDamage(other, RangeWeapon);
			sint16 ADmg = GetWeaponDamage(other, Ammo);
			if((WDmg > 0) || (ADmg > 0)){
				if(WDmg < 0)
					WDmg = 0;
				if(ADmg < 0)
					ADmg = 0;

				uint32 MaxDmg = (2*(WDmg+ADmg)*GetDamageTable(ARCHERY)) / 100;

				if(GetLevel() >= 61) { // Archery Mastery 3 AA
					MaxDmg = MaxDmg * 150/100;
				}
				else if(GetLevel() == 60) { // Archery Mastery 2 AA
					MaxDmg = MaxDmg * 125/100;
				}
				else if(GetLevel() == 59) { // Archery Mastery 1 AA
					MaxDmg = MaxDmg * 115/100;
				}
				mlog(COMBAT__RANGED, "Bow DMG %d, Arrow DMG %d, Max Damage %d.", WDmg, ADmg, MaxDmg);
				
				if(GetClass()==RANGER && other->IsNPC() && !other->IsMoving() && !other->IsRooted() && GetLevel() > 50){
					MaxDmg *= 2;
					mlog(COMBAT__RANGED, "Ranger. Target is stationary, doubling max damage to %d", MaxDmg);
				}

				sint32 TotalDmg = 0;

				if (MaxDmg == 0)
					MaxDmg = 1;

				if(RuleB(Combat, UseIntervalAC))
					TotalDmg = MaxDmg;
				else
					TotalDmg = MakeRandomInt(1, MaxDmg);

				int minDmg = 1;
				if(GetLevel() > 25){
					//twice, for ammo and weapon
					TotalDmg += (2*((GetLevel()-25)/3));
					minDmg += (2*((GetLevel()-25)/3));
				}

				other->MeleeMitigation(this, TotalDmg, minDmg);
				ApplyMeleeDamageBonus(ARCHERY, TotalDmg);
				TryCriticalHit(other, ARCHERY, TotalDmg);
				other->Damage(this, TotalDmg, SPELL_UNKNOWN, ARCHERY);
			}
			else {
				other->Damage(this, -5, SPELL_UNKNOWN, ARCHERY);
			}
		}
	}

	//try proc on hits and misses
	if(other && (other->GetHP() > -10)) {
		TryWeaponProc(RangeWeapon, other);
	}
	
	safe_delete(RangeItem);
	safe_delete(AmmoItem);

	return true;
}

bool Bot::CheckBotDoubleAttack(bool tripleAttack) {
	// If you don't have the double attack skill, return
	if(!GetSkill(DOUBLE_ATTACK))
		return false;
	
	// You start with no chance of double attacking
	int chance = 0;
	
	// Used for maxSkill and triple attack calcs
	int8 classtype = GetClass();
	
	// The current skill level
	uint16 skill = GetSkill(DOUBLE_ATTACK);

	// Discipline bonuses give you 100% chance to double attack
	sint16 buffs = spellbonuses.DoubleAttackChance + itembonuses.DoubleAttackChance;
	
	Mob* BotOwner = this->GetBotOwner();

	// The maximum value for the Class based on the server rule of MaxLevel
	if(!BotOwner || BotOwner->qglobal || (GetAppearance() == eaDead))
		return false;
	int16 maxSkill = BotOwner->CastToClient()->MaxSkill(DOUBLE_ATTACK, classtype, RuleI(Character, MaxLevel));

	int32 aaBonus = 0;
	uint8 aalevel = GetLevel();
	if((classtype == BEASTLORD)||(classtype == BARD)) { // AA's Beastial Frenzy, Harmonious Attacks
		if(aalevel >= 65) {
			aaBonus += 5;
		}
		else if(aalevel >= 64) {
			aaBonus += 4;
		}
		else if(aalevel >= 63) {
			aaBonus += 3;
		}
		else if(aalevel >= 62) {
			aaBonus += 2;
		}
		else if(aalevel >= 61) {
			aaBonus += 1;
		}
	}
	if((classtype == PALADIN)||(classtype == SHADOWKNIGHT)) { // AA Knights Advantage
		if(aalevel >= 65) {
			aaBonus += 30;
		}
		else if(aalevel >= 63) {
			aaBonus += 20;
		}
		else if(aalevel >= 61) {
			aaBonus += 10;
		}
	}
	if((classtype == ROGUE)||(classtype == WARRIOR)||(classtype == RANGER)||(classtype == MONK)) { // AA Ferocity and Relentless Assault
		if(aalevel >= 70) {
			aaBonus += 60;
		}
		else if(aalevel >= 65) {
			aaBonus += 30;
		}
		else if(aalevel >= 63) {
			aaBonus += 20;
		}
		else if(aalevel >= 61) {
			aaBonus += 10;
		}
	}

	// Half of Double Attack Skill used to check chance for Triple Attack
	if(tripleAttack) {
		// Only some Double Attack classes get Triple Attack
		if((classtype == MONK) || (classtype == WARRIOR) || (classtype == RANGER) || (classtype == BERSERKER)) {
			// We only get half the skill, but should get all the bonuses
			chance = (skill/2) + buffs + aaBonus;
		}
		else {
			return false;
		}
	}
	else {
		// This is the actual Double Attack chance
		chance = skill + buffs + aaBonus;
	}
	
	// If your chance is greater than the RNG you are successful! Always have a 5% chance to fail at max skills+bonuses.
	if(chance > MakeRandomInt(0, (maxSkill + itembonuses.DoubleAttackChance + aaBonus)*1.05)) {
		return true;
	}

	return false;
}

// Franck-add: EQoffline
// This function was reworked a bit for bots.
bool Bot::Bot_AICastSpell(Mob* tar, int8 iChance, int16 iSpellTypes) {
	_ZP(NPC_Bot_AICastSpell);

	if (!tar) {
		return false;
	}

	if(!AI_HasSpells())
		return false;

	if(tar->GetAppearance() == eaDead) {
		if(tar->IsClient() && tar->CastToClient()->GetFeigned()) {
			// do nothing
		}
		else {
			return false;
		}
	}

	if (iChance < 100) {
		if (MakeRandomInt(0, 100) > iChance){
			return false;
		}
	}

	int8 botClass = GetClass();
	uint8 botLevel = GetLevel();

	float dist2;

	if (iSpellTypes & SpellType_Escape) {
		dist2 = 0; 
	} else 
		dist2 = DistNoRoot(*tar);

	bool checked_los = false;	//we do not check LOS until we are absolutely sure we need to, and we only do it once.

	float manaR = GetManaRatio();
	for (int i=AIspells.size()-1; i >= 0; i--) {
		if (AIspells[i].spellid <= 0 || AIspells[i].spellid >= SPDAT_RECORDS) {
			// this is both to quit early to save cpu and to avoid casting bad spells
			// Bad info from database can trigger this incorrectly, but that should be fixed in DB, not here
			continue;
		}
		if (iSpellTypes & AIspells[i].type) {
			// manacost has special values, -1 is no mana cost, -2 is instant cast (no mana)
			sint32 mana_cost = AIspells[i].manacost;
			if (mana_cost == -1)
				mana_cost = spells[AIspells[i].spellid].mana;
			else if (mana_cost == -2)
				mana_cost = 0;
			sint32 extraMana = 0;
			sint32 hasMana = GetMana();
			if(RuleB(Bots, BotFinishBuffing)) {
				if(mana_cost > hasMana) {
					// Let's have the bots complete the buff time process
					if(iSpellTypes & SpellType_Buff) {
						extraMana = mana_cost - hasMana;
						SetMana(mana_cost);
					}
				}
			}
			if (((((spells[AIspells[i].spellid].targettype==ST_GroupTeleport && AIspells[i].type==2)
				|| spells[AIspells[i].spellid].targettype==ST_AECaster
				|| spells[AIspells[i].spellid].targettype==ST_Group
				|| spells[AIspells[i].spellid].targettype==ST_AEBard)
				&& dist2 <= spells[AIspells[i].spellid].aoerange*spells[AIspells[i].spellid].aoerange)
				|| dist2 <= spells[AIspells[i].spellid].range*spells[AIspells[i].spellid].range) && (mana_cost <= GetMana() || GetMana() == GetMaxMana())) {

					switch (AIspells[i].type) {
					case SpellType_Heal: {
						if (
							( (spells[AIspells[i].spellid].targettype==ST_GroupTeleport || spells[AIspells[i].spellid].targettype == ST_Target || tar == this)
							&& tar->DontHealMeBefore() < Timer::GetCurrentTime()
							&& tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0))
						{
							if(botClass == BARD) {
								if(IsEffectInSpell(AIspells[i].spellid, SE_MovementSpeed) && !zone->CanCastOutdoor()) {
									break;
								}
							}
							int8 hpr = (int8)tar->GetHPRatio();
							if(hpr<= 80 || ((tar->IsClient()||tar->IsPet()) && (hpr <= 98)) || (botClass == BARD))
							{
								if(tar->GetClass() == NECROMANCER) {
									// Necro bots use too much cleric mana with thier
									// mana for life spells... give them a chance
									// to lifetap something
									if(hpr > 60) {
										break;
									}
								}

								int32 TempDontHealMeBeforeTime = tar->DontHealMeBefore();

								AIDoSpellCast(i, tar, mana_cost, &TempDontHealMeBeforeTime);

								if(TempDontHealMeBeforeTime != tar->DontHealMeBefore())
									tar->SetDontHealMeBefore(TempDontHealMeBeforeTime);

								// If the healer is casting a HoT don't immediately cast the regular heal afterwards
								// The first HoT is at level 19 and is priority 1
								// The regular heal is priority 2
								// Let the HoT heal for at least 3 tics before checking for the regular heal
								// For non-HoT heals, do a 4 second delay
								if((botClass == CLERIC || botClass == PALADIN) && (botLevel >= 19) && (AIspells[i].priority == 1)) {
									if(tar->GetOwnerID()) {
										tar->SetDontHealMeBefore(Timer::GetCurrentTime() + 18000);
									}
									else {
										tar->SetDontHealMeBefore(Timer::GetCurrentTime() + 12000);
									}
								}
								else if((botClass == CLERIC || botClass == PALADIN) && (botLevel >= 19) && (AIspells[i].priority == 2)) {
									if(AIspells[i].spellid == 13) { 
										// Complete Heal 4 second rotation
										tar->SetDontHealMeBefore(Timer::GetCurrentTime() + 4000);
									}
									else {
										tar->SetDontHealMeBefore(Timer::GetCurrentTime() + 1000);
									}
								}
								return true;
							}
						}
						break;
										 }
					case SpellType_Root: {
						if (
							!tar->IsRooted() 
							&& tar->DontRootMeBefore() < Timer::GetCurrentTime()
							&& tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0
							) {
								if(!checked_los) {
									if(!CheckLosFN(tar))
										return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
									checked_los = true;
								}
								int32 TempDontRootMeBefore = tar->DontRootMeBefore();
								AIDoSpellCast(i, tar, mana_cost, &TempDontRootMeBefore);
								if(TempDontRootMeBefore != tar->DontRootMeBefore())
									tar->SetDontRootMeBefore(TempDontRootMeBefore);
								return true;
						}
						break;
										 }
					case SpellType_Buff: {
						if (
							(spells[AIspells[i].spellid].targettype == ST_Target || tar == this)
							&& tar->DontBuffMeBefore() < Timer::GetCurrentTime()
							&& !tar->IsImmuneToSpell(AIspells[i].spellid, this)
							&& (tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0)
							&&  !(tar->IsPet() && tar->CastToBot()->GetBotOwner()->IsClient() && this != tar)	//no buffing PC's pets, but they can buff themself

							) {
								// Put the zone levitate and movement check here since bots are able to bypass the client casting check
								if(	(IsEffectInSpell(AIspells[i].spellid, SE_Levitate) && !zone->CanLevitate()) ||
									(IsEffectInSpell(AIspells[i].spellid, SE_MovementSpeed) && !zone->CanCastOutdoor())) {
										break;
								}
								// when a pet class buffs its pet, it only needs to do it once
								if(spells[AIspells[i].spellid].targettype == ST_Pet) {
									Mob* newtar = GetPet();
									if(newtar) {
										if(!(newtar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0)) {
											break;
										}
									}
									else {
										break;
									}
								}
								int32 TempDontBuffMeBefore = tar->DontBuffMeBefore();
								AIDoSpellCast(i, tar, mana_cost, &TempDontBuffMeBefore);
								if(TempDontBuffMeBefore != tar->DontBuffMeBefore())
									tar->SetDontBuffMeBefore(TempDontBuffMeBefore);

								if(extraMana) {
									// If the bot is just looping through spells and not casting
									// then don't let them keep the extra mana we gave them during
									// buff time
									SetMana(GetMana() - extraMana);
								}
								return true;
						}
						break;
										 }
					case SpellType_Escape: {
						int8 hpr = (int8)GetHPRatio();
#ifdef IPC          
						if (hpr <= 5 || (IsNPC() && CastToNPC()->IsInteractive() && tar != this) )
#else
						if ((hpr <= 15) && (tar == this))
#endif
						{
							AIDoSpellCast(i, this, mana_cost);
							return true;
						}
						break;
										   }
					case SpellType_Nuke: {
						if(((MakeRandomInt(1, 100) < 50) || ((botClass == BARD) || (botClass == SHAMAN) || (botClass == ENCHANTER)))
							&& ((tar->GetHPRatio() <= 95.0f) || ((botClass == BARD) || (botClass == SHAMAN) || (botClass == ENCHANTER)))
							&& !tar->IsImmuneToSpell(AIspells[i].spellid, this)
							&& (tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0))
						{
							if(!checked_los) {
								if(!CheckLosFN(tar))
									return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
								checked_los = true;
							}

							if(IsFearSpell(AIspells[i].spellid))
							{ // don't let fear cast if the npc isn't snared or rooted
								if(tar->GetSnaredAmount() == -1)
								{
									if(!tar->IsRooted())
										return false;
								}
							}

							AIDoSpellCast(i, tar, mana_cost);
							return true;
						}
						break;
										 }
					case SpellType_Dispel: {
						if(tar->GetHPRatio() > 95.0f)
						{
							if(!checked_los) {
								if(!CheckLosFN(tar))
									return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
								checked_los = true;
							}
							if(tar->CountDispellableBuffs() > 0)
							{
								AIDoSpellCast(i, tar, mana_cost);
								return true;
							}
						}
						break;
										   }
					case SpellType_Pet:
						{
							//keep mobs from recasting pets when they have them.
							if (!IsPet() && !GetPetID() && !IsBotCharmer())
							{
								if(botClass == MAGICIAN)
								{
									if(IsPetChooser())
									{
										bool ChoosePet = true;
										while(ChoosePet)
										{
											switch(GetPetChooserID())
											{
											case 0:
												if(!strncmp(spells[AIspells[i].spellid].teleport_zone, "SumWater", 8))
												{
													ChoosePet = false;
												}
												break;
											case 1:
												if(!strncmp(spells[AIspells[i].spellid].teleport_zone, "SumFire", 7))
												{
													ChoosePet = false;
												}
												break;
											case 2:
												if(!strncmp(spells[AIspells[i].spellid].teleport_zone, "SumAir", 6))
												{
													ChoosePet = false;
												}
												break;
											case 3:
												if(!strncmp(spells[AIspells[i].spellid].teleport_zone, "SumEarth", 8))
												{
													ChoosePet = false;
												}
												break;
											default:
												if(!strncmp(spells[AIspells[i].spellid].teleport_zone, "MonsterSum", 10))
												{
													ChoosePet = false;
												}
												break;
											}
											if(ChoosePet)
											{
												--i;
											}
										}
									}
									else
									{
										// have the magician bot randomly summon
										// the air, earth, fire or water pet
										// include monster summoning after they
										// become level 30 magicians
										int randpets;
										if(botLevel >= 30)
										{
											randpets = 4;
										}
										else
										{
											randpets = 3;
										}
										if(GetLevel() == 2)
										{
											// Do nothing
										}
										else if(GetLevel() == 3)
										{
											i = MakeRandomInt(i-1, i);
										}
										else if(GetLevel() == 4)
										{
											i = MakeRandomInt(i-2, i);
										}
										else
										{
											i = MakeRandomInt(i-randpets, i);
										}
									}
								}
								AIDoSpellCast(i, tar, mana_cost);
								return true;
							}
							break;
						}
					case SpellType_Lifetap: {
						if ((tar->GetHPRatio() <= 90.0f)
							&& !tar->IsImmuneToSpell(AIspells[i].spellid, this)
							&& (tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0))
						{
							if(!checked_los) {
								if(!CheckLosFN(tar))
									return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
								checked_los = true;
							}
							AIDoSpellCast(i, tar, mana_cost);
							return true;
						}
						break;
											}
					case SpellType_Snare: {
						if (
							!tar->IsRooted()
							&& !tar->IsImmuneToSpell(AIspells[i].spellid, this)
							&& tar->DontSnareMeBefore() < Timer::GetCurrentTime()
							&& tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0
							) {
								if(!checked_los) {
									if(!CheckLosFN(tar))
										return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
									checked_los = true;
								}
								int32 TempDontSnareMeBefore = tar->DontSnareMeBefore();
								AIDoSpellCast(i, tar, mana_cost, &TempDontSnareMeBefore);
								if(TempDontSnareMeBefore != tar->DontSnareMeBefore())
									tar->SetDontSnareMeBefore(TempDontSnareMeBefore);

								return true;
						}
						break;
										  }
					case SpellType_DOT: {
						if (
							((tar->GetHPRatio()<=80.0f)||(!GetBotRaidID()))
							&& !tar->IsImmuneToSpell(AIspells[i].spellid, this)
							&& tar->DontDotMeBefore() < Timer::GetCurrentTime()
							&& tar->CanBuffStack(AIspells[i].spellid, botLevel, true) >= 0
							) {
								if(!checked_los) {
									if(!CheckLosFN(tar))
										return(false);	//cannot see target... we assume that no spell is going to work since we will only be casting detrimental spells in this call
									checked_los = true;
								}
								int32 TempDontDotMeBefore = tar->DontDotMeBefore();
								AIDoSpellCast(i, tar, mana_cost, &TempDontDotMeBefore);
								if(TempDontDotMeBefore != tar->DontDotMeBefore())
									tar->SetDontDotMeBefore(TempDontDotMeBefore);

								return true;
						}
						break;
										}
					default: {
						// TODO: log this error
						//cout<<"Error: Unknown spell type in AICastSpell. caster:"<<this->GetCleanName()<<" type:"<<AIspells[i].type<<" slot:"<<i<<endl;
						break;
							 }
					}
			}
			if(extraMana) {
				// If the bot is just looping through spells and not casting
				// then don't let them keep the extra mana we gave them during
				// buff time
				SetMana(hasMana);
				extraMana = false;
			}
		}
	}
	return false;
}

bool Bot::Bot_AI_PursueCastCheck() {
	if (AIautocastspell_timer->Check(false)) {
		_ZP(Bot_AI_Process_pursue_cast);
		AIautocastspell_timer->Disable();	//prevent the timer from going off AGAIN while we are casting.
		
		mlog(AI__SPELLS, "Bot Engaged (pursuing) autocast check triggered. Trying to cast offensive spells.");
		if(!Bot_AICastSpell(GetTarget(), 90, SpellType_Root | SpellType_Nuke | SpellType_Lifetap | SpellType_Snare | SpellType_DOT | SpellType_Dispel)) {
			//no spell cast, try again soon.
			AIautocastspell_timer->Start(RandomTimer(500, 2000), false);
		} //else, spell casting finishing will reset the timer.
		return(true);
	}
	return(false);
}

// Franck-add: EQoffline
// This function was reworked a bit for bots.
bool Bot::Bot_AI_IdleCastCheck() {
	if (AIautocastspell_timer->Check(false)) {
		_ZP(NPC_Bot_AI_IdleCastCheck);
#if MobAI_DEBUG_Spells >= 25
		cout << "Non-Engaged autocast check triggered: " << this->GetCleanName() << endl;
#endif
		AIautocastspell_timer->Disable();	//prevent the timer from going off AGAIN while we are casting.

		//Ok, IdleCastCheck depends of class. 
		// Healers WITHOUT pets will check if a heal is needed before buffing.
		int8 botClass = GetClass();
		if(botClass == CLERIC || botClass == PALADIN || botClass == RANGER)
		{
			if (!Bot_AICastSpell(this, 50, SpellType_Heal | SpellType_Buff))
			{
				if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 50, MobAISpellRange, SpellType_Heal))
				{
					if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 50, MobAISpellRange, SpellType_Buff))
					{
						if(IsGrouped())
						{
							Group *g = GetGroup();
							if(g) {
								for(int i=0; i<MAX_GROUP_MEMBERS; ++i)
								{
									if(g->members[i] && !g->members[i]->qglobal && (g->members[i]->GetHPRatio() < 99))
									{
										if(Bot_AICastSpell(g->members[i], 100, SpellType_Heal))
										{
											AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
											return true;
										}
									}
									if(g->members[i] && !g->members[i]->qglobal && g->members[i]->GetPetID())
									{
										if(Bot_AICastSpell(g->members[i]->GetPet(), 100, SpellType_Heal))
										{
											AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
											return true;
										}
									}
								}
							}
						}
						AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
						return(true);
					}
				}
			}
		}
		// Pets class will first cast their pet, then buffs
		else if(botClass == DRUID || botClass == MAGICIAN || botClass == SHADOWKNIGHT || botClass == SHAMAN || botClass == NECROMANCER || botClass == ENCHANTER || botClass == BEASTLORD  || botClass == WIZARD)
		{			
			if (!Bot_AICastSpell(this, 100, SpellType_Pet))
			{
				if (!Bot_AICastSpell(this, 50, SpellType_Heal | SpellType_Buff))
				{
					if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 50, MobAISpellRange, SpellType_Heal))
					{
						if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 50, MobAISpellRange, SpellType_Buff)) // then buff the group
						{
							if(IsGrouped())
							{
								Group *g = GetGroup();
								if(g) {
									for(int i=0; i<MAX_GROUP_MEMBERS; ++i)
									{
										if(g->members[i] && !g->members[i]->qglobal && (g->members[i]->GetHPRatio() < 99))
										{
											if(Bot_AICastSpell(g->members[i], 100, SpellType_Heal))
											{
												AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
												return true;
											}
										}
										if(g->members[i] && !g->members[i]->qglobal && g->members[i]->GetPetID())
										{
											if(Bot_AICastSpell(g->members[i]->GetPet(), 100, SpellType_Heal))
											{
												AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
												return true;
											}
										}
									}
								}
							}
							AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
							return(true);
						}
					}
				}
			}
		}		
		// bard bots
		else if(botClass == BARD)
		{
			Bot_AICastSpell(this, 100, SpellType_Heal);
			AIautocastspell_timer->Start(1000, false);
			return true;
		}

		// and standard buffing for others..
		else {
			if (!Bot_AICastSpell(this, 100, SpellType_Heal | SpellType_Buff | SpellType_Pet))
			{
				if(!entity_list.Bot_AICheckCloseBeneficialSpells(this, 50, MobAISpellRange, SpellType_Heal | SpellType_Buff)) {
					AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
					return true;
				}
			}
		}
		AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
		return true;
	}
	return false;
}

void Bot::SetTarget(Mob* mob) {
	if(mob != this) {
		if(mob != GetTarget())
			_previousTarget = GetTarget();

		NPC::SetTarget(mob);
	}
}

// AI Processing for the Bot object
void Bot::AI_Process() {
	_ZP(Mob_BOT_Process);

	if(!IsAIControlled())
		return;

	if(!(AIthink_timer->Check() || attack_timer.Check(false)))
		return;

	int8 botClass = GetClass();
	uint8 botLevel = GetLevel();

	if(IsCasting() && (botClass != BARD))
		return;

	// A bot wont start its AI if not grouped
	if(!GetBotOwner() || !IsGrouped()) {
		return;
	}

	Mob* BotOwner = this->GetBotOwner();

	// The bots need an owner
	if(!BotOwner || BotOwner->qglobal || (GetAppearance() == eaDead) || BotOwner->IsBot())
		return;

	if(!IsEngaged()) {
		if(GetFollowID()) {
			if(BotOwner && BotOwner->CastToClient()->AutoAttackEnabled() && BotOwner->GetTarget() &&
				BotOwner->GetTarget()->IsNPC() && BotOwner->GetTarget()->GetHateAmount(BotOwner)) {
					AddToHateList(BotOwner->GetTarget(), 1);
			}
		}
	}

	if(!IsCasting() && !AIautocastspell_timer->Enabled()) {
		// No idea why this seems to shutdown sometimes.
		AIautocastspell_timer->Start(RandomTimer(1000, 5000), false);
	}

	if(IsEngaged()) {
		_ZP(Mob_BOT_Process_IsEngaged);

		if(IsRooted())
			SetTarget(hate_list.GetClosest(this));
		else
			SetTarget(hate_list.GetTop(this));

		if(!GetTarget())
			return;

		FaceTarget(GetTarget());

		if(DivineAura())
			return;

		// TODO: Looks like this block of code doesn't need to be here
		// Lets see if we can let the main tank build a little aggro.  Let healers and slowers in though
		//if((botClass == CLERIC) || (botClass == SHAMAN) || (botClass == ENCHANTER) || (botClass == DRUID))
		//{
		//	// do nothing
		//}

		if(GetBotRaidID()) {
			BotRaids *br = entity_list.GetBotRaidByMob(this);
			if(br) {
				if(br->GetBotMainTank() && (br->GetBotMainTank() != this)) {
					if(br->GetBotMainTarget() && (br->GetBotMainTarget()->GetHateAmount(br->GetBotMainTank()) < 5000)) {
						if(br->GetBotMainTarget()) {
							return;
						}
						else
							SetTarget(br->GetBotMainTarget());
					}
				}
			}
		}

		/*if(GetHPRatio() < 15)
			StartEnrage();*/

		// Let's check if we have a los with our target.
		// If we don't, our hate_list is wiped.
		// Else, it was causing the bot to aggro behind wall etc... causing massive trains.
		if(!CheckLosFN(GetTarget()) || GetTarget()->IsMezzed() || !IsAttackAllowed(GetTarget())) {
			WipeHateList();
			SetTarget(0);
			return;
		}

		bool is_combat_range = CombatRange(GetTarget());
		if(IsBotArcher()) {
			float range = GetBotArcheryRange() + 5.0; //Fudge it a little, client will let you hit something at 0 0 0 when you are at 205 0 0
			mlog(COMBAT__RANGED, "Calculated bow range to be %.1f", range);
			range *= range;
			if(DistNoRootNoZ(*GetTarget()) > range) {
				mlog(COMBAT__RANGED, "Ranged attack out of range... client should catch this. (%f > %f).\n", DistNoRootNoZ(*GetTarget()), range);
				//target is out of range, client does a message
				is_combat_range = false;
			}
			else if(DistNoRootNoZ(*GetTarget()) < (RuleI(Combat, MinRangedAttackDist)*RuleI(Combat, MinRangedAttackDist))) {
				is_combat_range = false;
				AImovement_timer->Check();
				if(IsMoving())
				{
					SetRunAnimSpeed(0);
					SetHeading(GetTarget()->GetHeading());
					if(moved) {
						moved=false;
						SetMoving(false);
						SendPosUpdate();
					}
					tar_ndx = 0;
				}
			}
			else {
				is_combat_range = true;
			}
		}

		// We're engaged, each class type has a special AI
		// Only melee class will go to melee. Casters and healers will stop and stay behind.
		// We 're a melee or any other class lvl<12. Yes, because after it becomes hard to go into melee for casters.. even for bots..
		if((botLevel <= 12) || (botClass == WARRIOR) || (botClass == PALADIN) || (botClass == RANGER) || (botClass == SHADOWKNIGHT) || (botClass == MONK) || (botClass == ROGUE) || (botClass == BEASTLORD) || (botClass == BERSERKER) || (botClass == BARD))
		{
			cast_last_time = true;
		}
		if(is_combat_range && cast_last_time)
		{
			cast_last_time = false;

			AImovement_timer->Check();
			
			if(IsMoving()) {
				SetRunAnimSpeed(0);
				SetHeading(GetTarget()->GetHeading());
				if(moved) {
					moved=false;
					SetMoving(false);
					SendPosUpdate();
				}
				tar_ndx = 0;
			}

			if(!IsMoving() && GetClass() == ROGUE && !BehindMob(GetTarget(), GetX(), GetY())) {
				// Move the rogue to behind the mob
				float newX = 0;
				float newY = 0;
				float newZ = 0;

				if(PlotPositionAroundTarget(GetTarget(), newX, newY, newZ)) {
					CalculateNewPosition2(newX, newY, newZ, GetRunspeed());
					return;
				}
			}
			else if(!IsMoving() && GetClass() != ROGUE && (DistNoRootNoZ(*GetTarget()) < GetTarget()->GetSize())) {
				// If we are not a rogue trying to backstab, let's try to adjust our melee range so we don't appear to be bunched up
				float newX = 0;
				float newY = 0;
				float newZ = 0;

				if(PlotPositionAroundTarget(GetTarget(), newX, newY, newZ, false)) {
					CalculateNewPosition2(newX, newY, newZ, GetRunspeed());
					return;
				}
			}

			if(IsBotArcher() && ranged_timer.Check(false)) {
				if(MakeRandomInt(1, 100) > 95) {
					this->AI_EngagedCastCheck();
					BotMeditate(false);
				}
				else {
					if(GetTarget()->GetHPRatio() < 98)
						BotRangedAttack(GetTarget());
				}
			}

			// we can't fight if we don't have a target, are stun/mezzed or dead..
			if(!IsBotArcher() && GetTarget() && !IsStunned() && !IsMezzed() && (GetAppearance() != eaDead))
			{
				// First, special attack per class (kick, backstab etc..)
				DoClassAttacks(GetTarget());

				//try main hand first
				if(attack_timer.Check())
				{
					Attack(GetTarget(), SLOT_PRIMARY);
					bool tripleSuccess = false;
					if(BotOwner && GetTarget() && CanThisClassDoubleAttack()) {

						if(BotOwner && CheckBotDoubleAttack()) {
							Attack(GetTarget(), SLOT_PRIMARY, true);
						}
						if(BotOwner && GetTarget() && SpecAttacks[SPECATK_TRIPLE] && CheckBotDoubleAttack(true)) {
							tripleSuccess = true;
							Attack(GetTarget(), SLOT_PRIMARY, true);
						}
						//quad attack, does this belong here??
						if(BotOwner && GetTarget() && SpecAttacks[SPECATK_QUAD] && CheckBotDoubleAttack(true)) {
							Attack(GetTarget(), SLOT_PRIMARY, true);
						}
					}

					// Handle Flurrys
					if((botClass == WARRIOR) && (botLevel >= 59)) {
						int flurrychance = 0;
						if(botLevel >= 61) { // Flurry AA's
							flurrychance += 50;
						}
						else if(botLevel == 60) {
							flurrychance += 25;
						}
						else if(botLevel == 59) {
							flurrychance += 10;
						}
						if(tripleSuccess) {
							tripleSuccess = false;
							if(botLevel >= 65) { // Raging Flurry AA's
								flurrychance += 50;
							}
							else if(botLevel == 64) {
								flurrychance += 25;
							}
							else if(botLevel == 63) {
								flurrychance += 10;
							}
						}
						if(rand()%1000 < flurrychance) {
							Message_StringID(MT_Flurry, 128);
							Attack(GetTarget(), SLOT_PRIMARY, true);
							Attack(GetTarget(), SLOT_PRIMARY, true);
						}
					}

					if(GetTarget() && (botClass == MONK)) { // Rapid Strikes AA
						int chance_xhit1 = 0;
						int chance_xhit2 = 0;
						if(botLevel >= 69) {
							chance_xhit1 = 20;
							chance_xhit2 = 10;
						}
						else if(botLevel == 68) {
							chance_xhit1 = 16;
							chance_xhit2 = 8;
						}
						else if(botLevel == 67) {
							chance_xhit1 = 14;
							chance_xhit2 = 6;
						}
						else if(botLevel == 66) {
							chance_xhit1 = 12;
							chance_xhit2 = 4;
						}
						else if(botLevel == 65) {
							chance_xhit1 = 10;
							chance_xhit2 = 2;
						}
						if(MakeRandomInt(1,100) < chance_xhit1)
							Attack(GetTarget(), SLOT_PRIMARY, true);
						if(GetTarget() && (MakeRandomInt(1,100) < chance_xhit2))
							Attack(GetTarget(), SLOT_PRIMARY, true);
					}

					// Handle Punishing Blade and Speed of the Knight and Wicked Blade
					if(GetTarget() && ((botClass == MONK) || (botClass == RANGER) || (botClass == WARRIOR) || (botClass == PALADIN) || (botClass == SHADOWKNIGHT))) {
						if(botLevel >= 61) {
							ItemInst* weapon = NULL;
							const Item_Struct* botweapon = NULL;
							botweapon = database.GetItem(CastToNPC()->GetEquipment(MATERIAL_PRIMARY));
							if(botweapon != NULL) {
								weapon = new ItemInst(botweapon);
							}
							if(weapon) {
								if( weapon->GetItem()->ItemType == ItemType2HS ||
									weapon->GetItem()->ItemType == ItemType2HB ||
									weapon->GetItem()->ItemType == ItemType2HPierce )
								{
									int extatk = 0;
									if(botLevel >= 61) {
										extatk += 5;
									}
									if(botLevel >= 63) {
										extatk += 5;
									}
									if(botLevel >= 65) {
										extatk += 5;
									}
									if(botLevel >= 70) {
										extatk += 15;
									}
									if(MakeRandomInt(0, 100) < extatk) {
										Attack(GetTarget(), SLOT_PRIMARY, true);
									}
								}
							}
						}
					}
				}

				//now off hand
				if(GetTarget() && attack_dw_timer.Check() && CanThisClassDualWield())
				{
					//can only dual weild without a weapon if you're a monk
					if((GetEquipment(MATERIAL_SECONDARY) != 0) || (botClass == MONK))
					{
						const Item_Struct* weapon = NULL;
						weapon = database.GetItem(CastToNPC()->GetEquipment(MATERIAL_PRIMARY));
						int weapontype = NULL;
						bool bIsFist = true;
						if(weapon != NULL) {
							weapontype = weapon->ItemType;
							bIsFist = false;
						}
						if(bIsFist || ((weapontype != ItemType2HS) && (weapontype != ItemType2HPierce) && (weapontype != ItemType2HB))) {
							float DualWieldProbability = (GetSkill(DUAL_WIELD) + botLevel) / 400.0f;
							if(botLevel >= 59) { // AA Ambidexterity
								DualWieldProbability += 0.1f;
							}
							//discipline effects:
							DualWieldProbability += (spellbonuses.DualWeildChance + itembonuses.DualWeildChance) / 100.0f;

							float random = MakeRandomFloat(0, 1);
							if (random < DualWieldProbability) { // Max 78% of DW
								Attack(GetTarget(), SLOT_SECONDARY);
								if(GetTarget() && CanThisClassDoubleAttack() && CheckBotDoubleAttack()) {
									Attack(GetTarget(), SLOT_SECONDARY);
								}
							}
						}
					}
				}

				//Bard, rangers, SKs, Paladin can cast also
				if(botClass == BARD || botClass == RANGER || botClass == SHADOWKNIGHT || botClass == PALADIN || botClass == BEASTLORD) {
					this->AI_EngagedCastCheck();
					BotMeditate(false);
				}
			}
		} //end is within combat range
		// Now, if we re casters, we have a particular AI.
		if((botClass == CLERIC) || (botClass == DRUID) || (botClass == SHAMAN) || (botClass == NECROMANCER) || (botClass == WIZARD) || (botClass == MAGICIAN) || (botClass == ENCHANTER))
		{
			cast_last_time = true;
			// First, let's make them stop
			AImovement_timer->Check();
			if(IsMoving())
			{
				SetRunAnimSpeed(0);
				SetHeading(GetTarget()->GetHeading());
				if(moved) {
					moved=false;
					SetMoving(false);
					SendPosUpdate();
				}
				tar_ndx = 0;
			}

			BotMeditate(false);

			// Then, use their special engaged AI.
			this->AI_EngagedCastCheck();
		} //end is within combat range
		else {
			//we cannot reach our target...
			// See if we can summon the mob to us
			if(!HateSummon() && !IsBotArcher())
			{
				//could not summon them, start pursuing...
				// TODO: Check here for another person on hate list with close hate value
				if(GetTarget() && Bot_AI_PursueCastCheck())
				{}
				else if(GetTarget() && AImovement_timer->Check())
				{
					if(!IsRooted()) {
						mlog(AI__WAYPOINTS, "Pursuing %s while engaged.", GetTarget()->GetCleanName());
						CalculateNewPosition2(GetTarget()->GetX(), GetTarget()->GetY(), GetTarget()->GetZ(), GetRunspeed(), false);
					} else {
						SetHeading(GetTarget()->GetHeading());
						if(moved) {
							moved=false;
							SetMoving(false);
							SendPosUpdate();
						}
					}
				}
			}
		}
	}
	else {
		// Franck: EQoffline
		// Ok if we're not engaged, what's happening..
		SetTarget(0);

		if(!IsMoving()) {
			BotMeditate(true);
			Bot_AI_IdleCastCheck(); // let's rebuff, heal, etc..
		}

		// now the followID: that's what happening as the bots follow their leader.
		if(GetFollowID()) {
			Mob* follow = entity_list.GetMob(GetFollowID());
			
			if (!follow)
				SetFollowID(0);
			else if(AImovement_timer->Check()){
				float dist2 = DistNoRoot(*follow);
				int followdist = 184;	/*GetFollowDistance();*/
				SetRunAnimSpeed(0);
				if(dist2 > followdist) {
					CalculateNewPosition2(follow->GetX(), follow->GetY(), follow->GetZ(), GetRunspeed(), false);
				}
				else {
					SetHeading(follow->GetHeading());
					if(moved) {
						moved=false;
						SetMoving(false);
						SendPosUpdate();
					}
				}
			}
		}
	}
}

// AI Processing for a Bot object's pet
void Bot::PetAIProcess() {
	_ZP(Bot_PET_Process);

	if( !HasPet() || !GetPet() || !GetPet()->IsNPC())
		return;

	Mob* BotOwner = this->GetBotOwner();
	NPC* botPet = this->GetPet()->CastToNPC();

	if(!botPet->GetOwner() || !botPet->GetID() || !botPet->GetOwnerID()) {
		Kill();
		return;
	} 

	if (!botPet->IsAIControlled())
		return;

	if (!(botPet->GetAIThinkTimer()->Check() || botPet->GetAttackTimer().Check(false)))
		return;

	if (botPet->IsCasting())
		return;

	// if our owner isn't a pet or if he is not a client...
	if (!botPet->GetOwner()->IsBot() || ( !botPet->GetOwner()->IsBot() && !botPet->GetOwner()->IsClient() ) )
		return;

	if (IsEngaged()) {
		_ZP(Bot_PET_Process_IsEngaged);
		if (botPet->IsRooted())
			botPet->SetTarget(hate_list.GetClosest(botPet));
		else
			botPet->SetTarget(hate_list.GetTop(botPet));

		// Let's check if we have a los with our target.
		// If we don't, our hate_list is wiped.
		// It causes some cpu stress but without it, it was causing the bot/pet to aggro behind wall, floor etc... 
		if(!botPet->CheckLosFN(botPet->GetTarget()) || botPet->GetTarget()->IsMezzed() || !botPet->IsAttackAllowed(GetTarget())) {
			botPet->WipeHateList();
			botPet->SetTarget(botPet->GetOwner());

			return;
		}

		botPet->FaceTarget(botPet->GetTarget());

		// Lets see if we can let the main tank build a little aggro
		if(GetBotRaidID()) {
			BotRaids *br = entity_list.GetBotRaidByMob(GetOwner());
			if(br) {
				if(br->GetBotMainTank() && (br->GetBotMainTank() != this)) {
					if(br->GetBotMainTarget() && (br->GetBotMainTarget()->GetHateAmount(br->GetBotMainTank()) < 5000)) {
						if(GetTarget() == br->GetBotMainTarget()) {
							return;
						}
					}
				}
			}
		}

		bool is_combat_range = botPet->CombatRange(botPet->GetTarget());

		// Ok, we're engaged, each class type has a special AI
		// Only melee class will go to melee. Casters and healers will stay behind, following the leader by default.
		// I should probably make the casters staying in place so they can cast..

		// Ok, we 're a melee or any other class lvl<12. Yes, because after it becomes hard to go in melee for casters.. even for bots..
		if( is_combat_range ) {
			botPet->GetAIMovementTimer()->Check();
			if(botPet->IsMoving()) {
				botPet->SetRunAnimSpeed(0);
				botPet->SetHeading(botPet->GetTarget()->GetHeading());
				if(moved) {
					moved=false;
					botPet->SetMoving(false);
					botPet->SendPosUpdate();
				}
			}

			if(!botPet->IsMoving() && botPet->GetClass() == ROGUE && !botPet->BehindMob(GetTarget(), botPet->GetX(), botPet->GetY())) {
				// Move the rogue to behind the mob
				float newX = 0;
				float newY = 0;
				float newZ = 0;

				if(botPet->PlotPositionAroundTarget(GetTarget(), newX, newY, newZ)) {
					botPet->CalculateNewPosition2(newX, newY, newZ, botPet->GetRunspeed());
					return;
				}
			}
			else if(!botPet->IsMoving() && botPet->GetClass() != ROGUE && (botPet->DistNoRootNoZ(*GetTarget()) < GetTarget()->GetSize())) {
				// If we are not a rogue trying to backstab, let's try to adjust our melee range so we don't appear to be bunched up
				float newX = 0;
				float newY = 0;
				float newZ = 0;

				if(botPet->PlotPositionAroundTarget(GetTarget(), newX, newY, newZ, false)) {
					botPet->CalculateNewPosition2(newX, newY, newZ, GetRunspeed());
					return;
				}
			}
			
			// we can't fight if we don't have a target, are stun/mezzed or dead..
			if(botPet->GetTarget() && !botPet->IsStunned() && !botPet->IsMezzed() && (botPet->GetAppearance() != eaDead)) 
			{
				if(botPet->GetAttackTimer().Check())  // check the delay on the attack
				{		
					if(botPet->Attack(GetTarget(), 13))			// try the main hand
						if (botPet->GetTarget())					// Do we still have a target?
						{
							// We're a pet so we re able to dual attack
							sint32 RandRoll = MakeRandomInt(0, 99);	
							if (botPet->CanThisClassDoubleAttack() && (RandRoll < (botPet->GetLevel() + NPCDualAttackModifier)))	
							{
								if(botPet->Attack(botPet->GetTarget(), 13)) 
								{}
							}
						}

						// Ok now, let's check pet's offhand. 
						if (botPet->GetAttackDWTimer().Check() && botPet->GetOwnerID() && botPet->GetOwner() && ((botPet->GetOwner()->GetClass() == MAGICIAN) || (botPet->GetOwner()->GetClass() == NECROMANCER) || (botPet->GetOwner()->GetClass() == SHADOWKNIGHT) || (botPet->GetOwner()->GetClass() == BEASTLORD))) 
						{
							if(botPet->GetOwner()->GetLevel() >= 24)
							{
								float DualWieldProbability = (botPet->GetSkill(DUAL_WIELD) + botPet->GetLevel()) / 400.0f;
								DualWieldProbability -= MakeRandomFloat(0, 1);
								if(DualWieldProbability < 0){
									botPet->Attack(botPet->GetTarget(), 14);
									if (botPet->CanThisClassDoubleAttack())
									{
										sint32 RandRoll = rand()%100;
										if (RandRoll < (botPet->GetLevel() + 20))
										{
											botPet->Attack(botPet->GetTarget(), 14);
										}
									}
								}
							}
						}
						if(!botPet->GetOwner())
							return;

						// Special attack
						botPet->DoClassAttacks(botPet->GetTarget()); 
				}
				// See if the pet can cast any spell
				botPet->AI_EngagedCastCheck();
			}	
		}// end of the combat in range
		else{
			// Now, if we cannot reach our target
			if (!botPet->HateSummon()) 
			{
				if(botPet->GetTarget() && botPet->AI_PursueCastCheck()) 
				{}
				else if (botPet->GetTarget() && botPet->GetAIMovementTimer()->Check()) 
				{
					botPet->SetRunAnimSpeed(0);
					if(!botPet->IsRooted()) {
						mlog(AI__WAYPOINTS, "Pursuing %s while engaged.", botPet->GetTarget()->GetCleanName());
						botPet->CalculateNewPosition2(botPet->GetTarget()->GetX(), botPet->GetTarget()->GetY(), botPet->GetTarget()->GetZ(), botPet->GetOwner()->GetRunspeed(), false);
					}
					else {
						botPet->SetHeading(botPet->GetTarget()->GetHeading());
						if(moved) {
							moved=false;
							botPet->SetMoving(false);
							botPet->SendPosUpdate();
						}
					}
				}
			}
		}
	}
	else{
		// Franck: EQoffline
		// Ok if we're not engaged, what's happening..
		if(botPet->GetTarget() != botPet->GetOwner()) {
			botPet->SetTarget(botPet->GetOwner());
		}

		if(!IsMoving()) {
			botPet->AI_IdleCastCheck();
		}

		if(botPet->GetAIMovementTimer()->Check()) {
			switch(pStandingPetOrder) {
				case SPO_Follow:
					{
						float dist = botPet->DistNoRoot(*botPet->GetTarget());
						botPet->SetRunAnimSpeed(0);
						if(dist > 184) {
							botPet->CalculateNewPosition2(botPet->GetTarget()->GetX(), botPet->GetTarget()->GetY(), botPet->GetTarget()->GetZ(), botPet->GetTarget()->GetRunspeed(), false);
						}
						else {
							botPet->SetHeading(botPet->GetTarget()->GetHeading());
							if(moved) {
								moved=false;
								botPet->SetMoving(false);
								botPet->SendPosUpdate();
							}
						}
					}
					break;
				case SPO_Sit:
					botPet->SetAppearance(eaSitting);
					break;
				case SPO_Guard:
					botPet->NextGuardPosition();
					break;
			}
		}
	}
}

void Bot::Depop() {
	NPC::Depop(false);
}

bool Bot::DeleteBot(std::string* errorMessage) {
	bool Result = false;
	int TempCounter = 0;

	if(this->GetBotID() > 0) {
		char* Query = 0;
		char TempErrorMessageBuffer[MYSQL_ERRMSG_SIZE];

		// TODO: These queries need to be ran together as a transaction.. ie, if one or more fail then they all will fail to commit to the database.

		if(!database.RunQuery(Query, MakeAnyLenString(&Query, "DELETE FROM botinventory WHERE botid = '%u'", this->GetBotID()), TempErrorMessageBuffer)) {
			*errorMessage = std::string(TempErrorMessageBuffer);
		}
		else
			TempCounter++;

		if(!database.RunQuery(Query, MakeAnyLenString(&Query, "DELETE FROM bots WHERE BotID = '%u'", this->GetBotID()), TempErrorMessageBuffer)) {
			*errorMessage = std::string(TempErrorMessageBuffer);
		}
		else
			TempCounter++;

		if(TempCounter == 2)
			Result = true;
	}

	return Result;
}

void Bot::Spawn(Client* botCharacterOwner, std::string* errorMessage) {
	if(this->GetBotID() > 0 && this->_botOwnerCharacterID > 0 && botCharacterOwner) {
		// Rename the bot name to make sure that Mob::GetName() matches Mob::GetCleanName() so we dont have a bot named "Jesuschrist001"
		strcpy(name, GetCleanName());

		// Spawn the bot at the bow owner's loc
		this->x_pos = botCharacterOwner->GetX();
		this->y_pos = botCharacterOwner->GetY();
		this->z_pos = botCharacterOwner->GetZ();
		
		// Make the bot look at the bot owner
		FaceTarget(botCharacterOwner);

		// Level the bot to the same level as the bot owner
		//this->SetLevel(botCharacterOwner->GetLevel());

		entity_list.AddBot(this, true, true);

		this->SendPosition();

		if(!_botInventory.empty()) {
			for(int i = 1; i < 22; i++) {
				uint32 itemID = 0;
				itemID = GetBotItem(i);

				if(itemID != 0) {
					const Item_Struct* item2 = database.GetItem(itemID);
					int8 materialFromSlot = Inventory::CalcMaterialFromSlot(i);
					if(materialFromSlot != 0xFF) {
						this->SendWearChange(materialFromSlot);
					}
				}
			}
		}
	}
}

// Saves the specified item as an inventory record in the database for this bot.
void Bot::SetBotItemInSlot(uint32 slotID, uint32 itemID, std::string *errorMessage) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;

	if(this->GetBotID() > 0 && slotID > 0 && itemID > 0) {
		if(!database.RunQuery(query, MakeAnyLenString(&query, "REPLACE INTO botinventory SET botid = %i, slotid = %i, itemid = %i", this->GetBotID(), slotID, itemID), errbuf)) {
			*errorMessage = std::string(errbuf);
		}

		safe_delete_array(query);
	}
}

// Deletes the inventory record for the specified item from the database for this bot.
void Bot::RemoveBotItemBySlot(uint32 slotID, std::string *errorMessage) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;

	if(this->GetBotID() > 0 && slotID > 0) {
		if(!database.RunQuery(query, MakeAnyLenString(&query, "DELETE FROM botinventory WHERE botid=%i AND slotid=%i", this->GetBotID(), slotID), errbuf)){
			*errorMessage = std::string(errbuf);
		}

		safe_delete_array(query);
	}
}

// Retrieves all the inventory records from the database for this bot.
Bot::BotInventory Bot::GetBotItems(std::string* errorMessage) {
	BotInventory Result;

	if(this->GetBotID() > 0) {
		char errbuf[MYSQL_ERRMSG_SIZE];
		char* query = 0;
		MYSQL_RES* DatasetResult;
		MYSQL_ROW DataRow;

		if(database.RunQuery(query, MakeAnyLenString(&query, "SELECT slotid, itemid FROM botinventory WHERE botid=%i order by slotid", this->GetBotID()), errbuf, &DatasetResult)) {
			while(DataRow = mysql_fetch_row(DatasetResult)) {
				Result.insert(BotInventoryItem(atoi(DataRow[0]), atoi(DataRow[1])));
			}

			mysql_free_result(DatasetResult);
		}
		else 
			*errorMessage = std::string(errbuf);

		safe_delete_array(query);
	}

	return Result;
}

// Returns the inventory record for this bot from the database for the specified equipment slot.
uint32 Bot::GetBotItemBySlot(uint32 slotID, std::string *errorMessage) {
	uint32 Result = 0;

	if(this->GetBotID() > 0 && slotID > 0) {
		char errbuf[MYSQL_ERRMSG_SIZE];
		char* query = 0;
		MYSQL_RES* DatasetResult;
		MYSQL_ROW DataRow;

		if(database.RunQuery(query, MakeAnyLenString(&query, "SELECT itemid FROM botinventory WHERE botid=%i AND slotid=%i", this->GetBotID(), slotID), errbuf, &DatasetResult)) {
			if(mysql_num_rows(DatasetResult) == 1) {
				DataRow = mysql_fetch_row(DatasetResult);
				if(DataRow)
					Result = atoi(DataRow[0]);
			}

			mysql_free_result(DatasetResult);
		}
		else
			*errorMessage = std::string(errbuf);

		safe_delete_array(query);
	}

	return Result;
}

// Returns the number of inventory records the bot has in the database.
uint32 Bot::GetBotItemsCount(std::string *errorMessage) {
	uint32 Result = 0;

	if(this->GetBotID() > 0) {
		char errbuf[MYSQL_ERRMSG_SIZE];
		char* query = 0;
		MYSQL_RES* DatasetResult;
		MYSQL_ROW DataRow;

		if(database.RunQuery(query, MakeAnyLenString(&query, "SELECT COUNT(*) FROM botinventory WHERE botid=%i", this->GetBotID()), errbuf, &DatasetResult)) {
			if(mysql_num_rows(DatasetResult) == 1) {
				DataRow = mysql_fetch_row(DatasetResult);
				if(DataRow)
					Result = atoi(DataRow[0]);
			}

			mysql_free_result(DatasetResult);
		}
		else
			*errorMessage = std::string(errbuf);

		safe_delete_array(query);
	}

	return Result;
}

bool Bot::MesmerizeTarget(Mob* target) {
	bool Result = false;

	if(target) {
		int mezid = 0;
		int mezlevel = GetLevel();

		if(mezlevel >= 69) {
			mezid = 5520;
		}
		else if(mezlevel == 68) {
			mezid = 8035;
		}
		else if(mezlevel == 67) {
			mezid = 5503;
		}
		else if(mezlevel >= 64) {
			mezid = 3358;
		}
		else if(mezlevel == 63) {
			mezid = 3354;
		}
		else if(mezlevel >= 61) {
			mezid = 3341;
		}
		else if(mezlevel == 60) {
			mezid = 2120;
		}
		else if(mezlevel == 59) {
			mezid = 1692;
		}
		else if(mezlevel >= 54) {
			mezid = 1691;
		}
		else if(mezlevel >= 47) {
			mezid = 190;
		}
		else if(mezlevel >= 30) {
			mezid = 188;
		}
		else if(mezlevel >= 13) {
			mezid = 187;
		}
		else if(mezlevel >= 2) {
			mezid = 292;
		}
		if(mezid > 0) {
			int32 DontRootMeBeforeTime = 0;
			CastSpell(mezid, target->GetID(), 1, -1, -1, &DontRootMeBeforeTime);
			target->SetDontRootMeBefore(DontRootMeBeforeTime);
			Result = true;
		}
	}

	return Result;
}

void Bot::SetLevel(uint8 in_level, bool command) {
	if(in_level > 0) {
		Mob::SetLevel(in_level, command);
	}
}

void Bot::FillSpawnStruct(NewSpawn_Struct* ns, Mob* ForWho) {
	if(ns) {
		Mob::FillSpawnStruct(ns, ForWho);

		ns->spawn.afk = 0;
		ns->spawn.lfg = 0;
		ns->spawn.anon = 0;
		ns->spawn.gm = 0;
		ns->spawn.guildID = 0xFFFFFFFF;		// 0xFFFFFFFF = NO GUILD, 0 = Unknown Guild
		ns->spawn.is_npc = 0;				// 0=no, 1=yes
		ns->spawn.is_pet = 0;
		ns->spawn.guildrank = 0;
		ns->spawn.showhelm = 0;
		ns->spawn.flymode = 0;
		ns->spawn.size = 0;
		ns->spawn.NPC = 0;					// 0=player,1=npc,2=pc corpse,3=npc corpse

		const Item_Struct* item = 0;

		if(!_botInventory.empty()) {
			if(item = database.GetItem(GetBotItem(SLOT_HANDS))) {
				ns->spawn.equipment[MATERIAL_HANDS]	= item->Material;
				ns->spawn.colors[MATERIAL_HANDS].color = GetEquipmentColor(MATERIAL_HANDS);
			}

			if(item = database.GetItem(GetBotItem(SLOT_HEAD))) {
				ns->spawn.equipment[MATERIAL_HEAD] = item->Material;
				ns->spawn.colors[MATERIAL_HEAD].color = GetEquipmentColor(MATERIAL_HEAD);
			}

			if(item = database.GetItem(GetBotItem(SLOT_ARMS))) {
				ns->spawn.equipment[MATERIAL_ARMS] = item->Material;
				ns->spawn.colors[MATERIAL_ARMS].color = GetEquipmentColor(MATERIAL_ARMS);
			}

			if(item = database.GetItem(GetBotItem(SLOT_BRACER01))) {
				ns->spawn.equipment[MATERIAL_BRACER] = item->Material;
				ns->spawn.colors[MATERIAL_BRACER].color	= GetEquipmentColor(MATERIAL_BRACER);
			}

			if(item = database.GetItem(GetBotItem(SLOT_BRACER02))) {
				ns->spawn.equipment[MATERIAL_BRACER] = item->Material;
				ns->spawn.colors[MATERIAL_BRACER].color	= GetEquipmentColor(MATERIAL_BRACER);
			}

			if(item = database.GetItem(GetBotItem(SLOT_CHEST))) {
				ns->spawn.equipment[MATERIAL_CHEST]	= item->Material;
				ns->spawn.colors[MATERIAL_CHEST].color = GetEquipmentColor(MATERIAL_CHEST);
			}

			if(item = database.GetItem(GetBotItem(SLOT_LEGS))) {
				ns->spawn.equipment[MATERIAL_LEGS] = item->Material;
				ns->spawn.colors[MATERIAL_LEGS].color = GetEquipmentColor(MATERIAL_LEGS);
			}

			if(item = database.GetItem(GetBotItem(SLOT_FEET))) {
				ns->spawn.equipment[MATERIAL_FEET] = item->Material;
				ns->spawn.colors[MATERIAL_FEET].color = GetEquipmentColor(MATERIAL_FEET);
			}

			if(item = database.GetItem(GetBotItem(SLOT_PRIMARY))) {
				if(strlen(item->IDFile) > 2)
					ns->spawn.equipment[MATERIAL_PRIMARY] = atoi(&item->IDFile[2]);
			}

			if(item = database.GetItem(GetBotItem(SLOT_SECONDARY))) {
				if(strlen(item->IDFile) > 2)
					ns->spawn.equipment[MATERIAL_SECONDARY] = atoi(&item->IDFile[2]);
			}
		}
	}
}

Bot* Bot::LoadBot(uint32 botID, std::string* errorMessage) {
	Bot* Result = 0;

	if(botID > 0) {
		char* Query = 0;
		char TempErrorMessageBuffer[MYSQL_ERRMSG_SIZE];
		MYSQL_RES* DatasetResult;
		MYSQL_ROW DataRow;

		if(!database.RunQuery(Query, MakeAnyLenString(&Query, "SELECT BotOwnerCharacterID, BotSpellsID, Name, LastName, BotLevel, Race, Class, Gender, Size, Face, LuclinHairStyle, LuclinHairColor, LuclinEyeColor, LuclinEyeColor2, LuclinBeardColor, LuclinBeard, DrakkinHeritage, DrakkinTattoo, DrakkinDetails, MR, CR, DR, FR, PR, AC, STR, STA, DEX, AGI, _INT, WIS, CHA, ATK, BotCreateDate, LastSpawnDate, TotalPlayTime FROM bots WHERE BotID = '%u'", botID), TempErrorMessageBuffer, &DatasetResult)) {
			*errorMessage = std::string(TempErrorMessageBuffer);
		}
		else {
			while(DataRow = mysql_fetch_row(DatasetResult)) {
				NPCType TempNPCStruct = FillNPCTypeStruct(atoi(DataRow[1]), std::string(DataRow[2]), std::string(DataRow[3]), atoi(DataRow[4]), atoi(DataRow[5]), atoi(DataRow[6]), atoi(DataRow[7]), atof(DataRow[8]), atoi(DataRow[9]), atoi(DataRow[10]), atoi(DataRow[11]), atoi(DataRow[12]), atoi(DataRow[13]), atoi(DataRow[14]), atoi(DataRow[15]), atoi(DataRow[16]), atoi(DataRow[17]), atoi(DataRow[18]), atoi(DataRow[19]), atoi(DataRow[20]), atoi(DataRow[21]), atoi(DataRow[22]), atoi(DataRow[23]), atoi(DataRow[24]), atoi(DataRow[25]), atoi(DataRow[26]), atoi(DataRow[27]), atoi(DataRow[28]), atoi(DataRow[29]), atoi(DataRow[30]), atoi(DataRow[31]), atoi(DataRow[32]));
				Result = new Bot(botID, atoi(DataRow[0]), atoi(DataRow[1]), atof(DataRow[35]), TempNPCStruct);
				break;
			}

			mysql_free_result(DatasetResult);
		}

		safe_delete_array(Query);
	}

	return Result;
}

// Sets the bot activation flag in the database to allow the bot to persist zones and logouts
bool Bot::ActivateBot(Bot* bot, std::string* errorMessage) {
	bool Result = false;

	if(bot) {
		char* Query = 0;
		char TempErrorMessageBuffer[MYSQL_ERRMSG_SIZE];

		if(!database.RunQuery(Query, MakeAnyLenString(&Query, "REPLACE INTO botactives SET ActiveBotId = '%u'", bot->GetBotID()), TempErrorMessageBuffer))
			*errorMessage = std::string(TempErrorMessageBuffer);
		else
			Result = true;
	}

	return Result;
}

// Removes the bot activation flag in the database
bool Bot::DeactivateBot(Bot* bot, std::string* errorMessage) {
	bool Result = false;

	if(bot) {
		char* Query = 0;
		char TempErrorMessageBuffer[MYSQL_ERRMSG_SIZE];

		if(!database.RunQuery(Query, MakeAnyLenString(&Query, "DELETE FROM botactives WHERE ActiveBotId = '%u'", bot->GetBotID()), TempErrorMessageBuffer))
			*errorMessage = std::string(TempErrorMessageBuffer);
		else
			Result = true;
	}

	return Result;
}

std::list<uint32> Bot::GetActiveBotsByBotOwnerCharacterID(uint32 botOwnerCharacterID, std::string* errorMessage) {
	std::list<uint32> Result;

	if(botOwnerCharacterID > 0) {
		char* Query = 0;
		char TempErrorMessageBuffer[MYSQL_ERRMSG_SIZE];
		MYSQL_RES* DatasetResult;
		MYSQL_ROW DataRow;

		if(!database.RunQuery(Query, MakeAnyLenString(&Query, "select b.BotID as ActiveBotID from botactives as a join bots as b on a.ActiveBotId = b.BotID where BotOwnerCharacterID = '%u'", botOwnerCharacterID), TempErrorMessageBuffer, &DatasetResult)) {
			*errorMessage = std::string(TempErrorMessageBuffer);
		}
		else {
			while(DataRow = mysql_fetch_row(DatasetResult)) {
				if(DataRow) {
					Result.push_back(atoi(DataRow[0]));
				}
			}

			mysql_free_result(DatasetResult);
		}

		safe_delete_array(Query);
	}

	return Result;
}

// Load and spawn all active bots by bot owner character
void Bot::LoadAndSpawnAllActiveBots(Client* botOwner) {
	if(botOwner) {
		std::string errorMessage;
		std::list<uint32> ActiveBots = Bot::GetActiveBotsByBotOwnerCharacterID(botOwner->CharacterID(), &errorMessage);
		
		if(errorMessage.empty()) {
			for(list<uint32>::iterator itr = ActiveBots.begin(); itr != ActiveBots.end(); itr++) {
				Bot* activeBot = Bot::LoadBot(*itr, &errorMessage);

				if(!errorMessage.empty()) {
					safe_delete(activeBot);
					break;
				}

				if(activeBot && botOwner->HasGroup()) {
					activeBot->Spawn(botOwner, &errorMessage);
				
					Group* g = botOwner->GetGroup();

					if(g) {
						g->UpdatePlayer(activeBot);
						if(g->GetLeader())
							activeBot->SetFollowID(g->GetLeader()->GetID());
					}
					else {
						Bot::DeactivateBot(activeBot, &errorMessage);
						database.SetGroupID(activeBot->GetCleanName(), 0, activeBot->GetBotID());
					}

					if(!errorMessage.empty()) {
						if(entity_list.GetMobByBotID(activeBot->GetBotID())) {
							Bot::DeactivateBot(activeBot, &errorMessage);
							database.SetGroupID(activeBot->GetCleanName(), 0, activeBot->GetBotID());
							safe_delete(activeBot);
						}
						break;
					}
				}

				if(activeBot && !botOwner->HasGroup()) {
					Bot::DeactivateBot(activeBot, &errorMessage);
					database.SetGroupID(activeBot->GetCleanName(), 0, activeBot->GetBotID());
				}
			}
		}

		// Catch all condition for error messages destined for the zone error log
		if(!errorMessage.empty()) {
			// TODO: Log this error message to zone error log
		}
	}
}

// Causes all active bots to depop without removing any group or raid information
void Bot::ZoneAllActiveBots(Client* botOwner) {
	if(botOwner) {
		std::string errorMessage;

		std::list<uint32> ActiveBots = Bot::GetActiveBotsByBotOwnerCharacterID(botOwner->CharacterID(), &errorMessage);
		
		if(errorMessage.empty()) {
			for(list<uint32>::iterator itr = ActiveBots.begin(); itr != ActiveBots.end(); itr++) {
				Mob* activeBot = entity_list.GetMobByBotID(*itr);

				if(activeBot) {
					if(activeBot->IsBot())
						activeBot->CastToBot()->Zone();
				}
			}
		}

		// Catch all condition for error messages destined for the zone error log
		if(!errorMessage.empty()) {
			// TODO: Log this error message to zone error log
		}
	}
}

// Returns TRUE if there is atleast 1 bot in the specified group
bool Bot::GroupHasBot(Group* group) {
	bool Result = false;

	if(group) {
		for(int Counter = 0; Counter < MAX_GROUP_MEMBERS; Counter++) {
			if (group->members[Counter] == NULL) {
				continue;
			}

			if(group->members[Counter]->IsBot()) {
				Result = true;
				break;
			}
		}
	}

	return Result;
}

std::list<BotsAvailableList> Bot::GetBotList(uint32 botOwnerCharacterID, std::string* errorMessage) {
	std::list<BotsAvailableList> Result;

	if(botOwnerCharacterID > 0) {
		char* Query = 0;
		char TempErrorMessageBuffer[MYSQL_ERRMSG_SIZE];
		MYSQL_RES* DatasetResult;
		MYSQL_ROW DataRow;

		if(!database.RunQuery(Query, MakeAnyLenString(&Query, "SELECT BotID, Name, Class, BotLevel, Race FROM bots WHERE BotOwnerCharacterID = '%u'", botOwnerCharacterID), TempErrorMessageBuffer, &DatasetResult)) {
			*errorMessage = std::string(TempErrorMessageBuffer);
		}
		else {
			while(DataRow = mysql_fetch_row(DatasetResult)) {
				if(DataRow) {
					BotsAvailableList TempAvailableBot;
					TempAvailableBot.BotID = atoi(DataRow[0]);
					strcpy(TempAvailableBot.BotName, DataRow[1]);
					TempAvailableBot.BotClass = atoi(DataRow[2]);
					TempAvailableBot.BotLevel = atoi(DataRow[3]);
					TempAvailableBot.BotRace = atoi(DataRow[4]);

					Result.push_back(TempAvailableBot);
				}
			}

			mysql_free_result(DatasetResult);
		}

		safe_delete_array(Query);
	}

	return Result;
}

std::list<SpawnedBotsList> Bot::ListSpawnedBots(uint32 characterID, std::string* errorMessage) {
	std::list<SpawnedBotsList> Result;
	char ErrBuf[MYSQL_ERRMSG_SIZE];
	char* Query = 0;
	MYSQL_RES* DatasetResult;
	MYSQL_ROW DataRow;

	if(characterID > 0) {
		if(!database.RunQuery(Query, MakeAnyLenString(&Query, "SELECT bot_name, zone_name FROM botleader WHERE leaderid=%i", characterID), ErrBuf, &DatasetResult)) {
			*errorMessage = std::string(ErrBuf);
		}
		else {
			uint32 RowCount = mysql_num_rows(DatasetResult);

			if(RowCount > 0) {
				for(int iCounter = 0; iCounter < RowCount; iCounter++) {
					DataRow = mysql_fetch_row(DatasetResult);
					SpawnedBotsList TempSpawnedBotsList;
					TempSpawnedBotsList.BotLeaderCharID = characterID;
					strcpy(TempSpawnedBotsList.BotName, DataRow[0]);
					strcpy(TempSpawnedBotsList.ZoneName, DataRow[1]);

					Result.push_back(TempSpawnedBotsList);
				}
			}

			mysql_free_result(DatasetResult);
		}

		safe_delete_array(Query);
	}

	return Result;
}

void Bot::SaveBotGroups(uint32 groupID, uint32 characterID, uint32 botID, uint16 slotID, std::string* errorMessage) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;

	if(!database.RunQuery(query, MakeAnyLenString(&query, "INSERT into botgroups (groupid, charid, botid, slot) values (%i, %i, %i, %i)", groupID, characterID, botID, slotID), errbuf)) {
		*errorMessage = std::string(errbuf);
	}

	safe_delete_array(query);
}

void Bot::DeleteBotGroups(uint32 characterID, std::string* errorMessage) {
	char errbuf[MYSQL_ERRMSG_SIZE];
	char *query = 0;

	if(!database.RunQuery(query, MakeAnyLenString(&query, "DELETE FROM botgroups where charid=%i", characterID), errbuf)) {
		*errorMessage = std::string(errbuf);
	}

	safe_delete_array(query);
}

std::list<BotGroup> Bot::LoadBotGroups(uint32 characterID, std::string* errorMessage) {
	std::list<BotGroup> Result;
	char ErrBuf[MYSQL_ERRMSG_SIZE];
	char* Query = 0;
	MYSQL_RES* DatasetResult;
	MYSQL_ROW DataRow;

	if(characterID > 0) {
		if(!database.RunQuery(Query, MakeAnyLenString(&Query, "SELECT groupid, botid FROM botgroups WHERE charid=%i ORDER BY charid, groupid, slot", characterID), ErrBuf, &DatasetResult)) {
			*errorMessage = std::string(ErrBuf);
		}
		else {
			uint32 RowCount = mysql_num_rows(DatasetResult);

			if(RowCount > 0) {
				for(int iCounter = 0; iCounter < RowCount; iCounter++) {
					DataRow = mysql_fetch_row(DatasetResult);

					if(DataRow) {
						BotGroup TempBotGroup;
						TempBotGroup.CharacterID = characterID;
						TempBotGroup.GroupID = atoi(DataRow[0]);
						TempBotGroup.BotID = atoi(DataRow[1]);

						Result.push_back(TempBotGroup);
					}
				}
			}

			mysql_free_result(DatasetResult);
		}

		safe_delete_array(Query);
	}

	return Result;
}

uint32 Bot::AllowedBotSpawns(uint32 botOwnerCharacterID, std::string* errorMessage) {
	uint32 Result = 0;

	if(botOwnerCharacterID > 0) {
		char ErrBuf[MYSQL_ERRMSG_SIZE];
		char* Query = 0;
		MYSQL_RES* DatasetResult;
		MYSQL_ROW DataRow;

		if(database.RunQuery(Query, MakeAnyLenString(&Query, "SELECT value FROM quest_globals WHERE name='bot_spawn_limit' and charid=%i", botOwnerCharacterID), ErrBuf, &DatasetResult)) {
			if(mysql_num_rows(DatasetResult) == 1) {
				DataRow = mysql_fetch_row(DatasetResult);
				if(DataRow)
					Result = atoi(DataRow[0]);
			}

			mysql_free_result(DatasetResult);
		}
		else
			*errorMessage = std::string(ErrBuf);

		safe_delete_array(Query);
	}

	return Result;
}
	
uint32 Bot::SpawnedBotCount(uint32 botOwnerCharacterID, std::string* errorMessage) {
	uint32 Result = 0;

	if(botOwnerCharacterID > 0) {
		std::list<Bot*> SpawnedBots = entity_list.GetBotsByBotOwnerCharacterID(botOwnerCharacterID);

		Result = SpawnedBots.size();
	}

	return Result;
}

uint32 Bot::GetBotOwnerCharacterID(uint32 botID, std::string* errorMessage) {
	uint32 Result = 0;

	if(botID > 0) {
		char ErrBuf[MYSQL_ERRMSG_SIZE];
		char* Query = 0;
		MYSQL_RES* DatasetResult;
		MYSQL_ROW DataRow;

		if(database.RunQuery(Query, MakeAnyLenString(&Query, "SELECT BotOwnerCharacterID FROM bots WHERE BotID = %u", botID), ErrBuf, &DatasetResult)) {
			if(mysql_num_rows(DatasetResult) == 1) {
				if(DataRow = mysql_fetch_row(DatasetResult))
					Result = atoi(DataRow[0]);
			}

			mysql_free_result(DatasetResult);
		}
		else
			*errorMessage = std::string(ErrBuf);

		safe_delete_array(Query);
	}

	return Result;
}

std::string Bot::ClassIdToString(uint16 classId) {
	std::string Result;

	if(classId > 0 && classId < 17) {
		switch(classId) {
			case 1:
				Result = std::string("Warrior");
				break;
			case 2:
				Result = std::string("Cleric");
				break;
			case 3:
				Result = std::string("Paladin");
				break;
			case 4:
				Result = std::string("Ranger");
				break;
			case 5:
				Result = std::string("Shadowknight");
				break;
			case 6:
				Result = std::string("Druid");
				break;
			case 7:
				Result = std::string("Monk");
				break;
			case 8:
				Result = std::string("Bard");
				break;
			case 9:
				Result = std::string("Rogue");
				break;
			case 10:
				Result = std::string("Shaman");
				break;
			case 11:
				Result = std::string("Necromancer");
				break;
			case 12:
				Result = std::string("Wizard");
				break;
			case 13:
				Result = std::string("Magician");
				break;
			case 14:
				Result = std::string("Enchanter");
				break;
			case 15:
				Result = std::string("Beastlord");
				break;
			case 16:
				Result = std::string("Berserker");
				break;
		}
	}

	return Result;
}

std::string Bot::RaceIdToString(uint16 raceId) {
	std::string Result;

	if(raceId > 0) {
		switch(raceId) {
			case 1:
				Result = std::string("Human");
				break;
			case 2:
				Result = std::string("Barbarian");
				break;
			case 3:
				Result = std::string("Erudite");
				break;
			case 4:
				Result = std::string("Wood Elf");
				break;
			case 5:
				Result = std::string("High Elf");
				break;
			case 6:
				Result = std::string("Dark Elf");
				break;
			case 7:
				Result = std::string("Half Elf");
				break;
			case 8:
				Result = std::string("Dwarf");
				break;
			case 9:
				Result = std::string("Troll");
				break;
			case 10:
				Result = std::string("Ogre");
				break;
			case 11:
				Result = std::string("Halfling");
				break;
			case 12:
				Result = std::string("Gnome");
				break;
			case 128:
				Result = std::string("Iksar");
				break;
			case 130:
				Result == std::string("Vah Shir");
				break;
			case 330:
				Result = std::string("Froglok");
				break;
		}
	}

	return Result;
}

void Bot::SendBotArcheryWearChange(int8 material_slot, uint32 material, uint32 color) {
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_WearChange, sizeof(WearChange_Struct));
	WearChange_Struct* wc = (WearChange_Struct*)outapp->pBuffer;

	wc->spawn_id = GetID();
	wc->material = material;
	wc->color.color = color;
	wc->wear_slot_id = material_slot;

	entity_list.QueueClients(this, outapp);
	safe_delete(outapp);
}

// Returns the item id that is in the bot inventory collection for the specified slot.
uint32 Bot::GetBotItem(uint32 slotID) {
	uint32 Result = 0;

	if(slotID > 0 && !_botInventory.empty()) {
		BotInventory::iterator invItr = _botInventory.begin();

		invItr = _botInventory.find(slotID);

		if(invItr != _botInventory.end())
			Result = invItr->second;
	}

	return Result;
}

// Adds the specified item it bot to the NPC equipment array and to the bot inventory collection.
void Bot::BotAddEquipItem(int slot, uint32 id) {
	if(slot > 0 && id > 0) {
		int8 materialFromSlot = Inventory::CalcMaterialFromSlot(slot);

		if(materialFromSlot != 0xFF) {
			equipment[materialFromSlot] = id;
			SendWearChange(materialFromSlot);
		}

		_botInventory.insert(BotInventoryItem(slot, id));
	}
}

// Erases the specified item from bot the NPC equipment array and from the bot inventory collection.
void Bot::BotRemoveEquipItem(int slot) {
	if(slot > 0) {
		int8 materialFromSlot = Inventory::CalcMaterialFromSlot(slot);

		if(materialFromSlot != 0xFF) {
			equipment[materialFromSlot] = 0;
			SendWearChange(materialFromSlot);
		}

		_botInventory.erase(slot);
	}
}

void Bot::BotTradeSwapItem(Client* client, sint16 lootSlot, uint32 id, sint16 maxCharges, uint32 equipableSlots, std::string* errorMessage, bool swap) {
	const Item_Struct* itmtmp = database.GetItem(this->GetBotItemBySlot(lootSlot, errorMessage));
	
	if(!errorMessage->empty())
		return;

	const ItemInst* insttmp = new ItemInst(itmtmp, itmtmp->MaxCharges);
	client->PushItemOnCursor(*insttmp, true);
	safe_delete(insttmp);
	
	// Remove the item from the bot and from the bot's database records
	RemoveBotItemBySlot(lootSlot, errorMessage);

	if(!errorMessage->empty())
		return;

	this->BotRemoveEquipItem(lootSlot);

	if(swap) {
		BotTradeAddItem(id, maxCharges, equipableSlots, lootSlot, errorMessage);

		if(!errorMessage->empty())
			return;
	}
}

void Bot::BotTradeAddItem(uint32 id, sint16 maxCharges, uint32 equipableSlots, int16 lootSlot, std::string* errorMessage, bool addToDb) {
	if(addToDb) {
		this->SetBotItemInSlot(lootSlot, id, errorMessage);
		if(!errorMessage->empty())
			return;
	}

	this->BotAddEquipItem(lootSlot, id);
}

bool Bot::Bot_Command_Resist(int resisttype, int level) {
	int resistid = 0;
	switch(resisttype) {
		case 1: // Poison Cleric
			if(level >= 30) {
				resistid = 62;
			}
			else if(level >= 6) {
				resistid = 227;
			}
			break;
		case 2: // Disease Cleric
			if(level >= 36) {
				resistid = 63;
			}
			else if(level >= 11) {
				resistid = 226;
			}
			break;
		case 3: // Fire Cleric
			if(level >= 33) {
				resistid = 60;
			}
			else if(level >= 8) {
				resistid = 224;
			}
			break;
		case 4: // Cold Cleric
			if(level >= 38) {
				resistid = 61;
			}
			else if(level >= 13) {
				resistid = 225;
			}
			break;
		case 5: // Magic Cleric
			if(level >= 43) {
				resistid = 64;
			}
			else if(level >= 16) {
				resistid = 228;
			}
			break;
		case 6: // Magic Enchanter
			if(level >= 37) {
				resistid = 64;
			}
			else if(level >= 17) {
				resistid = 228;
			}
			break;
		case 7: // Poison Druid
			if(level >= 44) {
				resistid = 62;
			}
			else if(level >= 19) {
				resistid = 227;
			}
			break;
		case 8: // Disease Druid
			if(level >= 44) {
				resistid = 63;
			}
			else if(level >= 19) {
				resistid = 226;
			}
			break;
		case 9: // Fire Druid
			if(level >= 20) {
				resistid = 60;
			}
			else if(level >= 1) {
				resistid = 224;
			}
			break;
		case 10: // Cold Druid
			if(level >= 30) {
				resistid = 61;
			}
			else if(level >= 9) {
				resistid = 225;
			}
			break;
		case 11: // Magic Druid
			if(level >= 49) {
				resistid = 64;
			}
			else if(level >= 34) {
				resistid = 228;
			}
			break;
		case 12: // Poison Shaman
			if(level >= 35) {
				resistid = 62;
			}
			else if(level >= 20) {
				resistid = 227;
			}
			break;
		case 13: // Disease Shaman
			if(level >= 30) {
				resistid = 63;
			}
			else if(level >= 8) {
				resistid = 226;
			}
			break;
		case 14: // Fire Shaman
			if(level >= 27) {
				resistid = 60;
			}
			else if(level >= 5) {
				resistid = 224;
			}
			break;
		case 15: // Cold Shaman
			if(level >= 24) {
				resistid = 61;
			}
			else if(level >= 1) {
				resistid = 225;
			}
			break;
		case 16: // Magic Shaman
			if(level >= 43) {
				resistid = 64;
			}
			else if(level >= 19) {
				resistid = 228;
			}
			break;
	}
	if(resistid > 0) {
		if(GetBotRaidID()) {
			BotRaids* br = entity_list.GetBotRaidByMob(this);
			if(br) {
				for(int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
					Group* gr = br->BotRaidGroups[i];
					if(gr) {
						for(int j=0; j<MAX_GROUP_MEMBERS; j++) {
							if(gr->members[j]) {
								SpellOnTarget(resistid, gr->members[j]);
							}
						}
					}
				}
			}
		}
		else {
			Group* g = GetGroup();
			if(g) {
				for(int k=0; k<MAX_GROUP_MEMBERS; k++) {
					if(g->members[k]) {
						SpellOnTarget(resistid, g->members[k]);
					}
				}
				return true;
			}
		}
	}
	return false;
}

bool Bot::RemoveBotFromGroup(Bot* bot, Group* group) {
	bool Result = false;

	if(bot && group) {
		bot->SetFollowID(0);
		if(group->DelMember(bot))
			database.SetGroupID(bot->GetCleanName(), 0, bot->GetBotID());

		if(group->GroupCount() <= 1)
			group->DisbandGroup();

		std::string errorMessage;

		// This tells the server that this bot will camp instead of zone when its bow owner leaves the zone
		DeactivateBot(bot, &errorMessage);

		if(!errorMessage.empty()) {
			// TODO: log this error message to the zone error log
		}

		Result = true;
	}

	return Result;
}

bool Bot::AddBotToGroup(Bot* bot, Group* group) {
	bool Result = false;

	if(bot && group) {
		// Remove any existing group records
		database.SetGroupID(bot->GetCleanName(), 0, bot->GetBotID());

		// Add bot to this group
		if(group->AddMember(bot)) {
			if(group->GetLeader()) {
				bot->SetFollowID(group->GetLeader()->GetID());

				// Need to send this only once when a group is formed with a bot so the client knows it is also the group leader
				if(group->GroupCount() == 2) {
					Mob *TempLeader = group->GetLeader();
					group->SendUpdate(groupActUpdate, TempLeader);
				}

				std::string errorMessage;

				// This tells the server that this bot will be zoned and not camped when the bot owner leaves the zone, unless the owner camps
				ActivateBot(bot, &errorMessage);

				if(!errorMessage.empty()) {
					// TODO: log this error message to the zone error log
				}
			}

			Result = true;
		}
	}

	return Result;
}

bool Bot::Bot_Command_CharmTarget(int charmtype, Mob *target) {
	int charmid = 0;
	int charmlevel = GetLevel();
	if(target) {
		switch(charmtype) {
			case 1: // Enchanter
				if((charmlevel >= 64) && (charmlevel <= 75)) {
					charmid = 3355;
				}
				else if((charmlevel >= 62) && (charmlevel <= 63)) {
					charmid = 3347;
				}
				else if((charmlevel >= 60) && (charmlevel <= 61)) {
					charmid = 1707;
				}
				else if((charmlevel >= 53) && (charmlevel <= 59)) {
					charmid = 1705;
				}
				else if((charmlevel >= 37) && (charmlevel <= 52)) {
					charmid = 183;
				}
				else if((charmlevel >= 23) && (charmlevel <= 36)) {
					charmid = 182;
				}
				else if((charmlevel >= 11) && (charmlevel <= 22)) {
					charmid = 300;
				}
				break;
			case 2: // Necromancer
				if((charmlevel >= 60) && (charmlevel <= 75)) {
					charmid = 1629;
				}
				else if((charmlevel >=47) && (charmlevel <= 59)) {
					charmid = 198;
				}
				else if((charmlevel >= 31) && (charmlevel <= 46)) {
					charmid = 197;
				}
				else if((charmlevel >= 18) && (charmlevel <= 30)) {
					charmid = 196;
				}
				break;
			case 3: // Druid
				if((charmlevel >= 63) && (charmlevel <= 75)) {
					charmid = 3445;
				}
				else if((charmlevel >= 55) && (charmlevel <= 62)) {
					charmid = 1556;
				}
				else if((charmlevel >= 52) && (charmlevel <= 54)) {
					charmid = 1553;
				}
				else if((charmlevel >= 43) && (charmlevel <= 51)) {
					charmid = 142;
				}
				else if((charmlevel >= 33) && (charmlevel <= 42)) {
					charmid = 141;
				}
				else if((charmlevel >= 23) && (charmlevel <= 32)) {
					charmid = 260;
				}
				else if((charmlevel >= 13) && (charmlevel <= 22)) {
					charmid = 242;
				}
				break;
		}
		if(charmid > 0) {
			int32 DontRootMeBeforeTime = 0;
			CastSpell(charmid, target->GetID(), 1, -1, -1, &DontRootMeBeforeTime);
			target->SetDontRootMeBefore(DontRootMeBeforeTime);
			return true;
		}
	}
	return false;
}

bool Bot::Bot_Command_DireTarget(int diretype, Mob *target) {
	int direid = 0;
	int direlevel = GetLevel();
	if(target) {
		switch(diretype) {
			case 1: // Enchanter
				if(direlevel >= 65) {
					direid = 5874;
				}
				else if(direlevel >= 55) {
					direid = 2761;
				}
				break;
			case 2: // Necromancer
				if(direlevel >= 65) {
					direid = 5876;
				}
				else if(direlevel >= 55) {
					direid = 2759;
				}
				break;
			case 3: // Druid
				if(direlevel >= 65) {
					direid = 5875;
				}
				else if(direlevel >= 55) {
					direid = 2760;
				}
				break;
		}
		if(direid > 0) {
			int32 DontRootMeBeforeTime = 0;
			CastSpell(direid, target->GetID(), 1, -1, -1, &DontRootMeBeforeTime);
			target->SetDontRootMeBefore(DontRootMeBeforeTime);
			return true;
		}
	}
	return false;
}

bool Bot::Bot_Command_CalmTarget(Mob *target) {
	if(target) {
		int calmid = 0;
		int calmlevel = GetLevel();
		if((calmlevel >= 67) && (calmlevel <= 75)) {
			calmid = 5274;
		}
		else if((calmlevel >= 62) && (calmlevel <= 66)) {
			calmid = 3197;
		}
		else if((calmlevel >= 35) && (calmlevel <= 61)) {
			calmid = 45;
		}
		else if((calmlevel >= 18) && (calmlevel <= 34)) {
			calmid = 47;
		}
		else if((calmlevel >= 6) && (calmlevel <= 17)) {
			calmid = 501;
		}
		else if((calmlevel >= 1) && (calmlevel <= 5)) {
			calmid = 208;
		}
		if(calmid > 0) {
			int32 DontRootMeBeforeTime = 0;
			CastSpell(calmid, target->GetID(), 1, -1, -1, &DontRootMeBeforeTime);
			target->SetDontRootMeBefore(DontRootMeBeforeTime);
			return true;
		}
	}
	return false;
}

bool Bot::Bot_Command_RezzTarget(Mob *target) {
	if(target) {
		int rezid = 0;
		int rezlevel = GetLevel();
		if(rezlevel >= 56) {
			rezid = 1524;
		}
		else if(rezlevel >= 47) {
			rezid = 392;
		}
		else if(rezlevel >= 42) {
			rezid = 2172;
		}
		else if(rezlevel >= 37) {
			rezid = 388;
		}
		else if(rezlevel >= 32) {
			rezid = 2171;
		}
		else if(rezlevel >= 27) {
			rezid = 391;
		}
		else if(rezlevel >= 22) {
			rezid = 2170;
		}
		else if(rezlevel >= 18) {
			rezid = 2169;
		}
		if(rezid > 0) {
			int32 DontRootMeBeforeTime = 0;
			CastSpell(rezid, target->GetID(), 1, -1, -1, &DontRootMeBeforeTime);
			target->SetDontRootMeBefore(DontRootMeBeforeTime);
			return true;
		}
	}
	return false;
}

bool Bot::Bot_Command_Cure(int curetype, int level) {
	int cureid = 0;
	switch(curetype) {
		case 1: // Poison
			if(level >= 58) {
				cureid = 1525;
			}
			else if(level >= 48) {
				cureid = 97;
			}
			else if(level >= 22) {
				cureid = 95;
			}
			else if(level >= 1) {
				cureid = 203;
			}
			break;
		case 2: // Disease
			if(level >= 51) {
				cureid = 3693;
			}
			else if(level >= 28) {
				cureid = 96;
			}
			else if(level >= 4) {
				cureid = 213;
			}
			break;
		case 3: // Curse
			if(level >= 54) {
				cureid = 2880;
			}
			else if(level >= 38) {
				cureid = 2946;
			}
			else if(level >= 23) {
				cureid = 4057;
			}
			else if(level >= 8) {
				cureid = 4056;
			}
			break;
		case 4: // Blindness
			if(level >= 3) {
				cureid = 212;
			}
			break;
	}
	if(cureid > 0) {
		if(GetBotRaidID()) {
			BotRaids* br = entity_list.GetBotRaidByMob(this);
			if(br) {
				for(int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
					Group* gr = br->BotRaidGroups[i];
					if(gr) {
						for(int j=0; j<MAX_GROUP_MEMBERS; j++) {
							if(gr->members[j]) {
								SpellOnTarget(cureid, gr->members[j]);
							}
						}
					}
				}
			}
		}
		else {
			Group* g = GetGroup();
			if(g) {
				for(int k=0; k<MAX_GROUP_MEMBERS; k++) {
					if(g->members[k]) {
						SpellOnTarget(cureid, g->members[k]);
					}
				}
				return true;
			}
		}
	}
	return false;
}

// Completes a trade with a client bot owner
void Bot::FinishTrade(Client* client, botTradeType tradeType) {
	if(client) {
		if(tradeType == botTradeClientNormal) {
			// Items being traded are found in the normal trade window used to trade between a Client and a Client or NPC
			// Items in this mode are found in slot ids 3000 thru 3003
			PerformTradeWithClient(3000, 3003, client);
		}
		else if(tradeType == botTradeClientNoDropNoTrade) {
			// Items being traded are found on the Client's cursor slot, slot id 30. This item can be either a single item or it can be a bag.
			// If it is a bag, then we have to search for items in slots 331 thru 340
			PerformTradeWithClient(SLOT_CURSOR, SLOT_CURSOR, client);

			// TODO: Add logic here to test if the item in SLOT_CURSOR is a container type, if it is then we need to call the following:
			// PerformTradeWithClient(331, 340, client);
		}
	}
}

// Perfoms the actual trade action with a client bot owner
void Bot::PerformTradeWithClient(sint16 beginSlotID, sint16 endSlotID, Client* client) {
	if(client) {
		// TODO: Figure out what the actual max slot id is
		const int MAX_SLOT_ID = 3179;
		int32 items[MAX_SLOT_ID] = {0};
		int8 charges[MAX_SLOT_ID] = {0};
		bool botCanWear[MAX_SLOT_ID] = {0};
		
		for(sint16 i = beginSlotID; i <= endSlotID; i++) {
			bool BotCanWear = false;
			bool UpdateClient = false;

			Inventory& clientInventory = client->GetInv();
			const ItemInst* inst = clientInventory[i];
			if(inst) {
				items[i] = inst->GetItem()->ID;
				charges[i] = inst->GetCharges();
			}

			if(i == SLOT_CURSOR)
				UpdateClient = true;

			//EQoffline: will give the items to the bots and change the bot stats
			if(inst && this->GetBotOwner() == client->CastToMob()) {
				std::string TempErrorMessage;
				const Item_Struct* mWeaponItem = inst->GetItem();
				if(mWeaponItem && inst->IsEquipable(GetBaseRace(), GetClass()) && (GetLevel() >= mWeaponItem->ReqLevel)) { // Angelox
					BotCanWear = true;
					botCanWear[i] = BotCanWear;

					const char* equipped[22] = {"Charm", "Left Ear", "Head", "Face", "Right Ear", "Neck", "Shoulders", "Arms", "Back",
						"Left Wrist", "Right Wrist", "Range", "Hands", "Primary Hand", "Secondary Hand",
						"Left Finger", "Right Finger", "Chest", "Legs", "Feet", "Waist", "Ammo" };
					for(int j=0;j<22;j++) {
						if(inst->IsSlotAllowed(j)) {
							if(j==SLOT_EAR01 || j==SLOT_EAR02) { // earrings
								if(GetBotItemBySlot(SLOT_EAR02, &TempErrorMessage) == 0) {
									// If the right ear is empty lets put the earring there
									BotTradeAddItem(mWeaponItem->ID, mWeaponItem->MaxCharges, mWeaponItem->Slots, SLOT_EAR02, &TempErrorMessage);
								}
								else if(GetBotItemBySlot(SLOT_EAR01, &TempErrorMessage) == 0) {
									// The right ear is being used, lets put it in the empty left ear
									BotTradeAddItem(mWeaponItem->ID, mWeaponItem->MaxCharges, mWeaponItem->Slots, SLOT_EAR01, &TempErrorMessage);
								}
								else {
									// both ears are equipped, so swap out the left ear
									BotTradeSwapItem(client, SLOT_EAR01, inst->GetID(), mWeaponItem->MaxCharges, mWeaponItem->Slots, &TempErrorMessage);
									this->Say("I was using this in my %s but OK, you can have it back.", equipped[SLOT_EAR01]);
								}
								break;
							}
							else if(j==SLOT_BRACER01 || j==SLOT_BRACER02) { // bracers
								if(GetBotItemBySlot(SLOT_BRACER02, &TempErrorMessage) == 0) {
									// If the right wrist is empty lets put the bracer there
									BotTradeAddItem(mWeaponItem->ID, mWeaponItem->MaxCharges, mWeaponItem->Slots, SLOT_BRACER02, &TempErrorMessage);
								}
								else if(GetBotItemBySlot(SLOT_BRACER01, &TempErrorMessage) == 0) {
									// The right wrist is equipped, lets put it in the empty left wrist
									BotTradeAddItem(mWeaponItem->ID, mWeaponItem->MaxCharges, mWeaponItem->Slots, SLOT_BRACER01, &TempErrorMessage);
								}
								else {
									// both wrists are equipped, so swap out the left wrist
									BotTradeSwapItem(client, SLOT_BRACER01, inst->GetID(), mWeaponItem->MaxCharges, mWeaponItem->Slots, &TempErrorMessage);
									Say("I was using this in my %s but OK, you can have it back.", equipped[SLOT_BRACER01]);
								}
								break;
							}
							else if(j == SLOT_PRIMARY) { // primary melee weapons
								SetBotArcher(false);
								const Item_Struct* itmwp = database.GetItem(inst->GetID());
								if((GetBotItemBySlot(SLOT_PRIMARY, &TempErrorMessage) == 0)) {
									// if the primary hand is empty, lets put the item there
									BotTradeAddItem(mWeaponItem->ID, mWeaponItem->MaxCharges, mWeaponItem->Slots, SLOT_PRIMARY, &TempErrorMessage);
									if((itmwp->ItemType == ItemType2HS) || (itmwp->ItemType == ItemType2HB) || (itmwp->ItemType == ItemType2HPierce)) {
										// if the primary item is a two-hander, and the left hand is equipped, lets remove the item in the left hand
										if(GetBotItemBySlot(SLOT_SECONDARY, &TempErrorMessage) != 0) {
											BotTradeSwapItem(client, SLOT_SECONDARY, inst->GetID(), mWeaponItem->MaxCharges, mWeaponItem->Slots, &TempErrorMessage, false);
											Say("I was using this in my %s but OK, you can have it back.", equipped[SLOT_SECONDARY]);
										}
									}
								}
								else if((GetBotItemBySlot(SLOT_PRIMARY, &TempErrorMessage) != 0)) {
									if((itmwp->ItemType == ItemType2HS) || (itmwp->ItemType == ItemType2HB) || (itmwp->ItemType == ItemType2HPierce)) {
										// if the primary hand is equipped and the new item is a two-hander, lets remove the old primary item
										BotTradeSwapItem(client, SLOT_PRIMARY, inst->GetID(), mWeaponItem->MaxCharges, mWeaponItem->Slots, &TempErrorMessage);
										Say("I was using this in my %s but OK, you can have it back.", equipped[SLOT_PRIMARY]);
										if((GetBotItemBySlot(SLOT_SECONDARY, &TempErrorMessage) != 0)) {
											// if the new primary item is a two-hander, and the secondary hand is equipped, remove the secondary hand item
											BotTradeSwapItem(client, SLOT_SECONDARY, inst->GetID(), mWeaponItem->MaxCharges, mWeaponItem->Slots, &TempErrorMessage, false);
											Say("I was using this in my %s but OK, you can have it back.", equipped[SLOT_SECONDARY]);
										}
									}
									else if((GetBotItemBySlot(SLOT_SECONDARY, &TempErrorMessage) == 0) && inst->IsSlotAllowed(SLOT_SECONDARY)) {
										// Make sure to not equip weapons in the offhand of non-dual wielding classes
										if(inst->IsWeapon() && !CanThisClassDualWield()) {
											Say("I cannot dual wield.");
											client->PushItemOnCursor(*inst, true);
											client->DeleteItemInInventory(i, 0, UpdateClient);
											return;
										}
										const Item_Struct* itmtmp = database.GetItem(GetBotItemBySlot(SLOT_PRIMARY, &TempErrorMessage));
										if((itmtmp->ItemType == ItemType2HS) || (itmtmp->ItemType == ItemType2HB) || (itmtmp->ItemType == ItemType2HPierce)) {
											// if the primary hand is equpped with a two-hander and the secondary is free, remove the existing primary hand item
											BotTradeSwapItem(client, SLOT_PRIMARY, inst->GetID(), mWeaponItem->MaxCharges, mWeaponItem->Slots, &TempErrorMessage, false);
											Say("I was using this 2 Handed Weapon... but OK, you can have it back.");
										}
										// put the new item in the secondary hand
										BotTradeAddItem(mWeaponItem->ID, mWeaponItem->MaxCharges, mWeaponItem->Slots, SLOT_SECONDARY, &TempErrorMessage);
									}
									else if((GetBotItemBySlot(SLOT_SECONDARY, &TempErrorMessage) != 0) && inst->IsSlotAllowed(SLOT_SECONDARY) ) {
										// Make sure to not equip weapons in the offhand of non-dual wielding classes
										if(inst->IsWeapon() && !CanThisClassDualWield()) {
											Say("I cannot dual wield.");
											client->PushItemOnCursor(*inst, true);
											client->DeleteItemInInventory(i, 0, UpdateClient);
											return;
										}
										// the primary and secondary hands are equipped, swap out the secondary hand item with the new item
										BotTradeSwapItem(client, SLOT_SECONDARY, inst->GetID(), mWeaponItem->MaxCharges, mWeaponItem->Slots, &TempErrorMessage);
										Say("I was using this in my %s but OK, you can have it back.", equipped[SLOT_SECONDARY]);
									}
									else {
										Say("Use '#bot inventory remove 13' to remove the primary weapon.");
										client->PushItemOnCursor(*inst, true);
										client->DeleteItemInInventory(i, 0, UpdateClient);
										return;
									}
								}
								break;
							}
							else if(j == SLOT_SECONDARY) { // Secondary Hand
								SetBotArcher(false);
								// Make sure to not equip weapons in the offhand of non-dual wielding classes
								if(inst->IsWeapon() && !CanThisClassDualWield()) {
									Say("I cannot dual wield.");
									client->PushItemOnCursor(*inst, true);
									client->DeleteItemInInventory(i, 0, UpdateClient);
									return;
								}
								const Item_Struct* itmtmp = database.GetItem(GetBotItemBySlot(SLOT_PRIMARY, &TempErrorMessage));
								if(itmtmp && ((itmtmp->ItemType == ItemType2HS) || (itmtmp->ItemType == ItemType2HB) || (itmtmp->ItemType == ItemType2HPierce))) {
									// If the primary hand item is a two-hander, remove it
									BotTradeSwapItem(client, SLOT_PRIMARY, inst->GetID(), mWeaponItem->MaxCharges, mWeaponItem->Slots, &TempErrorMessage, false);
									Say("I was using a 2 Handed weapon... but OK, you can have it back.");
								}
								if((GetBotItemBySlot(SLOT_SECONDARY, &TempErrorMessage) == 0)) {
									// if the secondary hand is free, equip it with the new item
									BotTradeAddItem(mWeaponItem->ID, mWeaponItem->MaxCharges, mWeaponItem->Slots, SLOT_SECONDARY, &TempErrorMessage);
								}
								else {
									// The primary and secondary hands are equipped, just swap out the secondary item with the new item
									BotTradeSwapItem(client, SLOT_SECONDARY, inst->GetID(), mWeaponItem->MaxCharges, mWeaponItem->Slots, &TempErrorMessage);
									Say("I was using this in my %s but OK, you can have it back.", equipped[SLOT_SECONDARY]);
								}
								break;
							}
							else if(j==SLOT_RING01 || j==SLOT_RING02) { // rings
								if(GetBotItemBySlot(SLOT_RING02, &TempErrorMessage) == 0) {
									// If the right finger is empty lets put the ring there
									BotTradeAddItem(mWeaponItem->ID, mWeaponItem->MaxCharges, mWeaponItem->Slots, SLOT_RING02, &TempErrorMessage);
								}
								else if(GetBotItemBySlot(SLOT_RING01, &TempErrorMessage) == 0) {
									// The right finger is equipped, lets put it on the empty left finger
									BotTradeAddItem(mWeaponItem->ID, mWeaponItem->MaxCharges, mWeaponItem->Slots, SLOT_RING01, &TempErrorMessage);
								}
								else {
									// both fingers are equipped, so swap out the left finger
									BotTradeSwapItem(client, SLOT_RING01, inst->GetID(), mWeaponItem->MaxCharges, mWeaponItem->Slots, &TempErrorMessage);
									Say("I was using this in my %s but OK, you can have it back.", equipped[SLOT_RING01]);
								}
								break;
							}
							if((j == SLOT_AMMO) || (j == SLOT_RANGE)) {
								SetBotArcher(false);
							}
							if(GetBotItemBySlot(j, &TempErrorMessage) != 0) {
								// remove existing item if equipped
								BotTradeSwapItem(client, j, inst->GetID(), mWeaponItem->MaxCharges, mWeaponItem->Slots, &TempErrorMessage, false);
								Say("Thanks! Here, take this other one back.");
							}
							// put the item in the slot
							BotTradeAddItem(mWeaponItem->ID, mWeaponItem->MaxCharges, mWeaponItem->Slots, j, &TempErrorMessage);
							break;
						}
					}
					CalcBotStats();
				}
			}
			if(inst) {
				if(!botCanWear[i]) {
					client->PushItemOnCursor(*inst, true);
				}
				client->DeleteItemInInventory(i, 0, UpdateClient);
			}
		}

		// TODO: I dont understand whats going on here with item2
		// I assume this is some type of security check?
		int xy = CountLoot();

		for(int y=0; y < 4; y++) {
			if(xy >= 23) {
				break;
			}

			const Item_Struct* item2 = database.GetItem(items[y]);

			if (item2) {
				if(botCanWear[y]) {
					Say("Thank you for the %s, %s.", item2->Name,  client->GetName());
				}
				else {
					Say("I can't use this %s!", item2->Name);
				}
			}
		}
	}
}

void Bot::Death(Mob *killerMob, sint32 damage, int16 spell_id, SkillType attack_skill) {
	NPC::Death(killerMob, damage, spell_id, attack_skill);

	Save();

	Mob *give_exp = hate_list.GetDamageTop(this);
	Client *give_exp_client = NULL;

	if(give_exp && give_exp->IsClient())
		give_exp_client = give_exp->CastToClient();

	bool IsLdonTreasure = (this->GetClass() == LDON_TREASURE);

	if (give_exp_client && !IsCorpse() && MerchantType == 0)
	{
		Group *kg = entity_list.GetGroupByClient(give_exp_client);
		Raid *kr = entity_list.GetRaidByClient(give_exp_client);

		if(!kr && give_exp_client->IsClient() && give_exp_client->GetBotRaidID() > 0) {

			BotRaids *br = entity_list.GetBotRaidByMob(give_exp_client->CastToMob());
			if(br) {
				if(!IsLdonTreasure)
					br->SplitExp((EXP_FORMULA), this);

				if(br->GetBotMainTarget() == this)
					br->SetBotMainTarget(NULL);

				/* Send the EVENT_KILLED_MERIT event for all raid members */
				if(br->BotRaidGroups[0]) {
					for(int j=0; j<MAX_GROUP_MEMBERS; j++) {
						if(br->BotRaidGroups[0]->members[j] && br->BotRaidGroups[0]->members[j]->IsClient()) {
							parse->Event(EVENT_KILLED_MERIT, GetNPCTypeID(), "killed", this, br->BotRaidGroups[0]->members[j]);
							if(RuleB(TaskSystem, EnableTaskSystem)) {
								br->BotRaidGroups[0]->members[j]->CastToClient()->UpdateTasksOnKill(GetNPCTypeID());
							}
						}
					}
				}
			}
		}
	}

	//corpse->Depop();
	if(entity_list.GetCorpseByID(GetID()))
		entity_list.GetCorpseByID(GetID())->Depop();

	Group *g = GetGroup();
	if(g) {
		for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
			if(g->members[i]) {
				if(g->members[i] == this) {
					// If the leader dies, make the next bot the leader
					// and reset all bots followid
					if(g->IsLeader(g->members[i])) {
						if(g->members[i+1]) {
							g->SetLeader(g->members[i+1]);
							g->members[i+1]->SetFollowID(g->members[i]->GetFollowID());
							for(int j=0; j<MAX_GROUP_MEMBERS; j++) {
								if(g->members[j] && (g->members[j] != g->members[i+1])) {
									g->members[j]->SetFollowID(g->members[i+1]->GetID());
								}
							}
						}
					}

					// delete from group data
					g->membername[i][0] = '\0';
					memset(g->membername[i], 0, 64);
					g->members[i]->SetOwnerID(0);
					g->members[i] = NULL;

					// if group members exist below this one, move
					// them all up one slot in the group list
					int j = i+1;
					for(; j<MAX_GROUP_MEMBERS; j++) {
						if(g->members[j]) {
							g->members[j-1] = g->members[j];
							strcpy(g->membername[j-1], g->members[j]->GetCleanName());
							g->membername[j][0] = '\0';
							memset(g->membername[j], 0, 64);
							g->members[j] = NULL;
						}
					}

					// update the client group
					EQApplicationPacket* outapp = new EQApplicationPacket(OP_GroupUpdate, sizeof(GroupJoin_Struct));
					GroupJoin_Struct* gu = (GroupJoin_Struct*)outapp->pBuffer;
					gu->action = groupActLeave;
					strcpy(gu->membername, GetCleanName());
					if(g) {
						for(int k=0; k<MAX_GROUP_MEMBERS; k++) {
							if(g->members[k] && g->members[k]->IsClient())
								g->members[k]->CastToClient()->QueuePacket(outapp);
						}
					}
					safe_delete(outapp);

					// now that's done, lets see if all we have left is the client
					// and we can clean up the clients raid group and group
					if(GetBotRaidID()) {
						BotRaids* br = entity_list.GetBotRaidByMob(this);
						if(br) {
							if(this == br->botmaintank) {
								br->botmaintank = NULL;
							}
							if(this == br->botsecondtank) {
								br->botsecondtank = NULL;
							}
						}
						if(g->GroupCount() == 0) {
							int32 gid = g->GetID();
							if(br) {
								br->RemoveEmptyBotGroup();
							}
							entity_list.RemoveGroup(gid);
						}
						if(br && (br->RaidBotGroupsCount() == 1)) {
							br->RemoveClientGroup(br->GetRaidBotLeader());
						}
						if(br && (br->RaidBotGroupsCount() == 0)) {
							br->DisbandBotRaid();
						}
					}
				}
			}
		}
	}

	entity_list.RemoveBot(this->GetID());
}

void Bot::Damage(Mob *from, sint32 damage, int16 spell_id, SkillType attack_skill, bool avoidable, sint8 buffslot, bool iBuffTic) {
	if(spell_id==0)
		spell_id = SPELL_UNKNOWN;

	//handle EVENT_ATTACK. Resets after we have not been attacked for 12 seconds
	if(attacked_timer.Check()) {
		mlog(COMBAT__HITS, "Triggering EVENT_ATTACK due to attack by %s", from->GetName());
		parse->Event(EVENT_ATTACK, this->GetBotID(), 0, this, from);
	}

	attacked_timer.Start(CombatEventTimer_expire);
    
	// TODO: A bot doesnt call this, right?
	/*if (!IsEngaged())
		zone->AddAggroMob();*/

	// if spell is lifetap add hp to the caster
	if (spell_id != SPELL_UNKNOWN && IsLifetapSpell(spell_id)) {
		int healed = GetActSpellHealing(spell_id, damage);
		mlog(COMBAT__DAMAGE, "Applying lifetap heal of %d to %s", healed, GetCleanName());
		HealDamage(healed);
		entity_list.MessageClose(this, true, 300, MT_Spells, "%s beams a smile at %s", GetCleanName(), from->GetCleanName() );
	}

	CommonDamage(from, damage, spell_id, attack_skill, avoidable, buffslot, iBuffTic);

	SendHPUpdate();

	// Aggro the bot's group members
	if(IsGrouped()) {
		Group *g = GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
				if(g->members[i] && g->members[i]->IsBot() && !g->members[i]->CheckAggro(from)) {
					g->members[i]->AddToHateList(from, 1);
				}
			}
		}
	}
}

void Bot::AddToHateList(Mob* other, sint32 hate, sint32 damage, bool iYellForHelp, bool bFrenzy, bool iBuffTic) {
	Mob::AddToHateList(other, hate, damage, iYellForHelp, bFrenzy, iBuffTic);
}

bool Bot::Attack(Mob* other, int Hand, bool FromRiposte) {
	_ZP(Bot_Attack);

	if (!other) {
		SetTarget(NULL);
		LogFile->write(EQEMuLog::Error, "A null Mob object was passed to NPC::Attack for evaluation!");
		return false;
	}
	
	if(!GetTarget() || GetTarget() != other)
		SetTarget(other);
	
	mlog(COMBAT__ATTACKS, "Attacking %s with hand %d %s", other?other->GetCleanName():"(NULL)", Hand, FromRiposte?"(this is a riposte)":"");
	
	if ((IsCasting() && (GetClass() != BARD)) ||
		other == NULL ||
		(GetHP() < 0) ||
		(!IsAttackAllowed(other)))
	{
		if(this->GetOwnerID())
			entity_list.MessageClose(this, 1, 200, 10, "%s says, 'That is not a legal target master.'", this->GetCleanName());
		if(other)
			RemoveFromHateList(other);
		mlog(COMBAT__ATTACKS, "I am not allowed to attack %s", other->GetCleanName());
		return false;
	}

	if(DivineAura()) {//cant attack while invulnerable
		mlog(COMBAT__ATTACKS, "Attack canceled, Divine Aura is in effect.");
		return false;
	}
	
	// TODO: Uncomment this block after solved the bug that is assigning a null value to GetTarget() for bots while in combat. Appears to happen at random, but frequently.
	/*if(HasGroup() && _previousTarget != GetTarget()) {
		std::ostringstream attackMessage;
		attackMessage << "Attacking " << other->GetCleanName() << ".";

		GetGroup()->GroupMessage(this, 0, 100, attackMessage.str().c_str());
	}*/

	FaceTarget(GetTarget());

	ItemInst* weapon = NULL;
	const Item_Struct* botweapon = NULL;
	if((Hand == SLOT_PRIMARY) && equipment[MATERIAL_PRIMARY])
	    botweapon = database.GetItem(equipment[MATERIAL_PRIMARY]);
	if((Hand == SLOT_SECONDARY) && equipment[MATERIAL_SECONDARY])
	    botweapon = database.GetItem(equipment[MATERIAL_SECONDARY]);
	if(botweapon != NULL)
		weapon = new ItemInst(botweapon);

	if(weapon != NULL) {
		if (!weapon->IsWeapon()) {
			mlog(COMBAT__ATTACKS, "Attack canceled, Item %s (%d) is not a weapon.", weapon->GetItem()->Name, weapon->GetID());
			safe_delete(weapon);
			return(false);
		}
		mlog(COMBAT__ATTACKS, "Attacking with weapon: %s (%d)", weapon->GetItem()->Name, weapon->GetID());
	} else {
		mlog(COMBAT__ATTACKS, "Attacking without a weapon.");
	}
	
	// calculate attack_skill and skillinuse depending on hand and weapon
	// also send Packet to near clients
	SkillType skillinuse;
	AttackAnimation(skillinuse, Hand, weapon);
	mlog(COMBAT__ATTACKS, "Attacking with %s in slot %d using skill %d", weapon?weapon->GetItem()->Name:"Fist", Hand, skillinuse);
	
	/// Now figure out damage
	int damage = 0;
	int weapon_damage = GetWeaponDamage(other, weapon);
	
	//if weapon damage > 0 then we know we can hit the target with this weapon
	//otherwise we cannot and we set the damage to -5 later on
	if(weapon_damage > 0){
		
		//Berserker Berserk damage bonus
		if((GetHPRatio() < 30) && (GetClass() == BERSERKER)){
			int bonus = 3 + GetLevel()/10;		//unverified
			weapon_damage = weapon_damage * (100+bonus) / 100;
			mlog(COMBAT__DAMAGE, "Berserker damage bonus increases DMG to %d", weapon_damage);
		}

		//try a finishing blow.. if successful end the attack
		if(TryFinishingBlow(other, skillinuse)) {
			safe_delete(weapon);
			return (true);
		}
		
		//damage formula needs some work
		int min_hit = 1;
		int max_hit = (2*weapon_damage*GetDamageTable(skillinuse)) / 100;

		if(GetLevel() < 10 && max_hit > 20)
			max_hit = 20;
		else if(GetLevel() < 20 && max_hit > 40)
			max_hit = 40;

		//if mainhand only, get the bonus damage from level
		if((Hand == SLOT_PRIMARY) && (GetLevel() >= 28) && IsWarriorClass())
		{
			int8 ucDamageBonus = GetWeaponDamageBonus( weapon ? weapon->GetItem() : (const Item_Struct*) NULL );

			min_hit += (int) ucDamageBonus;
			max_hit += (int) ucDamageBonus;
		}

		min_hit = min_hit * (100 + itembonuses.MinDamageModifier + spellbonuses.MinDamageModifier) / 100;

		if(Hand == SLOT_SECONDARY) {
			if((GetClass() == WARRIOR) ||
				(GetClass() == ROGUE) ||
				(GetClass() == MONK) ||
				(GetClass() == RANGER) ||
				(GetClass() == BARD) ||
				(GetClass() == BEASTLORD))
			{
				if(GetLevel() >= 65)
				{ // Sinister Strikes AA
					int sinisterBonus = MakeRandomInt(5, 10);
					min_hit += (min_hit * sinisterBonus / 100);
					max_hit += (max_hit * sinisterBonus / 100);
				}
			}
		}

		if(max_hit < min_hit)
			max_hit = min_hit;

		if(RuleB(Combat, UseIntervalAC))
			damage = max_hit;
		else
			damage = MakeRandomInt(min_hit, max_hit);

		mlog(COMBAT__DAMAGE, "Damage calculated to %d (min %d, max %d, str %d, skill %d, DMG %d, lv %d)",
			damage, min_hit, max_hit, GetSTR(), GetSkill(skillinuse), weapon_damage, GetLevel());

		//check to see if we hit..
		if(!this->CalcBotHitChance(other, skillinuse, Hand)) {
			mlog(COMBAT__ATTACKS, "Attack missed. Damage set to 0.");
			damage = 0;
			other->AddToHateList(this, 0);
		} else {	//we hit, try to avoid it
			other->AvoidDamage(this, damage);
			other->MeleeMitigation(this, damage, min_hit);
			ApplyMeleeDamageBonus(skillinuse, damage);
			TryCriticalHit(other, skillinuse, damage);
			mlog(COMBAT__DAMAGE, "Final damage after all reductions: %d", damage);

			if(damage != 0){
				sint32 hate = max_hit;
				mlog(COMBAT__HITS, "Generating hate %d towards %s", hate, GetCleanName());
				// now add done damage to the hate list
				other->AddToHateList(this, hate);
			}
			else
				other->AddToHateList(this, 0);
		}

		//riposte
		bool slippery_attack = false; // Part of hack to allow riposte to become a miss, but still allow a Strikethrough chance (like on Live)
		if (damage == -3)  {
			if(FromRiposte) {
				safe_delete(weapon);
				return false;
			}
			else {
				
				int saChance = 0;
				if(IsWarriorClass()) {
					if(GetLevel() >= 70)
					{ // Slippery Attacks AA 5
						saChance = 5;
					}
					else if(GetLevel() >= 69)
					{ // Slippery Attacks AA 4
						saChance = 4;
					}
					else if(GetLevel() >= 68)
					{ // Slippery Attacks AA 3
						saChance = 3;
					}
					else if(GetLevel() >= 67)
					{ // Slippery Attacks AA 2
						saChance = 2;
					}
					else if(GetLevel() >= 66)
					{ // Slippery Attacks AA 1
						saChance = 1;
					}
				}
				if ((Hand == SLOT_SECONDARY) && saChance) {// Do we even have it & was attack with mainhand? If not, don't bother with other calculations
					if (MakeRandomInt(0, 100) < (saChance * 20)) {
						damage = 0; // Counts as a miss
						slippery_attack = true;
					}
					else 
						DoRiposte(other);
				}
				else 
					DoRiposte(other);
			}
		}
		
		int aaStrikethroughBonus = 0;
		if(GetClass() == MONK)
		{
			if(GetLevel() >= 67)
			{ // Strikethrough AA 3
				aaStrikethroughBonus = 6;
			}
			else if(GetLevel() >= 66)
			{ // Strikethrough AA 2
				aaStrikethroughBonus = 4;
			}
			else if(GetLevel() >= 65)
			{ // Strikethrough AA 1
				aaStrikethroughBonus = 2;
			}
		}

		//strikethrough..
		if (((damage < 0) || slippery_attack) && !FromRiposte) { // Hack to still allow Strikethrough chance w/ Slippery Attacks AA
			if(MakeRandomInt(0, 100) < (itembonuses.StrikeThrough + spellbonuses.StrikeThrough + aaStrikethroughBonus)) {
				Attack(other, Hand, true); // Strikethrough only gives another attempted hit
				safe_delete(weapon);
				return false;
			}
		}
	}
	else{
		damage = -5;
	}
	
	///////////////////////////////////////////////////////////
	//////    Send Attack Damage
	///////////////////////////////////////////////////////////
	other->Damage(this, damage, SPELL_UNKNOWN, skillinuse);
	if(damage > 0 && (spellbonuses.MeleeLifetap || itembonuses.MeleeLifetap)) {
		mlog(COMBAT__DAMAGE, "Melee lifetap healing for %d damage.", damage);
		//heal self for damage done..
		HealDamage(damage);
	}
	
	//break invis when you attack
	if(invisible) {
		mlog(COMBAT__ATTACKS, "Removing invisibility due to melee attack.");
		BuffFadeByEffect(SE_Invisibility);
		BuffFadeByEffect(SE_Invisibility2);
		invisible = false;
	}
	if(invisible_undead) {
		mlog(COMBAT__ATTACKS, "Removing invisibility vs. undead due to melee attack.");
		BuffFadeByEffect(SE_InvisVsUndead);
		BuffFadeByEffect(SE_InvisVsUndead2);
		invisible_undead = false;
	}
	if(invisible_animals){
		mlog(COMBAT__ATTACKS, "Removing invisibility vs. animals due to melee attack.");
		BuffFadeByEffect(SE_InvisVsAnimals);
		invisible_animals = false;
	}

	if(hidden || improved_hidden){
		hidden = false;
		improved_hidden = false;
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_SpawnAppearance, sizeof(SpawnAppearance_Struct));
		SpawnAppearance_Struct* sa_out = (SpawnAppearance_Struct*)outapp->pBuffer;
		sa_out->spawn_id = GetID();
		sa_out->type = 0x03;
		sa_out->parameter = 0;
		entity_list.QueueClients(this, outapp, true);
		safe_delete(outapp);
	}
	
	////////////////////////////////////////////////////////////
	////////  PROC CODE
	////////  Kaiyodo - Check for proc on weapon based on DEX
	///////////////////////////////////////////////////////////
	if(other->GetHP() > -10 && !FromRiposte && this) {
		TryWeaponProc(weapon, other);
	}
	
	if(damage > 0) {
		// Give the opportunity to throw back a defensive proc, if we are successful in affecting damage on our target
		other->TriggerDefensiveProcs(this);
		safe_delete(weapon);
		return true;
	}
	else {
		safe_delete(weapon);
		return false;
	}
}

sint16 Bot::GetBotFocusEffect(botfocusType bottype, int16 spell_id) {
	if (IsBardSong(spell_id))
		return 0;

	const Item_Struct* TempItem = 0;
	sint16 Total = 0;
	sint16 realTotal = 0;

	//item focus
	for(int x=0; x<=21; x++) {
		TempItem = database.GetItem(GetBotItem(x));
		if (TempItem && TempItem->Focus.Effect > 0 && TempItem->Focus.Effect != SPELL_UNKNOWN) {
			Total = CalcBotFocusEffect(bottype, TempItem->Focus.Effect, spell_id);
			if(Total > realTotal) {
				realTotal = Total;
			}
		}
	}

	//Spell Focus
	sint16 Total2 = 0;
	sint16 realTotal2 = 0;

	for (int y = 0; y < BUFF_COUNT; y++) {
		int16 focusspellid = buffs[y].spellid;
		
		if (focusspellid == 0 || focusspellid >= SPDAT_RECORDS)
			continue;

		Total2 = CalcBotFocusEffect(bottype, focusspellid, spell_id);
		
		if(Total2 > realTotal2) {
			realTotal2 = Total2;
		}
	}

	int32 MagicianElementalPactAA = 0;

	if((GetClass() == MAGICIAN) && (GetLevel() >= 59)) {
		MagicianElementalPactAA = 1;
	}

	if(bottype == botfocusReagentCost && IsSummonPetSpell(spell_id) && MagicianElementalPactAA)
		return 100;

	if(bottype == botfocusReagentCost && (IsEffectInSpell(spell_id, SE_SummonItem) || IsSacrificeSpell(spell_id))){
		return 0;
	//Summon Spells that require reagents are typically imbue type spells, enchant metal, sacrifice and shouldn't be affected
	//by reagent conservation for obvious reasons.
	}

	return realTotal + realTotal2;
}

//uint32 Bot::GetItemID(int slot_id) {
//	ItemList::iterator cur,end;
//	cur = itemlist.begin();
//	end = itemlist.end();
//	for(; cur != end; cur++) {
//		ServerLootItem_Struct* item = *cur;
//		if (item->lootslot == slot_id) {
//			return item->item_id;
//		}
//	}
//	return(NULL);
//}

sint16 Bot::CalcBotFocusEffect(botfocusType bottype, int16 focus_id, int16 spell_id) {
	const SPDat_Spell_Struct &focus_spell = spells[focus_id];
	const SPDat_Spell_Struct &spell = spells[spell_id];

	sint16 value = 0;
	int lvlModifier = 100;

	for (int i = 0; i < EFFECT_COUNT; i++) {
		switch (focus_spell.effectid[i]) {
		case SE_Blank:
			break;

		//check limits

		//missing limits:
		//SE_LimitTarget

		case SE_LimitResist:{
			if(focus_spell.base[i]){
				if(spell.resisttype != focus_spell.base[i])
					return(0);
			}
			break;
		}

		case SE_LimitInstant:{
			if(spell.buffduration)
				return(0);
			break;
		}

		case SE_LimitMaxLevel:{
			int lvldiff = (spell.classes[(GetClass()%16) - 1]) - focus_spell.base[i];

			if(lvldiff > 0){ //every level over cap reduces the effect by spell.base2[i] percent
				lvlModifier -= spell.base2[i]*lvldiff;
				if(lvlModifier < 1)
					return 0;
			}
			break;
		}

		case SE_LimitMinLevel:
			if (spell.classes[(GetClass()%16) - 1] < focus_spell.base[i])
				return(0);
			break;

		case SE_LimitCastTime:
			if (spells[spell_id].cast_time < (uint16)focus_spell.base[i])
				return(0);
			break;

		case SE_LimitSpell:
			if(focus_spell.base[i] < 0) {	//exclude spell
				if (spell_id == (focus_spell.base[i]*-1))
					return(0);
			} else {
				//this makes the assumption that only one spell can be explicitly included...
				if (spell_id != focus_spell.base[i])
					return(0);
			}
			break;

		case SE_LimitMinDur:
				if (focus_spell.base[i] > CalcBuffDuration_formula(GetLevel(), spell.buffdurationformula, spell.buffduration))
					return(0);
			break;

		case SE_LimitEffect:
			if(focus_spell.base[i] < 0){
				if(IsEffectInSpell(spell_id,focus_spell.base[i])){ //we limit this effect, can't have
					return 0;
				}
			}
			else{
				if(!IsEffectInSpell(spell_id,focus_spell.base[i])){ //we limit this effect, must have
					return 0;
				}
			}
			break;


		case SE_LimitSpellType:
			switch( focus_spell.base[i] )
			{
				case 0:
					if (!IsDetrimentalSpell(spell_id))
						return 0;
					break;
				case 1:
					if (!IsBeneficialSpell(spell_id))
						return 0;
					break;
				default:
					LogFile->write(EQEMuLog::Normal, "CalcFocusEffect:  unknown limit spelltype %d", focus_spell.base[i]);
			}
			break;

		//handle effects

		case SE_ImprovedDamage:
			switch (focus_spell.max[i])
			{
				case 0:
					if (bottype == botfocusImprovedDamage && focus_spell.base[i] > value)
					{
						value = focus_spell.base[i];
					}
					break;
				case 1:
					if (bottype == botfocusImprovedCritical && focus_spell.base[i] > value)
					{
						value = focus_spell.base[i];
					}
					break;
				case 2:
					if (bottype == botfocusImprovedUndeadDamage && focus_spell.base[i] > value)
					{
						value = focus_spell.base[i];
					}
					break;
				case 3:
					if (bottype == 10 && focus_spell.base[i] > value)
					{
						value = focus_spell.base[i];
					}
					break;
				default: //Resist stuff
					if (bottype == (botfocusType)focus_spell.max[i] && focus_spell.base[i] > value)
					{
						value = focus_spell.base[i];
					}
					break;
			}
			break;
		case SE_ImprovedHeal:
			if (bottype == botfocusImprovedHeal && focus_spell.base[i] > value)
			{
				value = focus_spell.base[i];
			}
			break;
		case SE_IncreaseSpellHaste:
			if (bottype == botfocusSpellHaste && focus_spell.base[i] > value)
			{
				value = focus_spell.base[i];
			}
			break;
		case SE_IncreaseSpellDuration:
			if (bottype == botfocusSpellDuration && BeneficialSpell(spell_id) && focus_spell.base[i] > value)
			{
				value = focus_spell.base[i];
			}
			break;
		case SE_IncreaseRange:
			if (bottype == botfocusRange && focus_spell.base[i] > value)
			{
				value = focus_spell.base[i];
			}
			break;
		case SE_ReduceReagentCost:
			if (bottype == botfocusReagentCost && focus_spell.base[i] > value)
			{
				value = focus_spell.base[i];
			}
			break;
		case SE_ReduceManaCost:
			if (bottype == botfocusManaCost && focus_spell.base[i] > value)
			{
				value = focus_spell.base[i];
			}
			break;
		case SE_PetPowerIncrease:
			if (bottype == botfocusPetPower && focus_spell.base[i] > value)
			{
				value = focus_spell.base[i];
			}
			break;
#if EQDEBUG >= 6
		//this spits up a lot of garbage when calculating spell focuses
		//since they have all kinds of extra effects on them.
		default:
			LogFile->write(EQEMuLog::Normal, "CalcFocusEffect:  unknown effectid %d", focus_spell.effectid[i]);
#endif
		}
	}

	return(value*lvlModifier/100);
}

float Bot::GetHitChance(Mob *attacker, SkillType skillinuse, int Hand) {
	float Result = 1;

	if(attacker) {

		Result += (RuleR(Combat,WeaponSkillFalloff) * 5);

		// TODO: This block of code doesnt seem to be contributing to the chancetohit calc at all
#ifdef EQBOTS

		if(IsBot())
		{
			int8 botclass = GetClass();
			uint8 botlevel = GetLevel();

			// Everyone gets Combat Agility AA
			if(botlevel >= 57)
			{
				AA_mod = 10;
			}
			else if(botlevel >= 56)
			{
				AA_mod = 5;
			}
			else if(botlevel >= 55)
			{
				AA_mod = 2;
			}

			// All Melee get Physical Enhancement AA
			if((botclass != WIZARD) &&
				(botclass != NECROMANCER) &&
				(botclass != MAGICIAN) &&
				(botclass != ENCHANTER) &&
				(botclass != DRUID) &&
				(botclass != SHAMAN))
			{
				if(botlevel >= 59)
				{ // Physical Enhancement AA
					AA_mod += 3;
				}
			}

			// Everyone gets Lightning Reflexes AA
			if(botlevel >= 65)
			{ // Lightning Reflexes AA 5
				AA_mod += 10;
			}
			else if(botlevel >= 64)
			{ // Lightning Reflexes AA 4
				AA_mod += 8;
			}
			else if(botlevel >= 63)
			{ // Lightning Reflexes AA 3
				AA_mod += 6;
			}
			else if(botlevel >= 62)
			{ // Lightning Reflexes AA 2
				AA_mod += 4;
			}
			else if(botlevel >= 61)
			{ // Lightning Reflexes AA 1
				AA_mod += 2;
			}

			// Everyone gets Reflexive Mastery AA
			if(botlevel >= 70)
			{ // Reflexive Mastery AA 5
				AA_mod += 5;
			}
			else if(botlevel >= 69)
			{ // Reflexive Mastery AA 4
				AA_mod += 4;
			}
			else if(botlevel >= 68)
			{ // Reflexive Mastery AA 3
				AA_mod += 3;
			}
			else if(botlevel >= 67)
			{ // Reflexive Mastery AA 2
				AA_mod += 2;
			}
			else if(botlevel >= 66)
			{ // Reflexive Mastery AA 1
				AA_mod += 1;
			}
		}

#endif //EQBOTS

		

// Raid mantank has a special defensive disc reducing by 50% the chance to be hitted.
		if(GetBotRaidID()) {
			BotRaids *br = entity_list.GetBotRaidByMob(this);
			if(br && (br->GetBotMainTank() && (br->GetBotMainTank() == this)) || (br && (br->GetBotSecondTank() && (br->GetBotSecondTank() == this)))) {
				Result = Result/2;
			}
		}

	}

	return Result;
}

bool Bot::CalcBotHitChance(Mob* target, SkillType skillinuse, int Hand) {
	bool Result = false;

	if(target) {
		float chancetohit = 1.0;

		chancetohit -= (RuleR(Combat,WeaponSkillFalloff) * 5);

		if(GetClass() == RANGER) {
			int modRangerBotAA = 100;

			if(GetLevel() >= 67) {  // Precision of the Pathfinder 3
				modRangerBotAA += 6;
			}
			else if(GetLevel() == 66) {  // Precision of the Pathfinder 2
				modRangerBotAA += 4;
			}
			else if(GetLevel() == 65) {  // Precision of the Pathfinder 1
				modRangerBotAA += 2;
			}

			chancetohit = ((chancetohit * modRangerBotAA) / 100);
		}

		Result = (bool)chancetohit;
	}

	return Result;
}

//proc chance includes proc bonus
float Bot::GetProcChances(float &ProcBonus, float &ProcChance, int16 weapon_speed) {
	int mydex = GetDEX();
	float AABonus = 0;
	ProcBonus = 0;
	ProcChance = 0;

	// Bot AA WeaponAffinity
	if(GetLevel() >= 59) {
		AABonus += 0.50;
	}
	else if(GetLevel() == 58) {
		AABonus += 0.40;
	}
	else if(GetLevel() == 57) {
		AABonus += 0.30;
	}
	else if(GetLevel() == 56) {
		AABonus += 0.20;
	}
	else if(GetLevel() == 55) {
		AABonus += 0.10;
	}

	float PermaHaste;
	if(GetHaste() > 0)
		PermaHaste = 1 / (1 + (float)GetHaste()/100);
	else if(GetHaste() < 0)
		PermaHaste = 1 * (1 - (float)GetHaste()/100);
	else
		PermaHaste = 1.0f;

	weapon_speed = ((int)(weapon_speed*(100.0f+attack_speed)*PermaHaste) / 100);


	ProcBonus += (float(itembonuses.ProcChance + spellbonuses.ProcChance) / 1000.0f + AABonus);

	if(RuleB(Combat, AdjustProcPerMinute) == true)
	{
		ProcChance = ((float)weapon_speed * RuleR(Combat, AvgProcsPerMinute) / 600.0f);
		ProcBonus += float(mydex) * RuleR(Combat, ProcPerMinDexContrib) / 100.0f;
		ProcChance = ProcChance + (ProcChance * ProcBonus);
	}
	else
	{
		ProcChance = RuleR(Combat, BaseProcChance) + float(mydex) / RuleR(Combat, ProcDexDivideBy);
		ProcChance = ProcChance + (ProcChance * ProcBonus);
	}

	mlog(COMBAT__PROCS, "Proc chance %.2f (%.2f from bonuses)", ProcChance, ProcBonus);
	return ProcChance;
}

bool Bot::AvoidDamage(Mob* other, sint32 &damage)
{
	/* solar: called when a mob is attacked, does the checks to see if it's a hit
	*  and does other mitigation checks.  'this' is the mob being attacked.
	* 
	* special return values:
	*    -1 - block
	*    -2 - parry
	*    -3 - riposte
	*    -4 - dodge
	* 
	*/
	float skill = 0;
	float bonus = 0;
	float RollTable[4] = {0,0,0,0};
	float roll = 0;
	Mob *attacker=other;
	Mob *defender=this;

	//garunteed hit
	bool ghit = false;
	if((attacker->GetSpellBonuses().MeleeSkillCheck + attacker->GetItemBonuses().MeleeSkillCheck) > 500)
		ghit = true;
	
	//////////////////////////////////////////////////////////
	// make enrage same as riposte
	/////////////////////////////////////////////////////////
	if (IsEnraged() && !other->BehindMob(this, other->GetX(), other->GetY())) {
		damage = -3;
		mlog(COMBAT__DAMAGE, "I am enraged, riposting frontal attack.");
	}
	
	/////////////////////////////////////////////////////////
	// riposte
	/////////////////////////////////////////////////////////
	if (damage > 0 && CanThisClassRiposte() && !other->BehindMob(this, other->GetX(), other->GetY()))
	{
        skill = GetSkill(RIPOSTE);
		
		if (!ghit) {	//if they are not using a garunteed hit discipline
			bonus = 2.0 + skill/60.0 + (GetDEX()/200);
			bonus = bonus * (100 + defender->GetSpellBonuses().RiposteChance + defender->GetItemBonuses().RiposteChance) / 100.0f;
			RollTable[0] = bonus;
		}
	}
	
	///////////////////////////////////////////////////////	
	// block
	///////////////////////////////////////////////////////

	bool bBlockFromRear = false;
	float aaChance = 0;
	int8 botclass = GetClass();
	uint8 botlevel = GetLevel();

	// a successful roll on this does not mean a successful block is forthcoming. only that a chance to block
	// from a direction other than the rear is granted.
	if((botclass = BERSERKER) || (botclass == MONK))
	{
		if(botlevel >= 69) // Heightened Awareness 5
		{
			aaChance = 40;
		}
		else if(botlevel >= 68) // Heightened Awareness 4
		{
			aaChance = 32;
		}
		else if(botlevel >= 67) // Heightened Awareness 3
		{
			aaChance = 24;
		}
		else if(botlevel >= 66) // Heightened Awareness 2
		{
			aaChance = 16;
		}
		else if(botlevel >= 65) // Heightened Awareness 1
		{
			aaChance = 8;
		}
	}

	if(aaChance > MakeRandomInt(1, 100))
		bBlockFromRear = true;

	if (damage > 0 && CanThisClassBlock() && (!other->BehindMob(this, other->GetX(), other->GetY()) || bBlockFromRear)) {
		//skill = CastToClient()->GetSkill(BLOCKSKILL);
		/*if (IsClient()) {
			CastToClient()->CheckIncreaseSkill(BLOCKSKILL, other, -10);
		}*/
		
		if (!ghit) {	//if they are not using a garunteed hit discipline
			bonus = 2.0 + skill/35.0 + (GetDEX()/200);
			RollTable[1] = RollTable[0] + bonus;
		}
	}
	else{
		RollTable[1] = RollTable[0];
	}

	if(damage > 0 && GetAA(aaShieldBlock) && (!other->BehindMob(this, other->GetX(), other->GetY()))) {
		/*bool equiped = CastToClient()->m_inv.GetItem(14);
		if(equiped) {
			uint8 shield = CastToClient()->m_inv.GetItem(14)->GetItem()->ItemType;

			if(shield == ItemTypeShield) {
				switch(GetAA(aaShieldBlock)) {
					 case 1:
						RollTable[1] = RollTable[0] + 2.50;
                        break;
	                 case 2:
		                RollTable[1] = RollTable[0] + 5.00;
			            break;
				     case 3:
					    RollTable[1] = RollTable[0] + 10.00;
						break;
				}
			}
		}*/
	}

	//////////////////////////////////////////////////////		
	// parry
	//////////////////////////////////////////////////////
	if (damage > 0 && CanThisClassParry() && !other->BehindMob(this, other->GetX(), other->GetY()))
	{
        /*skill = CastToClient()->GetSkill(PARRY);
		if (IsClient()) {
			CastToClient()->CheckIncreaseSkill(PARRY, other, -10); 
		}*/
		
		if (!ghit) {	//if they are not using a garunteed hit discipline
			bonus = 2.0 + skill/60.0 + (GetDEX()/200);
			bonus = bonus * (100 + defender->GetSpellBonuses().ParryChance + defender->GetItemBonuses().ParryChance) / 100.0f;
			RollTable[2] = RollTable[1] + bonus;
		}
	}
	else{
		RollTable[2] = RollTable[1];
	}
	
	////////////////////////////////////////////////////////
	// dodge
	////////////////////////////////////////////////////////
	if (damage > 0 && CanThisClassDodge() && !other->BehindMob(this, other->GetX(), other->GetY()))
	{
	
        /*skill = CastToClient()->GetSkill(DODGE);
		if (IsClient()) {
			CastToClient()->CheckIncreaseSkill(DODGE, other, -10);
		}*/
		
		if (!ghit) {	//if they are not using a garunteed hit discipline
			bonus = 2.0 + skill/60.0 + (GetAGI()/200);
			bonus = bonus * (100 + defender->GetSpellBonuses().DodgeChance + defender->GetItemBonuses().DodgeChance) / 100.0f;
			RollTable[3] = RollTable[2] + bonus;
		}
	}
	else{
		RollTable[3] = RollTable[2];
	}

	if(damage > 0){
		roll = MakeRandomFloat(0,100);
		if(roll <= RollTable[0]){
			damage = -3;
		}
		else if(roll <= RollTable[1]){
			damage = -1;
		}
		else if(roll <= RollTable[2]){
			damage = -2;
		}
		else if(roll <= RollTable[3]){
			damage = -4;
		}
	}

	mlog(COMBAT__DAMAGE, "Final damage after all avoidances: %d", damage);
	
	if (damage < 0)
		return true;
	return false;
}

int Bot::GetMonkHandToHandDamage(void)
{
	// Kaiyodo - Determine a monk's fist damage. Table data from www.monkly-business.com
	// saved as static array - this should speed this function up considerably
	static int damage[66] = {
		//   0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19
		99, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7,
		8, 8, 8, 8, 8, 9, 9, 9, 9, 9,10,10,10,10,10,11,11,11,11,11,
		12,12,12,12,12,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,
		14,14,15,15,15,15 };

		// Have a look to see if we have epic fists on

		uint32 botWeaponId = INVALID_ID;
		botWeaponId = CastToNPC()->GetEquipment(MATERIAL_HANDS);
		if(botWeaponId == 10652) { //Monk Epic ID
			return 9;
		}
		else
		{
			int Level = GetLevel();
			if(Level > 65)
				return 19;
			else
				return damage[Level];
		}

		int Level = GetLevel();
		if (Level > 65)
			return(19);
		else
			return damage[Level];
}

void Bot::TryCriticalHit(Mob *defender, int16 skill, sint32 &damage)
{
	bool slayUndeadCrit = false;

	if(damage < 1) //We can't critical hit if we don't hit.
		return;

	float critChance = RuleR(Combat, BaseCritChance);

	critChance += RuleR(Combat, ClientBaseCritChance);

	uint16 critMod = 200; 

	if(skill == ARCHERY && GetClass() == RANGER && GetSkill(ARCHERY) >= 65){
		critChance += 0.06f;
	}

	if(GetHPRatio() < 30 && GetClass() == BERSERKER) {
		critChance += RuleR(Combat, BerserkBaseCritChance);
		critMod = 400;
	}
	else if(GetHPRatio() < 30 && GetClass() == WARRIOR) {
		critChance += RuleR(Combat, WarBerBaseCritChance);
	}

	// Bot AA's for CombatFury and FuryoftheAges
	if(GetLevel() >= 64) {
		critChance += 0.12f;
	}
	else if(GetLevel() >= 63) {
		critChance += 0.10f;
	}
	else if(GetLevel() >= 62) {
		critChance += 0.08f;
	}
	else if(GetLevel() >= 57) {
		critChance += 0.07f;
	}
	else if(GetLevel() >= 56) {
		critChance += 0.04f;
	}
	else if(GetLevel() >= 55) {
		critChance += 0.02f;
	}

	switch(GetAA(aaCombatFury))
	{
	case 1:
		critChance += 0.02f;
		break;
	case 2:
		critChance += 0.04f;
		break;
	case 3:
		critChance += 0.07f;
		break;
	default:
		break;
	}

	switch(GetAA(aaFuryoftheAges))
	{
	case 1:
		critChance += 0.01f;
		break;
	case 2:
		critChance += 0.03f;
		break;
	case 3:
		critChance += 0.05f;
		break;
	default:
		break;
	}

	float CritBonus = spellbonuses.CriticalHitChance + itembonuses.CriticalHitChance;
	if(CritBonus > 0.0 && critChance < 0.01) //If we have a bonus to crit in items or spells but no actual chance to crit
		critChance = 0.01f; //Give them a small one so skills and items appear to have some effect.

	critChance += ((critChance) * (CritBonus) / 100.0f); //crit chance is a % increase to your reg chance
	if(GetAA(aaSlayUndead)){
		if(defender && defender->GetBodyType() == BT_Undead || defender->GetBodyType() == BT_SummonedUndead || defender->GetBodyType() == BT_Vampire){
			switch(GetAA(aaSlayUndead)){
			case 1:
				critMod += 33;
				break;
			case 2:
				critMod += 66;
				break;
			case 3:
				critMod += 100;
				break;
			}
			slayUndeadCrit = true;
		}
	}

	// Paladin Bot Slay Undead AA
	if(GetClass() == PALADIN) {
		if(defender && defender->GetBodyType() == BT_Undead || defender->GetBodyType() == BT_SummonedUndead || defender->GetBodyType() == BT_Vampire) {
			if(GetLevel() >= 61) {
				critMod += 100;
			}
			else if(GetLevel() >= 60) {
				critMod += 66;
			}
			else if(GetLevel() >= 59) {
				critMod += 33;
			}
		}
	}

	if(critChance > 0){
		if(MakeRandomFloat(0, 1) <= critChance)
		{
			if (slayUndeadCrit)
			{
				damage = (damage * (critMod * 2.65)) / 100;
				entity_list.MessageClose(this, false, 200, MT_CritMelee, "%s cleanses %s target!(%d)", GetCleanName(), this->GetGender() == 0 ? "his" : this->GetGender() == 1 ? "her" : "its", damage);
				return;
			}
			////Veteran's Wrath AA
			////first, find out of we have it (don't multiply by 0 :-\ )
			//int32 AAdmgmod = GetAA(aaVeteransWrath);
			//if (AAdmgmod > 0) {
			//	//now, make sure it's not a special attack
			//	if (skill == _1H_BLUNT
			//		|| skill == _2H_BLUNT
			//		|| skill == _1H_SLASHING
			//		|| skill == _2H_SLASHING
			//		|| skill == PIERCING
			//		|| skill == HAND_TO_HAND
			//		)
			//		critMod += AAdmgmod * 3; //AndMetal: guessing
			//}

			damage = (damage * critMod) / 100;

			if((GetClass() == WARRIOR || GetClass() == BERSERKER) && GetHPRatio() < 30) {
				entity_list.MessageClose(this, false, 200, MT_CritMelee, "%s lands a crippling blow!(%d)", GetCleanName(), damage);
			}
			else {
				entity_list.MessageClose(this, false, 200, MT_CritMelee, "%s scores a critical hit!(%d)", GetCleanName(), damage);
			}
			/*else {
				entity_list.MessageClose(this, false, 200, MT_CritMelee, "%s scores a critical hit!(%d)", GetCleanName(), damage);
			}*/
		}
	}
}

bool Bot::TryFinishingBlow(Mob *defender, SkillType skillinuse)
{
	int8 aa_item = GetAA(aaFinishingBlow) + GetAA(aaCoupdeGrace) + GetAA(aaDeathblow);

	if(GetLevel() >= 55) {
		aa_item += 1;	// Finishing Blow AA 1
	}
	if(GetLevel() >= 56) {
		aa_item += 1;	// Finishing Blow AA 2
	}
	if(GetLevel() >= 57) {
		aa_item += 1;	// Finishing Blow AA 3
	}
	if(GetLevel() >= 62) {
		aa_item += 1;	// Coup de Grace AA 1
	}
	if(GetLevel() >= 63) {
		aa_item += 1;	// Coup de Grace AA 2
	}
	if(GetLevel() >= 64) {
		aa_item += 1;	// Coup de Grace AA 3
	}

	if(aa_item && defender->GetHPRatio() < 10){
		int chance = 0;
		int levelreq = 0;
		switch(aa_item)
		{
		case 1:
			chance = 2;
			levelreq = 50;
			break;
		case 2:
			chance = 5;
			levelreq = 52;
			break;
		case 3:
			chance = 7;
			levelreq = 54;
			break;
		case 4:
			chance = 7;
			levelreq = 55;
			break;
		case 5:
			chance = 7;
			levelreq = 57;
			break;
		case 6:
			chance = 7;
			levelreq = 59;
			break;
		case 7:
			chance = 7;
			levelreq = 61;
			break;
		case 8:
			chance = 7;
			levelreq = 63;
			break;
		case 9:
			chance = 7;
			levelreq = 65;
			break;
		default:
			break;
		}

		if(chance >= MakeRandomInt(0, 100) && defender->GetLevel() <= levelreq){
			mlog(COMBAT__ATTACKS, "Landed a finishing blow: AA at %d, other level %d", aa_item, defender->GetLevel());
			entity_list.MessageClose_StringID(this, false, 200, MT_CritMelee, FINISHING_BLOW, GetCleanName());
			defender->Damage(this, 32000, SPELL_UNKNOWN, skillinuse);
			return true;
		}
		else
		{
			mlog(COMBAT__ATTACKS, "FAILED a finishing blow: AA at %d, other level %d", aa_item, defender->GetLevel());
			return false;
		}
	}
	return false;
}

void Bot::DoRiposte(Mob* defender) {
	mlog(COMBAT__ATTACKS, "Preforming a riposte");

	defender->Attack(this, SLOT_PRIMARY, true);

	//double riposte
	int DoubleRipChance = 0;
	switch(defender->GetAA(aaDoubleRiposte)) {
		case 1: 
			DoubleRipChance = 15;
			break;
		case 2:
			DoubleRipChance = 35;
			break;
		case 3:
			DoubleRipChance = 50;
			break;
	}

	DoubleRipChance += 10*defender->GetAA(aaFlashofSteel);

	if(defender->GetLevel() >= 64) {
		DoubleRipChance = 80;
	}
	else if(defender->GetLevel() >= 63) {
		DoubleRipChance = 70;
	}
	else if(defender->GetLevel() >= 62) {
		DoubleRipChance = 60;
	}
	else if(defender->GetLevel() >= 61) {
		DoubleRipChance = 50;
	}
	else if(defender->GetLevel() >= 60) {
		DoubleRipChance = 35;
	}
	else if(defender->GetLevel() >= 59) {
		DoubleRipChance = 15;
	}

	if(DoubleRipChance >= MakeRandomInt(0, 100)) {
		mlog(COMBAT__ATTACKS, "Preforming a double riposed (%d percent chance)", DoubleRipChance);

		defender->Attack(this, SLOT_PRIMARY, true);
	}

	if(defender->GetAA(aaReturnKick)){
		int ReturnKickChance = 0;
		switch(defender->GetAA(aaReturnKick)){
			case 1:
				ReturnKickChance = 25;
				break;
			case 2:
				ReturnKickChance = 35;
				break;
			case 3:
				ReturnKickChance = 50;
				break;
		}

		// Bot AA ReturnKick
		if(defender->GetClass() == MONK) {
			if(defender->GetLevel() >= 61) {
				ReturnKickChance = 50;
			}
			else if(defender->GetLevel() >= 60) {
				ReturnKickChance = 35;
			}
			else if(defender->GetLevel() >= 59) {
				ReturnKickChance = 25;
			}
		}

		if(ReturnKickChance >= MakeRandomInt(0, 100)) {
			mlog(COMBAT__ATTACKS, "Preforming a return kick (%d percent chance)", ReturnKickChance);
			defender->MonkSpecialAttack(this, FLYING_KICK);

			// Technique Of Master Wu AA
			int special = 0;
			if(defender->GetLevel() >= 65) {
				special = 100;
			}
			else if(defender->GetLevel() >= 64) {
				special = 80;
			}
			else if(defender->GetLevel() >= 63) {
				special = 60;
			}
			else if(defender->GetLevel() >= 62) {
				special = 40;
			}
			else if(defender->GetLevel() >= 61) {
				special = 20;
			}
			if(special == 100 || special > MakeRandomInt(0,100)) {
				defender->MonkSpecialAttack(this, FLYING_KICK);
				if(20 > MakeRandomInt(0,100)) {
					defender->MonkSpecialAttack(this, FLYING_KICK);
				}
			}

		}
	}		
}

void Bot::MeleeMitigation(Mob *attacker, sint32 &damage, sint32 minhit)
{
	if(damage <= 0)
		return;

	Mob* defender = this;
	int totalMit = 0;

	switch(GetAA(aaCombatStability)){
		case 1:
			totalMit += 2;
			break;
		case 2:
			totalMit += 5;
			break;
		case 3:
			totalMit += 10;
			break;
	}

	totalMit += GetAA(aaPhysicalEnhancement)*2;
	totalMit += GetAA(aaInnateDefense);
	totalMit += GetAA(aaDefensiveInstincts)*0.5;

	int8 botclass = GetClass();
	uint8 botlevel = GetLevel();

	// Everyone gets Combat Stability AA
	if(botlevel >= 57)
	{ // Combat Stability AA 3
		totalMit += 10;
	}
	else if(botlevel >= 56)
	{ // Combat Stability AA 2
		totalMit += 5;
	}
	else if(botlevel >= 55)
	{ // Combat Stability AA 1
		totalMit += 2;
	}

	// All Melee get Physical Enhancement AA
	if((botclass != WIZARD) &&
		(botclass != NECROMANCER) &&
		(botclass != MAGICIAN) &&
		(botclass != ENCHANTER) &&
		(botclass != DRUID) &&
		(botclass != SHAMAN))
	{
		if(botlevel >= 59)
		{ // Physical Enhancement AA
			totalMit += 2;
		}
	}

	// Everyone gets Innate Defense AA
	if(botlevel >= 65)
	{ // Innate Defense AA 5
		totalMit += 5;
	}
	else if(botlevel >= 64)
	{ // Innate Defense AA 4
		totalMit += 4;
	}
	else if(botlevel >= 63)
	{ // Innate Defense AA 3
		totalMit += 3;
	}
	else if(botlevel >= 62)
	{ // Innate Defense AA 2
		totalMit += 2;
	}
	else if(botlevel >= 61)
	{ // Innate Defense AA 1
		totalMit += 1;
	}

	// All but pure casters get Defensive Instincts AA
	if((botclass != WIZARD) && (botclass != NECROMANCER) && (botclass != MAGICIAN) && (botclass != ENCHANTER))
	{
		// Clients get this AA multiplied by a float to equal an int(totalMit)?  Unfair rounding
		if(botlevel >= 70) { // Defensive Instincts AA 5
			totalMit += 5;
		}
		else if(botlevel >= 69) { // Defensive Instincts AA 4
			totalMit += 4;
		}
		else if(botlevel >= 68) { // Defensive Instincts AA 3
			totalMit += 3;
		}
		else if(botlevel >= 67) { // Defensive Instincts AA 2
			totalMit += 2;
		}
		else if(botlevel >= 66) { // Defensive Instincts AA 1
			totalMit += 1;
		}
	}

	if(RuleB(Combat, UseIntervalAC)){
		//AC Mitigation
		sint32 attackRating = 0;
		uint16 ac_eq100 = 125;
		if(defender->GetLevel() < 20)
		{
			ac_eq100 += 15 * defender->GetLevel();
		}
		else if(defender->GetLevel() < 50)
		{
			ac_eq100 += (285 + ((defender->GetLevel()-19)*30));
		}
		else if(defender->GetLevel() < 60)
		{
			ac_eq100 += (1185 + ((defender->GetLevel()-49)*60));
		}
		else if(defender->GetLevel() < 70)
		{
			ac_eq100 += (1785 + ((defender->GetLevel()-59)*90));
		}
		else
		{
			ac_eq100 += (2325 + ((defender->GetLevel()-69)*125));
		}

		attackRating = 10 + attacker->GetATK();

		sint32 defenseRating = defender->GetAC();
		defenseRating += 125;
		defenseRating += (totalMit * defenseRating / 100);

		double d1_chance;
		double d2_d19_chance;

		double combat_rating = (defenseRating - attackRating);

		combat_rating = 100 * combat_rating / (double)ac_eq100;

		d1_chance = 6.0 + (((combat_rating * 0.39) / 3));
		d2_d19_chance = 48.0 + (((combat_rating * 0.39) / 3) * 2);

		if(d1_chance < 1.0)
			d1_chance = 1.0;

		if(d2_d19_chance < 5.0)
			d2_d19_chance = 5.0;

		double roll = MakeRandomFloat(0, 100);

		int interval_used = 0;
		if(roll <= d1_chance)
		{
			interval_used = 1;
		}
		else if(roll <= (d2_d19_chance + d1_chance))
		{
			interval_used = 1 + (int)((((roll-d1_chance) / d2_d19_chance) * 18) + 1);
		}
		else
		{
			interval_used = 20;
		}

		//PS: this looks WRONG but there's a method to the madness
		int db = minhit;
		double di = ((double)(damage-minhit)/19);
		damage = db + (di * (interval_used - 1));
	}
	else{
		////////////////////////////////////////////////////////
		// Scorpious2k: Include AC in the calculation
		// use serverop variables to set values
		int myac = GetAC();
		if (damage > 0 && myac > 0) {
			int acfail=1000;
			char tmp[10];

			if (database.GetVariable("ACfail", tmp, 9)) {
				acfail = (int) (atof(tmp) * 100);
				if (acfail>100) acfail=100;
			}

			if (acfail<=0 || rand()%101>acfail) {
				float acreduction=1;
				int acrandom=300;
				if (database.GetVariable("ACreduction", tmp, 9))
				{
					acreduction=atof(tmp);
					if (acreduction>100) acreduction=100;
				}

				if (database.GetVariable("ACrandom", tmp, 9))
				{
					acrandom = (int) ((atof(tmp)+1) * 100);
					if (acrandom>10100) acrandom=10100;
				}

				if (acreduction>0) {
					damage -= (int) (GetAC() * acreduction/100.0f);
				}		
				if (acrandom>0) {
					damage -= (myac * MakeRandomInt(0, acrandom) / 10000);
				}
				if (damage<1) damage=1;
				mlog(COMBAT__DAMAGE, "AC Damage Reduction: fail chance %d%%. Failed. Reduction %.3f%%, random %d. Resulting damage %d.", acfail, acreduction, acrandom, damage);
			} else {
				mlog(COMBAT__DAMAGE, "AC Damage Reduction: fail chance %d%%. Did not fail.", acfail);
			}
		}

		damage -= (totalMit * damage / 100);

		if(damage != 0 && damage < minhit)
			damage = minhit;
	}


	//reduce the damage from shielding item and aa based on the min dmg
	//spells offer pure mitigation
	damage -= (minhit * defender->GetItemBonuses().MeleeMitigation / 100);
	damage -= (damage * defender->GetSpellBonuses().MeleeMitigation / 100);

	if(damage < 0)
		damage = 0;

	mlog(COMBAT__DAMAGE, "Applied %d percent mitigation, remaining damage %d", totalMit, damage);
}

void Bot::DoSpecialAttackDamage(Mob *who, SkillType skill, sint32 max_damage, sint32 min_damage, sint32 hate_override) {
	//this really should go through the same code as normal melee damage to
	//pick up all the special behavior there

	sint32 hate = max_damage;
	if(hate_override > -1)
		hate = hate_override;

	if(skill == BASH) {
		const Item_Struct* botweapon = database.GetItem(GetEquipment(MATERIAL_SECONDARY));
		if(botweapon) {
			if(botweapon->ItemType == ItemTypeShield) {
				hate += botweapon->AC;
			}
		}

	}

	if(max_damage > 0) {
		if(skill != THROWING && skill != ARCHERY) {
			who->AvoidDamage(this, max_damage);
		}
		who->MeleeMitigation(this, max_damage, min_damage);
		ApplyMeleeDamageBonus(skill, max_damage);
		TryCriticalHit(who, skill, max_damage);
		if(max_damage > 0) {
			who->AddToHateList(this, hate);
		}
		else
			who->AddToHateList(this, 0);
	}
	who->Damage(this, max_damage, SPELL_UNKNOWN, skill, false);
	
	if(max_damage == -3)
		DoRiposte(who);	
}

void Bot::TryBackstab(Mob *other) {
	if(!other)
		return;

	const Item_Struct* botpiercer = NULL;
	    botpiercer = database.GetItem(GetEquipment(MATERIAL_PRIMARY));
		if(!botpiercer || (botpiercer->ItemType != ItemTypePierce)) {
			Say("I can't backstab with this weapon!");
			return;
		}
	
	bool tripleBackstab = false;
	int tripleChance = 0;

	if(GetLevel() >= 67) { // Triple Backstab AA 3
			tripleChance = 30;
		}
		else if(GetLevel() == 66) { // Triple Backstab AA 2
			tripleChance = 20;
		}
		else if(GetLevel() == 65) { // Triple Backstab AA 1
			tripleChance = 10;
		}
		if (tripleChance > MakeRandomInt(1, 100)) {
			tripleBackstab = true;
		}

	bool seizedOpportunity = false;
	int seizedChance = 0;

	if (BehindMob(other, GetX(), GetY()) || seizedOpportunity) // Player is behind other
	{
		if (seizedOpportunity) {
			Message(0,"%s's fierce attack is executed with such grace, %s did not see it coming!", this->GetCleanName(), other->GetCleanName());
		}

		// solar - chance to assassinate
		float chance = (10.0+(GetDEX()/10)); //18.5% chance at 85 dex 40% chance at 300 dex
		if(
			level >= 60 && // player is 60 or higher
			other->GetLevel() <= 45 && // mob 45 or under
			!other->CastToNPC()->IsEngaged() && // not aggro
			other->GetHP()<=32000
			&& other->IsNPC()
			&& MakeRandomFloat(0, 99) < chance // chance
			) {
			entity_list.MessageClose_StringID(this, false, 200, MT_CritMelee, ASSASSINATES, GetName());
			RogueAssassinate(other);
		}
		else {
			RogueBackstab(other);
			if (level > 54) {
				float DoubleAttackProbability = (GetSkill(DOUBLE_ATTACK) + GetLevel()) / 500.0f; // 62.4 max
				// Check for double attack with main hand assuming maxed DA Skill (MS)
				
				if(MakeRandomFloat(0, 1) < DoubleAttackProbability)	// Max 62.4 % chance of DA
				{
					if(other->GetHP() > 0)
						RogueBackstab(other);

					if (tripleBackstab && other->GetHP() > 0) 
					{
						RogueBackstab(other);
					}
				}
			}
		}
	}
	else if(GetAA(aaChaoticStab) > 0) {
		//we can stab from any angle, we do min damage though.
		RogueBackstab(other, true);
		if (level > 54) {
			float DoubleAttackProbability = (GetSkill(DOUBLE_ATTACK) + GetLevel()) / 500.0f; // 62.4 max
			// Check for double attack with main hand assuming maxed DA Skill (MS)
			if(MakeRandomFloat(0, 1) < DoubleAttackProbability)		// Max 62.4 % chance of DA
				if(other->GetHP() > 0)
					RogueBackstab(other, true);

			if (tripleBackstab && other->GetHP() > 0) {
					RogueBackstab(other);
				}
		}
	}
	else { //We do a single regular attack if we attack from the front without chaotic stab
		Attack(other, 13);
	}
}

//heko: backstab
void Bot::RogueBackstab(Mob* other, bool min_damage)
{
	sint32 ndamage = 0;
	sint32 max_hit = 0;
	sint32 min_hit = 0;
	sint32 hate = 0;
	sint32 primaryweapondamage = 0;
	sint32 backstab_dmg = 0;

	const Item_Struct* botweaponStruct = database.GetItem(GetEquipment(MATERIAL_PRIMARY));
	if(botweaponStruct) {
		ItemInst* botweaponInst = new ItemInst(botweaponStruct);
		if(botweaponInst) {
			primaryweapondamage = GetWeaponDamage(other, botweaponInst);
			backstab_dmg = primaryweapondamage;
			safe_delete(botweaponInst);
		}
		else 
		{
			primaryweapondamage = (GetLevel()/7)+1; // fallback incase it's a npc without a weapon, 2 dmg at 10, 10 dmg at 65
			backstab_dmg = primaryweapondamage;
		}
	}

	if(primaryweapondamage > 0){
		if(level > 25){
			max_hit = (((2*backstab_dmg) * GetDamageTable(BACKSTAB) / 100) * 10 * GetSkill(BACKSTAB) / 355)  + ((level-25)/3) + 1;
			hate = 20 * backstab_dmg * GetSkill(BACKSTAB) / 355;
		}
		else{
			max_hit = (((2*backstab_dmg) * GetDamageTable(BACKSTAB) / 100) * 10 * GetSkill(BACKSTAB) / 355) + 1;
			hate = 20 * backstab_dmg * GetSkill(BACKSTAB) / 355;
		}

		// determine minimum hits
		if (level < 51)
		{
			min_hit = (level*15/10);
		}
		else
		{
			// Trumpcard:  Replaced switch statement with formula calc.  This will give minhit increases all the way to 65.
			min_hit = (level * ( level*5 - 105)) / 100;
		}

		if(!other->CheckHitChance(this, BACKSTAB, 0))	{
			ndamage = 0;
		}
		else{
			if(min_damage){
				ndamage = min_hit;
			}
			else
			{
				if (max_hit < min_hit)
					max_hit = min_hit;

				if(RuleB(Combat, UseIntervalAC))
					ndamage = max_hit; 
				else
					ndamage = MakeRandomInt(min_hit, max_hit);

			}
		}
	}
	else{
		ndamage = -5;
	}

	DoSpecialAttackDamage(other, BACKSTAB, ndamage, min_hit, hate);
	DoAnim(animPiercing);
}

void Bot::RogueAssassinate(Mob* other)
{
	const Item_Struct* botweaponStruct = database.GetItem(GetEquipment(MATERIAL_PRIMARY));
	if(botweaponStruct) {
		ItemInst* botweaponInst = new ItemInst(botweaponStruct);
		if(botweaponInst) {
			if(GetWeaponDamage(other, botweaponInst)) {
				other->Damage(this, 32000, SPELL_UNKNOWN, BACKSTAB);
			}
			else {
				other->Damage(this, -5, SPELL_UNKNOWN, BACKSTAB);
			}
			safe_delete(botweaponInst);
		}
	}

	DoAnim(animPiercing);	//piercing animation
}

void Bot::DoClassAttacks(Mob *target) {
	if(target == NULL)
		return;	//gotta have a target for all these

	bool taunt_time = taunt_timer.Check();
	bool ca_time = classattack_timer.Check(false);
	bool ka_time = knightattack_timer.Check(false);

	//only check attack allowed if we are going to do something
	if((taunt_time || ca_time || ka_time) && !IsAttackAllowed(target))
		return;

	if(ka_time){
		int knightreuse = 1000; //lets give it a small cooldown actually.
		switch(GetClass()){
			case SHADOWKNIGHT: case SHADOWKNIGHTGM:{
				CastSpell(SPELL_NPC_HARM_TOUCH, target->GetID());
				knightreuse = HarmTouchReuseTime * 1000;
				break;
							   }
			case PALADIN: case PALADINGM:{
				if(GetHPRatio() < 20) {
					CastSpell(SPELL_LAY_ON_HANDS, GetID());
					knightreuse = LayOnHandsReuseTime * 1000;
				} else {
					knightreuse = 2000; //Check again in two seconds.
				}
				break;
						  }
		}
		knightattack_timer.Start(knightreuse); 
	}

	//general stuff, for all classes....
	//only gets used when their primary ability get used too
	if (taunting && HasOwner() && target->IsNPC() && target->GetBodyType() != BT_Undead && taunt_time) {
		Taunt(target->CastToNPC(), false);
	}

	//franck-add: EQoffline. Warrior bots must taunt the target.
	if(((GetClass() == WARRIOR) || (GetClass() == PALADIN) || (GetClass() == SHADOWKNIGHT)) && target->IsNPC() && taunt_time && target) {
		bool isTaunting = false;
		BotRaids* br = entity_list.GetBotRaidByMob(this);
		if(br)
		{
			if(br->GetBotMainTank())
			{
				if(br->GetBotMainTank() == this)
				{
					isTaunting = true;
				}
			}
			else if(br->GetBotSecondTank())
			{
				if(br->GetBotSecondTank() == this)
				{
					isTaunting = true;
				}
			}
			else
			{
				if(MakeRandomInt(1, 100) > 50)
				{
					isTaunting = true;
				}
			}
		}
		else
		{
			isTaunting = true;
		}

		if(isTaunting) {
			Say("Taunting %s", target->GetCleanName());
			Taunt(target->CastToNPC(), true);
		}
	}

	if(!ca_time)
		return;

	float HasteModifier = 0;
	if(GetHaste() > 0)
		HasteModifier = 10000 / (100 + GetHaste());
	else if(GetHaste() < 0)
		HasteModifier = (100 - GetHaste());
	else
		HasteModifier = 100;

	int level = GetLevel();
	int reuse = TauntReuseTime * 1000;	//make this very long since if they dont use it once, they prolly never will
	bool did_attack = false;
	//class specific stuff...
	switch(GetClass()) {
		case ROGUE: case ROGUEGM:
			if(level >= 10) {
				TryBackstab(target);
				reuse = BackstabReuseTime * 1000;
				did_attack = true;
			}
			break;
		case MONK: case MONKGM: {
			int8 satype = KICK;
			if(level > 29) {
				satype = FLYING_KICK;
			} else if(level > 24) {
				satype = DRAGON_PUNCH;
			} else if(level > 19) {
				satype = EAGLE_STRIKE;
			} else if(level > 9) {
				satype = TIGER_CLAW;
			} else if(level > 4) {
				satype = ROUND_KICK;
			}
			reuse = MonkSpecialAttack(target, satype);

			// Technique Of Master Wu AA
			int specl = 0;
			if(GetLevel() >= 65) {
				specl = 100;
			}
			else if(GetLevel() >= 64) {
				specl = 80;
			}
			else if(GetLevel() >= 63) {
				specl = 60;
			}
			else if(GetLevel() >= 62) {
				specl = 40;
			}
			else if(GetLevel() >= 61) {
				specl = 20;
			}
			if(specl == 100 || specl > MakeRandomInt(0,100)) {
				reuse = MonkSpecialAttack(target, satype);
				if(20 > MakeRandomInt(0,100)) {
					reuse = MonkSpecialAttack(target, satype);
				}
			}

			reuse *= 1000;
			did_attack = true;
			break;
				   }
		case WARRIOR: case WARRIORGM:{
			if(level >= RuleI(Combat, NPCBashKickLevel)){
				if(MakeRandomInt(0, 100) > 25) //tested on live, warrior mobs both kick and bash, kick about 75% of the time, casting doesn't seem to make a difference.
				{
					DoAnim(animKick);
					sint32 dmg = 0;

					if(GetWeaponDamage(target, (const Item_Struct*)NULL) <= 0){
						dmg = -5;
					}
					else{
						if(target->CheckHitChance(this, KICK, 0)) {
							if(RuleB(Combat, UseIntervalAC))
								dmg = GetKickDamage();
							else
								dmg = MakeRandomInt(1, GetKickDamage());

						}
					}

					DoSpecialAttackDamage(target, KICK, dmg);
					reuse = KickReuseTime * 1000;
					did_attack = true;
				}
				else
				{
					DoAnim(animTailRake);
					sint32 dmg = 0;

					if(GetWeaponDamage(target, (const Item_Struct*)NULL) <= 0){
						dmg = -5;
					}
					else{
						if(target->CheckHitChance(this, BASH, 0)) {
							if(RuleB(Combat, UseIntervalAC))
								dmg = GetBashDamage();
							else
								dmg = MakeRandomInt(1, GetBashDamage());
						}
					}

					DoSpecialAttackDamage(target, BASH, dmg);
					reuse = BashReuseTime * 1000;
					did_attack = true;
				}
			}
			break;
					   }
		case BERSERKER: case BERSERKERGM:
			{
				int32 num_attacks = 1 + (GetSkill(FRENZY) / 100);
				while(num_attacks > 0 && target) 
				{
					if(Attack(target))
						num_attacks--;
					else
						num_attacks = 0;
				}
				reuse = FrenzyReuseTime * 1000;
				did_attack = true;
				break;
			}
		case RANGER: case RANGERGM:
		case BEASTLORD: case BEASTLORDGM: {
			//kick
			if(level >= RuleI(Combat, NPCBashKickLevel)){
				DoAnim(animKick);
				sint32 dmg = 0;

				if(GetWeaponDamage(target, (const Item_Struct*)NULL) <= 0){
					dmg = -5;
				}
				else{
					if(target->CheckHitChance(this, KICK, 0)) {
						if(RuleB(Combat, UseIntervalAC))
							dmg = GetKickDamage();
						else
							dmg = MakeRandomInt(1, GetKickDamage());
					}
				}

				DoSpecialAttackDamage(target, KICK, dmg);
				reuse = KickReuseTime * 1000;
				did_attack = true;
			}
			break;
						}
		case CLERIC: case CLERICGM: //clerics can bash too.
		case SHADOWKNIGHT: case SHADOWKNIGHTGM:
		case PALADIN: case PALADINGM:
			{
				if(level >= RuleI(Combat, NPCBashKickLevel)){
					DoAnim(animTailRake);
					sint32 dmg = 0;

					if(GetWeaponDamage(target, (const Item_Struct*)NULL) <= 0){
						dmg = -5;
					}
					else{
						if(target->CheckHitChance(this, BASH, 0)) {
							if(RuleB(Combat, UseIntervalAC))
								dmg = GetBashDamage();
							else
								dmg = MakeRandomInt(1, GetBashDamage());
						}
					}

					DoSpecialAttackDamage(target, BASH, dmg);
					reuse = BashReuseTime * 1000;
					did_attack = true;
				}
				break;
			}
	}

	classattack_timer.Start(reuse*HasteModifier/100);
}

bool Bot::TryHeadShot(Mob* defender, SkillType skillInUse) {
	bool Result = false;

	if(defender && (defender->GetBodyType() == BT_Humanoid) && (skillInUse == ARCHERY) && (GetClass() == RANGER) && (GetLevel() >= 62)) {
		int defenderLevel = defender->GetLevel();
		int rangerLevel = GetLevel();
		// Bot Ranger Headshot AA through level 80(Secrets of Faydwer)
		if( ((defenderLevel<=48)&&(rangerLevel>=62)) || ((defenderLevel<=50)&&(rangerLevel>=66)) || ((defenderLevel<=52)&&(rangerLevel>=68)) || ((defenderLevel<=54)&&(rangerLevel>=70)) || ((defenderLevel<=56)&&(rangerLevel>=71)) ||
			((defenderLevel<=58)&&(rangerLevel>=73)) || ((defenderLevel<=60)&&(rangerLevel>=75)) || ((defenderLevel<=62)&&(rangerLevel>=76)) || ((defenderLevel<=64)&&(rangerLevel>=78)) || ((defenderLevel<=66)&&(rangerLevel>=80)) )
		{
			// WildcardX: These chance formula's below are arbitrary. If someone has a better formula that is more
			// consistent with live, feel free to update these.
			float AttackerChance = 0.20f + ((float)(rangerLevel - 51) * 0.005f);
			float DefenderChance = (float)MakeRandomFloat(0.00f, 1.00f);
			if(AttackerChance > DefenderChance) {
				mlog(COMBAT__ATTACKS, "Landed a headshot: Attacker chance was %f and Defender chance was %f.", AttackerChance, DefenderChance);
				// WildcardX: At the time I wrote this, there wasnt a string id for something like HEADSHOT_BLOW
				//entity_list.MessageClose_StringID(this, false, 200, MT_CritMelee, FINISHING_BLOW, GetName());
				entity_list.MessageClose(this, false, 200, MT_CritMelee, "%s has scored a leathal HEADSHOT!", GetName());
				defender->Damage(this, (defender->GetMaxHP()+50), SPELL_UNKNOWN, skillInUse);
				Result = true;
			}
			else {
				mlog(COMBAT__ATTACKS, "FAILED a headshot: Attacker chance was %f and Defender chance was %f.", AttackerChance, DefenderChance);
			}
		}
	}

	return Result;
}

//offensive spell aggro
sint32 Bot::CheckAggroAmount(int16 spellid) {
	sint32 AggroAmount = Mob::CheckAggroAmount(spellid);

	if(GetLevel() >= 57) {
		AggroAmount = AggroAmount * 95 / 100;
	}
	else if(GetLevel() >= 56) {
		AggroAmount = AggroAmount * 90 / 100;
	}
	else if(GetLevel() >= 55) {
		AggroAmount = AggroAmount * 80 / 100;
	}

	sint32 focusAggro = GetBotFocusEffect(botfocusHateReduction, spellid);
	AggroAmount = (AggroAmount * (100+focusAggro) / 100);

	return AggroAmount;
}

sint32 Bot::CheckHealAggroAmount(int16 spellid, int32 heal_possible) {
	sint32 AggroAmount = Mob::CheckHealAggroAmount(spellid, heal_possible);

	sint32 focusAggro = GetBotFocusEffect(botfocusHateReduction, spellid);
	
	AggroAmount = (AggroAmount * (100 + focusAggro) / 100);

	return AggroAmount;
}

void Bot::MakePet(int16 spell_id, const char* pettype, const char *petname) {
	//see if we are a special type of pet (for command filtering)
	PetType type = petOther;
	if(strncmp(pettype, "Familiar", 8) == 0) {
		type = petFamiliar;
	} else if(strncmp(pettype, "Animation", 9) == 0) {
		type = petAnimation;
	}

	if(HasPet())
		return;


	//lookup our pets table record for this type
	PetRecord record;
	if(!database.GetPetEntry(pettype, &record)) {
		Message(13, "Unable to find data for pet %s", pettype);
		LogFile->write(EQEMuLog::Error, "Unable to find data for pet %s, check pets table.", pettype);
		return;
	}

	//find the NPC data for the specified NPC type
	const NPCType *base = database.GetNPCType(record.npc_type);
	if(base == NULL) {
		Message(13, "Unable to load NPC data for pet %s", pettype);
		LogFile->write(EQEMuLog::Error, "Unable to load NPC data for pet %s (NPC ID %d), check pets and npc_types tables.", pettype, record.npc_type);
		return;
	}

	//we copy the npc_type data because we need to edit it a bit
	NPCType *npc_type = new NPCType;
	memcpy(npc_type, base, sizeof(NPCType));

	if(GetClass() == MAGICIAN)
	{
		if(GetLevel() >= 67)
		{ // Elemental Durability 3 AA
			npc_type->max_hp *= 1.10;
			npc_type->cur_hp = npc_type->max_hp;
		}
		else if(GetLevel() == 66)
		{ // Elemental Durability 2 AA
			npc_type->max_hp *= 1.05;
			npc_type->cur_hp = npc_type->max_hp;
		}
		else if(GetLevel() == 65)
		{ // Elemental Durability 1 AA
			npc_type->max_hp *= 1.02;
			npc_type->cur_hp = npc_type->max_hp;
		}
	}

	switch (GetAA(aaElementalDurability))
	{
	case 1:
		npc_type->max_hp *= 1.02;
		npc_type->cur_hp = npc_type->max_hp;
		break;
	case 2:
		npc_type->max_hp *= 1.05;
		npc_type->cur_hp = npc_type->max_hp;
		break;
	case 3:
		npc_type->max_hp *= 1.10;
		npc_type->cur_hp = npc_type->max_hp;
		break;
	}

	//TODO: think about regen (engaged vs. not engaged)

	if(petname != NULL) {
		strncpy(npc_type->name, petname, 64);
	} else if (strncmp("Familiar", pettype, 8) == 0) {
		strcpy(npc_type->name, this->GetName());
		npc_type->name[19] = '\0';
		strcat(npc_type->name, "`s_familiar");
	} else if (strncmp("BLpet",pettype, 5) == 0) {
		strcpy(npc_type->name, this->GetName());
		npc_type->name[21] = 0;
		strcat(npc_type->name, "`s_Warder");
	} else if (this->IsClient()) {
		//clients get a random pet name
		strcpy(npc_type->name, GetRandPetName());
	} else {
		strcpy(npc_type->name, this->GetCleanName());
		npc_type->name[25] = '\0';
		strcat(npc_type->name, "`s_pet");
	}


	//handle beastlord pet appearance
	if(strncmp(pettype, "BLpet", 5) == 0) {
		switch ( GetBaseRace() ) {
		case VAHSHIR: npc_type->race = TIGER; npc_type->size *= 0.8f; break;
		case TROLL: npc_type->race = ALLIGATOR; npc_type->size *= 2.5f; break;
		case OGRE: npc_type->race = BEAR; npc_type->texture=3; npc_type->gender=2; break;
		case BARBARIAN: npc_type->race = WOLF; npc_type->texture=2; break;
		case IKSAR: npc_type->race = WOLF; npc_type->texture=1; npc_type->gender=1; npc_type->size *= 2.0f; break;
		default: npc_type->race = WOLF; npc_type->texture=0; break;
		}
	}

	// handle monster summoning pet appearance
	if(strncmp(pettype, "MonsterSum", 10) == 0) {
		char errbuf[MYSQL_ERRMSG_SIZE];
		char* query = 0;
		MYSQL_RES *result = NULL;
		MYSQL_ROW row = NULL;
		uint32 monsterid;

		// get a random npc id from the spawngroups assigned to this zone
		if (database.RunQuery(query,	MakeAnyLenString(&query,
			"SELECT npcID FROM (spawnentry INNER JOIN spawn2 ON spawn2.spawngroupID = spawnentry.spawngroupID) "
			"INNER JOIN npc_types ON npc_types.id = spawnentry.npcID "
			"WHERE spawn2.zone = '%s' AND npc_types.bodytype NOT IN (11, 33, 66, 67) "
			"AND npc_types.race NOT IN (0,1,2,3,4,5,6,7,8,9,10,11,12,44,55,67,71,72,73,77,78,81,90,92,93,94,106,112,114,127,128,130,139,141,183,236,237,238,239,254,266,330,378,379,380,381,382,383,404,522) "
			"ORDER BY RAND() LIMIT 1",	zone->GetShortName()), errbuf, &result))
		{
			row = mysql_fetch_row(result);
			if (row) 
				monsterid = atoi(row[0]);
			else 
				monsterid = 567;	// since we don't have any monsters, just make it look like an earth pet for now
		}
		else {	// if the database query failed
			LogFile->write(EQEMuLog::Error, "Error querying database for monster summoning pet in zone %s (%s)", zone->GetShortName(), errbuf);
			monsterid = 567;
		}

		// give the summoned pet the attributes of the monster we found
		const NPCType* monster = database.GetNPCType(monsterid);
		if(monster) {
			npc_type->race = monster->race;
			npc_type->size = monster->size;
			npc_type->texture = monster->texture;
			npc_type->gender = monster->gender;
		}
		else {
			LogFile->write(EQEMuLog::Error, "Error loading NPC data for monster summoning pet (NPC ID %d)", monsterid);
		}

		safe_delete_array(query);
	}

	//this takes ownership of the npc_type data
	Pet *npc = new Pet(npc_type, this, type, spell_id);
	npc->SetTaunting(false);
	npc->SetOwnerID(GetID());

	if(GetBotRaidID()) {
		npc->SetBotRaidID(GetBotRaidID());
	}

	entity_list.AddNPC(npc, true, true);
	SetPetID(npc->GetID());
}

void Bot::AI_Stop() {
	Mob::AI_Stop();
	NPC::AI_Stop();
}

//this is called with 'this' as the mob being looked at, and
//iOther the mob who is doing the looking. It should figure out
//what iOther thinks about 'this'
FACTION_VALUE Bot::GetReverseFactionCon(Mob* iOther) {
#if FACTIONS_DEBUG >= 20
	LogFile->write(EQEMuLog::Debug, "called N $s::GetReverseFactionCon(%s)", GetName(), iOther->GetName());
#endif
	
	_ZP(Bot_GetReverseFactionCon);

	if(iOther->IsBot()) {
		return FACTION_ALLY;
	}

	return NPC::GetReverseFactionCon(iOther);
}

Mob* Bot::GetOwnerOrSelf() {
	Mob* Result = 0;

	if(this->GetBotOwner())
		Result = GetBotOwner();
	else
		Result = this;

	return Result;
}

Mob* Bot::GetOwner() {
	Mob* Result = 0;

	Result = GetBotOwner();

	if(!Result) {
		this->SetBotOwner(0);
	}

	return Result;
}

bool Bot::IsBotAttackAllowed(Mob* attacker, Mob* target, bool& hasRuleDefined) {
	bool Result = false;
	
	if(attacker && target) {
		if(attacker->IsClient() && target->IsBot() && attacker->CastToClient()->GetPVP() && target->CastToBot()->GetBotOwner()->CastToClient()->GetPVP()) {
			hasRuleDefined = true;
			Result = true;
		}
		else if(attacker->IsBot() && attacker->CastToBot()->GetBotOwner() && attacker->CastToBot()->GetBotOwner()->CastToClient()->GetPVP()) {
			if(target->IsBot() && target->GetOwner() && target->GetOwner()->CastToClient()->GetPVP()) {
				// my target is a bot and it's owner is pvp
				hasRuleDefined = true;

				if(target->GetOwner() == attacker->GetOwner()) {
					// no attacking if my target's owner is my owner
					Result = false;
				}
				else {
					Result = true;
				}
			}
			else if(target->IsClient() && target->CastToClient()->GetPVP()) {
				// my target is a player and it's pvp
				hasRuleDefined = true;

				if(target == attacker->GetOwner()) {
					// my target cannot be my owner
					Result = false;
				}
				else {
					Result = true;
				}
			}
		}
		else if(attacker->IsClient() && target->IsBot()) {
			hasRuleDefined = true;
			Result = false;
		}
		else if(attacker->IsBot() && target->IsNPC()) {
			hasRuleDefined = true;
			Result = true;
		}
		else if(attacker->IsBot() && !target->IsNPC()) {
			hasRuleDefined = true;
			Result = false;
		}
		else if(attacker->IsPet() && attacker->IsFamiliar()) {
			hasRuleDefined = true;
			Result = false;
		}
	}

	return Result;
}

void Bot::EquipBot(std::string* errorMessage) {
	if(_botInventory.empty()) {
		_botInventory = GetBotItems(errorMessage);
	}

	if(!_botInventory.empty()) {
		for(int i = 0; i < 22; i++) {
			uint32 itemID = 0;
			itemID = GetBotItem(i);

			if(itemID != 0) {
				const Item_Struct* item2 = database.GetItem(itemID);
				BotTradeAddItem(itemID, item2->MaxCharges, item2->Slots, i, errorMessage, false);

				if(!errorMessage->empty())
					return;
			}
		}
	}
}

// This method is meant to be called by zone or client methods to clean up objects when a client camps, goes LD, zones out or something like that.
void Bot::DestroyBotObjects(Client* client) {
	if(client) {
		if(client->GetBotRaidID() > 0) {
			BotRaids* br = entity_list.GetBotRaidByMob(client);
			if(br) {
				br->RemoveRaidBots();
				br = NULL;
			}
		}

		BotOrderCampAll(client);
	}
}

// Orders all the bots owned by the specified client bot owner to camp out of the game
void Bot::BotOrderCampAll(Client* c) {
	if(c) {
		std::list<Bot*> BotList = entity_list.GetBotsByBotOwnerCharacterID(c->CharacterID());

		if(!BotList.empty()) {
			for(std::list<Bot*>::iterator botListItr = BotList.begin(); botListItr != BotList.end(); botListItr++) {
				(*botListItr)->Camp();
			}
		}
	}
}

sint32 Bot::CalcMaxMana() {
	sint32 WisInt = 0;
	sint32 MindLesserFactor, MindFactor;
	switch (GetCasterClass()) {
		case 'I':
			WisInt = GetINT();
			if((( WisInt - 199 ) / 2) > 0) {
				MindLesserFactor = ( WisInt - 199 ) / 2;
			}
			else {
				MindLesserFactor = 0;
			}
			MindFactor = WisInt - MindLesserFactor;
			if(WisInt > 100) {
				max_mana = (((5 * (MindFactor + 20)) / 2) * 3 * GetLevel() / 40);
			}
			else {
				max_mana = (((5 * (MindFactor + 200)) / 2) * 3 * GetLevel() / 100);
			}
			max_mana += (itembonuses.Mana + spellbonuses.Mana);
			break;

		case 'W':
			WisInt = GetWIS();
			if((( WisInt - 199 ) / 2) > 0) {
				MindLesserFactor = ( WisInt - 199 ) / 2;
			}
			else {
				MindLesserFactor = 0;
			}
			MindFactor = WisInt - MindLesserFactor;
			if(WisInt > 100) {
				max_mana = (((5 * (MindFactor + 20)) / 2) * 3 * GetLevel() / 40);
			}
			else {
				max_mana = (((5 * (MindFactor + 200)) / 2) * 3 * GetLevel() / 100);
			}
			max_mana += (itembonuses.Mana + spellbonuses.Mana);
			break;

		default:
			max_mana = 0;
			break;
	}
	return max_mana;
}

void Bot::SetAttackTimer() {
	float PermaHaste;
	if(GetHaste() > 0)
		PermaHaste = 1 / (1 + (float)GetHaste()/100);
	else if(GetHaste() < 0)
		PermaHaste = 1 * (1 - (float)GetHaste()/100);
	else
		PermaHaste = 1.0f;

	//default value for attack timer in case they have
	//an invalid weapon equipped:
	attack_timer.SetAtTrigger(4000, true);

	Timer* TimerToUse = NULL;
	const Item_Struct* PrimaryWeapon = NULL;

	for (int i=SLOT_RANGE; i<=SLOT_SECONDARY; i++) {

		//pick a timer
		if (i == SLOT_PRIMARY)
			TimerToUse = &attack_timer;
		else if (i == SLOT_RANGE)
			TimerToUse = &ranged_timer;
		else if(i == SLOT_SECONDARY)
			TimerToUse = &attack_dw_timer;
		else	//invalid slot (hands will always hit this)
			continue;

		const Item_Struct* ItemToUse = NULL;

		//find our item
		//The code before here was fundementally flawed because equipment[] 
		//isn't the same as PC inventory and also:
		//NPCs don't use weapon speed to dictate how fast they hit anyway.
		ItemToUse = NULL;

		// BEGIN CODE BLOCK UNIQUE TO A BOT
		int j = 0;
		switch(i) {
				case SLOT_PRIMARY:
					j = MATERIAL_PRIMARY;
					break;
				case SLOT_SECONDARY:
				case SLOT_RANGE:
					j = MATERIAL_SECONDARY;
					break;
				default:
					j = MATERIAL_PRIMARY;
					break;
		}
		int32 eid = CastToNPC()->GetEquipment(j);
		if(eid != 0)
			ItemToUse = database.GetItem(eid);
		// END CODE BLOCK UNIQUE TO A BOT

		//special offhand stuff
		if(i == SLOT_SECONDARY) {
			//if we have a 2H weapon in our main hand, no dual
			if(PrimaryWeapon != NULL) {
				if(	PrimaryWeapon->ItemClass == ItemClassCommon
					&& (PrimaryWeapon->ItemType == ItemType2HS
					||	PrimaryWeapon->ItemType == ItemType2HB
					||	PrimaryWeapon->ItemType == ItemType2HPierce)) {
						attack_dw_timer.Disable();
						continue;
				}
			}

			//clients must have the skill to use it...
			if(GetLevel() < 13) {
				attack_dw_timer.Disable();
				continue;
			}
		}

		//see if we have a valid weapon
		if(ItemToUse != NULL) {
			//check type and damage/delay
			if(ItemToUse->ItemClass != ItemClassCommon 
				|| ItemToUse->Damage == 0 
				|| ItemToUse->Delay == 0) {
					//no weapon
					ItemToUse = NULL;
			}
			// Check to see if skill is valid
			else if((ItemToUse->ItemType > ItemTypeThrowing) && (ItemToUse->ItemType != ItemTypeHand2Hand) && (ItemToUse->ItemType != ItemType2HPierce)) {
				//no weapon
				ItemToUse = NULL;
			}
		}

		//if we have no weapon..
		if (ItemToUse == NULL) {
			//above checks ensure ranged weapons do not fall into here
			// Work out if we're a monk
			if ((GetClass() == MONK) || (GetClass() == BEASTLORD)) {
				//we are a monk, use special delay
				int speed = (int)(GetMonkHandToHandDelay()*(100.0f+attack_speed)*PermaHaste);
				// neotokyo: 1200 seemed too much, with delay 10 weapons available
				if(speed < 800)	//lower bound
					speed = 800;
				TimerToUse->SetAtTrigger(speed, true);	// Hand to hand, delay based on level or epic
			} else {
				//not a monk... using fist, regular delay
				int speed = (int)(36*(100.0f+attack_speed)*PermaHaste);
				//if(speed < 800 && IsClient())	//lower bound
				//	speed = 800;
				TimerToUse->SetAtTrigger(speed, true); 	// Hand to hand, non-monk 2/36
			}
		} else {
			//we have a weapon, use its delay
			// Convert weapon delay to timer resolution (milliseconds)
			//delay * 100
			int speed = (int)(ItemToUse->Delay*(100.0f+attack_speed)*PermaHaste);
			if(speed < 800)
				speed = 800;

			if(ItemToUse && (ItemToUse->ItemType == ItemTypeBow || ItemToUse->ItemType == ItemTypeThrowing))
			{
				/*if(IsClient())
				{
					float max_quiver = 0;
					for(int r = SLOT_PERSONAL_BEGIN; r <= SLOT_PERSONAL_END; r++) 
					{
						const ItemInst *pi = CastToClient()->GetInv().GetItem(r);
						if(!pi)
							continue;
						if(pi->IsType(ItemClassContainer) && pi->GetItem()->BagType == bagTypeQuiver)
						{
							float temp_wr = (pi->GetItem()->BagWR / 3);
							if(temp_wr > max_quiver)
							{
								max_quiver = temp_wr;
							}
						}
					}
					if(max_quiver > 0)
					{
						float quiver_haste = 1 / (1 + max_quiver / 100);
						speed *= quiver_haste;
					}
				}*/
			}
			TimerToUse->SetAtTrigger(speed, true);
		}

		if(i == SLOT_PRIMARY)
			PrimaryWeapon = ItemToUse;
	}	
}

sint32 Bot::GetActSpellDamage(int16 spell_id, sint32 value) {
	sint32 modifier = 100;
	int8 casterClass = GetClass();
	int8 casterLevel = GetLevel();

	//Dunno if this makes sense:
	if (spells[spell_id].resisttype > 0)
		modifier += 5;


	int tt = spells[spell_id].targettype;
	if (tt == ST_UndeadAE || tt == ST_Undead || tt == ST_Summoned) {
		//undead/summoned spells
		modifier += 10;
	} else {
		//damage spells.
		modifier += 5;
	}

	//these spell IDs could be wrong
	if (spell_id == SPELL_LEECH_TOUCH) {	//leech touch
		if(casterLevel >= 65) { // Consumption of the Soul 3 AA
			value -= 1500;
		}
		else if(casterLevel >= 63) { // Consumption of the Soul 2 AA
			value -= 1000;
		}
		else if(casterLevel >= 61) { // Consumption of the Soul 1 AA
			value -= 500;
		}
	}
	if (spell_id == SPELL_IMP_HARM_TOUCH) {	//harm touch
		if(casterLevel >= 65) { // Unholy Touch 3 AA
			modifier += 75;
		}
		else if(casterLevel >= 63) { // Unholy Touch 2 AA
			modifier += 50;
		}
		else if(casterLevel >= 61) { // Unholy Touch 1 AA
			modifier += 25;
		}
	}

	//spell crits, dont make sense if cast on self.
	if(tt != ST_Self) {
		int chance = RuleI(Spells, BaseCritChance) + 1;
		sint32 ratio = RuleI(Spells, BaseCritRatio);

		//here's an idea instead of bloating code with unused cases there's this thing called:
		//case 'default'
		switch(casterClass)
		{
		case WIZARD:
			{
				if (casterLevel >= RuleI(Spells, WizCritLevel)) {
					chance += RuleI(Spells, WizCritChance);
					ratio += RuleI(Spells, WizCritRatio);
				}
				break;
			}

		default: 
			break;
		}

		if((casterClass == MONK) || (casterClass == ROGUE) || (casterClass == WARRIOR) || (casterClass == BERSERKER)) {
			if(casterLevel >= 65) { // Ingenuity 3 AA
				ratio += 100;
				chance += 3;
			}
			else if(casterLevel >= 63) { // Ingenuity 2 AA
				ratio += 75;
				chance += 2;
			}
			else if(casterLevel >= 61) { // Ingenuity 1 AA
				ratio += 50;
				chance += 1;
			}
		}

		if((casterClass != WARRIOR) && (casterClass != ROGUE) && (casterClass != MONK) && (casterClass != BERSERKER)) {
			if(casterLevel >= 66) { // Advanced Fury of Magic 2 AA
				chance += 20;
			}
			else if(casterLevel >= 65) { // Fury of Magic 3 AA or Advanced Fury of Magic 1 AA
				chance += 18;
			}
			else if(casterLevel >= 63) { // Fury of Magic 2 AA
				chance += 16;
			}
			else if(casterLevel >= 61) { // Fury of Magic 1 AA or Spell Casting Fury Mastery 3 AA
				chance += 14;
			}
			else if(casterLevel >= 60) { // Spell Casting Fury Mastery 2 AA
				chance += 12;
			}
			else if(casterLevel >= 59) { // Spell Casting Fury Mastery 1 AA
				chance += 10;
			}
			else if(casterLevel >= 57) { // Spell Casting Fury 3 AA
				chance += 7;
			}
			else if(casterLevel >= 56) { // Spell Casting Fury 2 AA
				chance += 4;
			}
			else if(casterLevel >= 55) { // Spell Casting Fury 1 AA
				chance += 2;
			}
		}

		if(tt == ST_Tap) {

			if(spells[spell_id].classes[SHADOWKNIGHT-1] >= 254 && spell_id != SPELL_LEECH_TOUCH) {
				if(ratio < 100)	//chance increase and ratio are made up, not confirmed
					ratio = 100;

				if(casterClass == SHADOWKNIGHT) {
					if(casterLevel >= 61) { // Soul Abrasion 3 AA
						modifier += 300;
					}
					else if(casterLevel >= 60) { // Soul Abrasion 2 AA
						modifier += 200;
					}
					else if(casterLevel >= 59) { // Soul Abrasion1 AA
						modifier += 100;
					}
				}
			}
		}

		//crit damage modifiers
		if (casterClass == WIZARD) { //wizards get an additional bonus
			if(casterLevel >= 70) { // Destructive Fury 3 AA
				ratio += 24;
			}
			else if(casterLevel >= 68) { // Destructive Fury 2 AA
				ratio += 16;
			}
			else if(casterLevel >= 66) { // Destructive Fury 1 AA
				ratio += 8;
			}
		}
		else {
			if(casterLevel >= 70) { // Destructive Fury 3 AA
				ratio += 16;
			}
			else if(casterLevel >= 68) { // Destructive Fury 2 AA
				ratio += 8;
			}
			else if(casterLevel >= 66) { // Destructive Fury 1 AA
				ratio += 4;
			}
		}

		if (chance > 0) {
			mlog(SPELLS__CRITS, "Attempting spell crit. Spell: %s (%d), Value: %d, Modifier: %d, Chance: %d, Ratio: %d", spells[spell_id].name, spell_id, value, modifier, chance, ratio);
			if(MakeRandomInt(1,100) <= chance) {
				modifier += modifier*ratio/100;
				mlog(SPELLS__CRITS, "Spell crit successful. Final damage modifier: %d, Final Damage: %d", modifier, (value * modifier) / 100);
				entity_list.MessageClose(this, false, 100, MT_SpellCrits, "%s delivers a critical blast! (%d)", GetName(), ((-value * modifier) / 100));	
			} else 
				mlog(SPELLS__CRITS, "Spell crit failed. Final Damage Modifier: %d, Final Damage: %d", modifier, (value * modifier) / 100);
		}
	}

	return (value * modifier) / 100;
}

sint32 Bot::GetActSpellHealing(int16 spell_id, sint32 value) {
	sint32 modifier = 100;

	modifier += GetBotFocusEffect(botfocusImprovedHeal, spell_id);

	if(spells[spell_id].buffduration < 1) {
		uint8 botlevel = GetLevel();
		int8 botclass = GetClass();
		int chance = 0;

		if((botclass == BEASTLORD)||(botclass == CLERIC)||(botclass == DRUID)||(botclass == PALADIN)||(botclass == RANGER)||(botclass == SHAMAN)) {
			if(botlevel >= 57) { // Healing Adept AA
				modifier += 10;
			}
			else if(botlevel == 56) {
				modifier += 5;
			}
			else if(botlevel == 55) {
				modifier += 2;
			}

			if(botlevel >= 64) { // Advanced Healing Adept AA
				modifier += 9;
			}
			else if(botlevel == 63) {
				modifier += 6;
			}
			else if(botlevel == 62) {
				modifier += 3;
			}

			if(botlevel >= 57) { // Healing Gift AA
				chance = 10;
			}
			else if(botlevel == 56) {
				chance = 6;
			}
			else if(botlevel == 55) {
				chance = 3;
			}

			if(botlevel >= 64) { // Advanced Healing Gift AA
				chance += 6;
			}
			else if(botlevel == 63) {
				chance += 4;
			}
			else if(botlevel == 62) {
				chance += 2;
			}
		}

		if((botclass == NECROMANCER)||(botclass == SHADOWKNIGHT)) {
			if(spells[spell_id].targettype == ST_Tap) {
				if(botlevel >= 65) { // Theft of Life
					chance += 10;
				}
				else if(botlevel == 63) {
					chance += 5;
				}
				else if(botlevel == 61) {
					chance += 2;
				}

				if(botlevel >= 66) { // Advanced Theft of Life
					chance += 6;
				}
				else if(botlevel == 65) {
					chance += 3;
				}

				if(botlevel >= 69) { // Soul Thief
					chance += 6;
				}
				else if(botlevel == 68) {
					chance += 4;
				}
				else if(botlevel == 67) {
					chance += 2;
				}
			}
		}

		if(MakeRandomInt(1,100) < chance) {
			entity_list.MessageClose(this, false, 100, MT_SpellCrits, "%s performs an exceptional heal! (%d)", GetName(), ((value * modifier) / 50));		
			return (value * modifier) / 50;
		}
		else{
			return (value * modifier) / 100;
		}		
	}

	return (value * modifier) / 100;
}

sint32 Bot::GetActSpellCasttime(int16 spell_id, sint32 casttime) {
	sint32 cast_reducer = 0;
	cast_reducer += GetBotFocusEffect(botfocusSpellHaste, spell_id);

	uint8 botlevel = GetLevel();
	int8 botclass = GetClass();

	if (botlevel >= 51 && casttime >= 3000 && !BeneficialSpell(spell_id) 
		&& (botclass == SHADOWKNIGHT || botclass == RANGER || botclass == PALADIN || botclass == BEASTLORD ))
		cast_reducer += (GetLevel()-50)*3;

	if((casttime >= 4000) && BeneficialSpell(spell_id) && (CalcBuffDuration(this, this, spell_id) > 0)) {
		if((botclass == ENCHANTER)||(botclass == WIZARD)||(botclass == NECROMANCER)||(botclass == MAGICIAN)||(botclass == SHADOWKNIGHT)) {
			if(botlevel >= 57) { // Spell Casting Deftness AA
				cast_reducer += 25;
			}
			else if(botlevel == 56) {
				cast_reducer += 10;
			}
			else if(botlevel == 55) {
				cast_reducer += 5;
			}
		}

		if((botclass == ENCHANTER)||(botclass == SHAMAN)) {
			if(botlevel >= 61) { // Quick Buff AA
				cast_reducer += 50;
			}
			else if(botlevel == 60) {
				cast_reducer += 25;
			}
			else if(botlevel == 59) {
				cast_reducer += 10;
			}
		}
	}

	if(IsSummonSpell(spell_id)) {
		if(botclass == MAGICIAN) {
			if(botlevel >= 61) { // Quick Summoning AA
				cast_reducer += 50;
			}
			else if(botlevel == 60) {
				cast_reducer += 25;
			}
			else if(botlevel == 59) {
				cast_reducer += 10;
			}
		}
	}

	if(IsEvacSpell(spell_id)) {
		if((botclass == DRUID)||(botclass == WIZARD)) {
			if(botlevel >= 61) { // Quick Evacuation AA
				cast_reducer += 50;
			}
			else if(botlevel == 60) {
				cast_reducer += 25;
			}
			else if(botlevel == 59) {
				cast_reducer += 10;
			}
		}
	}

	if(IsDamageSpell(spell_id) && spells[spell_id].cast_time >= 4000) {
		if((botclass == DRUID)||(botclass == WIZARD)) {
			if(botlevel >= 61) { // Quick Damage AA
				cast_reducer += 10;
			}
			else if(botlevel == 60) {
				cast_reducer += 5;
			}
			else if(botlevel == 59) {
				cast_reducer += 2;
			}
		}
	}
	if (cast_reducer > 50)
		cast_reducer = 50;	//is this just an arbitrary limit?

	casttime = (casttime*(100 - cast_reducer)/100);

	return casttime;
}

sint32 Bot::GetActSpellCost(int16 spell_id, sint32 cost) {
	sint32 Result = 0;

	if(GetClass() == WIZARD || GetClass() == ENCHANTER || GetClass() == MAGICIAN || GetClass() == NECROMANCER || GetClass() == DRUID || GetClass() == SHAMAN || GetClass() == CLERIC || GetClass() == BARD) {
		// This formula was derived from the following resource:
		// http://www.eqsummoners.com/eq1/specialization-library.html
		// WildcardX
		float PercentManaReduction = 0;
		float PercentOfMaxSpecializeSkill = 0;
		float MaxSpecilizationSkillAllowed = GetSkill(spells[spell_id].skill);
		float SpecializeSkill = GetSpecializeSkillValue(spell_id);
		int SuccessChance = MakeRandomInt(1, 100);

		if(MaxSpecilizationSkillAllowed > 0)
			PercentOfMaxSpecializeSkill = SpecializeSkill / MaxSpecilizationSkillAllowed;

		if(SuccessChance <= (PercentOfMaxSpecializeSkill * 100))
			PercentManaReduction = (SpecializeSkill * .053) - 5.65;

		if(GetLevel() >= 57) { // Spell Casting Mastery
			PercentManaReduction += 30;
		}
		else if(GetLevel() == 56) {
			PercentManaReduction += 15;
		}
		else if(GetLevel() == 55) {
			PercentManaReduction += 5;
		}

		PercentManaReduction += GetBotFocusEffect(botfocusManaCost, spell_id);
		cost -= (cost * (PercentManaReduction / 100));
	}

	if(cost < 0)
		cost = 0;

	Result = cost;

	return Result;
}

float Bot::GetActSpellRange(int16 spell_id, float range) {
	float extrange = 100;
	extrange += GetBotFocusEffect(botfocusRange, spell_id);
	return (range * extrange) / 100;
}

sint32 Bot::GetActSpellDuration(int16 spell_id, sint32 duration) {
	int increase = 100;
	increase += GetBotFocusEffect(botfocusSpellDuration, spell_id);

	if(GetLevel() >= 57) { // Spell Casting Reinforcement AA
		increase += 30;
	}
	else if(GetLevel() == 56) {
		increase += 15;
	}
	else if(GetLevel() == 55) {
		increase += 5;
	}

	if(GetLevel() >= 59) { // Spell Casting Reinforcement Mastery AA
		increase += 20;
	}

	return (duration * increase) / 100;
}

float Bot::GetAOERange(uint16 spell_id) {
	float range = 0;
	
	range = Mob::GetAOERange(spell_id);

	if(spell_id > 0) {
		float mod = 0;
		if(IsBardSong(spell_id)) {
			if(GetLevel() >= 61) { // Extended Notes AA
				mod += range * 0.25;
			}
			else if(GetLevel() == 60) {
				mod += range * 0.15;
			}
			else if(GetLevel() == 59) {
				mod += range * 0.10;
			}

			if(GetLevel() >= 65) { // Sionachies Crescendo AA
				mod += range * 0.15;
			}
			else if(GetLevel() == 64) {
				mod += range * 0.10;
			}
			else if(GetLevel() == 63) {
				mod += range * 0.05;
			}
			range += mod;
		}

		range = GetActSpellRange(spell_id, range);
	}

	return range;
}

bool Bot::SpellEffect(Mob* caster, int16 spell_id, float partial) {
	bool Result = false;
	
	Result = Mob::SpellEffect(caster, spell_id, partial);

    // Franck-add: If healed/doted, a bot must show its new HP to its leader
	if(IsGrouped()) {
		Group *g = GetGroup();
		if(g) {
			EQApplicationPacket hp_app;
			CreateHPPacket(&hp_app);
			for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
				if(g->members[i] && g->members[i]->IsClient()) {
					g->members[i]->CastToClient()->QueuePacket(&hp_app);
				}
			}
		}
	}

	return Result;
}

void Bot::DoBuffTic(int16 spell_id, int32 ticsremaining, int8 caster_level, Mob* caster) {
	if(caster && !caster->IsCorpse())
		Mob::DoBuffTic(spell_id, ticsremaining, caster_level, caster);
}

bool Bot::CastSpell(int16 spell_id, int16 target_id, int16 slot, sint32 cast_time, sint32 mana_cost, int32* oSpellWillFinish, int32 item_slot) {
	bool Result = false;

	if(zone && !zone->IsSpellBlocked(spell_id, GetX(), GetY(), GetZ())) {
		_ZP(Bot_CastSpell);

		mlog(SPELLS__CASTING, "CastSpell called for spell %s (%d) on entity %d, slot %d, time %d, mana %d, from item slot %d",
			spells[spell_id].name, spell_id, target_id, slot, cast_time, mana_cost, (item_slot==0xFFFFFFFF)?999:item_slot);

		if(casting_spell_id == spell_id)
			ZeroCastingVars();

		if(GetClass() != BARD) {
			if(!IsValidSpell(spell_id) || casting_spell_id || delaytimer || spellend_timer.Enabled() || IsStunned() || IsFeared() || IsMezzed() || IsSilenced()) {
				mlog(SPELLS__CASTING_ERR, "Spell casting canceled: not able to cast now. Valid? %d, casting %d, waiting? %d, spellend? %d, stunned? %d, feared? %d, mezed? %d, silenced? %d",
					IsValidSpell(spell_id), casting_spell_id, delaytimer, spellend_timer.Enabled(), IsStunned(), IsFeared(), IsMezzed(), IsSilenced() );
				if(IsSilenced())
					Message_StringID(13, SILENCED_STRING);
				if(casting_spell_id)
					AI_Event_SpellCastFinished(false, casting_spell_slot);
				return(false);
			}
		}

		if(IsDetrimentalSpell(spell_id) && !zone->CanDoCombat()){
			Message_StringID(13, SPELL_WOULDNT_HOLD);
			if(casting_spell_id)
				AI_Event_SpellCastFinished(false, casting_spell_slot);
			return(false);
		}

		//cannot cast under deivne aura
		if(DivineAura()) {
			mlog(SPELLS__CASTING_ERR, "Spell casting canceled: cannot cast while Divine Aura is in effect.");
			InterruptSpell(173, 0x121, false);
			return(false);
		}

		// check for fizzle
		// note that CheckFizzle itself doesn't let NPCs fizzle,
		// but this code allows for it.
		if(slot < MAX_PP_MEMSPELL && !CheckFizzle(spell_id))
		{
			int fizzle_msg = IsBardSong(spell_id) ? MISS_NOTE : SPELL_FIZZLE;
			InterruptSpell(fizzle_msg, 0x121, spell_id);

			uint32 use_mana = ((spells[spell_id].mana) / 4);
			mlog(SPELLS__CASTING_ERR, "Spell casting canceled: fizzled. %d mana has been consumed", use_mana);

			// fizzle 1/4 the mana away
			SetMana(GetMana() - use_mana);
			return(false);
		}

		if (HasActiveSong()) {
			mlog(SPELLS__BARDS, "Casting a new spell/song while singing a song. Killing old song %d.", bardsong);
			//Note: this does NOT tell the client
			//_StopSong();
			bardsong = 0;
			bardsong_target_id = 0;
			bardsong_slot = 0;
			bardsong_timer.Disable();
		}

		Result = DoCastSpell(spell_id, target_id, slot, cast_time, mana_cost, oSpellWillFinish, item_slot);
	}

	return Result;
}

bool Bot::SpellOnTarget(int16 spell_id, Mob* spelltar) {
	bool Result = false;

	if(!IsValidSpell(spell_id))
		return false;

	if(spelltar) {
		if(spelltar->IsBot() && (spells[spell_id].targettype == ST_GroupTeleport)) {
			// So I made this check because teleporting a group of bots tended to crash the zone
			// It seems several group spells also show up as ST_GroupTeleport for some
			// reason so I now have to check by spell id. These appear to be Group v1 spells and
			// Heal over Time spells.
			switch(spell_id) {
				// Paladin
			case 3577: // Wave of Life
			case 4065: // Blessing of Austerity
			case 1455: // Wave of Healing
			case 2589: // Healing Wave of Prexus
			case 3427: // Wave of Marr
			case 3683: // Ethereal Cleansing
			case 1283: // Celestial Cleansing
			case 3485: // Supernal Cleansing
			case 5293: // Pious Cleansing
			case 4893: // Wave of Trushar
			case 5295: // Jeron's Mark
			case 5296: // Wave of Piety
				// Bard
			case 4085: // Forpar's Aria of Affliction
			case 4083: // Rizlona's Embers
			case 4086: // Forpar's Psalm of Pain
			case 4084: // Rizlona's Fire
			case 6734: // Song of the Storm
			case 3651: // Wind of Marr
			case 4087: // Forpar's Verse of Venom
			case 3362: // Rizlona's Call of Flame
			case 4112: // Call of the Muse
			case 4872: // Echo of the Trusik
			case 4873: // Dark Echo
			case 5377: // Cantata of Life
			case 5380: // Yelhun's Mystic Call
			case 5382: // Eriki's Psalm of Power
			case 6666: // Storm Blade
			case 5388: // Ancient Call of Power
				// Cleric
			case 134: // Word of Health
			case 136: // Word of Healing
			case 1520: // Word of Vigor
			case 1521: // Word of Restoration
			case 1523: // Word of Redemption
			case 3471: // Word of Replenishment
			case 5270: // Word of Vivification
			case 2502: // Celestial Remedy
			case 2175: // Celestial Health
			case 1444: // Celestial Healing
			case 1522: // Celestial Elixir
			case 2180: // Etherial Elixir
			case 3047: // Kazad's Mark
			case 3475: // Supernal Elixir
			case 4053: // Blessing of Temperance
			case 4108: // Aura of Reverence
			case 4882: // Holy Elixir
			case 5259: // Pious Elixir
			case 5272: // Aura of Devotion
			case 5277: // Balikor's Mark
				// Enchanter
			case 5517: // Circle of Alendar
			case 6671: // Rune of Rikkukin
			case 6739: // Rune of the Scale
				// Shaman
			case 2521: // Talisman of the Beast
			case 4055: // Pack Shrew
			case 3842: // Blood of Nadox
			case 5417: // Champion
				// Druid
			case 4058: // Feral Pack
			case 2520: // Natures Recovery
				break;
			default:
				return false;
			}
		}

		//Franck-add: can't detrimental spell on bots and bots can't detriment on you or the others bots
		if((IsDetrimentalSpell(spell_id) && spelltar->IsBot()) || (IsDetrimentalSpell(spell_id) && spelltar->IsClient()))
			return false;

		if(spelltar->IsPet()) {
			for(int i=0; i<EFFECT_COUNT; ++i)
			{
				if(spells[spell_id].effectid[i] == SE_Illusion)
					return false;
			}
		}

		Result = Mob::SpellOnTarget(spell_id, spelltar);
	}

	return Result;
}

bool Bot::IsImmuneToSpell(int16 spell_id, Mob *caster) {
	bool Result = false;

	if(!caster)
		return false;

	// TODO: Remove hard coded zone id's
	if(!IsSacrificeSpell(spell_id) && !(zone->GetZoneID() == 202) && !(this == caster)) {
		Result = Mob::IsImmuneToSpell(spell_id, caster);

		if(!Result) {
			if(caster->IsBot()) {
				if(spells[spell_id].targettype == ST_Undead) {
					if((GetBodyType() != BT_SummonedUndead) && (GetBodyType() != BT_Undead) && (GetBodyType() != BT_Vampire)) {
							mlog(SPELLS__RESISTS, "Bot's target is not an undead.");
							return true;
					}
				}
				if(spells[spell_id].targettype == ST_Summoned) {
					if((GetBodyType() != BT_SummonedUndead)
						&& (GetBodyType() != BT_Summoned)
						&& (GetBodyType() != BT_Summoned2)
						&& (GetBodyType() != BT_Summoned3)
						) {
							mlog(SPELLS__RESISTS, "Bot's target is not a summoned creature.");
							return true;
					}
				}
			}

			mlog(SPELLS__RESISTS, "No bot immunities to spell %d found.", spell_id);
		}
	}

	return Result;
}

bool Bot::DetermineSpellTargets(uint16 spell_id, Mob *&spell_target, Mob *&ae_center, CastAction_type &CastAction) {
	bool Result = false;

	SpellTargetType targetType = spells[spell_id].targettype;


	// This is so PoK NPC Necro/Shd can create essence emeralds for pc's from perl scripts
	if(targetType == ST_GroupClient) {
		if(((spell_id == 1768) && (zone->GetZoneID() == 202)) || (!IsDetrimentalSpell(spell_id))) {
			CastAction = SingleTarget;
			return true;
		}
	}

	Result = Mob::DetermineSpellTargets(spell_id, spell_target, ae_center, CastAction);

	return Result;
}

bool Bot::DoCastSpell(int16 spell_id, int16 target_id, int16 slot, sint32 cast_time, sint32 mana_cost, int32* oSpellWillFinish, int32 item_slot) {
	bool Result = false;
	
	if(GetClass() == BARD) { 
		// Bard bots casting time is interrupting thier melee
		cast_time = 0;
	}

	Result = Mob::DoCastSpell(spell_id, target_id, slot, cast_time, mana_cost, oSpellWillFinish, item_slot);

	if(oSpellWillFinish) {
		const SPDat_Spell_Struct &spell = spells[spell_id];
		*oSpellWillFinish = Timer::GetCurrentTime() + ((spell.recast_time > 20000) ? 10000 : spell.recast_time);
	}

	return Result;
}

void Bot::GenerateBaseManaPoints() {
	// Now, we need to calc the base mana.
	sint32 bot_mana = 0;
	sint32 WisInt = 0;
	sint32 MindLesserFactor, MindFactor;
	switch (GetCasterClass()) {
		case 'I':
			WisInt = INT;
			if((( WisInt - 199 ) / 2) > 0) {
				MindLesserFactor = ( WisInt - 199 ) / 2;
			}
			else {
				MindLesserFactor = 0;
			}
			MindFactor = WisInt - MindLesserFactor;
			if(WisInt > 100) {
				bot_mana = (((5 * (MindFactor + 20)) / 2) * 3 * GetLevel() / 40);
			}
			else {
				bot_mana = (((5 * (MindFactor + 200)) / 2) * 3 * GetLevel() / 100);
			}
			bot_mana += (itembonuses.Mana + spellbonuses.Mana);
			break;

		case 'W':
			WisInt = WIS;
			if((( WisInt - 199 ) / 2) > 0) {
				MindLesserFactor = ( WisInt - 199 ) / 2;
			}
			else {
				MindLesserFactor = 0;
			}
			MindFactor = WisInt - MindLesserFactor;
			if(WisInt > 100) {
				bot_mana = (((5 * (MindFactor + 20)) / 2) * 3 * GetLevel() / 40);
			}
			else {
				bot_mana = (((5 * (MindFactor + 200)) / 2) * 3 * GetLevel() / 100);
			}
			bot_mana += (itembonuses.Mana + spellbonuses.Mana);
			break;

		default:
			bot_mana = 0;
			break;
	}

	max_mana = cur_mana = bot_mana;
}

void Bot::GenerateSpecialAttacks() {
	// Special Attacks
	if(((GetClass() == MONK) || (GetClass() == WARRIOR) || (GetClass() == RANGER) || (GetClass() == BERSERKER))	&& (GetLevel() >= 60)) {
		SpecAttacks[SPECATK_TRIPLE] = true;
	}
}

bool Bot::DoFinishedSpellAETarget(int16 spell_id, Mob* spellTarget, int16 slot, bool& stopLogic) {
	if(GetClass() == BARD) {
		if(!ApplyNextBardPulse(bardsong, this, bardsong_slot)) {
			InterruptSpell(SONG_ENDS_ABRUPTLY, 0x121, bardsong);
		}
		stopLogic = true;
	}

	return true;
}

bool Bot::DoFinishedSpellSingleTarget(int16 spell_id, Mob* spellTarget, int16 slot, bool& stopLogic) {
	if(spellTarget) {
		if(IsGrouped() && (spellTarget->IsBot() || spellTarget->IsClient()) && RuleB(Bots, BotGroupBuffing)) {
			//NPC *bot = this->CastToNPC();
			bool noGroupSpell = false;
			int16 thespell = spell_id;

			for(int i=0; i < AIspells.size(); i++) {
				int j = BotGetSpells(i);
				int spelltype = BotGetSpellType(i);
				bool spellequal = (j == thespell);
				bool spelltypeequal = ((spelltype == 2) || (spelltype == 16) || (spelltype == 32));
				bool spelltypetargetequal = ((spelltype == 8) && (spells[thespell].targettype == ST_Self));
				bool spelltypeclassequal = ((spelltype == 1024) && (GetClass() == SHAMAN));
				bool slotequal = (slot == USE_ITEM_SPELL_SLOT);

				// if it's a targeted heal or escape spell or pet spell or it's self only buff or self buff weapon proc, we only want to cast it once
				if(spellequal || slotequal) {
					if((spelltypeequal || spelltypetargetequal) || spelltypeclassequal || slotequal) {
						// Don't let the Shaman canni themselves to death
						if(((spells[thespell].effectid[0] == 0) && (spells[thespell].base[0] < 0)) && 
							(spellTarget->GetHP() < ((spells[thespell].base[0] * (-1)) + 100))) {
							return false;
						}

						SpellOnTarget(thespell, spellTarget);
						noGroupSpell = true;
						stopLogic = true;
					}
				}
			}

			if(!noGroupSpell) {
				Group *g = GetGroup();
				if(g) {
					for(int i=0; i<MAX_GROUP_MEMBERS;i++) {
						if(g->members[i]) {
							if((g->members[i]->GetClass() == NECROMANCER) &&
								(IsEffectInSpell(thespell, SE_AbsorbMagicAtt) || IsEffectInSpell(thespell, SE_Rune))) {
								// don't cast this on necro's, their health to mana
								// spell eats up the rune spell and it just keeps
								// getting recast over and over
							}
							else
							{
								SpellOnTarget(thespell, g->members[i]);
							}
							if(g->members[i] && g->members[i]->GetPetID()) {
								SpellOnTarget(thespell, g->members[i]->GetPet());
							}
						}
					}
					SetMana(GetMana() - (GetActSpellCost(thespell, spells[thespell].mana) * (g->GroupCount() - 1)));
				}
			}

			stopLogic = true;
		}
	}

	return true;
}

bool Bot::DoFinishedSpellGroupTarget(int16 spell_id, Mob* spellTarget, int16 slot, bool& stopLogic) {
	bool isMainGroupMGB = false;

	if(GetBotRaidID() > 0) {
		BotRaids *br = entity_list.GetBotRaidByMob(this);
		if(br) {
			for(int n=0; n<MAX_GROUP_MEMBERS; ++n) {
				if(br->BotRaidGroups[0] && (br->BotRaidGroups[0]->members[n] == this)) {
					if(GetLevel() >= 59) // MGB AA
						isMainGroupMGB = true;
					break;
				}
			}
		}
	}

	if(isMainGroupMGB && (GetClass() != BARD)) {
		Say("MGB %s", spells[spell_id].name);
		SpellOnTarget(spell_id, this);
		entity_list.AESpell(this, this, spell_id, true);
	}
	else {
		Group *g = GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; ++i) {
				if(g->members[i]) {
					SpellOnTarget(spell_id, g->members[i]);
					if(g->members[i] && g->members[i]->GetPetID()) {
						SpellOnTarget(spell_id, g->members[i]->GetPet());
					}
				}
			}
		}
	}

	stopLogic = true;

	return true;
}

int Bot::CheckStackConflict(int16 spellid1, int caster_level1, int16 spellid2, int caster_level2, Mob* caster1, Mob* caster2) {
	const SPDat_Spell_Struct &sp1 = spells[spellid1];
	const SPDat_Spell_Struct &sp2 = spells[spellid2];

	int effect1 = 0;
	int effect2 = 0;

	for(int i = 0; i < EFFECT_COUNT; i++) {
		effect1 = sp1.effectid[i];
		effect2 = sp2.effectid[i];
		// This is to allow bots to cast heals over the top of regen spells
		if((effect1 == SE_CurrentHP) && (effect2 == SE_CurrentHP) && !IsDetrimentalSpell(spellid1) && !IsDetrimentalSpell(spellid2)) {
			return 0;
		}
	}

	return Mob::CheckStackConflict(spellid1, caster_level1, spellid2, caster_level2, caster1, caster2);
}

void Bot::CalcBonuses() {
	CalcSpellBonuses(&spellbonuses);
	CalcMaxHP();
	CalcMaxMana();
}

sint32 Bot::CalcMaxHP() {
	int16 Post255 = 0;
	sint32 bot_hp = 0;
	int16 lm = GetClassLevelFactor();

	if((STA-255)/2 > 0)
		Post255 = (STA-255)/2;
	else
		Post255 = 0;

	bot_hp = (5)+(GetLevel()*lm/10) + (((STA-Post255)*GetLevel()*lm/3000));
	bot_hp += itembonuses.HP;
	
	// Hitpoint AA's
	int32 nd = 10000;
	if(GetLevel() >= 69) {
		nd += 1650;	// Planar Durablility AA 3
		if(GetClass() == WARRIOR) { // Sturdiness AA 5
			nd += 500;
		}
	}
	else if(GetLevel() >= 68) {
		nd += 1650;	// Planar Durablility AA 3
		if(GetClass() == WARRIOR) { // Sturdiness AA 4
			nd += 400;
		}
	}
	else if(GetLevel() >= 67) {
		nd += 1650;	// Planar Durablility AA 3
		if(GetClass() == WARRIOR) { // Sturdiness AA 3
			nd += 300;
		}
	}
	else if(GetLevel() >= 66) {
		nd += 1650;	// Planar Durablility AA 3
		if(GetClass() == WARRIOR) { // Sturdiness AA 2
			nd += 200;
		}
	}
	else if(GetLevel() >= 65) {
		nd += 1650;	// Planar Durablility AA 3
		if(GetClass() == WARRIOR) { // Sturdiness AA 1
			nd += 100;
		}
	}
	else if(GetLevel() >= 63) {
		nd += 1500;	// Planar Durablility AA 2
	}
	else if(GetLevel() >= 61) {
		nd += 1350;	// Planar Durablility AA 1
	}
	else if(GetLevel() >= 59) {
		nd += 1200;	// Physical Enhancememt AA 1
	}
	else if(GetLevel() >= 57) {
		nd += 1000;	// Natural Durablility AA 3
	}
	else if(GetLevel() >= 56) {
		nd += 500;	// Natural Durablility AA 2
	}
	else if(GetLevel() >= 55) {
		nd += 200;	// Natural Durablility AA 1
	}

	bot_hp = bot_hp * nd / 10000;

	bot_hp += spellbonuses.HP;

	max_hp = bot_hp;

	return max_hp;
}

void Bot::Camp(bool databaseSave) {
	if(IsGrouped()) {
		RemoveBotFromGroup(this, GetGroup());
	}

	if(databaseSave)
		Save();

	// Deactive the bot in the database
	std::string errorMessage;
	Bot::DeactivateBot(this, &errorMessage);
	// TODO: Log this error message to zone error log

	SetBotOwner(0);
	Depop();
}

void Bot::Zone() {
	if(HasGroup()) {
		GetGroup()->MemberZoned(this);
	}

	Save();
	SetBotOwner(0);
	Depop();
}

// Orders all bots in the specified group to follow their group leader.
void Bot::BotGroupOrderFollow(Group* group) {
	if(group) {
		Mob* groupLeader = group->GetLeader();

		if(groupLeader) {
			for(int i = 0; i< MAX_GROUP_MEMBERS; i++) {
				if(group->members[i] && group->members[i]->IsBot()) {
					Bot* botGroupMember = group->members[i]->CastToBot();

					botGroupMember->SetFollowID(groupLeader->GetID());
					botGroupMember->Say("Following %s.", groupLeader->GetCleanName());

					botGroupMember->WipeHateList();
				}
			}
		}
	}
}

// Orders all bots in the specified group to guard their current location.
void Bot::BotGroupOrderGuard(Group* group) {
	if(group) {
		for(int i = 0; i< MAX_GROUP_MEMBERS; i++) {
			if(group->members[i] && group->members[i]->IsBot()) {
				Bot* botGroupMember = group->members[i]->CastToBot();

				botGroupMember->SetFollowID(0);
				botGroupMember->Say("Guarding here.");

				botGroupMember->WipeHateList();
			}
		}
	}
}

// Orders all bots in the specified group to attack their group leader's target.
void Bot::BotGroupOrderAttack(Group* group) {
	if(group) {
		Mob* groupLeader = group->GetLeader();

		if(groupLeader) {
			for(int i=0; i < MAX_GROUP_MEMBERS; i++) {
				if(group->members[i] && group->members[i]->IsBot()) {
					Bot* botGroupMember = group->members[i]->CastToBot();

					botGroupMember->AddToHateList(groupLeader->GetTarget(), 1);
				}
			}
		}
	}
}

// Summons all bot group members to ther owners location.
void Bot::BotGroupSummon(Group* group) {
	if(group) {
		for(int i = 0; i < MAX_GROUP_MEMBERS; i++) {
			if(group->members[i] && group->members[i]->IsBot()) {
				Bot* botMember = group->members[i]->CastToBot();

				botMember->SetTarget(botMember->GetBotOwner());
				
				botMember->Warp(botMember->GetBotOwner()->GetX(), botMember->GetBotOwner()->GetY(), botMember->GetBotOwner()->GetZ());
				
				if(botMember->HasPet() && botMember->GetPet()) {
					botMember->GetPet()->SetTarget(botMember);
					botMember->GetPet()->Warp(botMember->GetBotOwner()->GetX(), botMember->GetBotOwner()->GetY(), botMember->GetBotOwner()->GetZ());
				}
			}
		}
	}
}

// Finds a bot in the entitity list by bot owner character id and the bot first name
Bot* Bot::GetBotByBotClientOwnerAndBotName(Client* c, std::string botName) {
	Bot* Result = 0;

	if(c) {
		std::list<Bot*> BotList = entity_list.GetBotsByBotOwnerCharacterID(c->CharacterID());

		if(!BotList.empty()) {
			for(std::list<Bot*>::iterator botListItr = BotList.begin(); botListItr != BotList.end(); botListItr++) {
				if(std::string((*botListItr)->GetCleanName()) == botName) {
					Result = (*botListItr);
					break;
				}
			}
		}
	}

	return Result;
}

// Processes a group invite from a Client for a Bot character.
void Bot::ProcessBotGroupInvite(Client* c, std::string botName) {
	if(c) {
		Bot* invitedBot = GetBotByBotClientOwnerAndBotName(c, botName);

		if(invitedBot && !invitedBot->HasGroup()) {
			if(!c->IsGrouped()) {
				Group *g = new Group(c);
				if(AddBotToGroup(invitedBot, g)) {
					entity_list.AddGroup(g);
					database.SetGroupLeaderName(g->GetID(), c->GetName());
					database.SetGroupID(c->GetName(), g->GetID(), c->CharacterID());
					database.SetGroupID(invitedBot->GetCleanName(), g->GetID(), invitedBot->GetBotID());
				}
			}
			else {
				AddBotToGroup(invitedBot, c->GetGroup());
				database.SetGroupID(invitedBot->GetCleanName(), c->GetGroup()->GetID(), invitedBot->GetBotID());
			}

			if(c->GetBotRaidID() > 0)
				invitedBot->SetBotRaidID(c->GetBotRaidID());
		}
		// TODO: if there is a bot but the bot is already in a group, do we send an group invitation cancel message back to the client?
	}
}

// Processes a group disband request from a Client for a Bot.
void Bot::ProcessBotGroupDisband(Client* c, std::string botName) {
	if(c) {
		Bot* tempBot = 0;

		if(botName.empty())
			tempBot = GetFirstBotInGroup(c->GetGroup());
		else
			tempBot = GetBotByBotClientOwnerAndBotName(c, botName);

		RemoveBotFromGroup(tempBot, c->GetGroup());
	}
}

// Handles all client zone change event
void Bot::ProcessClientZoneChange(Client* botOwner) {
	if(botOwner) {
		std::list<Bot*> BotList = entity_list.GetBotsByBotOwnerCharacterID(botOwner->CharacterID());

		for(list<Bot*>::iterator itr = BotList.begin(); itr != BotList.end(); itr++) {
			Bot* tempBot = *itr;

			if(tempBot) {
				if(tempBot->HasGroup())
					ZoneAllActiveBots(botOwner);
				else
					DestroyBotObjects(botOwner);
			}
		}
	}
}

// Finds and returns the first Bot object found in specified group
Bot* Bot::GetFirstBotInGroup(Group* group) {
	Bot* Result = 0;

	if(group) {
		for(int Counter = 0; Counter < MAX_GROUP_MEMBERS; Counter++) {
			if (group->members[Counter] == NULL) {
				continue;
			}

			if(group->members[Counter]->IsBot()) {
				Result = group->members[Counter]->CastToBot();
				break;
			}
		}
	}

	return Result;
}

// Processes a client request to inspect a bot's equipment.
void Bot::ProcessBotInspectionRequest(Bot* inspectedBot, Client* client) {
	if(inspectedBot && client) {
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_InspectAnswer, sizeof(InspectResponse_Struct));
		InspectResponse_Struct* insr = (InspectResponse_Struct*) outapp->pBuffer;
		insr->TargetID = inspectedBot->GetID();
		insr->playerid = client->GetID();

		const Item_Struct* item = 0;
		
		for (sint16 L=0; L <= 21; L++) {
			const Item_Struct* itm = database.GetItem(inspectedBot->GetBotItem(L));

			if(itm) {
				const ItemInst* inst = new ItemInst(itm, itm->MaxCharges);

				if(inst) {
					if(item = inst->GetItem()) {
						strcpy(insr->itemnames[L], item->Name);
						insr->itemicons[L] = item->Icon;
					}
					else
						insr->itemicons[L] = 0xFFFFFFFF;
				}
			}
		}

		client->QueuePacket(outapp); // Send answer to requester
	}
}

// This method is intended to call all necessary methods to do all bot stat calculations, including spell buffs, equipment, AA bonsues, etc.
void Bot::CalcBotStats(bool showtext) {
	if(!GetBotOwner())
		return;

	if(showtext) {
		GetBotOwner()->Message(15, "Bot updating...");
	}
	
	if(!IsValidRaceClassCombo()) {
		GetBotOwner()->Message(15, "A %s - %s bot was detected. Is this Race/Class combination allowed?.", GetRaceName(GetRace()), GetEQClassName(GetClass(), GetLevel()));
		GetBotOwner()->Message(15, "Previous Bots Code releases did not check Race/Class combinations during create.");
		GetBotOwner()->Message(15, "Unless you are experiencing heavy lag, you should delete and remake this bot.");
	}
	
	if(GetBotOwner()->GetLevel() != GetLevel())
		SetLevel(GetBotOwner()->GetLevel());

	GenerateBaseStats();

	GenerateAABonuses();

	GenerateArmorClass();

	//// Calc Base Hit Points
	//int16 lm = GetClassLevelFactor();
	//int16 Post255;
	//if((bsta-255)/2 > 0)
	//	Post255 = (bsta-255)/2;
	//else
	//	Post255 = 0;
	//sint32 bot_hp = (5)+(blevel*lm/10) + (((bsta-Post255)*blevel*lm/3000)) + ((Post255*blevel)*lm/6000);
	GenerateBaseHitPoints();

	GenerateBaseManaPoints();

	GenerateSpecialAttacks();

	if(showtext) {
		GetBotOwner()->Message(15, "Base stats:");
		GetBotOwner()->Message(15, "Level: %i HP: %i AC: %i Mana: %i STR: %i STA: %i DEX: %i AGI: %i INT: %i WIS: %i CHA: %i", GetLevel(), base_hp, AC, max_mana, STR, STA, DEX, AGI, INT, WIS, CHA);
		GetBotOwner()->Message(15, "Resists-- Magic: %i, Poison: %i, Fire: %i, Cold: %i, Disease: %i.",MR,PR,FR,CR,DR);
	}

	// Let's find the items in the bot inventory
	sint32 items_hp = 0;
	sint32 items_mana = 0;

	if(this->Save())
		this->GetBotOwner()->CastToClient()->Message(0, "%s saved.", this->GetCleanName());
	else
		this->GetBotOwner()->CastToClient()->Message(13, "%s save failed!", this->GetCleanName());

	memset(&itembonuses, 0, sizeof(StatBonuses));

	for(int i=0; i<22; i++) {
		uint32 iteminslot = GetBotItem(i);

		if(iteminslot > 0) {
			const Item_Struct *itemtmp = database.GetItem(iteminslot);
			if(itemtmp->AC != 0)
				itembonuses.AC += itemtmp->AC;
			if(itemtmp->HP != 0)
				itembonuses.HP += itemtmp->HP;
			if(itemtmp->Mana != 0)
				itembonuses.Mana += itemtmp->Mana;
			if(itemtmp->Endur != 0)
				itembonuses.Endurance += itemtmp->Endur;
			if(itemtmp->AStr != 0)
				itembonuses.STR += itemtmp->AStr;
			if(itemtmp->ASta != 0)
				itembonuses.STA += itemtmp->ASta;
			if(itemtmp->ADex != 0)
				itembonuses.DEX += itemtmp->ADex;
			if(itemtmp->AAgi != 0)
				itembonuses.AGI += itemtmp->AAgi;
			if(itemtmp->AInt != 0)
				itembonuses.INT += itemtmp->AInt;
			if(itemtmp->AWis != 0)
				itembonuses.WIS += itemtmp->AWis;
			if(itemtmp->ACha != 0)
				itembonuses.CHA += itemtmp->ACha;
			if(itemtmp->MR != 0)
				itembonuses.MR += itemtmp->MR;
			if(itemtmp->FR != 0)
				itembonuses.FR += itemtmp->FR;
			if(itemtmp->CR != 0)
				itembonuses.CR += itemtmp->CR;
			if(itemtmp->PR != 0)
				itembonuses.PR += itemtmp->PR;
			if(itemtmp->DR != 0)
				itembonuses.DR += itemtmp->DR;
			if(itemtmp->Regen != 0)
				itembonuses.HPRegen += itemtmp->Regen;
			if(itemtmp->ManaRegen != 0)
				itembonuses.ManaRegen += itemtmp->ManaRegen;
			if(itemtmp->Attack != 0)
				itembonuses.ATK += itemtmp->Attack;
			if(itemtmp->DamageShield != 0)
				itembonuses.DamageShield += itemtmp->DamageShield;
			if(itemtmp->SpellShield != 0)
				itembonuses.SpellDamageShield += itemtmp->SpellShield;
			if(itemtmp->Shielding != 0)
				itembonuses.MeleeMitigation += itemtmp->Shielding;
			if(itemtmp->StunResist != 0)
				itembonuses.StunResist += itemtmp->StunResist;
			if(itemtmp->StrikeThrough != 0)
				itembonuses.StrikeThrough += itemtmp->StrikeThrough;
			if(itemtmp->Avoidance != 0)
				itembonuses.AvoidMeleeChance += itemtmp->Avoidance;
			if(itemtmp->Accuracy != 0)
				itembonuses.HitChance += itemtmp->Accuracy;
			if(itemtmp->CombatEffects != 0)
				itembonuses.ProcChance += itemtmp->CombatEffects;
			if ((itemtmp->Worn.Effect != 0) && (itemtmp->Worn.Type == ET_WornEffect)) { // latent effects
				ApplySpellsBonuses(itemtmp->Worn.Effect, itemtmp->Worn.Level, &itembonuses);
			}
		}
	}

	MR += itembonuses.MR;
	CR += itembonuses.CR;
	DR += itembonuses.DR;
	FR += itembonuses.FR;
	PR += itembonuses.PR;
	AC += itembonuses.AC;
	STR += itembonuses.STR;
	STA += itembonuses.STA;
	DEX += itembonuses.DEX;
	AGI += itembonuses.AGI;
	INT += itembonuses.INT;
	WIS += itembonuses.WIS;
	CHA += itembonuses.CHA;
	ATK += itembonuses.ATK;

	MR += spellbonuses.MR;
	CR += spellbonuses.CR;
	DR += spellbonuses.DR;
	FR += spellbonuses.FR;
	PR += spellbonuses.PR;
	AC += spellbonuses.AC;
	STR += spellbonuses.STR;
	STA += spellbonuses.STA;
	DEX += spellbonuses.DEX;
	AGI += spellbonuses.AGI;
	INT += spellbonuses.INT;
	WIS += spellbonuses.WIS;
	CHA += spellbonuses.CHA;
	ATK += spellbonuses.ATK;

	cur_hp = CalcMaxHP();
	GenerateBaseManaPoints();
	
	AI_AddNPCSpells(this->GetBotSpellID());

	if(showtext) {
		GetBotOwner()->Message(15, "I'm updated.");
		GetBotOwner()->Message(15, "Level: %i HP: %i AC: %i Mana: %i STR: %i STA: %i DEX: %i AGI: %i INT: %i WIS: %i CHA: %i", GetLevel(), max_hp, AC, max_mana, STR, STA, DEX, AGI, INT, WIS, CHA);
		GetBotOwner()->Message(15, "Resists-- Magic: %i, Poison: %i, Fire: %i, Cold: %i, Disease: %i.",MR,PR,FR,CR,DR);
	}
}

void Bot::ProcessBotCommands(Client *c, const Seperator *sep) {
	// All bot command processing occurs here now instead of in command.cpp

	// TODO: Log any possible error messages as most of these will be MySQL error messages.
	std::string TempErrorMessage;

	if(sep->arg[1][0] == '\0') {
		c->Message(13, "Bad argument, type #bot help");
		return;
	}
	if(!strcasecmp( sep->arg[1], "help") && !strcasecmp( sep->arg[2], "\0")){
		c->Message(0, "List of commands availables for bots :");
		c->Message(0, "#bot help - show this");
		c->Message(0, "#bot create [name] [class (id)] [race (id)] [model (male/female)] - create a permanent bot. See #bot help create.");
		c->Message(0, "#bot help create - show all the race/class id. (make it easier to create bots)");
		c->Message(0, "#bot delete - completely destroy forever the targeted bot and all its items.");
		c->Message(0, "#bot list [all/class(1-16)] - list your bots all or by class. Classes: 1(Warrior), 2(Cleric), 3(Paladin), 4(Ranger), 5(Sk), 6(Druid), 7(Monk), 8(Bard), 9(Rogue), 10(Shaman), 11(Necro), 12(Wiz), 13(Mag), 14(Ench), 15(Beast), 16(Bersek)");
		c->Message(0, "#bot spawn [botid] - spawn a bot from its ID (use list to see all the bots). ");
		c->Message(0, "#bot group add - make the targetted bot joigning your group.");
		c->Message(0, "#bot group remove [target} - kick the targetted bot from your group (it will die also).");
		c->Message(0, "#bot group order [follow/guard/attack (target)] - Give orders [follow/guard/attack (target)] to your grouped bots.");
		c->Message(0, "#bot inventory list - show the inventory (and the slots IDs) of the targetted bot.");
		c->Message(0, "#bot inventory remove [slotid] - remove the item at the given slot in the inventory of the targetted bot.");
		c->Message(0, "#bot update - you must type that command once you gain a level.");
		c->Message(0, "#bot group summon - It will summon all your grouped bots to you.");
		c->Message(0, "#bot summon - It will summon your targeted bot to you.");
		c->Message(0, "#bot ai mez - If you're grouped with an enchanter, he will mez your target.");
		c->Message(0, "#bot picklock - You must have a targeted rogue bot in your group and be right on the door.");
		c->Message(0, "#bot cure [poison|disease|curse|blindness] Cleric has most options");
		c->Message(0, "#bot bindme - You must have a Cleric in your group to get Bind Affinity cast on you.");
		c->Message(0, "#bot raid [commands] (#bot raid help will show some help).");
		c->Message(0, "#bot track - look at mobs in the zone (ranger has options)");
		c->Message(0, "#bot target calm - attempts to pacify your target mob.");
		c->Message(0, "#bot evac - transports your pc group to safe location in the current zone. bots are lost");
		c->Message(0, "#bot resurrectme - Your bot Cleric will rez you.");
		c->Message(0, "#bot corpse summon - Necromancers summon corpse.");
		c->Message(0, "#bot lore - cast Identify on the item on your mouse pointer.");
		c->Message(0, "#bot sow - Bot sow on you (Druid has options)");
		c->Message(0, "#bot invis - Bot invisiblity (must have proper class in group)");
		c->Message(0, "#bot levitate - Bot levitation (must have proper class in group)");
		c->Message(0, "#bot resist - Bot resist buffs (must have proper class in group)");
		c->Message(0, "#bot runeme - Enchanter Bot cast Rune spell on you");
		c->Message(0, "#bot shrinkme - Shaman Bot will shrink you");
		c->Message(0, "#bot endureb - Bot enduring breath (must have proper class in group)");
		c->Message(0, "#bot charm - (must have proper class in group)");
		c->Message(0, "#bot dire charm - (must have proper class in group)");
		c->Message(0, "#bot pet remove - (remove pet before charm)");
		c->Message(0, "#bot gate - you need a Druid or Wizard in your group)");
		c->Message(0, "#bot saveraid - Save your current group(s) of bots.");
		c->Message(0, "#bot spawnraid - Spawns your saved bots.");
		c->Message(0, "#bot groupraid - Groups your spawned bots.");
		c->Message(0, "#bot archery - Toggle Archery Skilled bots between using a Bow or using Melee weapons.");
		c->Message(0, "#bot magepet [earth|water|air|fire|monster] - Select the pet type you want your Mage bot to use.");
		c->Message(0, "#bot giveitem - Gives your targetted bot the item you have on your cursor.");
		c->Message(0, "#bot camp - Tells your bot to camp out of the game.");
		return;
	}

	if(!strcasecmp(sep->arg[1], "giveitem")) {
		if(c->GetTarget() && c->GetTarget()->IsBot() && (c->GetTarget()->CastToBot()->GetBotOwner() == c)) {
			// Its a bot targetted and this client is the bots owner
			Bot* targetedBot = c->GetTarget()->CastToBot();
				if(targetedBot)
					targetedBot->FinishTrade(c, botTradeClientNoDropNoTrade);
		}
		else {
			c->Message(15, "You must target a bot you own to do this.");
		}

		return;
	}

	if(!strcasecmp(sep->arg[1], "camp")) {
		if(!strcasecmp(sep->arg[2], "all")) {
			// Camp out all bots owned by this bot owner
			BotOrderCampAll(c);
		}
		else {
			// Camp only the targetted bot
			if(c->GetTarget() && c->GetTarget()->IsBot() && (c->GetTarget()->CastToBot()->GetBotOwner() == c)) {
				Bot* targetedBot = c->GetTarget()->CastToBot();
				if(targetedBot)
					targetedBot->Camp();
			}
			else
				c->Message(15, "You must target a bot you own to do this.");
		}

		return;
	}

	if(!strcasecmp(sep->arg[1], "create")) {
		if(sep->arg[2][0] == '\0' || sep->arg[3][0] == '\0' || sep->arg[4][0] == '\0' || sep->arg[5][0] == '\0' || sep->arg[6][0] != '\0') {
			c->Message(0, "Usage: #bot create [name] [class(id)] [race(id)] [gender (male/female)]");
			return;
		}
		else if(strcasecmp(sep->arg[3],"1") && strcasecmp(sep->arg[3],"2") && strcasecmp(sep->arg[3],"3") && strcasecmp(sep->arg[3],"4") && strcasecmp(sep->arg[3],"5") && strcasecmp(sep->arg[3],"6") && strcasecmp(sep->arg[3],"7") && strcasecmp(sep->arg[3],"8") && strcasecmp(sep->arg[3],"9") && strcasecmp(sep->arg[3],"10") && strcasecmp(sep->arg[3],"11") && strcasecmp(sep->arg[3],"12") && strcasecmp(sep->arg[3],"13") && strcasecmp(sep->arg[3],"14") && strcasecmp(sep->arg[3],"15") && strcasecmp(sep->arg[3],"16")) {
			c->Message(0, "Usage: #bot create [name] [class(id)] [race(id)] [gender (male/female)]");
			return;
		}		
		else if(strcasecmp(sep->arg[4],"1") && strcasecmp(sep->arg[4],"2") && strcasecmp(sep->arg[4],"3") && strcasecmp(sep->arg[4],"4") && strcasecmp(sep->arg[4],"5") && strcasecmp(sep->arg[4],"6") && strcasecmp(sep->arg[4],"7") && strcasecmp(sep->arg[4],"8") && strcasecmp(sep->arg[4],"9") && strcasecmp(sep->arg[4],"10") && strcasecmp(sep->arg[4],"11") && strcasecmp(sep->arg[4],"12") && strcasecmp(sep->arg[4],"330") && strcasecmp(sep->arg[4],"128") && strcasecmp(sep->arg[4],"130")) {
			c->Message(0, "Usage: #bot create [name] [class(1-16)] [race(1-12,128,130,330)] [gender (male/female)]");
			return;
		}
		else if(strcasecmp(sep->arg[5],"male") && strcasecmp(sep->arg[5],"female")) {
			c->Message(0, "Usage: #bot create [name] [class(1-16)] [race(1-12,128,130,330)] [gender (male/female)]");
			return;
		}

		int32 MaxBotCreate = RuleI(Bots, CreateBotCount);
		if(SpawnedBotCount(c->CharacterID(), &TempErrorMessage) >= MaxBotCreate) {
			c->Message(0, "You cannot create more than %i bots.", MaxBotCreate);
			return;
		}

		if(!TempErrorMessage.empty()) {
			c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
			return;
		}

		int gender = 0;
		if(!strcasecmp(sep->arg[5], "female"))
			gender = 1;

		NPCType DefaultNPCTypeStruct = CreateDefaultNPCTypeStructForBot(std::string(sep->arg[2]), std::string(), c->GetLevel(), atoi(sep->arg[4]), atoi(sep->arg[3]), gender);
		Bot* NewBot = new Bot(DefaultNPCTypeStruct, c);

		if(NewBot) {
			if(!NewBot->IsValidRaceClassCombo()) {
				c->Message(0, "That Race/Class combination cannot be created.");
				return;
			}

			if(!NewBot->IsValidName()) {
				c->Message(0, "%s has invalid characters. You can use only the A-Z, a-z and _ characters in a bot name.", NewBot->GetCleanName());
				return;
			}

			if(!NewBot->IsBotNameAvailable(&TempErrorMessage)) {
				c->Message(0, "The name %s is already being used. Please choose a different name.", NewBot->GetCleanName());
				return;
			}

			if(!TempErrorMessage.empty()) {
				c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
				return;
			}

			// Now that all validation is complete, we can save our newly created bot
			if(!NewBot->Save())
				c->Message(0, "Unable to save %s as a bot.", NewBot->GetCleanName());
			else
				c->Message(0, "%s saved as bot %u.", NewBot->GetCleanName(), NewBot->GetBotID());
		}
		else {
			// TODO: Log error message here
		}

		// Bot creation is complete
		return;
	}

	if(!strcasecmp(sep->arg[1], "help") && !strcasecmp(sep->arg[2], "create") ){
		c->Message(0, "Classes:  1(Warrior), 2(Cleric), 3(Paladin), 4(Ranger), 5(Sk), 6(Druid), 7(Monk), 8(Bard), 9(Rogue), 10(Shaman), 11(Necro), 12(Wiz), 13(Mag), 14(Ench), 15(Beast), 16(Bersek)");
		c->Message(0, "------------------------------------------------------------------");
		c->Message(0, "Races: 1(Human), 2(Barb), 3(Erudit), 4(Wood elf), 5(High elf), 6(Dark elf), 7(Half elf), 8(Dwarf), 9(Troll), 10(Ogre), 11(Halfling), 12(Gnome), 330(Froglok), 128(Iksar), 130(Vah shir)");
		c->Message(0, "------------------------------------------------------------------");
		c->Message(0, "Usage: #bot create [name] [class(1-16)] [race(1-12,128,130,330)] [gender(male/female)]");
		c->Message(0, "Example: #bot create Jesuschrist 9 6 male");
		return;
	}

	if(!strcasecmp(sep->arg[1], "delete") ) {
		if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot())
		{
			c->Message(15, "You must target a bot!");
			return;
		}
		else if(c->GetTarget()->CastToBot()->GetBotOwnerCharacterID() != c->CharacterID())
		{
			c->Message(15, "You can't delete a bot that you don't own.");
			return;
		}

		if(c->GetTarget()->IsBot()) {
			Bot* BotTargeted = c->GetTarget()->CastToBot();

			if(BotTargeted) {
				BotTargeted->DeleteBot(&TempErrorMessage);

				if(!TempErrorMessage.empty()) {
					c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
					return;
				}

				BotTargeted->Camp(false);
			}
		}

		return;
	}

	if(!strcasecmp(sep->arg[1], "list")) {
		bool listAll = true;
		int iClass = atoi(sep->arg[2]);

		if(iClass > 0 && iClass < 17)
			listAll = false;

		std::list<BotsAvailableList> AvailableBots = GetBotList(c->CharacterID(), &TempErrorMessage);

		if(!TempErrorMessage.empty()) {
			c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
			return;
		}

		if(!AvailableBots.empty()) {
			for(std::list<BotsAvailableList>::iterator TempAvailableBotsList = AvailableBots.begin(); TempAvailableBotsList != AvailableBots.end(); TempAvailableBotsList++) {
				if(listAll) {
					c->Message(0, "ID: %u -- Class: %s -- Name: %s -- Race: %s", TempAvailableBotsList->BotID, ClassIdToString(TempAvailableBotsList->BotClass).c_str(), TempAvailableBotsList->BotName, RaceIdToString(TempAvailableBotsList->BotRace).c_str());
				}
				else {
					if(TempAvailableBotsList->BotClass == iClass)
						c->Message(0, "ID: %u -- Class: %s -- Name: %s -- Race: %s", TempAvailableBotsList->BotID, ClassIdToString(TempAvailableBotsList->BotClass).c_str(), TempAvailableBotsList->BotName, RaceIdToString(TempAvailableBotsList->BotRace).c_str());
				}
			}
		}
		else {
			c->Message(0, "You have no bots created. Use the #bot create command to create a bot.");
		}
	}

	if(!strcasecmp(sep->arg[1], "spawn") ){

		if(GetBotOwnerCharacterID(atoi(sep->arg[2]), &TempErrorMessage) != c->CharacterID()) {
			c->Message(0, "You can't spawn a bot that you don't own.");
			return;
		}

		if(!TempErrorMessage.empty()) {
			c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
			return;
		}

		if(c->GetFeigned()) {
			c->Message(0, "You can't summon bots while you are feigned.");
			return;
		}

		if(c->GetBotRaidID() > 0) {
			BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
			if(br) {
				if(br->GetBotRaidAggro()) {
					c->Message(15, "You can't summon bots while you are engaged.");
					return;
				}
			}
		}

		if(c->IsGrouped()) {
			Group *g = entity_list.GetGroupByClient(c);
			for (int i=0; i<MAX_GROUP_MEMBERS; i++) {
				if(g && g->members[i] && !g->members[i]->qglobal && (g->members[i]->GetAppearance() != eaDead) && g->members[i]->IsEngaged()) {
					c->Message(0, "You can't summon bots while you are engaged.");
					return;
				}
				if(g && g->members[i] && g->members[i]->qglobal) {
					return;
				}
			}
		}

		Mob* TempBotMob = entity_list.GetMobByBotID(atoi(sep->arg[2]));
		if(TempBotMob) {
			c->Message(0, "This bot is already in the zone.");
			return;
		}

		const int spawnedBotCount = SpawnedBotCount(c->CharacterID(), &TempErrorMessage);

		if(!TempErrorMessage.empty()) {
			c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
			return;
		}

		if(RuleB(Bots, BotQuest) && !c->GetGM()) {
			const int allowedBots = AllowedBotSpawns(c->CharacterID(), &TempErrorMessage);

			if(!TempErrorMessage.empty()) {
				c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
				return;
			}

			if(allowedBots == 0) {
				c->Message(0, "You cannot spawn any bots.");
				return;
			}

			if(spawnedBotCount >= allowedBots) {
				c->Message(0, "You cannot spawn more than %i bots.", spawnedBotCount);
				return;
			}

		}

		if(spawnedBotCount >= RuleI(Bots, SpawnBotCount) && !c->GetGM()) {
			c->Message(0, "You cannot spawn more than %i bots.", spawnedBotCount);
			return;
		}

		Bot* TempBot = LoadBot(atoi(sep->arg[2]), &TempErrorMessage);

		if(!TempErrorMessage.empty()) {
			c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
			return;
		}

		if(TempBot) {
			// We have a bot loaded from the database
			TempBot->Spawn(c, &TempErrorMessage);

			if(!TempErrorMessage.empty()) {
				c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
				return;
			}
			
			TempBot->CastToMob()->Say("I am ready for battle.");
		}
		else {
			// We did not find a bot for the specified bot id from the database
			c->Message(0, "BotID: %i not found", atoi(sep->arg[2]));
		}

		return;
	}

	if(!strcasecmp(sep->arg[1], "archery")) {
		if((c->GetTarget() == NULL) || (c->GetTarget() == c) || !c->GetTarget()->IsBot()) {
			c->Message(15, "You must target a bot!");
			return;
		}

		Mob *archerbot = c->GetTarget();
		if((archerbot->GetClass()==WARRIOR)||(archerbot->GetClass()==PALADIN)||(archerbot->GetClass()==RANGER)||(archerbot->GetClass()==SHADOWKNIGHT)||(archerbot->GetClass()==ROGUE)) {
			//const Item_Struct* botweapon = database.GetItem(archerbot->CastToBot()->GetItem(SLOT_RANGE));
			const Item_Struct* botweapon = database.GetItem(archerbot->CastToBot()->GetItem(SLOT_RANGE)->item_id);
			uint32 archeryMaterial;
			uint32 archeryColor;
			uint32 archeryBowID;
			uint32 archeryAmmoID;
			uint32 range = 0;
			if(botweapon && (botweapon->ItemType == ItemTypeBow)) {
				archeryMaterial = atoi(botweapon->IDFile+2);
				archeryBowID = botweapon->ID;
				archeryColor = botweapon->Color;
				range =+ botweapon->Range;
				botweapon = database.GetItem(archerbot->CastToNPC()->GetItem(SLOT_AMMO)->item_id);
				if(!botweapon || (botweapon->ItemType != ItemTypeArrow)) {
					archerbot->Say("I don't have any arrows.");
					archerbot->CastToBot()->SetBotArcheryRange(0);
					return;
				}
				range += botweapon->Range;
				archeryAmmoID = botweapon->ID;
			}
			else {
				archerbot->Say("I don't have a bow.");
				archerbot->CastToBot()->SetBotArcheryRange(0);
				return;
			}
			if(archerbot->CastToBot()->IsBotArcher()) {
				archerbot->CastToBot()->SetBotArcher(false);
				archerbot->Say("Using melee skills.");
				archerbot->CastToBot()->BotAddEquipItem(SLOT_PRIMARY, archerbot->CastToBot()->GetBotItemBySlot(SLOT_PRIMARY, &TempErrorMessage));

				if(!TempErrorMessage.empty()) {
					c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
					return;
				}
				//archerbot->SendWearChange(MATERIAL_PRIMARY);
				archerbot->CastToBot()->BotAddEquipItem(SLOT_SECONDARY, archerbot->CastToBot()->GetBotItemBySlot(SLOT_SECONDARY, &TempErrorMessage));

				if(!TempErrorMessage.empty()) {
					c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
					return;
				}
				//archerbot->SendWearChange(MATERIAL_SECONDARY);
				archerbot->CastToBot()->SetBotArcheryRange(0);
			}
			else {
				archerbot->CastToBot()->SetBotArcher(true);
				archerbot->Say("Using archery skills.");
				archerbot->CastToBot()->BotRemoveEquipItem(SLOT_PRIMARY);
				//archerbot->SendWearChange(MATERIAL_PRIMARY);
				archerbot->CastToBot()->BotRemoveEquipItem(SLOT_SECONDARY);
				//archerbot->SendWearChange(MATERIAL_SECONDARY);
				archerbot->CastToBot()->BotAddEquipItem(SLOT_SECONDARY, archeryBowID);
				archerbot->CastToBot()->SendBotArcheryWearChange(MATERIAL_SECONDARY, archeryMaterial, archeryColor);
				archerbot->CastToBot()->BotAddEquipItem(SLOT_PRIMARY, archeryAmmoID);
				archerbot->CastToBot()->SetBotArcheryRange(range);
			}
		}
		else {
			archerbot->Say("I don't know how to use a bow.");
		}
		return;
	}

	if(!strcasecmp(sep->arg[1], "picklock")) {
		if((c->GetTarget() == NULL) || (c->GetTarget() == c) || !c->GetTarget()->IsBot() || (c->GetTarget()->GetClass() != ROGUE)) {
			c->Message(15, "You must target a rogue bot!");
		}
		else {
			entity_list.OpenDoorsNear(c->GetTarget()->CastToNPC());
		}

		return;
	}

	if(!strcasecmp(sep->arg[1], "summon")) {
		if((c->GetTarget() == NULL) || (c->GetTarget() == c) || !c->GetTarget()->IsBot() || c->GetTarget()->IsPet())
		{
			c->Message(15, "You must target a bot!");
		}
		else if(c->GetTarget()->IsMob() && !c->GetTarget()->IsPet())
		{
			Mob *b = c->GetTarget();

			// Is our target "botable" ?
			if(b && !b->IsBot()){
				c->Message(15, "You must target a bot!");
			}
			else if(b && (b->CastToBot()->GetBotOwnerCharacterID() != c->CharacterID()))
			{
				b->Say("You can only summon your own bots.");
			}
			else {
				b->SetTarget(c->CastToMob());
				b->Warp(c->GetX(), c->GetY(), c->GetZ());
			}
		}

		return;
	}

	if(!strcasecmp(sep->arg[1], "groupraid")) {
		if(c->GetFeigned())
		{
			c->Message(15, "You can't load your raid while you are feigned.");
			return;
		}

		if(c->GetBotRaidID() > 0 || c->IsGrouped()) {
			c->Message(15, "You cannot be in a group.");
			return;
		}

		std::list<BotGroup> botGroup = LoadBotGroups(c->CharacterID(), &TempErrorMessage);

		if(!TempErrorMessage.empty()) {
			c->Message(13, TempErrorMessage.c_str());
			return;
		}

		if(!botGroup.empty()) {
			uint16 groupCount = 0;
			Group *g = new Group(c);
			entity_list.AddGroup(g);

			BotRaids *br = 0;
			
			for(std::list<BotGroup>::iterator botGroupItr = botGroup.begin(); botGroupItr != botGroup.end(); botGroupItr++) {
				Bot* botGroupMember = LoadBot(botGroupItr->BotID, &TempErrorMessage);

				if(!TempErrorMessage.empty()) {
					c->Message(13, TempErrorMessage.c_str());
					return;
				}

				if(!botGroupMember)
					continue;

				botGroupMember->Spawn(c, &TempErrorMessage);

				if(!TempErrorMessage.empty()) {
					c->Message(13, TempErrorMessage.c_str());
					return;
				}

				// The thinking here is the raid leader must be a client and is going to be in the first group in the raid (if there is a raid), so groupCount = 0
				// If a second group becomes necessary because there are more bots to spawn still, then the "ELSE" condition is tripped and we make a raid if there
				// already isnt one and then we also make a new group, so groupCount++. Then we continue on until we fill this second group like we did the prior
				// group until we run out of bots or we have to make more groups to add to the raid.
				if(g->GroupCount() < 6 && botGroupItr->GroupID == groupCount) {
					// Create a group before we have to make a raid in case we dont need to form a raid
					AddBotToGroup(botGroupMember, g);
					database.SetGroupID(botGroupMember->GetCleanName(), g->GetID(), botGroupMember->GetBotID());
				}
				else {
					// Create a raid, if one already isn't instantiated and then create a new group to add to this raid
					if(!br) {
						br = new BotRaids(c);
						// Add the existing first group to this raid. The first group is groupCount = 0
						br->AddBotGroup(g);
					}

					g = new Group(botGroupMember);

					groupCount++;
					
					br->AddBotGroup(g);

					entity_list.AddGroup(g);

					database.SetGroupLeaderName(g->GetID(), botGroupMember->GetCleanName());
					database.SetGroupID(botGroupMember->GetCleanName(), g->GetID(), botGroupMember->GetBotID());
				}
			}
		}

		return;
	}

	if(!strcasecmp(sep->arg[1], "spawnraid")) {
		if(c->GetFeigned())
		{
			c->Message(15, "You can't load your raid while you are feigned.");
			return;
		}

		const int spawnedBots = Bot::SpawnedBotCount(c->CharacterID(), &TempErrorMessage);

		if(!TempErrorMessage.empty()) {
			c->Message(13, TempErrorMessage.c_str());
			return;
		}

		if(c->GetBotRaidID() > 0 || c->IsGrouped() || spawnedBots) {
			c->Message(15, "You already have spawned bots.");

			std::list<SpawnedBotsList> spawnedBotsList = ListSpawnedBots(c->CharacterID(), &TempErrorMessage);

			if(!TempErrorMessage.empty()) {
				c->Message(13, TempErrorMessage.c_str());
				return;
			}

			if(!spawnedBotsList.empty()) {
				for(std::list<SpawnedBotsList>::iterator spawnedBotsItr = spawnedBotsList.begin(); spawnedBotsItr != spawnedBotsList.end(); spawnedBotsItr++) {
					char* longname = 0;
					if(database.GetZoneLongName((char*)spawnedBotsItr->ZoneName, &longname, NULL, NULL, NULL, NULL, NULL, NULL)) {
						c->Message(15, "%s is in %s", spawnedBotsItr->BotName, longname);
						safe_delete(longname);
					}
				}
			}

			return;
		}

		std::list<BotGroup> botGroup = Bot::LoadBotGroups(c->CharacterID(), &TempErrorMessage);

		if(!TempErrorMessage.empty()) {
			c->Message(13, TempErrorMessage.c_str());
			return;
		}

		if(!botGroup.empty()) {
			for(std::list<BotGroup>::iterator botGroupItr = botGroup.begin(); botGroupItr != botGroup.end(); botGroupItr++) {
				Bot* groupBot = Bot::LoadBot(botGroupItr->BotID, &TempErrorMessage);

				if(!TempErrorMessage.empty()) {
					c->Message(13, TempErrorMessage.c_str());
					return;
				}

				if(groupBot) {
					groupBot->Spawn(c, &TempErrorMessage);

					if(!TempErrorMessage.empty()) {
						c->Message(13, TempErrorMessage.c_str());
						return;
					}
				}
			}
		}

		return;
	}

	if(!strcasecmp(sep->arg[1], "saveraid")) {
		if(c->GetFeigned())
		{
			c->Message(15, "You can't save your raid while you are feigned.");
			return;
		}

		if(c->GetBotRaidID() > 0) {
			BotRaids *br = entity_list.GetBotRaidByMob(c);
			if(br) {
				if(br->GetBotRaidAggro()) {
					c->Message(15, "You can't save your raid while you are engaged.");
					return;
				}
			}
		}

		if(c->IsGrouped())
		{
			Group *g = entity_list.GetGroupByClient(c);
			for (int i=0; i<MAX_GROUP_MEMBERS; i++)
			{
				if(g && g->members[i] && !g->members[i]->qglobal && (g->members[i]->GetAppearance() != eaDead) && g->members[i]->IsEngaged())
				{
					c->Message(15, "You can't save your raid while you are engaged.");
					return;
				}
				if(g && g->members[i] && g->members[i]->qglobal) {
					return;
				}
			}
		}
		BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
		if(br) {
			br->SaveGroups(c);
			c->Message(15, "Your raid is saved.");
		}
		else {
			Group *g = entity_list.GetGroupByClient(c);
			if(g) {
				DeleteBotGroups(c->CharacterID(), &TempErrorMessage);

				if(!TempErrorMessage.empty()) {
					c->Message(13, TempErrorMessage.c_str());
					return;
				}

				for(int j=0; j<MAX_GROUP_MEMBERS; j++) {
					if(g->members[j]) {
						if(g->members[j]->IsClient()) {
							continue;
						}
						SaveBotGroups(0, c->CharacterID(), g->members[j]->GetNPCTypeID(), j, &TempErrorMessage);

						if(!TempErrorMessage.empty()) {
							c->Message(13, TempErrorMessage.c_str());
							return;
						}
					}
				}
				c->Message(15, "Your raid is saved.");
			}
			else {
				c->Message(15, "You need to have a raid to save a raid.");
			}
		}
		return;
	}

	if(!strcasecmp(sep->arg[1], "group") && !strcasecmp(sep->arg[2], "add")) {
		/*if(c->GetFeigned()) {
			c->Message(15, "You can't create bot groups while feigned!");
			return;
		}*/

		/*if(c->GetBotRaidID() > 0) {
			BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
			if(br) {
				if(br->GetBotRaidAggro()) {
					c->Message(15, "You can't create bot groups while you are engaged.");
					return;
				}
			}
		}*/

		/*if(c->IsGrouped()) {
			Group *g = entity_list.GetGroupByClient(c);
			for (int i=0; i<MAX_GROUP_MEMBERS; i++) {
				if(g && g->members[i] && g->members[i]->IsEngaged()) {
					c->Message(15, "You can't create bot groups while you are engaged.");
					return;
				}
			}
		}*/

		if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot()) {
			c->Message(15, "You must target a bot!");
			return;
		}

		if(c->GetTarget()->IsClient()) {
			c->Message(15, "You can't invite clients this way.");
			return;
		}

		if(c->IsGrouped()) {
			Group *g = entity_list.GetGroupByClient(c);
			if(g && (c->CastToMob() != g->members[0])) {
				c->Message(15, "Only the group leader can invite bots.");
				return;
			}
		}

		if(c->IsGrouped()) {
			Group *g = entity_list.GetGroupByClient(c);
			if(g && (g->GroupCount() > 5)) {
				c->Message(15, "There is no more room in your group.");
				return;
			}
		}

		if(c->GetTarget()->IsBot())
		{
			Bot* b = c->GetTarget()->CastToBot();

			/*if(b->GetBotOwnerCharacterID() != c->CharacterID()) {
				b->Say("I can't be your bot, you are not my owner.");
				return;
			}*/

			//// Is he already grouped ?
			//if(b->IsGrouped()) {
			//	b->Say("I'm already grouped!");
			//	return;
			//}

			// Invite it to the group
			ProcessBotGroupInvite(c, std::string(b->GetCleanName()));

			b->Say("I'm becoming %s\'s bot!", c->GetCleanName());
			//if(!c->IsGrouped()) {
			//	Group *g = new Group(c->CastToMob());
			//	if(AddBotToGroup(b, g))
			//		entity_list.AddGroup(g);
			//}
			//else
			//	AddBotToGroup(b, c->GetGroup());

			//if(c->GetBotRaidID() > 0)
			//	b->SetBotRaidID(c->GetBotRaidID());
		}

		return;
	}

	if(!strcasecmp(sep->arg[1], "group") && !strcasecmp(sep->arg[2], "remove")) {
		if(c->GetTarget() != NULL) {
			if(c->GetTarget()->IsBot() && c->GetTarget()->CastToBot()->GetBotOwnerCharacterID() == c->CharacterID()) {
				if(c->GetTarget()->GetBotRaidID()) {
					if(SpawnedBotCount(c->CharacterID(), &TempErrorMessage) < 6) {
						entity_list.RemoveBotRaid(c->CastToMob()->GetBotRaidID());
						Group *g = c->GetGroup();
						if(g) {
							for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
								if(g->members[i]) {
									g->members[i]->SetBotRaidID(0);
								}
							}
						}
					}

					if(!TempErrorMessage.empty()) {
						c->Message(13, TempErrorMessage.c_str());
						return;
					}
				}

				if(c->GetTarget()->IsGrouped()) {
					Group *g = entity_list.GetGroupByMob(c->GetTarget());
					if(g && g->members[0]) {
						if(g->members[0] == c->GetTarget()) {
							for(int i=5; i>=0; i--) {
								if(g->members[i]) {
									g->members[i]->CastToBot()->Camp();
								}
							}
						}
						else {
							c->GetTarget()->CastToBot()->Camp();
						}
					}
				}
				else {
					c->GetTarget()->CastToBot()->Camp();
				}
			}
			else {
				c->Message(15, "You must target a bot first.");
			}
		}
		else {
			c->Message(15, "You must target a bot first.");
		}
		return;
	}

	if(!strcasecmp(sep->arg[1], "group") && !strcasecmp(sep->arg[2], "order")) {
		if(!strcasecmp(sep->arg[3], "follow")) {
			if(c->GetBotRaidID() > 0) {
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
				br->FollowGuardCmd(c, false);
			}
			else if(c->IsGrouped())
				BotGroupOrderFollow(c->GetGroup());
		}
		else if(!strcasecmp(sep->arg[3], "guard")) {
			if(c->GetBotRaidID() > 0) {
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
				br->FollowGuardCmd(c, true);
			}
			else if(c->IsGrouped())
				BotGroupOrderGuard(c->GetGroup());
		}
		else if(!strcasecmp(sep->arg[3], "attack")) {
			if(c->IsGrouped() && (c->GetTarget() != NULL) && c->IsAttackAllowed(c->GetTarget())) {
				if(c->GetBotRaidID() > 0) {
					BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
					if(br) {
						br->AddBotRaidAggro(c->GetTarget());
					}
				}
				else
					BotGroupOrderAttack(c->GetGroup());
			}
			else
				c->Message(15, "You must target a monster.");
		}

		return;
	}

	if(!strcasecmp(sep->arg[1], "inventory") && !strcasecmp(sep->arg[2], "list"))
	{
		if(c->GetTarget() != NULL)
		{
			if(c->GetTarget()->IsBot() && c->GetTarget()->CastToBot()->GetBotOwnerCharacterID() == c->CharacterID())
			{
				Mob* b = c->GetTarget();	
				int x = c->GetTarget()->CastToBot()->GetBotItemsCount(&TempErrorMessage);

				if(!TempErrorMessage.empty()) {
					c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
					return;
				}

				const char* equipped[22] = {"Charm", "Left Ear", "Head", "Face", "Right Ear", "Neck", "Shoulders", "Arms", "Back",
					"Left Wrist", "Right Wrist", "Range", "Hands", "Primary Hand", "Secondary Hand",
					"Left Finger", "Right Finger", "Chest", "Legs", "Feet", "Waist", "Ammo" };
				const Item_Struct* item2 = NULL;
				bool is2Hweapon = false;
				for(int i=0; i<22 ; i++)
				{
					if((i == 14) && is2Hweapon) {
						continue;
					}

					item2 = database.GetItem(c->GetTarget()->CastToBot()->GetBotItemBySlot(i, &TempErrorMessage));

					if(!TempErrorMessage.empty()) {
						c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
						return;
					}
					if(item2 == 0) {
						c->Message(15, "I need something for my %s (Item %i)", equipped[i], i);
						continue;
					}
					if((i == 13) && ((item2->ItemType == ItemType2HS) || (item2->ItemType == ItemType2HB) || (item2->ItemType == ItemType2HPierce))) {
						is2Hweapon = true;
					}
					if((i == 0) || (i == 11) || (i == 13) || (i == 14) || (i == 21)) {
						if (c->GetClientVersion() == EQClientSoF)
						{
							c->Message(15, "Using %c%06X00000000000000000000000000000000000000000000%s%c in my %s (Item %i)", 0x12, item2->ID, item2->Name, 0x12, equipped[i], i);
						}
						else
						{
							c->Message(15, "Using %c%06X000000000000000000000000000000000000000%s%c in my %s (Item %i)", 0x12, item2->ID, item2->Name, 0x12, equipped[i], i);
						}
					}
					else {
						if (c->GetClientVersion() == EQClientSoF)
						{
							c->Message(15, "Using %c%06X00000000000000000000000000000000000000000000%s%c on my %s (Item %i)", 0x12, item2->ID, item2->Name, 0x12, equipped[i], i);
						}
						else
						{
							c->Message(15, "Using %c%06X000000000000000000000000000000000000000%s%c on my %s (Item %i)", 0x12, item2->ID, item2->Name, 0x12, equipped[i], i);
						}
					}
				}
			}
			else {
				c->Message(15, "You must group your bot first.");
			}
		}
		else {
			c->Message(15, "You must target a bot first.");
		}
		return;
	}

	if(!strcasecmp(sep->arg[1], "inventory") && !strcasecmp(sep->arg[2], "remove")) {
		if((c->GetTarget() == NULL) || (sep->arg[3] == '\0') || !c->GetTarget()->IsBot())
		{
			c->Message(15, "Usage: #bot inventory remove [slotid] (You must have a bot targetted) ");
			return;
		}		
		else if(c->GetTarget()->IsBot() && c->GetTarget()->CastToBot()->GetBotOwnerCharacterID() == c->CharacterID())
		{
			int slotId = atoi(sep->arg[3]);
			if(slotId > 21 || slotId < 0) {
				c->Message(15, "A bot has 21 slots in its inventory, please choose a slot between 0 and 21.");
				return;
			}
			const char* equipped[22] = {"Charm", "Left Ear", "Head", "Face", "Right Ear", "Neck", "Shoulders", "Arms", "Back",
				"Left Wrist", "Right Wrist", "Range", "Hands", "Primary Hand", "Secondary Hand",
				"Left Finger", "Right Finger", "Chest", "Legs", "Feet", "Waist", "Ammo" };
			const Item_Struct *itm = database.GetItem(c->GetTarget()->CastToBot()->GetBotItemBySlot(slotId, &TempErrorMessage));

			if(!TempErrorMessage.empty()) {
				c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
				return;
			}

			// Don't allow the player to remove a lore item they already possess and cause a crash
			if(!c->CheckLoreConflict(itm)) {
				if(itm) {
					const ItemInst* itminst = new ItemInst(itm, itm->MaxCharges);
					c->PushItemOnCursor(*itminst, true);
					safe_delete(itminst);
					Bot *gearbot = c->GetTarget()->CastToBot();
					if((slotId == SLOT_RANGE)||(slotId == SLOT_AMMO)||(slotId == SLOT_PRIMARY)||(slotId == SLOT_SECONDARY)) {
						gearbot->SetBotArcher(false);
					}
					gearbot->RemoveBotItemBySlot(slotId, &TempErrorMessage);

					if(!TempErrorMessage.empty()) {
						c->Message(13, "Database Error: %s", TempErrorMessage.c_str());
						return;
					}

					//gearbot->RemoveItem(itm->ID);
					gearbot->BotRemoveEquipItem(slotId);
					/*int8 materialFromSlot = Inventory::CalcMaterialFromSlot(slotId);
					if(materialFromSlot != 0xFF) {
						gearbot->SendWearChange(materialFromSlot);
					}*/
					gearbot->CalcBotStats();
					switch(slotId) {
						case 0:
						case 1:
						case 2:
						case 3:
						case 4:
						case 5:
						case 8:
						case 9:
						case 10:
						case 11:
						case 13:
						case 14:
						case 15:
						case 16:
						case 17:
						case 20:
						case 21:
							gearbot->Say("My %s is now unequipped.", equipped[slotId]);
							break;
						case 6:
						case 7:
						case 12:
						case 18:
						case 19:
							gearbot->Say("My %s are now unequipped.", equipped[slotId]);
							break;
						default:
							break;
					}
				}
				else {
					switch(slotId) {
						case 0:
						case 1:
						case 2:
						case 3:
						case 4:
						case 5:
						case 8:
						case 9:
						case 10:
						case 11:
						case 13:
						case 14:
						case 15:
						case 16:
						case 17:
						case 20:
						case 21:
							c->GetTarget()->Say("My %s is already unequipped.", equipped[slotId]);
							break;
						case 6:
						case 7:
						case 12:
						case 18:
						case 19:
							c->GetTarget()->Say("My %s are already unequipped.", equipped[slotId]);
							break;
						default:
							break;
					}
				}
			}
			else {
				c->Message(15, "Duplicate Lore item.");
			}
		}
		return;
	}

	if(!strcasecmp(sep->arg[1], "update")) {
		// Congdar: add IsEngaged check for exploit to keep bots alive by repeatedly using #bot update.
		if((c->GetTarget() != NULL) && c->GetTarget()->IsBot()) {
			if(c->GetLevel() <= c->GetTarget()->GetLevel()) {
				c->Message(15, "This bot has already been updated.");
				return;
			}

			if(c->GetBotRaidID() > 0) {
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
				if(br) {
					if(br->GetBotRaidAggro()) {
						c->Message(15, "You can't update bots while you are engaged.");
						return;
					}
				}
			}

			if(c->IsGrouped())
			{
				Group *g = entity_list.GetGroupByClient(c);
				for (int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					if(g && g->members[i] && g->members[i]->IsEngaged())
					{
						c->Message(15, "You can't update bots while you are engaged.");
						return;
					}
				}
			}

			if((c->GetTarget()->CastToBot()->GetBotOwner() == c->CastToMob()) && !c->GetFeigned()) {
				Bot* bot = c->GetTarget()->CastToBot();
				//bot->SetLevel(c->GetLevel());
				bot->SetPetChooser(false);
				bot->CalcBotStats();
			}
			else {
				if(c->GetFeigned()) {
					c->Message(15, "You cannot update bots while feigned.");
				}
				else {
					c->Message(15, "You must target your bot first");
				}
			}
		}
		else {
			c->Message(15, "You must target a bot first");
		}
		return;
	}

	if(!strcasecmp(sep->arg[1], "group") && !strcasecmp(sep->arg[2], "summon") ) {
		if(c->GetBotRaidID() > 0) {
			BotRaids *brsummon = entity_list.GetBotRaidByMob(c->CastToMob());
			if(brsummon) {
				brsummon->SummonRaidBots(c->CastToMob(), false);
			}
		}
		else if(c->IsGrouped())
			BotGroupSummon(c->GetGroup());

		return;
	}

	//Bind
	if(!strcasecmp(sep->arg[1], "bindme")) {
		Mob *binder = NULL;
		bool hasbinder = false;
		if(c->IsGrouped())
		{
			Group *g = c->GetGroup();
			if(g) {
				for(int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					if(g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == CLERIC))
					{
						hasbinder = true;
						binder = g->members[i];
					}
				}
				if(!hasbinder) {
					c->Message(15, "You must have a Cleric in your group.");
				}
			}
		}
		if(hasbinder) {
			binder->Say("Attempting to bind you %s.", c->GetName());
			binder->CastToNPC()->CastSpell(35, c->GetID(), 1, -1, -1);
		}
		return;
	}

	// Rune
	if(!strcasecmp(sep->arg[1], "runeme")) {
		Mob *runeer = NULL;
		bool hasruneer = false;
		if(c->IsGrouped())
		{
			Group *g = c->GetGroup();
			if(g) {
				for(int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					if(g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == ENCHANTER))
					{
						hasruneer = true;
						runeer = g->members[i];
					}
				}
				if(!hasruneer) {
					c->Message(15, "You must have an Enchanter in your group.");
				}
			}
		}
		if(hasruneer) {
			if      (c->GetLevel() <= 12) {
				runeer->Say("I need to be level 13 or higher for this...");
			}
			else if ((c->GetLevel() >= 13) && (c->GetLevel() <= 21)) {
				runeer->Say("Casting Rune I...");
				runeer->CastSpell(481, c->GetID(), 1, -1, -1);
			}
			else if ((c->GetLevel() >= 22) && (c->GetLevel() <= 32)) {
				runeer->Say("Casting Rune II...");
				runeer->CastSpell(482, c->GetID(), 1, -1, -1);
			}
			else if ((c->GetLevel() >= 33) && (c->GetLevel() <= 39)) { 
				runeer->Say("Casting Rune III...");
				runeer->CastSpell(483, c->GetID(), 1, -1, -1);
			}
			else if ((c->GetLevel() >= 40) && (c->GetLevel() <= 51)) { 
				runeer->Say("Casting Rune IV...");
				runeer->CastSpell(484, c->GetID(), 1, -1, -1);
			}
			else if ((c->GetLevel() >= 52) && (c->GetLevel() <= 60)) { 
				runeer->Say("Casting Rune V...");
				runeer->CastSpell(1689, c->GetID(), 1, -1, -1);
			}
			else if (c->GetLevel() >= 61){ 
				runeer->Say("Casting Rune of Zebuxoruk...");
				runeer->CastSpell(3343, c->GetID(), 1, -1, -1);
			}
		}
		return;
	}

	//Tracking
	if(!strcasecmp(sep->arg[1], "track") && c->IsGrouped()) {
		Mob *Tracker;
		int32 TrackerClass = 0;

		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case RANGER:
							Tracker = g->members[i];
							TrackerClass = RANGER;
							break;
						case BARD:
							// If we haven't found a tracker yet, use bard.
							if(TrackerClass == 0) {
								Tracker = g->members[i];
								TrackerClass = BARD;
							}
							break;
						case DRUID:
							// Unless we have a ranger, druid is next best.
							if(TrackerClass != RANGER) {
								Tracker = g->members[i];
								TrackerClass = DRUID;
							}
							break;
						default:
							break;
					}
				}
			}

			int Level = (c->GetLevel());
			int RangeR = (Level*80); //Ranger
			int RangeD = (Level*30); //Druid
			int RangeB = (Level*20); //Bard
			switch(TrackerClass) {
				case RANGER:
					if(!strcasecmp(sep->arg[2], "all")) {
						Tracker->Say("Tracking everything", c->GetName());
						entity_list.ShowSpawnWindow(c, RangeR, false);
					}
					else if(!strcasecmp(sep->arg[2], "rare")) { 
						Tracker->Say("Selective tracking", c->GetName());
						entity_list.ShowSpawnWindow(c, RangeR, true);
					}
					else if(!strcasecmp(sep->arg[2], "near")) { 
						Tracker->Say("Tracking mobs nearby", c->GetName());
						entity_list.ShowSpawnWindow(c, RangeD, false);
					}
					else 
						Tracker->Say("You want to [track all], [track near], or [track rare]?", c->GetName());

					break;

				case BARD:

					if(TrackerClass != RANGER)
						Tracker->Say("Tracking up", c->GetName());
					entity_list.ShowSpawnWindow(c, RangeB, false);
					break;

				case DRUID:

					if(TrackerClass = BARD)
						Tracker->Say("Tracking up", c->GetName());
					entity_list.ShowSpawnWindow(c, RangeD, false);
					break;

				default:
					c->Message(15, "You must have a Ranger, Druid, or Bard in your group.");
					break;
			}
		}
	}

	//Cure
	if ((!strcasecmp(sep->arg[1], "cure")) && (c->IsGrouped())) {
		Mob *Curer;
		int32 CurerClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case CLERIC:
							Curer = g->members[i];
							CurerClass = CLERIC;
							break;
						case SHAMAN:
							if(CurerClass != CLERIC){
								Curer = g->members[i];
								CurerClass = SHAMAN;
							}
						case DRUID:
							if (CurerClass == 0){
								Curer = g->members[i];
								CurerClass = DRUID;
							}
							break;
							break;
						default:
							break;
					}
				}
			}
			switch(CurerClass) {
				case CLERIC:
					if	(!strcasecmp(sep->arg[2], "poison") && (c->GetLevel() >= 1))  {
						Curer->Say("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToBot()->Bot_Command_Cure(1, Curer->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "disease") && (c->GetLevel() >= 4)) {
						Curer->Say("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToBot()->Bot_Command_Cure(2, Curer->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "curse") && (c->GetLevel() >= 8)) {
						Curer->Say("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToBot()->Bot_Command_Cure(3, Curer->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "blindness") && (c->GetLevel() >= 3)) {
						Curer->Say("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToBot()->Bot_Command_Cure(4, Curer->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "curse") && (c->GetLevel() <= 8)
						|| !strcasecmp(sep->arg[2], "blindness") && (c->GetLevel() <= 3) 
						|| !strcasecmp(sep->arg[2], "disease") && (c->GetLevel() <= 4)
						|| !strcasecmp(sep->arg[2], "poison") && (c->GetLevel() <= 1)) {
							Curer->Say("I don't have the needed level yet", sep->arg[2]);
					}
					else
						Curer->Say("Do you want [cure poison], [cure disease], [cure curse], or [cure blindness]?", c->GetName());

					break;

				case SHAMAN:
					if	(!strcasecmp(sep->arg[2], "poison") && (c->GetLevel() >= 2))  {
						Curer->Say("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToBot()->Bot_Command_Cure(1, Curer->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "disease") && (c->GetLevel() >= 1)) {
						Curer->Say("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToBot()->Bot_Command_Cure(2, Curer->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "curse")) {
						Curer->Say("I don't have that spell", sep->arg[2]);
					}
					else if(!strcasecmp(sep->arg[2], "blindness") && (c->GetLevel() >= 7)) {
						Curer->Say("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToBot()->Bot_Command_Cure(4, Curer->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "blindness") && (c->GetLevel() <= 7) 
						|| !strcasecmp(sep->arg[2], "disease") && (c->GetLevel() <= 1)
						|| !strcasecmp(sep->arg[2], "poison") && (c->GetLevel() <= 2)) {
							Curer->Say("I don't have the needed level yet", sep->arg[2]);
					}
					else 
						Curer->Say("Do you want [cure poison], [cure disease], or [cure blindness]?", c->GetName());

					break;

				case DRUID:

					if	(!strcasecmp(sep->arg[2], "poison") && (c->GetLevel() >= 5)) {
						Curer->Say("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToBot()->Bot_Command_Cure(1, Curer->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "disease") && (c->GetLevel() >= 4)) {
						Curer->Say("Trying to cure us of %s.", sep->arg[2]);
						Curer->CastToBot()->Bot_Command_Cure(2, Curer->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "curse")) { // Fire level 1
						Curer->Say("I don't have that spell", sep->arg[2]);
					}
					else if(!strcasecmp(sep->arg[2], "blindness") && (c->GetLevel() >= 13)) {
						Curer->Say("I don't have that spell", sep->arg[2]);
					}
					else if (!strcasecmp(sep->arg[2], "disease") && (c->GetLevel() <= 4)
						|| !strcasecmp(sep->arg[2], "poison") && (c->GetLevel() <= 5)) {
							Curer->Say("I don't have the needed level yet", sep->arg[2]) ;
					}
					else 
						Curer->Say("Do you want [cure poison], or [cure disease]?", c->GetName());

					break;

				default:
					c->Message(15, "You must have a Cleric, Shaman, or Druid in your group.");
					break;
			}
		}
	}

	//Mez
	if(!strcasecmp(sep->arg[1], "ai") && !strcasecmp(sep->arg[2], "mez"))
	{
		Mob *target = c->GetTarget();
		if(target == NULL || target == c || target->IsBot() || (target->IsPet() && target->GetOwner()->IsBot()))
		{
			c->Message(15, "You must select a monster");
			return;
		}

		if(c->IsGrouped())
		{
			bool hasmezzer = false;
			Group *g = c->GetGroup();
			for(int i=0; i<MAX_GROUP_MEMBERS; i++)
			{
				if(g && g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == ENCHANTER))
				{
					hasmezzer = true;
					Mob *mezzer = g->members[i];
					mezzer->Say("Trying to mez %s \n", target->GetCleanName());
					mezzer->CastToBot()->MesmerizeTarget(target);
				}
			}
			if(!hasmezzer) {
				c->Message(15, "You must have an Enchanter in your group.");
			}
		}
		return;
	}

	//Lore (Identify item)
	if(!strcasecmp(sep->arg[1], "lore")) {
		if(c->IsGrouped())
		{
			bool hascaster = false;
			Group *g = c->GetGroup();
			for(int i=0; i<MAX_GROUP_MEMBERS; i++)
			{
				if(g && g->members[i] && g->members[i]->IsBot()) {
					uint8 casterlevel = g->members[i]->GetLevel();
					switch(g->members[i]->GetClass()) {
						case ENCHANTER:
							if(casterlevel >= 15) {
								hascaster = true;
							}
							break;
						case WIZARD:
							if(casterlevel >= 14) {
								hascaster = true;
							}
							break;
						case NECROMANCER:
							if(casterlevel >= 17) {
								hascaster = true;
							}
							break;
						case MAGICIAN:
							if(casterlevel >= 13) {
								hascaster = true;
							}
							break;
						default:
							break;
					}
					if(hascaster) {
						g->members[i]->Say("Trying to Identify your item...");
						g->members[i]->CastSpell(305, c->GetID(), 1, -1, -1);
						break;
					}
				}
			}
			if(!hascaster) {
				c->Message(15, "You don't see anyone in your group that can cast Identify.");
			}
		}
		else {
			c->Message(15, "You don't see anyone in your group that can cast Identify.");
		}
		return;
	}

	//Resurrect
	if(!strcasecmp(sep->arg[1], "resurrectme"))
	{
		Mob *target = c->GetTarget();
		if(target == NULL || !target->IsCorpse())
		{
			c->Message(15, "You must select a corpse");
			return;
		}

		if(c->IsGrouped())
		{
			bool hasrezzer = false;
			Group *g = c->GetGroup();
			for(int i=0; i<MAX_GROUP_MEMBERS; i++)
			{
				if(g && g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == CLERIC))
				{
					hasrezzer = true;
					Mob *rezzer = g->members[i];
					rezzer->Say("Trying to rez %s", target->GetCleanName());
					rezzer->CastToBot()->Bot_Command_RezzTarget(target);
					break;
				}
			}
			if(!hasrezzer) {
				c->Message(15, "You must have a Cleric in your group.");
			}
		}
		else {
			c->Message(15, "You must have a Cleric in your group.");
		}
		return;
	}

	if(!strcasecmp(sep->arg[1], "magepet"))
	{
		if(c->GetTarget() && c->GetTarget()->IsBot() && (c->GetTarget()->GetClass() == MAGICIAN))
		{
			if(c->GetTarget()->CastToBot()->GetBotOwnerCharacterID() == c->CharacterID())
			{
				int botlevel = c->GetTarget()->GetLevel();
				c->GetTarget()->CastToBot()->SetPetChooser(true);
				if(botlevel == 1)
				{
					c->GetTarget()->Say("I don't have any pets yet.");
					return;
				}
				if(!strcasecmp(sep->arg[2], "water"))
				{
					c->GetTarget()->CastToBot()->SetPetChooserID(0);
				}
				else if(!strcasecmp(sep->arg[2], "fire"))
				{
					if(botlevel < 3)
					{
						c->GetTarget()->Say("I don't have that pet yet.");
						return;
					}
					else
					{
						c->GetTarget()->CastToBot()->SetPetChooserID(1);
					}
				}
				else if(!strcasecmp(sep->arg[2], "air"))
				{
					if(botlevel < 4)
					{
						c->GetTarget()->Say("I don't have that pet yet.");
						return;
					}
					else
					{
						c->GetTarget()->CastToBot()->SetPetChooserID(2);
					}
				}
				else if(!strcasecmp(sep->arg[2], "earth"))
				{
					if(botlevel < 5)
					{
						c->GetTarget()->Say("I don't have that pet yet.");
						return;
					}
					else
					{
						c->GetTarget()->CastToBot()->SetPetChooserID(3);
					}
				}
				else if(!strcasecmp(sep->arg[2], "monster"))
				{
					if(botlevel < 30)
					{
						c->GetTarget()->Say("I don't have that pet yet.");
						return;
					}
					else
					{
						c->GetTarget()->CastToBot()->SetPetChooserID(4);
					}
				}
				if(c->GetTarget()->GetPet())
				{
					// cast reclaim energy
					int16 id = c->GetTarget()->GetPetID();
					c->GetTarget()->SetPetID(0);
					c->GetTarget()->CastSpell(331, id);
				}
			}
		}
		else
		{
			c->Message(15, "You must target your Magician bot.");
		}
		return;
	}

	//Summon Corpse
	if(!strcasecmp(sep->arg[1], "corpse") && !strcasecmp(sep->arg[2], "summon")) {
		if(c->GetTarget() == NULL) {
			c->Message(15, "You must select player with his corpse in the zone.");
			return;
		}
		if(c->IsGrouped()) {
			bool hassummoner = false;
			Mob *t = c->GetTarget();
			Group *g = c->GetGroup();
			int summonerlevel = 0;
			for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
				if(g && g->members[i] && g->members[i]->IsBot() && ((g->members[i]->GetClass() == NECROMANCER)||(g->members[i]->GetClass() == SHADOWKNIGHT))) {
					hassummoner = true;
					summonerlevel = g->members[i]->GetLevel();
					if(!t->IsClient()) {
						g->members[i]->Say("You have to target a player with a corpse in the zone");
						return;
					}
					else if(summonerlevel < 12) {
						g->members[i]->Say("I don't have that spell yet.");
					}
					else if((summonerlevel > 11) && (summonerlevel < 35)) {
						g->members[i]->Say("Attempting to summon %s\'s corpse.", t->GetCleanName());
						g->members[i]->CastSpell(2213, t->GetID(), 1, -1, -1);
						return;
					}
					else if((summonerlevel > 34) && (summonerlevel < 71)) {
						g->members[i]->Say("Attempting to summon %s\'s corpse.", t->GetCleanName());
						g->members[i]->CastSpell(3, t->GetID(), 1, -1, -1);
						return;
					}
					else if((summonerlevel > 70) && (summonerlevel < 76)) {
						g->members[i]->Say("Attempting to summon %s\'s corpse.", t->GetCleanName());
						g->members[i]->CastSpell(10042, t->GetID(), 1, -1, -1);
						return;
					}
					else if((summonerlevel > 75) && (summonerlevel < 81)) {
						g->members[i]->Say("Attempting to summon %s\'s corpse.", t->GetCleanName());
						g->members[i]->CastSpell(14823, t->GetID(), 1, -1, -1);
						return;
					}
				}
			}
			if (!hassummoner) {
				c->Message(15, "You must have a Necromancer or Shadowknight in your group.");
			}
			return;
		}
	}

	//Pacify
	if(!strcasecmp(sep->arg[1], "target") && !strcasecmp(sep->arg[2], "calm"))
	{
		Mob *target = c->GetTarget();

		if(target == NULL || target->IsClient() || target->IsBot() || target->IsPet() && target->GetOwner()->IsBot())
			c->Message(15, "You must select a monster");
		else {
			if(c->IsGrouped()) {
				Group *g = c->GetGroup();

				for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
					if(g && g->members[i] && g->members[i]->IsBot() && ((g->members[i]->GetClass() == ENCHANTER) || g->members[i]->GetClass() == CLERIC)) {
						Bot *pacer = g->members[i]->CastToBot();
						pacer->Say("Trying to pacify %s \n", target->GetCleanName());

						if(pacer->Bot_Command_CalmTarget(target)) {
							if(target->FindType(SE_Lull) || target->FindType(SE_Harmony) || target->FindType(SE_Calm))
							//if(pacer->IsPacified(target))
								c->Message(0, "I have successfully pacified %s.", target->GetCleanName());
							/*else
								c->Message(0, "I failed to pacify %s.", target->GetCleanName());*/
						}
						else
							c->Message(0, "I failed to pacify %s.", target->GetCleanName());
					}
					/*else
						c->Message(15, "You must have an Enchanter or Cleric in your group.");*/
				}
			}
		}

		return;
	}

	//Charm
	if(!strcasecmp(sep->arg[1], "charm"))
	{
		Mob *target = c->GetTarget();
		if(target == NULL || target->IsClient() || target->IsBot() || (target->IsPet() && target->GetOwner()->IsBot()))
		{
			c->Message(15, "You must select a monster");
			return;
		}
		int32 DBtype = c->GetTarget()->GetBodyType();
		Mob *Charmer;
		int32 CharmerClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case ENCHANTER:
							Charmer = g->members[i];
							CharmerClass = ENCHANTER;
							break;
						case NECROMANCER:
							if(CharmerClass != ENCHANTER){
								Charmer = g->members[i];
								CharmerClass = NECROMANCER;
							}
						case DRUID:
							if (CharmerClass == 0){
								Charmer = g->members[i];
								CharmerClass = DRUID;
							}
							break;
							break;
						default:
							break;
					}
				}
			}
			switch(CharmerClass) {
				case ENCHANTER:
					if	(c->GetLevel() >= 11) {
						Charmer->Say("Trying to charm %s \n", target->GetCleanName(), sep->arg[2]);
						Charmer->CastToBot()->Bot_Command_CharmTarget (1,target);
					}
					else if (c->GetLevel() <= 10){
						Charmer->Say("I don't have the needed level yet", sep->arg[2]);
					}
					else
						Charmer->Say("Mob level is too high or can't be charmed", c->GetName());
					break;

				case NECROMANCER:
					if	((c->GetLevel() >= 18) && (DBtype == 3)) {
						Charmer->Say("Trying to Charm %s \n", target->GetCleanName(), sep->arg[2]);
						Charmer->CastToBot()->Bot_Command_CharmTarget (2,target);
					}
					else if (c->GetLevel() <= 17){
						Charmer->Say("I don't have the needed level yet", sep->arg[2]);
					}
					else
						Charmer->Say("Mob Is not undead...", c->GetName());
					break;

				case DRUID:
					if	((c->GetLevel() >= 13) && (DBtype == 21)) {
						Charmer->Say("Trying to charm %s \n", target->GetCleanName(), sep->arg[2]);
						Charmer->CastToBot()->Bot_Command_CharmTarget (3,target);
					}
					else if (c->GetLevel() <= 12){
						Charmer->Say("I don't have the needed level yet", sep->arg[2]);
					}
					else
						Charmer->Say("Mob is not an animal...", c->GetName());
					break;

				default:
					c->Message(15, "You must have an Enchanter, Necromancer or Druid in your group.");
					break;
			}
		}
	}

	// Remove Bot's Pet
	if(!strcasecmp(sep->arg[1], "pet") && !strcasecmp(sep->arg[2], "remove")) {
		if(c->GetTarget() != NULL) {
			if (c->IsGrouped() && c->GetTarget()->IsBot() && (c->GetTarget()->CastToBot()->GetBotOwnerCharacterID() != c->CharacterID()) &&
				((c->GetTarget()->GetClass() == NECROMANCER) || (c->GetTarget()->GetClass() == ENCHANTER) || (c->GetTarget()->GetClass() == DRUID))) {
					if(c->GetTarget()->CastToBot()->IsBotCharmer()) {
						c->GetTarget()->CastToBot()->SetBotCharmer(false);
						c->GetTarget()->Say("Using a summoned pet.");
					}
					else {
						if(c->GetTarget()->GetPet())
						{
							c->GetTarget()->GetPet()->Say_StringID(PET_GETLOST_STRING);
							// c->GetTarget()->GetPet()->Kill();
							c->GetTarget()->GetPet()->Depop(false);
							c->GetTarget()->SetPetID(0);
						}
						c->GetTarget()->CastToBot()->SetBotCharmer(true);
						c->GetTarget()->Say("Available for Dire Charm command.");
					}
			}
			else {
				c->Message(15, "You must target your Enchanter, Necromancer, or Druid bot.");
			}
		}
		else {
			c->Message(15, "You must target an Enchanter, Necromancer, or Druid bot.");
		}
		return;
	}

	//Dire Charm
	if(!strcasecmp(sep->arg[1], "Dire") && !strcasecmp(sep->arg[2], "Charm"))
	{
		Mob *target = c->GetTarget();
		if(target == NULL || target->IsClient() || target->IsBot() || (target->IsPet() && target->GetOwner()->IsBot()))
		{
			c->Message(15, "You must select a monster");
			return;
		}
		int32 DBtype = c->GetTarget()->GetBodyType();
		Mob *Direr;
		int32 DirerClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case ENCHANTER:
							Direr = g->members[i];
							DirerClass = ENCHANTER;
							break;
						case NECROMANCER:
							if(DirerClass != ENCHANTER){
								Direr = g->members[i];
								DirerClass = NECROMANCER;
							}
						case DRUID:
							if (DirerClass == 0){
								Direr = g->members[i];
								DirerClass = DRUID;
							}
							break;
							break;
						default:
							break;
					}
				}
			}
			switch(DirerClass) {
				case ENCHANTER:
					if	(c->GetLevel() >= 55) {
						Direr->Say("Trying to dire charm %s \n", target->GetCleanName(), sep->arg[2]);
						Direr->CastToBot()->Bot_Command_DireTarget (1,target);
					}
					else if (c->GetLevel() <= 55){
						Direr->Say("I don't have the needed level yet", sep->arg[2]);
					}
					else
						Direr->Say("Mob level is too high or can't be charmed", c->GetName());
					break;

				case NECROMANCER:
					if	((c->GetLevel() >= 55) && (DBtype == 3)) {
						Direr->Say("Trying to dire charm %s \n", target->GetCleanName(), sep->arg[2]);
						Direr->CastToBot()->Bot_Command_DireTarget (2,target);
					}
					else if (c->GetLevel() <= 55){
						Direr->Say("I don't have the needed level yet", sep->arg[2]);
					}
					else
						Direr->Say("Mob Is not undead...", c->GetName());
					break;

				case DRUID:
					if	((c->GetLevel() >= 55) && (DBtype == 21)) {
						Direr->Say("Trying to dire charm %s \n", target->GetCleanName(), sep->arg[2]);
						Direr->CastToBot()->Bot_Command_DireTarget (3,target);
					}
					else if (c->GetLevel() <= 55){
						Direr->Say("I don't have the needed level yet", sep->arg[2]);
					}
					else
						Direr->Say("Mob is not an animal...", c->GetName());
					break;

				default:
					c->Message(15, "You must have an Enchanter, Necromancer or Druid in your group.");
					break;
			}
		}
	}

	// Evacuate
	if(!strcasecmp(sep->arg[1], "evac")) {
		Mob *evac = NULL;
		bool hasevac = false;
		if(c->IsGrouped())
		{
			Group *g = c->GetGroup();
			if(g) {
				for(int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					if((g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == DRUID)) 
						|| (g->members[i] && g->members[i]->IsBot() && (g->members[i]->GetClass() == WIZARD)))
					{
						hasevac = true;
						evac = g->members[i];
					}
				}
				if(!hasevac) {
					c->Message(15, "You must have a Druid in your group.");
				}
			}
		}
		if((hasevac)  && (c->GetLevel() >= 18)) {
			evac->Say("Attempting to Evac you %s.", c->GetName());
			evac->CastToClient()->CastSpell(2183, c->GetID(), 1, -1, -1);
		}
		else if((hasevac)  && (c->GetLevel() <= 17)) {
			evac->Say("I'm not level 18 yet.", c->GetName());
		}
		return;
	}

	// Sow
	if ((!strcasecmp(sep->arg[1], "sow")) && (c->IsGrouped())) {
		Mob *Sower;
		int32 SowerClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case DRUID:
							Sower = g->members[i];
							SowerClass = DRUID;
							break;
						case SHAMAN:
							if (SowerClass != DRUID){
								Sower = g->members[i];
								SowerClass = SHAMAN;
							}
							break;
						case RANGER:
							if (SowerClass == 0){
								Sower = g->members[i];
								SowerClass = RANGER;
							}
							break;
						case BEASTLORD:
							if (SowerClass == 0){
								Sower = g->members[i];
								SowerClass = BEASTLORD;
							}
							break;
						default:
							break;
					}
				}
			}
			switch(SowerClass) {
				case DRUID:
					if      ((!strcasecmp(sep->arg[2], "regular")) && (zone->CanCastOutdoor())  && (c->GetLevel() >= 10) ) {
						Sower->Say("Casting sow...");
						Sower->CastSpell(278, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "regular")) && (zone->CanCastOutdoor())  && (c->GetLevel() <= 10) ) {
						Sower->Say("I'm not level 10 yet.");
					}
					else if ((!strcasecmp(sep->arg[2], "wolf")) && zone->CanCastOutdoor() && (c->GetLevel() >= 20)) {
						Sower->Say("Casting group wolf...");
						Sower->CastSpell(428, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "wolf")) && (c->GetLevel() <= 20)) {
						Sower->Say("I'm not level 20 yet.");
					}
					else if ((!strcasecmp(sep->arg[2], "feral")) && (c->GetLevel() >= 50)) { 
						Sower->Say("Casting Feral Pack...");
						Sower->CastSpell(4058, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "feral")) && (c->GetLevel() <= 50)) {
						Sower->Say("I'm not level 50 yet.");
					}
					else if ((!strcasecmp(sep->arg[2], "shrew")) && (c->GetLevel() >= 35)) { 
						Sower->Say("Casting Pack Shrew...");
						Sower->CastSpell(4055, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "wolf")) && (c->GetLevel() <= 35)) {
						Sower->Say("I'm not level 35 yet.");
					}
					else if ((!zone->CanCastOutdoor()) && (!strcasecmp(sep->arg[2], "regular")) ||
						(!zone->CanCastOutdoor()) && (!strcasecmp(sep->arg[2], "wolf"))) {
							Sower->Say("I can't cast this spell indoors, try [sow shrew] if you're 35 or higher, or [sow feral] if you're 50 or higher,", c->GetName());
					}
					else if (!zone->CanCastOutdoor()) {
						Sower->Say("I can't cast this spell indoors, try [sow shrew] if you're 35 or higher, or [sow feral] if you're 50 or higher,", c->GetName());
					}
					else if (zone->CanCastOutdoor()) {
						Sower->Say("Do you want [sow regular] or [sow wolf]?", c->GetName());
					}
					else if (!zone->CanCastOutdoor()) {
						Sower->Say("I can't cast this spell indoors, try [sow shrew] if you're 35 or higher, or [sow feral] if you're 50 or higher,", c->GetName());
					}
					break;

				case SHAMAN:

					if ((zone->CanCastOutdoor()) && (c->GetLevel() >= 9)) { 
						Sower->Say("Casting SoW...");
						Sower->CastToClient()->CastSpell(278, c->GetID(), 1, -1, -1);
					}
					else if (!zone->CanCastOutdoor()) {
						Sower->Say("I can't cast this spell indoors", c->GetName());
					}
					else if (c->GetLevel() <= 9) {
						Sower->Say("I'm not level 9 yet.");
					}
					break;

				case RANGER:

					if ((zone->CanCastOutdoor()) && (c->GetLevel() >= 28)){
						Sower->Say("Casting SoW...");
						Sower->CastToClient()->CastSpell(278, c->GetID(), 1, -1, -1);
					}
					else if (!zone->CanCastOutdoor()) {
						Sower->Say("I can't cast this spell indoors", c->GetName());
					}
					else if (c->GetLevel() <= 28) {
						Sower->Say("I'm not level 28 yet.");
					}
					break;

				case BEASTLORD:

					if((zone->CanCastOutdoor()) && (c->GetLevel() >= 24)) {
						Sower->Say("Casting SoW...");
						Sower->CastToClient()->CastSpell(278, c->GetID(), 1, -1, -1);
					}
					else if (!zone->CanCastOutdoor()) {
						Sower->Say("I can't cast this spell indoors", c->GetName());
					}
					else if (c->GetLevel() <= 24) {
						Sower->Say("I'm not level 24 yet.");
					}
					break;


				default:
					c->Message(15, "You must have a Druid, Shaman, Ranger,  or Beastlord in your group.");
					break;
			}
		}
	}

	// Shrink
	if ((!strcasecmp(sep->arg[1], "shrinkme")) && (c->IsGrouped())) {
		Mob *Shrinker;
		int32 ShrinkerClass = 0;
		Group *g = c->GetGroup();

		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case SHAMAN:
							Shrinker = g->members[i];
							ShrinkerClass = SHAMAN;
							break;
						case BEASTLORD:
							if (ShrinkerClass != SHAMAN){
								Shrinker = g->members[i];
								ShrinkerClass = BEASTLORD;
							}
							break;
						default:
							break;
					}
				}
			}
			switch(ShrinkerClass) {
				case SHAMAN:

					if (c->GetLevel() >= 15) { 
						Shrinker->Say("Casting Shrink...");
						//Shrinker->CastToBot()->BotRaidSpell(345);
						Shrinker->CastSpell(345, c->GetID(), 1);
					}
					else if (c->GetLevel() <= 14) {
						Shrinker->Say("I'm not level 15 yet.");
					}
					break;

				case BEASTLORD:

					if (c->GetLevel() >= 23) {
						Shrinker->Say("Casting Shrink...");
						//Shrinker->CastToBot()->BotRaidSpell(345);
						Shrinker->CastSpell(345, c->GetID(), 1);
					}
					else if (c->GetLevel() <= 22) {
						Shrinker->Say("I'm not level 23 yet.");
					}
					break;

				default:
					c->Message(15, "You must have a Shaman or Beastlord in your group.");
					break;
			}
		}
	}

	// Gate
	if ((!strcasecmp(sep->arg[1], "gate")) && (c->IsGrouped())) {
		Mob *Gater;
		int32 GaterClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case DRUID:
							Gater = g->members[i];
							GaterClass = DRUID;
							break;
						case WIZARD:
							if (GaterClass == 0){
								Gater = g->members[i];
								GaterClass = WIZARD;
							}
							break;
						default:
							break;
					}
				}
			}
			switch(GaterClass) {
				case DRUID:
					if      ((!strcasecmp(sep->arg[2], "karana")) && (c->GetLevel() >= 25) ) {
						Gater->Say("Casting Circle of Karana...");
						Gater->CastSpell(550, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "commons")) && (c->GetLevel() >= 27)) {
						Gater->Say("Casting Circle of Commons...");
						Gater->CastSpell(551, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "tox")) && (c->GetLevel() >= 25)) { 
						Gater->Say("Casting Circle of Toxxulia...");
						Gater->CastSpell(552, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "butcher")) && (c->GetLevel() >= 25)) { 
						Gater->Say("Casting Circle of Butcherblock...");
						Gater->CastSpell(553, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "lava")) && (c->GetLevel() >= 30)) { 
						Gater->Say("Casting Circle of Lavastorm...");
						Gater->CastSpell(554, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "ro")) && (c->GetLevel() >= 32)) { 
						Gater->Say("Casting Circle of Ro...");
						Gater->CastSpell(555, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "feerrott")) && (c->GetLevel() >= 32)) { 
						Gater->Say("Casting Circle of feerrott...");
						Gater->CastSpell(556, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "steamfont")) && (c->GetLevel() >= 31)) { 
						Gater->Say("Casting Circle of Steamfont...");
						Gater->CastSpell(557, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "misty")) && (c->GetLevel() >= 36)) { 
						Gater->Say("Casting Circle of Misty...");
						Gater->CastSpell(558, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "wakening")) && (c->GetLevel() >= 40)) { 
						Gater->Say("Casting Circle of Wakening Lands...");
						Gater->CastSpell(1398, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "iceclad")) && (c->GetLevel() >= 32)) { 
						Gater->Say("Casting Circle of Iceclad Ocean...");
						Gater->CastSpell(1434, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "divide")) && (c->GetLevel() >= 36)) { 
						Gater->Say("Casting Circle of The Great Divide...");
						Gater->CastSpell(1438, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "cobalt")) && (c->GetLevel() >= 42)) { 
						Gater->Say("Casting Circle of Cobalt Scar...");
						Gater->CastSpell(1440, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "combines")) && (c->GetLevel() >= 33)) { 
						Gater->Say("Casting Circle of The Combines...");
						Gater->CastSpell(1517, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "surefall")) && (c->GetLevel() >= 26)) { 
						Gater->Say("Casting Circle of Surefall Glade...");
						Gater->CastSpell(2020, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "grimling")) && (c->GetLevel() >= 29)) { 
						Gater->Say("Casting Circle of Grimling Forest...");
						Gater->CastSpell(2419, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "twilight")) && (c->GetLevel() >= 33)) { 
						Gater->Say("Casting Circle of Twilight...");
						Gater->CastSpell(2424, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "dawnshroud")) && (c->GetLevel() >= 37)) { 
						Gater->Say("Casting Circle of Dawnshroud...");
						Gater->CastSpell(2429, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "nexus")) && (c->GetLevel() >= 26)) { 
						Gater->Say("Casting Circle of The Nexus...");
						Gater->CastSpell(2432, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "pok")) && (c->GetLevel() >= 38)) { 
						Gater->Say("Casting Circle of Knowledge...");
						Gater->CastSpell(3184, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "stonebrunt")) && (c->GetLevel() >= 28)) { 
						Gater->Say("Casting Circle of Stonebrunt Mountains...");
						Gater->CastSpell(3792, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "bloodfields")) && (c->GetLevel() >= 55)) { 
						Gater->Say("Casting Circle of Bloodfields...");
						Gater->CastSpell(6184, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "emerald")) && (c->GetLevel() >= 39)) { 
						Gater->Say("Casting Wind of the South...");
						Gater->CastSpell(1737, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "skyfire")) && (c->GetLevel() >= 44)) { 
						Gater->Say("Casting Wind of the North...");
						Gater->CastSpell(1736, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "slaughter")) && (c->GetLevel() >= 64)) { 
						Gater->Say("Casting Circle of Slaughter...");
						Gater->CastSpell(6179, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "karana") 
						|| !strcasecmp(sep->arg[2], "tox") 
						|| !strcasecmp(sep->arg[2], "butcher") && (c->GetLevel() <= 25))
						|| !strcasecmp(sep->arg[2], "commons") && (c->GetLevel() <= 27)
						|| (!strcasecmp(sep->arg[2], "ro") 
						|| !strcasecmp(sep->arg[2], "feerrott") && (c->GetLevel() <= 32))
						|| !strcasecmp(sep->arg[2], "steamfont") && (c->GetLevel() <= 31)
						|| !strcasecmp(sep->arg[2], "misty") && (c->GetLevel() <= 36)
						|| !strcasecmp(sep->arg[2], "lava") && (c->GetLevel() <= 30)
						|| !strcasecmp(sep->arg[2], "wakening") && (c->GetLevel() <= 40)
						|| !strcasecmp(sep->arg[2], "iceclad") && (c->GetLevel() <= 32)
						|| !strcasecmp(sep->arg[2], "divide") && (c->GetLevel() <= 38)
						|| !strcasecmp(sep->arg[2], "cobalt") && (c->GetLevel() <= 42)
						|| !strcasecmp(sep->arg[2], "combines") && (c->GetLevel() <= 33)
						|| !strcasecmp(sep->arg[2], "surefall") && (c->GetLevel() <= 26)
						|| !strcasecmp(sep->arg[2], "grimling") && (c->GetLevel() <= 29)
						|| !strcasecmp(sep->arg[2], "twilight") && (c->GetLevel() <= 33)
						|| !strcasecmp(sep->arg[2], "dawnshroud") && (c->GetLevel() <= 37)
						|| !strcasecmp(sep->arg[2], "nexus") && (c->GetLevel() <= 26)
						|| !strcasecmp(sep->arg[2], "pok") && (c->GetLevel() <= 38)
						|| !strcasecmp(sep->arg[2], "stonebrunt") && (c->GetLevel() <= 28)
						|| !strcasecmp(sep->arg[2], "bloodfields") && (c->GetLevel() <= 55)
						|| !strcasecmp(sep->arg[2], "emerald") && (c->GetLevel() <= 38)
						|| !strcasecmp(sep->arg[2], "skyfire") && (c->GetLevel() <= 43)
						|| !strcasecmp(sep->arg[2], "wos") && (c->GetLevel() <= 64)) {
							Gater->Say("I don't have the needed level yet", sep->arg[2]);
					}
					else {
						Gater->Say("With the proper level I can [gate] to [karana],[commons],[tox],[butcher],[lava],[ro],[feerrott],[steamfont],[misty],[wakening],[iceclad],[divide],[cobalt],[combines],[surefall],[grimling],[twilight],[dawnshroud],[nexus],[pok],[stonebrunt],[bloodfields],[emerald],[skyfire] or [wos].", c->GetName());
					}
					break;

				case WIZARD:

					if      ((!strcasecmp(sep->arg[2], "commons")) && (c->GetLevel() >= 35) ) {
						Gater->Say("Casting Common Portal...");
						Gater->CastSpell(566, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "fay")) && (c->GetLevel() >= 27)) {
						Gater->Say("Casting Fay Portal...");
						Gater->CastSpell(563, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "ro")) && (c->GetLevel() >= 37)) {
						Gater->Say("Casting Ro Portal...");
						Gater->CastSpell(567, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "tox")) && (c->GetLevel() >= 25)) {
						Gater->Say("Casting Toxxula Portal...");
						Gater->CastSpell(561, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "nk")) && (c->GetLevel() >= 27)) {
						Gater->Say("Casting North Karana Portal...");
						Gater->CastSpell(562, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "nek")) && (c->GetLevel() >= 32)) {
						Gater->Say("Casting Nektulos Portal...");
						Gater->CastSpell(564, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "wakening")) && (c->GetLevel() >= 43)) {
						Gater->Say("Casting Wakening Lands Portal...");
						Gater->CastSpell(1399, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "iceclad")) && (c->GetLevel() >= 33)) {
						Gater->Say("Casting Iceclad Ocean Portal...");
						Gater->CastSpell(1418, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "divide")) && (c->GetLevel() >= 36)) {
						Gater->Say("Casting Great Divide Portal...");
						Gater->CastSpell(1423, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "cobalt")) && (c->GetLevel() >= 43)) {
						Gater->Say("Casting Cobalt Scar Portal...");
						Gater->CastSpell(1425, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "combines")) && (c->GetLevel() >= 34)) {
						Gater->Say("Casting Combines Portal...");
						Gater->CastSpell(1516, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "wk")) && (c->GetLevel() >= 27)) {
						Gater->Say("Casting West Karana Portal...");
						Gater->CastSpell(568, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "twilight")) && (c->GetLevel() >= 27)) {
						Gater->Say("Casting Twilight Portal...");
						Gater->CastSpell(2425, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "dawnshroud")) && (c->GetLevel() >= 27)) {
						Gater->Say("Casting Dawnshroud Portal...");
						Gater->CastSpell(2430, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "nexus")) && (c->GetLevel() >= 29)) {
						Gater->Say("Casting Nexus Portal...");
						Gater->CastSpell(2944, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "pok")) && (c->GetLevel() >= 27)) {
						Gater->Say("Casting Plane of Knowledge Portal...");
						Gater->CastSpell(3180, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "wos")) && (c->GetLevel() >= 27)) {
						Gater->Say("Casting Wall of Slaughter Portal...");
						Gater->CastSpell(6178, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "grimling")) && (c->GetLevel() >= 29)) {
						Gater->Say("Casting Fay Portal...");
						Gater->CastSpell(2420, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "emerald")) && (c->GetLevel() >= 37)) {
						Gater->Say("Porting to Emerald Jungle...");
						Gater->CastSpell(1739, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "hateplane")) && (c->GetLevel() >= 39)) {
						Gater->Say("Porting to Hate Plane...");
						Gater->CastSpell(666, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "airplane")) && (c->GetLevel() >= 39)) {
						Gater->Say("Porting to airplane...");
						Gater->CastSpell(674, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "skyfire")) && (c->GetLevel() >= 36)) {
						Gater->Say("Porting to Skyfire...");
						Gater->CastSpell(1738, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "bloodfields")) && (c->GetLevel() >= 55)) {
						Gater->Say("Casting Bloodfields Portal...");
						Gater->CastSpell(6183, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "stonebrunt")) && (c->GetLevel() >= 27)) {
						Gater->Say("Casting Stonebrunt Portal...");
						Gater->CastSpell(3793, c->GetID(), 1, -1, -1);
					}
					else if ((!strcasecmp(sep->arg[2], "commons") && (c->GetLevel() <= 35))
						|| !strcasecmp(sep->arg[2], "fay") && (c->GetLevel() <= 27)
						|| (!strcasecmp(sep->arg[2], "ro") && (c->GetLevel() <= 37))
						|| !strcasecmp(sep->arg[2], "tox") && (c->GetLevel() <= 25)
						|| !strcasecmp(sep->arg[2], "nk") && (c->GetLevel() <= 25)
						|| !strcasecmp(sep->arg[2], "nek") && (c->GetLevel() <= 32)
						|| !strcasecmp(sep->arg[2], "wakening") && (c->GetLevel() <= 43)
						|| !strcasecmp(sep->arg[2], "iceclad") && (c->GetLevel() <= 33)
						|| !strcasecmp(sep->arg[2], "divide") && (c->GetLevel() <= 36)
						|| !strcasecmp(sep->arg[2], "cobalt") && (c->GetLevel() <= 43)
						|| !strcasecmp(sep->arg[2], "combines") && (c->GetLevel() <= 34)
						|| !strcasecmp(sep->arg[2], "wk") && (c->GetLevel() <= 37)
						|| !strcasecmp(sep->arg[2], "twilight") && (c->GetLevel() <= 33)
						|| !strcasecmp(sep->arg[2], "dawnshroud") && (c->GetLevel() <= 39)
						|| !strcasecmp(sep->arg[2], "nexus") && (c->GetLevel() <= 29)
						|| (!strcasecmp(sep->arg[2], "pok")
						|| !strcasecmp(sep->arg[2], "hateplane")
						|| !strcasecmp(sep->arg[2], "airplane") && (c->GetLevel() <= 38))
						|| !strcasecmp(sep->arg[2], "grimling") && (c->GetLevel() <= 29)
						|| !strcasecmp(sep->arg[2], "bloodfields") && (c->GetLevel() <= 55)
						|| !strcasecmp(sep->arg[2], "stonebrunt") && (c->GetLevel() <= 27)
						|| !strcasecmp(sep->arg[2], "emerald") && (c->GetLevel() <= 36)
						|| !strcasecmp(sep->arg[2], "skyfire") && (c->GetLevel() <= 36)
						|| !strcasecmp(sep->arg[2], "wos") && (c->GetLevel() <= 64)) {
							Gater->Say("I don't have the needed level yet", sep->arg[2]);
					}
					else {
						Gater->Say("With the proper level I can [gate] to [commons],[fay],[ro],[tox],[nk],[wakening],[iceclad],[divide],[cobalt],[combines],[wk],[grimling],[twilight],[dawnshroud],[nexus],[pok],[stonebrunt],[bloodfields],[emerald],[skyfire],[hateplane],[airplane] or [wos].", c->GetName());
					}
					break;
				default:
					c->Message(15, "You must have a Druid or Wizard in your group.");
					break;
			}
		}
	}

	//Endure Breath
	if ((!strcasecmp(sep->arg[1], "endureb")) && (c->IsGrouped())) {
		Mob *Endurer;
		int32 EndurerClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case DRUID:
							Endurer = g->members[i];
							EndurerClass = DRUID;
							break;
						case SHAMAN:
							if (EndurerClass != DRUID){
								Endurer = g->members[i];
								EndurerClass = SHAMAN;
							}
							break;
						case ENCHANTER:
							if(EndurerClass == 0){
								Endurer = g->members[i];
								EndurerClass = ENCHANTER;
							}
							break;
						case RANGER:
							if(EndurerClass == 0) {
								Endurer = g->members[i];
								EndurerClass = RANGER;
							}
							break;
						default:
							break;
					}
				}
			}
			switch(EndurerClass) {
				case DRUID:

					if  (c->GetLevel() <= 6) {
						Endurer->Say("I'm not level 6 yet.");
					}
					else if (zone->CanCastOutdoor()) {
						Endurer->Say("Casting Enduring Breath...");
						Endurer->CastSpell(86, c->GetID(), 1, -1, -1);
						break;
					}
					break;
				case SHAMAN:

					if ((zone->CanCastOutdoor()) && (c->GetLevel() >= 12)) { 
						Endurer->Say("Casting Enduring Breath...");
						Endurer->CastToClient()->CastSpell(86, c->GetID(), 1, -1, -1);
					}
					else if (c->GetLevel() <= 12) {
						Endurer->Say("I'm not level 12 yet.");
					}
					break;
				case RANGER:

					if((zone->CanCastOutdoor()) && (c->GetLevel() >= 20)){
						Endurer->Say("Casting Enduring Breath...");
						Endurer->CastToClient()->CastSpell(86, c->GetID(), 1, -1, -1);
					}
					else if (c->GetLevel() <= 20) {
						Endurer->Say("I'm not level 20 yet.");
					}
					break;
				case ENCHANTER:

					if((zone->CanCastOutdoor()) && (c->GetLevel() >= 12)) {
						Endurer->Say("Casting Enduring Breath...");
						Endurer->CastToClient()->CastSpell(86, c->GetID(), 1, -1, -1);
					}
					else if (c->GetLevel() <= 12) {
						Endurer->Say("I'm not level 12 yet.");
					}
					break;
				default:
					c->Message(15, "You must have a Druid, Shaman, Ranger, or Enchanter in your group.");
					break;
			}
		}
	}

	//Invisible
	if ((!strcasecmp(sep->arg[1], "invis")) && (c->IsGrouped())) {
		Mob *Inviser;
		int32 InviserClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case ENCHANTER:
							Inviser = g->members[i];
							InviserClass = ENCHANTER;
							break;
						case MAGICIAN:
							if (InviserClass != ENCHANTER){
								Inviser = g->members[i];
								InviserClass = MAGICIAN;
							}
							break;
						case WIZARD:
							if((InviserClass != ENCHANTER) || (InviserClass != MAGICIAN)){
								Inviser = g->members[i];
								InviserClass = WIZARD;
							}
							break;
						case NECROMANCER:
							if(InviserClass == 0){
								Inviser = g->members[i];
								InviserClass = NECROMANCER;
							}
							break;
						case DRUID:
							if((InviserClass != ENCHANTER) || (InviserClass != WIZARD)
								|| (InviserClass != MAGICIAN)){
									Inviser = g->members[i];
									InviserClass = DRUID;
							}
							break;
						default:
							break;
					}
				}
			}
			switch(InviserClass) {
				case ENCHANTER:
					if  ((c->GetLevel() <= 14) && (!strcasecmp(sep->arg[2], "undead"))) {
						Inviser->Say("I'm not level 14 yet.");
					}
					else if ((!c->IsInvisible(c)) && (!c->invisible_undead) && (c->GetLevel() >= 14) && (!strcasecmp(sep->arg[2], "undead"))) {
						Inviser->Say("Casting invis undead...");
						Inviser->CastSpell(235, c->GetID(), 1, -1, -1);
					}
					else if  ((c->GetLevel() <= 4) && (!strcasecmp(sep->arg[2], "live"))) {
						Inviser->Say("I'm not level 4 yet.");
					}
					else if ((!c->IsInvisible(c))&& (!c->invisible_undead) && (c->GetLevel() >= 4) && (!strcasecmp(sep->arg[2], "live"))) { 
						Inviser->Say("Casting invisibilty...");
						Inviser->CastSpell(42, c->GetID(), 1, -1, -1);
					}
					else if  ((c->GetLevel() <= 6) && (!strcasecmp(sep->arg[2], "see"))) {
						Inviser->Say("I'm not level 6 yet.");
					}
					else if ((c->GetLevel() >= 6) && (!strcasecmp(sep->arg[2], "see"))) { 
						Inviser->Say("Casting see invisible...");
						Inviser->CastSpell(80, c->GetID(), 1, -1, -1);
					}
					else if ((c->IsInvisible(c)) || (c->invisible_undead)) { 
						Inviser->Say("I can't cast this if you're already invis-buffed...");
					}
					else {
						Inviser->Say("Do you want [invis undead], [invis live] or [invis see] ?", c->GetName());
					}
					break;
				case MAGICIAN:
					if  (!strcasecmp(sep->arg[2], "undead")) {
						Inviser->Say("I don't have that spell.");
					}
					else if  ((c->GetLevel() <= 8) && (!strcasecmp(sep->arg[2], "live"))) {
						Inviser->Say("I'm not level 8 yet.");
					}
					else if ((!c->IsInvisible(c))&& (!c->invisible_undead) && (c->GetLevel() >= 8) && (!strcasecmp(sep->arg[2], "live"))) { 
						Inviser->Say("Casting invisibilty...");
						Inviser->CastSpell(42, c->GetID(), 1, -1, -1);
					}
					else if  ((c->GetLevel() <= 16) && (!strcasecmp(sep->arg[2], "see"))) {
						Inviser->Say("I'm not level 16 yet.");
					}
					else if ((c->GetLevel() >= 16) && (!strcasecmp(sep->arg[2], "see"))) { 
						Inviser->Say("Casting see invisible...");
						Inviser->CastSpell(80, c->GetID(), 1, -1, -1);
					}
					else if ((c->IsInvisible(c)) || (c->invisible_undead)) { 
						Inviser->Say("I can't cast this if you're already invis-buffed...");
					}
					else {
						Inviser->Say("Do you want [invis live] or [invis see] ?", c->GetName());
					}
					break;
				case WIZARD:
					if  ((c->GetLevel() <= 39) && (!strcasecmp(sep->arg[2], "undead"))) {
						Inviser->Say("I'm not level 39 yet.");
					}
					else if ((!c->IsInvisible(c))&& (!c->invisible_undead) && (c->GetLevel() >= 39) && (!strcasecmp(sep->arg[2], "undead"))) {
						Inviser->Say("Casting invis undead...");
						Inviser->CastSpell(235, c->GetID(), 1, -1, -1);
					}
					else if  ((c->GetLevel() <= 16) && (!strcasecmp(sep->arg[2], "live"))) {
						Inviser->Say("I'm not level 16 yet.");
					}
					else if ((!c->IsInvisible(c))&& (!c->invisible_undead) && (c->GetLevel() >= 16) && (!strcasecmp(sep->arg[2], "live"))) { 
						Inviser->Say("Casting invisibilty...");
						Inviser->CastSpell(42, c->GetID(), 1, -1, -1);
					}
					else if  ((c->GetLevel() <= 4) && (!strcasecmp(sep->arg[2], "see"))) {
						Inviser->Say("I'm not level 6 yet.");
					}
					else if ((c->GetLevel() >= 4) && (!strcasecmp(sep->arg[2], "see"))) { 
						Inviser->Say("Casting see invisible...");
						Inviser->CastSpell(80, c->GetID(), 1, -1, -1);
					}
					else if ((c->IsInvisible(c)) || (c->invisible_undead)) { 
						Inviser->Say("I can't cast this if you're already invis-buffed...");
					}
					else {
						Inviser->Say("Do you want [invis undead], [invis live] or [invis see] ?", c->GetName());
					}
					break;
				case NECROMANCER:
					if ((!c->IsInvisible(c))&& (!c->invisible_undead) && (!strcasecmp(sep->arg[2], "undead"))) {
						Inviser->Say("Casting invis undead...");
						Inviser->CastSpell(235, c->GetID(), 1, -1, -1);
					}
					else if (!strcasecmp(sep->arg[2], "see")) { 
						Inviser->Say("I don't have that spell...");
					}
					else if (!strcasecmp(sep->arg[2], "live")) { 
						Inviser->Say("I don't have that spell...");
					}
					else if ((c->IsInvisible(c))|| (c->invisible_undead)) { 
						Inviser->Say("I can't cast this if you're already invis-buffed...");
					}
					else {
						Inviser->Say("I only have [invis undead]", c->GetName());
					}
					break;
				case DRUID:
					if  (!strcasecmp(sep->arg[2], "undead")) {
						Inviser->Say("I don't have that spell...");
					}
					else if  ((c->GetLevel() <= 4) && (!strcasecmp(sep->arg[2], "live"))) {
						Inviser->Say("I'm not level 4 yet.");
					}
					else if ((!c->IsInvisible(c))&& (!c->invisible_undead) && (c->GetLevel() >= 18) && (!strcasecmp(sep->arg[2], "live"))) { 
						Inviser->Say("Casting Superior Camouflage...");
						Inviser->CastSpell(34, c->GetID(), 1, -1, -1);
					}
					else if ((!c->IsInvisible(c))&& (!c->invisible_undead) && (c->GetLevel() >= 4) && (!strcasecmp(sep->arg[2], "live")) && (zone->CanCastOutdoor())) { 
						Inviser->Say("Casting Camouflage...");
						Inviser->CastSpell(247, c->GetID(), 1, -1, -1);
					}
					else if ((c->GetLevel() >= 4) && (!strcasecmp(sep->arg[2], "live")) && (!zone->CanCastOutdoor())) { 
						Inviser->Say("I can't cast this spell indoors...");
					}
					else if  ((c->GetLevel() <= 13) && (!strcasecmp(sep->arg[2], "see"))) {
						Inviser->Say("I'm not level 13 yet.");
					}
					else if ((c->GetLevel() >= 13) && (!strcasecmp(sep->arg[2], "see"))) { 
						Inviser->Say("Casting see invisible...");
						Inviser->CastSpell(80, c->GetID(), 1, -1, -1);
					}
					else if ((c->IsInvisible(c)) || (c->invisible_undead)) { 
						Inviser->Say("I can't cast this if you're already invis-buffed...");
					}
					else {
						Inviser->Say("Do you want [invis live] or [invis see] ?", c->GetName());
					}
					break;
				default:
					c->Message(15, "You must have a Enchanter, Magician, Wizard, Druid, or Necromancer in your group.");
					break;
			}
		}
	}

	//Levitate
	if ((!strcasecmp(sep->arg[1], "levitate")) && (c->IsGrouped())) {
		Mob *Lever;
		int32 LeverClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case DRUID:
							Lever = g->members[i];
							LeverClass = DRUID;
							break;
						case SHAMAN:
							if (LeverClass != DRUID){
								Lever = g->members[i];
								LeverClass = SHAMAN;
							}
							break;
						case WIZARD:
							if(LeverClass == 0){
								Lever = g->members[i];
								LeverClass = WIZARD;
							}
							break;
						case ENCHANTER:
							if (LeverClass == 0) {
								Lever = g->members[i];
								LeverClass = ENCHANTER;
							}
							break;
						default:
							break;
					}
				}
			}
			switch(LeverClass) {
				case DRUID:
					if  (c->GetLevel() <= 14) {
						Lever->Say("I'm not level 14 yet.");
					}
					else if (zone->CanCastOutdoor()) {
						Lever->Say("Casting Levitate...");
						Lever->CastSpell(261, c->GetID(), 1, -1, -1);
						break;
					}
					else if (!zone->CanCastOutdoor()) {
						Lever->Say("I can't cast this spell indoors", c->GetName());
					}
					break;

				case SHAMAN:

					if ((zone->CanCastOutdoor()) && (c->GetLevel() >= 10)) { 
						Lever->Say("Casting Levitate...");
						Lever->CastToClient()->CastSpell(261, c->GetID(), 1, -1, -1);
					}
					else if (!zone->CanCastOutdoor()) {
						Lever->Say("I can't cast this spell indoors", c->GetName());
					}
					else if (c->GetLevel() <= 10) {
						Lever->Say("I'm not level 10 yet.");
					}
					break;

				case WIZARD:

					if((zone->CanCastOutdoor()) && (c->GetLevel() >= 22)){
						Lever->Say("Casting Levitate...");
						Lever->CastToClient()->CastSpell(261, c->GetID(), 1, -1, -1);
					}
					else if (!zone->CanCastOutdoor()) {
						Lever->Say("I can't cast this spell indoors", c->GetName());
					}
					else if (c->GetLevel() <= 22) {
						Lever->Say("I'm not level 22 yet.");
					}
					break;

				case ENCHANTER:

					if((zone->CanCastOutdoor()) && (c->GetLevel() >= 15)) {
						Lever->Say("Casting Levitate...");
						Lever->CastToClient()->CastSpell(261, c->GetID(), 1, -1, -1);
					}
					else if (!zone->CanCastOutdoor()) {
						Lever->Say("I can't cast this spell indoors", c->GetName());
					}
					else if (c->GetLevel() <= 15) {
						Lever->Say("I'm not level 15 yet.");
					}
					break;


				default:
					c->Message(15, "You must have a Druid, Shaman, Wizard, or Enchanter in your group.");
					break;
			}
		}
	}

	//Resists
	if ((!strcasecmp(sep->arg[1], "resist")) && (c->IsGrouped())) {
		Mob *Resister;
		int32 ResisterClass = 0;
		Group *g = c->GetGroup();
		if(g) {
			for(int i=0; i<MAX_GROUP_MEMBERS; i++){
				if(g->members[i] && g->members[i]->IsBot()) {
					switch(g->members[i]->GetClass()) {
						case CLERIC:
							Resister = g->members[i];
							ResisterClass = CLERIC;
							break;
						case SHAMAN:
							if(ResisterClass != CLERIC){
								Resister = g->members[i];
								ResisterClass = SHAMAN;
							}
						case DRUID:
							if (ResisterClass == 0){
								Resister = g->members[i];
								ResisterClass = DRUID;
							}
							break;
							break;
						default:
							break;
					}
				}
			}
			switch(ResisterClass) {
				case CLERIC:
					if	(!strcasecmp(sep->arg[2], "poison") && (c->GetLevel() >= 6))  {
						Resister->Say("Casting poison protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(1, Resister->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "disease") && (c->GetLevel() >= 11)) {
						Resister->Say("Casting disease protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(2, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "fire") && (c->GetLevel() >= 8)) {
						Resister->Say("Casting fire protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(3, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "cold") && (c->GetLevel() >= 13)) {
						Resister->Say("Casting cold protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(4, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "magic") && (c->GetLevel() >= 16)) {
						Resister->Say("Casting magic protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(5, Resister->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "magic") && (c->GetLevel() <= 16)
						|| !strcasecmp(sep->arg[2], "cold") && (c->GetLevel() <= 13)
						|| !strcasecmp(sep->arg[2], "fire") && (c->GetLevel() <= 8) 
						|| !strcasecmp(sep->arg[2], "disease") && (c->GetLevel() <= 11)
						|| !strcasecmp(sep->arg[2], "poison") && (c->GetLevel() <= 6)) {
							Resister->Say("I don't have the needed level yet", sep->arg[2]);
					}
					else 
						Resister->Say("Do you want [resist poison], [resist disease], [resist fire], [resist cold], or [resist magic]?", c->GetName());

					break;

				case SHAMAN:
					if	(!strcasecmp(sep->arg[2], "poison") && (c->GetLevel() >= 20))  {
						Resister->Say("Casting poison protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(12, Resister->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "disease") && (c->GetLevel() >= 8)) {
						Resister->Say("Casting disease protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(13, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "fire") && (c->GetLevel() >= 5)) {
						Resister->Say("Casting fire protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(14, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "cold") && (c->GetLevel() >= 1)) {
						Resister->Say("Casting cold protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(15, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "magic") && (c->GetLevel() >= 19)) {
						Resister->Say("Casting magic protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(16, Resister->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "magic") && (c->GetLevel() <= 19)
						|| !strcasecmp(sep->arg[2], "cold") && (c->GetLevel() <= 1)
						|| !strcasecmp(sep->arg[2], "fire") && (c->GetLevel() <= 5) 
						|| !strcasecmp(sep->arg[2], "disease") && (c->GetLevel() <= 8)
						|| !strcasecmp(sep->arg[2], "poison") && (c->GetLevel() <= 20)) {
							Resister->Say("I don't have the needed level yet", sep->arg[2]);
					}
					else 
						Resister->Say("Do you want [resist poison], [resist disease], [resist fire], [resist cold], or [resist magic]?", c->GetName());

					break;

				case DRUID:

					if	(!strcasecmp(sep->arg[2], "poison") && (c->GetLevel() >= 19)) {
						Resister->Say("Casting poison protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(7, Resister->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "disease") && (c->GetLevel() >= 19)) {
						Resister->Say("Casting disease protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(8, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "fire")) { // Fire level 1
						Resister->Say("Casting fire protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(9, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "cold") && (c->GetLevel() >= 13)) {
						Resister->Say("Casting cold protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(10, Resister->GetLevel());
					}
					else if(!strcasecmp(sep->arg[2], "magic") && (c->GetLevel() >= 16)) {
						Resister->Say("Casting magic protection...", sep->arg[2]);
						Resister->CastToBot()->Bot_Command_Resist(11, Resister->GetLevel());
					}
					else if (!strcasecmp(sep->arg[2], "magic") && (c->GetLevel() <= 16)
						|| !strcasecmp(sep->arg[2], "cold") && (c->GetLevel() <= 9)
						|| !strcasecmp(sep->arg[2], "disease") && (c->GetLevel() <= 19)
						|| !strcasecmp(sep->arg[2], "poison") && (c->GetLevel() <= 19)) {
							Resister->Say("I don't have the needed level yet", sep->arg[2]) ;
					}
					else 
						Resister->Say("Do you want [resist poison], [resist disease], [resist fire], [resist cold], or [resist magic]?", c->GetName());

					break;

				default:
					c->Message(15, "You must have a Cleric, Shaman, or Druid in your group.");
					break;
			}
		}
	}

	// debug commands
	if(!strcasecmp(sep->arg[1], "debug") && !strcasecmp(sep->arg[2], "inventory")) {
		Mob *target = c->GetTarget();

		if(target && target->IsBot()) {
			for(int i=0; i<9; i++) {
				c->Message(15,"Equiped slot: %i , item: %i \n", i, target->CastToBot()->GetEquipment(i));
			}
			if(target->CastToBot()->GetEquipment(8) > 0)
				c->Message(15,"This bot has an item in off-hand.");
		}
		return;
	}

	if(!strcasecmp(sep->arg[1], "debug") && !strcasecmp(sep->arg[2], "botcaracs"))
	{
		Mob *target = c->GetTarget();
		if(target && target->IsBot())
		{
			if(target->CanThisClassDualWield())
				c->Message(15, "This class can dual wield.");
			if(target->CanThisClassDoubleAttack())
				c->Message(15, "This class can double attack.");
		}
		if(target->GetPetID())
			c->Message(15, "I've a pet and its name is %s", target->GetPet()->GetCleanName() );
		return;
	}

	if(!strcasecmp(sep->arg[1], "debug") && !strcasecmp(sep->arg[2], "spells"))
	{
		Mob *target = c->GetTarget();
		if(target && target->IsBot())
		{
			for(int i=0; i<16; i++)
			{
				if(target->CastToBot()->BotGetSpells(i) != 0)
				{
					SPDat_Spell_Struct botspell = spells[target->CastToBot()->BotGetSpells(i)];
					c->Message(15, "(DEBUG) %s , Slot(%i), Spell (%s) Priority (%i) \n", target->GetCleanName(), i, botspell.name, target->CastToBot()->BotGetSpellPriority(i));
				}
			}
		}
		return;
	}



	// EQoffline - Raids
	if(!strcasecmp(sep->arg[1], "raid") && !strcasecmp(sep->arg[2], "help"))
	{
		c->Message(15, "#bot raid help - will show this help");
		c->Message(15, "#bot raid info - will give info of your raid.");
		c->Message(15, "#bot raid create - will create your raid (you will be the raid leader)");
		c->Message(15, "#bot raid group create - create a group. Your target will be the leader.");
		c->Message(15, "#bot raid invite bot [group leader's name] - Invite your target into that group leader's group.");	
		c->Message(15, "#bot raid disband - Disband the raid.");
		c->Message(15, "#bot raid order maintank - Your target will be flagged as the main tank.");
		c->Message(15, "#bot raid order secondtank - Your target will be flagged as the second tank.");
		c->Message(15, "#bot raid order maintarget - Your target will be flagged as the main raid's target.");
		c->Message(15, "#bot raid order secondtarget - Your target will be flagged as the second raid's target.");
		c->Message(15, "#bot raid order grouptarget [group leader's name] - Your target will be flagged as the target of a specific group.");
		c->Message(15, "#bot raid order task [attack/guard] [group leader's name] - You will give a specific task [attack/guard].");
		c->Message(15, "#bot raid order task [follow/assist] [group1 leader's name] [group2 leader's name] - Group 1 will [follow/assist] Group 2.");
		c->Message(15, "#bot raid order task enraged - Tell your raid to stop attacking to defend against ENRAGED mobs.");
		return;
	}

	if(!strcasecmp(sep->arg[1], "raid"))
	{

		if(!strcasecmp(sep->arg[2], "info"))
		{
			if(c->GetBotRaidID() > 0)
			{
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
				if(br) { 
					br->BotRaidInfo(c);
				}
			}
			else {
				c->Message(15, "You are not in a bot raid.");
			}
			return;
		}

		else if(!strcasecmp(sep->arg[2], "create"))
		{
			if(c->GetBotRaidID() > 0)
			{
				c->Message(15, "You are already in a raid!");
				return;
			}
			if(!c->IsGrouped() || ( c->IsGrouped() &&  entity_list.GetGroupByMob(c)->GroupCount() < 6))
			{
				c->Message(15, "You must be grouped and have a full group to create a raid.");
				return;
			}
			else {
				BotRaids *br = new BotRaids(c->CastToMob());
				if(br) {
					Group *g = c->GetGroup();
					for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
						if(g->members[i]) {
							g->members[i]->SetBotRaidID(br->GetBotRaidID());
							if(g->members[i]->GetPetID())
							{
								g->members[i]->GetPet()->SetBotRaidID(br->GetBotRaidID());
							}
						}
					}
					br->AddBotGroup(g);
				}
			}
			return;
		}

		else if(!strcasecmp(sep->arg[2], "group") && !strcasecmp(sep->arg[3], "create"))
		{
			if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot() || c->GetFeigned()) {
				return;
			}

			if(c->GetBotRaidID() > 0) {
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
				if(br) {
					if(br->GetBotRaidAggro()) {
						c->Message(15, "You can't create bot groups while you are engaged.");
						return;
					}
				}
			}
			else if(c->IsGrouped())
			{
				Group *g = entity_list.GetGroupByClient(c);
				for (int i=0; i<MAX_GROUP_MEMBERS; i++)
				{
					if(g && g->members[i] && g->members[i]->IsEngaged())
					{
						c->Message(15, "You can't create bot groups while you are engaged.");
						return;
					}
				}
			}

			if(c->GetBotRaidID() <= 0 && c->GetTarget()->IsBot())
			{
				c->Message(15, "You must have created your raid and your group must be full before doing that!");
				/*Mob* kmob = c->GetTarget();
				if(kmob != NULL) {
					kmob->CastToBot()->SetBotOwner(0);
					kmob->Kill();
				}*/
				return;
			}

			
			if(c->GetTarget()->CastToBot()->GetBotOwnerCharacterID() != c->CharacterID()) {
				c->GetTarget()->Say("I can't be your bot, you are not my owner.");
				return;
			}

			if((c->GetTarget() != NULL) && !c->GetTarget()->IsGrouped() && c->GetTarget()->IsBot())
			{
				BotRaids *br = entity_list.GetBotRaidByMob(c->CastToMob());
				if(br && (br->RaidBotGroupsCount() >= MAX_BOT_RAID_GROUPS)) {
					/*Mob *kmob = c->GetTarget();
					if(kmob != NULL) {
						kmob->CastToBot()->SetBotOwner(0);
						kmob->Kill();
					}*/
					return;
				}

				Mob *gleader = c->GetTarget();
				gleader->SetFollowID(c->GetID());
				gleader->CastToBot()->SetBotOwner(c);
				gleader->SetBotRaidID(br->GetBotRaidID());

				Group *g = new Group(gleader);
				entity_list.AddGroup(g);
				br->AddBotGroup(g);

				// load up leaders gear
				uint32 itemID = 0;
				const Item_Struct* item2 = NULL;
				for(int i=0; i<22; i++) {
					itemID = gleader->CastToBot()->GetBotItemBySlot(i, &TempErrorMessage);

					if(!TempErrorMessage.empty()) {
						c->Message(13, TempErrorMessage.c_str());
						return;
					}
					//itemID = database.GetBotItemBySlot(gleader->GetNPCTypeID(), i);
					if(itemID != 0) {
						item2 = database.GetItem(itemID);
						gleader->CastToBot()->BotTradeAddItem(itemID, item2->MaxCharges, item2->Slots, i, &TempErrorMessage, false);
						//c->BotTradeAddItem(itemID, item2->MaxCharges, item2->Slots, i, gleader->CastToNPC(), false);
					}
				}
				gleader->CastToBot()->CalcBotStats();
				c->Message(15, "-- RAID -- Group Leader is: %s\n", gleader->GetCleanName());
			}
			else {
				c->Message(15, "You must target your bot first.");
			}
			return;
		}

		else if(!strcasecmp(sep->arg[2], "invite") && !strcasecmp(sep->arg[3], "bot"))
		{
			if(c->GetFeigned()) {
				c->Message(15, "You cannot create raid groups while feigned.");
			}

			if((c->GetTarget() == NULL) || !c->GetTarget()->IsBot()) {
				c->Message(15, "You must target a bot first.");
				return;
			}

			if(c->GetTarget()->CastToBot()->GetBotOwnerCharacterID() != c->CharacterID())
			{
				c->GetTarget()->Say("I can not join your bot raid, you are not my owner.");
				return;
			}

			Mob* sictar = entity_list.GetMob(sep->argplus[4]);
			if(!sictar || !sictar->IsGrouped() || entity_list.GetGroupByMob(sictar) == NULL || entity_list.GetGroupByMob(sictar)->GetLeader() != sictar)
			{
				c->Message(15, "You didn't type the correct group leader name.");
				//Mob* kmob = c->GetTarget();
				//if(kmob != NULL) {
				//	//kmob->BotOwner = NULL;
				//	kmob->CastToBot()->SetBotOwner(0);
				//	kmob->Kill();
				//}
				return;
			}

			if(c->GetTarget()->IsGrouped()) {
				c->Message(15, "You must target an ungrouped bot first.");
				/*Mob* kmob = c->GetTarget();
				if(kmob != NULL) {
					kmob->CastToBot()->SetBotOwner(0);
					kmob->Kill();
				}*/
				return;
			}                
			else {
				Mob *inv = c->GetTarget();

				Group *g = entity_list.GetGroupByMob(sictar);
				//if(g && (GetCountBotsInGroup(g) > 5)) {
				if(g && g->GroupCount() == 6) {
					inv->Say("I can't get into the group, it's full already.");
					/*inv->CastToBot()->SetBotOwner(0);
					inv->Kill();*/
					return;
				}
				if(g && (g->GroupCount() < 6))
				{
					inv->SetFollowID(sictar->GetID());
					inv->CastToBot()->SetBotOwner(c);
					g->AddMember(inv);
					inv->SetBotRaidID(sictar->GetBotRaidID());

					// Equip newly raid grouped bot
					uint32 itemID = 0;
					const Item_Struct* item2 = NULL;
					for(int i=0; i<22; i++) {
						itemID = inv->CastToBot()->GetBotItemBySlot(i, &TempErrorMessage);

						if(!TempErrorMessage.empty()) {
							c->Message(13, TempErrorMessage.c_str());
							return;
						}

						if(itemID != 0) {
							item2 = database.GetItem(itemID);
							inv->CastToBot()->BotTradeAddItem(itemID, item2->MaxCharges, item2->Slots, i, &TempErrorMessage, false);
							if(!TempErrorMessage.empty()) {
								c->Message(13, TempErrorMessage.c_str());
								return;
							}
						}
					}
					inv->CastToBot()->CalcBotStats();
					inv->Say("I have joined %s's raid group.", g->GetLeader()->GetCleanName());
				}
				else
					inv->Say("I can't join the group (You didn't enter the group leader's name or the group is full already. Type #bot raid info\n");
			}
			return;
		}
		else if(!strcasecmp(sep->arg[2], "disband"))
		{
			if(c->GetBotRaidID() > 0) {
				BotRaids *brd = entity_list.GetBotRaidByMob(c->CastToMob());
				if(brd) {
					brd->RemoveRaidBots();
					brd = NULL;
				}
				Group *g = entity_list.GetGroupByMob(c->CastToMob());
				if(g) {
					bool hasBots = false;
					for(int i=5; i>=0; i--) {
						if(g->members[i] && g->members[i]->IsBot()) {
							hasBots = true;
							//g->members[i]->CastToBot()->SetBotOwner(0);
							g->members[i]->CastToBot()->Camp();
						}
					}
					if(hasBots) {
						hasBots = false;
						if(g->GroupCount() <= 1) {
							g->DisbandGroup();
						}
					}
				}
				c->Message(15, "Raid disbanded.");
			}
			c->SetBotRaidID(0);
			return;
		}

		else if(!strcasecmp(sep->arg[2], "order"))
		{
			if(!strcasecmp(sep->arg[3], "maintank"))
			{
				if(c->GetTarget() == NULL)
					return;
				else {
					BotRaids *brc = entity_list.GetBotRaidByMob(c->CastToMob());
					BotRaids *brm = entity_list.GetBotRaidByMob(c->GetTarget());
					if(brc == NULL || brm == NULL || brc != brm)
						return;
					else {
						brc->SetBotMainTank(c->GetTarget());
						c->GetTarget()->Say("I am the Raid Primary Tank, /assist me!");
					}
				}
			}
			else if(!strcasecmp(sep->arg[3], "secondtank"))
			{
				if(c->GetTarget() == NULL)
					return;
				else {
					BotRaids *brc = entity_list.GetBotRaidByMob(c->CastToMob());
					BotRaids *brm = entity_list.GetBotRaidByMob(c->GetTarget());
					if(brc == NULL || brm == NULL || brc != brm)
						return;
					else {
						brc->SetBotSecondTank(c->GetTarget());
						c->GetTarget()->Say("I am the Raid Secondary Tank, /assist me if the Primary Tank dies!");
					}
				}
			}
			else if(!strcasecmp(sep->arg[3], "maintarget"))
			{
				if(entity_list.GetBotRaidByMob(c->CastToMob()) == NULL)
					return;
				else{
					BotRaids *brc = entity_list.GetBotRaidByMob(c->CastToMob());
					if(!brc || !c->GetTarget() || !c->IsAttackAllowed(c->GetTarget()))
					{
						if(brc)
							brc->SetBotMainTarget(NULL);
						return;
					}
					else
					{
						brc->SetBotMainTarget(c->GetTarget());
						c->Message(15, "Main target is %s", c->GetTarget()->GetCleanName());
					}
				}
			}
			else if(!strcasecmp(sep->arg[3], "secondtarget"))
			{
				if(entity_list.GetBotRaidByMob(c->CastToMob()) == NULL)
					return;
				else {
					BotRaids *brc = entity_list.GetBotRaidByMob(c->CastToMob());
					if(c->GetTarget() == NULL || !c->GetTarget()->IsAttackAllowed(c) || brc == NULL)
						return;
					else {
						brc->SetBotSecondTarget(c->GetTarget());
					}
				}
			}
			else if(!strcasecmp(sep->arg[3], "grouptarget"))
			{
				if(entity_list.GetBotRaidByMob(c->CastToMob()) == NULL)
					return;
				else {
					BotRaids *brc = entity_list.GetBotRaidByMob(c->CastToMob());
					if(c->GetTarget() == NULL ||c->GetTarget()->IsBot())
					{
						c->Message(15, "You don't have a target or your target is a bot.");
						return;
					}
					if(brc) {
						brc->SetBotGroupTarget(c->GetTarget(), entity_list.GetGroupByLeaderName(sep->arg[4]));
					}
				}
			}
			else if(!strcasecmp(sep->arg[3], "task"))
			{
				BotRaids *brc = entity_list.GetBotRaidByMob(c->CastToMob());
				if(brc) {
					if(!strcasecmp(sep->arg[4], "attack"))
					{
						Mob *ctarget = c->GetTarget();
						if(ctarget != NULL) {
							brc->GroupAssignTask(entity_list.GetGroupByLeaderName(sep->arg[5]), 2, ctarget);
						}
						else {
							c->Message(15, "You must target a monster.");
						}
					}
					else if(!strcasecmp(sep->arg[4], "guard"))
					{
						Mob *ctarget = NULL;
						brc->GroupAssignTask(entity_list.GetGroupByLeaderName(sep->arg[5]), 4, ctarget);
					}
					else if(!strcasecmp(sep->arg[4], "assist"))
					{
						brc->GroupAssignTask(entity_list.GetGroupByLeaderName(sep->arg[5]), 3, entity_list.GetGroupByLeaderName(sep->arg[6]));
					}				
					else if(!strcasecmp(sep->arg[4], "follow"))
					{
						brc->GroupAssignTask(entity_list.GetGroupByLeaderName(sep->arg[5]), 1, entity_list.GetGroupByLeaderName(sep->arg[6]));
					}
					else if(!strcasecmp(sep->arg[4], "enraged")) {
						brc->RaidDefendEnraged();
					}
				}
			}
		}
		return;
	}
}

// franck: EQoffline
// This function has been reworked for the caster bots, when engaged.
// Healers bots must heal thoses who loose HP.
bool EntityList::Bot_AICheckCloseBeneficialSpells(Bot* caster, int8 iChance, float iRange, int16 iSpellTypes) {
	_ZP(EntityList_Bot_AICheckCloseBeneficialSpells);

	if((iSpellTypes&SpellTypes_Detrimental) != 0) {
		//according to live, you can buff and heal through walls...
		//now with PCs, this only applies if you can TARGET the target, but
		// according to Rogean, Live NPCs will just cast through walls/floors, no problem..
		//
		// This check was put in to address an idle-mob CPU issue
		_log(AI__ERROR, "Error: detrimental spells requested from AICheckCloseBeneficialSpells!!");
		return(false);
	}
	
	if(!caster)
		return false;

	if(!caster->AI_HasSpells())
		return false;

	if (iChance < 100) {
		int8 tmp = MakeRandomInt(1, 100);
		if (tmp > iChance)
			return false;
	}

	// Franck: EQoffline.
	// Ok, Beneficial spells depend of the class of the caster also..
	int8 botCasterClass = caster->GetClass();;

	// Heal and buffs spells might have a different chance, that's why I separe them .
	if( botCasterClass == CLERIC || botCasterClass == DRUID || botCasterClass == SHAMAN || botCasterClass == PALADIN || botCasterClass == BEASTLORD || botCasterClass == RANGER) {
		//If AI_EngagedCastCheck() said to the healer that he had to heal
		if( iSpellTypes == SpellType_Heal )	// 
		{
			// check raids
			if( caster->CastToMob()->IsGrouped() && caster->GetBotRaidID() && (entity_list.GetBotRaidByMob(caster) != NULL)) {
				BotRaids *br = entity_list.GetBotRaidByMob(caster);
				// boolean trying to ai the heal rotation, prolly not working well.
				if(br) {
					if(br->GetBotMainTank() && (br->GetBotMainTank()->GetHPRatio() < 80))
					{
						if(caster->Bot_AICastSpell(br->GetBotMainTank(), 80, SpellType_Heal)) {
							return true;
						}
					}
					else if(br->GetBotSecondTank() && (br->GetBotSecondTank()->GetHPRatio() < 80))
					{
						if(caster->Bot_AICastSpell(br->GetBotSecondTank(), 80, SpellType_Heal)) {
							return true;
						}
					}
				}
			}

			// check in group
			if(caster->IsGrouped()) {
				Group *g = entity_list.GetGroupByMob(caster);
				
				if(g) {
					for( int i = 0; i<MAX_GROUP_MEMBERS; i++) {
						if(g->members[i] && !g->members[i]->qglobal && (g->members[i]->GetHPRatio() < 80)) {
							if(caster->Bot_AICastSpell(g->members[i], 100, SpellType_Heal))
								return true;
						}
						if(g->members[i] && !g->members[i]->qglobal && g->members[i]->GetPetID()) {
							if(caster->Bot_AICastSpell(g->members[i]->GetPet(), 60, SpellType_Heal))
								return true;
						}
					}
				}
			}
		}
	}

	//Ok for the buffs..
	if( iSpellTypes == SpellType_Buff) {
		// Let's try to make Bard working...
		if(botCasterClass == BARD) {
			if(caster->Bot_AICastSpell(caster, 100, SpellType_Buff))
				return true;
			else
				return false;
		}

		if(caster->IsGrouped() )
		{
			Group *g = entity_list.GetGroupByMob(caster);
			
			if(g) {
				for( int i = 0; i<MAX_GROUP_MEMBERS; i++) {
					if(g->members[i]) {
						if(caster->Bot_AICastSpell(g->members[i], 100, SpellType_Buff)) {
							return true;
						}
					}
				}
			}
		}
	}

	return false;
}

BotRaids* EntityList::GetBotRaidByMob(Mob *mr) {
	list<BotRaids *>::iterator iterator;
	iterator = botraid_list.begin();
	while(iterator != botraid_list.end()) {
		if((*iterator)->IsBotRaidMember(mr)) {
			return *iterator;
		}
		iterator++;
	}
	return 0;
}

void EntityList::AddBotRaid(BotRaids* br) {
	if(br == NULL)
		return;
	
	int16 gid = GetFreeID();
	if(gid == 0) {
		LogFile->write(EQEMuLog::Error, "Unable to get new Raid ID from world server. Raid is going to be broken.");
		return;
	}
	
	AddBotRaid(br, gid);
}

void EntityList::AddBotRaid(BotRaids* br, int16 gid) {
	br->SetBotRaidID(gid);
	botraid_list.push_back(br);
}

bool EntityList::RemoveBotRaid(int16 delete_id) {
	list<BotRaids *>::iterator iterator;
	iterator = botraid_list.begin();
	while(iterator != botraid_list.end()) {
		if((*iterator)->GetBotRaidID() == delete_id) {
			botraid_list.remove (*iterator);
			return true;
		}
		iterator++;
	}
	return false;
}

Mob* EntityList::GetMobByBotID(uint32 botID) {
	Mob* Result = 0;

	if(botID > 0) {
		LinkedListIterator<Mob*> iterator(mob_list);
	
		iterator.Reset();

		while(iterator.MoreElements())
		{
			if(iterator.GetData()->IsBot() && iterator.GetData()->CastToBot()->GetBotID() == botID) {
				Result = iterator.GetData();
			}

			iterator.Advance();
		}
	}

	return Result;
}

void EntityList::AddBot(Bot *newBot, bool SendSpawnPacket, bool dontqueue) {
	if(newBot) {
		newBot->SetID(GetFreeID());

		if(SendSpawnPacket) {
			if(dontqueue) {
				// Send immediately
				EQApplicationPacket* outapp = new EQApplicationPacket();
				newBot->CreateSpawnPacket(outapp);
				outapp->priority = 6;
				QueueClients(newBot, outapp, true);
				safe_delete(outapp);
			}
			else {
				// Queue the packet
				NewSpawn_Struct* ns = new NewSpawn_Struct;
				memset(ns, 0, sizeof(NewSpawn_Struct));
				newBot->FillSpawnStruct(ns, newBot);
				AddToSpawnQueue(newBot->GetID(), &ns);
				safe_delete(ns);
			}

			parse->Event(EVENT_SPAWN, 0, 0, 0, newBot);
		}

		bot_list.Insert(newBot);

		if(!bot_list.dont_delete)
			bot_list.dont_delete = true;

		mob_list.Insert(newBot);
	}
}

list<Bot*> EntityList::GetBotsByBotOwnerCharacterID(uint32 botOwnerCharacterID) {
	list<Bot*> Result;

	if(botOwnerCharacterID > 0) {
		LinkedListIterator<Bot*> botItr(bot_list);
		botItr.Reset();
		while(botItr.MoreElements()) {
			if(botItr.GetData() && botItr.GetData()->GetBotOwnerCharacterID() == botOwnerCharacterID)
				Result.push_back(botItr.GetData());
			botItr.Advance();
		}
	}

	return Result;
}

bool EntityList::RemoveBot(int16 entityID) {
	bool Result = false;

	if(entityID > 0) {
		LinkedListIterator<Bot*> iterator(bot_list);
		
		iterator.Reset();
		
		while(iterator.MoreElements())
		{
			if(iterator.GetData()->GetID() == entityID){
				//make sure its proximity is removed
				//RemoveProximity(iterator.GetData()->GetID());
				
				//take it out of the list
				iterator.RemoveCurrent(false);//Already Deleted
				
				//take it out of our limit list
				/*if(npc_limit_list.count(delete_id) == 1)
					npc_limit_list.erase(delete_id);*/
				
				Result = true;

				break;
			}

			iterator.Advance();
		}
	}

	return Result;
}

void EntityList::ShowSpawnWindow(Client* client, int Distance, bool NamedOnly) {

	const char *WindowTitle = "Bot Tracking Window";

	string WindowText;
	int LastCon = -1;
	int CurrentCon = 0;
	
	int32 array_counter = 0;
	
	LinkedListIterator<Mob*> iterator(mob_list);
	iterator.Reset();

	while(iterator.MoreElements())
	{
		if (iterator.GetData() && (iterator.GetData()->DistNoZ(*client)<=Distance))
		{
			if(iterator.GetData()->IsTrackable()) {
				Mob* cur_entity = iterator.GetData();
				int  Extras = (cur_entity->IsBot() || cur_entity->IsPet() || cur_entity->IsFamiliar() || cur_entity->IsClient());
				const char *const MyArray[] = {
					"a_","an_","Innkeep_","Barkeep_",
					"Guard_","Merchant_","Lieutenant_",
					"Banker_","Centaur_","Aviak_","Baker_",
					"Sir_","Armorer_","Deathfist_","Deputy_",
					"Sentry_","Sentinel_","Leatherfoot_",
					"Corporal_","goblin_","Bouncer_","Captain_",
					"orc_","fire_","inferno_","young_","cinder_",
					"flame_","gnomish_","CWG_","sonic_","greater_",
					"ice_","dry_","Priest_","dark-boned_",
					"Tentacle_","Basher_","Dar_","Greenblood_",
					"clockwork_","guide_","rogue_","minotaur_",
					"brownie_","Teir'","dark_","tormented_",
					"mortuary_","lesser_","giant_","infected_",
					"wharf_","Apprentice_","Scout_","Recruit_",
					"Spiritist_","Pit_","Royal_","scalebone_",
					"carrion_","Crusader_","Trooper_","hunter_",
					"decaying_","iksar_","klok_","templar_","lord_",
					"froglok_","war_","large_","charbone_","icebone_",
					"Vicar_","Cavalier_","Heretic_","Reaver_","venomous_",
					"Sheildbearer_","pond_","mountain_","plaguebone_","Brother_",
					"great_","strathbone_","briarweb_","strathbone_","skeletal_",
					"minion_","spectral_","myconid_","spurbone_","sabretooth_",
					"Tin_","Iron_","Erollisi_","Petrifier_","Burynai_",
					"undead_","decayed_","You_","smoldering_","gyrating_",
					"lumpy_","Marshal_","Sheriff_","Chief_","Risen_",
					"lascar_","tribal_","fungi_","Xi_","Legionnaire_",
					"Centurion_","Zun_","Diabo_","Scribe_","Defender_","Capt_",
					"blazing_","Solusek_","imp_","hexbone_","elementalbone_",
					"stone_","lava_","_",""
				};
				unsigned int MyArraySize;
				 for ( MyArraySize = 0; true; MyArraySize++) {   //Find empty string & get size
				   if (!(*(MyArray[MyArraySize]))) break;   //Checks for null char in 1st pos
				};
				if (NamedOnly) {
				   bool ContinueFlag = false;
				   const char *CurEntityName = cur_entity->GetName();  //Call function once
				   for (int Index = 0; Index < MyArraySize; Index++) {
				      if (!strncasecmp(CurEntityName, MyArray[Index], strlen(MyArray[Index])) || (Extras)) {
				         iterator.Advance();
				         ContinueFlag = true;
				         break;   //From Index for
				       };
				   };
				  if (ContinueFlag) continue; //Moved here or would apply to Index for
				};

				CurrentCon = client->GetLevelCon(cur_entity->GetLevel());
				if(CurrentCon != LastCon) {

					if(LastCon != -1)
						WindowText += "</c>";

					LastCon = CurrentCon;

					switch(CurrentCon) {

						case CON_GREEN: {
							WindowText += "<c \"#00FF00\">";
							break;
						}

						case CON_LIGHTBLUE: {
							WindowText += "<c \"#8080FF\">";
							break;
						}
						case CON_BLUE: {
							WindowText += "<c \"#2020FF\">";
							break;
						}

						case CON_YELLOW: {
							WindowText += "<c \"#FFFF00\">";
							break;
						}
						case CON_RED: {
							WindowText += "<c \"#FF0000\">";
							break;
						}
						default: {
							WindowText += "<c \"#FFFFFF\">";
							break;
						}
					}
				}

				WindowText += cur_entity->GetCleanName();
				WindowText += "<br>";

				if(strlen(WindowText.c_str()) > 4000) {
					// Popup window is limited to 4096 characters.
					WindowText += "</c><br><br>List truncated ... too many mobs to display";
					break;
				}
			}
		}

		iterator.Advance();
	}
	WindowText += "</c>";

	client->SendPopupToClient(WindowTitle, WindowText.c_str());

	return; 
}

#endif