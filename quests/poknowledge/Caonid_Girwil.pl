sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("narrows his wild. blazing eyes upon you. The troll sniffs the air about you. studying you with great care and intent. Eventually. a gruff. hoarse hiss escapes the troll's throat as it backs away. seemingly disinterested and unimpressed. 'How puny you people are now. How spoiled and depraved of true turmoil. chaos. and petty desires for mere wealth. I've hunted down food more impressive and intimidating than you. How disgusting you are. Weakling.'");
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
#END of FILE Zone:poknowledge  ID:202058 -- Caonid_Girwil 

