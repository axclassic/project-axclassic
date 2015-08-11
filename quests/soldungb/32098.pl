sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32115,32095,32096,32097,32116,32095,32096,32097,32116,32095,32096,32097);
  quest::spawn2($a,0,0,-345,-652,-69,50);
  }
  sub EVENT_SIGNAL {
  if ($signal == 635){
  quest::depop(32115);
  quest::depop(32116);
  quest::depop(32095);
  quest::depop(32096);
  quest::depop(32097);
  quest::depop();
  }
  }