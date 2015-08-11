sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111274,111261,111261,111261,111261,111261,111274,111261,111261,111261,111261,111261,111261,111261,111261,111261,111229);
  quest::spawn2($a,0,0,89.8,969.7,178.1,11.6);
  }
  sub EVENT_SIGNAL {
  if ($signal == 420){
  quest::depop(111229);
  quest::depop(111274);
  quest::depop(111261);
  quest::depop();
  }
  }