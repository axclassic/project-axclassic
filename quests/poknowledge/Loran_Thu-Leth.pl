sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("If you are in need of poisons. then your presence is not a waste of my time. However. if you seek idle chit-chat or have come for some other affair than to purchase my wares. begone with you. I haven't the time nor the desire to engage in activities that will not yield me profit.");
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
#END of FILE Zone:poknowledge  ID:202077 -- Loran_Thu`Leth 

