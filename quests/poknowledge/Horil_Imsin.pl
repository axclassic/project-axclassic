sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Hail and well met. $name. If you have come seeking the ways of the blacksmith. then you have certainly come to one of many places that can accommodate you. However. New Tanaan is unique from the cities of the prime in that in no other common ground of trade will you find such a diversity and acceptance of culture. Well then. if you are indeed a blacksmith and are seeking materials. please feel free to peruse my inventory at your leisure. I'm sure that I can provide something of use to you. and if not. my brethren will likely carry that which you seek.'");
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
#END of FILE Zone:poknowledge  ID:202065 -- Horil_Imsin 

