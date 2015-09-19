sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(158313,158313,158313,158313,158313,158313,158313,158313,158313,158314);
  quest::spawn2($a,0,0,957,0,12.5,191.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 315){
  quest::depop(158313);
  quest::depop(158314);
  quest::depop();
  }
  }
