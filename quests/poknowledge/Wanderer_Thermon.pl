sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Why. hello there friend and welcome! New Tanaan has seen much excitement these past days. and we are only pleased to accommodate each and every adventurer and scholar who wishes our guidance. If you are a warden of the natural world. then perhaps my wisdom may hold some meaningful importance to you. Come and search my spells. friend. and purchase whatever might catch your eye should you have use or need of it."); }
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
#END of FILE Zone:poknowledge  ID:202214 -- Wanderer_Thermon 

