sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Hail. good traveler! Here. in the aptly named Plane of Knowledge. you will find a seemingly endless library of history. lore. and arcane and spiritual knowledge.  In the recent times with the unexpected. though welcome arrival of other Norrathian travelers. the citizens of New Tanaan have come together in hopes of sharing our experiences in the mind to aid all that are willing. In a former life. I was a traveling minstrel in the court of the Combine Empire and what experience I gained from that life. I am willing to share with others like myself. If you are interested in song. then perhaps you would find my inventory of interest. Search as you will. my friend. and know that all prices are for the betterment of the city as a whole and not for personal gain.");
    }
}

sub EVENT_ITEM {
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
#END of FILE Zone:poknowledge  ID:202232 -- Minstrel_Joet 

