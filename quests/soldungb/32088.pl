sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32084,32085,32086,32087,32084,32085,32086,32087,32109,32110,32084,32085,32086,32087,32084,32085,32086,32087,32110);
  quest::spawn2($a,0,0,-364,-546.3,-60.2,58.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 632){
  quest::depop(32110);
  quest::depop(32109);
  quest::depop(32084);
  quest::depop(32085);
  quest::depop(32086);
  quest::depop(32087);
  quest::depop();
  }
  }
