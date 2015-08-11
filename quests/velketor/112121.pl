sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112131,112137,112143,112149,112155,112161,112167,112173,112179,112185,112131,112137,112143,112149,112155,112161,112167,112173,112179,112185,112126);
  quest::spawn2($a,0,0,60,303,35.5,213);
  }
  sub EVENT_SIGNAL {
  if ($signal == 204){
  quest::depop(112126);
  quest::depop(112131);
  quest::depop(112137);
  quest::depop(112143);
  quest::depop(112149);
  quest::depop(112155);
  quest::depop(112161);
  quest::depop(112167);
  quest::depop(112173);
  quest::depop(112179);
  quest::depop(112185);
  quest::depop();
  }
  }