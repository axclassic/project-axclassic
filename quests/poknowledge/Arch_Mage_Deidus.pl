#Arch_Mage_Deidus.pl
#Planar Armor Exchange/Magician Tomes/Some other text, preserved but cleaned

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::emote("gives a loathsome, unwavering stare upon $name. His features are steely and cold in their disdain. 'Kartis is the place of shadow - the cornerstone of the seed of corruption in this universe. You have no place here as you are. Return to Selia. for you will find nothing of use to you here. If you intend to decipher the purpose of the shadow or interrupt the training of our disciples, then you are grievously mistaken in your cause. We will share nothing with the likes of you in the ways of knowledge. Though slowly, if you choose to remain, we shall corrupt and contort you to our will. Even through mere acts of training, you will be fueling the shadow and will become a part of it unwittingly or no.'");
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
   { #Apothic Armor
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
           $client->Message(14, "I don't need this $name. Take it back.");
           plugin::return_items(\%itemcount);
       }
       if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
           $client->Message(14, "Thanks for the coin!");
       }
   }
}
#END of FILE Zone:poknowledge  ID:202258 -- Arch_Mage_Deidus 



