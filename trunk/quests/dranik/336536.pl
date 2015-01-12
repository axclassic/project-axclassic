sub EVENT_SPAWN  {
  quest::settimer(336,1800);
    }
sub EVENT_TIMER {
	quest::stoptimer(336);
	quest::depop(336533);
	quest::depop(336534);
	quest::depop(336535);
	quest::depop();
   }