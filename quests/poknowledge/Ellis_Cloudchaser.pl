sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Well. good day to you my friend. and welcome! We of New Tanaan are quite excited with the recent influx of foreigners into our fair hamlet in the cosmos -- but I ramble without speech of business. If you are a fletcher in trade. then you have certainly come to the right place. for you will not find prices more fair or supplies more generous in any region upon Norrath as you will here. in New Tanaan.");
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
#END of FILE Zone:poknowledge  ID:202075 -- Ellis_Cloudchaser 

