sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("speaks in a hushed voice. barely audible. though the tones of an ancient and long past era emerge through the Iksar's unfamiliar accent. 'Greetings. $name. The mystics of New Tanaan welcome you as an equal. We are scholars and no longer bound by the darkness of our shallow disdain for race or faith. However. each adept must teach only within their knowledge and as a shaman. I must extend my knowledge only to those who are of the same ilk. I have scribed many spells from my memory of the times past on Norrath and these spells are for any that they would aid.'");
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
#END of FILE Zone:poknowledge  ID:202182 -- Mystic_Goharkor 

