# Heretic_Ceikon

sub EVENT_SAY {
   if($text=~/Essence Emerald/i) {
      quest::say("I will gladly perform this service for you.  Just hand me an Emerald and 100 platinum.");
   }
}

sub EVENT_ITEM {
   if(($platinum>99) && plugin::check_handin(\%itemcount, 10029 => 1)) {#Emerald
      quest::selfcast(1768); #Sacrifice
   }
   else {
      quest::say("I don't need this."); #text made up
      plugin::return_items(\%itemcount);
   }
}
