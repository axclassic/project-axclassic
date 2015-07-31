sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32077,32095,32096,32045,32097,32095,32096,32045,32097);
  quest::spawn2($a,0,0,-345,-652,-69,50);
  }
  sub EVENT_SIGNAL {
  if ($signal == 635){
  quest::depop();
  }
  }