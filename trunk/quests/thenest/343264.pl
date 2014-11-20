
sub EVENT_SPAWN {
    quest::settimer(4, 30);
  }
sub EVENT_TIMER {
if ($timername == 4) {
  quest::spawn2(343162,0,0,-4406.7,666,128.4,171.2);
  quest::stoptimer(4);
  quest::depop();
}
}
