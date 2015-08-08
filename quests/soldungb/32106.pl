sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32022,32074,32022,32022,32022);
  quest::spawn2($a,0,0,-385,-1552,26,0);
  }
  sub EVENT_SIGNAL {
  if ($signal == 638{
  quest::depopall(32022);
  quest::depopall(32074);
  quest::depop();
  }
  }