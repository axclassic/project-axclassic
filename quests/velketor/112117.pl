sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112106,112107,112108,112109,112110,112111,112112,112113,112114,112115,112106,112107,112108,112109,112110,112111,112112,112113,112114,112115,112103);
  quest::spawn2($a,0,0,-76,270,-187.1,71.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 202){
  quest::depopall(112103);
  quest::depopall(112106);
  quest::depopall(112107);
  quest::depopall(112108);
  quest::depopall(112109);
  quest::depopall(112110);
  quest::depopall(112111);
  quest::depopall(112112);
  quest::depopall(112113);
  quest::depopall(112114);
  quest::depopall(112115);
  quest::depop();
  }
  }