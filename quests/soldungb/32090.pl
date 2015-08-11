sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32089,32111,32112,32089,32089,32089,32111,32089,32089);
  quest::spawn2($a,12,0,-155,-725.1,-91,223);
  }
  sub EVENT_SIGNAL {
  if ($signal == 633){
  quest::depop(32089);
  quest::depop(32111);
  quest::depop(32112);
  quest::depop();
  }
  }