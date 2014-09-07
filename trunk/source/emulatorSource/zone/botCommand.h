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
 
#ifndef botCommand_h
#define botCommand_h

  enum{ //Raid Groups
      nogroup,
      agroup,
      bgroup,
      cgroup
  };

//General Variables
	Mob *t = c->GetTarget();
	Mob *target = c->GetTarget();
	int BotLevel = c->GetLevel();
	bool Special = (RuleB(EQOffline, AXCustom));
	int classicStat = database.Classic2012Lookup();
	int charID = c->CharacterID();
	uint8 RaidSpawned = nogroup;
	
	bool HasKarma = false;
	if(database.GetKarma(c->AccountID()) >=10000)
	  HasKarma = true;
	 
	//int32 kaRma = 0;
	//check for extra clients in group
	/*c->SetHasClient(false);
	bool HasClienT = database.CountClients(c->CharacterID());
	if(HasClienT){ 
	    c->SetHasClient(true);
	}*/
	
	//c->SetBotIsZoning(false);

//End General Variables
	
	std::string TempErrorMessage;
	
#endif