sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102205,102180,102181,102182,102183,102205,102180,102181,102182,102183,102180,102181,102182,102183,102180,102181,102182,102183,102180,102181,102182,102183,102180,102181,102182,102183,102198);
  quest::spawn2($a,0,0,-513.7,-21.7,3.7,0);
  }
  sub EVENT_SIGNAL {
  if ($signal == 113){
  quest::depopall(102198);
  quest::depopall(102205);
  quest::depopall(102180);
  quest::depopall(102181);
  quest::depopall(102182);
  quest::depopall(102183);
  quest::depop();
  }
  }