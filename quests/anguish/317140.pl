##Warden Hanvar 317140 is second of four killable versions of Warden Hanvar##
sub EVENT_SPAWN {
       my $curhp = $npc->GetHP();
  my $HealPoints = -200200;
  $npc->SetHP($curhp + $HealPoints);
quest::setnexthpevent(50);
}
 sub EVENT_HP {
 if($hpevent == 50){
 	   quest::signalwith(317146,504,0);
  }
 }