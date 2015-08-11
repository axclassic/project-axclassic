sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(32063,32078,32099,32100,32063,32099,32100,32063,32099,32100,32099,32100);
  quest::spawn2($a,0,0,-108,-557,-93,9);
  }
  sub EVENT_SIGNAL {
  if ($signal == 636){
  quest::depop(32063);
  quest::depop(32078);
  quest::depop(32099);
  quest::depop(32100);
  quest::depop();
  }
  }