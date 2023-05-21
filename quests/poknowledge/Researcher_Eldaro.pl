sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Salutations stranger. I wish to continue to my study of the multitude of tomes stored here in the Great Library of New Tanaan. If you are interested in tomes relative to the history of the Erudite people then I shall permit you to borrow these tomes I have located. The tomes will be returned when you are done with them by the magics of New Tanaan. If you are not interested in these tomes then I shall end our conversation now and return to my studies.");
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
#END of FILE Zone:poknowledge  ID:202022 -- Researcher_Eldaro 

