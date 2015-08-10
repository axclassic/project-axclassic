sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111271,111258,111258,111258,111258,111258,111271,111258,111258,111258,111258,111258,111258,111258,111258,111258,111226);
  quest::spawn2($a,0,0,96.3,1127.3,178.1,65.1);
  }
  sub EVENT_SIGNAL {
  if ($signal == 417){
  quest::depopall(111226);
  quest::depopall(111271);
  quest::depopall(111258);
  quest::depop();
  }
  }