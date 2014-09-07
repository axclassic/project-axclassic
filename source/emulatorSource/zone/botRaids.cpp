/*  EQEMu EQBOTS:	Everquest Server Emulator
Copyright (C) 2008 EQBOTS  EQEMu AXCLASSIC Development Team (http://www.axclassic.com)

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
	  
	EQBOTS Custom file coded for the AXClassic project

*/

#ifdef EQBOTS

#include "../common/debug.h"
#include "../common/MiscFunctions.h"
#include "botRaids.h"
#include "masterentity.h"
#include "groups.h"

BotRaids::BotRaids(Mob *leader)
{
	if(!leader->IsGrouped())
	{
		if(leader->IsClient()) {
			leader->Message(15, "You can't create a raid (not grouped or your group isn't full)");
		}
	}
	else if(leader->IsClient()) {
        memset(BotRaidGroups, 0, sizeof(BotRaidGroups));
		entity_list.AddBotRaid(this);
		botrleader = leader;
		botrleader->SetBotRaiding(true);
		botrleader->SetBotRaidID(GetBotRaidID());
		botmaintank = NULL;
		botsecondtank = NULL;
		botraidmaintarget = NULL;
		botraidsecondtarget = NULL;
		botgroup1target = NULL;
		botgroup2target = NULL;
		botgroup3target = NULL;
		botgroup4target = NULL;
		botgroup5target = NULL;
		botgroup6target = NULL;
		botgroup7target = NULL;
		botgroup8target = NULL;
		botgroup9target = NULL;
		botgroup10target = NULL;
		botgroup11target = NULL;
		botgroup12target = NULL;
		abotAttack = 1;
		leader->Message(15, "Your raid has been created.\n");
	}
}

bool BotRaids::AddBotGroup(Group *gtoadd) {
	unsigned int i=0;
	//see if they are allready in the group
	for(i=0; i<MAX_BOT_RAID_GROUPS; i++) {
		if(BotRaidGroups[i] && !strcasecmp(BotRaidGroups[i]->GetLeaderName(), gtoadd->GetLeaderName()))
			return false;
	}
	//put them in the group
	for(i=0; i<MAX_BOT_RAID_GROUPS; i++) {
		if(!BotRaidGroups[i]) {
			BotRaidGroups[i] = gtoadd;
			break;
		}
	}
	return true;
}

void BotRaids::RemoveBotGroup(Group *delgroup) {
	for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
		if(BotRaidGroups[i]) {
			if(BotRaidGroups[i] == delgroup) {
				for(int j=5; j>=0; j--) {
					if(delgroup->members[j] && delgroup->members[j]->IsBot()) {
						delgroup->members[j]->BotOwner = NULL;
						delgroup->members[j]->Kill();
					}
				}
				BotRaidGroups[i] = NULL;
				unsigned int k = i+1;
				for(; k<MAX_BOT_RAID_GROUPS; k++) {
					if(BotRaidGroups[k]) {
						BotRaidGroups[k-1] = BotRaidGroups[k];
						BotRaidGroups[k] = NULL;
					}
				}
				break;
			}
		}
	}
}

void BotRaids::RemoveRaidBots() {
	for(int i=11; i>=0; i--) {
		if(BotRaidGroups[i]) {
			for(int j=5; j>=0; j--) {
				if(BotRaidGroups[i]) {
					if(BotRaidGroups[i]->members[j]) {
						if(BotRaidGroups[i]->members[j]->IsBot()) {
							//Depopping via BotAI
							BotRaidGroups[i]->members[j]->check_grouped_timer.Start(MakeRandomInt(100, 200), false);
						}
						else if(BotRaidGroups[i]->members[j]->IsClient()) {
							BotRaidGroups[i]->members[j]->SetBotRaidID(0);
							BotRaidGroups[i]->members[j]->SetBotRaiding(false);
							if(BotRaidGroups[i]->BotGroupCount() < 2) {
								BotRaidGroups[i]->members[j]->SetGrouped(false);
							}
						}
					}
				}
			}
		}
	}
}

void BotRaids::SetRaidBotArmorColor() {
	for(int i=11; i>=0; i--) {
		if(BotRaidGroups[i]) {
		  std::string errorMessage = "";
			for(int j=5; j>=0; j--) {
				if(BotRaidGroups[i]) {
					if(BotRaidGroups[i]->members[j]) {
						if(BotRaidGroups[i]->members[j]->IsBot()) {
							BotRaidGroups[i]->members[j]->ArmorColorUpadate(BotRaidGroups[i]->members[j]->CastToNPC(), &errorMessage);
						}
					}
				}
			}
		}
	}
}

