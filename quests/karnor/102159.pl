sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102202,102166,102167,102168,102202,102166,102167,102168,102166,102167,102168,102166,102167,102168,102166,102167,102168,102166,102167,102168,102195);
  quest::spawn2($a,0,0,-407.1,175.5,5.6,176.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 110){
  quest::depop(102195);
  quest::depop(102202);
  quest::depop(102169);
  quest::depop(102170);
  quest::depop(102171);
  quest::depop(102172);
  quest::depop();
  }
  }