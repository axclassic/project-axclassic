sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112133,112139,112145,112151,112157,112163,112169,112175,112181,112187,112133,112139,112145,112151,112157,112163,112169,112175,112181,112187,112128);
  quest::spawn2($a,0,0,8,256,-14.4,215.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 206){
  quest::depop(112128);
  quest::depop(112133);
  quest::depop(112139);
  quest::depop(112145);
  quest::depop(112151);
  quest::depop(112157);
  quest::depop(112163);
  quest::depop(112169);
  quest::depop(112175);
  quest::depop(112181);
  quest::depop(112187);
  quest::depop();
  }
  }