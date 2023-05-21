sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Why hello there wanderer. This library here in New Tanaan is a wonderous sight is it not? There are all manner of books here to occupy the curious of heart. If you are seeking stories of the Halflings. like myself. I have found some books you may be interested in. You can borrow them if you like and the magic of the library will return them when you are finished with them.");
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
#END of FILE Zone:poknowledge  ID:202024 -- Bookbrowser_Talika 

