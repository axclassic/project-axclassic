sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Well. greetings to you good traveler! Perago Crotal is at your service and I guarantee that if its fresh vegetables that you're searching for. you shan't find a rival to my products. Aaah. but I speak too much -- come and see for yourself. my friend.");
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
#END of FILE Zone:poknowledge  ID:202079 -- Perago_Crotal 

