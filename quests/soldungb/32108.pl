sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32125,32126,32125,32125,32125);
  quest::spawn2($a,23,0,-825,-1449,88.7,0);
  }
  sub EVENT_SIGNAL {
  if ($signal == 640){
  quest::depop(32125);
  quest::depop(32126);
  quest::depop();
  }
  }