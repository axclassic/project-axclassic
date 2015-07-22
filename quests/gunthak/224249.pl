sub EVENT_SIGNAL {
   if($signal == 230){
   quest::say("It's still too late to stop our plans. . ");
   }
 }  
sub EVENT_DEATH {
   quest::signalwith(224248,225,0);
   }
