##This is the final Warden Havnar 317143 the one that spawns the orb for epic and gives progression flag##
sub EVENT_SPAWN {
       my $curhp = $npc->GetHP();
  my $HealPoints = -600600;
  $npc->SetHP($curhp + $HealPoints);
  }
sub EVENT_DEATH {
   quest::setglobal("FHanvar", 1, 5, "F");
   quest::spawn2(317087,0,0,484,4389.9,208.6,195.4);
   $client->Message(14,"You recieve a character flag!");
  }