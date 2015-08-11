sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111276,111263,111263,111263,111263,111263,111276,111263,111263,111263,111263,111263,111263,111263,111263,111263,111231);
  quest::spawn2($a,0,0,155.4,1085.7,193.1,63.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 422){
  quest::depop(111231);
  quest::depop(111276);
  quest::depop(111263);
  quest::depop();
  }
  }