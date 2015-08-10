sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111272,111259,111259,111259,111259,111259,111272,111259,111259,111259,111259,111259,111259,111259,111259,111259,111227);
  quest::spawn2($a,0,0,103.4,1112.6,178.1,254.8);
  }
  sub EVENT_SIGNAL {
  if ($signal == 418){
  quest::depopall(111227);
  quest::depopall(111272);
  quest::depopall(111259);
  quest::depop();
  }
  }