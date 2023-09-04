sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("'s voice come forth in a drawling hiss. though unlike the other reptilian voices of the Cabilisian Iksars. this one's is almost melodic like the hum of a soft breeze through a winding canyon. 'Greetings traveler. If you are an adept in the art of smithing. then look no further than the Hammertails of New Tanaan for your supplies.'");
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
#END of FILE Zone:poknowledge  ID:202073 -- Zosran_Hammertail 

