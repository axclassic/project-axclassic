sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Oh. hello there. $name! If you are searching for pottery materials. well then my friend. you have certainly come to the right place. Come and search my wares. if you wish it. I guarantee that my prices are most fair.'");
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
#END of FILE Zone:poknowledge  ID:202132 -- Gligo_Muddypants 

