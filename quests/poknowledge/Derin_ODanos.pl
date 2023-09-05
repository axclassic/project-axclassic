sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Welcome. traveler! If you are in need of supplies to brew potions. then you have come to the right man! Please. search my wares and perhaps you may find what you need. I also can make Permafrost Extract if you give me 10pp, an empty vial, a water flask, and Permafrost Crystals.");
    }
}

sub EVENT_ITEM {
    if(($plantinum == 10) && plugin::check_handin(\%itemcount, 10062 => 1, 22121 => 1, 13006 => 1)) {
        quest::say("Here ye are then.");
        quest::summonitem(22128);
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
#END of FILE Zone:poknowledge  ID:202140 -- Derin_ODanos 

