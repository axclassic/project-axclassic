/*  EQEMu:  Everquest Server Emulator
Copyright (C) 2001-2002  EQEMu Development Team (http://eqemu.org)

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
#include "../common/debug.h"
#include "masterentity.h"
#include "NpcAI.h"
#include "../common/packet_functions.h"
#include "../common/packet_dump.h"
#include "worldserver.h"
extern EntityList entity_list;
extern WorldServer worldserver;

//
// Xorlac: This will need proper synchronization to make it work correctly.
//			Also, should investigate client ack for packet to ensure proper synch.
//

/*

note about how groups work:
A group contains 2 list, a list of pointers to members and a 
list of member names. All members of a group should have their
name in the membername array, wether they are in the zone or not.
Only members in this zone will have non-null pointers in the
members array. 

*/

//create a group which should allready exist in the database
Group::Group(int32 gid) 
: GroupIDConsumer(gid)
{
	leader = NULL;
	memset(members,0,sizeof(Mob*) * MAX_GROUP_MEMBERS);
	TargetID = 0;
	memset(&LeaderAbilities, 0, sizeof(GroupLeadershipAA_Struct));
	uint32 i;
	for(i=0;i<MAX_GROUP_MEMBERS;i++)
		memset(membername[i],0,64);	

	if(gid != 0) {
		if(!LearnMembers())
			SetID(0);
	}
	for(int i = 0; i < MAX_MARKED_NPCS; ++i)
		MarkedNPCs[i] = 0;

	NPCMarkerID = 0;
}

//creating a new group
Group::Group(Mob* leader)
: GroupIDConsumer()
{
	memset(members, 0, sizeof(members));
	members[0] = leader;
	leader->SetGrouped(true);
	SetLeader(leader);
	TargetID = 0;
	memset(&LeaderAbilities, 0, sizeof(GroupLeadershipAA_Struct));
	uint32 i;
	for(i=0;i<MAX_GROUP_MEMBERS;i++)
		memset(membername[i],0,64);
	strcpy(membername[0],leader->GetName());

#ifdef EQBOTS

	if(!leader->IsBot())

#endif //EQBOTS

	strcpy(leader->CastToClient()->GetPP().groupMembers[0],leader->GetName());

	for(int i = 0; i < MAX_MARKED_NPCS; ++i)
		MarkedNPCs[i] = 0;

	NPCMarkerID = 0;

}

Group::~Group()
{ 
	for(int i = 0; i < MAX_MARKED_NPCS; ++i)
		if(MarkedNPCs[i])
		{
			Mob* m = entity_list.GetMob(MarkedNPCs[i]);
			if(m)
				m->IsTargeted(-1);
		}
}

//Cofruben:Split money used in OP_Split.
//Rewritten by Father Nitwit
void Group::SplitMoney(uint32 copper, uint32 silver, uint32 gold, uint32 platinum, Client *splitter) {
	//avoid unneeded work
	if(copper == 0 && silver == 0 && gold == 0 && platinum == 0)
		return;
	
  uint32 i;
  int8 membercount = 0;
  for (i = 0; i < MAX_GROUP_MEMBERS; i++) { 
	  if (members[i] != NULL) {

		  membercount++; 
	  } 
  } 

  if (membercount == 0) 
	  return;
  
  uint32 mod;
  //try to handle round off error a little better
  if(membercount > 1) {
	mod = platinum % membercount;
  	if((mod) > 0) {
  		platinum -= mod;
  		gold += 10 * mod;
  	}
	mod = gold % membercount;
  	if((mod) > 0) {
  		gold -= mod;
  		silver += 10 * mod;
  	}
	mod = silver % membercount;
  	if((mod) > 0) {
  		silver -= mod;
  		copper += 10 * mod;
  	}
  }
  
  //calculate the splits
  //We can still round off copper pieces, but I dont care
  uint32 sc;
  uint32 cpsplit = copper / membercount;
  sc = copper   % membercount;
  uint32 spsplit = silver / membercount;
  uint32 gpsplit = gold / membercount;
  uint32 ppsplit = platinum / membercount;

  char buf[128];
  buf[63] = '\0';
  string msg = "You receive";
  bool one = false;
  
  if(ppsplit > 0) {
	 snprintf(buf, 63, " %u platinum", ppsplit);
	 msg += buf;
	 one = true;
  }
  if(gpsplit > 0) {
	 if(one)
	 	msg += ",";
	 snprintf(buf, 63, " %u gold", gpsplit);
	 msg += buf;
	 one = true;
  }
  if(spsplit > 0) {
	 if(one)
	 	msg += ",";
	 snprintf(buf, 63, " %u silver", spsplit);
	 msg += buf;
	 one = true;
  }
  if(cpsplit > 0) {
	 if(one)
	 	msg += ",";
	 //this message is not 100% accurate for the splitter
	 //if they are receiving any roundoff
	 snprintf(buf, 63, " %u copper", cpsplit);
	 msg += buf;
	 one = true;
  }
  msg += " as your split";
  
  for (i = 0; i < MAX_GROUP_MEMBERS; i++) { 
	  if (members[i] != NULL && members[i]->IsClient()) { // If Group Member is Client
	  	Client *c = members[i]->CastToClient();
		//I could not get MoneyOnCorpse to work, so we use this
		c->AddMoneyToPP(cpsplit, spsplit, gpsplit, ppsplit, true);
		  
		c->Message(2, msg.c_str());
	  }
  }
}

