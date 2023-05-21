sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Greetings visitor! I am a maker and seller of fine ceramics and pottery supplies here in the wondrous city of New Tanaan. If you are practicing the art of pottery then perhaps I can interest you in some of my high quality supplies.");
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
#END of FILE Zone:poknowledge  ID:202085 -- Dalin_Greskar 

