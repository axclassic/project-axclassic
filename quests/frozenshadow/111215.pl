sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111132,111279,111279,111279,111279,111279,111132,111279,111279,111279,111279,111279,111279,111279,111279,111279,111186);
  quest::spawn2($a,0,0,866,511,23.7,255.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 425){
  quest::depop(111186);
  quest::depop(111132);
  quest::depop(111279);
  quest::depop();
  }
  }