void BotRaids::AddBotToSpawnedBotList(Client *c) {
	for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; ++i) {
		if(BotRaidGroups[i]) {
			for(unsigned int j=0; j<MAX_GROUP_MEMBERS; ++j) {
				if(BotRaidGroups[i]->members[j]) {
					if(BotRaidGroups[i]->members[j]->IsBot()) {
						c->spawned_bots.push_back(BotRaidGroups[i]->members[j]->GetNPCTypeID());
					}
				}
			}
		}
	}
}

bool BotRaids::InsertBotGroup(Group *gtoadd) {
	//put the group into the raid
	if(!BotRaidGroups[11]) {
		for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; ++i) {
			if(!BotRaidGroups[i]) {
				for(int j=i; j>0; --j) {
					if(BotRaidGroups[j-1]) {
						if(gtoadd->GetID() < BotRaidGroups[j-1]->GetID()) {
							if(gtoadd->GetID() > BotRaidGroups[j-2]->GetID()) {
								BotRaidGroups[j] = BotRaidGroups[j-1];
								BotRaidGroups[j-1] = gtoadd;
								i = MAX_BOT_RAID_GROUPS;
								break;
							}
							else {
								BotRaidGroups[j] = BotRaidGroups[j-1];
								BotRaidGroups[j-1] = NULL;
							}
						}
					}
				}
			}
		}
		return true;
	}

	return false;
}

void BotRaids::CompareToSpawnedBotList(Client *c) {
	std::list<int32>::iterator iter = c->spawned_bots.begin();
	for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; ++i) {
		if(BotRaidGroups[i]) {
			for(unsigned int j=0; j<MAX_GROUP_MEMBERS; ++j) {
				if(BotRaidGroups[i]->members[j]) {
					if(BotRaidGroups[i]->members[j]->IsBot()) {
						if(BotRaidGroups[i]->members[j]->GetNPCTypeID() != *iter) {
							// This *iter bot must have died
							entity_list.RezBotMember(iter, i, j, this, 0, c);
							i = MAX_BOT_RAID_GROUPS;
							break;
						}
						++iter;
					}
				}
				else {
					// This *iter bot must have died and is the first
					// missing group member
					entity_list.RezBotMember(iter, i, j, this, 0, c);
					return;
				}
			}
		}
	}
}

int32 BotRaids::RaidBotGroupsCount() {
	unsigned int count = 0;
	for(unsigned int i=count; i<MAX_BOT_RAID_GROUPS; i++) {
		if(BotRaidGroups[i]) {
			count++;
		}
	}
	return count;
}

bool BotRaids::RemoveEmptyBotGroup() {
	for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
		Group *g = BotRaidGroups[i];
		if(g) {
			if(g->BotGroupCount() == 0) {
				BotRaidGroups[i] = 0x00000000;
				unsigned int j = i+1;
				for(; j<MAX_BOT_RAID_GROUPS; j++) {
					if(BotRaidGroups[j]) {
						BotRaidGroups[j-1] = BotRaidGroups[j];
						BotRaidGroups[j] = 0x00000000;
					}
				}
				return true;
			}
		}
	}
	return false;
}

bool BotRaids::RemoveClientGroup(Mob *m) {
	for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
		Group *g = BotRaidGroups[i];
		if(g) {
			if(g->GetLeader() == m) {
				if(BotRaidGroups[i]->BotGroupCount() == 1) {
					m->SetBotRaidID(0);
					m->SetBotRaiding(false);
					m->SetGrouped(false);
					entity_list.RemoveGroup(BotRaidGroups[i]->GetID());
				}
				else {
					for(unsigned int j=0; j<MAX_GROUP_MEMBERS; j++) {
						if(g->members[j]) {
							g->members[j]->SetBotRaidID(0);
							g->members[j]->SetBotRaiding(false);
						}
					}
				}
				BotRaidGroups[i] = 0x00000000;
				return true;
			}
		}
	}
	return false;
}

bool BotRaids::IsBotGroupInRaid(Group *gtocheck) {
	if(GetBotRaidID() == gtocheck->GetLeader()->GetBotRaidID())
		return true;
	else
		return false;
}

