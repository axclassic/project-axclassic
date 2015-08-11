sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102208,102192,102193,102194,102208,102192,102193,102194,102192,102193,102194,102192,102193,102194,102192,102193,102194,102192,102193,102194,102201);
  quest::spawn2($a,0,0,-520.6,102.1,3.7,64);
  }
  sub EVENT_SIGNAL {
  if ($signal == 116){
  quest::depop(102201);
  quest::depop(102208);
  quest::depop(102192);
  quest::depop(102193);
  quest::depop(102194);
  quest::depop();
  }
  }