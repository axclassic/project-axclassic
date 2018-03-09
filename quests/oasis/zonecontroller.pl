##zonecontroller.pl ID 37191 in oasis##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(37171); 
		quest::depopall(37172);
		quest::depopall(37173);
		quest::depopall(37174);
		quest::depopall(37175);
		quest::depopall(37176);
		quest::depopall(37177);
		quest::depopall(37178);
		quest::depopall(37179);
		quest::depopall(37180);
		quest::depopall(37181);
		quest::depopall(37182);
		quest::depopall(37183);
		quest::depopall(37184);
		quest::depopall(37185);
		quest::depopall(37186);
		quest::depopall(37187);
		quest::depopall(37188);
		quest::depopall(37189);
		quest::depopall(37190);
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(37171,0,0,1360,428.5,17,241.9);
		quest::spawn2(37172,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37172,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37172,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37172,0,0,1378.9,491.8,8.5,250.3);
		}
	if($signal >= 6 && $signal <= 10) {
		quest::spawn2(37173,0,0,1360,428.5,17,241.9);
		quest::spawn2(37174,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37174,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37174,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37174,0,0,1378.9,491.8,8.5,250.3);
		}
	if($signal >= 11 && $signal <= 15) {
		quest::spawn2(37175,0,0,1360,428.5,17,241.9);
		quest::spawn2(37176,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37176,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37176,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37176,0,0,1378.9,491.8,8.5,250.3);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(37177,0,0,1360,428.5,17,241.9);
		quest::spawn2(37178,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37178,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37178,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37178,0,0,1378.9,491.8,8.5,250.3);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(37179,0,0,1360,428.5,17,241.9);
		quest::spawn2(37180,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37180,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37180,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37180,0,0,1378.9,491.8,8.5,250.3);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(37181,0,0,1360,428.5,17,241.9);
		quest::spawn2(37182,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37182,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37182,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37182,0,0,1378.9,491.8,8.5,250.3);
		}
	if($signal >= 31 && $signal <= 5) {
		quest::spawn2(37183,0,0,1360,428.5,17,241.9);
		quest::spawn2(37184,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37184,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37184,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37172,0,0,1378.9,491.8,8.5,250.3);
		}
	if($signal >= 1 && $signal <= 35) {
		quest::spawn2(37185,0,0,1360,428.5,17,241.9);
		quest::spawn2(37186,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37186,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37186,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37186,0,0,1378.9,491.8,8.5,250.3);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(37187,0,0,1360,428.5,17,241.9);
		quest::spawn2(37188,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37188,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37188,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37188,0,0,1378.9,491.8,8.5,250.3);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(37189,0,0,1360,428.5,17,241.9);
		quest::spawn2(37190,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37190,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37190,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37190,0,0,1378.9,491.8,8.5,250.3);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End