##zonecontroller.pl ID 61101 in Felwithea##
sub EVENT_SPAWN {
	if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(61100,0,0,72.9,13.6,1.9,169.6); ##Peter Cottontail
	}
	}