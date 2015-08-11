sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102112,102112,102112,102112,102112,102112,102112,102112,102112,102133);
  quest::spawn2($a,0,0,-778,-91,11.6,64);
  }
  sub EVENT_SIGNAL {
  if ($signal == 105){
  quest::depop(102133);
  quest::depop(102112);
  quest::depop();
  }
  }