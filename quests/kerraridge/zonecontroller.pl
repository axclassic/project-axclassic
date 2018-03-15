##zonecontroller.pl ID 74561 in Kerra Ridge##
sub EVENT_SPAWN {
	if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(75560,0,0,-711.2,570.3,16.6,86.8); ##Peter Cottontail
	}
	}