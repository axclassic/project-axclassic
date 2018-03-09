##zonecontroller.pl ID 4223 in Qeynos Hills qeytoqrg##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(4203); 
		quest::depopall(4204);
		quest::depopall(4205);
		quest::depopall(4206);
		quest::depopall(4207);
		quest::depopall(4208);
		quest::depopall(4209);
		quest::depopall(4210);
		quest::depopall(4211);
		quest::depopall(4212);
		quest::depopall(4213);
		quest::depopall(4214);
		quest::depopall(4215);
		quest::depopall(4216);
		quest::depopall(4217);
		quest::depopall(4218);
		quest::depopall(4219);
		quest::depopall(4220);
		quest::depopall(4221);
		quest::depopall(4222);
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(4203,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4204,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4204,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4204,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4204,0,0,546.6,4180.5,-2.9,198.1);
		}
	if($signal >= 6 && $signal <= 10) {
		quest::spawn2(4205,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4206,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4206,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4206,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4206,0,0,546.6,4180.5,-2.9,198.1);
		}
	if($signal >= 11 && $signal <= 15) {
		quest::spawn2(4207,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4208,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4208,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4208,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4208,0,0,546.6,4180.5,-2.9,198.1);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(4209,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4210,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4210,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4210,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4210,0,0,546.6,4180.5,-2.9,198.1);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(4211,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4212,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4212,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4212,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4212,0,0,546.6,4180.5,-2.9,198.1);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(4213,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4214,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4214,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4214,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4214,0,0,546.6,4180.5,-2.9,198.1);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(4215,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4216,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4216,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4216,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4216,0,0,546.6,4180.5,-2.9,198.1);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(4217,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4218,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4218,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4218,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4218,0,0,546.6,4180.5,-2.9,198.1);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(4219,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4220,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4220,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4220,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4220,0,0,546.6,4180.5,-2.9,198.1);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(4221,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4222,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4222,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4222,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4222,0,0,546.6,4180.5,-2.9,198.1);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End