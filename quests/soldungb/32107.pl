sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32123,32124,32123,32123,32123);
  quest::spawn2($a,0,0,-359,-1451,26,58);
  }
  sub EVENT_SIGNAL {
  if ($signal == 639){
  quest::depop(32123);
  quest::depop(32124);
  quest::depop();
  }
  }