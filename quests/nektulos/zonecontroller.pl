##zonecontroller.pl ID 25234 in Nektulos##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 143) {
	quest::depopall(25214); 
	quest::depopall(25215);
	quest::depopall(25216);
	quest::depopall(25217);
	quest::depopall(25218);
	quest::depopall(25219);
	quest::depopall(25220);
	quest::depopall(25221);
	quest::depopall(25222);
	quest::depopall(25223);
	quest::depopall(25224);
	quest::depopall(25225);
	quest::depopall(25226);
	quest::depopall(25227);
	quest::depopall(25228);
	quest::depopall(25229);
	quest::depopall(25230);
	quest::depopall(25231);
	quest::depopall(25232);
	quest::depopall(25233);
	}
	elsif($signal == 144) {
	quest::spawn2(25214,0,0,1099.2,-2239,-5,247.3);
	quest::spawn2(25215,0,0,1033,-2238.9,-6.6,251);
	quest::spawn2(25215,0,0,1080.9,-2197.9,-3,22.3);
	quest::spawn2(25215,0,0,1126.6,-2204.1,0,255);
	quest::spawn2(25215,0,0,1150.6,-2239.9,4.3,255);
	}
	elsif($signal == 145) {
	quest::spawn2(25216,0,0,1099.2,-2239,-5,247.3);
	quest::spawn2(25217,0,0,1033,-2238.9,-6.6,251);
	quest::spawn2(25217,0,0,1080.9,-2197.9,-3,22.3);
	quest::spawn2(25217,0,0,1126.6,-2204.1,0,255);
	quest::spawn2(25217,0,0,1150.6,-2239.9,4.3,255);
	}
	elsif($signal == 146) {
	quest::spawn2(25218,0,0,1099.2,-2239,-5,247.3);
	quest::spawn2(25219,0,0,1033,-2238.9,-6.6,251);
	quest::spawn2(25219,0,0,1080.9,-2197.9,-3,22.3);
	quest::spawn2(25219,0,0,1126.6,-2204.1,0,255);
	quest::spawn2(25219,0,0,1150.6,-2239.9,4.3,255);
	}
	elsif($signal == 147) {
	quest::spawn2(25220,0,0,1099.2,-2239,-5,247.3);
	quest::spawn2(25221,0,0,1033,-2238.9,-6.6,251);
	quest::spawn2(25221,0,0,1080.9,-2197.9,-3,22.3);
	quest::spawn2(25221,0,0,1126.6,-2204.1,0,255);
	quest::spawn2(25221,0,0,1150.6,-2239.9,4.3,255);
	}
	elsif($signal == 148) {
	quest::spawn2(25222,0,0,1099.2,-2239,-5,247.3);
	quest::spawn2(25223,0,0,1033,-2238.9,-6.6,251);
	quest::spawn2(25223,0,0,1080.9,-2197.9,-3,22.3);
	quest::spawn2(25223,0,0,1126.6,-2204.1,0,255);
	quest::spawn2(25223,0,0,1150.6,-2239.9,4.3,255);
	}
	elsif($signal == 149) {
	quest::spawn2(25224,0,0,1099.2,-2239,-5,247.3);
	quest::spawn2(25225,0,0,1033,-2238.9,-6.6,251);
	quest::spawn2(25225,0,0,1080.9,-2197.9,-3,22.3);
	quest::spawn2(25225,0,0,1126.6,-2204.1,0,255);
	quest::spawn2(25225,0,0,1150.6,-2239.9,4.3,255);
	}
	elsif($signal == 150) {
	quest::spawn2(25226,0,0,1099.2,-2239,-5,247.3);
	quest::spawn2(25227,0,0,1033,-2238.9,-6.6,251);
	quest::spawn2(25227,0,0,1080.9,-2197.9,-3,22.3);
	quest::spawn2(25227,0,0,1126.6,-2204.1,0,255);
	quest::spawn2(25227,0,0,1150.6,-2239.9,4.3,255);
	}
	elsif($signal == 151) {
	quest::spawn2(25228,0,0,1099.2,-2239,-5,247.3);
	quest::spawn2(25229,0,0,1033,-2238.9,-6.6,251);
	quest::spawn2(25229,0,0,1080.9,-2197.9,-3,22.3);
	quest::spawn2(25229,0,0,1126.6,-2204.1,0,255);
	quest::spawn2(25229,0,0,1150.6,-2239.9,4.3,255);
	}
	elsif($signal == 152) {
	quest::spawn2(25230,0,0,1099.2,-2239,-5,247.3);
	quest::spawn2(25231,0,0,1033,-2238.9,-6.6,251);
	quest::spawn2(25231,0,0,1080.9,-2197.9,-3,22.3);
	quest::spawn2(25231,0,0,1126.6,-2204.1,0,255);
	quest::spawn2(25231,0,0,1150.6,-2239.9,4.3,255);
	}
	elsif($signal == 153) {
	quest::spawn2(25232,0,0,1099.2,-2239,-5,247.3);
	quest::spawn2(25233,0,0,1033,-2238.9,-6.6,251);
	quest::spawn2(25233,0,0,1080.9,-2197.9,-3,22.3);
	quest::spawn2(25233,0,0,1126.6,-2204.1,0,255);
	quest::spawn2(25233,0,0,1150.6,-2239.9,4.3,255);
	}
	else {
	#Do Nothing;
	}
	}