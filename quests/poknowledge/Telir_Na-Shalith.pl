sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Whatever your affair or business is -- if it is not with the intent to purchase supplies to poison your blade -- I suggest that you move along for I have neither the time nor the care to hold meaningless dialogue with one who will not bear unto me a profit.");
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
#END of FILE Zone:poknowledge  ID:202076 -- Telir_Na`Shalith 

