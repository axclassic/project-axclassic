sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Welcome. traveler! The Ironstoves pride ourselves upon our goods. for no other baker in the whole of the cosmos can hold a candle to our quality. Please. search my inventory and if you do not find that which you are searching for. then search my brethren's stock. I guarantee that among the five of us. you will find the exact ingredient you seek.");
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
#END of FILE Zone:poknowledge  ID:202089 -- Vuli_Ironstove 

