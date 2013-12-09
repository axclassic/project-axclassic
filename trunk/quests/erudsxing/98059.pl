sub EVENT_SPAWN {
 quest::settimer(1,600); #Depop after 10 minutes
 }

 sub EVENT_TIMER {
 quest::stoptimer(1);
 quest::say("Ok, here is place for you to for waiting. Hab fun shaman!");
 quest::depop();
 }



