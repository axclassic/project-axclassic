sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Greetings. traveler! If you have come searching to restock on reagents. then I am most glad to see you. Please. browse my wares and purchase whatever you need from my stock.");
    }
}

sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
    quest::signal(202273,5); #Qadar
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
#END of FILE Zone:poknowledge  ID:202136 -- Peras_Glickon 

