
sub EVENT_SPAWN {
    quest::settimer(1, 30);
  }
sub EVENT_TIMER {
  quest::spawn2(343162,0,0,-4406.7,666,128.4,171.2);
  quest::stoptimer(1);
  quest::depop();
}

