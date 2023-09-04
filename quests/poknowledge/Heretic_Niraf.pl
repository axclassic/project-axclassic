# Heretic_Niraf

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
       my $stuff = (\%itemcount);
       my $yes = 2;
       foreach my $k (keys(%{$stuff})) {
           next if($k == 0);
           $yes = 1;
       }
       if($yes == 1) {
           quest::say("I don't need this $name. Take it back.");
           plugin::return_items(\%itemcount);
       }
       if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
           quest::say("Thanks for the coin!");
       }
   }
}
