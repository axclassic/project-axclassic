sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(407108,407110,407111,407112,407113,407108,407114,407115,407116,407109);
  quest::spawn2($a,2241161,0,79.7,797.4,-97.4,130.2);
  }
  sub EVENT_SIGNAL {
  if ($signal == 401){
  quest::depop(407108);
  quest::depop(407109);
  quest::depop();
  }
  }