sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111031,111031,111031,111031,111031,111031,111031,111031,111031,111184);
  quest::spawn2($a,0,0,-154,452,222.9,125);
  }
  sub EVENT_SIGNAL {
  if ($signal == 406){
  quest::depopall(111184);
  quest::depopall(111031);
  quest::depop();
  }
  }