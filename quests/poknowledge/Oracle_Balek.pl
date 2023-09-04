#Oracle_Balek.pl
#Planar Armor Exchange
#New file, no text at all for him, so just going with the armor turn-ins and that's all.

sub EVENT_ITEM {
    if((plugin::check_handin(\%itemcount, 5182 => 1)) ||
       (plugin::check_handin(\%itemcount, 5183 => 1)) ||
       (plugin::check_handin(\%itemcount, 5184 => 1)) ||
       (plugin::check_handin(\%itemcount, 5185 => 1)) ||
       (plugin::check_handin(\%itemcount, 5186 => 1)) ||
       (plugin::check_handin(\%itemcount, 5187 => 1)) ||
       (plugin::check_handin(\%itemcount, 5188 => 1)) ||
       (plugin::check_handin(\%itemcount, 5189 => 1))) {
        #Scaled Hierophant Armor
        quest::say("Thank you, $name.");#Text made up
        quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
        quest::exp(698775);
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
}#Done