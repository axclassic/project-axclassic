sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111167,111251,111251,111251,111251,111251,111167,111251,111251,111251,111251,111251,111251,111251,111251,111251,111183);
  quest::spawn2($a,0,0,93.1,1167,178,191.6);
  }
  sub EVENT_SIGNAL {
  if ($signal == 410){
  quest::depop(111183);
  quest::depop(111251);
  quest::depop(111167);
  quest::depop();
  }
  }