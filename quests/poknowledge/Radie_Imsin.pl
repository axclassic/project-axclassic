sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Ah. greetings to you. traveler. Much traffic has passed this quiet. peaceful city's ground in the recent past. It has been a very long time since last we have been graced with the pleasure of a bustling city atmosphere. though we hope that the general peace and courtesy to all beings remains intact. With this new excitement. many of the city's adepts have emerged in hopes to aid the new comers where and when we can. As a blacksmith and former shaman of my tribe. I have offered my knowledge in the ways of smithing to any. My inventory holds many components that smiths will need throughout their career and search for advancement and perfection. and all are for sale at a reasonable price.");
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
#END of FILE Zone:poknowledge  ID:202066 -- Radie_Imsin 

