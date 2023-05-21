sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Hail to you. $name. New Tanaan's mystics are always fond of visitors. for it is we above all others who desire pupils and interaction with the world. Though often times we seem solitary. the spirits guide us and we always listen. It is when a pupil is listening to our words and following a path carved from our guidance that we feel possessed with life and purpose. The mystics of New Tanaan have been limited. however. and we may only properly guide others who are shaman of their mortal world. Spells have been scribed from our collective memories and those who feel that they may gain from our efforts are encouraged to browse our inventories.");
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
#END of FILE Zone:poknowledge  ID:202179 -- Mystic_Somas 

