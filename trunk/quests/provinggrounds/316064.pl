sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 69974 => 1)) {
   quest::say("'My sword, you have brought it back to me. Thank you $name, you truly are heroic.");
   quest::say("'At last I am free again! Thank you so much for saving me from the horrors of this vile place. You have my gratitude. I can find my way out from here friend.");
   quest::depop();  
   }
 }   