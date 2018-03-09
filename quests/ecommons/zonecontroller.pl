##zonecontroller.pl ID 22261 in ecommons##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(22241); 
		quest::depopall(22242);
		quest::depopall(22243);
		quest::depopall(22244);
		quest::depopall(22245);
		quest::depopall(22246);
		quest::depopall(22247);
		quest::depopall(22248);
		quest::depopall(22249);
		quest::depopall(22250);
		quest::depopall(22251);
		quest::depopall(22252);
		quest::depopall(22253);
		quest::depopall(22254);
		quest::depopall(22255);
		quest::depopall(22256);
		quest::depopall(22257);
		quest::depopall(22258);
		quest::depopall(22259);
		quest::depopall(22260);
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(22241,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22242,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22242,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22242,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22242,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	if($signal >= 6 && $signal <= 10) {
		quest::spawn2(22243,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22244,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22244,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22244,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22244,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	if($signal >= 11 && $signal <= 15) {
		quest::spawn2(22245,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22246,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22246,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22246,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22246,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(22247,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22248,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22248,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22248,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22248,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(22249,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22250,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22250,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22250,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22250,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(22251,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22252,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22252,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22252,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22252,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(22253,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22254,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22254,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22254,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22254,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(22255,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22256,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22256,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22256,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22256,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(22257,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22258,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22258,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22258,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22258,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(22259,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22260,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22260,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22260,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22260,0,0,-1039.9,-533.4,-53.5,227.6);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End