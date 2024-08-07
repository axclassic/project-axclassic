sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Why. hello there $name ! We are most excited indeed to see so many scholars from Norrath gathering within our city walls. It is so rare in this time of turmoil that so many beings of diverse and even opposing cultures and philosophies may come together without fear or hate of one another. Aaah. the bliss of balance -- and what an irony it is that all my life I strove for it upon the primal world and it is within the cosmos that I find it. I ramble. forgive me. friend. If you are a druid yourself and seek guidance in the ways of furthering your abilities as a warden of nature. then perhaps my inventory might hold something of use to you. Go on. then. and search as you will. Do not hesitate to purchase anything that catches your eye.");
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
#END of FILE Zone:poknowledge  ID:202216 -- Wanderer_Frardok 

