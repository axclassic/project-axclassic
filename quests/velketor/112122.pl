sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112132,112138,112144,1122150,112156,112162,112168,112174,112180,112186,112132,112138,112144,1122150,112156,112162,112168,112174,112180,112186,112127);
  quest::spawn2($a,0,0,-112,479,87.3,154.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 205){
  quest::depopall(112127);
  quest::depopall(112132);
  quest::depopall(112138);
  quest::depopall(112144);
  quest::depopall(112150);
  quest::depopall(112156);
  quest::depopall(112162);
  quest::depopall(112168);
  quest::depopall(112174);
  quest::depopall(112180);
  quest::depopall(112186);
  quest::depop();
  }
  }