sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112119,112136,112142,112148,112154,112160,112166,112172,112178,112184,112119,112136,112142,112148,112154,112160,112166,112172,112178,112184,112118);
  quest::spawn2($a,1,0,-63,382,-118.1,241);
  }
  sub EVENT_SIGNAL {
  if ($signal == 203){
  quest::depop(112118);
  quest::depop(112119);
  quest::depop(112136);
  quest::depop(112142);
  quest::depop(112148);
  quest::depop(112154);
  quest::depop(112160);
  quest::depop(112166);
  quest::depop(112172);
  quest::depop(112178);
  quest::depop(112184);
  quest::depop();
  }
  }