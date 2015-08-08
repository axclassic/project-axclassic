sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102103,102149,102150,102149,102150,102149,102150,102103,102149,102150,102128);
  quest::spawn2($a,0,0,-152.1,55.4,19.9,192);
  }
  sub EVENT_SIGNAL {
  if ($signal == 106){
  quest::depop();
  }
  }