sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Hail visitor of New Tanaan! If you are an aspiring brewer then perhaps you may be interested in the supplies I have for sale. I assure you my wares are of the highest quality.");
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
#END of FILE Zone:poknowledge  ID:202081 -- Sirekoth_Eshe 

