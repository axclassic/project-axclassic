sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102222,102166,102167,102168,102222,102166,102167,102168,102166,102167,102168,102166,102167,102168,102166,102167,102168,102166,102167,102168,102221);
  quest::spawn2($a,0,0,-526.1,18.1,3.8,64);
  }
  sub EVENT_SIGNAL {
  if ($signal == 109){
  quest::depop(102221);
  quest::depop(102222);
  quest::depop(102166);
  quest::depop(102167);
  quest::depop(102168);
  quest::depop();
  }
  }