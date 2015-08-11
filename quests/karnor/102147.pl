sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102214,102214,102214,102214,102214,102214,102214,102214,102214,102213);
  quest::spawn2($a,0,0,-778,-91,11.6,64);
  }
  sub EVENT_SIGNAL {
  if ($signal == 105){
  quest::depop(102213);
  quest::depop(102214);
  quest::depop();
  }
  }