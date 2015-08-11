sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112192,112193,112194,112195,112196,112197,112198,112199,112200,112201,112192,112193,112194,112195,112196,112197,112198,112199,112200,112201,112191);
  quest::spawn2($a,2,0,124,373,-186,155);
  }
  sub EVENT_SIGNAL {
  if ($signal == 209){
  quest::depop(112191);
  quest::depop(112192);
  quest::depop(112193);
  quest::depop(112194);
  quest::depop(112195);
  quest::depop(112196);
  quest::depop(112197);
  quest::depop(112198);
  quest::depop(112199);
  quest::depop(112200);
  quest::depop(112201);
  quest::depop();
  }
  }