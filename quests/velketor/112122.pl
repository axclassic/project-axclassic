sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112132,112138,112144,112150,112156,112162,112168,112174,112180,112186,112132,112138,112144,112150,112156,112162,112168,112174,112180,112186,112127);
  quest::spawn2($a,0,0,-112,479,87.3,154.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 205){
  quest::depop(112127);
  quest::depop(112132);
  quest::depop(112138);
  quest::depop(112144);
  quest::depop(112150);
  quest::depop(112156);
  quest::depop(112162);
  quest::depop(112168);
  quest::depop(112174);
  quest::depop(112180);
  quest::depop(112186);
  quest::depop();
  }
  }