##zonecontroller.pl ID 56228 in Steamfont Mountains##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##

sub EVENT_SIGNAL {
	if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(56208); 
		quest::depopall(56209);
		quest::depopall(56210);
		quest::depopall(56211);
		quest::depopall(56212);
		quest::depopall(56213);
		quest::depopall(56214);
		quest::depopall(56215);
		quest::depopall(56216);
		quest::depopall(56217);
		quest::depopall(56218);
		quest::depopall(56219);
		quest::depopall(56220);
		quest::depopall(56221);
		quest::depopall(56222);
		quest::depopall(56223);
		quest::depopall(56224);
		quest::depopall(56225);
		quest::depopall(56226);
		quest::depopall(56227);
	if($signal >= 1 && $signal <= 5) {
	    quest::spawn2(56208,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56209,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56209,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56209,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56209,0,0,-1107.9,-1887.7,-109.8,27);
		}
	if($signal >= 6 && $signal <= 10) {
	    quest::spawn2(56210,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56211,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56211,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56211,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56211,0,0,-1107.9,-1887.7,-109.8,27);
		}
		if($signal >= 11 && $signal <= 15) {
	    quest::spawn2(56212,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56213,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56213,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56213,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56213,0,0,-1107.9,-1887.7,-109.8,27);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(56214,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56215,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56215,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56215,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56215,0,0,-1107.9,-1887.7,-109.8,27);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(56216,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56217,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56217,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56217,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56217,0,0,-1107.9,-1887.7,-109.8,27);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(56218,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56219,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56219,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56219,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56219,0,0,-1107.9,-1887.7,-109.8,27);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(56220,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56221,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56221,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56221,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56221,0,0,-1107.9,-1887.7,-109.8,27);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(56222,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56223,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56223,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56223,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56223,0,0,-1107.9,-1887.7,-109.8,27);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(56224,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56225,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56225,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56225,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56225,0,0,-1107.9,-1887.7,-109.8,27);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(56226,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56227,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56227,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56227,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56227,0,0,-1107.9,-1887.7,-109.8,27);
		}
		if($signal >= 50 && $signal <= 65) {
		quest::depopall(56208); 
		quest::depopall(56209);
		quest::depopall(56210);
		quest::depopall(56211);
		quest::depopall(56212);
		quest::depopall(56213);
		quest::depopall(56214);
		quest::depopall(56215);
		quest::depopall(56216);
		quest::depopall(56217);
		quest::depopall(56218);
		quest::depopall(56219);
		quest::depopall(56220);
		quest::depopall(56221);
		quest::depopall(56222);
		quest::depopall(56223);
		quest::depopall(56224);
		quest::depopall(56225);
		quest::depopall(56226);
		quest::depopall(56227);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End
