##zonecontroller.pl ID 12215 in West Karana qey2hh1##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 165) {
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
	}
	elsif($signal == 166) {
	quest::spawn2(12195,0,0,-1528.4,564.9,-11.1,183.8);
	quest::spawn2(12196,0,0,-1502.2,542.9,-9,172.1);
	quest::spawn2(12196,0,0,-1532,531.9,-8,158.4);
	quest::spawn2(12196,0,0,-1554.3,594.9,-14,156);
	quest::spawn2(12196,0,0,-1567,567.1,-11.3,178.4);
	}
	elsif($signal == 167) {
	quest::spawn2(12197,0,0,-1528.4,564.9,-11.1,183.8);
	quest::spawn2(12198,0,0,-1502.2,542.9,-9,172.1);
	quest::spawn2(12198,0,0,-1532,531.9,-8,158.4);
	quest::spawn2(12198,0,0,-1554.3,594.9,-14,156);
	quest::spawn2(12198,0,0,-1567,567.1,-11.3,178.4);
	}
	elsif($signal == 168) {
	quest::spawn2(12199,0,0,-1528.4,564.9,-11.1,183.8);
	quest::spawn2(12200,0,0,-1502.2,542.9,-9,172.1);
	quest::spawn2(12200,0,0,-1532,531.9,-8,158.4);
	quest::spawn2(12200,0,0,-1554.3,594.9,-14,156);
	quest::spawn2(12200,0,0,-1567,567.1,-11.3,178.4);
	}
	elsif($signal == 169) {
	quest::spawn2(12201,0,0,-1528.4,564.9,-11.1,183.8);
	quest::spawn2(12202,0,0,-1502.2,542.9,-9,172.1);
	quest::spawn2(12202,0,0,-1532,531.9,-8,158.4);
	quest::spawn2(12202,0,0,-1554.3,594.9,-14,156);
	quest::spawn2(12202,0,0,-1567,567.1,-11.3,178.4);
	}
	elsif($signal == 170) {
	quest::spawn2(12203,0,0,-1528.4,564.9,-11.1,183.8);
	quest::spawn2(12204,0,0,-1502.2,542.9,-9,172.1);
	quest::spawn2(12204,0,0,-1532,531.9,-8,158.4);
	quest::spawn2(12204,0,0,-1554.3,594.9,-14,156);
	quest::spawn2(12204,0,0,-1567,567.1,-11.3,178.4);
	}
	elsif($signal == 171) {
	quest::spawn2(12205,0,0,-1528.4,564.9,-11.1,183.8);
	quest::spawn2(12206,0,0,-1502.2,542.9,-9,172.1);
	quest::spawn2(12206,0,0,-1532,531.9,-8,158.4);
	quest::spawn2(12206,0,0,-1554.3,594.9,-14,156);
	quest::spawn2(12206,0,0,-1567,567.1,-11.3,178.4);
	}
	elsif($signal == 172) {
	quest::spawn2(12207,0,0,-1528.4,564.9,-11.1,183.8);
	quest::spawn2(12208,0,0,-1502.2,542.9,-9,172.1);
	quest::spawn2(12208,0,0,-1532,531.9,-8,158.4);
	quest::spawn2(12208,0,0,-1554.3,594.9,-14,156);
	quest::spawn2(12208,0,0,-1567,567.1,-11.3,178.4);
	}
	elsif($signal == 173) {
	quest::spawn2(12209,0,0,-1528.4,564.9,-11.1,183.8);
	quest::spawn2(12210,0,0,-1502.2,542.9,-9,172.1);
	quest::spawn2(12210,0,0,-1532,531.9,-8,158.4);
	quest::spawn2(12210,0,0,-1554.3,594.9,-14,156);
	quest::spawn2(12210,0,0,-1567,567.1,-11.3,178.4);
	}
	elsif($signal == 174) {
	quest::spawn2(12211,0,0,-1528.4,564.9,-11.1,183.8);
	quest::spawn2(12212,0,0,-1502.2,542.9,-9,172.1);
	quest::spawn2(12212,0,0,-1532,531.9,-8,158.4);
	quest::spawn2(12212,0,0,-1554.3,594.9,-14,156);
	quest::spawn2(12212,0,0,-1567,567.1,-11.3,178.4);
	}
	elsif($signal == 175) {
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