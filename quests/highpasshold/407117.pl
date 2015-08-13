sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(407118,407120,407121,407122,407123,407118,407124,407125,407126,407119);
  quest::spawn2($a,2241165,0,164.4,1110.7,-99.4,185.8);
  }
  sub EVENT_SIGNAL {
  if ($signal == 402){
  quest::depop(407118);
  quest::depop(407199);
  quest::depop();
  }
  }