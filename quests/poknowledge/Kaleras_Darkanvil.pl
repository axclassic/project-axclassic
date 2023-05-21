sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Good day t'ye. traveler. If ye be in need of smithin' supplies. then ye've certainly come t'the right place. friend! The Darkanvils have many supplies needed for crafting some of the finest weapons and armor the universe has ever seen. and they are offered t'ye. . . At a fair price. a'course.");
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
        $client->Message(14, "I don't need this $name. Take it back.");
        plugin::return_items(\%itemcount);
    }
    if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
        $client->Message(14, "Thanks for the coin!");
    }
}
#END of FILE Zone:poknowledge  ID:202148 -- Kaleras_Darkanvil 

