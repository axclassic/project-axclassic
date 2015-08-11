sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102206,102184,102185,102186,102187,102206,102184,102185,102186,102187,102184,102185,102186,102187,102184,102185,102186,102187,102184,102185,102186,102187,102184,102185,102186,102187,102199);
  quest::spawn2($a,0,0,-383,116,5.6,192);
  }
  sub EVENT_SIGNAL {
  if ($signal == 114){
  quest::depop(102199);
  quest::depop(102206);
  quest::depop(102184);
  quest::depop(102185);
  quest::depop(102186);
  quest::depop(102187);
  quest::depop();
  }
  }