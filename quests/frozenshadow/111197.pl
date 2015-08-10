sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111163,111247,111247,111247,111247,111247,111163,111247,111247,111247,111247,111247,111163,111247,111247,111247,111177);
  quest::spawn2($a,0,0,206.7,970,185.1,218.9);
  }
  sub EVENT_SIGNAL {
  if ($signal == 407){
  quest::depopall(111163);
  quest::depopall(111177);
  quest::depopall(111247);
  quest::depop();
  }
  }