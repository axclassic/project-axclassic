##zonecontroller.pl ID 12215 in West Karana qey2hh1##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(12195); 
		quest::depopall(12196);
		quest::depopall(12197);
		quest::depopall(12198);
		quest::depopall(12199);
		quest::depopall(12200);
		quest::depopall(12201);
		quest::depopall(12202);
		quest::depopall(12203);
		quest::depopall(12204);
		quest::depopall(12205);
		quest::depopall(12206);
		quest::depopall(12207);
		quest::depopall(12208);
		quest::depopall(12209);
		quest::depopall(12210);
		quest::depopall(12211);
		quest::depopall(12212);
		quest::depopall(12213);
		quest::depopall(12214);
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(12195,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12196,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12196,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12196,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12196,0,0,-1567,567.1,-11.3,178.4);
		}
	if($signal >= 6 && $signal <= 10) {
		quest::spawn2(12197,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12198,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12198,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12198,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12198,0,0,-1567,567.1,-11.3,178.4);
		}
	if($signal >= 11 && $signal <= 15) {
		quest::spawn2(12199,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12200,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12200,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12200,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12200,0,0,-1567,567.1,-11.3,178.4);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(12201,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12202,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12202,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12202,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12202,0,0,-1567,567.1,-11.3,178.4);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(12203,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12204,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12204,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12204,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12204,0,0,-1567,567.1,-11.3,178.4);
		}
	if($signal >= 26 && $signal <= 30) { 
		quest::spawn2(12205,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12206,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12206,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12206,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12206,0,0,-1567,567.1,-11.3,178.4);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(12207,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12208,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12208,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12208,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12208,0,0,-1567,567.1,-11.3,178.4);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(12209,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12210,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12210,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12210,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12210,0,0,-1567,567.1,-11.3,178.4);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(12211,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12212,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12212,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12212,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12212,0,0,-1567,567.1,-11.3,178.4);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(12213,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12214,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12214,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12214,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12214,0,0,-1567,567.1,-11.3,178.4);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End