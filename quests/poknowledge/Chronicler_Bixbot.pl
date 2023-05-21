sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Welcome..Welcome! I am so excited to see a new face around New Tanaan. The Great Library of New Tanaan has a plethora of magnificent tomes to tantilize ones mind. I have here some books telling stories of gnomes that have shaped the history of our people. You may borrow them if you are literate in the Gnomish language. The books will return to me when you are finished with them via the enchantments placed upon them by New Tanaan.");
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
#END of FILE Zone:poknowledge  ID:202023 -- Chronicler_Bixbot 

