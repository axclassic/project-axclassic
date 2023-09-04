sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("gives a quaint. warm smile of welcoming. 'Greetin's an' well met. friend! I be Magnar Quok an' black smithin' be me trade! If ye by chance 'ave an affinity fer the anvil an' 'ammer as well. then ye 'ave certainly come t'the right place! Come. dinnae be shy an' search me wares! I'm certain I 'old somethin' that would be of use t'ye in the ways of iron and fire!'");
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
#END of FILE Zone:poknowledge  ID:202087 -- Magnar_Quok 

