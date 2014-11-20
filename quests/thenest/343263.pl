
sub EVENT_SPAWN {
    quest::settimer("egg_three", 30);
  }
sub EVENT_TIMER {
if ($timer eq "egg_three") {
  quest::stoptimer("egg_three");
  quest::spawn2(343162,0,0,-4464.8,726.4,128.8,113.0);
  quest::stoptimer(1);
  quest::depop();
}

