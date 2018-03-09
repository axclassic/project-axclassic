##zonecontroller.pl ID 70090 in Dagnors Cauldron##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##

sub EVENT_SIGNAL {
	if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(70070); 
		quest::depopall(70071);
		quest::depopall(70072);
		quest::depopall(70073);
		quest::depopall(70074);
		quest::depopall(70075);
		quest::depopall(70076);
		quest::depopall(70077);
		quest::depopall(70078);
		quest::depopall(70079);
		quest::depopall(70080);
		quest::depopall(70081);
		quest::depopall(70082);
		quest::depopall(70083);
		quest::depopall(70084);
		quest::depopall(70085);
		quest::depopall(70086);
		quest::depopall(70087);
		quest::depopall(70088);
		quest::depopall(70089);
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(70070,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70071,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70071,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70071,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70071,0,0,-135.3,1405,173.2,243.3);
		}
	if($signal >= 6 && $signal <= 10) {
		quest::spawn2(70072,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70073,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70073,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70073,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70073,0,0,-135.3,1405,173.2,243.3);
		}
	if($signal >= 11 && $signal <= 15) {
		quest::spawn2(70074,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70075,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70075,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70075,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70075,0,0,-135.3,1405,173.2,243.3);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(70076,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70077,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70077,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70077,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70077,0,0,-135.3,1405,173.2,243.3);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(70078,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70079,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70079,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70079,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70079,0,0,-135.3,1405,173.2,243.3);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(70080,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70081,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70081,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70081,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70081,0,0,-135.3,1405,173.2,243.3);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(70082,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70083,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70083,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70083,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70083,0,0,-135.3,1405,173.2,243.3);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(70084,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70085,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70085,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70085,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70085,0,0,-135.3,1405,173.2,243.3);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(70086,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70087,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70087,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70087,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70087,0,0,-135.3,1405,173.2,243.3);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(70088,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70089,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70089,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70089,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70089,0,0,-135.3,1405,173.2,243.3);
		}
	if($signal >= 50 && $signal <= 65) {
		quest::depopall(70070); 
		quest::depopall(70071);
		quest::depopall(70072);
		quest::depopall(70073);
		quest::depopall(70074);
		quest::depopall(70075);
		quest::depopall(70076);
		quest::depopall(70077);
		quest::depopall(70078);
		quest::depopall(70079);
		quest::depopall(70080);
		quest::depopall(70081);
		quest::depopall(70082);
		quest::depopall(70083);
		quest::depopall(70084);
		quest::depopall(70085);
		quest::depopall(70086);
		quest::depopall(70087);
		quest::depopall(70088);
		quest::depopall(70089);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End
