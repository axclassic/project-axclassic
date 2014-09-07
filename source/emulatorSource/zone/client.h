/*  EQEMu:  Everquest Server Emulator
	Copyright (C) 2001-2003  EQEMu Development Team (http://eqemulator.net)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; version 2 of the License.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY except by those people which sell it, which
	are required to give you total support for your newly bought product;
	without even the implied warranty of MERCHANTABILITY or FITNESS FOR
	A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/
#ifndef CLIENT_H
#define CLIENT_H
class Client;

#include "../common/timer.h"
#include "../common/ptimer.h"
#include "../common/emu_opcodes.h"
#include "../common/eq_packet_structs.h"
#include "../common/eq_constants.h"
#include "../common/EQStreamIntf.h"
#include "../common/EQPacket.h"
#include "../common/linked_list.h"
#include "../common/extprofile.h"
#include "zonedb.h"
#include "errno.h"
#include "../common/classes.h"
#include "../common/races.h"
#include "../common/deity.h"
#include "mob.h"
#include "npc.h"
#include "zone.h"
#include "AA.h"
#include "../common/seperator.h"
#include "../common/Item.h"
#include "updatemgr.h"
#include "../common/guilds.h"
#include "questmgr.h"
#include <float.h>
#include <set>
#include "../common/item_struct.h"
#include "QGlobals.h"

#define CLIENT_TIMEOUT		90000
#define CLIENT_LD_TIMEOUT	30000 // length of time client stays in zone after LDing
#define TARGETING_RANGE		200	// range for /assist and /target
extern Zone* zone;
extern TaskManager *taskmanager;

class CLIENTPACKET
{
public:
    CLIENTPACKET();
    ~CLIENTPACKET();
    EQApplicationPacket *app;
    bool ack_req;
};

enum {	//Type arguments to the Message* routines.
	//all not explicitly listed are the same grey color
	clientMessageWhite0 = 0,
	clientMessageLoot = 2,	//dark green
	clientMessageTradeskill = 4,	//light blue
	clientMessageTell = 5,		//magenta
	clientMessageWhite = 7,
	clientMessageWhite2 = 10,
	clientMessageLightGrey = 12,
	clientMessageError = 13,	//red
	clientMessageGreen = 14,
	clientMessageYellow = 15,
	clientMessageBlue = 16,
	clientMessageGroup = 18,	//cyan
	clientMessageWhite3 = 20,
};

typedef enum {	//focus types
	focusSpellHaste = 1,
	focusSpellDuration,
	focusRange,
	focusReagentCost,
	focusManaCost,
	focusImprovedHeal,
	focusImprovedDamage,
	focusImprovedDOT,		//i dont know about this...
	focusImprovedCritical,
	focusImprovedUndeadDamage,
	focusPetPower,
	focusResistRate,
	focusSpellHateMod,
} focusType;

#define SPELLBAR_UNLOCK 0x2bc
enum {	//scribing argument to MemorizeSpell
	memSpellScribing = 0,
	memSpellMemorize = 1,
	memSpellForget = 2,
	memSpellSpellbar = 3
};

#define USE_ITEM_SPELL_SLOT 10
#define POTION_BELT_SPELL_SLOT 11
#define DISCIPLINE_SPELL_SLOT 10
#define ABILITY_SPELL_SLOT 9

//Modes for the zoning state of the client.
typedef enum {
	ZoneToSafeCoords,		// Always send ZonePlayerToBind_Struct to client: Succor/Evac
	GMSummon,				// Always send ZonePlayerToBind_Struct to client: Only a GM Summon
	ZoneToBindPoint,		// Always send ZonePlayerToBind_Struct to client: Death Only
	ZoneSolicited,			// Always send ZonePlayerToBind_Struct to client: Portal, Translocate, Evac spells that have a x y z coord in the spell data
	ZoneUnsolicited,
	GateToBindPoint,		// Always send RequestClientZoneChange_Struct to client: Gate spell or Translocate To Bind Point spell
	SummonPC,				// In-zone GMMove() always: Call of the Hero spell or some other type of in zone only summons
	Rewind,					// Lieka:  Summon to /rewind location.
	EvacToSafeCoords
} ZoneMode;

typedef enum {
	MQWarp,
	MQWarpShadowStep,
	MQWarpKnockBack,
	MQWarpLight,
	MQZone,
	MQZoneUnknownDest,
	MQGate,
	MQGhost
} CheatTypes;

#define BIT_Client62		1
#define BIT_Titanium		2
#define BIT_SoF			4
#define BIT_SoD			8
#define BIT_Underfoot		16
#define BIT_HoT			32
#define BIT_SoFAndLater 	0xFFFFFFFC
#define BIT_SoDAndLater		0xFFFFFFF8
#define BIT_UnderfootAndLater	0xFFFFFFF0
#define BIT_AllClients		0xFFFFFFFF

typedef enum {
	EQClientUnknown = 0,
	EQClient62,
	EQClientTitanium,
	EQClientSoF,
	EQClientSoD,
	EQClientUnderfoot,
	EQClientHoT
} EQClientVersion;

enum {
	HideCorpseNone = 0,
	HideCorpseAll = 1,
	HideCorpseAllButGroup = 2,
	HideCorpseLooted = 3,
	HideCorpseNPC = 5
};

struct ClientReward
{
	int32 id;
	int32 amount;
};

class ClientFactory {
public:
	Client *MakeClient(EQStream* ieqs);
};

class Client : public Mob
{
public:
	//pull in opcode mappings:
	#include "client_packet.h"

	Client(EQStreamInterface * ieqs);
    ~Client();

	//abstract virtual function implementations requird by base abstract class
	virtual void Death(Mob* killerMob, sint32 damage, int16 spell_id, SkillType attack_skill);
	virtual void Damage(Mob* from, sint32 damage, int16 spell_id, SkillType attack_skill, bool avoidable = true, sint8 buffslot = -1, bool iBuffTic = false);
	virtual bool Attack(Mob* other, int Hand = 13, bool FromRiposte = false);
	virtual bool HasRaid() { return (GetRaid() ? true : false);  }
	virtual bool HasGroup() { return (GetGroup() ? true : false); }
	virtual Raid* GetRaid() { return entity_list.GetRaidByClient(this); }
	virtual Group* GetGroup() { return entity_list.GetGroupByClient(this); }

//	void	Discipline(ClientDiscipline_Struct* disc_in, Mob* tar);
	void	AI_Init();
	void	AI_Start(int32 iMoveDelay = 0);
	void	AI_Stop();
	void	AI_Process();
	void	AI_SpellCast();
	void	Trader_ShowItems();
	void    Trader_CustomerBrowsing(Client *Customer);
	void	Trader_EndTrader();
	void	Trader_StartTrader();
	int8	WithCustomer(int16 NewCustomer);
	void	KeyRingLoad();
	void	KeyRingAdd(int32 item_id);
	bool	KeyRingCheck(int32 item_id);
    void	KeyRingList();
	virtual bool IsClient() const { return true; }
	virtual void DBAWComplete(int8 workpt_b1, DBAsyncWork* dbaw);
	bool	FinishConnState2(DBAsyncWork* dbaw);
	void	CompleteConnect();
	bool	TryStacking(ItemInst* item, int8 type = ItemPacketTrade, bool try_worn = true, bool try_cursor = true);
	void	SendTraderPacket(Client* trader);
	void	SendBuyerPacket(Client* Buyer);
	GetItems_Struct* GetTraderItems();
	void	SendBazaarWelcome();
	void	DyeArmor(DyeStruct* dye);
	int8	SlotConvert(int8 slot,bool bracer=false);
	void	Message_StringID(int32 type, int32 string_id, int32 distance = 0);
	void	Message_StringID(int32 type, int32 string_id, const char* message,const char* message2=0,const char* message3=0,const char* message4=0,const char* message5=0,const char* message6=0,const char* message7=0,const char* message8=0,const char* message9=0, int32 distance = 0);
	void	SendBazaarResults(int32 trader_id,int32 class_,int32 race,int32 stat,int32 slot,int32 type,char name[64],int32 minprice,int32 maxprice);
	void	SendTraderItem(int32 item_id,int16 quantity);
	int16	FindTraderItem(sint32 SerialNumber,int16 Quantity);
	ItemInst* FindTraderItemBySerialNumber(sint32 SerialNumber);
	void	FindAndNukeTraderItem(sint32 item_id,int16 quantity,Client* customer,int16 traderslot);
	void    NukeTraderItem(int16 slot,sint16 charges,int16 quantity,Client* customer,int16 traderslot, int uniqueid);
	void	ReturnTraderReq(const EQApplicationPacket* app,sint16 traderitemcharges);
	void	TradeRequestFailed(const EQApplicationPacket* app);
	void	BuyTraderItem(TraderBuy_Struct* tbs,Client* trader,const EQApplicationPacket* app);
	void	TraderUpdate(int16 slot_id,int32 trader_id);
	void	FinishTrade(NPC* with); //Angelox2

	void	SendBuyerResults(char *SearchQuery, uint32 SearchID);
	void	ShowBuyLines(const EQApplicationPacket *app);
	void	SellToBuyer(const EQApplicationPacket *app);
	void	ToggleBuyerMode(bool TurnOn);
	void	UpdateBuyLine(const EQApplicationPacket *app);
	void	BuyerItemSearch(const EQApplicationPacket *app);
	void	SetBuyerWelcomeMessage(const char* WelcomeMessage) { BuyerWelcomeMessage = WelcomeMessage; }
	const 	char* GetBuyerWelcomeMessage() { return BuyerWelcomeMessage.c_str(); }

	void	FillSpawnStruct(NewSpawn_Struct* ns, Mob* ForWho);
	virtual bool Process();
	void	LogMerchant(Client* player, Mob* merchant, int32 quantity, int32 price, const Item_Struct* item, bool buying);
	void	SendPacketQueue(bool Block = true);
	void	QueuePacket(const EQApplicationPacket* app, bool ack_req = true, CLIENT_CONN_STATUS = CLIENT_CONNECTINGALL, eqFilterType filter=FilterNone);
	void	FastQueuePacket(EQApplicationPacket** app, bool ack_req = true, CLIENT_CONN_STATUS = CLIENT_CONNECTINGALL);
	void	ChannelMessageReceived(int8 chan_num, int8 language, int8 lang_skill, const char* message, const char* targetname=NULL);
	void	ChannelMessageSend(const char* from, const char* to, int8 chan_num, int8 language, const char* message, ...);
	void	ChannelMessageSend(const char* from, const char* to, int8 chan_num, int8 language, int8 lang_skill, const char* message, ...);
	void	Message(int32 type, const char* message, ...);
	void    QuestJournalledMessage(const char *npcname, const char* message);
	void	VoiceMacroReceived(int32 Type, char *Target, int32 MacroNumber);
	void	SendSound();
	void	CheckLDoNHail(Mob *target);

	EQApplicationPacket*	ReturnItemPacket(sint16 slot_id, const ItemInst* inst, ItemPacketType packet_type);

	bool			GetRevoked() const { return revoked; }
	void			SetRevoked(bool rev) { revoked = rev; }
	inline int32	GetIP()			const { return ip; }
	inline bool		GetHideMe()			const { return gmhideme; }
	void			SetHideMe(bool hm);
	inline int16	GetPort()		const { return port; }
	bool			IsDead() const { return(dead); }
	inline bool		IsLFP() { return LFP; }
	void			UpdateLFP();

	virtual bool	Save() { return Save(0); }
			bool	Save(int8 iCommitNow); // 0 = delayed, 1=async now, 2=sync now
			void	SaveBackup();

	inline bool ClientDataLoaded() const { return client_data_loaded; }
	inline bool	Connected()		const { return (client_state == CLIENT_CONNECTED); }
	inline bool	InZone()		const { return (client_state == CLIENT_CONNECTED || client_state == CLIENT_LINKDEAD); }
	inline void	Kick()			{ client_state = CLIENT_KICKED; }
	inline void	Disconnect()	{ eqs->Close(); client_state = DISCONNECTED; }
	inline bool IsLD()			const { return (bool) (client_state == CLIENT_LINKDEAD); }
	void	WorldKick();
	inline int8	GetAnon()		const {  return m_pp.anon; }
	inline PlayerProfile_Struct& GetPP()	{ return m_pp; }
	inline ExtendedProfile_Struct& GetEPP()	{ return m_epp; }
	inline Inventory& GetInv()				{ return m_inv; }
	inline const Inventory& GetInv() const	{ return m_inv; }
	bool	CheckAccess(sint16 iDBLevel, sint16 iDefaultLevel);

	void	CheckQuests(const char* zonename, const char* message, uint32 npc_id, uint32 item_id, Mob* other);
	void	LogLoot(Client* player,Corpse* corpse,const Item_Struct* item);
	bool	AutoAttackEnabled() const { return auto_attack; }
	bool	AutoFireEnabled() const { return auto_fire; }
	void	MakeCorpse(int32 exploss);

	bool	ChangeFirstName(const char* in_firstname,const char* gmname);

	void	Duck();
	void	Stand();

	virtual void	SetMaxHP();
	sint32	LevelRegen();
	void	HPTick();
	void	SetGM(bool toggle);
	void	SetPVP(bool toggle);

	inline bool	GetPVP()	const { return zone->GetZoneID() == 77 ? true : m_pp.pvp; }
	inline bool	GetGM()		const { return (bool) m_pp.gm; }

	inline void	SetBaseClass(uint32 i) { m_pp.class_=i; }
	inline void	SetBaseRace(uint32 i) { m_pp.race=i; }
	inline void	SetBaseGender(uint32 i) { m_pp.gender=i; }
	inline  void SetDeity(uint32 i) {m_pp.deity=i;}

	inline int8		GetLevel2()			const { return m_pp.level2; }
	inline int16	GetBaseRace()		const { return m_pp.race; }
	inline int16	GetBaseClass()		const { return m_pp.class_; }
	inline int8		GetBaseGender()		const { return m_pp.gender; }
	inline int8		GetBaseFace()		const { return m_pp.face; }
	inline int8		GetBaseHairColor()	const { return m_pp.haircolor; }
	inline int8		GetBaseBeardColor()	const { return m_pp.beardcolor; }
	inline int8		GetBaseEyeColor()	const { return m_pp.eyecolor1; }
	inline int8		GetBaseHairStyle()	const { return m_pp.hairstyle; }
	inline int8		GetBaseBeard()		const { return m_pp.beard; }
	inline int8		GetBaseHeritage()	const { return m_pp.drakkin_heritage; }
	inline int8		GetBaseTattoo()		const { return m_pp.drakkin_tattoo; }
	inline int8		GetBaseDetails()	const { return m_pp.drakkin_details; }
	sint32			CalcMaxMana();
	sint32			CalcBaseMana();
	const sint32&	SetMana(sint32 amount);
	sint32 			CalcManaRegenCap();

	void	ServerFilter(SetServerFilter_Struct* filter);
	void	BulkSendTraderInventory(int32 char_id);
	void    SendSingleTraderItem(int32 char_id, int uniqueid);
	void	BulkSendMerchantInventory(int merchant_id, int npcid);

	inline int8	GetLanguageSkill(int16 n)	const { return m_pp.languages[n]; }

	void	SendPickPocketResponse(Mob *from, uint32 amt, int type, const Item_Struct* item = NULL);

	inline const char*	GetLastName() const	{ return lastname; }
	inline int32		GetLDoNPoints() { return 0; }

	inline float ProximityX() const { return(proximity_x); }
	inline float ProximityY() const { return(proximity_y); }
	inline float ProximityZ() const { return(proximity_z); }
	inline void ClearAllProximities() { entity_list.ProcessMove(this, FLT_MAX, FLT_MAX, FLT_MAX); proximity_x = FLT_MAX; proximity_y = FLT_MAX; proximity_z = FLT_MAX; }

	/*
		Begin client modifiers
	*/

	virtual void CalcBonuses();
	//these are all precalculated now
	inline virtual sint16	GetAC()		const { return AC; }
	inline virtual sint16 GetATK() const { return ATK + itembonuses.ATK + spellbonuses.ATK + ((GetSTR() + GetSkill(OFFENSE)) * 9 / 10); }
	inline virtual sint16 GetATKBonus() const { return itembonuses.ATK + spellbonuses.ATK; }
	inline virtual int	GetHaste() const { return Haste; }
	int GetRawACNoShield(int &shield_ac) const;

	inline virtual sint16	GetSTR()	const { return STR; }
	inline virtual sint16	GetSTA()	const { return STA; }
	inline virtual sint16	GetDEX()	const { return DEX; }
	inline virtual sint16	GetAGI()	const { return AGI; }
	inline virtual sint16	GetINT()	const { return INT; }
	inline virtual sint16	GetWIS()	const { return WIS; }
	inline virtual sint16	GetCHA()	const { return CHA; }
	inline virtual sint16	GetMR() 	const { return MR; }
	inline virtual sint16	GetFR()		const { return FR; }
	inline virtual sint16	GetDR()		const { return DR; }
	inline virtual sint16	GetPR()		const { return PR; }
	inline virtual sint16	GetCR() 	const { return CR; }
	inline virtual sint16	GetCorrup()	const { return Corrup; }

	sint16	GetMaxStat() const;
	sint16	GetMaxResist() const;
	sint16  GetMaxSTR() const;
    sint16  GetMaxSTA() const;
    sint16  GetMaxDEX() const;
    sint16  GetMaxAGI() const;
    sint16  GetMaxINT() const;
    sint16  GetMaxWIS() const;
    sint16  GetMaxCHA() const;
	sint16  GetMaxMR() const;
	sint16  GetMaxPR() const;
	sint16  GetMaxDR() const;
	sint16  GetMaxCR() const;
	sint16  GetMaxFR() const;
	sint16  GetMaxCorrup() const;
	inline int8	GetBaseSTR()	const { return m_pp.STR; }
	inline int8	GetBaseSTA()	const { return m_pp.STA; }
	inline int8	GetBaseCHA()	const { return m_pp.CHA; }
	inline int8	GetBaseDEX()	const { return m_pp.DEX; }
	inline int8	GetBaseINT()	const { return m_pp.INT; }
	inline int8	GetBaseAGI()	const { return m_pp.AGI; }
	inline int8	GetBaseWIS()	const { return m_pp.WIS; }
	inline int8	GetBaseCorrup()	const { return 0; } // Need to set this in the pp at some point
 
	inline virtual sint16	GetHeroicSTR()	const { return itembonuses.HeroicSTR; }
	inline virtual sint16	GetHeroicSTA()	const { return itembonuses.HeroicSTA; }
	inline virtual sint16	GetHeroicDEX()	const { return itembonuses.HeroicDEX; }
	inline virtual sint16	GetHeroicAGI()	const { return itembonuses.HeroicAGI; }
	inline virtual sint16	GetHeroicINT()	const { return itembonuses.HeroicINT; }
	inline virtual sint16	GetHeroicWIS()	const { return itembonuses.HeroicWIS; }
	inline virtual sint16	GetHeroicCHA()	const { return itembonuses.HeroicCHA; }
	inline virtual sint16	GetHeroicMR()	const { return itembonuses.HeroicMR; }
	inline virtual sint16	GetHeroicFR()	const { return itembonuses.HeroicFR; }
	inline virtual sint16	GetHeroicDR()	const { return itembonuses.HeroicDR; }
	inline virtual sint16	GetHeroicPR()	const { return itembonuses.HeroicPR; }
	inline virtual sint16	GetHeroicCR()	const { return itembonuses.HeroicCR; }
	inline virtual sint16	GetHeroicCorrup()	const { return itembonuses.HeroicCorrup; }
	//Underfoot
	float GetActSpellRange(int16 spell_id, float range);
	sint32 GetActSpellDamage(int16 spell_id, sint32 value);
	sint32 GetActSpellHealing(int16 spell_id, sint32 value);
	sint32 GetActSpellCost(int16 spell_id, sint32);
	sint32 GetActSpellDuration(int16 spell_id, sint32);
	sint32 GetActSpellCasttime(int16 spell_id, sint32);
	sint32 GetDotFocus(int16 spell_id, sint32 value);
	virtual bool CheckFizzle(int16 spell_id);
	virtual int GetCurrentBuffSlots() const;
	virtual int GetCurrentSongSlots() const;
	virtual int GetCurrentDiscSlots() const { return 1; }
	virtual int GetMaxBuffSlots() const { return 25; }
	virtual int GetMaxSongSlots() const { return 12; }
	virtual int GetMaxDiscSlots() const { return 1; }
	virtual int GetMaxTotalSlots() const { return 38; }
	virtual void InitializeBuffSlots();
	virtual void UninitializeBuffSlots();

	inline const sint32	GetBaseHP() const { return base_hp; }

	uint32 GetWeight() const { return(weight); }
	inline void RecalcWeight() { weight = CalcCurrentWeight(); }
	uint32 CalcCurrentWeight();
	inline uint32	GetCopper()		const { return m_pp.copper; }
	inline uint32	GetSilver()		const { return m_pp.silver; }
	inline uint32	GetGold()		const { return m_pp.gold; }
	inline uint32	GetPlatinum()	const { return m_pp.platinum; }


	/*Endurance and such*/
	void	CalcMaxEndurance();	//This calculates the maximum endurance we can have
	sint32	CalcBaseEndurance();	//Calculates Base End
	sint32	CalcEnduranceRegen();	//Calculates endurance regen used in DoEnduranceRegen()
	sint32	GetEndurance()	const {return cur_end;}	//This gets our current endurance
	sint32	GetMaxEndurance() const {return max_end;}	//This gets our endurance from the last CalcMaxEndurance() call
	sint32	CalcEnduranceRegenCap();
	sint32	CalcHPRegenCap();
	inline uint8 GetEndurancePercent() { return (uint8)((float)cur_end / (float)max_end * 100.0f); }
	void SetEndurance(sint32 newEnd);	//This sets the current endurance to the new value
	void DoEnduranceRegen();	//This Regenerates endurance
	void DoEnduranceUpkeep();	//does the endurance upkeep

	//This calculates total Attack Rating to match very close to what the client should show
	uint16 GetTotalATK();
	//This gets the skill value of the item type equiped in the Primary Slot
	uint16 GetPrimarySkillValue();

    bool Flurry();
    bool Rampage();

	inline uint32	GetEXP()		const { return m_pp.exp; }


	bool	UpdateLDoNPoints(sint32 points, int32 theme);
	void	SetPVPPoints(int32 Points) { m_pp.PVPCurrentPoints = Points; }
	int32	GetPVPPoints() { return m_pp.PVPCurrentPoints; }
	uint32	GetRadiantCrystals() { return m_pp.currentRadCrystals; }
	void	SetRadiantCrystals(uint32 Crystals) { m_pp.currentRadCrystals = Crystals; }
	uint32	GetEbonCrystals() { return m_pp.currentEbonCrystals; }
	void	SetEbonCrystals(uint32 Crystals) { m_pp.currentEbonCrystals = Crystals; }
	void	SendCrystalCounts();
	void	AddEXP(uint32 in_add_exp, int8 conlevel = 0xFF, bool resexp = false);
	void	SetEXP(uint32 set_exp, uint32 set_aaxp, bool resexp=false);
	void	SetLeadershipEXP(uint32 group_exp, uint32 raid_exp);
	void	AddLeadershipEXP(uint32 group_exp, uint32 raid_exp);
	void	SendLeadershipEXPUpdate();
	bool	IsLeadershipEXPOn();
	inline	int GetLeadershipAA(int AAID) { return  m_pp.leader_abilities.ranks[AAID]; }
	int	GroupLeadershipAAHealthEnhancement();
	int	GroupLeadershipAAManaEnhancement();
	int	GroupLeadershipAAHealthRegeneration();
	int	GroupLeadershipAAOffenseEnhancement();
	void	InspectBuffs(Client* Inspector, int Rank);
	uint32  GetRaidPoints() { return(m_pp.raid_leadership_points); }
	uint32  GetGroupPoints() { return(m_pp.group_leadership_points); }
	uint32  GetRaidEXP() { return(m_pp.raid_leadership_exp); }
	uint32  GetGroupEXP() { return(m_pp.group_leadership_exp); }
	virtual void SetLevel(uint8 set_level, bool command = false);
	void	GoToBind(uint8 bindnum = 0);
	void	GoToSafeCoords(uint16 zone_id, uint16 instance_id);
	void	Gate();
	void	SetBindPoint(int to_zone = -1, float new_x = 0.0f, float new_y = 0.0f, float new_z = 0.0f);
	void	SetStartZone(uint32 zoneid, float x = 0.0f, float y =0.0f, float z = 0.0f);
	uint32	GetStartZone(void);
	inline const float	GetBindX() const		{ return m_pp.binds[0].x; }
	inline const float	GetBindY() const		{ return m_pp.binds[0].y; }
	inline const float	GetBindZ() const		{ return m_pp.binds[0].z; }
	inline const float	GetBindHeading() const	{ return m_pp.binds[0].heading; }
	uint32	GetBindZoneID() const	{ return m_pp.binds[0].zoneId; }
	void	MovePC(const char* zonename, float x, float y, float z, float heading, int8 ignorerestrictions = 0, ZoneMode zm = ZoneSolicited);
	void	MovePC(int32 zoneID, float x, float y, float z, float heading, int8 ignorerestrictions = 0, ZoneMode zm = ZoneSolicited);
	void	MovePC(float x, float y, float z, float heading, int8 ignorerestrictions = 0, ZoneMode zm = ZoneSolicited);
	void	MovePC(int32 zoneID, int32 instanceID, float x, float y, float z, float heading, int8 ignorerestrictions = 0, ZoneMode zm = ZoneSolicited);
	void	WhoAll();
	bool	CheckLoreConflict(const Item_Struct* item);
	void	ChangeLastName(const char* in_lastname);
	void	GetGroupAAs(GroupLeadershipAA_Struct *into) const;
	void	ClearGroupAAs();
	void	SacrificeConfirm(Client* caster);
	void	Sacrifice(Client* caster);
	void	GoToDeath();

	FACTION_VALUE	GetReverseFactionCon(Mob* iOther);
    FACTION_VALUE   GetFactionLevel(int32 char_id, int32 npc_id, int32 p_race, int32 p_class, int32 p_deity, sint32 pFaction, Mob* tnpc);
	sint32	GetCharacterFactionLevel(sint32 faction_id);
	sint32  GetModCharacterFactionLevel(sint32 faction_id);

	void	SetFactionLevel(int32 char_id, int32 npc_id, int8 char_class, int8 char_race, int8 char_deity);
	void    SetFactionLevel2(int32 char_id, sint32 faction_id, int8 char_class, int8 char_race, int8 char_deity, sint32 value);
	sint16	GetRawItemAC();
	int16	GetCombinedAC_TEST();

	inline int32	LSAccountID()	const { return lsaccountid; }
	inline int32	GetWID()		const { return WID; }
	inline void		SetWID(int32 iWID) { WID = iWID; }
	inline int32	AccountID()		const { return account_id; }
	inline const char* AccountName()const { return account_name; }
	inline sint16	Admin()			const { return admin; }
	inline int32	CharacterID()	const { return character_id; }
	void	UpdateAdmin(bool iFromDB = true);
	void	UpdateWho(int8 remove = 0);
	bool	GMHideMe(Client* client = 0);

	inline bool IsInAGuild() const { return(guild_id != GUILD_NONE && guild_id != 0); }
	inline bool IsInGuild(uint32 in_gid) const { return(in_gid == guild_id && IsInAGuild()); }
	inline int32	GuildID() const { return guild_id; }
	inline int8	GuildRank()		const { return guildrank; }
	void	SendGuildMOTD();
	void	SendGuildSpawnAppearance();
	void	SendGuildMembers();
    void	SendGuildList();
	void	SendGuildJoin(GuildJoin_Struct* gj);
	void	RefreshGuildInfo();


	void	SendManaUpdatePacket();
	void	SendManaUpdate();
	void	SendEnduranceUpdate();
	int8	GetFace()		const { return m_pp.face; }
	int32	PendingGuildInvite; // Used for /guildinvite
	void	WhoAll(Who_All_Struct* whom);
    void	FriendsWho(char *FriendsString);

	void	Stun(int duration);
	void	UnStun();
	void	ReadBook(BookRequest_Struct *book);
	void	SendClientMoneyUpdate(int8 type,int32 amount);
	void	SendMoneyUpdate();
	bool	TakeMoneyFromPP(uint64 copper);
	void	AddMoneyToPP(uint64 copper,bool updateclient);
	void	AddMoneyToPP(uint32 copper, uint32 silver, uint32 gold,uint32 platinum,bool updateclient);
	bool	HasMoney(uint64 copper);

	void	FinishTrade(Client* with); //Angelox2
	bool	TGB() const { return tgb; }

