sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Ah. good day to thee. $name and welcome to New Tanaan. If you are searching for knowledge and a quiet. peaceful place to calm your senses from the wears of battle. then you could not have made a finer choice than the Plane of Knowledge. The residents of New Tanaan have come together with the recent presence of your kind in hopes of aiding and guiding you where and when we can. If you are perhaps of the bardic ilk. then I might be of some assistance. Please. search my stock if you wish it. All of the songs are recently penned by my own hand. though they are not of a unique or rare breed. they will serve any bard of the proper experience.");
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
#END of FILE Zone:poknowledge  ID:202230 -- Minstrel_Silnon 

