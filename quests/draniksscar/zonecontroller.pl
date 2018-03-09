##zonecontroller.pl ID 302084 in Draniks Scar##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel >= 50 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(302078); 
		quest::depopall(302079);
		quest::depopall(302080);
		quest::depopall(302081);
		quest::depopall(302082);
		quest::depopall(302083);
	if($signal >= 50 && $signal <= 55) {
		quest::spawn2(302080,0,0,-1498.2,-378.9,263.7,136.1);
		quest::spawn2(302081,0,0,-1462.3,-422.6,263.8,156.4);
		quest::spawn2(302081,0,0,-1468.9,-476.1,263.5,178.4);
		quest::spawn2(302081,0,0,-1535.2,-431.8,269.6,112.3);
		quest::spawn2(302081,0,0,-1544.1,-370.8,270.1,119.8);
		}
	if($signal >= 56 && $signal <= 60) {
		quest::spawn2(302082,0,0,-1498.2,-378.9,263.7,136.1);
		quest::spawn2(302083,0,0,-1462.3,-422.6,263.8,156.4);
		quest::spawn2(302083,0,0,-1468.9,-476.1,263.5,178.4);
		quest::spawn2(302083,0,0,-1535.2,-431.8,269.6,112.3);
		quest::spawn2(302083,0,0,-1544.1,-370.8,270.1,119.8);
		}
	if($signal >= 61 && $signal <= 65) {
		quest::spawn2(302078,0,0,-1498.2,-378.9,263.7,136.1);
		quest::spawn2(302079,0,0,-1462.3,-422.6,263.8,156.4);
		quest::spawn2(302079,0,0,-1468.9,-476.1,263.5,178.4);
		quest::spawn2(302079,0,0,-1535.2,-431.8,269.6,112.3);
		quest::spawn2(302079,0,0,-1544.1,-370.8,270.1,119.8);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End
	
