##zonecontroller.pl ID 38235 in Toxxulia Forest##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 309) {
	quest::depopall(38215); 
	quest::depopall(38216);
	quest::depopall(38217);
	quest::depopall(38218);
	quest::depopall(38219);
	quest::depopall(38220);
	quest::depopall(38221);
	quest::depopall(38222);
	quest::depopall(38223);
	quest::depopall(38224);
	quest::depopall(38225);
	quest::depopall(38226);
	quest::depopall(38227);
	quest::depopall(38228);
	quest::depopall(38229);
	quest::depopall(28230);
	quest::depopall(38231);
	quest::depopall(38232);
	quest::depopall(38233);
	quest::depopall(38234);
	}
	elsif($signal == 310) {
	quest::spawn2(38215,0,0,1142.6,589.8,-51.8,176.5);
	quest::spawn2(38216,0,0,1138,627.2,-41.3,165.1);
	quest::spawn2(38216,0,0,1102.7,591.4,-49.9,188.4);
	quest::spawn2(38216,0,0,1103,547.1,-47,180.9);
	quest::spawn2(38216,0,0,1148.6,549.6,-52.4,197.5);
	}
	elsif($signal == 311) {
	quest::spawn2(38217,0,0,1142.6,589.8,-51.8,176.5);
	quest::spawn2(38218,0,0,1138,627.2,-41.3,165.1);
	quest::spawn2(38218,0,0,1102.7,591.4,-49.9,188.4);
	quest::spawn2(38218,0,0,1103,547.1,-47,180.9);
	quest::spawn2(38218,0,0,1148.6,549.6,-52.4,197.5);
	}
	elsif($signal == 312) {
	quest::spawn2(38219,0,0,1142.6,589.8,-51.8,176.5);
	quest::spawn2(38220,0,0,1138,627.2,-41.3,165.1);
	quest::spawn2(38220,0,0,1102.7,591.4,-49.9,188.4);
	quest::spawn2(38220,0,0,1103,547.1,-47,180.9);
	quest::spawn2(38220,0,0,1148.6,549.6,-52.4,197.5);
	}
	elsif($signal == 313) {
	quest::spawn2(38221,0,0,1142.6,589.8,-51.8,176.5);
	quest::spawn2(38222,0,0,1138,627.2,-41.3,165.1);
	quest::spawn2(38222,0,0,1102.7,591.4,-49.9,188.4);
	quest::spawn2(38222,0,0,1103,547.1,-47,180.9);
	quest::spawn2(38222,0,0,1148.6,549.6,-52.4,197.5);
	}
	elsif($signal == 314) {
	quest::spawn2(38223,0,0,1142.6,589.8,-51.8,176.5);
	quest::spawn2(38224,0,0,1138,627.2,-41.3,165.1);
	quest::spawn2(38224,0,0,1102.7,591.4,-49.9,188.4);
	quest::spawn2(38224,0,0,1103,547.1,-47,180.9);
	quest::spawn2(38224,0,0,1148.6,549.6,-52.4,197.5);
	}
	elsif($signal == 315) {
	quest::spawn2(38225,0,0,1142.6,589.8,-51.8,176.5);
	quest::spawn2(38226,0,0,1138,627.2,-41.3,165.1);
	quest::spawn2(38226,0,0,1102.7,591.4,-49.9,188.4);
	quest::spawn2(38226,0,0,1103,547.1,-47,180.9);
	quest::spawn2(38226,0,0,1148.6,549.6,-52.4,197.5);
	}
	elsif($signal == 316) {
	quest::spawn2(38227,0,0,1142.6,589.8,-51.8,176.5);
	quest::spawn2(38228,0,0,1138,627.2,-41.3,165.1);
	quest::spawn2(38228,0,0,1102.7,591.4,-49.9,188.4);
	quest::spawn2(38228,0,0,1103,547.1,-47,180.9);
	quest::spawn2(38228,0,0,1148.6,549.6,-52.4,197.5);
	}
	elsif($signal == 317) {
	quest::spawn2(38229,0,0,1142.6,589.8,-51.8,176.5);
	quest::spawn2(38230,0,0,1138,627.2,-41.3,165.1);
	quest::spawn2(38230,0,0,1102.7,591.4,-49.9,188.4);
	quest::spawn2(38230,0,0,1103,547.1,-47,180.9);
	quest::spawn2(38230,0,0,1148.6,549.6,-52.4,197.5);
	}
	elsif($signal == 318) {
	quest::spawn2(38231,0,0,1142.6,589.8,-51.8,176.5);
	quest::spawn2(38232,0,0,1138,627.2,-41.3,165.1);
	quest::spawn2(38232,0,0,1102.7,591.4,-49.9,188.4);
	quest::spawn2(38232,0,0,1103,547.1,-47,180.9);
	quest::spawn2(38232,0,0,1148.6,549.6,-52.4,197.5);
	}
	elsif($signal == 319) {
	quest::spawn2(38233,0,0,1142.6,589.8,-51.8,176.5);
	quest::spawn2(38234,0,0,1138,627.2,-41.3,165.1);
	quest::spawn2(38234,0,0,1102.7,591.4,-49.9,188.4);
	quest::spawn2(38234,0,0,1103,547.1,-47,180.9);
	quest::spawn2(38234,0,0,1148.6,549.6,-52.4,197.5);
	}
	else {
	#Do Nothing;
	}
	}