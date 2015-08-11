sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112202,112202,112202,1122202,112202,112202,112202,112202,112202,112105);
  quest::spawn2($a,0,0,-4,476,6,254);
  }
  sub EVENT_SIGNAL {
  if ($signal == 201){
  quest::depop(112105);
  quest::depop(112202);
  quest::depop();
  }
  }