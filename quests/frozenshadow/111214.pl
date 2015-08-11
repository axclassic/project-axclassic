sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111293,111278,111278,111278,111278,111278,111293,111278,111278,111278,111278,111278,111278,111278,111278,111278,111292);
  quest::spawn2($a,0,0,20.6,253.1,354,1.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 424){
  quest::depop(111292);
  quest::depop(111293);
  quest::depop(111278);
  quest::depop();
  }
  }