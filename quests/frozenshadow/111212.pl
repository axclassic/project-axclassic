sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111276,111263,111263,111263,111263,111263,111276,111263,111263,111263,111263,111263,111263,111263,111263,111263,111231);
  quest::spawn2($a,0,0,155.4,1085.7,193.1,63.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 422){
  quest::depopall(111231);
  quest::depopall(111276);
  quest::depopall(111263);
  quest::depop();
  }
  }