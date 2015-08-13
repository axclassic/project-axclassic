sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(5136,5138,5138,5138,5137,5138,5138,5138,5138,5138,5135);
  quest::spawn2($a,19,0,84.1,527.7,31.1,118.4);
  }
  sub EVENT_SIGNAL {
  if ($signal == 501){
  quest::depop(5136);
  quest::depop(5137);
  quest::depop(5138);
  quest::depop();
  }
  }