#ifdef EQBOTS

	void	BotTradeSwapItem(NPC* bot, sint16 lootSlot, const ItemInst* inst, const ItemInst* inst_swap, uint32 equipableSlots, std::string* errorMessage, bool swap = true);
	static void	BotTradeAddItem(const ItemInst* inst, sint16 maxCharges, uint32 equipableSlots, int16 lootSlot, std::string* errorMessage, NPC* bot, bool addToDb = true);
	void	GetSpawnedBots(bool createList);
	std::list<int32> spawned_bots;

#endif //EQBOTS

	void	OnDisconnect(bool hard_disconnect);


	int16	GetSkillPoints() {return m_pp.points;}
	void	SetSkillPoints(int inp) {m_pp.points = inp;}

	void	IncreaseSkill(int skill_id, int value = 1) { if (skill_id <= HIGHEST_SKILL) { m_pp.skills[skill_id] += value; } }
	void	IncreaseLanguageSkill(int skill_id, int value = 1);
	virtual uint16 GetSkill(SkillType skill_id) const { if (skill_id <= HIGHEST_SKILL) { return((itembonuses.skillmod[skill_id] > 0)? m_pp.skills[skill_id]*(100 + itembonuses.skillmod[skill_id])/100 : m_pp.skills[skill_id]); } return 0; }
	uint32	GetRawSkill(SkillType skill_id) const { if (skill_id <= HIGHEST_SKILL) { return(m_pp.skills[skill_id]); } return 0; }
	bool	HasSkill(SkillType skill_id) const;
	bool	CanHaveSkill(SkillType skill_id) const;
	void	SetSkill(SkillType skill_num, int16 value); // socket 12-29-01
	void	AddSkill(SkillType skillid, int16 value);
	void	CheckSpecializeIncrease(int16 spell_id);
	void	CheckSongSkillIncrease(int16 spell_id);
	bool	CheckIncreaseSkill(SkillType skillid, Mob *against_who, int chancemodi = 0);
	void	CheckLanguageSkillIncrease(int8 langid, int8 TeacherSkill);
	void    SetLanguageSkill(int langid, int value);
	void	SetHoTT(int32 mobid);
	void	ShowSkillsWindow();

	int16	MaxSkill(SkillType skillid, int16 class_, int16 level) const;
    inline	int16	MaxSkill(SkillType skillid) const { return MaxSkill(skillid, GetClass(), GetLevel()); }
    int8	SkillTrainLevel(SkillType skillid, int16 class_);

	void TradeskillSearchResults(const char *query, unsigned long qlen, unsigned long objtype, unsigned long someid);
	void SendTradeskillDetails(uint32 recipe_id);
	bool TradeskillExecute(DBTradeskillRecipe_Struct *spec);
	void CheckIncreaseTradeskill(sint16 bonusstat, sint16 stat_modifier, float skillup_modifier, uint16 success_modifier, SkillType tradeskill);

	int	pendingrezzexp;
	void	GMKill();
	inline bool	IsMedding()	const {return medding;}
	inline int16	GetDuelTarget() const { return duel_target; }
	inline bool	IsDueling() const { return duelaccepted; }
	inline void	SetDuelTarget(int16 set_id) { duel_target=set_id; }
	inline void	SetDueling(bool duel) { duelaccepted = duel; }
	// use this one instead
	void MemSpell(int16 spell_id, int slot, bool update_client = true);
	void UnmemSpell(int slot, bool update_client = true);
	void UnmemSpellAll(bool update_client = true);
	void ScribeSpell(int16 spell_id, int slot, bool update_client = true);
	void UnscribeSpell(int slot, bool update_client = true);
	void UnscribeSpellAll(bool update_client = true);
	bool SpellGlobalCheck(int16 Spell_ID, int16 Char_ID);

	inline bool	IsSitting() const {return (playeraction == 1);}
	inline bool	IsBecomeNPC() const { return npcflag; }
	inline int8	GetBecomeNPCLevel() const { return npclevel; }
	inline void	SetBecomeNPC(bool flag) { npcflag = flag; }
	inline void	SetBecomeNPCLevel(int8 level) { npclevel = level; }
	bool	LootToStack(uint32 itemid);
	void	SetFeigned(bool in_feigned);
	// EverHood 6/16/06
	/// this cures timing issues cuz dead animation isn't done but server side feigning is?
	inline bool    GetFeigned()	const { return(feigned); }
	EQStreamInterface* Connection() { return eqs; }
