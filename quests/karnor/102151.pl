sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102046,102152,102153,102152,102153,102046,102152,102153,102152,102153,102152,102153,102127);
  quest::spawn2($a,0,0,-109.7,145.7,34.8,192);
  }
  sub EVENT_SIGNAL {
  if ($signal == 107){
  quest::depop();
  }
  }