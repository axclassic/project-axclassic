##zonecontroller.pl ID 47233 in The Feerrott##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##

sub EVENT_SIGNAL {
	if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(47213); 
		quest::depopall(47214);
		quest::depopall(47215);
		quest::depopall(47216);
		quest::depopall(47217);
		quest::depopall(47218);
		quest::depopall(47219);
		quest::depopall(47220);
		quest::depopall(47221);
		quest::depopall(47222);
		quest::depopall(47223);
		quest::depopall(47224);
		quest::depopall(47225);
		quest::depopall(47226);
		quest::depopall(47227);
		quest::depopall(47228);
		quest::depopall(47229);
		quest::depopall(47230);
		quest::depopall(47231);
		quest::depopall(47232);
	if($signal >= 1 && $signal <= 5) {
	    quest::spawn2(47213,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47214,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47214,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47214,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47214,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	if($signal >= 6 && $signal <= 10) {
	    quest::spawn2(47215,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47216,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47216,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47216,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47216,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	if($signal >= 11 && $signal <= 15) {
	    quest::spawn2(47217,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47218,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47218,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47218,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47218,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(47219,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47220,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47220,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47220,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47220,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(47221,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47222,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47222,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47222,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47222,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(47223,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47224,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47224,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47224,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47224,0,0,-2499.6,-1396.1,-7.3,236.1);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(47225,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47226,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47226,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47226,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47226,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(47227,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47228,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47228,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47228,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47228,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(47229,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47230,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47230,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47230,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47230,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(47231,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47232,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47232,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47232,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47232,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	if($signal >= 50 && $signal <= 65) {
		quest::depopall(47213); 
		quest::depopall(47214);
		quest::depopall(47215);
		quest::depopall(47216);
		quest::depopall(47217);
		quest::depopall(47218);
		quest::depopall(47219);
		quest::depopall(47220);
		quest::depopall(47221);
		quest::depopall(47222);
		quest::depopall(47223);
		quest::depopall(47224);
		quest::depopall(47225);
		quest::depopall(47226);
		quest::depopall(47227);
		quest::depopall(47228);
		quest::depopall(47229);
		quest::depopall(47230);
		quest::depopall(47231);
		quest::depopall(47232);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End
