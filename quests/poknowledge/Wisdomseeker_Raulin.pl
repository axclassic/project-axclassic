sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Hail adventurous traveler! I have been researching the druidic heritages of various Norrathian cultures and have made some interesting finds here in the great library.  Feel free to borrow the books I have found if you like. The sorcery of the library will return the books to their proper places when you are through with them.");
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
#END of FILE Zone:poknowledge  ID:202166 -- Wisdomseeker_Raulin 

