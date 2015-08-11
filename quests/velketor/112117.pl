sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112106,112107,112108,112109,112110,112111,112112,112113,112114,112115,112106,112107,112108,112109,112110,112111,112112,112113,112114,112115,112103);
  quest::spawn2($a,0,0,-76,270,-187.1,71.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 202){
  quest::depop(112103);
  quest::depop(112106);
  quest::depop(112107);
  quest::depop(112108);
  quest::depop(112109);
  quest::depop(112110);
  quest::depop(112111);
  quest::depop(112112);
  quest::depop(112113);
  quest::depop(112114);
  quest::depop(112115);
  quest::depop();
  }
  }