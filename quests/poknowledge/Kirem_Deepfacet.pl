sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Good day. traveler. I am Kirem Deepfacet and as a merchant of precious metals and stones. I serve this city. which has been most gracious in providing a home away from the turmoil of Norrath. If you seek supplies to craft jewelry of all sorts. then do not hesitate to search my inventory.");
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
#END of FILE Zone:poknowledge  ID:202131 -- Kirem_Deepfacet 

