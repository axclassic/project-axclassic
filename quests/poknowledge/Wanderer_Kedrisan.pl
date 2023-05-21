sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Hail. $name and good day to thee. The halls of New Tanaan are open to any being of intelligence and self-empowered will that wishes to walk among its halls and libraries. so dinnae be frightened by my seemingly nonconformist presence here. Like my fellow citizens. I have pledged my knowledge to any visitor that has any need or wish of me. though I fear I may only be of use to the druids of the material world. If you believe that I could provide anything of use to you. then do not hesitate to browse my inventory. All of the spells there were penned by my own hand and my stock is always plentiful.");
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
#END of FILE Zone:poknowledge  ID:202215 -- Wanderer_Kedrisan 

