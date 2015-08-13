sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(44117,44119,44119,44119,44119,44119,44117,44119,44119,44119,44119,44119,44115);
  quest::spawn2($a,0,0,-222,-35,-10.7,62.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 4412){
  quest::depop(44115);
  quest::depop(44117);
  quest::depop(44119);
  quest::depop();
  }
  }