sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("speaks in a drawling hiss. his voice tainted with the dark accent of Cabilis. 'The Hammertails greet you. traveler. If you seek supplies of which to craft iron and steel weaponry. then you need search no further. The Hammertails will accommodate all of your needs at a fair price.'");
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
#END of FILE Zone:poknowledge  ID:202071 -- Szrix_Hammertail 

