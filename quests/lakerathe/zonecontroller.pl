##zonecontroller.pl ID 51175 in Lake Rathetear##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(51155); 
		quest::depopall(51156);
		quest::depopall(51157);
		quest::depopall(51158);
		quest::depopall(51159);
		quest::depopall(51160);
		quest::depopall(51161);
		quest::depopall(51162);
		quest::depopall(51163);
		quest::depopall(51164);
		quest::depopall(51165);
		quest::depopall(51166);
		quest::depopall(51167);
		quest::depopall(51168);
		quest::depopall(51169);
		quest::depopall(51170);
		quest::depopall(51171);
		quest::depopall(51172);
		quest::depopall(51173);
		quest::depopall(51174);
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(51155,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51156,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51156,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51156,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51156,0,0,-1289.1,3476,-2.2,100.1);
		}
	if($signal >= 6 && $signal <= 10) {
		quest::spawn2(51157,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51158,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51158,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51158,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51158,0,0,-1289.1,3476,-2.2,100.1);
		}
	if($signal >= 11 && $signal <= 15) {
		quest::spawn2(51159,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51160,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51160,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51160,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51160,0,0,-1289.1,3476,-2.2,100.1);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(51161,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51162,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51162,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51162,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51162,0,0,-1289.1,3476,-2.2,100.1);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(51163,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51164,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51164,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(5116,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51164,0,0,-1289.1,3476,-2.2,100.1);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(51165,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51166,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51166,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51166,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51166,0,0,-1289.1,3476,-2.2,100.1);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(51167,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51168,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51168,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51168,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51168,0,0,-1289.1,3476,-2.2,100.1);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(51169,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51170,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51170,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51170,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51170,0,0,-1289.1,3476,-2.2,100.1);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(51171,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51172,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51172,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51172,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51172,0,0,-1289.1,3476,-2.2,100.1);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(51173,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51174,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51174,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51174,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51174,0,0,-1289.1,3476,-2.2,100.1);
		}
	  else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End