sub EVENT_SAY {
   if ($text=~/Hail/i){
   quest::say("Uh! No orders yet, keep checking back, they bound to get here someday.");
   }
   }