#ifdef PACKET_PROFILER
	void DumpPacketProfile() { if(eqs) eqs->DumpPacketProfile(); }
#endif
	int32 GetEquipment(int8 material_slot) const;	// returns item id
	uint32 GetEquipmentColor(int8 material_slot) const;

	inline bool AutoSplitEnabled() { return(m_pp.autosplit); }

	void SummonHorse(int16 spell_id);
	void SetHorseId(int16 horseid_in);
	int16 GetHorseId() const { return horseId; }

	bool BindWound(Mob* bindmob, bool start, bool fail = false);
	void SetTradeskillObject(Object* object) { m_tradeskill_object = object; }
	Object* GetTradeskillObject() { return m_tradeskill_object; }
	void	SendTributes();
	void	SendGuildTributes();
	void	DoTributeUpdate();
	void	SendTributeDetails(int32 client_id, uint32 tribute_id);
	sint32	TributeItem(int32 slot, int32 quantity);
	sint32	TributeMoney(int32 platinum);
	void	AddTributePoints(sint32 ammount);
	void	ChangeTributeSettings(TributeInfo_Struct *t);
	void	SendTributeTimer();
	void	ToggleTribute(bool enabled);
	void	SendPathPacket(vector<FindPerson_Point> &path);

	inline PTimerList &GetPTimers() { return(p_timers); }

	//AA Methods
	void  SendAAList();
	void  ResetAA();
	void  SendAA(int32 id, int seq=1);
	void  SendPreviousAA(int32 id, int seq=1);
	void  BuyAA(AA_Action* action);
	// solar: this function is used by some AA stuff
	void MemorizeSpell(int32 slot,int32 spellid,int32 scribing);
	void	SetAATitle(const char *Title);
	void	SetTitleSuffix(const char *txt);
	inline int32	GetMaxAAXP(void) const { return max_AAXP; }
	inline uint32  GetAAXP()   const { return m_pp.expAA; }
	void SendAAStats();
	void SendAATable();
	void SendAATimers();
	int  GetAATimerID(aaID activate);
	int  CalcAAReuseTimer(const AA_DBAction *caa);
	void ActivateAA(aaID activate);
	void SendAATimer(int32 ability, int32 begin, int32 end);
	void EnableAAEffect(aaEffectType type, int32 duration = 0);
	void DisableAAEffect(aaEffectType type);
	bool CheckAAEffect(aaEffectType type);
	void HandleAAAction(aaID activate);
	int32 GetAA(int32 aa_id) const;
	bool SetAA(int32 aa_id, int32 new_value);
	inline uint32 GetAAPointsSpent() { return m_pp.aapoints_spent; }

	sint16 acmod();

	// Item methods
	uint32	NukeItem(uint32 itemnum);
	void	SetTint(sint16 slot_id, uint32 color);
	void	SetTint(sint16 slot_id, Color_Struct& color);
	void	SetMaterial(sint16 slot_id, uint32 item_id);
	void	Undye();
	uint32	GetItemIDAt(sint16 slot_id);
	uint32	GetAugmentIDAt(sint16 slot_id, uint8 augslot);
	bool	PutItemInInventory(sint16 slot_id, const ItemInst& inst, bool client_update = false);
	bool	PushItemOnCursor(const ItemInst& inst, bool client_update = false);
	void	DeleteItemInInventory(sint16 slot_id, sint8 quantity = 0, bool client_update = false);
	bool	SwapItem(MoveItem_Struct* move_in);
	void	PutLootInInventory(sint16 slot_id, const ItemInst &inst, ServerLootItem_Struct** bag_item_data = 0);
	bool	AutoPutLootInInventory(ItemInst& inst, bool try_worn = false, bool try_cursor = true, ServerLootItem_Struct** bag_item_data = 0);
	void	SummonItem(uint32 item_id, sint8 charges = 0, uint32 aug1=0, uint32 aug2=0, uint32 aug3=0, uint32 aug4=0, uint32 aug5=0);
	void	SetStats(int8 type,sint16 set_val);
	void	IncStats(int8 type,sint16 increase_val);
	void	DropItem(sint16 slot_id);
	bool	MakeItemLink(char* &ret_link, const ItemInst* inst);
	int		GetItemLinkHash(const ItemInst* inst);
	void	SendItemLink(const ItemInst* inst, bool sendtoall=false);
	void	SendLootItemInPacket(const ItemInst* inst, sint16 slot_id);
	void	SendItemPacket(sint16 slot_id, const ItemInst* inst, ItemPacketType packet_type);
	bool	IsValidSlot(uint32 slot);
	bool    IsBankSlot(uint32 slot);

	inline	bool IsTrader() const { return(Trader); }
	inline	bool IsBuyer() const { return(Buyer); }
	eqFilterMode	GetFilter(eqFilterType filter_id) const { return ClientFilters[filter_id]; }
	void	SetFilter(eqFilterType filter_id, eqFilterMode value) { ClientFilters[filter_id]=value; }

	void	BreakInvis();
	void	LeaveGroup();

	bool	Hungry() const {if (GetGM()) return false; return m_pp.hunger_level <= 3000;}
	bool	Thirsty() const {if (GetGM()) return false; return m_pp.thirst_level <= 3000;}

	bool	CheckTradeLoreConflict(Client* other);
	void	LinkDead();
	void	Insight(int32 t_id);
    bool	CheckDoubleAttack(bool tripleAttack = false);
	
	//remove charges/multiple objects from inventory:
	//bool	DecreaseByType(int32 type, int8 amt);
	bool	DecreaseByID(int32 type, int8 amt);
	int8	SlotConvert2(int8 slot);	//Maybe not needed.
	void	Escape(); //AA Escape
	void    RemoveNoRent();
	virtual void	RangedAttack(Mob* other);
	virtual void	ThrowingAttack(Mob* other);
	void	DoClassAttacks(Mob *ca_target);

	void	SetZoneFlag(uint32 zone_id);
	void	ClearZoneFlag(uint32 zone_id);
	bool	HasZoneFlag(uint32 zone_id) const;
	void	SendZoneFlagInfo(Client *to) const;
	void	LoadZoneFlags();

	void	ChangeSQLLog(const char *file);
	void	LogSQL(const char *fmt, ...);
	bool	CanFish();
	void	GoFish();
	void	ForageItem();
	//Calculate vendor price modifier based on CHA: (reverse==selling)
	float	CalcPriceMod(Mob* other = 0, bool reverse = false);
	void	ResetTrade();
	void	DropInst(const ItemInst* inst);
	bool	TrainDiscipline(int32 itemid);
	void	SendDisciplineUpdate();
	bool	UseDiscipline(int32 spell_id, int32 target);

   	bool   CheckTitle(int titleset);
   	void   EnableTitle(int titleset);
   	void   RemoveTitle(int titleset);

