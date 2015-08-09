sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112192,112193,112194,1122195,112196,112197,112198,112199,112200,112201,112192,112193,112194,1122195,112196,112197,112198,112199,112200,112201,112191);
  quest::spawn2($a,2,0,124,373,-186,155);
  }
  sub EVENT_SIGNAL {
  if ($signal == 209){
  quest::depopall(112191);
  quest::depopall(112192);
  quest::depopall(112193);
  quest::depopall(112194);
  quest::depopall(112195);
  quest::depopall(112196);
  quest::depopall(112197);
  quest::depopall(112198);
  quest::depopall(112199);
  quest::depopall(112200);
  quest::depopall(112201);
  quest::depop();
  }
  }