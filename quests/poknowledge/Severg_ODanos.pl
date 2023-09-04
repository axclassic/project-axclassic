sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Aaah. . . Good day to you. $name. I am Severg O'Danos. once a great alchemist upon Norrath with my brothers. but I have found a new calling here in New Tanaan. If you yourself are a dabbler in the art of potion making. then perhaps my wares will serve you well. Please. feel free to peruse my wares at your leisure.");
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
#END of FILE Zone:poknowledge  ID:202139 -- Severg_ODanos 

