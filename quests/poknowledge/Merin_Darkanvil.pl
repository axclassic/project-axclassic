sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Why. good day t'ye as well. good traveler. and welcome t'New Tanaan. We are overjoyed with your kind in our midst. for it 'as been far too long since we've been graced with the hearty character of Norrath's finest heroes and villians alike. Dinnae mistake this for boredom with our fair 'amlet of the cosmos. but take it as a compliment and one not given lightly at that. Well. if you are not inside the library. then you must be searching for supplies -- or ye be lost. In either case. perhaps you would find interest in supplies for blacksmithin");
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
#END of FILE Zone:poknowledge  ID:202147 -- Merin_Darkanvil 

