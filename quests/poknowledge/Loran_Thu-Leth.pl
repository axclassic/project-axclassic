sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("If you are in need of poisons. then your presence is not a waste of my time. However. if you seek idle chit-chat or have come for some other affair than to purchase my wares. begone with you. I haven't the time nor the desire to engage in activities that will not yield me profit. I also can make Permafrost Extract if you give me 10pp, an empty vial, a water flask, and Permafrost Crystals.");
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
#END of FILE Zone:poknowledge  ID:202077 -- Loran_Thu`Leth 

