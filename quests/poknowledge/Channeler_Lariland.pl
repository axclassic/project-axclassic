sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Greetings to you. traveler. The channelers or New Tanaan are eager to have your kind among us. for it has been far too long since we have been graced with the opportunity to guide. All scholars of New Tanaan have offered up their wisdom of their individual past experiences as a mortal profession upon the prime in order to aid you in the most effective manner for your current position within the universe. As all channelers here were wizards in our prime upon the material world. we have combined our tomes and memories into tangible form so that the wizards of the prime may make use of them once again.");
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
#END of FILE Zone:poknowledge  ID:202177 -- Channeler_Lariland 

