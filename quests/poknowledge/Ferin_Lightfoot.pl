sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Greetings. $name. I am Ferin Lightfoot. resident of New Tanaan and scholar in my prime. Now. in my retirement from the excitement of my former life as an adventurer-much like yourself-I am here to offer what knowledge I can in order to help those akin to my former life. In addition to basic supplies which you may need on your adventures I also carry some books which may help liven up any dull. boring spells during your travels.");
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
#END of FILE Zone:poknowledge  ID:202152 -- Ferin_Lightfoot 

