sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111233,111238,111280,111281,111233,111238,111233,111238,111281,111233,111238,111233,111238,111233,111238,111233,111238);
  quest::spawn2($a,4,0,127.5,776.9,177.4,41.1);
  }
  sub EVENT_SIGNAL {
  if ($signal == 401){
  quest::depop(111280);
  quest::depop(111281);
  quest::depop(111233);
  quest::depop(111238);
  quest::depop();
  }
  }