sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the Plane of Knowledge, or New Tanaan. All are welcome here, so please feel free to explore. Our home here is a safe haven to those who seek knowledge of all sorts, and many find themselves setting off upon new adventures based on what they find here. No harmful magics may be used, nor weapons. Our fair city also acts as a hub of sorts into Norrath and other destinations. Are you [new to the world]?"); }
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
