sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32020,32082,32020,32020,32020);
  quest::spawn2($a,0,0,-359,-1451,26,58);
  }
  sub EVENT_SIGNAL {
  if ($signal == 639){
  quest::depop(32020);
  quest::depop(32082);
  quest::depop();
  }
  }