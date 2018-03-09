##zonecontroller.pl ID 93308 in Overthere##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel >= 50 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(93302); 
		quest::depopall(93303);
		quest::depopall(93304);
		quest::depopall(93305);
		quest::depopall(93306);
		quest::depopall(93307);
	if($signal >= 50 && $signal <= 55) {
		quest::spawn2(93302,0,0,-2706.6,-3119,143.6,239.4);
		quest::spawn2(93303,0,0,-2734.7,-3176.8,154.4);
		quest::spawn2(93303,0,0,-2730,-3137.9,145.8,242.4);
		quest::spawn2(93303,0,0,-2668.2,-3109.9,145.8,237.4);
		quest::spawn2(93303,0,0,-2630.9,-3138.4,155.5,236.9);
		}
	if($signal >= 56 && $signal <= 60) {
		quest::spawn2(93304,0,0,-2706.6,-3119,143.6,239.4);
		quest::spawn2(93305,0,0,-2734.7,-3176.8,154.4);
		quest::spawn2(93305,0,0,-2730,-3137.9,145.8,242.4);
		quest::spawn2(93305,0,0,-2668.2,-3109.9,145.8,237.4);
		quest::spawn2(93305,0,0,-2630.9,-3138.4,155.5,236.9);
		}
	if($signal >= 61 && $signal <= 65) {
		quest::spawn2(93306,0,0,-2706.6,-3119,143.6,239.4);
		quest::spawn2(93307,0,0,-2734.7,-3176.8,154.4);
		quest::spawn2(93307,0,0,-2730,-3137.9,145.8,242.4);
		quest::spawn2(93307,0,0,-2668.2,-3109.9,145.8,237.4);
		quest::spawn2(93307,0,0,-2630.9,-3138.4,155.5,236.9);
		}
	}
	else {
		#Do Nothing;
	}
} # EVENT_SIGNAL End