#ifdef PACKET_UPDATE_MANAGER
	inline UpdateManager *GetUpdateManager() { return(&update_manager); }
#endif
	void	EnteringMessages(Client* client);
	void	SendRules(Client* client);
	std::list<std::string> consent_list;

	//Anti-Cheat Stuff
	int32 m_TimeSinceLastPositionCheck;
	float m_DistanceSinceLastPositionCheck;
	bool m_CheatDetectMoved;
	void SetShadowStepExemption(bool v);
	void SetKnockBackExemption(bool v);
	void SetPortExemption(bool v);
	void SetSenseExemption(bool v) { m_SenseExemption = v; }
	const bool IsShadowStepExempted() const { return m_ShadowStepExemption; }
	const bool IsKnockBackExempted() const { return m_KnockBackExemption; }
	const bool IsPortExempted() const { return m_PortExemption; }
	const bool IsSenseExempted() const { return m_SenseExemption; }
	const bool GetGMSpeed() const { return (gmspeed > 0); }
	void CheatDetected(CheatTypes CheatType, float x, float y, float z);
	const bool IsMQExemptedArea(int32 zoneID, float x, float y, float z) const;
	bool CanUseReport;

	//This is used to later set the buff duration of the spell, in slot to duration.
	//Doesn't appear to work directly after the client recieves an action packet.
	void SendBuffDurationPacket(int16 spell_id, int duration, int inlevel);
	void	ProcessInspectRequest(Client* requestee, Client* requester);
	bool	ClientFinishedLoading() { return (conn_state == ClientConnectFinished); }
	int		FindSpellBookSlotBySpellID(int16 spellid);
	int		GetNextAvailableSpellBookSlot(int starting_slot = 0);
	inline int32 GetSpellByBookSlot(int book_slot) { return m_pp.spell_book[book_slot]; }
	inline bool HasSpellScribed(int spellid) { return (FindSpellBookSlotBySpellID(spellid) != -1 ? true : false); }
	int16	GetMaxSkillAfterSpecializationRules(SkillType skillid, int16 maxSkill);
	void SendPopupToClient(const char *Title, const char *Text, int32 PopupID = 0, int32 Buttons = 0, int32 Duration = 0);
	bool	PendingTranslocate;
	time_t	TranslocateTime;
 	bool	PendingSacrifice;
 	string	SacrificeCaster;
 	struct	Translocate_Struct PendingTranslocateData;
 	void 	SendOPTranslocateConfirm(Mob *Caster, int16 SpellID);

	//      Task System Methods
	void	LoadClientTaskState();
	void	RemoveClientTaskState();
	void 	SendTaskActivityComplete(int TaskID, int ActivityID, int TaskIndex, int TaskIncomplete=1);
	void 	SendTaskFailed(int TaskID, int TaskIndex);
	void 	SendTaskComplete(int TaskIndex);

	inline void CancelTask(int TaskIndex) { if(taskstate) taskstate->CancelTask(this, TaskIndex); }

	inline bool SaveTaskState()
		    { return (taskmanager ? taskmanager->SaveClientState(this, taskstate) : false); }

	inline bool IsTaskStateLoaded() { return taskstate != NULL; }

	inline bool IsTaskActive(int TaskID)
		    { return (taskstate ? taskstate->IsTaskActive(TaskID) : false); }

	inline bool IsTaskActivityActive(int TaskID, int ActivityID)
	            { return (taskstate ? taskstate->IsTaskActivityActive(TaskID, ActivityID) : false); }

	inline ActivityState GetTaskActivityState(int index, int ActivityID)
	      		     { return (taskstate ? taskstate->GetTaskActivityState(index, ActivityID) : ActivityHidden); }

	inline void UpdateTaskActivity(int TaskID, int ActivityID, int Count)
		    { if(taskstate) taskstate->UpdateTaskActivity(this, TaskID, ActivityID, Count); }

	inline void UpdateTasksOnKill(int NPCTypeID)
	            { if(taskstate) taskstate->UpdateTasksOnKill(this, NPCTypeID); }

	inline void UpdateTasksForItem(ActivityType Type, int ItemID, int Count=1)
	            { if(taskstate) taskstate->UpdateTasksForItem(this, Type, ItemID, Count); }

	inline void UpdateTasksOnExplore(int ExploreID)
	            { if(taskstate) taskstate->UpdateTasksOnExplore(this, ExploreID); }

	inline bool UpdateTasksOnSpeakWith(int NPCTypeID)
	            { if(taskstate) return taskstate->UpdateTasksOnSpeakWith(this, NPCTypeID); else return false; }

	inline bool UpdateTasksOnDeliver(int32 *Items, int Cash, int NPCTypeID)
	            { if(taskstate) return taskstate->UpdateTasksOnDeliver(this, Items, Cash, NPCTypeID); else return false; }

	inline void TaskSetSelector(Mob *mob, int TaskSetID)
	            { if(taskmanager) taskmanager->TaskSetSelector(this, taskstate, mob, TaskSetID); }

	inline void EnableTask(int TaskCount, int *TaskList)
	            { if(taskstate) taskstate->EnableTask(CharacterID(), TaskCount, TaskList); }

	inline void DisableTask(int TaskCount, int *TaskList)
	            { if(taskstate) taskstate->DisableTask(CharacterID(), TaskCount, TaskList); }

	inline bool IsTaskEnabled(int TaskID)
	            { return (taskstate ? taskstate->IsTaskEnabled(TaskID) : false); }

	inline void ProcessTaskProximities(float X, float Y, float Z)
	            { if(taskstate) taskstate->ProcessTaskProximities(this, X, Y, Z); }

	inline void AssignTask(int TaskID, int NPCID)
	            { if(taskstate) taskstate->AcceptNewTask(this, TaskID, NPCID); }

	inline int ActiveSpeakTask(int NPCID)
	            { if(taskstate) return taskstate->ActiveSpeakTask(NPCID); else return 0; }

	inline int ActiveSpeakActivity(int NPCID, int TaskID)
	            { if(taskstate) return taskstate->ActiveSpeakActivity(NPCID, TaskID); else return 0; }

	inline void FailTask(int TaskID)
	            { if(taskstate) taskstate->FailTask(this, TaskID); }

	inline int TaskTimeLeft(int TaskID)
	            { return (taskstate ? taskstate->TaskTimeLeft(TaskID) : 0); }

	inline int EnabledTaskCount(int TaskSetID)
	            { return (taskstate ? taskstate->EnabledTaskCount(TaskSetID) : -1); }

	inline int IsTaskCompleted(int TaskID)
	            { return (taskstate ? taskstate->IsTaskCompleted(TaskID) : -1); }

	inline void ShowClientTasks()
	            { if(taskstate) taskstate->ShowClientTasks(this); }

	inline void CancelAllTasks()
	            { if(taskstate) taskstate->CancelAllTasks(this); }

	inline int GetActiveTaskCount()
		   { return (taskstate ? taskstate->GetActiveTaskCount() : 0); }

	inline int GetActiveTaskID(int index)
		   { return (taskstate ? taskstate->GetActiveTaskID(index) : -1); }

	inline int GetTaskStartTime(int index)
		   { return (taskstate ? taskstate->GetTaskStartTime(index) : -1); }

	inline bool IsTaskActivityCompleted(int index, int ActivityID)
		    { return (taskstate ? taskstate->IsTaskActivityCompleted(index, ActivityID) : false); }

	inline int GetTaskActivityDoneCount(int ClientTaskIndex, int ActivityID)
	 	   { return (taskstate ? taskstate->GetTaskActivityDoneCount(ClientTaskIndex, ActivityID) :0); }

	inline int ActiveTasksInSet(int TaskSet)
	 	   { return (taskstate ? taskstate->ActiveTasksInSet(TaskSet) :0); }

	inline int CompletedTasksInSet(int TaskSet)
	 	   { return (taskstate ? taskstate->CompletedTasksInSet(TaskSet) :0); }

	inline const EQClientVersion GetClientVersion() const { return ClientVersion; }
	inline const uint32 GetClientVersionBit() const { return ClientVersionBit; }

	int GetAggroCount();
	void IncrementAggroCount();
	void DecrementAggroCount();
	void SendPVPStats();
	void SendDisciplineTimers();
	void SendRespawnBinds();

	/*Adventure Stuff*/
	AdventureInfo* GetOfferedAdventure() { return m_offered_adventure; }
	void SetOfferedAdventure(AdventureInfo* ai) { m_offered_adventure = ai; }

	AdventureDetails* GetCurrentAdventure() { return m_current_adventure; }
	void SetCurrentAdventure(AdventureDetails* ad) { m_current_adventure = ad; }

	void SendAdventureSelection(Mob* rec, int32 difficulty, int32 type);
	void SendAdventureError(const char* msg, ...);
	void SendAdventureDetail();
	void SendAdventureFinish(int8 win, int32 points, int32 theme, bool update_stats);
	void SendAdventureCountUpdate(int32 current, int32 total);
	void AcceptAdventure();
	void DeclineAdventure();
	void LeaveAdventure();

	int32 GetLDoNWins() { return (m_pp.ldon_wins_guk + m_pp.ldon_wins_mir + m_pp.ldon_wins_mmc + m_pp.ldon_wins_ruj + m_pp.ldon_wins_tak); }
	int32 GetLDoNLosses() { return (m_pp.ldon_losses_guk + m_pp.ldon_losses_mir + m_pp.ldon_losses_mmc + m_pp.ldon_losses_ruj + m_pp.ldon_losses_tak); }
	int32 GetLDoNWinsTheme(int32 t);
	int32 GetLDoNLossesTheme(int32 t);
	void UpdateLDoNWins(int32 t, sint32 n);
	void UpdateLDoNLosses(int32 t, sint32 n);

	void HandleLDoNOpen(NPC *target);
	void HandleLDoNSenseTraps(NPC *target, int16 skill, int8 type);
	void HandleLDoNDisarm(NPC *target, int16 skill, int8 type);
	void HandleLDoNPickLock(NPC *target, int16 skill, int8 type);
	int	LDoNChest_SkillCheck(NPC *target, int skill);

	void CalcItemScale();
	bool CalcItemScale(int32 slot_x, int32 slot_y);
	void SummonAndRezzAllCorpses();
	void NotifyNewTitlesAvailable();
	void Signal(int32 data);
	Mob *GetBindSightTarget() { return bind_sight_target; }
	void SetBindSightTarget(Mob *n) { bind_sight_target = n; }
	const int16 GetBoatID() const { return BoatID; }
	void SendRewards();
	bool TryReward(int32 claim_id);
	QGlobalCache *GetQGlobals() { return qGlobals; }
	QGlobalCache *CreateQGlobals() { qGlobals = new QGlobalCache(); return qGlobals; }
	void GuildBankAck();
	void GuildBankDepositAck(bool Fail);
	inline bool IsGuildBanker() { return GuildBanker; }
	void ClearGuildBank();
	void SendGroupCreatePacket();
	void SendGroupLeaderChangePacket(const char *LeaderName);
	void SendGroupJoinAcknowledge();
	void DoTracking();
	inline bool IsTracking() { return (TrackingID > 0); }
	inline bool IsBlockedBuff(sint16 SpellID) { return PlayerBlockedBuffs.find(SpellID) != PlayerBlockedBuffs.end(); }
	inline bool IsBlockedPetBuff(sint16 SpellID) { return PetBlockedBuffs.find(SpellID) != PetBlockedBuffs.end(); }
	void LocateCorpse();
	void SendTargetCommand(uint32 EntityID);
	bool	MoveItemToInventory(ItemInst *BInst, bool UpdateClient = false);

