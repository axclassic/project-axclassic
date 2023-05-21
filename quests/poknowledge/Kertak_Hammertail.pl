sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("addresses you in a hissing voice overwhelmed by the familiar accent of Cabilis. 'Welcome. stranger. to New Tanaan. You shall find little difficulty in gathering supplies for all known trades upon Norrath. If you seek to forge weaponry or armor of iron and steel. then the Hammertails are those at whom your search ends.'");
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
#END of FILE Zone:poknowledge  ID:202074 -- Kertak_Hammertail 

