##zonecontroller.pl ID 9186 in West Freeport##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##

sub EVENT_SIGNAL {
	if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(9166); 
    	quest::depopall(9167);
	    quest::depopall(9168);
	    quest::depopall(9169);
	    quest::depopall(9170);
	    quest::depopall(9171);
	    quest::depopall(9172);
	    quest::depopall(9173);
	    quest::depopall(9174);
	    quest::depopall(9175);
	    quest::depopall(9176);
	    quest::depopall(9177);
	    quest::depopall(9178);
	    quest::depopall(9179);
	    quest::depopall(9180);
	    quest::depopall(9181);
	    quest::depopall(9182);
	    quest::depopall(9183);
	    quest::depopall(9184);
	    quest::depopall(9185);
		quest::depopall(9165);
	if($signal >= 1 && $signal <= 5) {
	    quest::spawn2(9165,0,0,-66.5,59.1,-27,101.4); ##Peter Cottontail
		quest::spawn2(9166,0,0,567.8,-576.5,-27,246.1);
		quest::spawn2(9167,0,0,526.6,-576.4,-27,254.5);
		quest::spawn2(9167,0,0,535.9,-538.1,-27,31);
		quest::spawn2(9167,0,0,580,-538.8,-27,232.9);
		quest::spawn2(9167,0,0,611.7,-575.1,-27,238.8);
		}
	if($signal >= 6 && $signal <= 10) {
	    quest::spawn2(9165,0,0,-66.5,59.1,-27,101.4); ##Peter Cottontail
		quest::spawn2(9168,0,0,567.8,-576.5,-27,246.1);
		quest::spawn2(9169,0,0,526.6,-576.4,-27,254.5);
		quest::spawn2(9169,0,0,535.9,-538.1,-27,31);
		quest::spawn2(9169,0,0,580,-538.8,-27,232.9);
		quest::spawn2(9169,0,0,611.7,-575.1,-27,238.8);
		}
	if($signal >= 11 && $signal <= 15) {
	    quest::spawn2(9165,0,0,-66.5,59.1,-27,101.4); ##Peter Cottontail
		quest::spawn2(9170,0,0,567.8,-576.5,-27,246.1);
		quest::spawn2(9171,0,0,526.6,-576.4,-27,254.5);
		quest::spawn2(9171,0,0,535.9,-538.1,-27,31);
		quest::spawn2(9171,0,0,580,-538.8,-27,232.9);
		quest::spawn2(9171,0,0,611.7,-575.1,-27,238.8);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(9165,0,0,-66.5,59.1,-27,101.4); ##Peter Cottontail
		quest::spawn2(9172,0,0,567.8,-576.5,-27,246.1);
		quest::spawn2(9173,0,0,526.6,-576.4,-27,254.5);
		quest::spawn2(9173,0,0,535.9,-538.1,-27,31);
		quest::spawn2(9173,0,0,580,-538.8,-27,232.9);
		quest::spawn2(9173,0,0,611.7,-575.1,-27,238.8);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(9165,0,0,-66.5,59.1,-27,101.4); ##Peter Cottontail
		quest::spawn2(9174,0,0,567.8,-576.5,-27,246.1);
		quest::spawn2(9175,0,0,526.6,-576.4,-27,254.5);
		quest::spawn2(9175,0,0,535.9,-538.1,-27,31);
		quest::spawn2(9175,0,0,580,-538.8,-27,232.9);
		quest::spawn2(9175,0,0,611.7,-575.1,-27,238.8);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(9165,0,0,-66.5,59.1,-27,101.4); ##Peter Cottontail
		quest::spawn2(9176,0,0,567.8,-576.5,-27,246.1);
		quest::spawn2(9177,0,0,526.6,-576.4,-27,254.5);
		quest::spawn2(9177,0,0,535.9,-538.1,-27,31);
		quest::spawn2(9177,0,0,580,-538.8,-27,232.9);
		quest::spawn2(9177,0,0,611.7,-575.1,-27,238.8);
		}
	if($signal >= 31 && $signal <= 35) {
	    quest::spawn2(9165,0,0,-66.5,59.1,-27,101.4); ##Peter Cottontail
	    quest::spawn2(9178,0,0,567.8,-576.5,-27,246.1);
	    quest::spawn2(9179,0,0,526.6,-576.4,-27,254.5);
	    quest::spawn2(9179,0,0,535.9,-538.1,-27,31);
	    quest::spawn2(9179,0,0,580,-538.8,-27,232.9);
	    quest::spawn2(9179,0,0,611.7,-575.1,-27,238.8);
	    }
	if($signal >= 36 && $signal <= 40) {
	    quest::spawn2(9165,0,0,-66.5,59.1,-27,101.4); ##Peter Cottontail
	    quest::spawn2(9180,0,0,567.8,-576.5,-27,246.1);
	    quest::spawn2(9181,0,0,526.6,-576.4,-27,254.5);
	    quest::spawn2(9181,0,0,535.9,-538.1,-27,31);
	    quest::spawn2(9181,0,0,580,-538.8,-27,232.9);
	    quest::spawn2(9181,0,0,611.7,-575.1,-27,238.8);
	    }
	if($signal >= 41 && $signal <= 45) {
	   quest::spawn2(9165,0,0,-66.5,59.1,-27,101.4); ##Peter Cottontail
	   quest::spawn2(9182,0,0,567.8,-576.5,-27,246.1);
	   quest::spawn2(9183,0,0,526.6,-576.4,-27,254.5);
	   quest::spawn2(9183,0,0,535.9,-538.1,-27,31);
	   quest::spawn2(9183,0,0,580,-538.8,-27,232.9);
	   quest::spawn2(9183,0,0,611.7,-575.1,-27,238.8);
	   }
	if($signal >= 46 && $signal <= 49) {
	   quest::spawn2(9165,0,0,-66.5,59.1,-27,101.4); ##Peter Cottontail
	   quest::spawn2(9184,0,0,567.8,-576.5,-27,246.1);
	   quest::spawn2(9185,0,0,526.6,-576.4,-27,254.5);
	   quest::spawn2(9185,0,0,535.9,-538.1,-27,31);
	   quest::spawn2(9185,0,0,580,-538.8,-27,232.9);
	   quest::spawn2(9185,0,0,611.7,-575.1,-27,238.8);
	   }
	if($signal >= 50 && $signal <= 65) {
	   quest::spawn2(9165,0,0,-66.5,59.1,-27,101.4); ##Peter Cottontail
	   quest::depopall(9163);
	   quest::depopall(9164);
	   quest::depopall(9166);
	   quest::depopall(9175);
	   quest::depopall(9167);
	   quest::depopall(9176);
	   quest::depopall(9168);
	   quest::depopall(9177);
	   quest::depopall(9169);
	   quest::depopall(9178);
       quest::depopall(9170);
	   quest::depopall(9179);
	   quest::depopall(9171);
	   quest::depopall(9180);
	   quest::depopall(9172);
	   quest::depopall(9181);
	   quest::depopall(9173);
	   quest::depopall(9182);
	   quest::depopall(9183);
	   quest::depopall(9174);
		}
	else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End
