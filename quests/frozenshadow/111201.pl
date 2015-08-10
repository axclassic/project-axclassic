sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111265,111252,111252,111252,111252,111252,111265,111252,111252,111252,111252,111252,111252,111252,111252,111252,111220);
  quest::spawn2($a,0,0,162,1127,194,130);
  }
  sub EVENT_SIGNAL {
  if ($signal == 411){
  quest::depopall(111220);
  quest::depopall(111265);
  quest::depopall(111252);
  quest::depop();
  }
  }