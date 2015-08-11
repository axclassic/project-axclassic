sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112135,112141,112147,112153,112159,112165,112171,112177,112183,112189,112135,112141,112147,112153,112159,112165,112171,112177,112183,112189,112130);
  quest::spawn2($a,0,0,-111,470,-186,18.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 208){
  quest::depop(112130);
  quest::depop(112135);
  quest::depop(112141);
  quest::depop(112147);
  quest::depop(112153);
  quest::depop(112159);
  quest::depop(112165);
  quest::depop(112171);
  quest::depop(112177);
  quest::depop(112183);
  quest::depop(112189);
  quest::depop();
  }
  }