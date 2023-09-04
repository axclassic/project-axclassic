sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Har! Yooz wan be smart like Trogmarz. den yooz read books like Trogmarz! Meez gotz sum books bout ancient trolls yooz can borrow if yooz wantz. Da mojo of da library will bring zem back when yooz are done wit dem.");
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
#END of FILE Zone:poknowledge  ID:202021 -- Talespinner_Trogmarz 

