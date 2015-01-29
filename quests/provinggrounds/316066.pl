sub EVENT_SPAWN {
   quest::settimer(316,1800);
   }
sub EVENT_TIMER {
   quest::depop(316065); 
   quest::depop(316064); 
   quest::depop(316043);
   quest::depop(316063);
   quest::depop();
   }   