bool Group::AddMember(Mob* newmember)
{

#ifdef EQBOTS //EQOffline
	if(newmember->IsBot()) {
		int i;
		//Let's see if the bot is already in the group
		for(i=0; i<MAX_GROUP_MEMBERS; i++) {
			if(members[i] && !strcasecmp(members[i]->GetName(),newmember->GetName()))
				return false;
		}

		// Put the bot in the group
		for(i=0; i<MAX_GROUP_MEMBERS; i++) {
			if(members[i] == NULL) {
				members[i] = newmember;
				break;
			}
		}
		
		// We copy the bot name in the group at the slot of the bot
		strcpy(membername[i],newmember->GetName());
		newmember->SetGrouped(true);

		//build the template join packet
		EQApplicationPacket* outapp = new EQApplicationPacket(OP_GroupUpdate,sizeof(GroupJoin_Struct));
		GroupJoin_Struct* gj = (GroupJoin_Struct*) outapp->pBuffer;	
		strcpy(gj->membername, newmember->GetName());
		gj->action = groupActJoin;
		gj->leader_aas = LeaderAbilities;
		
		int z=1;
		for(i=0; i<MAX_GROUP_MEMBERS; i++) {
			if(members[i] && members[i]->IsClient()) {
				if(IsLeader(members[i])) {
					strcpy(gj->yourname,members[i]->GetName());
					strcpy(members[i]->CastToClient()->GetPP().groupMembers[0],members[i]->GetName());
					members[i]->CastToClient()->QueuePacket(outapp);
				}
				else {
					strcpy(members[i]->CastToClient()->GetPP().groupMembers[0+z],members[i]->GetName());
					members[i]->CastToClient()->QueuePacket(outapp);
				}
			}
			z++;
		}

		safe_delete(outapp);

		// Need to send this only once when a group is formed with a bot so the client knows it is also the group leader
		if(GroupCount() == 2)		{
			Mob *TempLeader = GetLeader();
			SendUpdate(groupActUpdate, TempLeader);
		}

		return true;
	}
#endif //EQBOTS end of EQoffline

	uint32 i=0;
	//see if they are allready in the group
	 for (i = 0; i < MAX_GROUP_MEMBERS; i++) {
		if(members[i] != NULL && !strcasecmp(members[i]->GetCleanName(), newmember->GetCleanName()))
			return false;
	}
	//put them in the group
	for (i = 0; i < MAX_GROUP_MEMBERS; i++) {
		if (members[i] == NULL) {
			members[i] = newmember;
			break;
		}
	}

	if (i == MAX_GROUP_MEMBERS)
		return false;

	strcpy(membername[i], newmember->GetCleanName());
	int x=1;
	
	//build the template join packet	
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_GroupUpdate,sizeof(GroupJoin_Struct));
	GroupJoin_Struct* gj = (GroupJoin_Struct*) outapp->pBuffer;	
	strcpy(gj->membername, newmember->GetCleanName());
	gj->action = groupActJoin;
//Angelox Start
	gj->leader_aas = LeaderAbilities;
	
	for (i = 0;i < MAX_GROUP_MEMBERS; i++) {
		if (members[i] != NULL && members[i] != newmember) {
			//fill in group join & send it
			strcpy(gj->yourname, members[i]->GetCleanName());

			if(members[i]->IsClient())
			{
				members[i]->CastToClient()->QueuePacket(outapp);
				//put new member into existing person's list
				strcpy(members[i]->CastToClient()->GetPP().groupMembers[this->GroupCount()-1], newmember->GetCleanName());
			}

			//put this existing person into the new member's list
			if(newmember->IsClient()) {
				if(IsLeader(members[i]))
					strcpy(newmember->CastToClient()->GetPP().groupMembers[0], members[i]->GetCleanName());
				else {
					strcpy(newmember->CastToClient()->GetPP().groupMembers[x], members[i]->GetCleanName());
					x++;
				}
			}
		}
	}

	//put new member in his own list.
	if(newmember->IsClient())
		strcpy(newmember->CastToClient()->GetPP().groupMembers[x], newmember->GetCleanName());

	newmember->SetGrouped(true);
	
	if(newmember->IsClient()) {
		newmember->CastToClient()->Save();
		database.SetGroupID(newmember->GetCleanName(), GetID(), newmember->CastToClient()->CharacterID());
		SendMarkedNPCsToMember(newmember->CastToClient());
	}
	
	safe_delete(outapp);
	return true;
}

void Group::QueuePacket(const EQApplicationPacket *app, bool ack_req)
{
	uint32 i;
	for(i = 0; i < MAX_GROUP_MEMBERS; i++)
		if(members[i] && members[i]->IsClient())
			members[i]->CastToClient()->QueuePacket(app, ack_req);
}

// solar: sends the rest of the group's hps to member.  this is useful when
// someone first joins a group, but otherwise there shouldn't be a need to
// call it
void Group::SendHPPacketsTo(Mob *member)
{
	if(member && member->IsClient())
	{
		EQApplicationPacket hpapp;
		EQApplicationPacket outapp(OP_MobManaUpdate, sizeof(MobManaUpdate_Struct));

		for (uint32 i = 0; i < MAX_GROUP_MEMBERS; i++)
		{
			if(members[i] && members[i] != member)
			{
				members[i]->CreateHPPacket(&hpapp);
				member->CastToClient()->QueuePacket(&hpapp, false);
				if(member->CastToClient()->GetClientVersion() >= EQClientSoD)
				{
					outapp.SetOpcode(OP_MobManaUpdate);
					MobManaUpdate_Struct *mmus = (MobManaUpdate_Struct *)outapp.pBuffer;
					mmus->spawn_id = members[i]->GetID();
					mmus->mana = members[i]->GetManaPercent();
					member->CastToClient()->QueuePacket(&outapp, false);
					MobEnduranceUpdate_Struct *meus = (MobEnduranceUpdate_Struct *)outapp.pBuffer;
					outapp.SetOpcode(OP_MobEnduranceUpdate);
					meus->endurance = members[i]->GetEndurancePercent();
					member->CastToClient()->QueuePacket(&outapp, false);
				}
			}
		}
	}
}

void Group::SendHPPacketsFrom(Mob *member)
{
	EQApplicationPacket hp_app;
	if(!member)
		return;

	member->CreateHPPacket(&hp_app);
	EQApplicationPacket outapp(OP_MobManaUpdate, sizeof(MobManaUpdate_Struct));
	uint32 i;
	for(i = 0; i < MAX_GROUP_MEMBERS; i++) {
		if(members[i] && members[i] != member && members[i]->IsClient())
		{
			members[i]->CastToClient()->QueuePacket(&hp_app);

			if(members[i]->CastToClient()->GetClientVersion() >= EQClientSoD)
			{
				outapp.SetOpcode(OP_MobManaUpdate);

				MobManaUpdate_Struct *mmus = (MobManaUpdate_Struct *)outapp.pBuffer;

				mmus->spawn_id = member->GetID();

				mmus->mana = member->GetManaPercent();

				members[i]->CastToClient()->QueuePacket(&outapp);

				MobEnduranceUpdate_Struct *meus = (MobEnduranceUpdate_Struct *)outapp.pBuffer;

				outapp.SetOpcode(OP_MobEnduranceUpdate);

				meus->endurance = member->GetEndurancePercent();

				members[i]->CastToClient()->QueuePacket(&outapp);

			}
		}
	}
}

//updates a group member's client pointer when they zone in
//if the group was in the zone allready
bool Group::UpdatePlayer(Mob* update){

	VerifyGroup();
	
	uint32 i=0;
	if(update->IsClient()) {
		//update their player profile
		PlayerProfile_Struct &pp = update->CastToClient()->GetPP();
		for (i = 0; i < MAX_GROUP_MEMBERS; i++) {
			if(membername[0] == '\0')
				memset(pp.groupMembers[i], 0, 64);
			else
				strncpy(pp.groupMembers[i], membername[i], 64);
		}
		if(IsNPCMarker(update->CastToClient()))
		{
			NPCMarkerID = update->GetID();
			SendLeadershipAAUpdate();
		}
	}
	
	for (i = 0; i < MAX_GROUP_MEMBERS; i++)
	{
		if (!strcasecmp(membername[i],update->GetName()))
		{
			members[i] = update;
			members[i]->SetGrouped(true);
			return true;
		}
	}
	return false;
}


