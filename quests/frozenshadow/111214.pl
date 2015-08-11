sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111154,111278,111278,111278,111278,111278,111154,111278,111278,111278,111278,111278,111278,111278,111278,111278,111185);
  quest::spawn2($a,0,0,20.6,253.1,354,1.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 424){
  quest::depop(111185);
  quest::depop(111154);
  quest::depop(111278);
  quest::depop();
  }
  }