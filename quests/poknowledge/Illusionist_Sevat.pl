sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Hello. traveler. New Tanaan greets you warmly and with the utmost respect. We only hope that you may return to us the same indifference and non prejudicial regard for knowledge and self-progression as we have founded this city upon for a timeless age. I myself was once a traveler as you are now -- exploring the world in search of adventure. wealth. fame. and glory. I am an enchanter. though now I exist as a scholar and researcher of my art. I. like so many other citizens of New Tanaan. have volunteered to give my knowledge unto those willing to accept it. If you are of the same art as I. perhaps you would wish to search my inventory. I have penned many spells from the memories of my youth and you may find something of interest amongst my collection.");
    }
    elsif($text=~/Clear Mana/i) {
        quest::say("I will gladly perform this service for you.  Just hand me an Emerald, a Poison Vial and 100 platinum.");
    }
}

sub EVENT_ITEM {
    if(($platinum>99) && plugin::check_handin(\%itemcount, 10029 => 1) && plugin::check_handin(\%itemcount, 16965 => 1)) {
        #Emerald and Poison Vial
        quest::selfcast(540); #Clarify Mana
    }
    else {
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
}
#END of FILE Zone:poknowledge  ID:202212 -- Illusionist_Sevat 

