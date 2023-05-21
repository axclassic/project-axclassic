sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Greetings. traveler! I am Wilacor Goldenmead. resident of this most fair of cities and baking is my trade. I know that the worlds beyond this place are treacherous indeed. and one needs their strength to withstand the dangers that they most certainly face. The supplies that I provide are ideal for all adventurers and will keep the most hardy of warriors strong and well-nourished so that they may be at their best when battle is nigh. Come. search my wares and purchase as you will!");
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
#END of FILE Zone:poknowledge  ID:202151 -- Wilacor_Goldenmead 

