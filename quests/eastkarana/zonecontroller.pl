##zonecontroller.pl ID 15218 in East Karana##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(15198); 
		quest::depopall(15199);
		quest::depopall(15200);
		quest::depopall(15201);
		quest::depopall(15202);
		quest::depopall(15203);
		quest::depopall(15204);
		quest::depopall(15205);
		quest::depopall(15206);
		quest::depopall(15207);
		quest::depopall(15208);
		quest::depopall(15209);
		quest::depopall(15210);
		quest::depopall(15211);
		quest::depopall(15212);
		quest::depopall(15213);
		quest::depopall(15214);
		quest::depopall(15215);
		quest::depopall(15216);
		quest::depopall(15217);
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(15198,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15199,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15199,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15199,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15199,0,0,965.5,-147.6,-65.5,167.4);
		}
	if($signal >= 6 && $signal <= 10) {
		quest::spawn2(15200,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15201,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15201,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15201,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15201,0,0,965.5,-147.6,-65.5,167.4);
		}
	if($signal >= 11 && $signal <= 15) {
		quest::spawn2(15202,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15203,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15203,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15203,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15203,0,0,965.5,-147.6,-65.5,167.4);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(15204,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15205,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15205,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15205,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15205,0,0,965.5,-147.6,-65.5,167.4);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(15206,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15207,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15207,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15207,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15207,0,0,965.5,-147.6,-65.5,167.4);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(15208,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15209,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15209,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15209,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15209,0,0,965.5,-147.6,-65.5,167.4);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(15210,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15211,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15211,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15211,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15211,0,0,965.5,-147.6,-65.5,167.4);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(15212,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15213,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15213,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15213,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15213,0,0,965.5,-147.6,-65.5,167.4);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(15214,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15215,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15215,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15215,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15215,0,0,965.5,-147.6,-65.5,167.4);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(15216,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15217,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15217,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15217,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15217,0,0,965.5,-147.6,-65.5,167.4);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End