sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111163,111247,111247,111247,111247,111247,111163,111247,111247111247,111247,111247,111163,111247,111247,111247,111184);
  quest::spawn2($a,0,0,103.5,1112.6,175.9,254.9);
  }
  sub EVENT_SIGNAL {
  if ($signal == 407){
  quest::depopall(111163);
  quest::depopall(111184);
  quest::depopall(111247);
  quest::depop();
  }
  }