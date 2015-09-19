sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(158310,158310,158310,158310,158310,158310,158310,158310,158310,158311);
  quest::spawn2($a,0,0,855,-472,122.1,64);
  }
  sub EVENT_SIGNAL {
  if ($signal == 312){
  quest::depop(158310);
  quest::depop(158311);
  quest::depop();
  }
  }
