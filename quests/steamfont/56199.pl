sub EVENT_SAY {
if($text=~/hail/i) {
   quest::emote(' turns toward you as if she is waiting on something.');
   quest::say("You know Stanos?");
   }
   if($text=~/Yes/i) {
   (56200,0,0,-905.6,-464.2,-110.8,83.1);
   quest::depop();
   }
   if($text=~/no/i) {
   quest::say("Then bother me no more, let me rest in peace.");
   quest::depop();
   }
 }  