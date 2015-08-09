sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112135,112141,112147,1122153,112159,112165,112171,112177,112183,112189,112135,112141,112147,1122153,112159,112165,112171,112177,112183,112189,112130);
  quest::spawn2($a,0,0,52,310,-68.4,221.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 208){
  quest::depopall(112130);
  quest::depopall(112135);
  quest::depopall(112141);
  quest::depopall(112147);
  quest::depopall(112153);
  quest::depopall(112159);
  quest::depopall(112165);
  quest::depopall(112171);
  quest::depopall(112177);
  quest::depopall(112183);
  quest::depopall(112189);
  quest::depop();
  }
  }