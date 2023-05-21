sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Well. good day t'ye. traveler and welcome t'New Tanaan! We pride ourselves upon the knowledge and wisdom each lad and lass of this fine city has come to study for the rest of their days. Yee need not be worrin' 'bout any lack of acceptance or aid from us. stranger. fer we all be willin' t'aid any who would merely lend an ear. and in some cases. a bit of coin. Aye. traveler. we do still be needin' a bit of gold 'ere an' there if we are to support the sudden flood of ye travelers. now don't we? In any case. dinnae let such small stipulations bother ye. fer our prices be quite fair. Now. if ye be a cleric. then ye 'ave come t'the right place. friend. I myself am a priest of Brell. an' what knowledge I 'ave fer the takin' is yours should ye provide the asked price. o'course.");
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
#END of FILE Zone:poknowledge  ID:202221 -- Vicar_Delin 

