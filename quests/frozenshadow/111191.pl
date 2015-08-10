sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111233,111238,111181,111160,111233,111238,111233,111238,111160,111233,111238,111233,111238,111233,111238,111233,111238);
  quest::spawn2($a,4,0,127.5,776.9,177.4,41.1);
  }
  sub EVENT_SIGNAL {
  if ($signal == 401){
  quest::depopall(111181);
  quest::depopall(111160);
  quest::depopall(111233);
  quest::depopall(111238);
  quest::depop();
  }
  }