sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32117,32118,32099,32100,32117,32099,32100,32063,32099,32100,32099,32100);
  quest::spawn2($a,0,0,-108,-557,-93,9);
  }
  sub EVENT_SIGNAL {
  if ($signal == 636){
  quest::depop(32117);
  quest::depop(32118);
  quest::depop(32099);
  quest::depop(32100);
  quest::depop();
  }
  }