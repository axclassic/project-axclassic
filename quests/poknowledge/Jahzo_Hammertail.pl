sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("speaks forth in a slow and almost whispered hiss of the Cabilisian accent. 'Aaaah. . . Good day to you. traveler. Perhaps you have come in search of supplies to further your trade as a smith. yes? Well. then look no further. $name. for the Hammertails hold the highest quality in their inventories and there is nothing that you won't find in our stock. we assure you.'");
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
#END of FILE Zone:poknowledge  ID:202072 -- Jahzo_Hammertail 

