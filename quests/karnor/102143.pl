sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102144,102145,102146,102144,102145,102146,102129,102124,102144,102145,102146,102124);
  quest::spawn2($a,0,0,-690.9,126.1,31.1,37.9);
  }
  sub EVENT_SIGNAL {
  if ($signal == 104){
  quest::depop(102129);
  quest::depop(102124);
  quest::depop(102144);
  quest::depop(102145);
  quest::depop(102146);
  quest::depop();
  }
  }