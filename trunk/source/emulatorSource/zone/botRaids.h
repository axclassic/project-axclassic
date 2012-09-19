/*	EQEMu EQBOTS:	Everquest Server Emulator
Copyright (C) 2008 EQBOTS  EQEMu AXCLASSIC Development Team (http://www.axclassic.com)

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; version 2 of the License.
	
		This program is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY except by those people which sell it, which
	are required to give you total support for your newly bought product;
	without even the implied warranty of MERCHANTABILITY or FITNESS FOR
	A PARTICULAR PURPOSE.	See the GNU General Public License for more details.
	
		You should have received a copy of the GNU General Public License
		along with this program; if not, write to the Free Software
		Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA	02111-1307	USA
		
	EQBOTS Custom file coded for the AXClassic project
*/

#ifdef EQBOTS

#ifndef BOTRAIDS_H
#define BOTRAIDS_H

#include "../common/debug.h"
#include "entity.h"
#include "mob.h"

static const uint32 MAX_BOT_RAID_GROUPS	= 12;

class BotRaids
{
	
public:
	BotRaids(Mob* leader);
	~BotRaids() {}

	int16 raidID;
	void SetBotRaidID(int16 rId) { raidID = rId; };
	int	 GetBotRaidID() { return raidID; };
	bool AddBotGroup(Group* gtoadd);
	bool IsBotGroupInRaid(Group* gtocheck);
	bool RemoveEmptyBotGroup();
	int32 RaidBotGroupsCount();
	void CompareToSpawnedBotList(Client *c);
	bool InsertBotGroup(Group *gtoadd);
	void AddBotToSpawnedBotList(Client *c);
	bool RemoveClientGroup(Mob *m);
	void RemoveRaidBots();
	void RemoveBotGroup(Group *delgroup);
	void DisbandBotRaid();
	bool IsBotRaidMember(Mob* mob);
	bool BotRaidProcess();
	bool IsBotRaid() { return true; }
	void SendBotRaidMessage(Mob* sender, const char* message);
	void SetBotRaidLeader(Mob *rrleader);
	Mob* GetRaidBotLeader();
	bool IsBotRaidLeader(Mob* leadertest) { return leadertest==botrleader; };
	void LearnBotMembers();
	void SaveGroups(Client *c,int tableA, int tableB, int tableC);
	void BotRaidInfo(Client *c);
	void AddBotRaidAggro(Mob *m);
	bool GetBotRaidAggro();
	void FollowGuardCmd(Client *c, bool isGuard, bool isClose);
	void SummonRaidBots(Mob *m, bool wipe_hate);
	void RandSummonRaidBots(Mob *m, bool wipe_hate);
	//Group* FindGroup(int groupnumber);

	// Assign tanks and targets
	void SetBotMainTank(Mob *mtank);
	void SetBotSecondTank(Mob *stank);
	void SetBotMainTarget(Mob *target);
	void SetBotSecondTarget(Mob *starget);
	void SetBotGroupTarget(Mob *target, Group* group);
	void SetAttackBotRaidRights(int right);
	int GetBotAttackRights();

	// Get the tanks or the target;
	Mob* GetBotMainTank();
	Mob* GetBotSecondTank();
	Mob* GetBotMainTarget();
	Mob* GetBotSecondTarget();

	// Assign task to groups:
	// 1: follow
	// 2: attack
	// 3: assist
	// 4: guard
	void GroupAssignTask(Group *g, int iTask, Mob *m);
	void GroupAssignTask(Group *g, int iTask, Group *g2);
	void RaidDefendEnraged();
	void RaidWipeHateList();	
	void SplitExp(uint32 exp, Mob* other);

	// Raid and Groups in raid
	Mob* botrleader;
	Group* BotRaidGroups[MAX_BOT_RAID_GROUPS];

	// Generals classes
	LinkedList<Mob *> BotMelees;
	LinkedList<Mob *> BotHealers;
	LinkedList<Mob *> BotCasters; 
	
	// Sub classes
	LinkedList<Mob *> BotMelees_tanks;
	LinkedList<Mob *> BotMelees_dps;
	LinkedList<Mob *> BotMelees_heal;
	LinkedList<Mob *> BotHealers_heal;
	LinkedList<Mob *> BotHealers_dps;
	LinkedList<Mob *> BotCasters_dps;
	LinkedList<Mob *> BotCasters_cc;

	// Specialized
	Mob* botmaintank;
	Mob* botsecondtank;

	// Raid Target
	Mob* botraidmaintarget;
	Mob* botraidsecondtarget;
	
	// Groups target
	Mob* botgroup1target;
	Mob* botgroup2target;
	Mob* botgroup3target;
	Mob* botgroup4target;
	Mob* botgroup5target;
	Mob* botgroup6target;
	Mob* botgroup7target;
	Mob* botgroup8target;
	Mob* botgroup9target;
	Mob* botgroup10target;
	Mob* botgroup11target;
	Mob* botgroup12target;

	// Allow to attack or not
	int abotAttack; // (0/1) can't/can attack

};
#endif

#endif //EQBOTS


