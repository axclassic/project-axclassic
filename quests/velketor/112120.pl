sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112119,112136,112142,112148,112154,112160,112166,112172,112178,112184,112119,112136,112142,112148,112154,112160,112166,112172,112178,112184,112118);
  quest::spawn2($a,1,0,-63,382,-118.1,241);
  }
  sub EVENT_SIGNAL {
  if ($signal == 203){
  quest::depopall(112118);
  quest::depopall(112119);
  quest::depopall(112136);
  quest::depopall(112142);
  quest::depopall(112148);
  quest::depopall(112154);
  quest::depopall(112160);
  quest::depopall(112166);
  quest::depopall(112172);
  quest::depopall(112178);
  quest::depopall(112184);
  quest::depop();
  }
  }