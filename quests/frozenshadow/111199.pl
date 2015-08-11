sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111250,111059,111250,111250,111250,111250,111059,111250,111250,111250,111250,111250,111250,111250,111250,111250,111180);
  quest::spawn2($a,0,0,-346,925,3.8,233.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 409){
  quest::depop(111180);
  quest::depop(111250);
  quest::depop(111059);
  quest::depop();
  }
  }