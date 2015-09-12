sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(159703,159703,159703,159703,159703,159702,159703,159703,159703,159703,159702,);
  quest::spawn2($a,0,0,-230,-436,198.9,44);
  }
  sub EVENT_SIGNAL {
  if ($signal == 159){
  quest::depop(159702);
  quest::depop(159703);
  quest::depop();
  }
  }
