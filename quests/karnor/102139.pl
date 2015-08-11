sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102140,102137,102140,102137,102141,102142,102140,102137,102140,102137,102140,102137);
  quest::spawn2($a,0,0,-237.6,12,3.7,64);
  }
  sub EVENT_SIGNAL {
  if ($signal == 103){
  quest::depop(102141);
  quest::depop(102140);
  quest::depop(102137);
  quest::depop(102142);
  quest::depop();
  }
  }