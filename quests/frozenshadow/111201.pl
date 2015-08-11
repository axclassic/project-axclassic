sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111265,111252,111252,111252,111252,111252,111265,111252,111252,111252,111252,111252,111252,111252,111252,111252,111220);
  quest::spawn2($a,0,0,162,1127,194,130);
  }
  sub EVENT_SIGNAL {
  if ($signal == 411){
  quest::depop(111220);
  quest::depop(111265);
  quest::depop(111252);
  quest::depop();
  }
  }