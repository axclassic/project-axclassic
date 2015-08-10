sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111236,111241,111218,111245,111236,111241,111236,111241,111245,111236,111241,111236,111241,111236,111241,111236,111241);
  quest::spawn2($a,8,0,300.4,749.1,177.4,382.7);
  }
  sub EVENT_SIGNAL {
  if ($signal == 404){
  quest::depopall(111218);
  quest::depopall(111245);
  quest::depopall(111236);
  quest::depopall(111241);
  quest::depop();
  }
  }