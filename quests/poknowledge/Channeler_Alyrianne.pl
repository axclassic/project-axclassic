sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("May knowledge guide you. and may you step upon this path without judgment or bias. The citizens of New Tanaan have made this pledge to you. friend. and the scholars have vowed their existence to it. As wizards of the prime in our time there. the channelers have come together and composed the spells familiar to this class upon Norrath and though here they are no different. their presence and availability to you may prove a blessing and a convenience. Do not hesitate to search through our tomes and scrolls if you are in need of this knowledge as you progress in power.");
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
#END of FILE Zone:poknowledge  ID:202175 -- Channeler_Alyrianne 

