sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Greetings. traveler. and well met. I am Minstrel Gwiar. and it is a pleasure to make the acquaintence of a fellow Norrathian whose career is in its prime. For many years I have been a resident of New Tanaan. taking awe in this place of unhindered wisdom and knowledge without the turmoil and unncessary. petty bias of the material worlds. Aaah. but I get ahead of myself -- please. forgive me. As a citizen of New Tanaan. I have pledged my knowledge to all visitors of our humble plane. Should you hold an interest in the bardic ways. then my inventory might hold some interest to you.");
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
#END of FILE Zone:poknowledge  ID:202231 -- Minstrel_Gwiar 

