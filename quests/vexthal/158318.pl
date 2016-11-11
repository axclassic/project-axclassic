sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(158316,158316,158316,158316,158316,158316,158316,158316,158316,158317);
  quest::spawn2($a,0,0,1933,3,122.14,191);
  }
  sub EVENT_SIGNAL {
  if ($signal == 318){
  quest::depop(158316);
  quest::depop(158317);
  quest::depop();
  }
  }
