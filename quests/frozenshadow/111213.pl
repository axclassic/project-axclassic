sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(111277,111264,111264,111264,111264,111264,111277,111264,111264,111264,111264,111264,111264,111264,111264,111264,111232);
  quest::spawn2($a,0,0,190.7,1126.3,193,192.6);
  }
  sub EVENT_SIGNAL {
  if ($signal == 423){
  quest::depopall(111232);
  quest::depopall(111277);
  quest::depopall(111264);
  quest::depop();
  }
  }