void Group::MemberZoned(Mob* removemob) {
	uint32 i;

	if (removemob == NULL)
		return;

	if(removemob == GetLeader())
		SetLeader(NULL);

	 for (i = 0; i < MAX_GROUP_MEMBERS; i++) {
		  if (members[i] == removemob) {
				members[i] = NULL;
				//should NOT clear the name, it is used for world communication.
				break;
		  }
	 }
	 if(removemob->IsClient() && IsMainAssist(removemob->CastToClient()))
	 	SetGroupTarget(0);
}

bool Group::DelMemberOOZ(const char *Name) {

	if(!Name) return false;

	// If a member out of zone has disbanded, clear out their name.
	//
	for(unsigned int i = 0; i < MAX_GROUP_MEMBERS; i++) {
		if(!strcasecmp(Name, membername[i]))
			// This shouldn't be called if the member is in this zone.
			if(!members[i]) {
				if(!strncmp(GetLeaderName(), Name, 64))
				{
					//TODO: Transfer leadership if leader disbands OOZ.
					UpdateGroupAAs();
				}

				memset(membername[i], 0, 64);
				if(GroupCount() < 3)
				{
					DelegateMarkNPC(NULL);
					DelegateMainAssist(NULL);
					ClearAllNPCMarks();
				}
				return true;
			}
	}

	return false;
}

bool Group::DelMember(Mob* oldmember,bool ignoresender){
	if (oldmember == NULL){
		return false;
	}

#ifdef EQBOTS //marko
	if(oldmember->IsClient() && (oldmember == GetLeader())) {
		database.CleanBotLeader(oldmember->CastToClient()->CharacterID());
		database.DeleteFromBotTemp(oldmember->CastToClient()->CharacterID());
		if(oldmember->IsBotRaiding()) {
			BotRaids* br = entity_list.GetBotRaidByMob(oldmember);
			if(br) {
				br->RemoveRaidBots();
				br = NULL;
			}
		}
		Group *g = entity_list.GetGroupByMob(oldmember);
		if(g) {
			bool hasBots = false;
			for(int i=5; i>=0; i--) {
				if(g->members[i] && g->members[i]->IsBot()) {
					hasBots = true;
					g->members[i]->BotOwner = NULL;
					g->members[i]->BotZoned();
				}
			}
			if(hasBots) {
				hasBots = false;
				if(g->BotGroupCount() <= 1) {
					g->DisbandGroup();
				}
			}
		}
	}
#endif //EQBOTS

	for (uint32 i = 0; i < MAX_GROUP_MEMBERS; i++) {
		if (members[i] == oldmember) {
			members[i] = NULL;
			membername[i][0] = '\0';
			memset(membername[i],0,64);
			break;
		  }
	}

	//handle leader quitting group gracefully
	if (oldmember == GetLeader() && GroupCount() > 2) {
		for(uint32 nl = 0; nl < MAX_GROUP_MEMBERS; nl++) {
			if(members[nl]) {
				ChangeLeader(members[nl]);
				break;
			}
		}
	}

	ServerPacket* pack = new ServerPacket(ServerOP_GroupLeave, sizeof(ServerGroupLeave_Struct));
	ServerGroupLeave_Struct* gl = (ServerGroupLeave_Struct*)pack->pBuffer;
	gl->gid = GetID();
	gl->zoneid = zone->GetZoneID();
	gl->instance_id = zone->GetInstanceID();
	strcpy(gl->member_name, oldmember->GetName());
	worldserver.SendPacket(pack);
	safe_delete(pack);

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_GroupUpdate,sizeof(GroupJoin_Struct));
	GroupJoin_Struct* gu = (GroupJoin_Struct*) outapp->pBuffer;
	gu->action = groupActLeave;
	strcpy(gu->membername, oldmember->GetCleanName());
	strcpy(gu->yourname, oldmember->GetCleanName());

	gu->leader_aas = LeaderAbilities;

	for (uint32 i = 0; i < MAX_GROUP_MEMBERS; i++) {
		if (members[i] == NULL) {
			//if (DEBUG>=5) LogFile->write(EQEMuLog::Debug, "Group::DelMember() null member at slot %i", i);
			continue;
		}
		if (members[i] != oldmember) {
			strcpy(gu->yourname, members[i]->GetCleanName());
			if(members[i]->IsClient())
			members[i]->CastToClient()->QueuePacket(outapp);
		}
		#ifdef IPC
		if(members[i] == oldmember && members[i]->IsNPC() && members[i]->CastToNPC()->IsGrouped() && members[i]->CastToNPC()->IsInteractive()) {
			 members[i]->CastToNPC()->TakenAction(23,0);
		}
		#endif	
	}

	if (!ignoresender) {
		strcpy(gu->yourname,oldmember->GetCleanName());
		strcpy(gu->membername,oldmember->GetCleanName());
		gu->action = groupActLeave;

		if(oldmember->IsClient())
		oldmember->CastToClient()->QueuePacket(outapp);
	 }

	if(oldmember->IsClient())
		database.SetGroupID(oldmember->GetCleanName(), 0, oldmember->CastToClient()->CharacterID());
	
	oldmember->SetGrouped(false);
	disbandcheck = true;

	safe_delete(outapp);

	 if(oldmember->IsClient())
	 {
	 	if(IsMainAssist(oldmember->CastToClient()))
		{
	 		SetGroupTarget(0);
			UnDelegateMainAssist(oldmember->GetName());
		}
		SendMarkedNPCsToMember(oldmember->CastToClient(), true);
	}

#ifdef EQBOTS //Angelox
		Group *g = entity_list.GetGroupByMob(oldmember);
		if (oldmember->IsBot() && (!g)) {
		    oldmember->BotZoned();
		}
		else if(oldmember->IsBot() && (g)) {
		}
#endif //EQBOTS

	if(GroupCount() < 3)
	{
		DelegateMarkNPC(NULL);
		DelegateMainAssist(NULL);
		ClearAllNPCMarks();
	}

	return true;	
}

