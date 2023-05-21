sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Welcome. traveler! If you are in need of supplies to brew potions. then you have come to the right man! Please. search my wares and perhaps you may find what you need.");
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
#END of FILE Zone:poknowledge  ID:202140 -- Derin_ODanos 

