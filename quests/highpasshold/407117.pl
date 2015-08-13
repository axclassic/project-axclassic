sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(407118,407120,407121,407122,407123,407118,407124,407125,407126,407119);
  quest::spawn2($a,2241165,0,172.6,1113.3,-99.8,182.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 402){
  quest::depop(407118);
  quest::depop(407199);
  quest::depop();
  }
  }