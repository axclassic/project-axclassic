sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(44116,44118,44118,44118,44118,44118,44116,44118,44118,44118,44118,44118,44114);
  quest::spawn2($a,0,0,105,353,3.7,127);
  }
  sub EVENT_SIGNAL {
  if ($signal == 4411){
  quest::depop(44114);
  quest::depop(44116);
  quest::depop(44118);
  quest::depop();
  }
  }
