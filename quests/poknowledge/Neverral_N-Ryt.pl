sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Greetings traveler. If you have come to New Tanaan seeking knowledge then perhaps these books I have uncovered in great library will interest you. You may borrow them and the magic of New Tanaan will return them to their place in the library when you are through.");
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
#END of FILE Zone:poknowledge  ID:202167 -- Neverral_N`Ryt 

