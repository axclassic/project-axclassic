sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32079,32091,32092,32059,32094,32091,32092,32059,32094);
  quest::spawn2($a,0,0,-322,-590,-74,26.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 634){
  quest::depop();
  }
  }