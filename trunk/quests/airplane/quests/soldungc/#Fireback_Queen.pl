sub EVENT_SPAWN {
  quest::settimer("queen",7200); #depop after 2 hours
}

sub EVENT_TIMER {
  if ($timer eq "queen") {
  quest::stoptimer("queen");
  quest::signalwith(278119,71,0); #278119 (same)
  quest::depopall(278262); #278112
  quest::depopall(278263); #278113
  quest::depop();
  }
   }
   
sub EVENT_DEATH {
  quest::depop(278119);
  }