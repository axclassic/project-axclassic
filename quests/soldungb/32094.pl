sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32113,32091,32092,32114,32091,32092,32114,32091,32092);
  quest::spawn2($a,0,0,-322,-590,-74,26.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 634){
  quest::depop(32091);
  quest::depop(32092);
  quest::depop(32113);
  quest::depop(32114);
  quest::depop();
  }
  }