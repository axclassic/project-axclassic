
sub EVENT_SPAWN {
    quest::settimer(3, 30);
  }
sub EVENT_TIMER {
if ($timername == 3) {
  quest::spawn2(343162,0,0,-4464.8,726.4,128.8,113.0);
  quest::stoptimer(3);
  quest::depop();
}

