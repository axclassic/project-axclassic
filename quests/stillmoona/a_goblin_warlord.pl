sub EVENT_SPAWN {
   quest::say("How dare you invade our temple and defile it with your presence! You will all pay! Guard! Retrieve reinforcements!"); 
   }
sub EVENT_DEATH {
   quest::signalwith(338184,625,0);
   }