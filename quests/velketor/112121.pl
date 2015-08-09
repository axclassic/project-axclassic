sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112131,112137,112143,112149,112155,112161,112167,112173,112179,112185,112131,112137,112143,112149,112155,112161,112167,112173,112179,112185,112126);
  quest::spawn2($a,0,0,60,303,35.5,213);
  }
  sub EVENT_SIGNAL {
  if ($signal == 204){
  quest::depopall(112126);
  quest::depopall(112131);
  quest::depopall(112137);
  quest::depopall(112143);
  quest::depopall(112149);
  quest::depopall(112155);
  quest::depopall(112161);
  quest::depopall(112167);
  quest::depopall(112173);
  quest::depopall(112179);
  quest::depopall(112185);
  quest::depop();
  }
  }