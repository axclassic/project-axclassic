sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111287,111248,111249,111248,111249,111248,111287,111248,111249,111248,111249,111248,111249,111248,111249,111248,111286);
  quest::spawn2($a,0,0,-85.7,420.6,218,208.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 408){
  quest::depop(111286);
  quest::depop(111287);
  quest::depop(111248);
  quest::depop(111249);
  quest::depop();
  }
  }