protected:
	friend class Mob;
	void CalcItemBonuses(StatBonuses* newbon);
	void AddItemBonuses(const ItemInst *inst, StatBonuses* newbon, bool isAug = false, bool isTribute = false);
	int  CalcRecommendedLevelBonus(int8 level, uint8 reclevel, int basestat);
	void CalcEdibleBonuses(StatBonuses* newbon);
	void CalcAABonuses(StatBonuses* newbon);
	void ApplyAABonuses(uint32 aaid, uint32 slots, StatBonuses* newbon);
	void MakeBuffFadePacket(int16 spell_id, int slot_id, bool send_message = true);
	bool client_data_loaded;

	sint16	GetFocusEffect(focusType type, int16 spell_id);
	sint16	CalcFocusEffect(focusType type, int16 focus_id, int16 spell_id);

	Mob*	bind_sight_target;

	VERTEX aa_los_me;
	VERTEX aa_los_them;
	Mob *aa_los_them_mob;
	bool los_status;
	QGlobalCache *qGlobals;

private:
	eqFilterMode ClientFilters[_FilterCount];
	sint32	HandlePacket(const EQApplicationPacket *app);
	void	OPTGB(const EQApplicationPacket *app);
	void	OPRezzAnswer(const EQApplicationPacket *app);
	void	OPMemorizeSpell(const EQApplicationPacket *app);
	void	OPMoveCoin(const EQApplicationPacket* app);
	void	MoveItemCharges(ItemInst &from, sint16 to_slot, int8 type);
	void	OPGMTraining(const EQApplicationPacket *app);
	void	OPGMEndTraining(const EQApplicationPacket *app);
	void	OPGMTrainSkill(const EQApplicationPacket *app);
	void	OPGMSummon(const EQApplicationPacket *app);
	void	OPCombatAbility(const EQApplicationPacket *app);

	// Bandolier Methods
	void	CreateBandolier(const EQApplicationPacket *app);
	void	RemoveBandolier(const EQApplicationPacket *app);
	void	SetBandolier(const EQApplicationPacket *app);

	void	HandleTraderPriceUpdate(const EQApplicationPacket *app);

	sint16    CalcAC();
	sint16    GetACMit();
	sint16    GetACAvoid();
	sint16    CalcATK();
	int      CalcHaste();

	sint16   CalcAlcoholPhysicalEffect();
	sint16   CalcSTR();
	sint16   CalcSTA();
	sint16   CalcDEX();
	sint16   CalcAGI();
	sint16   CalcINT();
	sint16   CalcWIS();
	sint16   CalcCHA();

    sint16	CalcMR();
	sint16	CalcFR();
	sint16	CalcDR();
	sint16	CalcPR();
	sint16	CalcCR();
	sint16	CalcCorrup();
	sint32	CalcMaxHP();
	sint32	CalcBaseHP();
	sint32	CalcHPRegen();
	sint32	CalcBaseManaRegen();
	int32	GetClassHPFactor();
	sint32	CalcManaRegen();
	void DoHPRegen();
	void DoManaRegen();
	void DoStaminaUpdate();
	void CalcRestState();

	int32 pLastUpdate;
	int32 pLastUpdateWZ;
	int8  playeraction;

	EQStreamInterface* eqs;

	int32				ip;
	int16				port;
    CLIENT_CONN_STATUS  client_state;
	int32				character_id;
	int32				WID;
	int32				account_id;
	char				account_name[30];
	int32				lsaccountid;
	char				lskey[30];
	sint16				admin;
	int32				guild_id;
	int8				guildrank; // player's rank in the guild, 0-GUILD_MAX_RANK
	bool				GuildBanker;
	int16				duel_target;
	bool				duelaccepted;
	std::list<int32> keyring;
	bool				tellsoff;	// GM /toggle
	bool				gmhideme;
	bool				LFG;
	bool				LFP;
	int8				LFGFromLevel;
	int8				LFGToLevel;
	bool				LFGMatchFilter;
	char				LFGComments[64];
	bool				AFK;
	bool				auto_attack;
	bool				auto_fire;
	int8				gmspeed;
	bool				medding;
	int16				horseId;
	bool				revoked;
	int32				pQueuedSaveWorkID;
	int16				pClientSideTarget;
	uint32				weight;
	bool				berserk;
	bool				dead;
	int16				BoatID;
	int16				TrackingID;
	int16				CustomerID;
	bool	Trader;
	bool	Buyer;
	string	BuyerWelcomeMessage;
	bool	AbilityTimer;
	int Haste;  //precalced value

	sint32				max_end;
	sint32				cur_end;

	PlayerProfile_Struct		m_pp;
	ExtendedProfile_Struct		m_epp;
	Inventory					m_inv;
	Object*						m_tradeskill_object;
	
	AdventureInfo* m_offered_adventure;
	AdventureDetails *m_current_adventure;

	void NPCSpawn(const Seperator* sep);
	uint32 GetEXPForLevel(uint16 level);

	bool	CanBeInZone();
	void	SendLogoutPackets();
    bool    AddPacket(const EQApplicationPacket *, bool);
    bool    AddPacket(EQApplicationPacket**, bool);
    bool    SendAllPackets();
	LinkedList<CLIENTPACKET *> clientpackets;

	//Zoning related stuff
	void SendZoneCancel(ZoneChange_Struct *zc);
	void SendZoneError(ZoneChange_Struct *zc, sint8 err);
	void DoZoneSuccess(ZoneChange_Struct *zc, uint16 zone_id, int32 instance_id, float dest_x, float dest_y, float dest_z, float dest_h, sint8 ignore_r);
	void ZonePC(int32 zoneID, int32 instance_id, float x, float y, float z, float heading, int8 ignorerestrictions, ZoneMode zm);
	void ProcessMovePC(int32 zoneID, int32 instance_id, float x, float y, float z, float heading, int8 ignorerestrictions = 0, ZoneMode zm = ZoneSolicited);
	float	zonesummon_x;
	float	zonesummon_y;
	float	zonesummon_z;
	uint16	zonesummon_id;
	int8	zonesummon_ignorerestrictions;
	ZoneMode zone_mode;


	Timer	position_timer;
	int8	position_timer_counter;

	PTimerList p_timers;		//persistent timers
	Timer	hpupdate_timer;
	Timer	camp_timer;
	Timer	process_timer;
	Timer	stamina_timer;
	Timer	zoneinpacket_timer;
	Timer	linkdead_timer;
	Timer	dead_timer;
	Timer	global_channel_timer;
	Timer	shield_timer;
	Timer	fishing_timer;
	Timer	endupkeep_timer;
	Timer	forget_timer;	// our 2 min everybody forgets you timer
	Timer	autosave_timer;
