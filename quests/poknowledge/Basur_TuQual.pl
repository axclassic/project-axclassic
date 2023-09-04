sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("curls his lips as he tilts his head. the wooden pipe remaining firmly placed between his teeth as he puffs on it a few times. The dwarf's cloudy eyes study you heavily and the sound of a husky voice can be heard mumbling a series of incomprehensible words. Eventually. the dwarf nods his head a few times and speaks in a strong. booming voice. 'Well. what 'ave we 'ere. hrm? A 'traveler'? A 'warrior'? A 'scholar'? By the looks o'ye. it appears ye just left yer mother's sweet. carin' arms and now ye wish t'gain fame. glory. and power. hrm? Well. there's nothin' I can do t'elp with dat soft appearance ye 'ave. but perhaps I can strengthen yer stomach. aye? I doubt ye be of the calibur and wit t'be one. but if by some cruel stroke o'the gods' 'umor. ye be a brewer. then dinnae wander far fer I 'ave all the supplies ye be needin' t'make a proper drink t'arden dat soft belly o'yours.'");
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
#END of FILE Zone:poknowledge  ID:202082 -- Basur_TuQual 

