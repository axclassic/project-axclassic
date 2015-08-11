sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111285,111247,111247,111247,111247,111247,111285,111247,111247,111247,111247,111247,11285,111247,111247,111247,111284);
  quest::spawn2($a,0,0,206.7,970,185.1,218.9);
  }
  sub EVENT_SIGNAL {
  if ($signal == 407){
  quest::depop(111285);
  quest::depop(111284);
  quest::depop(111247);
  quest::depop();
  }
  }