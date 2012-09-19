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
#include <assert.h>
#include <stdlib.h>
#include <math.h>
#include "masterentity.h"
#include "../common/linked_list.h"
#include "../common/rulesys.h"
#include "hate_list.h"

HateList::HateList()
{
}

HateList::~HateList()
{
}

// neotokyo: added for frenzy support
// checks if target still is in frenzy mode
void HateList::CheckFrenzyHate()
{
    LinkedListIterator<tHateEntry*> iterator(list);
    iterator.Reset();
	while(iterator.MoreElements())
    {
        if (iterator.GetData()->ent->GetHPRatio() >= 20)
            iterator.GetData()->bFrenzy = false;
        iterator.Advance();
    }
}

void HateList::Wipe()
{
	LinkedListIterator<tHateEntry*> iterator(list);
	iterator.Reset();

	while(iterator.MoreElements()) {
		Mob* m = iterator.GetData()->ent;

        	iterator.RemoveCurrent();

		if(m->IsClient())
			m->CastToClient()->DecrementAggroCount();
	}
}

bool HateList::IsOnHateList(Mob *mob)    
{    
	if (Find(mob))    
		return true;    
	return false;    
} 

tHateEntry *HateList::Find(Mob *ent)
{
	_ZP(HateList_Find);
    LinkedListIterator<tHateEntry*> iterator(list);
    iterator.Reset();
	while(iterator.MoreElements())
    {
        if (iterator.GetData()->ent == ent)
            return iterator.GetData();
        iterator.Advance();
    }
	return NULL;
}

void HateList::Set(Mob* other, int32 in_hate, int32 in_dam)
{
    tHateEntry *p = Find(other);
    if (p)
    {
		if (in_dam > 0)
        	p->damage = in_dam;
		if (in_hate > 0)
    		p->hate = in_hate;
    }
}

Mob* HateList::GetDamageTop(Mob* hater)
{
	_ZP(HateList_GetDamageTop);
	Mob* current = NULL;
	Group* grp = NULL;
	Raid* r = NULL;
	int32 dmg_amt = 0;

    LinkedListIterator<tHateEntry*> iterator(list);
    iterator.Reset();
	while(iterator.MoreElements())
    {
		grp = NULL;
		r = NULL;

		if(iterator.GetData()->ent && iterator.GetData()->ent->IsClient()){
			r = entity_list.GetRaidByClient(iterator.GetData()->ent->CastToClient());
		}

        grp = entity_list.GetGroupByMob(iterator.GetData()->ent);

		if(iterator.GetData()->ent && r){
			if(r->GetTotalRaidDamage(hater) >= dmg_amt)
			{
				current = iterator.GetData()->ent;
				dmg_amt = r->GetTotalRaidDamage(hater);
			}
		}
		else if (iterator.GetData()->ent != NULL && grp != NULL)
        {
			if (grp->GetTotalGroupDamage(hater) >= dmg_amt)
            {
				current = iterator.GetData()->ent;
				dmg_amt = grp->GetTotalGroupDamage(hater);
            }
        }
        else if (iterator.GetData()->ent != NULL && (int32)iterator.GetData()->damage >= dmg_amt)
        {
			current = iterator.GetData()->ent;
			dmg_amt = iterator.GetData()->damage;
        }
        iterator.Advance();
    }
	return current;
}

Mob* HateList::GetClosest(Mob *hater) {
	_ZP(HateList_GetClosest);
	Mob* close = NULL;
	float closedist = 99999.9f;
	float thisdist;
	
    LinkedListIterator<tHateEntry*> iterator(list);
    iterator.Reset();
	while(iterator.MoreElements()) {
		thisdist = iterator.GetData()->ent->DistNoRootNoZ(*hater);
		if(iterator.GetData()->ent != NULL && thisdist <= closedist) {
			closedist = thisdist;
			close = iterator.GetData()->ent;
		}
        iterator.Advance();
	}
	
	if (close == 0 && hater->IsNPC())
		close = hater->CastToNPC()->GetHateTop();
	
	return close;
}


