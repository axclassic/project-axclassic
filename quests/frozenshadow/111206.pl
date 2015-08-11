sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111270,111257,111257,111257,111257,111257,111270,111257,111257,111257,111257,111257,111257,111257,111257,111257,111225);
  quest::spawn2($a,0,0,119.5,1125.3,178.1,192.6);
  }
  sub EVENT_SIGNAL {
  if ($signal == 416){
  quest::depop(111225);
  quest::depop(111270);
  quest::depop(111257);
  quest::depop();
  }
  }