void BotRaids::DisbandBotRaid() {	
	entity_list.RemoveBotRaid(GetBotRaidID());
}

bool BotRaids::IsBotRaidMember(Mob* mob) {
	if(GetBotRaidID() == mob->GetBotRaidID())
		return true;
	else
		return false;
}

bool BotRaids::BotRaidProcess() {
	// TODO
	return true;
}

void BotRaids::AddBotRaidAggro(Mob *m) {
	for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
		if(BotRaidGroups[i]) {
			for(unsigned int j=0; j<MAX_GROUP_MEMBERS; j++) {
				if(BotRaidGroups[i]->members[j]) {
					if(BotRaidGroups[i]->members[j]->IsBot()) {
						BotRaidGroups[i]->members[j]->AddToHateList(m, 1);
					}
				}
			}
		}
	}
}

bool BotRaids::GetBotRaidAggro() {
	bool gotAggro = false;
	for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
		if(BotRaidGroups[i]) {
			for(unsigned int j=0; j<MAX_GROUP_MEMBERS; j++) {
				if(BotRaidGroups[i]->members[j]) {
					if(BotRaidGroups[i]->members[j]->IsEngaged()) {
						gotAggro = true;
						break;
					}
					if(BotRaidGroups[i]->members[j] && BotRaidGroups[i]->members[j]->GetPetID()) {
						if(BotRaidGroups[i]->members[j]->GetPet()->IsEngaged()) {
							gotAggro = true;
							break;
						}
					}
				}
			}
		}
	}
	return gotAggro;
}

void BotRaids::FollowGuardCmd(Client *c, bool isGuard, bool isClose) {
	int followingID = 0;
	//const char* botfollowname = NULL;
	for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
		if(BotRaidGroups[i]) {
			for(unsigned int j=0; j<MAX_GROUP_MEMBERS; j++) {
				if(BotRaidGroups[i]->members[j]) {
					if(isGuard) {
						if(BotRaidGroups[i]->members[j]->IsBot()) {
							  if(BotRaidGroups[i]->members[j]->IsMoving()){
							      c->Message(15, "You can't be moving for this command.");
							      return;
							  }
							  if ((BotRaidGroups[i]->members[j]->GetTarget()) && 
							      (BotRaidGroups[i]->members[j]->GetTarget()->IsClient())){
							      BotRaidGroups[i]->members[j]->BotSay("Waiting here.");
							      BotRaidGroups[i]->members[j]->SetFollowID(0);
							      followingID = 0;
							  }
							  if(BotRaidGroups[i]->members[j]->GetTarget()){
							      BotRaidGroups[i]->members[j]->SetFollowID(0);
							      followingID = 0;
							  }
							  else
							      c->Message(15, "Already in guard mode.");
							return;
						}
					}
					else {
						if(followingID == 0) {
							if(BotRaidGroups[i]->members[j]->IsBot()) {
							    BotRaidGroups[i]->members[j]->SetTarget(c);
							    followingID = BotRaidGroups[i]->members[j]->GetID();
							    //botfollowname = BotRaidGroups[i]->members[j]->GetName();
							    BotRaidGroups[i]->members[j]->SetFollowID(c->GetID());
							      if((BotRaidGroups[i]->members[j]->GetTarget()) &&
								(BotRaidGroups[i]->members[j]->GetTarget()->IsClient())){
								if (!isClose)
								   BotRaidGroups[i]->members[j]->BotSay("Following %s normal mode.", c->GetName());
								else
								   BotRaidGroups[i]->members[j]->BotSay("Following %s as close possible.", c->GetName());
							      }
							}
						}
						else {
							if(BotRaidGroups[i]->members[j]->IsBot()) {
							    BotRaidGroups[i]->members[j]->SetFollowID(followingID);
							      if (!isClose)
								followingID = BotRaidGroups[i]->members[j]->GetID();
							}
						}
					}
				}
			}
		}
	}
}

void BotRaids::RaidInterruptSpells() {
	for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
		if(BotRaidGroups[i]) {
			for(unsigned int j=0; j<MAX_GROUP_MEMBERS; j++) {
				if(BotRaidGroups[i]->members[j]) {
					//if(BotRaidGroups[i]->members[j]->IsBot()) {
						BotRaidGroups[i]->members[j]->InterruptSpell(0,0,0);
					//}
				}
			}
		}
	}
}

