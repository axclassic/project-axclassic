sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Good day to you. traveler. and may the gods be with you in your quest for knowledge. New Tanaan shall not hinder your quest. my friend -- on the contrary. we strive to provide whatever wisdom and guidance that you would need to further your own path. Do not hesitate to approach us and know us as friend. and nothing more. Unfortunately. my personal experience and knowledge is limited to that of a priestess. for I was bred devoted to The Prime Healer. However. if you are a priest--it does not matter the divine focus of your faith-- then I may serve some purpose to you after all. Please. search my inventory should you have any interest in it and purchase whatever you need that I can possibly provide.");
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
#END of FILE Zone:poknowledge  ID:202220 -- Vicar_Diarin 