// does the caster + group
void Group::CastGroupSpell(Mob* caster, uint16 spell_id) {
	uint32 z;
	float range, distance;

	if(!caster)
		return;

	castspell = true;
	range = caster->GetAOERange(spell_id);
	
	float range2 = range*range;

//	caster->SpellOnTarget(spell_id, caster);

	for(z=0; z < MAX_GROUP_MEMBERS; z++)
	{
		if(members[z] == caster) {
			caster->SpellOnTarget(spell_id, caster);
#ifdef GROUP_BUFF_PETS
			if(caster->GetPet() && caster->GetAA(aaPetAffinity) && !caster->GetPet()->IsCharmed())
				caster->SpellOnTarget(spell_id, caster->GetPet());
#endif
		}
		else if(members[z] != NULL)
		{
			distance = caster->DistNoRoot(*members[z]);
			if(distance <= range2) {
				caster->SpellOnTarget(spell_id, members[z]);
#ifdef GROUP_BUFF_PETS
				if(members[z]->GetPet() && members[z]->GetAA(aaPetAffinity) && !members[z]->GetPet()->IsCharmed())
					caster->SpellOnTarget(spell_id, members[z]->GetPet());
#endif
			} else
				_log(SPELLS__CASTING, "Group spell: %s is out of range %f at distance %f from %s", members[z]->GetName(), range, distance, caster->GetName());
		}
	}

	castspell = false;
	disbandcheck = true;
}

// does the caster + group
void Group::GroupBardPulse(Mob* caster, uint16 spell_id) {
	uint32 z;
	float range, distance;

	if(!caster)
		return;

	castspell = true;
	range = caster->GetAOERange(spell_id);
	
	float range2 = range*range;

	for(z=0; z < MAX_GROUP_MEMBERS; z++) {
		if(members[z] == caster) {
			caster->BardPulse(spell_id, caster);
#ifdef GROUP_BUFF_PETS
			if(caster->GetPet() && caster->GetAA(aaPetAffinity) && !caster->GetPet()->IsCharmed())
				caster->BardPulse(spell_id, caster->GetPet());
#endif
		}
		else if(members[z] != NULL)
		{
			distance = caster->DistNoRoot(*members[z]);
			if(distance <= range2) {
				members[z]->BardPulse(spell_id, caster);
#ifdef GROUP_BUFF_PETS
				if(members[z]->GetPet() && members[z]->GetAA(aaPetAffinity) && !members[z]->GetPet()->IsCharmed())
					members[z]->GetPet()->BardPulse(spell_id, caster);
#endif
			} else
				_log(SPELLS__BARDS, "Group bard pulse: %s is out of range %f at distance %f from %s", members[z]->GetName(), range, distance, caster->GetName());
		}
	}
}

bool Group::IsGroupMember(Mob* client)
{
	bool Result = false;

	if(client) {
		for (uint32 i = 0; i < MAX_GROUP_MEMBERS; i++) {
			if (members[i] == client)
				Result = true;
		}
	}

	return Result;
}

bool Group::IsGroupMember(const char *Name)
{
	if(Name)
		for(uint32 i = 0; i < MAX_GROUP_MEMBERS; i++)
			if(!strncmp(membername[i], Name, sizeof(membername[0])))
				return true;

	return false;
}

void Group::GroupMessage(Mob* sender, int8 language, int8 lang_skill, const char* message) {
	uint32 i;
	for (i = 0; i < MAX_GROUP_MEMBERS; i++) {
		if(!members[i])
			continue;

		if (members[i]->IsClient() && members[i]->CastToClient()->GetFilter(FILTER_GROUP)!=0)
			members[i]->CastToClient()->ChannelMessageSend(sender->GetName(),members[i]->GetName(),2,language,lang_skill,message);
		#ifdef IPC
		if (members[i]->CastToNPC()->IsInteractive() && members[i] != sender)
			members[i]->CastToNPC()->InteractiveChat(2,1,message,(sender->GetTarget() != NULL) ? sender->GetTarget()->GetName():sender->GetName(),sender);
				//InteractiveChat(int8 chan_num, int8 language, const char * message, const char* targetname,Mob* sender);
  		 #endif
	}

	ServerPacket* pack = new ServerPacket(ServerOP_OOZGroupMessage, sizeof(ServerGroupChannelMessage_Struct) + strlen(message) + 1);
	ServerGroupChannelMessage_Struct* gcm = (ServerGroupChannelMessage_Struct*)pack->pBuffer;
	gcm->zoneid = zone->GetZoneID();
	gcm->groupid = GetID();
	gcm->instanceid = zone->GetInstanceID();
	strcpy(gcm->from, sender->GetName());
	strcpy(gcm->message, message);
	worldserver.SendPacket(pack);
	safe_delete(pack);	
}

int32 Group::GetTotalGroupDamage(Mob* other) {
	 int32 total = 0;

	uint32 i;
	for (i = 0; i < MAX_GROUP_MEMBERS; i++) {
		if(!members[i])
			continue;
		if (other->CheckAggro(members[i]))
			total += other->GetHateAmount(members[i],true);
	}
	return total;
}
/*
#ifdef EQBOTS
void Group::DisbandBots() { //polo2
	Client* c;
	if(c->IsBotRaiding()) {
		database.CleanBotLeader(c->CharacterID());
		//database.DeleteFromBotTemp(CharacterID());
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
					g->members[i]->BotOwner = NULL;
					g->members[i]->BotKill();
				}
			}
		  }
	  }
    }
#endif //EQBOTS
*/
void Group::DisbandGroup() { //polo
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_GroupUpdate,sizeof(GroupUpdate_Struct));
	GroupUpdate_Struct* gu = (GroupUpdate_Struct*) outapp->pBuffer;
	gu->action = groupActDisband;
	Client *Leader = NULL;
	uint32 i;
	for (i = 0; i < MAX_GROUP_MEMBERS; i++) {
		if (members[i] == NULL) {
			 continue;
		}
		if (members[i]->IsClient()) {
		    if(IsLeader(members[i]))
			Leader = members[i]->CastToClient();
			strcpy(gu->yourname, members[i]->GetName());
			database.SetGroupID(members[i]->GetName(), 0, members[i]->CastToClient()->CharacterID());
			members[i]->CastToClient()->QueuePacket(outapp);
			SendMarkedNPCsToMember(members[i]->CastToClient(), true);
		}

#ifdef EQBOTS
		if (members[i]->IsBot()) {
		  BotRaids *brd = entity_list.GetBotRaidByMob(Leader->CastToMob());
		  if(brd) {
			 brd->RemoveRaidBots();
			 brd = NULL;
			 Leader->Message(15, "Raid disbanded.");
			 Leader->SetBotRaidID(0);
			 Leader->SetBotRaiding(false);
			 database.CleanBotLeader(Leader->CharacterID());
			 members[i]->BotDepop();
		  }
		  else{
		    members[i]->BotDepop();
		  }
		  Leader->GetPTimers().Start(pTimerSpawnGroupReuse, 60);
		  Leader->GetPTimers().Start(pTimerSpawnRaidReuse, 60);
		  database.DeleteFromBotTemp(Leader->CharacterID());
		}
#endif //EQBOTS

		members[i]->SetGrouped(false);
		members[i] = NULL;
		membername[i][0] = '\0';
	}

	ClearAllNPCMarks();
	ServerPacket* pack = new ServerPacket(ServerOP_DisbandGroup, sizeof(ServerDisbandGroup_Struct));
	ServerDisbandGroup_Struct* dg = (ServerDisbandGroup_Struct*)pack->pBuffer;
	dg->zoneid = zone->GetZoneID();
	dg->groupid = GetID();
	dg->instance_id = zone->GetInstanceID();
	worldserver.SendPacket(pack);
	safe_delete(pack);	

	entity_list.RemoveGroup(GetID());
	if(GetID() != 0)
		 database.ClearGroup(GetID());

	if(Leader && (Leader->IsLFP())) {
		Leader->UpdateLFP();
	}

	safe_delete(outapp);
  }

