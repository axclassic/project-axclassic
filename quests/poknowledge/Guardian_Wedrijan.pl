sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("grins a wide toothy smile and says. 'You may want to watch yourself. unless you are looking to enter a painful situation.  The portals in this district will lead someone of your race to a city of the wrong alignment.  If you use the portals and end up in the wrong place. you'll be crushed for certain.'");
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
#END of FILE Zone:poknowledge  ID:202104 -- Guardian_Wedrijan 