void BotRaids::SummonRaidBots(Mob *m, bool wipe_hate) {
	for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
		if(BotRaidGroups[i]) {
			for(unsigned int j=0; j<MAX_GROUP_MEMBERS; j++) {
				if(BotRaidGroups[i]->members[j]) {
					if(BotRaidGroups[i]->members[j]->IsBot()) {
						if(wipe_hate) {
							BotRaidGroups[i]->members[j]->WipeHateList();
						}
						BotRaidGroups[i]->members[j]->SetTarget(m);
						BotRaidGroups[i]->members[j]->InterruptSpell();
						BotRaidGroups[i]->members[j]->BotWarp(m->GetX(), m->GetY(), m->GetZ());
						if(BotRaidGroups[i]->members[j] && BotRaidGroups[i]->members[j]->GetPetID()) {
							if(wipe_hate) {
								BotRaidGroups[i]->members[j]->GetPet()->WipeHateList();
							}
							BotRaidGroups[i]->members[j]->GetPet()->SetTarget(BotRaidGroups[i]->members[j]);
							BotRaidGroups[i]->members[j]->GetPet()->BotWarp(m->GetX(), m->GetY(), m->GetZ());
						}
					}
				}
			}
		}
	}
}

//Angelox:Summon the bots to random positions around your character - Disabled, not needed anymore
/*
void BotRaids::RandSummonRaidBots(Mob *m, bool wipe_hate) {
	unsigned int randmoveA = MakeRandomInt(-10, 14);
	unsigned int randmoveB = MakeRandomInt(-15, 19);
	unsigned int randmoveC = MakeRandomInt(-5, 9);
	unsigned int randmoveD = MakeRandomInt(-20, 25);
	for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
		if(BotRaidGroups[i]) {
			for(unsigned int j=0; j<MAX_GROUP_MEMBERS; j++) {
				if(BotRaidGroups[i]->members[j]) {
					if(BotRaidGroups[i]->members[j]->IsBot()) {
						unsigned int memberClass = BotRaidGroups[i]->members[j]->GetClass();
						if(wipe_hate) {
							BotRaidGroups[i]->members[j]->WipeHateList();
						}
						BotRaidGroups[i]->members[j]->SetTarget(m);
					         if (memberClass == WARRIOR)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() + randmoveA, m->GetY() + randmoveA, m->GetZ());
					         else if (memberClass == CLERIC)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() + randmoveB, m->GetY() + randmoveB, m->GetZ());
					         else if (memberClass == WIZARD)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() + randmoveC, m->GetY() + randmoveC, m->GetZ());
					         else if (memberClass == ENCHANTER)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() + randmoveD, m->GetY() + randmoveD, m->GetZ());
					         else if (memberClass == SHAMAN)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() - randmoveA, m->GetY() - randmoveA, m->GetZ());
					         else if (memberClass == DRUID)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() - randmoveB, m->GetY() - randmoveB, m->GetZ());
					         else if (memberClass == PALADIN)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() - randmoveC, m->GetY() - randmoveC, m->GetZ());
					         else if (memberClass == NECROMANCER)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() - randmoveD, m->GetY() - randmoveD, m->GetZ());
					         else if (memberClass == BARD)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() - randmoveA +3, m->GetY() - randmoveA +3, m->GetZ());
					         else if (memberClass == SHADOWKNIGHT)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() - randmoveB +5, m->GetY() - randmoveA +5, m->GetZ());
					         else if (memberClass == RANGER)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() - randmoveC +6, m->GetY() - randmoveC +6, m->GetZ());
					         else if (memberClass == MONK)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() - randmoveD +7, m->GetY() - randmoveD +7, m->GetZ());
					         else if (memberClass == MAGICIAN)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() - randmoveA +8, m->GetY() - randmoveA +8, m->GetZ());
					         else if (memberClass == BEASTLORD)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() - randmoveB +9, m->GetY() - randmoveA +9, m->GetZ());
					         else if (memberClass == BERSERKER)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() - randmoveA +10, m->GetY() - randmoveA +8, m->GetZ());
					         else if (memberClass == ROGUE)
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() - randmoveB +11, m->GetY() - randmoveA +9, m->GetZ());
					         else
						   BotRaidGroups[i]->members[j]->Warp(m->GetX() - randmoveB +12, m->GetY() - randmoveB +10, m->GetZ());

						if(BotRaidGroups[i]->members[j] && BotRaidGroups[i]->members[j]->GetPetID()) {
							if(wipe_hate) {
								BotRaidGroups[i]->members[j]->GetPet()->WipeHateList();
							}
							BotRaidGroups[i]->members[j]->GetPet()->SetTarget(BotRaidGroups[i]->members[j]);
							BotRaidGroups[i]->members[j]->GetPet()->Warp(m->GetX(), m->GetY(), m->GetZ());
						}
					}
				}
			}
		}
	}
}*/