// neotokyo: a few comments added, rearranged code for readability
void HateList::Add(Mob *ent, sint32 in_hate, sint32 in_dam, bool bFrenzy, bool iAddIfNotExist)
{
	if(!ent)
        return;

	if(ent->IsCorpse())
		return;

    tHateEntry *p = Find(ent);
    if (p)
    {
		p->damage+=in_dam;
		p->hate+=in_hate;
        p->bFrenzy = bFrenzy;
    }
	else if (iAddIfNotExist) {
        p = new tHateEntry;
        p->ent = ent;
        p->damage = in_dam;
        p->hate = in_hate;
        p->bFrenzy = bFrenzy;
        list.Append(p);

	if(ent->IsClient())
		ent->CastToClient()->IncrementAggroCount();
    }
}

bool HateList::RemoveEnt(Mob *ent)
{
	bool found = false;
	LinkedListIterator<tHateEntry*> iterator(list);
	iterator.Reset();

	while(iterator.MoreElements())
	{
		if (iterator.GetData()->ent == ent)
		{
			iterator.RemoveCurrent();
			found = true;

			if(ent->IsClient())
				ent->CastToClient()->DecrementAggroCount();

        	}
		else
			iterator.Advance();
	}
	return found;
}

void HateList::DoFactionHits(sint32 nfl_id) {
	_ZP(HateList_DoFactionHits);
	if (nfl_id <= 0)
		return;
    LinkedListIterator<tHateEntry*> iterator(list);
    iterator.Reset();
	while(iterator.MoreElements())
    {
        Client *p;

        if (iterator.GetData()->ent && iterator.GetData()->ent->IsClient())
            p = iterator.GetData()->ent->CastToClient();
        else
            p = NULL;

        if (p)
			p->SetFactionLevel(p->CharacterID(), nfl_id, p->GetBaseClass(), p->GetBaseRace(), p->GetDeity());
        iterator.Advance();
    }
}

Mob *HateList::GetTop(Mob *center)
{
	_ZP(HateList_GetTop);
	Mob* top = NULL;
	sint32 hate = -1;
	
	if (RuleB(Aggro,SmartAggroList)){
		Mob* topClientInRange = NULL;
		sint32 hateClientInRange = -1;
		LinkedListIterator<tHateEntry*> iterator(list);
		iterator.Reset();
		while(iterator.MoreElements())
		{
    		tHateEntry *cur = iterator.GetData();
			sint16 aggroMod = 0;

			if(!cur){
				iterator.Advance();
				continue;
			}			

			if(!cur->ent){
				iterator.Advance();
				continue;
			}

			if(cur->ent->DivineAura() || cur->ent->IsMezzed() || cur->ent->IsFeared()){
				if(hate == -1)
				{
					top = cur->ent;
					hate = 0;
				}
				iterator.Advance();
				continue;
			}

			sint32 currentHate = cur->hate;

			if(cur->ent->IsClient()){
				
				if(cur->ent->CastToClient()->IsSitting()){
					aggroMod += RuleI(Aggro, SittingAggroMod);
				}

				if(center){
					if(center->GetTarget() == cur->ent)
						aggroMod += RuleI(Aggro, CurrentTargetAggroMod);
					if(RuleI(Aggro, MeleeRangeAggroMod) != 0)
					{
						if(center->CombatRange(cur->ent)){
							aggroMod += RuleI(Aggro, MeleeRangeAggroMod);

							if(currentHate > hateClientInRange || cur->bFrenzy){
								hateClientInRange = currentHate;
								topClientInRange = cur->ent;
							}
						}
					}
				}

			}
			else{
				if(center){
					if(center->GetTarget() == cur->ent)
						aggroMod += RuleI(Aggro, CurrentTargetAggroMod);
					if(RuleI(Aggro, MeleeRangeAggroMod) != 0)
					{
						if(center->CombatRange(cur->ent)){
							aggroMod += RuleI(Aggro, MeleeRangeAggroMod);
						}
					}
				}
			}

			if(cur->ent->GetMaxHP() != 0 && ((cur->ent->GetHP()*100/cur->ent->GetMaxHP()) < 20)){
				aggroMod += RuleI(Aggro, CriticallyWoundedAggroMod);
			}

			if(aggroMod){
				currentHate += (currentHate * aggroMod / 100);
			}

			if(currentHate > hate || cur->bFrenzy){
				hate = currentHate;
				top = cur->ent;
			}

			iterator.Advance();
		}

		if(topClientInRange != NULL && top != NULL) {
			bool isTopClientType = top->IsClient();
#ifdef EQBOTS
			if(!isTopClientType) {
				if(top->IsBot()) {
					isTopClientType = true;
					topClientInRange = top;
				}
			}
#endif //EQBOTS
			if(!isTopClientType)
				return topClientInRange;
		else
			return top;
		}
	}
	else{
		LinkedListIterator<tHateEntry*> iterator(list);
		iterator.Reset();
		while(iterator.MoreElements())
		{
    		tHateEntry *cur = iterator.GetData();
			if(cur->ent != NULL && ((cur->hate > hate) || cur->bFrenzy ))
			{
				top = cur->ent;
				hate = cur->hate;
			}
			iterator.Advance();
		}
		return top;
	}
}

