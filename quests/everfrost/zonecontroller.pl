##zonecontroller.pl ID 30190 in Everfrost##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 220) {
	quest::depopall(30170); 
	quest::depopall(30171);
	quest::depopall(30172);
	quest::depopall(30173);
	quest::depopall(30174);
	quest::depopall(30175);
	quest::depopall(30176);
	quest::depopall(30177);
	quest::depopall(30178);
	quest::depopall(30179);
	quest::depopall(30180);
	quest::depopall(30181);
	quest::depopall(30182);
	quest::depopall(30183);
	quest::depopall(30184);
	quest::depopall(30185);
	quest::depopall(30186);
	quest::depopall(30187);
	quest::depopall(30188);
	quest::depopall(30189);
	}
	elsif($signal == 221) {
	quest::spawn2(30170,0,0,1075.9,545.5,-53.2,134.3);
	quest::spawn2(30171,0,0,1021.6,536.7,-51.8,145.6);
	quest::spawn2(30171,0,0,1027.9,467,-62.9,151.8);
	quest::spawn2(30171,0,0,1066,450.7,-62.9,152.8);
	quest::spawn2(30171,0,0,1116.1,502.9,-62.9,159.4);
	}
	elsif($signal == 222) {
	quest::spawn2(30172,0,0,1075.9,545.5,-53.2,134.3);
	quest::spawn2(30173,0,0,1021.6,536.7,-51.8,145.6);
	quest::spawn2(30173,0,0,1027.9,467,-62.9,151.8);
	quest::spawn2(30173,0,0,1066,450.7,-62.9,152.8);
	quest::spawn2(30173,0,0,1116.1,502.9,-62.9,159.4);
	}
	elsif($signal == 223) {
	quest::spawn2(30174,0,0,1075.9,545.5,-53.2,134.3);
	quest::spawn2(30175,0,0,1021.6,536.7,-51.8,145.6);
	quest::spawn2(30175,0,0,1027.9,467,-62.9,151.8);
	quest::spawn2(30175,0,0,1066,450.7,-62.9,152.8);
	quest::spawn2(30175,0,0,1116.1,502.9,-62.9,159.4);
	}
	elsif($signal == 224) {
	quest::spawn2(30176,0,0,1075.9,545.5,-53.2,134.3);
	quest::spawn2(30177,0,0,1021.6,536.7,-51.8,145.6);
	quest::spawn2(30177,0,0,1027.9,467,-62.9,151.8);
	quest::spawn2(30177,0,0,1066,450.7,-62.9,152.8);
	quest::spawn2(30177,0,0,1116.1,502.9,-62.9,159.4);
	}
	elsif($signal == 225) {
	quest::spawn2(30178,0,0,1075.9,545.5,-53.2,134.3);
	quest::spawn2(30179,0,0,1021.6,536.7,-51.8,145.6);
	quest::spawn2(30179,0,0,1027.9,467,-62.9,151.8);
	quest::spawn2(30179,0,0,1066,450.7,-62.9,152.8);
	quest::spawn2(30179,0,0,1116.1,502.9,-62.9,159.4);
	}
	elsif($signal == 226) {
	quest::spawn2(30180,0,0,1075.9,545.5,-53.2,134.3);
	quest::spawn2(30181,0,0,1021.6,536.7,-51.8,145.6);
	quest::spawn2(30181,0,0,1027.9,467,-62.9,151.8);
	quest::spawn2(30181,0,0,1066,450.7,-62.9,152.8);
	quest::spawn2(30181,0,0,1116.1,502.9,-62.9,159.4);
	}
	elsif($signal == 227) {
	quest::spawn2(30182,0,0,1075.9,545.5,-53.2,134.3);
	quest::spawn2(30183,0,0,1021.6,536.7,-51.8,145.6);
	quest::spawn2(30183,0,0,1027.9,467,-62.9,151.8);
	quest::spawn2(30183,0,0,1066,450.7,-62.9,152.8);
	quest::spawn2(30183,0,0,1116.1,502.9,-62.9,159.4);
	}
	elsif($signal == 228) {
	quest::spawn2(30184,0,0,1075.9,545.5,-53.2,134.3);
	quest::spawn2(30185,0,0,1021.6,536.7,-51.8,145.6);
	quest::spawn2(30185,0,0,1027.9,467,-62.9,151.8);
	quest::spawn2(30185,0,0,1066,450.7,-62.9,152.8);
	quest::spawn2(30185,0,0,1116.1,502.9,-62.9,159.4);
	}
	elsif($signal == 229) {
	quest::spawn2(30186,0,0,1075.9,545.5,-53.2,134.3);
	quest::spawn2(30187,0,0,1021.6,536.7,-51.8,145.6);
	quest::spawn2(30187,0,0,1027.9,467,-62.9,151.8);
	quest::spawn2(30187,0,0,1066,450.7,-62.9,152.8);
	quest::spawn2(30187,0,0,1116.1,502.9,-62.9,159.4);
	}
	elsif($signal == 230) {
	quest::spawn2(30188,0,0,1075.9,545.5,-53.2,134.3);
	quest::spawn2(30189,0,0,1021.6,536.7,-51.8,145.6);
	quest::spawn2(30189,0,0,1027.9,467,-62.9,151.8);
	quest::spawn2(30189,0,0,1066,450.7,-62.9,152.8);
	quest::spawn2(30189,0,0,1116.1,502.9,-62.9,159.4);
	}
	else {
	#Do Nothing;
	}
	}