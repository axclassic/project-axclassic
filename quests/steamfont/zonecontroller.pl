##zonecontroller.pl ID 56228 in Steamfont##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 89) {
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
	elsif($signal == 90) {
	quest::spawn2(56208,0,0,-1110.5,-1923.2,-106.7,26.5);
	quest::spawn2(56209,0,0,-1044.6,-1938.3,-110.9,35.3);
	quest::spawn2(56209,0,0,-1050.5,-1902.6,-110.6,49.3);
	quest::spawn2(56209,0,0,-1069.9,-1864.1,-110.9,20.1);
	quest::spawn2(56209,0,0,-1107.9,-1887.7,-109.8,27);
	}
	elsif($signal == 91) {
	quest::spawn2(56210,0,0,-1110.5,-1923.2,-106.7,26.5);
	quest::spawn2(56211,0,0,-1044.6,-1938.3,-110.9,35.3);
	quest::spawn2(56211,0,0,-1050.5,-1902.6,-110.6,49.3);
	quest::spawn2(56211,0,0,-1069.9,-1864.1,-110.9,20.1);
	quest::spawn2(56211,0,0,-1107.9,-1887.7,-109.8,27);
	}
	elsif($signal == 92) {
	quest::spawn2(56212,0,0,-1110.5,-1923.2,-106.7,26.5);
	quest::spawn2(56213,0,0,-1044.6,-1938.3,-110.9,35.3);
	quest::spawn2(56213,0,0,-1050.5,-1902.6,-110.6,49.3);
	quest::spawn2(56213,0,0,-1069.9,-1864.1,-110.9,20.1);
	quest::spawn2(56213,0,0,-1107.9,-1887.7,-109.8,27);
	}
	elsif($signal == 93) {
	quest::spawn2(56214,0,0,-1110.5,-1923.2,-106.7,26.5);
	quest::spawn2(56215,0,0,-1044.6,-1938.3,-110.9,35.3);
	quest::spawn2(56215,0,0,-1050.5,-1902.6,-110.6,49.3);
	quest::spawn2(56215,0,0,-1069.9,-1864.1,-110.9,20.1);
	quest::spawn2(56215,0,0,-1107.9,-1887.7,-109.8,27);
	}
	elsif($signal == 94) {
	quest::spawn2(56216,0,0,-1110.5,-1923.2,-106.7,26.5);
	quest::spawn2(56217,0,0,-1044.6,-1938.3,-110.9,35.3);
	quest::spawn2(56217,0,0,-1050.5,-1902.6,-110.6,49.3);
	quest::spawn2(56217,0,0,-1069.9,-1864.1,-110.9,20.1);
	quest::spawn2(56217,0,0,-1107.9,-1887.7,-109.8,27);
	}
	elsif($signal == 95) {
	quest::spawn2(56218,0,0,-1110.5,-1923.2,-106.7,26.5);
	quest::spawn2(56219,0,0,-1044.6,-1938.3,-110.9,35.3);
	quest::spawn2(56219,0,0,-1050.5,-1902.6,-110.6,49.3);
	quest::spawn2(56219,0,0,-1069.9,-1864.1,-110.9,20.1);
	quest::spawn2(56219,0,0,-1107.9,-1887.7,-109.8,27);
	}
	elsif($signal == 96) {
	quest::spawn2(56220,0,0,-1110.5,-1923.2,-106.7,26.5);
	quest::spawn2(56221,0,0,-1044.6,-1938.3,-110.9,35.3);
	quest::spawn2(56221,0,0,-1050.5,-1902.6,-110.6,49.3);
	quest::spawn2(56221,0,0,-1069.9,-1864.1,-110.9,20.1);
	quest::spawn2(56221,0,0,-1107.9,-1887.7,-109.8,27);
	}
	elsif($signal == 97) {
	quest::spawn2(56222,0,0,-1110.5,-1923.2,-106.7,26.5);
	quest::spawn2(56223,0,0,-1044.6,-1938.3,-110.9,35.3);
	quest::spawn2(56223,0,0,-1050.5,-1902.6,-110.6,49.3);
	quest::spawn2(56223,0,0,-1069.9,-1864.1,-110.9,20.1);
	quest::spawn2(56223,0,0,-1107.9,-1887.7,-109.8,27);
	}
	elsif($signal == 98) {
	quest::spawn2(56224,0,0,-1110.5,-1923.2,-106.7,26.5);
	quest::spawn2(56225,0,0,-1044.6,-1938.3,-110.9,35.3);
	quest::spawn2(56225,0,0,-1050.5,-1902.6,-110.6,49.3);
	quest::spawn2(56225,0,0,-1069.9,-1864.1,-110.9,20.1);
	quest::spawn2(56225,0,0,-1107.9,-1887.7,-109.8,27);
	}
	elsif($signal == 99) {
	quest::spawn2(56226,0,0,-1110.5,-1923.2,-106.7,26.5);
	quest::spawn2(56227,0,0,-1044.6,-1938.3,-110.9,35.3);
	quest::spawn2(56227,0,0,-1050.5,-1902.6,-110.6,49.3);
	quest::spawn2(56227,0,0,-1069.9,-1864.1,-110.9,20.1);
	quest::spawn2(56227,0,0,-1107.9,-1887.7,-109.8,27);
	}
	else {
	#Do Nothing;
	}
	}