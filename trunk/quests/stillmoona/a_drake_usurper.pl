 sub EVENT_SIGNAL {
   if($signal == 827) {
   quest::start(2780159);
   }
 }  
 sub EVENT_WAYPOINT { 
   if($wp == 5) { 
   quest::spawn2(338207,0,0,265,867,6.1,102.5);
   quest::depop();
   }
 }   