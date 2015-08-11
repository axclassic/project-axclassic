sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111283,111283,111283,111283,111283,111283,111283,111283,111283,111282);
  quest::spawn2($a,0,0,-154,452,222.9,125);
  }
  sub EVENT_SIGNAL {
  if ($signal == 406){
  quest::depop(111282);
  quest::depop(111283);
  quest::depop();
  }
  }