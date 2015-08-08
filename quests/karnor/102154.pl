sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102116,102155,102156,102157,102116,102155,102156,102157,102155,102156,102157,102131);
  quest::spawn2($a,0,0,-192.9,-148,45.6,64);
  }
  sub EVENT_SIGNAL {
  if ($signal == 108){
  quest::depopall(102131);
  quest::depopall(102116);
  quest::depopall(102155);
  quest::depopall(102156);
  quest::depopall(102157);
  quest::depop();
  }
  }