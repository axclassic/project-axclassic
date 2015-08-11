sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32076,32102,32103,32104,32062,32102,32103,32104,32062,32102,32103,32104);
  quest::spawn2($a,0,0,321,-482,-80.7,65.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 637){
  quest::depop(32102);
  quest::depop(32103);
  quest::depop(32104);
  quest::depop(32062);
  quest::depop(32076);
  quest::depop();
  }
  }