
sub EVENT_SPAWN {
    quest::settimer(1, 30);
  }
sub EVENT_TIMER {
if ($timer == 1) {
  quest::spawn2(343162,0,0,-4549.5,450.2,129.6,10.6);
  quest::stoptimer(1);
  quest::depop();
}

