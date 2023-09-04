# Charlie Brown
# Inform people of the event in Kithicor

sub EVENT_SPAWN {
	quest::settimer(1,180);
	quest::setglobal("halloween", 1, 5, "H13");
}

sub EVENT_TIMER {
	if ($timer == 1) {
		quest::stoptimer(1);
		quest::settimer(1,180);
		if ($qglobals{halloween} != 1) {
			quest::shout("Help! Everyone! The undead are preparing to attack Freeport! We plan to head them off in the Kithicor Forest. Please, lend us your strength!");
		}
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
