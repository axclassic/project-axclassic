sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Greetings. $name. If you have come searching to restock on goods. then I am most glad to see you. Please. browse my wares and purchase whatever you need from my stock.");
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
#END of FILE Zone:poknowledge  ID:202130 -- Amile_Pitt 

