sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111233,111238,111181,111160,111233,111238,111233,111238,111160,111233,111238,111233,111238,111233,111238,111233,111238);
  quest::spawn2($a,4,0,127.5,776.9,177.4,41.1);
  }
  sub EVENT_SIGNAL {
  if ($signal == 401){
  quest::depop(111181);
  quest::depop(111160);
  quest::depop(111233);
  quest::depop(111238);
  quest::depop();
  }
  }