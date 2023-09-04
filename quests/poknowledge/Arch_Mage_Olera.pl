#Arch_Mage_Olera.pl
#Planar Armor Exchange/Magician Tomes

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::emote("gives an almost unearthly graceful gesture in warm welcoming of $name. 'May the light of honor, valor, and untainted passion guide you through the dark turmoil of this dreaded era. I am very pleased to see you before us, friend, for the children of the light must all come together in this dark hour of Norrath and the universe's fate. If you have need of guidance in the ways of the elements, then what humble knowledge I have is at your disposal, my friend.'");
   }
   if($text=~/wisp stone/i) {
      quest::say("I will gladly perform this service for you.  Just hand me 100 platinum.");
   }
}

sub EVENT_ITEM {
   if($platinum > 99) {
      quest::selfcast(321); # Summon Wisp Stone
   }
   elsif((plugin::check_handin(\%itemcount, 1239 => 1)) ||
      (plugin::check_handin(\%itemcount, 1240 => 1)) ||
      (plugin::check_handin(\%itemcount, 1241 => 1)) ||
      (plugin::check_handin(\%itemcount, 1242 => 1)) ||
      (plugin::check_handin(\%itemcount, 1243 => 1)) ||
      (plugin::check_handin(\%itemcount, 1244 => 1)) ||
      (plugin::check_handin(\%itemcount, 1245 => 1)))
   {#Apothic Armor
      quest::say("Thank you, $name.");#Text made up
      quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
      quest::exp(698775);
   }
   else {
       plugin::try_tome_handins(\%itemcount, $class, 'Magician');
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
#END of FILE Zone:poknowledge  ID:202240 -- Arch_Mage_Olera


