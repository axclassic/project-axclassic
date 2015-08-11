sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32041,32080,32041,32041,32041);
  quest::spawn2($a,23,0,-825,-1449,88.7,0);
  }
  sub EVENT_SIGNAL {
  if ($signal == 640){
  quest::depop(32041);
  quest::depop(32080);
  quest::depop();
  }
  }