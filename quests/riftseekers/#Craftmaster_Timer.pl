sub EVENT_SPAWN {
	quest::settimer(334,1800);
}
sub EVENT_TIMER {
	quest::stoptimer(334);
	quest::depop(334087);
	quest::depop(334089);
    quest::depop(334090);
    quest::depop(334091);
    quest::depop(334097);
	quest::depop(334098);
	quest::depop(334099);
	quest::depop(334100);
	quest::depop(334101);
	quest::depop();
   }