##zonecontroller.pl ID 55 in Dagnors Cauldron##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 66) {
	quest::depopall(70070); 
	quest::depopall(70071);
	quest::depopall(70072);
	quest::depopall(70073);
	quest::depopall(70074);
	quest::depopall(70075);
	quest::depopall(70076);
	quest::depopall(70077);
	quest::depopall(70078);
	quest::depopall(70079);
	quest::depopall(70080);
	quest::depopall(70081);
	quest::depopall(70082);
	quest::depopall(70083);
	quest::depopall(70084);
	quest::depopall(70085);
	quest::depopall(70086);
	quest::depopall(70087);
	quest::depopall(70088);
	quest::depopall(70089);
	}
	elsif($signal == 56) {
	quest::spawn2(70070,0,0,-141.7,1314.2,169.6,252.5);
	quest::spawn2(70071,0,0,-186.6,1341.1,169.3,6.9);
	quest::spawn2(70071,0,0,-202.1,1395,172.2,39.1);
	quest::spawn2(70071,0,0,-126,1341.9,169.5,236.8);
	quest::spawn2(70071,0,0,-135.3,1405,173.2,243.3);
	}
	elsif($signal == 57) {
	quest::spawn2(70072,0,0,-141.7,1314.2,169.6,252.5);
	quest::spawn2(70073,0,0,-186.6,1341.1,169.3,6.9);
	quest::spawn2(70073,0,0,-202.1,1395,172.2,39.1);
	quest::spawn2(70073,0,0,-126,1341.9,169.5,236.8);
	quest::spawn2(70073,0,0,-135.3,1405,173.2,243.3);
	}
	elsif($signal == 58) {
	quest::spawn2(70074,0,0,-141.7,1314.2,169.6,252.5);
	quest::spawn2(70075,0,0,-186.6,1341.1,169.3,6.9);
	quest::spawn2(70075,0,0,-202.1,1395,172.2,39.1);
	quest::spawn2(70075,0,0,-126,1341.9,169.5,236.8);
	quest::spawn2(70075,0,0,-135.3,1405,173.2,243.3);
	}
	elsif($signal == 59) {
	quest::spawn2(70076,0,0,-141.7,1314.2,169.6,252.5);
	quest::spawn2(70077,0,0,-186.6,1341.1,169.3,6.9);
	quest::spawn2(70077,0,0,-202.1,1395,172.2,39.1);
	quest::spawn2(70077,0,0,-126,1341.9,169.5,236.8);
	quest::spawn2(70077,0,0,-135.3,1405,173.2,243.3);
	}
	elsif($signal == 60) {
	quest::spawn2(70078,0,0,-141.7,1314.2,169.6,252.5);
	quest::spawn2(70079,0,0,-186.6,1341.1,169.3,6.9);
	quest::spawn2(70079,0,0,-202.1,1395,172.2,39.1);
	quest::spawn2(70079,0,0,-126,1341.9,169.5,236.8);
	quest::spawn2(70079,0,0,-135.3,1405,173.2,243.3);
	}
	elsif($signal == 61) {
	quest::spawn2(70080,0,0,-141.7,1314.2,169.6,252.5);
	quest::spawn2(70081,0,0,-186.6,1341.1,169.3,6.9);
	quest::spawn2(70081,0,0,-202.1,1395,172.2,39.1);
	quest::spawn2(70081,0,0,-126,1341.9,169.5,236.8);
	quest::spawn2(70081,0,0,-135.3,1405,173.2,243.3);
	}
	elsif($signal == 62) {
	quest::spawn2(70082,0,0,-141.7,1314.2,169.6,252.5);
	quest::spawn2(70083,0,0,-186.6,1341.1,169.3,6.9);
	quest::spawn2(70083,0,0,-202.1,1395,172.2,39.1);
	quest::spawn2(70083,0,0,-126,1341.9,169.5,236.8);
	quest::spawn2(70083,0,0,-135.3,1405,173.2,243.3);
	}
	elsif($signal == 63) {
	quest::spawn2(70084,0,0,-141.7,1314.2,169.6,252.5);
	quest::spawn2(70085,0,0,-186.6,1341.1,169.3,6.9);
	quest::spawn2(70085,0,0,-202.1,1395,172.2,39.1);
	quest::spawn2(70085,0,0,-126,1341.9,169.5,236.8);
	quest::spawn2(70085,0,0,-135.3,1405,173.2,243.3);
	}
	elsif($signal == 64) {
	quest::spawn2(70086,0,0,-141.7,1314.2,169.6,252.5);
	quest::spawn2(70087,0,0,-186.6,1341.1,169.3,6.9);
	quest::spawn2(70087,0,0,-202.1,1395,172.2,39.1);
	quest::spawn2(70087,0,0,-126,1341.9,169.5,236.8);
	quest::spawn2(70087,0,0,-135.3,1405,173.2,243.3);
	}
	elsif($signal == 65) {
	quest::spawn2(70088,0,0,-141.7,1314.2,169.6,252.5);
	quest::spawn2(70089,0,0,-186.6,1341.1,169.3,6.9);
	quest::spawn2(70089,0,0,-202.1,1395,172.2,39.1);
	quest::spawn2(70089,0,0,-126,1341.9,169.5,236.8);
	quest::spawn2(70089,0,0,-135.3,1405,173.2,243.3);
	}
	else {
	#Do Nothing;
	}
	}