bool Group::Process() {
	if(disbandcheck && !GroupCount())
		return false;
	else if(disbandcheck && GroupCount())
		disbandcheck = false;
	return true;
}

void Group::SendUpdate(int32 type, Mob* member)
{
	if(!member->IsClient())
		return;
	
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_GroupUpdate, sizeof(GroupUpdate2_Struct));
	GroupUpdate2_Struct* gu = (GroupUpdate2_Struct*)outapp->pBuffer;	
	gu->action = type;
	strcpy(gu->yourname,member->GetName());
	
	int x = 0;

	gu->leader_aas = LeaderAbilities;

	for (uint32 i = 0; i < MAX_GROUP_MEMBERS; ++i)
		if((members[i] != NULL) && IsLeader(members[i]))
		{
			strcpy(gu->leadersname, members[i]->GetName());
			break;
		}

	for (uint32 i = 0; i < MAX_GROUP_MEMBERS; ++i)
		if (members[i] != NULL && members[i] != member)
			strcpy(gu->membername[x++], members[i]->GetName());

	member->CastToClient()->QueuePacket(outapp);

	safe_delete(outapp);
}

void Group::SendLeadershipAAUpdate()
{
	// This method updates other members of the group in the current zone with the Leader's group leadership AAs.
	//
	// It is called when the leader purchases a leadership AA or enters a zone.
	//
	// If a group member is not in the same zone as the leader when the leader purchases a new AA, they will not become
	// aware of it until they are next in the same zone as the leader.

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_GroupUpdate,sizeof(GroupJoin_Struct));

	GroupJoin_Struct* gu = (GroupJoin_Struct*)outapp->pBuffer;	

	gu->action = groupActAAUpdate;
	
	uint32 i = 0;

	gu->leader_aas = LeaderAbilities;

	gu->NPCMarkerID = GetNPCMarkerID();
	
	for (i = 0;i < MAX_GROUP_MEMBERS; ++i)
		if(members[i] && members[i]->IsClient())
		{
			strcpy(gu->yourname, members[i]->GetName());
			strcpy(gu->membername, members[i]->GetName());
			members[i]->CastToClient()->QueuePacket(outapp);
		}

	safe_delete(outapp);
}

int8 Group::GroupCount() {

	int8 MemberCount = 0;

	for(uint8 i = 0; i < MAX_GROUP_MEMBERS; ++i)
		if(membername[i][0])
			++MemberCount;

	return MemberCount;
}

#ifdef EQBOTS
int Group::BotGroupCount() {
	int count = 0;
	for(int i=0; i<MAX_GROUP_MEMBERS; i++) {
		if(members[i] && (members[i]->GetMaxHP()>0))
			count++;
	}
	return count;
}
#endif //EQBOTS

int32 Group::GetHighestLevel()
{
int32 level = 1;
uint32 i;
	for (i = 0; i < MAX_GROUP_MEMBERS; i++)
	 {
		if (members[i])
		  {
			if(members[i]->GetLevel() > level)
				level = members[i]->GetLevel();
		  }
	}
	return level;
}
int32 Group::GetLowestLevel()
{
int32 level = 255;
uint32 i;
	for (i = 0; i < MAX_GROUP_MEMBERS; i++)
	 {
		if (members[i])
		  {
			if(members[i]->GetLevel() < level)
				level = members[i]->GetLevel();
		  }
	}
	return level;
}

void Group::TeleportGroup(Mob* sender, int32 zoneID, int16 instance_id, float x, float y, float z, float heading)
{
	uint32 i;
	 for (i = 0; i < MAX_GROUP_MEMBERS; i++)
	 {
	 #ifdef IPC
		if (members[i] != NULL && (members[i]->IsClient() || (members[i]->IsNPC() && members[i]->CastToNPC()->IsInteractive())) && members[i] != sender)
	 #else
		  if (members[i] != NULL && members[i]->IsClient() && members[i] != sender)
	 #endif
	 	{
			members[i]->CastToClient()->MovePC(zoneID, instance_id, x, y, z, heading, 0, ZoneSolicited);
		}
	}	
}

bool Group::LearnMembers() {
	char errbuf[MYSQL_ERRMSG_SIZE];
    char* query = 0;
	MYSQL_RES *result;
	MYSQL_ROW row;
	if (database.RunQuery(query,MakeAnyLenString(&query, "SELECT name FROM group_id WHERE groupid=%lu", (unsigned long)GetID()),
			      errbuf,&result)){
		safe_delete_array(query);
		if(mysql_num_rows(result) < 1) {	//could prolly be 2
			mysql_free_result(result);
			LogFile->write(EQEMuLog::Error, "Error getting group members for group %lu: %s", (unsigned long)GetID(), errbuf);
			return(false);
		}
		int i = 0;
		while((row = mysql_fetch_row(result))) {
			if(!row[0])
				continue;
			members[i] = NULL;
			strncpy(membername[i], row[0], 64);

			i++;
		}
		mysql_free_result(result);
	}

	return(true);
}

void Group::VerifyGroup() {
	/*
		The purpose of this method is to make sure that a group
		is in a valid state, to prevent dangling pointers.
		Only called every once in a while (on member re-join for now).
	*/

	uint32 i;
	for (i = 0; i < MAX_GROUP_MEMBERS; i++) {
		if (membername[i][0] == '\0') {
#if EQDEBUG >= 7
LogFile->write(EQEMuLog::Debug, "Group %lu: Verify %d: Empty.\n", (unsigned long)GetID(), i);
#endif
			members[i] = NULL;
			continue;
		}
		
		//it should be safe to use GetClientByName, but Group is trying
		//to be generic, so we'll go for general Mob
		Mob *them = entity_list.GetMob(membername[i]);
		if(them == NULL && members[i] != NULL) {	//they arnt here anymore....
#if EQDEBUG >= 6
		LogFile->write(EQEMuLog::Debug, "Member of group %lu named '%s' has disappeared!!", (unsigned long)GetID(), membername[i]);
#endif
			membername[i][0] = '\0';
			members[i] = NULL;
			continue;
		}
		
		if(them != NULL && members[i] != them) {	//our pointer is out of date... not so good.
#if EQDEBUG >= 5
		LogFile->write(EQEMuLog::Debug, "Member of group %lu named '%s' had an out of date pointer!!", (unsigned long)GetID(), membername[i]);
#endif
			members[i] = them;
			continue;
		}
#if EQDEBUG >= 8
		LogFile->write(EQEMuLog::Debug, "Member of group %lu named '%s' is valid.", (unsigned long)GetID(), membername[i]);
#endif
	}
}


