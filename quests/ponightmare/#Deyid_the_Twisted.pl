
sub EVENT_SPAWN {

   quest::setnexthpevent(61);
   
  }
sub EVENT_HP {
   quest::spawn2(204351,0,0,922,1028,275.2);
   quest::spawn2(204351,0,0,947,1117,272.5);
   quest::spawn2(204351,0,0,1031,1164,271.3);
   quest::spawn2(204351,0,0,1121,1154,275.3);
   quest::spawn2(204351,0,0,1206,1067,278.3);
   quest::spawn2(204351,0,0,1063,1251,278.2);
   quest::settimer(1,30);     # Timer to spawn targetable treants 30 seconds after untargetables are spawned #    
  }

sub EVENT_TIMER {
  if ($timer == 1) {
   quest::depopall(204351); # Despawn untargetable treants #  # Spawn the targetable treants
   quest::spawn2(204352,0,0,922,1028,275.2);
   quest::spawn2(204352,0,0,947,1117,272.5);
   quest::spawn2(204352,0,0,1031,1164,271.3);
   quest::spawn2(204352,0,0,1121,1154,275.3);
   quest::spawn2(204352,0,0,1206,1067,278.3);
   quest::spawn2(204352,0,0,1063,1251,278.2);
  }
 }
sub EVENT_DEATH {
   $client->Message(14,"An eerie silence settles onto the forest as Deyid the Twisted slumps over, defeated");
   quest::signalwith(204347, 5, 1); # Send signal # 5 to Seilaen 1 second after death #
   quest::stoptimer(1);     # Prevent treants from respawning as targetable if killed quickly #    
}