void BotRaids::SendBotRaidMessage(Mob *sender, const char *message) {
	if(sender == NULL || !sender->IsGrouped() || message == NULL)
		return;

	for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
		if(BotRaidGroups[i]) {
			for(unsigned int j=0; j<MAX_GROUP_MEMBERS; j++) {
				if(BotRaidGroups[i]->members[j]) {
					if(BotRaidGroups[i]->members[j]->IsClient()) {
						BotRaidGroups[i]->members[j]->CastToClient()->ChannelMessageSend(sender->GetName(), BotRaidGroups[i]->members[j]->GetName(), 15, 0, message);
					}
				}
			}
		}
	}
}

void BotRaids::SetBotRaidLeader(Mob *rrleader) {
	botrleader = rrleader;
}

Mob* BotRaids::GetRaidBotLeader() {
	if(botrleader == NULL)
		return NULL;
	else
		return botrleader;
}

void BotRaids::SetBotMainTank(Mob *mtank) {
	if(mtank && IsBotRaidMember(mtank) ) {
		botmaintank = mtank;
	}
	else {
		botmaintank = NULL;
	}
}

void BotRaids::SetBotSecondTank(Mob *stank) {
	if(stank != NULL && IsBotRaidMember(stank)) {
		botsecondtank = stank;
	}
	else {
		botsecondtank=NULL;
	}
}

void BotRaids::SetBotMainTarget(Mob *target) {
	if(target && !IsBotRaidMember(target))
		botraidmaintarget = target;
	else
		botraidmaintarget = NULL;
}

void BotRaids::SetBotSecondTarget(Mob *starget) {
	if(starget && !IsBotRaidMember(starget))
		botraidsecondtarget = starget;
}

void BotRaids::SetBotGroupTarget(Mob *target, Group *group) {
	if(target && !IsBotRaidMember(target) && group) {
		Mob *gleader = group->GetLeader();
		gleader->CastToNPC()->SetTarget(target);
	}
}

void BotRaids::GroupAssignTask(Group *g, int iTask, Mob *m) {
	if(g == NULL || !g->IsGroup() || iTask < 0 || iTask > 5)
		return;

	if((iTask == 2) && (m != NULL) && !m->IsBot()) {
		Mob *gleader = g->GetLeader();
		if(gleader->IsBot()) {
			gleader->SetFollowID(gleader->BotOwner->GetID());
			gleader->WipeHateList();
			gleader->Say("Attacking %s", m->GetCleanName());
			gleader->AddToHateList(m, 2000, 2000, false);
			for(unsigned int i=0; i<MAX_GROUP_MEMBERS; i++) {
				if(g->members[i] && (g->members[i] != gleader)) {
					g->members[i]->SetFollowID(gleader->GetID());
					g->members[i]->WipeHateList();
					g->members[i]->Say("Attacking %s", m->GetCleanName());
					g->members[i]->AddToHateList(m, 2000, 2000, false);
				}
			}
		}
		else {
			gleader->Message(15, "Only bot groups can offtank.");
		}
	}
	// Guard
	else if(iTask == 4) {
		for(unsigned int i=0; i<MAX_GROUP_MEMBERS; i++) {
			if(g->members[i]) {
				g->members[i]->SetFollowID(0);
                g->members[i]->WipeHateList();
				g->members[i]->Say("Guarding here.");
			}
		}
	}
}

