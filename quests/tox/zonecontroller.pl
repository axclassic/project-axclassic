##zonecontroller.pl ID 38235 in Toxxulia Forest##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##

sub EVENT_SIGNAL {
	if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(38215); 
		quest::depopall(38216);
		quest::depopall(38217);
		quest::depopall(38218);
		quest::depopall(38219);
		quest::depopall(38220);
		quest::depopall(38221);
		quest::depopall(38222);
		quest::depopall(38223);
		quest::depopall(38224);
		quest::depopall(38225);
		quest::depopall(38226);
		quest::depopall(38227);
		quest::depopall(38228);
		quest::depopall(38229);
		quest::depopall(28230);
		quest::depopall(38231);
		quest::depopall(38232);
		quest::depopall(38233);
		quest::depopall(38234);
		quest::depopall(38214);
	if($signal >= 1 && $signal <= 5) {
	    quest::spawn2(38214,0,0,276.7,2373,-48.5,125.4); ##Peter Cottontail
		quest::spawn2(38215,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38216,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38216,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38216,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38216,0,0,1148.6,549.6,-52.4,197.5);
		}
	if($signal >= 6 && $signal <= 10) {
	    quest::spawn2(38214,0,0,276.7,2373,-48.5,125.4); ##Peter Cottontail
		quest::spawn2(38217,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38218,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38218,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38218,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38218,0,0,1148.6,549.6,-52.4,197.5);
		}
		if($signal >= 11 && $signal <= 15) {
	    quest::spawn2(38214,0,0,276.7,2373,-48.5,125.4); ##Peter Cottontail
		quest::spawn2(38219,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38220,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38220,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38220,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38220,0,0,1148.6,549.6,-52.4,197.5);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(38214,0,0,276.7,2373,-48.5,125.4); ##Peter Cottontail
		quest::spawn2(38221,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38222,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38222,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38222,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38222,0,0,1148.6,549.6,-52.4,197.5);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(38214,0,0,276.7,2373,-48.5,125.4); ##Peter Cottontail
		quest::spawn2(38223,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38224,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38224,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38224,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38224,0,0,1148.6,549.6,-52.4,197.5);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(38214,0,0,276.7,2373,-48.5,125.4); ##Peter Cottontail
		quest::spawn2(38225,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38226,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38226,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38226,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38226,0,0,1148.6,549.6,-52.4,197.5);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(38214,0,0,276.7,2373,-48.5,125.4); ##Peter Cottontail
		quest::spawn2(38227,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38228,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38228,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38228,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38228,0,0,1148.6,549.6,-52.4,197.5);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(38214,0,0,276.7,2373,-48.5,125.4); ##Peter Cottontail
		quest::spawn2(38229,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38230,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38230,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38230,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38230,0,0,1148.6,549.6,-52.4,197.5);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(38214,0,0,276.7,2373,-48.5,125.4); ##Peter Cottontail
		quest::spawn2(38231,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38232,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38232,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38232,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38232,0,0,1148.6,549.6,-52.4,197.5);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(38214,0,0,276.7,2373,-48.5,125.4); ##Peter Cottontail
		quest::spawn2(38233,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38234,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38234,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38234,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38234,0,0,1148.6,549.6,-52.4,197.5);
		}
	if($signal >= 50 && $signal <= 65) {
		quest::spawn2(38214,0,0,276.7,2373,-48.5,125.4); ##Peter Cottontail
		quest::depopall(38215); 
		quest::depopall(38216);
		quest::depopall(38217);
		quest::depopall(38218);
		quest::depopall(38219);
		quest::depopall(38220);
		quest::depopall(38221);
		quest::depopall(38222);
		quest::depopall(38223);
		quest::depopall(38224);
		quest::depopall(38225);
		quest::depopall(38226);
		quest::depopall(38227);
		quest::depopall(38228);
		quest::depopall(38229);
		quest::depopall(28230);
		quest::depopall(38231);
		quest::depopall(38232);
		quest::depopall(38233);
		quest::depopall(38234);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End
