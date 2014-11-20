
sub EVENT_SPAWN {
    quest::settimer("egg_four", 30);
  }
sub EVENT_TIMER {
if ($timer eq "egg_four") {
  quest::stoptimer("egg_four");
  quest::spawn2(343162,0,0,-4406.7,666,128.4,171.2);
  quest::stoptimer(1);
  quest::depop();
}

