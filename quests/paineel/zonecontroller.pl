##zonecontroller.pl ID 75192 in Paineel##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##

sub EVENT_SIGNAL {
	if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(75172); 
		quest::depopall(75173);
		quest::depopall(75174);
		quest::depopall(75175);
		quest::depopall(75176);
		quest::depopall(75177);
		quest::depopall(75178);
		quest::depopall(75179);
		quest::depopall(75180);
		quest::depopall(75181);
		quest::depopall(75182);
		quest::depopall(75183);
		quest::depopall(75184);
		quest::depopall(75185);
		quest::depopall(75186);
		quest::depopall(75187);
		quest::depopall(75188);
		quest::depopall(75189);
		quest::depopall(75190);
		quest::depopall(75191);
		quest::depopall(75171);
	if($signal >= 1 && $signal <= 5) {
	    quest::spawn2(75171,0,0,-75.8,1099.8,1,144.8); ##Peter Cottontail
		quest::spawn2(75172,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75173,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75173,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75173,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75173,0,0,-592.9,1520.3,1,81.5);
		}
	if($signal >= 6 && $signal <= 10) {
	    quest::spawn2(75171,0,0,-75.8,1099.8,1,144.8); ##Peter Cottontail
		quest::spawn2(75174,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75175,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75175,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75175,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75175,0,0,-592.9,1520.3,1,81.5);
		}
	if($signal >= 11 && $signal <= 15) {
	    quest::spawn2(75171,0,0,-75.8,1099.8,1,144.8); ##Peter Cottontail
		quest::spawn2(75176,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75177,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75177,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75177,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75177,0,0,-592.9,1520.3,1,81.5);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(75171,0,0,-75.8,1099.8,1,144.8); ##Peter Cottontail
		quest::spawn2(75178,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75179,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75179,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75179,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75179,0,0,-592.9,1520.3,1,81.5);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(75171,0,0,-75.8,1099.8,1,144.8); ##Peter Cottontail
		quest::spawn2(75180,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75181,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75181,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75181,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75181,0,0,-592.9,1520.3,1,81.5);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(75171,0,0,-75.8,1099.8,1,144.8); ##Peter Cottontail
		quest::spawn2(75182,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75183,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75183,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75183,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75183,0,0,-592.9,1520.3,1,81.5);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(75171,0,0,-75.8,1099.8,1,144.8); ##Peter Cottontail
		quest::spawn2(75184,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75185,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75185,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75185,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75185,0,0,-592.9,1520.3,1,81.5);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(75171,0,0,-75.8,1099.8,1,144.8); ##Peter Cottontail
		quest::spawn2(75186,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75187,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75187,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75187,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75187,0,0,-592.9,1520.3,1,81.5);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(75171,0,0,-75.8,1099.8,1,144.8); ##Peter Cottontail
		quest::spawn2(75188,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75189,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75189,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75189,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75189,0,0,-592.9,1520.3,1,81.5);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(75171,0,0,-75.8,1099.8,1,144.8); ##Peter Cottontail
		quest::spawn2(75190,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75191,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75191,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75191,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75191,0,0,-592.9,1520.3,1,81.5);
		}
	if($signal >= 50 && $signal <= 65) {
		quest::spawn2(75171,0,0,-75.8,1099.8,1,144.8); ##Peter Cottontail
		quest::depopall(75172); 
		quest::depopall(75173);
		quest::depopall(75174);
		quest::depopall(75175);
		quest::depopall(75176);
		quest::depopall(75177);
		quest::depopall(75178);
		quest::depopall(75179);
		quest::depopall(75180);
		quest::depopall(75181);
		quest::depopall(75182);
		quest::depopall(75183);
		quest::depopall(75184);
		quest::depopall(75185);
		quest::depopall(75186);
		quest::depopall(75187);
		quest::depopall(75188);
		quest::depopall(75189);
		quest::depopall(75190);
		quest::depopall(75191);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End
