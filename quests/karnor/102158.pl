sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102120,102166,102167,102168,102120,102166,102167,102168,102166,102167,102168,102166,102167,102168,102166,102167,102168,102166,102167,102168,102130);
  quest::spawn2($a,0,0,-526.1,18.1,3.8,64);
  }
  sub EVENT_SIGNAL {
  if ($signal == 109){
  quest::depopall(102130);
  quest::depopall(102120);
  quest::depopall(102166);
  quest::depopall(102167);
  quest::depopall(102168);
  quest::depop();
  }
  }