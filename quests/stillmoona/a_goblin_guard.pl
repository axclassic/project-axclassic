sub EVENT_WAYPOINT { 
   if($wp == 3) { 
   quest::signalwith(338184,623,0);
   quest::depop();
   }
 }   