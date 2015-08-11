sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111275,111262,111262,111262,111262,111262,111275,111262,111262,111262,111262,111262,111262,111262,111262,111262,111230);
  quest::spawn2($a,0,0,194.4,1085.2,193.1,190.2);
  }
  sub EVENT_SIGNAL {
  if ($signal == 421){
  quest::depop(111230);
  quest::depop(111275);
  quest::depop(111262);
  quest::depop();
  }
  }