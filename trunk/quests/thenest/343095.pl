
sub EVENT_SPAWN {
    quest::settimer("egg_one", 30);
  }
sub EVENT_TIMER {
if ($timer eq "egg_one") {
  quest::stoptimer("egg_one");
  quest::spawn2(343162,0,0,-4549.5,450.2,129.6,10.6);
  quest::stoptimer(1);
  quest::depop();
}

