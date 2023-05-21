sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("turns a condescending eye toward you. 'I am quite busy here. and I do not appreciate interruptions.  My [research] is important. and I do not have time to explain everything to you.'");
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
#END of FILE Zone:poknowledge  ID:202045 -- Sage_Gunyth 

