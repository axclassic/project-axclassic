sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111250,111289,111250,111250,111250,111250,111289,111250,111250,111250,111250,111250,111250,111250,111250,111250,111288);
  quest::spawn2($a,0,0,-346,925,3.8,233.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 409){
  quest::depop(111288);
  quest::depop(111250);
  quest::depop(111289);
  quest::depop();
  }
  }