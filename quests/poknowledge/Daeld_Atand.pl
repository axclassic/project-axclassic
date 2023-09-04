sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Hail and well met. my friend! If you have come searching for supplies needed to fish out of the fair waters of Norrath. than you have come to the right place. Please. search my inventory as you wish -- I'm certain that what you seek is right here. If for some reason I do not carry the rare item you desire at this moment. then seek out Ramos Jerwan. for he likely shall.");
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
#END of FILE Zone:poknowledge  ID:202063 -- Daeld_Atand 

