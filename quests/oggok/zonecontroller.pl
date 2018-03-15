##zonecontroller.pl ID 49138 in Oggok##
sub EVENT_SPAWN {
	if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(49137,0,0,391.7,251.8,57.8,67.4); ##Peter Cottontail
	}
	}