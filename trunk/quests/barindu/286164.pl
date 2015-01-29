sub EVENT_SPAWN {
   quest::settimer(283,1800);
   }
sub EVENT_TIMER {
  quest::stoptimer(283);
  quest::depop(283156);
  quest::depop();
}