#ifdef REVERSE_AGGRO
	Timer	scanarea_timer;
#endif
	Timer	tribute_timer;

#ifdef PACKET_UPDATE_MANAGER
	UpdateManager update_manager;
#endif

	Timer	proximity_timer;
	Timer	TaskPeriodic_Timer;
	Timer	charm_update_timer;
	Timer	rest_timer;
	Timer	charm_class_attacks_timer;
	Timer	charm_cast_timer;
	Timer	qglobal_purge_timer;
	Timer	TrackingTimer;

	float	proximity_x;
	float	proximity_y;
	float	proximity_z;


	void	BulkSendInventoryItems();

	faction_map factionvalues;

	int32 tribute_master_id;

	FILE *SQL_log;
	int32       max_AAXP;
	int32		staminacount;
	AA_Array* aa[MAX_PP_AA_ARRAY];		//this list contains pointers into our player profile
	map<int32,int8> aa_points;
	bool npcflag;
	int8 npclevel;
	bool feigned;
	bool zoning;
	bool tgb;
	bool instalog;
	sint32	last_reported_mana;
	sint32	last_reported_endur;

	unsigned int  AggroCount; // How many mobs are aggro on us.

	unsigned int	RestRegenHP;
	unsigned int	RestRegenMana;

	set<uint32> zone_flags;

	ClientTaskState *taskstate;
	int TotalSecondsPlayed;

	//Anti Spam Stuff
	Timer *KarmaUpdateTimer;
	uint32 TotalKarma;

	Timer *GlobalChatLimiterTimer; //60 seconds
	uint32 AttemptedMessages;

	EQClientVersion ClientVersion;
	uint32	ClientVersionBit;

	int XPRate;

	bool m_ShadowStepExemption;
	bool m_KnockBackExemption;
	bool m_PortExemption;
	bool m_SenseExemption;

	//Connecting debug code.
	enum { //connecting states, used for debugging only
		NoPacketsReceived,		//havent gotten anything
		//this is the point where the client changes to the loading screen
		ReceivedZoneEntry,		//got the first packet, loading up PP
		PlayerProfileLoaded,	//our DB work is done, sending it
		ZoneInfoSent,		//includes PP, tributes, tasks, spawns, time and weather
		//this is the point where the client shows a status bar zoning in
		NewZoneRequested,	//received and sent new zone request
		ClientSpawnRequested,	//client sent ReqClientSpawn
		ZoneContentsSent,		//objects, doors, zone points
		ClientReadyReceived,	//client told us its ready, send them a bunch of crap like guild MOTD, etc
		//this is the point where the client releases the mouse
		ClientConnectFinished	//client finally moved to finished state, were done here
	} conn_state;
	void ReportConnectingState();
	uint8	HideCorpseMode;

	std::set<uint32> PlayerBlockedBuffs;
	std::set<uint32> PetBlockedBuffs;

};

#include "parser.h"
#endif
