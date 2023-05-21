#Wicas_Adaolath.pl
#The Magic Pool


sub EVENT_SIGNAL {
    if($signal == 1) {
        quest::say("Nothing at all. Do you think that he led us astray?");
    }
    if($signal == 2) {
        quest::say("I think we should just do what [Tarerd] wants us to do.");
    }
}

sub EVENT_SAY {
    if($text=~/tarerd/i) {
        quest::say("Tarerd is the one who told us about these pools. He wanted us to kill some sort of lizards for him, but we have neither the time nor energy for such adventures. Perhaps you can get some information about the pools from him.");
    }
}


sub EVENT_ITEM { #Doesn't take any turn ins
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
}#Done