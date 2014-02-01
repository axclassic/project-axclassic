#NPC: #Ferik_Soulstealer   Zone: Tox
#by Qadar

sub EVENT_SPAWN{
  quest::setnexthpevent(75);
}

sub EVENT_HP{
  if ($hpevent == 75){                    #Summon a minion when HP drops to 75%
    quest::shout("I cannot be defeated!  Come to my side, minions!");
    quest::spawn2(38204,0,0,$npc->GetX()+10,$npc->GetY()-10,$npc->GetZ(),152.5);
    quest::setnexthpevent(55);
  }
  if ($hpevent == 55){                    #Summon another minion when HP drops to 55%
    quest::shout("You are doomed!  You have yet to see my true powers!");
    quest::spawn2(38204,0,0,$npc->GetX()-10,$npc->GetY()+10,$npc->GetZ(),152.5);
    quest::setnexthpevent(35);
  }
  if ($hpevent == 35){                    #Summon another minion when HP drops to 35%
    quest::shout("My servants will destroy you!  You will soon be dead, mortal!");
    quest::spawn2(38204,0,0,$npc->GetX(),$npc->GetY()+20,$npc->GetZ(),152.5);
    quest::setnexthpevent(15);
  }
  if ($hpevent == 15){                    #Summon 3 more minions when almost dead (15%)
    quest::shout("Fool, my army of the undead will be more powerful than you can imagine!  You cannot defeat us all!");
    quest::spawn2(38204,0,0,$npc->GetX(),$npc->GetY()-15,$npc->GetZ(),152.5);
    quest::spawn2(38204,0,0,$npc->GetX(),$npc->GetY()+15,$npc->GetZ(),152.5);
    quest::spawn2(38204,0,0,$npc->GetX()+15,$npc->GetY(),$npc->GetZ(),152.5);
  }
}

sub EVENT_DEATH{
  quest::say("No!  How could this be!  How could I be defeated my such an insignificant $race as yourself!  My studies in necromancy will not be wasted!  I will return one day to finish what I started!");
  quest::emote("drops to the ground, dead.  With his death, his power over his undead servants is broken.");
  quest::depopall(38204);                 #Despawn all minions still up
}
