sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111273,111260,111260,111260,111260,111260,111273,111260,111260,111260,111260,111260,111260,111260,111260,111260,111228);
  quest::spawn2($a,0,0,117.8,1080.1,178.1,196.6);
  }
  sub EVENT_SIGNAL {
  if ($signal == 419){
  quest::depopall(111228);
  quest::depopall(111273);
  quest::depopall(111260);
  quest::depop();
  }
  }