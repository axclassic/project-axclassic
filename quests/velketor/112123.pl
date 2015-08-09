sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112133,112139,112145,1122151,112157,112163,112169,112175,112181,112187,112133,112139,112145,1122151,112157,112163,112169,112175,112181,112187,112128);
  quest::spawn2($a,0,0,8,256,-14.4,215.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 206){
  quest::depopall(112128);
  quest::depopall(112133);
  quest::depopall(112139);
  quest::depopall(112145);
  quest::depopall(112151);
  quest::depopall(112157);
  quest::depopall(112163);
  quest::depopall(112169);
  quest::depopall(112175);
  quest::depopall(112181);
  quest::depopall(112187);
  quest::depop();
  }
  }