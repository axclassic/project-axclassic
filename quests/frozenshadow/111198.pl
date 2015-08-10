sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111150,111248,111249,111248,111249,111248,111150,111248,111249,111248,111249,111248,111249,111248,111249,111248,111178);
  quest::spawn2($a,0,0,-85.7,420.6,218,208.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 408){
  quest::depopall(111178);
  quest::depopall(111150);
  quest::depopall(111248);
  quest::depopall(111249);
  quest::depop();
  }
  }