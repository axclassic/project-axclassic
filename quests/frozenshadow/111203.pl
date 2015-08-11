sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111267,111254,111254,111254,111254,111254,111267,111254,111254,111254,111254,111254,111254,111254,111254,111254,111222);
  quest::spawn2($a,0,0,21.3,910.2,178.1,132.6);
  }
  sub EVENT_SIGNAL {
  if ($signal == 413){
  quest::depop(111222);
  quest::depop(111267);
  quest::depop(111254);
  quest::depop();
  }
  }