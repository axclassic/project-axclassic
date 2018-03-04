##zonecontroller.pl ID 302084 in Draniks Scar##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 474) {
	quest::depopall(302078); 
	quest::depopall(302079);
	quest::depopall(302080);
	quest::depopall(302081);
	quest::depopall(302082);
	quest::depopall(302083);
	}
	elsif($signal == 475) {
	quest::spawn2(302080,0,0,-1498.2,-378.9,263.7,136.1);
	quest::spawn2(302081,0,0,-1462.3,-422.6,263.8,156.4);
	quest::spawn2(302081,0,0,-1468.9,-476.1,263.5,178.4);
	quest::spawn2(302081,0,0,-1535.2,-431.8,269.6,112.3);
	quest::spawn2(302081,0,0,-1544.1,-370.8,270.1,119.8);
	}
	elsif($signal == 476) {
	quest::spawn2(302082,0,0,-1498.2,-378.9,263.7,136.1);
	quest::spawn2(302083,0,0,-1462.3,-422.6,263.8,156.4);
	quest::spawn2(302083,0,0,-1468.9,-476.1,263.5,178.4);
	quest::spawn2(302083,0,0,-1535.2,-431.8,269.6,112.3);
	quest::spawn2(302083,0,0,-1544.1,-370.8,270.1,119.8);
	}
	elsif($signal == 477) {
	quest::spawn2(302078,0,0,-1498.2,-378.9,263.7,136.1);
	quest::spawn2(302079,0,0,-1462.3,-422.6,263.8,156.4);
	quest::spawn2(302079,0,0,-1468.9,-476.1,263.5,178.4);
	quest::spawn2(302079,0,0,-1535.2,-431.8,269.6,112.3);
	quest::spawn2(302079,0,0,-1544.1,-370.8,270.1,119.8);
	}
	
	else {
	#Do Nothing;
	}
	}