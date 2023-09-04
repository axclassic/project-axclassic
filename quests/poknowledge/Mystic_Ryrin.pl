sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Hail to you. $name. The Mystics of New Tanaan extend their welcome to you. traveler. and hope that our knowledge will come of use to all that seek it. As an adept and shaman of the Tribunal. I have come to dismiss all former prejudice of race and accept each being as an equal to me in creation and existence. With the recent influx of travelers from Norrath to our city and the planes beyond. the citizens of New Tanaan have done what we can to assure that those who seek knowledge will have it at their disposal. The adepts maintain their art and thus you must seek the scholar of your class in order to receive proper guidance and aid that you might seek. I have scribed some spells from my past upon Norrath. and though they no longer prove useful to me in this place. I am certain that they will aid a shaman of Norrath should they be in need of them.");
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
#END of FILE Zone:poknowledge  ID:202181 -- Mystic_Ryrin 

