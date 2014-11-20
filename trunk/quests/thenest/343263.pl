
sub EVENT_SPAWN {
    quest::settimer(1, 30);
  }
sub EVENT_TIMER {
  quest::spawn2(343162,0,0,-4464.8,726.4,128.8,113.0);
  quest::stoptimer(1);
  quest::depop();
}