void Group::GroupMessage_StringID(Mob* sender, int32 type, int32 string_id, const char* message,const char* message2,const char* message3,const char* message4,const char* message5,const char* message6,const char* message7,const char* message8,const char* message9, int32 distance) {
	uint32 i;
	for (i = 0; i < MAX_GROUP_MEMBERS; i++) {
		if(members[i] == NULL)
			continue;
		
		if(members[i] == sender)
			continue;
		
		members[i]->Message_StringID(type, string_id, message, message2, message3, message4, message5, message6, message7, message8, message9, 0);
	}
}



void Client::LeaveGroup() {  //polo

#ifdef EQBOTS
     if(database.GetBotOwner(this->GetNPCTypeID()) == CharacterID()){
	Mob *clientmob = CastToMob();
	database.CleanBotLeader(CharacterID());
	database.DeleteFromBotTemp(CharacterID());
	if(clientmob) {
		if(clientmob->IsBotRaiding()) {
			BotRaids* br = entity_list.GetBotRaidByMob(clientmob);
			if(br) {
				br->RemoveRaidBots();
				br = NULL;
			}
		}
		Group *g = entity_list.GetGroupByMob(clientmob);
		if(g) {
			bool hasBots = false;
			for(int i=5; i>=0; i--) {
				if(g->members[i] && g->members[i]->IsBot()) {
					hasBots = true;
					g->members[i]->BotOwner = NULL;
					g->members[i]->BotDepop();
				}
			}
			if(hasBots) {
				hasBots = false;
				if(g->BotGroupCount() <= 1) {
					g->DisbandGroup();
				}
			}
		}
	}
     }
#endif //EQBOTS

	Group *g = GetGroup();
	if (g) {
		if(g->GroupCount() < 3)
			g->DisbandGroup();
		else
			g->DelMember(this);
	} else {
		//force things a little
		database.SetGroupID(GetName(), 0, CharacterID());
	}
	
	isgrouped = false;
}

void Group::BalanceHP(sint32 penalty)
{
	int dmgtaken = 0, numMem = 0;
	unsigned int gi = 0;
	for(; gi < MAX_GROUP_MEMBERS; gi++)
	{
		if(members[gi]){
			dmgtaken += (members[gi]->GetMaxHP() - members[gi]->GetHP());
			numMem += 1;
		}
	}

	dmgtaken += dmgtaken * penalty / 100;
	dmgtaken /= numMem;
	for(gi = 0; gi < MAX_GROUP_MEMBERS; gi++)
	{
		if(members[gi]){
			if((members[gi]->GetMaxHP() - dmgtaken) < 1){ //this way the ability will never kill someone
				members[gi]->SetHP(1);					 //but it will come darn close
				members[gi]->SendHPUpdate();
			}
			else{
				members[gi]->SetHP(members[gi]->GetMaxHP() - dmgtaken);
				members[gi]->SendHPUpdate();
			}
		}
	}
}

uint16 Group::GetAvgLevel()
{
	double levelHolder = 0;
	uint8 i = 0;
	uint8 numMem = 0;
	while(i < MAX_GROUP_MEMBERS)
	{
		if (members[i])
		{
			numMem++;
			levelHolder = levelHolder + (members[i]->GetLevel());
		}
		i++;
	}
	levelHolder = ((levelHolder/numMem)+.5); // total levels divided by num of characters
	return (uint16(levelHolder));
}

void Group::MarkNPC(Mob* Target, int Number)
{
	// Send a packet to all group members in this zone causing the client to prefix the Target mob's name
	// with the specified Number.
	//
	if(!Target || Target->IsClient())
		return;

	if((Number < 1) || (Number > MAX_MARKED_NPCS))
		return;

	bool AlreadyMarked = false;

	int16 EntityID = Target->GetID();

	for(int i = 0; i < MAX_MARKED_NPCS; ++i)
		if(MarkedNPCs[i] == EntityID)
		{
			if(i == (Number - 1))
				return;

			MarkedNPCs[i] = 0;

			AlreadyMarked = true;

			break;
		}

	if(!AlreadyMarked)
	{
		if(MarkedNPCs[Number - 1])
		{
			Mob* m = entity_list.GetMob(MarkedNPCs[Number-1]);
			if(m)
				m->IsTargeted(-1);
		}

		if(EntityID)
		{
			Mob* m = entity_list.GetMob(Target->GetID());
			if(m)
				m->IsTargeted(1);
		}
	}

	MarkedNPCs[Number - 1] = EntityID;

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_MarkNPC, sizeof(MarkNPC_Struct));

	MarkNPC_Struct* mnpcs = (MarkNPC_Struct *)outapp->pBuffer;

	mnpcs->TargetID = EntityID;
	Mob *m = entity_list.GetMob(EntityID);

	if(m)
		sprintf(mnpcs->Name, "%s", m->GetCleanName());

	mnpcs->Number = Number;

	QueuePacket(outapp);

	safe_delete(outapp);
}

void Group::DelegateMainAssist(const char *NewMainAssistName)
{
	// This method is called when the group leader Delegates the Main Assist role to a member of the group
	// (or himself). All group members in the zone are notified of the new Main Assist and it is recorded
	// in the group_leaders table so as to persist across zones.
	//

	if(MainAssistName.size() > 0)
		UnDelegateMainAssist(MainAssistName.c_str());

	if(!NewMainAssistName)
		return;

	Client *c = entity_list.GetClientByName(NewMainAssistName);

	if(!c)
		return;

	if(c->GetTarget())
		TargetID = c->GetTarget()->GetID();
	else
		TargetID = 0;

	MainAssistName = NewMainAssistName;

	for(uint32 i = 0; i < MAX_GROUP_MEMBERS; ++i)
		if(members[i] && members[i]->IsClient())
			NotifyMainAssist(members[i]->CastToClient());

	char errbuff[MYSQL_ERRMSG_SIZE];

	char *Query = NULL;

	if (!database.RunQuery(Query, MakeAnyLenString(&Query, "UPDATE group_leaders SET assist='%s' WHERE gid=%i LIMIT 1",
						       NewMainAssistName, GetID()), errbuff))
		LogFile->write(EQEMuLog::Error, "Unable to set group main assist: %s\n", errbuff);

	safe_delete_array(Query);

}

