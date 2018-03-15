##zonecontroller.pl ID 19164 in Rivervale##
sub EVENT_SPAWN {
	if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(19163,0,0,-98.8,-81.6,1.9,8.8); ##Peter Cottontail
	}
	}