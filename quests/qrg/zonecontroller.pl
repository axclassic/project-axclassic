##zonecontroller.pl ID 3086 in Surefall Glades qrg##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##

sub EVENT_SIGNAL {
	if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(3072); 
		quest::depopall(3073);
		quest::depopall(3074);
		quest::depopall(3075);
		quest::depopall(3076);
		quest::depopall(3077);
		quest::depopall(3078);
		quest::depopall(3079);
		quest::depopall(3080);
		quest::depopall(3081);
		quest::depopall(3082);
		quest::depopall(3083);
		quest::depopall(3084);
		quest::depopall(3085);
		quest::depopall(3066);
		quest::depopall(3067);
		quest::depopall(3068);
		quest::depopall(3069);
		quest::depopall(3070);
		quest::depopall(3071);
		quest::depopall(3065);
	if($signal >= 1 && $signal <= 5) {
	    quest::spawn2(3065,0,0,107.3,62.4,1,164.1); ##Peter Cottontail
		quest::spawn2(3072,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3073,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3073,0,0,183.6,304,1,147.1);
		quest::spawn2(3073,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3073,0,0,144.2,293.6,1,157.5);
		}
	if($signal >= 6 && $signal <= 10) {
		quest::spawn2(3065,0,0,107.3,62.4,1,164.1); ##Peter Cottontail
		quest::spawn2(3074,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3075,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3075,0,0,183.6,304,1,147.1);
		quest::spawn2(3075,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3075,0,0,144.2,293.6,1,157.5);
		}
	if($signal >= 11 && $signal <= 15) {
		quest::spawn2(3065,0,0,107.3,62.4,1,164.1); ##Peter Cottontail
		quest::spawn2(3076,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3077,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3077,0,0,183.6,304,1,147.1);
		quest::spawn2(3077,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3077,0,0,144.2,293.6,1,157.5);
	    }
	if($signal >= 16 && $signal <= 20) {
	    quest::spawn2(3065,0,0,107.3,62.4,1,164.1); ##Peter Cottontail
		quest::spawn2(3078,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3079,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3079,0,0,183.6,304,1,147.1);
		quest::spawn2(3079,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3079,0,0,144.2,293.6,1,157.5);
	    }
	if($signal >= 21 && $signal <= 25) {
	    quest::spawn2(3065,0,0,107.3,62.4,1,164.1); ##Peter Cottontail
		quest::spawn2(3080,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3081,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3081,0,0,183.6,304,1,147.1);
		quest::spawn2(3081,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3081,0,0,144.2,293.6,1,157.5);
	    }
	if($signal >= 26 && $signal <= 30) {
	    quest::spawn2(3065,0,0,107.3,62.4,1,164.1); ##Peter Cottontail
		quest::spawn2(3082,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3083,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3083,0,0,183.6,304,1,147.1);
		quest::spawn2(3083,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3083,0,0,144.2,293.6,1,157.5);
	    }
	if($signal >= 31 && $signal <= 35) {
	    quest::spawn2(3065,0,0,107.3,62.4,1,164.1); ##Peter Cottontail
		quest::spawn2(3084,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3085,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3085,0,0,183.6,304,1,147.1);
		quest::spawn2(3085,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3085,0,0,144.2,293.6,1,157.5);
	    }
	if($signal >= 36 && $signal <= 40) {
	    quest::spawn2(3065,0,0,107.3,62.4,1,164.1); ##Peter Cottontail
		quest::spawn2(3066,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3067,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3067,0,0,183.6,304,1,147.1);
		quest::spawn2(3067,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3067,0,0,144.2,293.6,1,157.5);
	   }
	if($signal >= 41 && $signal <= 45) {
	    quest::spawn2(3065,0,0,107.3,62.4,1,164.1); ##Peter Cottontail
		quest::spawn2(3068,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3069,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3069,0,0,183.6,304,1,147.1);
		quest::spawn2(3069,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3069,0,0,144.2,293.6,1,157.5);
	    }
	if($signal >= 46 && $signal <= 49) {
	    quest::spawn2(3065,0,0,107.3,62.4,1,164.1); ##Peter Cottontail
		quest::spawn2(3070,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3071,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3071,0,0,183.6,304,1,147.1);
		quest::spawn2(3071,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3071,0,0,144.2,293.6,1,157.5);
	    }
		if($signal >= 50 && $signal <= 65) {
		quest::spawn2(3065,0,0,107.3,62.4,1,164.1); ##Peter Cottontail
		quest::depopall(3072); 
		quest::depopall(3073);
		quest::depopall(3074);
		quest::depopall(3075);
		quest::depopall(3076);
		quest::depopall(3077);
		quest::depopall(3078);
		quest::depopall(3079);
		quest::depopall(3080);
		quest::depopall(3081);
		quest::depopall(3082);
		quest::depopall(3083);
		quest::depopall(3084);
		quest::depopall(3085);
		quest::depopall(3066);
		quest::depopall(3067);
		quest::depopall(3068);
		quest::depopall(3069);
		quest::depopall(3070);
		quest::depopall(3071);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End
