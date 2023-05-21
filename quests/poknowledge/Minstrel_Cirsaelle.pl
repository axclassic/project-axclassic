sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Greetings to you. $name. and welcome to New Tanaan. I am Cirsaelle. a former minstrel of Norrath in a time long since past. Despite my age and the distance of time that separates the now from when last my feet touched Norrathian soil. my wisdom and memories have not faded. Though I wish I could help all travelers that approach me. my knowledge is limited to that of the bardic traditions. If these ways would aid your quest for self-enlightenment and progression. then perhaps I might be of service. Please. investigate the songs that I possess at your leisure. All coin that is given in trade will help fund this city's recent need to accommodate all Norrathian visitors.");
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
#END of FILE Zone:poknowledge  ID:202229 -- Minstrel_Cirsaelle 

