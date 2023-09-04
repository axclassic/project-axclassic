sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Greetings. traveler. and welcome to my shop! All adventurers who brave the toils of the astral realms of the gods need their sustenance and ol' Klen Ironstove provides all the necessities for bakers to produce their wares. Come. peruse my goods and see if there's anything here of interest t'ye.");
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
#END of FILE Zone:poknowledge  ID:202135 -- Klen_Ironstove 

