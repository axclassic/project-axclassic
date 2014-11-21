
sub EVENT_SPAWN {
    quest::settimer(5, 30);
  }
sub EVENT_TIMER {
if ($timer == 5) {
  quest::spawn2(343162,0,0,-4464.8,726.4,128.8,113.0);
  quest::stoptimer(5);
  quest::depop();
}

