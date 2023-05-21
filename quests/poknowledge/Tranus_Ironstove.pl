sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Aaah. . . good day to you. my friend. and welcome! It has been a most exciting time these past few weeks with the influx of young and seasoned adventurers alike. It has been quite difficult to keep up on our stock. but do not be discouraged. for Tranus Ironstove's supplies are always well-kept! If you are in need of baking supplies. then search my wares and perhaps I might hold that which you seek.");
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
#END of FILE Zone:poknowledge  ID:202090 -- Tranus_Ironstove 

