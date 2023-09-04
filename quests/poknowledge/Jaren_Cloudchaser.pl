sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Hail and well met. friend. and welcome to New Tanaan. If your stay with us is brief and you seek only supplies. then know only security for this city holds an endless bounty of that which you seek. Within my particular shop. you will find materials used for fletching. If that which I carry is what you are in search of. then please. search and purchase at your leisure.");
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
#END of FILE Zone:poknowledge  ID:202138 -- Jaren_Cloudchaser 

