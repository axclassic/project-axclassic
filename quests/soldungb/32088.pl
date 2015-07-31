sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32081,32066,32084,32085,32086,32087,32084,32085,32086,32087);
  quest::spawn2($a,0,0,-364,-546.3,-60.2,58.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 632){
  quest::depop();
  }
  }