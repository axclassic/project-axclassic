sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102205,102180,102181,102182,102183,102205,102180,102181,102182,102183,102180,102181,102182,102183,102180,102181,102182,102183,102180,102181,102182,102183,102180,102181,102182,102183,102198);
  quest::spawn2($a,0,0,-513.7,-21.7,3.7,0);
  }
  sub EVENT_SIGNAL {
  if ($signal == 113){
  quest::depop(102198);
  quest::depop(102205);
  quest::depop(102180);
  quest::depop(102181);
  quest::depop(102182);
  quest::depop(102183);
  quest::depop();
  }
  }