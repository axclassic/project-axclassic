sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102220,102155,102156,102157,102220,102155,102156,102157,102155,102156,102157,102219);
  quest::spawn2($a,0,0,-192.9,-148,45.6,64);
  }
  sub EVENT_SIGNAL {
  if ($signal == 108){
  quest::depop(102219);
  quest::depop(102220);
  quest::depop(102155);
  quest::depop(102156);
  quest::depop(102157);
  quest::depop();
  }
  }