void BotRaids::SplitExp(uint32 exp, Mob* other)
{
	if(other->CastToNPC()->MerchantType != 0) // Ensure NPC isn't a merchant
	{
		return;
	}

	if(other->GetOwner() && other->GetOwner()->IsBot()) // Ensure owner isn't a bot
	{
		return;
	}

	if(other->GetOwner() && other->GetOwner()->IsClient()) // Ensure owner isn't pc
	{
		return;
	}

	uint32 groupexp = exp; 
	int8 membercount = 0; 
	int8 maxlevel = 1;

	for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; i++)
	{
		if(BotRaidGroups[i])
		{
			for(unsigned int j=0; j<MAX_GROUP_MEMBERS; j++)
			{
				if(BotRaidGroups[i]->members[j])
				{
					if(BotRaidGroups[i]->members[j]->GetLevel() > maxlevel)
					{
						maxlevel = BotRaidGroups[i]->members[j]->GetLevel();
					}
					membercount++;
				}
			}
		}
	}

	groupexp = (uint32)((float)groupexp * (1.0f-(RuleR(Character, RaidExpMultiplier))));

	int conlevel = Mob::GetLevelCon(maxlevel, other->GetLevel());
	if(conlevel == CON_GREEN)
	{
		return;	//no exp for greenies...
	}

	if(membercount == 0)
	{
		return;
	}

	for(unsigned int x=0; x<MAX_GROUP_MEMBERS; x++)
	{
		if(BotRaidGroups[0]->members[x] != NULL) // If Group Member is Client
		{
			if(BotRaidGroups[0]->members[x]->IsClient())
			{
				Client *cmember = BotRaidGroups[0]->members[x]->CastToClient();
				// add exp + exp cap 
				sint16 diff = cmember->GetLevel() - maxlevel;
				sint16 maxdiff = -(cmember->GetLevel()*15/10 - cmember->GetLevel());
				if(maxdiff > -5)
				{
					maxdiff = -5;
				}
				if(diff >= maxdiff) /*Instead of person who killed the mob, the person who has the highest level in the group*/
				{
					uint32 tmp = (cmember->GetLevel() + 3) * (cmember->GetLevel() + 3) * 75 * 35 / 10;
					uint32 tmp2 = (groupexp / membercount) + 1;
					cmember->AddEXP( tmp < tmp2 ? tmp : tmp2, conlevel ); 
				}
			}
		} 
	}
}

void BotRaids::RaidDefendEnraged() {
	for(unsigned int j=0; j<MAX_BOT_RAID_GROUPS; j++) {
		if(BotRaidGroups[j]) {
			for(unsigned int i=0; i<MAX_GROUP_MEMBERS; i++) {
				if(BotRaidGroups[j]->members[i] && BotRaidGroups[j]->members[i]->IsBot()) {
					BotRaidGroups[j]->members[i]->Say("Enraged... stopping attacks.");
					BotRaidGroups[j]->members[i]->SetFollowID(0);
					BotRaidGroups[j]->members[i]->WipeHateList();
					if(BotRaidGroups[j]->members[i] && BotRaidGroups[j]->members[i]->GetPetID()) {
						BotRaidGroups[j]->members[i]->GetPet()->WipeHateList();
					}
				}
			}
		}
	}
}

void BotRaids::RaidWipeHateList() {
	for(unsigned int j=0; j<MAX_BOT_RAID_GROUPS; j++) {
		if(BotRaidGroups[j]) {
			for(unsigned int i=0; i<MAX_GROUP_MEMBERS; i++) {
				if(BotRaidGroups[j]->members[i] && BotRaidGroups[j]->members[i]->IsBot()) {
					//BotRaidGroups[j]->members[i]->Say("Enraged... stopping attacks.");
					BotRaidGroups[j]->members[i]->SetFollowID(0);
					BotRaidGroups[j]->members[i]->WipeHateList();
					if(BotRaidGroups[j]->members[i] && BotRaidGroups[j]->members[i]->GetPetID()) {
						BotRaidGroups[j]->members[i]->GetPet()->WipeHateList();
					}
				}
			}
		}
	}
}

