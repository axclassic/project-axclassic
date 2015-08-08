sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102011,102012,102011,102012,102008,102132,102011,102012,102011,102012,102011,102012);
  quest::spawn2($a,0,0,-237.6,12,3.7,64);
  }
  sub EVENT_SIGNAL {
  if ($signal == 103){
  quest::depop();
  }
  }