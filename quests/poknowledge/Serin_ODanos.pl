sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Greetings and well met. $name. I am Serin O'Danos. one of three alchemists that have left our native world of Norrath in search of more peaceful pastures here in New Tanaan. We make a modest. humble living and pride ourselves on the benefit our knowledge gives to aspiring and adept alchemists alike. If you are in need of ingredients to brew a potion. then search our wares at your convenience and leisure. The O'Danos' are more than happy to accommodate your needs.");
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
        $client->Message(14, "I don't need this $name. Take it back.");
        plugin::return_items(\%itemcount);
    }
    if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
        $client->Message(14, "Thanks for the coin!");
    }
}
#END of FILE Zone:poknowledge  ID:202078 -- Serin_ODanos 

