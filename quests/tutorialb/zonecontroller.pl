##zonecontroller.pl ID 189520 in tutorialb Mines ofGlooming Deep##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##

sub EVENT_SIGNAL {
	if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(189500); 
		quest::depopall(189501);
		quest::depopall(189502);
		quest::depopall(189503);
		quest::depopall(189504);
		quest::depopall(189505);
		quest::depopall(189506);
		quest::depopall(189507);
		quest::depopall(189508);
		quest::depopall(189509);
		quest::depopall(189510);
		quest::depopall(189511);
		quest::depopall(189512);
		quest::depopall(189513);
		quest::depopall(189514);
		quest::depopall(189515);
		quest::depopall(189516);
		quest::depopall(189517);
		quest::depopall(189518);
		quest::depopall(189519);
	if($signal >= 1 && $signal <= 5) {
	    quest::spawn2(189500,0,0,-44.1,142.4,16.2,114.6);
		quest::spawn2(189501,0,0,8.1,104.2,15.2,124.9);
		quest::spawn2(189501,0,0,-15.5,93.1,12.8,116.6);
		quest::spawn2(189501,0,0,-14,121,14.6,93.6);
		quest::spawn2(189501,0,0,-41.5,107.4,10.1,85.6);
		}
		if($signal >= 6 && $signal <= 10) {
	    quest::spawn2(189502,0,0,-44.1,142.4,16.2,114.6);
		quest::spawn2(189503,0,0,8.1,104.2,15.2,124.9);
		quest::spawn2(189503,0,0,-15.5,93.1,12.8,116.6);
		quest::spawn2(189503,0,0,-14,121,14.6,93.6);
		quest::spawn2(189503,0,0,-41.5,107.4,10.1,85.6);
		}
	if($signal >= 11 && $signal <= 15) {
	    quest::spawn2(189504,0,0,-44.1,142.4,16.2,114.6);
		quest::spawn2(189505,0,0,8.1,104.2,15.2,124.9);
		quest::spawn2(189505,0,0,-15.5,93.1,12.8,116.6);
		quest::spawn2(189505,0,0,-14,121,14.6,93.6);
		quest::spawn2(189505,0,0,-41.5,107.4,10.1,85.6);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(189506,0,0,-44.1,142.4,16.2,114.6);
		quest::spawn2(189507,0,0,8.1,104.2,15.2,124.9);
		quest::spawn2(189507,0,0,-15.5,93.1,12.8,116.6);
		quest::spawn2(189507,0,0,-14,121,14.6,93.6);
		quest::spawn2(189507,0,0,-41.5,107.4,10.1,85.6);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(189508,0,0,-44.1,142.4,16.2,114.6);
		quest::spawn2(189509,0,0,8.1,104.2,15.2,124.9);
		quest::spawn2(189509,0,0,-15.5,93.1,12.8,116.6);
		quest::spawn2(189509,0,0,-14,121,14.6,93.6);
		quest::spawn2(189509,0,0,-41.5,107.4,10.1,85.6);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(189510,0,0,-44.1,142.4,16.2,114.6);
		quest::spawn2(189511,0,0,8.1,104.2,15.2,124.9);
		quest::spawn2(189511,0,0,-15.5,93.1,12.8,116.6);
		quest::spawn2(189511,0,0,-14,121,14.6,93.6);
		quest::spawn2(189511,0,0,-41.5,107.4,10.1,85.6);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(189512,0,0,-44.1,142.4,16.2,114.6);
		quest::spawn2(189513,0,0,8.1,104.2,15.2,124.9);
		quest::spawn2(189513,0,0,-15.5,93.1,12.8,116.6);
		quest::spawn2(189513,0,0,-14,121,14.6,93.6);
		quest::spawn2(189513,0,0,-41.5,107.4,10.1,85.6);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(189514,0,0,-44.1,142.4,16.2,114.6);
		quest::spawn2(189515,0,0,8.1,104.2,15.2,124.9);
		quest::spawn2(189515,0,0,-15.5,93.1,12.8,116.6);
		quest::spawn2(189515,0,0,-14,121,14.6,93.6);
		quest::spawn2(189515,0,0,-41.5,107.4,10.1,85.6);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(189516,0,0,-44.1,142.4,16.2,114.6);
		quest::spawn2(189517,0,0,8.1,104.2,15.2,124.9);
		quest::spawn2(189517,0,0,-15.5,93.1,12.8,116.6);
		quest::spawn2(189517,0,0,-14,121,14.6,93.6);
		quest::spawn2(189517,0,0,-41.5,107.4,10.1,85.6);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(189518,0,0,-44.1,142.4,16.2,114.6);
		quest::spawn2(189519,0,0,8.1,104.2,15.2,124.9);
		quest::spawn2(189519,0,0,-15.5,93.1,12.8,116.6);
		quest::spawn2(189519,0,0,-14,121,14.6,93.6);
		quest::spawn2(189519,0,0,-41.5,107.4,10.1,85.6);
		}
	if($signal >= 50 && $signal <= 65) {
		quest::depopall(189500); 
		quest::depopall(189501);
		quest::depopall(189502);
		quest::depopall(189503);
		quest::depopall(189504);
		quest::depopall(189505);
		quest::depopall(189506);
		quest::depopall(189507);
		quest::depopall(189508);
		quest::depopall(189509);
		quest::depopall(189510);
		quest::depopall(189511);
		quest::depopall(189512);
		quest::depopall(189513);
		quest::depopall(189514);
		quest::depopall(189515);
		quest::depopall(189516);
		quest::depopall(189517);
		quest::depopall(189518);
		quest::depopall(189519);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL EndEnd
