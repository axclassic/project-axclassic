sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("winces his reptilian eyes in a brief. callous study of you. The Iksar's features contort into a grim. malicious smirk that masterfully incorporates his inherantly viscious and merciless demeanor. In a drawled hiss. heavily accented with the Sebilisian Empire of old. the iksar finally speaks. 'How quaint -- a 'hero' of the world. yes? Well. it seems that this era has no hope for true glory afterall. despite all of the opportunities that those before you have offered. How you squander their legendary work with your debased. pathetic little whimsical dreams of wealth and fame. How selfish you are for all the wrong reasons. It would be pitiable if it weren't for the true element of humor we will gain from your collective failure.'");
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
#END of FILE Zone:poknowledge  ID:202059 -- Raewyth_Velanor 