void Group::NotifyMainAssist(Client *c)
{
	// Send a packet to the specified Client notifying them who the new Main Assist is. This causes the client to display
	// a message with the name of the Main Assist.
	//

	if(!c)
		return;

// 	if(!MainAssistName.size())
		return;

	if(c->GetClientVersion() < EQClientSoD)
	{
		EQApplicationPacket *outapp = new EQApplicationPacket(OP_DelegateAbility, sizeof(DelegateAbility_Struct));

		DelegateAbility_Struct* das = (DelegateAbility_Struct*)outapp->pBuffer;

		das->DelegateAbility = 0;

		das->MemberNumber = 0;

		das->Action = 0;

		das->EntityID = 0;

		strn0cpy(das->Name, MainAssistName.c_str(), sizeof(das->Name));

		c->QueuePacket(outapp);

		safe_delete(outapp);
	}
	else
	{
		EQApplicationPacket *outapp = new EQApplicationPacket(OP_GroupRoles, sizeof(GroupRole_Struct));
 
		GroupRole_Struct *grs = (GroupRole_Struct*)outapp->pBuffer;

		strn0cpy(grs->Name1, MainAssistName.c_str(), sizeof(grs->Name1));

		strn0cpy(grs->Name2, GetLeaderName(), sizeof(grs->Name2));

		grs->RoleNumber = 2;

		grs->Toggle = 1;

		c->QueuePacket(outapp);

		safe_delete(outapp);
	}

	NotifyTarget(c);

}

void Group::UnDelegateMainAssist(const char *OldMainAssistName)
{
	// Called when the group Leader removes the Main Assist delegation. Sends a packet to each group member in the zone
	// informing them of the change and update the group_leaders table.
	//
	EQApplicationPacket *outapp = new EQApplicationPacket(OP_DelegateAbility, sizeof(DelegateAbility_Struct));

	DelegateAbility_Struct* das = (DelegateAbility_Struct*)outapp->pBuffer;

	das->DelegateAbility = 0;

	das->MemberNumber = 0;

	das->Action = 1;

	das->EntityID = 0;

	strn0cpy(das->Name, OldMainAssistName, sizeof(das->Name));

	for(uint32 i = 0; i < MAX_GROUP_MEMBERS; ++i)
		if(members[i] && members[i]->IsClient())
			members[i]->CastToClient()->QueuePacket(outapp);

	safe_delete(outapp);

	char errbuff[MYSQL_ERRMSG_SIZE];

	char *Query = 0;

	if (!database.RunQuery(Query, MakeAnyLenString(&Query, "UPDATE group_leaders SET assist='' WHERE gid=%i LIMIT 1",
						       GetID()), errbuff))
		LogFile->write(EQEMuLog::Error, "Unable to clear group main assist: %s\n", errbuff);

	safe_delete_array(Query);

	MainAssistName.clear();
}

bool Group::IsMainAssist(Client *c)
{
	// Returns true if the specified client has been delegated the Main Assist role.
	//
	if(!c)
		return false;

	if(MainAssistName.size())
		return(c->GetName() == MainAssistName);

	return false;

}

bool Group::IsNPCMarker(Client *c)
{
	// Returns true if the specified client has been delegated the NPC Marker Role
	//
	if(!c)
		return false;

	if(NPCMarkerName.size())
		return(c->GetName() == NPCMarkerName);

	return false;

}

void Group::SetGroupTarget(int EntityID)
{
	// Notify all group members in the zone of the new target the Main Assist has selected.
	//
	TargetID = EntityID;

	for(uint32 i = 0; i < MAX_GROUP_MEMBERS; ++i)
		if(members[i] && members[i]->IsClient())
			NotifyTarget(members[i]->CastToClient());
}

void Group::NotifyTarget(Client *c)
{
	// Send a packet to the specified client notifying them of the group target selected by the Main Assist.

	if(!c)
		return;

	EQApplicationPacket* outapp = new EQApplicationPacket(OP_SetGroupTarget, sizeof(MarkNPC_Struct));

	MarkNPC_Struct* mnpcs = (MarkNPC_Struct *)outapp->pBuffer;

	mnpcs->TargetID = TargetID;

	mnpcs->Number = 0;

	c->QueuePacket(outapp);

	safe_delete(outapp);
	
}

void Group::DelegateMarkNPC(const char *NewNPCMarkerName)
{
	// Called when the group leader has delegated the Mark NPC ability to a group member.
	// Notify all group members in the zone of the change and save the change in the group_leaders
	// table to persist across zones.
	//
	if(NPCMarkerName.size() > 0)
		UnDelegateMarkNPC(NPCMarkerName.c_str());

	if(!NewNPCMarkerName)
		return;

	SetNPCMarker(NewNPCMarkerName);

	for(uint32 i = 0; i < MAX_GROUP_MEMBERS; ++i)
		if(members[i] && members[i]->IsClient())
			NotifyMarkNPC(members[i]->CastToClient());

	char errbuff[MYSQL_ERRMSG_SIZE];

	char *Query = 0;

	if (!database.RunQuery(Query, MakeAnyLenString(&Query, "UPDATE group_leaders SET marknpc='%s' WHERE gid=%i LIMIT 1",
						       NewNPCMarkerName, GetID()), errbuff))
		LogFile->write(EQEMuLog::Error, "Unable to set group mark npc: %s\n", errbuff);

	safe_delete_array(Query);

}

void Group::NotifyMarkNPC(Client *c)
{
	// Notify the specified client who the group member is who has been delgated the Mark NPC ability.

	if(!c)
		return;

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_DelegateAbility, sizeof(DelegateAbility_Struct));

	DelegateAbility_Struct* das = (DelegateAbility_Struct*)outapp->pBuffer;

	das->DelegateAbility = 1;

	das->MemberNumber = 0;

	das->Action = 0;

	das->EntityID = NPCMarkerID;

	strn0cpy(das->Name, NPCMarkerName.c_str(), sizeof(das->Name));

	c->QueuePacket(outapp);

	safe_delete(outapp);

}
void Group::SetNPCMarker(const char *NewNPCMarkerName)
{
	NPCMarkerName = NewNPCMarkerName;

	Client *m = entity_list.GetClientByName(NPCMarkerName.c_str());

	if(!m)
		NPCMarkerID = 0;
	else
		NPCMarkerID = m->GetID();
}

