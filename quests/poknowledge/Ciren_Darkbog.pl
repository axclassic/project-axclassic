sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("If you are not an adept in the ways of poison making. then be off with you. I have neither the time nor the desire to stand idle and make pointless chit-chat with anyone. else it yields a considerable profit worthy of my time.");
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
#END of FILE Zone:poknowledge  ID:202141 -- Ciren_Darkbog 

