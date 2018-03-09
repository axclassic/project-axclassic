##zonecontroller.pl ID 83382 in Swamp of No Hope##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##

sub EVENT_SIGNAL {
	if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(83362); 
		quest::depopall(83363);
		quest::depopall(83364);
		quest::depopall(83365);
		quest::depopall(83366);
		quest::depopall(83367);
		quest::depopall(83368);
		quest::depopall(83369);
		quest::depopall(83370);
		quest::depopall(83371);
		quest::depopall(83372);
		quest::depopall(83373);
		quest::depopall(83374);
		quest::depopall(83375);
		quest::depopall(83376);
		quest::depopall(83377);
		quest::depopall(83378);
		quest::depopall(83379);
		quest::depopall(83380);
		quest::depopall(83381);
		quest::depopall(83361);
	if($signal >= 1 && $signal <= 5) {
	    quest::spawn2(83361,0,0,-1943,-1145.6,25,171.8); ##Peter Cottontail
		quest::spawn2(83362,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83363,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83363,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83363,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83363,0,0,656.7,4347.8,72.3,77.3);
		}
	if($signal >= 6 && $signal <= 10) {
	    quest::spawn2(83361,0,0,-1943,-1145.6,25,171.8); ##Peter Cottontail
		quest::spawn2(83364,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83365,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83365,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83365,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83365,0,0,656.7,4347.8,72.3,77.3);
		}
	if($signal >= 11 && $signal <= 15) {
	    quest::spawn2(83361,0,0,-1943,-1145.6,25,171.8); ##Peter Cottontail
		quest::spawn2(83366,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83367,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83367,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83367,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83367,0,0,656.7,4347.8,72.3,77.3);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(83361,0,0,-1943,-1145.6,25,171.8); ##Peter Cottontail
		quest::spawn2(83368,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83369,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83369,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83369,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83369,0,0,656.7,4347.8,72.3,77.3);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(83361,0,0,-1943,-1145.6,25,171.8); ##Peter Cottontail
		quest::spawn2(83370,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83371,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83371,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83371,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83371,0,0,656.7,4347.8,72.3,77.3);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(83361,0,0,-1943,-1145.6,25,171.8); ##Peter Cottontail
		quest::spawn2(83372,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83373,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83373,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83373,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83373,0,0,656.7,4347.8,72.3,77.3);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(83361,0,0,-1943,-1145.6,25,171.8); ##Peter Cottontail
		quest::spawn2(83374,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83375,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83375,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83375,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83375,0,0,656.7,4347.8,72.3,77.3);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(83361,0,0,-1943,-1145.6,25,171.8); ##Peter Cottontail
		quest::spawn2(83376,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83377,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83377,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83377,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83377,0,0,656.7,4347.8,72.3,77.3);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(83361,0,0,-1943,-1145.6,25,171.8); ##Peter Cottontail
		quest::spawn2(83378,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83379,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83379,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83379,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83379,0,0,656.7,4347.8,72.3,77.3);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(83361,0,0,-1943,-1145.6,25,171.8); ##Peter Cottontail
		quest::spawn2(83380,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83381,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83381,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83381,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83381,0,0,656.7,4347.8,72.3,77.3);
		}
	if($signal >= 50 && $signal <= 65) {
		quest::spawn2(83361,0,0,-1943,-1145.6,25,171.8); ##Peter Cottontail
		quest::depopall(83362); 
		quest::depopall(83363);
		quest::depopall(83364);
		quest::depopall(83365);
		quest::depopall(83366);
		quest::depopall(83367);
		quest::depopall(83368);
		quest::depopall(83369);
		quest::depopall(83370);
		quest::depopall(83371);
		quest::depopall(83372);
		quest::depopall(83373);
		quest::depopall(83374);
		quest::depopall(83375);
		quest::depopall(83376);
		quest::depopall(83377);
		quest::depopall(83378);
		quest::depopall(83379);
		quest::depopall(83380);
		quest::depopall(83381);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End
