sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Greetings $name!  I am Eino. Monk of Quellious and Aid to Councilwoman Kerasha!  I spend my time as protector to the councilwoman as well as taking small jaunts to the planes to obtain items for her magic research.  If you be a hearty individual with some allies you may be able to help me.");
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
#END of FILE Zone:poknowledge  ID:202121 -- Aid_Eino 

