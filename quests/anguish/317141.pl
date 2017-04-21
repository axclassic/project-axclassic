##Warden Hanvar 317141 is third of four killable versions of Warden Hanvar##
sub EVENT_SPAWN {
       my $curhp = $npc->GetHP();
  my $HealPoints = -400400;
  $npc->SetHP($curhp + $HealPoints);
quest::setnexthpevent(25);
}
 sub EVENT_HP {
 if($hpevent == 25){
 	   quest::signalwith(317146,505,0);
  }
 }