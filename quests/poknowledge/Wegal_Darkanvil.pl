sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("An' a blessed day t'ye. friend. New Tanaan 'as not seen this level of excitement in quite some time -- it is a warmly received break from the serious and almost somber atmosphere this fair little place be known fer. In any case. perhaps ye be searchin' fer some smithin' supplies. and if that be the case then ye 'ave come t'the right place! The Darkanvils were master smiths of our time in Kaladim. before its fair gates opened to the surface above. no doubt. We 'ave recreated some of the supplies commonly used in this trade on your world and offer them at a fair price. we guarantee!");
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
#END of FILE Zone:poknowledge  ID:202146 -- Wegal_Darkanvil 