Mob *HateList::GetMostHate(){
	_ZP(HateList_GetMostHate);

	Mob* top = NULL;
	sint32 hate = -1;

	LinkedListIterator<tHateEntry*> iterator(list);
	iterator.Reset();
	while(iterator.MoreElements())
	{
		tHateEntry *cur = iterator.GetData();
		if(cur->ent != NULL && (cur->hate > hate))
		{
			top = cur->ent;
			hate = cur->hate;
		}
		iterator.Advance();
	}
	return top;
}


Mob *HateList::GetRandom()
{
    int count = 0;
    LinkedListIterator<tHateEntry*> iterator(list);
    iterator.Reset();
	while(iterator.MoreElements())
    {
        iterator.Advance();
        count++;
    }
	if(!count)
		return NULL;

    int random = rand()%count;
    iterator.Reset();
    for (int i = 0; i < random-1; i++)
        iterator.Advance();
    return iterator.GetData()->ent;
}

sint32 HateList::GetEntHate(Mob *ent, bool damage)
{
	tHateEntry *p;

    p = Find(ent);
	
	if ( p && damage)
        return p->damage;
	else if (p)
		return p->hate;
	else
		return 0;
}

//looking for any mob with hate > -1
bool HateList::IsEmpty() {
	_ZP(HateList_IsEmpty);
	
	return(list.Count() == 0);
}

// Prints hate list to a client
void HateList::PrintToClient(Client *c)
{
	LinkedListIterator<tHateEntry*> iterator(list);
	iterator.Reset();
	while (iterator.MoreElements())
	{
		tHateEntry *e = iterator.GetData();
		c->Message(0, "- name: %s, damage: %d, hate: %d",
			(e->ent && e->ent->GetName()) ? e->ent->GetName() : "(null)",
			e->damage, e->hate);

		iterator.Advance();
	}
}

int HateList::AreaRampage(Mob *caster, Mob *target)
{
	if(!target || !caster)
		return 0;

	int ret = 0;
	LinkedListIterator<tHateEntry*> iterator(list);
	iterator.Reset();
	while (iterator.MoreElements())
	{
		tHateEntry *h = iterator.GetData();
		iterator.Advance();		
		if(h && h->ent && h->ent != caster)
		{
			if(caster->CombatRange(h->ent))
			{
				caster->Attack(h->ent);
				++ret;
			}
		}
	}
	return ret;
}

std::list<tHateEntry*> HateList::GetHateList()
{
	std::list<tHateEntry*> hlist;
	LinkedListIterator<tHateEntry*> iterator(list); 
	iterator.Reset();
	while(iterator.MoreElements()) 
	{
		tHateEntry *ent = iterator.GetData();
		hlist.push_back(ent);
		iterator.Advance();
	}
	return hlist;
}