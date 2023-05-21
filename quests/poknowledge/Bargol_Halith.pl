sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Hello. traveler. If you be interested in brewing. then you've come to the right man. My wares are for producing the most tasty beverages in all of New Tanaan. and they are yours to purchase should you wish.");
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
#END of FILE Zone:poknowledge  ID:202134 -- Bargol_Halith 

