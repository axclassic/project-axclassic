sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Greetings. $name. and welcome to New Tanaan. This city holds a great variety of supplies for all tradesmen -- you shall not find such a welcoming host of merchants gathered in one city upon Norrath. I guarantee! Come. if you be a baker. and search my inventory. Perhaps you shall find something of interest or necessity to your search.");
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
#END of FILE Zone:poknowledge  ID:202092 -- Savet_Ironstove 

