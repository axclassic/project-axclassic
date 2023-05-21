sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Greetings to you. traveler. The recent past has brought quite a bit of excitement that New Tanaan is not quite accustomed to -- though it is welcome nonetheless. Many residents of the city are former adventurers like yourself. Others were great adepts and craftsmen. Being a former tradeswoman and adventurer. I have come to New Tanaan in hopes of bettering my own knowledge in the ways of my trade. However. in recent light of your presence. many of us have chosen to aid you where we can. If you are a blacksmith. or aspire to be. then I may have some supplies worthy of your talent.");
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
#END of FILE Zone:poknowledge  ID:202070 -- Halena_Paerk 

