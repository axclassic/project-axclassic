
sub EVENT_SPAWN {
    quest::settimer(1, 30);
  }
sub EVENT_TIMER {
  quest::spawn2(343162,0,0,-4373.2,565.8,128.1,212.5);
  quest::stoptimer(1);
  quest::depop();
}

