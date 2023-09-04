sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("gives you a wide. toothy grin. 'Welcome. traveler! The Plane o'Knowledge offers many. many great things as t'the ways of the universe and legends o'the greatest people t'ever walk the face o'Norrath. But that's not all we 'ave 'ere! The merchants an' tradesmen of Norrath from eras recent an' ancient past 'ave come t'gether in celebration o'your arrival. We 'ope t'meet new young an' aspiring people o'the arts an' share with them our experiences an' knowledge. If ye be a brewer. well then. this day be one of good fortune fer me. Come and inspect me wares. friend. and purchase whatever catches yer eye. The supplies 'ere are guaranteed and worth more than the measly price o'which I be sellin' 'em fer.'");
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
#END of FILE Zone:poknowledge  ID:202080 -- Merabo_Sotath 