// g1 follow g2
// or g1 follow g2 and assist g2
void BotRaids::GroupAssignTask(Group *g, int iTask, Group *g2) {
	if(g == NULL || g2 == NULL || !g->IsGroup() || !g2->IsGroup() )
		return;

	Mob *gleader1 = g->GetLeader();
	Mob *gleader2 = g2->GetLeader();

	if(!gleader1 || !gleader2)
		return;

	if(iTask == 1) {
		gleader1->SetFollowID(gleader2->GetID());
        gleader1->WipeHateList();
		gleader1->Say("Following %s", gleader2->GetName());
		for(unsigned int i=0; i<MAX_GROUP_MEMBERS; i++) {
			if(g->members[i] && (g->members[i] != gleader1)) {
				g->members[i]->SetFollowID(gleader1->GetID());
                g->members[i]->WipeHateList();
				g->members[i]->Say("Following %s", gleader2->GetName());
			}
		}
	}
	else if(iTask == 3)
	{
		if(gleader2->GetTarget() == NULL)
		{
			return;
		}
		else
		{
			if(gleader2->BotOwner)
			{
				//break invis when you attack
				if(gleader2->BotOwner->invisible) {
					gleader2->BotOwner->BuffFadeByEffect(SE_Invisibility);
					gleader2->BotOwner->BuffFadeByEffect(SE_Invisibility2);
					gleader2->BotOwner->invisible = false;
				}
				if(gleader2->BotOwner->invisible_undead) {
					gleader2->BotOwner->BuffFadeByEffect(SE_InvisVsUndead);
					gleader2->BotOwner->BuffFadeByEffect(SE_InvisVsUndead2);
					gleader2->BotOwner->invisible_undead = false;
				}
				if(gleader2->BotOwner->invisible_animals){
					gleader2->BotOwner->BuffFadeByEffect(SE_InvisVsAnimals);
					gleader2->BotOwner->invisible_animals = false;
				}
				if(gleader2->BotOwner->hidden || gleader2->BotOwner->improved_hidden){
					gleader2->BotOwner->hidden = false;
					gleader2->BotOwner->improved_hidden = false;
					EQApplicationPacket* outapp = new EQApplicationPacket(OP_SpawnAppearance, sizeof(SpawnAppearance_Struct));
					SpawnAppearance_Struct* sa_out = (SpawnAppearance_Struct*)outapp->pBuffer;
					sa_out->spawn_id = gleader2->BotOwner->GetID();
					sa_out->type = 0x03;
					sa_out->parameter = 0;
					entity_list.QueueClients(gleader2->BotOwner, outapp, true);
					safe_delete(outapp);
				}
			}

			gleader1->CastToNPC()->SetTarget(gleader2->GetTarget());
			this->SetAttackBotRaidRights(1);
			gleader1->Say("Assisting %s", gleader2->GetName());
		}
	}
}

Mob* BotRaids::GetBotMainTank() {
	if(!botmaintank || (botmaintank->AmIaBot && botmaintank->qglobal))
		return NULL;

	if(entity_list.GetMob(botmaintank->GetName()))
		return botmaintank;
	else
		return NULL;
}

Mob* BotRaids::GetBotSecondTank() {
	if(!botsecondtank || (botsecondtank->AmIaBot && botsecondtank->qglobal))
		return NULL;

	if(entity_list.GetMob(botsecondtank->GetName()))
		return botsecondtank;
	else
		return NULL;
}

Mob* BotRaids::GetBotMainTarget() {
	if(botraidmaintarget == NULL)
		return NULL;
	else
		return botraidmaintarget;
}

Mob* BotRaids::GetBotSecondTarget() {
	if(botraidsecondtarget == NULL)
		return NULL;
	else
		return botraidsecondtarget;
}

void BotRaids::SetAttackBotRaidRights(int right) {
	if( right < 0 || right > 1 )
		return;
	else{
		abotAttack = right;
	}
}

int BotRaids::GetBotAttackRights() {
	if( abotAttack == 0 || abotAttack == 1 )
		return abotAttack;
	else{
		return 0;
	}
}

