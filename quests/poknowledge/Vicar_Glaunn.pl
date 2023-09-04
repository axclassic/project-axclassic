sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Welcome to New Tanaan. traveler. and know that you are among allies in the quest for knowledge and personal enlightenment. All of New Tanaan's residents have strived for the past weeks to accommodate every visitor's needs as we can. Collectively. we have proven to be without a match in our efforts to do so. as the knowledge kept here is seemingly infinite. Individually. however. we hold specialties that one must take into account before judging us as the proper aid for your current quest. If your life is dedicated to the ways of the priest. despite the mode of your faith. then I may be of service to you. My inventory is stocked. as I am sure that it shall always be. Search it at your convenience and leisure should you wish it.");
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
#END of FILE Zone:poknowledge  ID:202219 -- Vicar_Glaunn 

