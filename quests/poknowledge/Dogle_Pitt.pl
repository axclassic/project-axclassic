sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("claps his thick hands together. creating a loud burst of sound that echoes his hardy yalp of welcoming. 'Greetings t'ye traveler an' welcome t'New Tanaan! I see that ye be a well-seasoned traveler! O'course nothin' escapes good ol' Dogle Pitt's eye. Perhaps that's why I be the most trusted banker in all o'these parts. aye? Indeed! If ye need a place t'store some o'yer excess belongin's there. then dinnae be shy in lettin' me be their temporary caretaker. There's no place safer fer all the treasures in the world than Dogle Pitt's safe. I assure ye!'");
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
#END of FILE Zone:poknowledge  ID:202129 -- Dogle_Pitt 

