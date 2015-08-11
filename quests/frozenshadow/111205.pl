sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111269,111256,111256,111256,111256,111256,111269,111256,111256,111256,111256,111256,111256,111256,111256,111256,111224);
  quest::spawn2($a,0,0,422,1126.9,178.1,155);
  }
  sub EVENT_SIGNAL {
  if ($signal == 415){
  quest::depop(111224);
  quest::depop(111269);
  quest::depop(111256);
  quest::depop();
  }
  }