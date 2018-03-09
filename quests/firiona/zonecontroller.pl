##zonecontroller.pl ID 84423 in Firiona Vie##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(84403); 
		quest::depopall(84404);
		quest::depopall(84405);
		quest::depopall(84406);
		quest::depopall(84407);
		quest::depopall(84408);
		quest::depopall(84409);
		quest::depopall(84410);
		quest::depopall(84411);
		quest::depopall(84412);
		quest::depopall(84413);
		quest::depopall(84414);
		quest::depopall(84415);
		quest::depopall(84416);
		quest::depopall(84417);
		quest::depopall(84418);
		quest::depopall(84419);
		quest::depopall(84420);
		quest::depopall(84421);
		quest::depopall(84422);
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(84403,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84404,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84404,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84404,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84404,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	if($signal >= 6 && $signal <= 10) {
		quest::spawn2(84405,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84406,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84406,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84406,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84406,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	if($signal >= 11 && $signal <= 15) {
		quest::spawn2(84407,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84408,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84408,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84408,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84408,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(84409,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84410,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84410,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84410,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84410,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(84411,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84412,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84412,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84412,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84412,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(84413,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84414,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84414,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84414,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84414,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(84415,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84416,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84416,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84416,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84416,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(84417,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84418,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84418,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84418,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84418,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(84419,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84420,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84420,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84420,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84420,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(84421,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84422,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84422,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84422,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84422,0,0,-2430.3,3579.9,-93.3,248.6);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End