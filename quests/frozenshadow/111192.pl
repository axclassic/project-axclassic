sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111234,111239,111216,111243,111234,111239,111234,111239,111243,111234,111239,111234,111239,111234,111239,111234,111239);
  quest::spawn2($a,0,0,357,1071,177.4,0);
  }
  sub EVENT_SIGNAL {
  if ($signal == 402){
  quest::depop(111216);
  quest::depop(111243);
  quest::depop(111234);
  quest::depop(111239);
  quest::depop();
  }
  }