void Group::UnDelegateMarkNPC(const char *OldNPCMarkerName)
{
	// Notify all group members in the zone that the Mark NPC ability has been rescinded from the specified
	// group member.

	if(!OldNPCMarkerName)
		return;

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_DelegateAbility, sizeof(DelegateAbility_Struct));

	DelegateAbility_Struct* das = (DelegateAbility_Struct*)outapp->pBuffer;

	das->DelegateAbility = 1;

	das->MemberNumber = 0;

	das->Action = 1;

	das->EntityID = 0;

	strn0cpy(das->Name, OldNPCMarkerName, sizeof(das->Name));

	for(uint32 i = 0; i < MAX_GROUP_MEMBERS; ++i)
		if(members[i] && members[i]->IsClient())
			members[i]->CastToClient()->QueuePacket(outapp);

	safe_delete(outapp);

	NPCMarkerName.clear();

	char errbuff[MYSQL_ERRMSG_SIZE];

	char *Query = 0;

	if (!database.RunQuery(Query, MakeAnyLenString(&Query, "UPDATE group_leaders SET marknpc='' WHERE gid=%i LIMIT 1",
						       GetID()), errbuff))
		LogFile->write(EQEMuLog::Error, "Unable to clear group marknpc: %s\n", errbuff);

	safe_delete_array(Query);
}

void Group::SaveGroupLeaderAA()
{
	// Stores the Group Leaders Leadership AA data from the Player Profile as a blob in the group_leaders table.
	// This is done so that group members not in the same zone as the Leader still have access to this information.

	char *Query = new char[200 + sizeof(GroupLeadershipAA_Struct)*2];

	char *End = Query;
	
	End += sprintf(End, "UPDATE group_leaders SET leadershipaa='");
	
	End += database.DoEscapeString(End, (char*)&LeaderAbilities, sizeof(GroupLeadershipAA_Struct));

	End += sprintf(End,"' WHERE gid=%i LIMIT 1", GetID());

	char errbuff[MYSQL_ERRMSG_SIZE];
	if (!database.RunQuery(Query, End - Query, errbuff))
		LogFile->write(EQEMuLog::Error, "Unable to store LeadershipAA: %s\n", errbuff);
	
	safe_delete_array(Query);
}

void Group::UnMarkNPC(int16 ID)
{
	// Called from entity_list when the mob with the specified ID is being destroyed.
	//
	// If the given mob has been marked by this group, it is removed from the list of marked NPCs.
	// The primary reason for doing this is so that when a new group member joins or zones in, we
	// send them correct details of which NPCs are currently marked.

	if(TargetID == ID)
		TargetID = 0;

	for(int i = 0; i < MAX_MARKED_NPCS; ++i)
		if(MarkedNPCs[i] == ID)
			MarkedNPCs[i] = 0;

}

void Group::SendMarkedNPCsToMember(Client *c, bool Clear)
{
	// Send the Entity IDs of the NPCs marked by the Group Leader or delegate to the specified client.
	// If Clear == true, then tell the client to unmark the NPCs (when a member disbands).
	//
	//
	if(!c)
		return;

	EQApplicationPacket *outapp = new EQApplicationPacket(OP_MarkNPC, sizeof(MarkNPC_Struct));

	MarkNPC_Struct *mnpcs = (MarkNPC_Struct *)outapp->pBuffer;

	for(int i = 0; i < MAX_MARKED_NPCS; ++i)
	{
		if(MarkedNPCs[i])
		{
			mnpcs->TargetID = MarkedNPCs[i];
			Mob *m = entity_list.GetMob(MarkedNPCs[i]);

			if(m)
				sprintf(mnpcs->Name, "%s", m->GetCleanName());

			if(!Clear)
				mnpcs->Number = i + 1;
			else
				mnpcs->Number = 0;

			c->QueuePacket(outapp);
		}
	}

	safe_delete(outapp);
}

void Group::ClearAllNPCMarks()
{
	// This method is designed to be called when the number of members in the group drops below 3 and leadership AA
	// may no longer be used. It removes all NPC marks.
	//
	for(uint8 i = 0; i < MAX_GROUP_MEMBERS; ++i)
		if(members[i] && members[i]->IsClient())
			SendMarkedNPCsToMember(members[i]->CastToClient(), true);

	for(int i = 0; i < MAX_MARKED_NPCS; ++i)
	{
		if(MarkedNPCs[i])
		{
			Mob* m = entity_list.GetMob(MarkedNPCs[i]);

			if(m)
				m->IsTargeted(-1);
		}

		MarkedNPCs[i] = 0;
	}

}

void Group::UpdateGroupAAs()
{
	// This method updates the Groups Leadership abilities from the Player Profile of the Leader.
	//
	Mob *m = GetLeader();

	if(m && m->IsClient())
		m->CastToClient()->GetGroupAAs(&LeaderAbilities);
	else
		memset(&LeaderAbilities, 0, sizeof(GroupLeadershipAA_Struct));

	SaveGroupLeaderAA();
}

void Group::QueueHPPacketsForNPCHealthAA(Mob* sender, const EQApplicationPacket* app)
{
	// Send a mobs HP packets to group members if the leader has the NPC Health AA and the mob is the
	// target of the group's main assist, or is marked, and the member doesn't already have the mob targeted.

	if(!sender || !app || !GetLeadershipAA(groupAANPCHealth))
		return;

	int16 SenderID = sender->GetID();

	if(SenderID != TargetID)
	{
		bool Marked = false;

		for(int i = 0; i < MAX_MARKED_NPCS; ++i)
		{
			if(MarkedNPCs[i] == SenderID)
			{
				Marked = true;
				break;
			}
		}

		if(!Marked)
			return;

	}

	for(unsigned int i = 0; i < MAX_GROUP_MEMBERS; ++i)
		if(members[i] && members[i]->IsClient())
		{
			if(!members[i]->GetTarget() || (members[i]->GetTarget()->GetID() != SenderID))
			{
				members[i]->CastToClient()->QueuePacket(app);
			}
		}

}

void Group::ChangeLeader(Mob* newleader)
{
	// this changes the current group leader, notifies other members, and updates leadship AA

	// if the new leader is invalid, do nothing
	if (!newleader) 
		return;
	
	Mob* oldleader = GetLeader();
	
	EQApplicationPacket* outapp = new EQApplicationPacket(OP_GroupUpdate,sizeof(GroupJoin_Struct));
	GroupJoin_Struct* gu = (GroupJoin_Struct*) outapp->pBuffer;
	gu->action = groupActMakeLeader;
	
	strcpy(gu->membername, newleader->GetName());
	strcpy(gu->yourname, oldleader->GetName());
	SetLeader(newleader);
	database.SetGroupLeaderName(GetID(), newleader->GetName());
	UpdateGroupAAs();
	gu->leader_aas = LeaderAbilities;
	for (uint32 i = 0; i < MAX_GROUP_MEMBERS; i++) {
		if (members[i] && members[i]->IsClient())
		{
			if(members[i]->CastToClient()->GetClientVersion() >= EQClientSoD)
				members[i]->CastToClient()->SendGroupLeaderChangePacket(newleader->GetName());
			else
				members[i]->CastToClient()->QueuePacket(outapp);
		}
	}
	safe_delete(outapp);
}

