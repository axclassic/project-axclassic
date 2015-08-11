sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32121,32122,32121,32121,32121);
  quest::spawn2($a,0,0,-385,-1552,26,0);
  }
  sub EVENT_SIGNAL {
  if ($signal == 638{
  quest::depop(32121);
  quest::depop(32122);
  quest::depop();
  }
  }