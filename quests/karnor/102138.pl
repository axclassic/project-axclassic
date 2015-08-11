sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102134,102135,102136,102134,102135,102136,102209,102210,102134,102135,102136,102210);
  quest::spawn2($a,0,0,-611,102,38.7,128);
  }
  sub EVENT_SIGNAL {
  if ($signal == 102){
  quest::depop(102209);
  quest::depop(102210);
  quest::depop(102134);
  quest::depop(102135);
  quest::depop(102136);
  quest::depop();
  }
  }