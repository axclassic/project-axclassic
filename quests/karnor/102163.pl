sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102206,102184,102185,102186,102187,102206,102184,102185,102186,102187,102184,102185,102186,102187,102184,102185,102186,102187,102184,102185,102186,102187,102184,102185,102186,102187,102199);
  quest::spawn2($a,0,0,-383,116,5.6,192);
  }
  sub EVENT_SIGNAL {
  if ($signal == 114){
  quest::depopall(102199);
  quest::depopall(102206);
  quest::depopall(102184);
  quest::depopall(102185);
  quest::depopall(102186);
  quest::depopall(102187);
  quest::depop();
  }
  }