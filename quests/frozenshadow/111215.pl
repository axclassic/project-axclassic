sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111295,111279,111279,111279,111279,111279,111295,111279,111279,111279,111279,111279,111279,111279,111279,111279,111294);
  quest::spawn2($a,0,0,866,511,23.7,255.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 425){
  quest::depop(111294);
  quest::depop(111295);
  quest::depop(111279);
  quest::depop();
  }
  }