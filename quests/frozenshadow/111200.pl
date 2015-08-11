sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111291,111251,111251,111251,111251,111251,111291,111251,111251,111251,111251,111251,111251,111251,111251,111251,111290);
  quest::spawn2($a,0,0,93.1,1167,178,191.6);
  }
  sub EVENT_SIGNAL {
  if ($signal == 410){
  quest::depop(111290);
  quest::depop(111251);
  quest::depop(111291);
  quest::depop();
  }
  }