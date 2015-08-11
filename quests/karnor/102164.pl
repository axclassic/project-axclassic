sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102207,102188,102189,102190,102191,102207,102188,102189,102190,102191,102188,102189,102190,102191,102188,102189,102190,102191,102188,102189,102190,102191,102188,102189,102190,102191,102200);
  quest::spawn2($a,0,0,-520.4,78.1,5.6,64);
  }
  sub EVENT_SIGNAL {
  if ($signal == 115){
  quest::depop(102200);
  quest::depop(102207);
  quest::depop(102188);
  quest::depop(102189);
  quest::depop(102190);
  quest::depop(102191);
  quest::depop();
  }
  }