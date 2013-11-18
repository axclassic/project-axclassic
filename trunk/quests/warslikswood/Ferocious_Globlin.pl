#BeginFile: warslikswood\Ferocious Goblin.pl (79131)
 #Quest for Warsliks Wood - Ferocious Goblin: Berserker Epic 1.0 (Trial of Mastery)
######################
## Edited By Aardil ##
##   11-11-2013     ##
######################
 sub EVENT_SPAWN {
 quest::settimer(1,60);
 }

 sub EVENT_TIMER {
 quest::stoptimer(1);
 quest::signalwith(79128,8,0);
 }

 sub EVENT_DEATH {
 quest::signalwith(79128,2,0);
 }

 sub EVENT_SIGNAL {
 quest::depop();
 }

 #EndFile: warslikswood\Ferocious Goblin.pl (79131)