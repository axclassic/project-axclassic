sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102203,102173,102174,102175,102203,102173,102174,102175,102173,102174,102175,102173,102174,102175,102173,102174,102175,102173,102174,102175,102196);
  quest::spawn2($a,0,0,-426,175.5,3.7,128);
  }
  sub EVENT_SIGNAL {
  quest::depop(102196);
  quest::depop(102203);
  quest::depop(102173);
  quest::depop(102174);
  quest::depop(102175);
  if ($signal == 111){
  quest::depop();
  }
  }