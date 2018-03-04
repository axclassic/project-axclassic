##zonecontroller.pl ID 181536 in jaggedpine##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 187) {
	quest::depopall(181526); 
	quest::depopall(181527);
	quest::depopall(181528);
	quest::depopall(181529);
	quest::depopall(181530);
	quest::depopall(180531);
	quest::depopall(181532);
	quest::depopall(181533);
	quest::depopall(181534);
	quest::depopall(181535);
	quest::depopall(181536);
	quest::depopall(181537);
	quest::depopall(181538);
	quest::depopall(181539);
	quest::depopall(181540);
	quest::depopall(181541);
	quest::depopall(181542);
	quest::depopall(181543);
	quest::depopall(181544);
	quest::depopall(181545);
	}
	elsif($signal == 188) {
	quest::spawn2(181526,0,0,2025.3,2099.9,-11.7,142.8);
	quest::spawn2(181527,0,0,2015.8,2002.8,-10.7,150.8);
	quest::spawn2(181527,0,0,2031.4,2059.3,-9.2,156);
	quest::spawn2(181527,0,0,1995.5,2093.5,-10.6,142);
	quest::spawn2(181527,0,0,1939.3,2070.5,-10.8,138.5);
	}
	elsif($signal == 189) {
	quest::spawn2(181528,0,0,2025.3,2099.9,-11.7,142.8);
	quest::spawn2(181529,0,0,2015.8,2002.8,-10.7,150.8);
	quest::spawn2(181529,0,0,2031.4,2059.3,-9.2,156);
	quest::spawn2(181529,0,0,1995.5,2093.5,-10.6,142);
	quest::spawn2(181529,0,0,1939.3,2070.5,-10.8,138.5);
	}
	elsif($signal == 190) {
	quest::spawn2(181530,0,0,2025.3,2099.9,-11.7,142.8);
	quest::spawn2(181531,0,0,2015.8,2002.8,-10.7,150.8);
	quest::spawn2(181531,0,0,2031.4,2059.3,-9.2,156);
	quest::spawn2(181531,0,0,1995.5,2093.5,-10.6,142);
	quest::spawn2(181531,0,0,1939.3,2070.5,-10.8,138.5);
	}
	elsif($signal == 191) {
	quest::spawn2(181532,0,0,2025.3,2099.9,-11.7,142.8);
	quest::spawn2(181533,0,0,2015.8,2002.8,-10.7,150.8);
	quest::spawn2(181533,0,0,2031.4,2059.3,-9.2,156);
	quest::spawn2(181533,0,0,1995.5,2093.5,-10.6,142);
	quest::spawn2(181533,0,0,1939.3,2070.5,-10.8,138.5);
	}
	elsif($signal == 192) {
	quest::spawn2(181534,0,0,2025.3,2099.9,-11.7,142.8);
	quest::spawn2(181535,0,0,2015.8,2002.8,-10.7,150.8);
	quest::spawn2(181535,0,0,2031.4,2059.3,-9.2,156);
	quest::spawn2(181535,0,0,1995.5,2093.5,-10.6,142);
	quest::spawn2(181535,0,0,1939.3,2070.5,-10.8,138.5);
	}
	elsif($signal == 193) {
	quest::spawn2(181536,0,0,2025.3,2099.9,-11.7,142.8);
	quest::spawn2(181537,0,0,2015.8,2002.8,-10.7,150.8);
	quest::spawn2(181537,0,0,2031.4,2059.3,-9.2,156);
	quest::spawn2(181537,0,0,1995.5,2093.5,-10.6,142);
	quest::spawn2(181537,0,0,1939.3,2070.5,-10.8,138.5);
	}
	elsif($signal == 194) {
	quest::spawn2(181538,0,0,2025.3,2099.9,-11.7,142.8);
	quest::spawn2(181539,0,0,2015.8,2002.8,-10.7,150.8);
	quest::spawn2(181539,0,0,2031.4,2059.3,-9.2,156);
	quest::spawn2(181539,0,0,1995.5,2093.5,-10.6,142);
	quest::spawn2(181539,0,0,1939.3,2070.5,-10.8,138.5);
	}
	elsif($signal == 195) {
	quest::spawn2(181540,0,0,2025.3,2099.9,-11.7,142.8);
	quest::spawn2(181541,0,0,2015.8,2002.8,-10.7,150.8);
	quest::spawn2(181541,0,0,2031.4,2059.3,-9.2,156);
	quest::spawn2(181541,0,0,1995.5,2093.5,-10.6,142);
	quest::spawn2(181541,0,0,1939.3,2070.5,-10.8,138.5);
	}
	elsif($signal == 196) {
	quest::spawn2(181542,0,0,2025.3,2099.9,-11.7,142.8);
	quest::spawn2(181543,0,0,2015.8,2002.8,-10.7,150.8);
	quest::spawn2(181543,0,0,2031.4,2059.3,-9.2,156);
	quest::spawn2(181543,0,0,1995.5,2093.5,-10.6,142);
	quest::spawn2(181543,0,0,1939.3,2070.5,-10.8,138.5);
	}
	elsif($signal == 197) {
	quest::spawn2(181544,0,0,2025.3,2099.9,-11.7,142.8);
	quest::spawn2(181545,0,0,2015.8,2002.8,-10.7,150.8);
	quest::spawn2(181545,0,0,2031.4,2059.3,-9.2,156);
	quest::spawn2(181545,0,0,1995.5,2093.5,-10.6,142);
	quest::spawn2(181545,0,0,1939.3,2070.5,-10.8,138.5);
	}
	else {
	#Do Nothing;
	}
	}