void BotRaids::SaveGroups(Client *c, int tableA, int tableB, int tableC) {
    if (tableA ==1){
	database.DeleteBotGroups(c->CharacterID(), 1, 0, 0);
	for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
		if(BotRaidGroups[i]) {
			for(unsigned int j=0; j<MAX_GROUP_MEMBERS; j++) {
				if(BotRaidGroups[i]->members[j]) {
					if(BotRaidGroups[i]->members[j]->IsClient()) {
						continue;
					}
					database.SaveBotGroups(i, c->CharacterID(), BotRaidGroups[i]->members[j]->GetNPCTypeID(), j, BotRaidGroups[i]->members[j]->GetHP(), BotRaidGroups[i]->members[j]->GetMana(), 1, 0, 0);
				}
			}
		}
	}
	return;
    }
    else if (tableB ==1){
	database.DeleteBotGroups(c->CharacterID(), 0, 1, 0);
	for(unsigned int x=0; x<MAX_BOT_RAID_GROUPS; x++) {
		if(BotRaidGroups[x]) {
			for(unsigned int y=0; y<MAX_GROUP_MEMBERS; y++) {
				if(BotRaidGroups[x]->members[y]) {
					if(BotRaidGroups[x]->members[y]->IsClient()) {
						continue;
					}
					database.SaveBotGroups(x, c->CharacterID(), BotRaidGroups[x]->members[y]->GetNPCTypeID(), y, BotRaidGroups[x]->members[y]->GetHP(), BotRaidGroups[x]->members[y]->GetMana(), 0, 1, 0);
				}
			}
		}
	}
	return;
    }
    else if (tableC ==1){
	database.DeleteBotGroups(c->CharacterID(), 0, 0, 1);
	for(unsigned int g=0; g<MAX_BOT_RAID_GROUPS; g++) {
		if(BotRaidGroups[g]) {
			for(unsigned int h=0; h<MAX_GROUP_MEMBERS; h++) {
				if(BotRaidGroups[g]->members[h]) {
					if(BotRaidGroups[g]->members[h]->IsClient()) {
						continue;
					}
					database.SaveBotGroups(g, c->CharacterID(), BotRaidGroups[g]->members[h]->GetNPCTypeID(), h, BotRaidGroups[g]->members[h]->GetHP(), BotRaidGroups[g]->members[h]->GetMana(), 0, 0, 1);
				}
			}
		}
	}
    }
    return;
}

void BotRaids::BotRaidInfo(Client *c) {
	if(c->IsClient()) {
		if(c->IsBotRaiding()) {
			bool moredata = false;
			for(unsigned int i=0; i<MAX_BOT_RAID_GROUPS; i++) {
				if(BotRaidGroups[i] && BotRaidGroups[i]->members[0]) {
					moredata = true;
					c->Message(15, "Group %i (%i members)", (i+1)-1, BotRaidGroups[i]->BotGroupCount());
					c->Message(15, "Group %i Leader: %s", (i+1)-1, BotRaidGroups[i]->members[0]->GetName());
					for(unsigned int j=0; j<MAX_GROUP_MEMBERS; j++) {
						if(BotRaidGroups[i]->members[j]) {
							int memberClass = BotRaidGroups[i]->members[j]->GetClass();
							if((memberClass == MONK) || (memberClass == WARRIOR) || (memberClass == BERSERKER) || (memberClass == ROGUE))
							{
								c->Message(15, "%s,  hp: %i | %i",
									BotRaidGroups[i]->members[j]->GetName(),
									BotRaidGroups[i]->members[j]->GetHP(),
									BotRaidGroups[i]->members[j]->GetMaxHP());
							}
							else
							{
								c->Message(15, "%s,  hp: %i | %i  mana: %i | %i",
									BotRaidGroups[i]->members[j]->GetName(),
									BotRaidGroups[i]->members[j]->GetHP(),
									BotRaidGroups[i]->members[j]->GetMaxHP(),
									BotRaidGroups[i]->members[j]->GetMana(),
									BotRaidGroups[i]->members[j]->GetMaxMana());
							}
						}
					}
					c->Message(15, "---------");
				}
			}
			if(moredata) {
				c->Message(15, "Raid Leader is %s", botrleader->GetName());
				if(botmaintank) {
					c->Message(15, "Main Tank is %s", botmaintank->GetName());
				}
				else {
					c->Message(15, "A Main Tank is not assigned.");
				}
				if(botsecondtank) {					
					c->Message(15, "Secondary Tank is %s", botsecondtank->GetName());
				}
				else {
					c->Message(15, "A Secondary Tank is not assigned.");
				}
				if(botraidmaintarget) {
					c->Message(15, "Main Raid Target is %s", botraidmaintarget->GetCleanName());
				}
				else {
					c->Message(15, "A Main Raid Target is not assigned.");
				}
				//			if(raidsecondtarget) {
				//				c->Message(15, "Secondary Raid Target is %s", raidsecondtarget->GetCleanName());
				//			}
				//			else {
				//				c->Message(15, "A Secondary Raid Target is not assigned.");
				//			}
			}
		}
	}
}

#endif //EQBOTS
