##zonecontroller.pl ID 47233 in The Feerrott##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 386) {
	quest::depopall(47213); 
	quest::depopall(47214);
	quest::depopall(47215);
	quest::depopall(47216);
	quest::depopall(47217);
	quest::depopall(47218);
	quest::depopall(47219);
	quest::depopall(47220);
	quest::depopall(47221);
	quest::depopall(47222);
	quest::depopall(47223);
	quest::depopall(47224);
	quest::depopall(47225);
	quest::depopall(47226);
	quest::depopall(47227);
	quest::depopall(47228);
	quest::depopall(47229);
	quest::depopall(47230);
	quest::depopall(47231);
	quest::depopall(47232);
	}
	elsif($signal == 387) {
	quest::spawn2(47213,0,0,1303.7,-905.2,-11,95.4);
	quest::spawn2(47214,0,0,1370.3,-906.3,-9,108.3);
	quest::spawn2(47214,0,0,1340.2,-900.9,-10.5,132);
	quest::spawn2(47214,0,0,1285.1,-918.4,-9.9,137.6);
	quest::spawn2(47214,0,0,1291.6,-954.1,-5.3,83.3);
	}
	elsif($signal == 388) {
	quest::spawn2(47215,0,0,1303.7,-905.2,-11,95.4);
	quest::spawn2(47216,0,0,1370.3,-906.3,-9,108.3);
	quest::spawn2(47216,0,0,1340.2,-900.9,-10.5,132);
	quest::spawn2(47216,0,0,1285.1,-918.4,-9.9,137.6);
	quest::spawn2(47216,0,0,1291.6,-954.1,-5.3,83.3);
	}
	elsif($signal == 389) {
	quest::spawn2(47217,0,0,1303.7,-905.2,-11,95.4);
	quest::spawn2(47218,0,0,1370.3,-906.3,-9,108.3);
	quest::spawn2(47218,0,0,1340.2,-900.9,-10.5,132);
	quest::spawn2(47218,0,0,1285.1,-918.4,-9.9,137.6);
	quest::spawn2(47218,0,0,1291.6,-954.1,-5.3,83.3);
	}
	elsif($signal == 390) {
	quest::spawn2(47219,0,0,1303.7,-905.2,-11,95.4);
	quest::spawn2(47220,0,0,1370.3,-906.3,-9,108.3);
	quest::spawn2(47220,0,0,1340.2,-900.9,-10.5,132);
	quest::spawn2(47220,0,0,1285.1,-918.4,-9.9,137.6);
	quest::spawn2(47220,0,0,1291.6,-954.1,-5.3,83.3);
	}
	elsif($signal == 391) {
	quest::spawn2(47221,0,0,1303.7,-905.2,-11,95.4);
	quest::spawn2(47222,0,0,1370.3,-906.3,-9,108.3);
	quest::spawn2(47222,0,0,1340.2,-900.9,-10.5,132);
	quest::spawn2(47222,0,0,1285.1,-918.4,-9.9,137.6);
	quest::spawn2(47222,0,0,1291.6,-954.1,-5.3,83.3);
	}
	elsif($signal == 392) {
	quest::spawn2(47223,0,0,1303.7,-905.2,-11,95.4);
	quest::spawn2(47224,0,0,1370.3,-906.3,-9,108.3);
	quest::spawn2(47224,0,0,1340.2,-900.9,-10.5,132);
	quest::spawn2(47224,0,0,1285.1,-918.4,-9.9,137.6);
	quest::spawn2(47224,0,0,1291.6,-954.1,-5.3,83.3);
	}
	elsif($signal == 393) {
	quest::spawn2(47225,0,0,1303.7,-905.2,-11,95.4);
	quest::spawn2(47226,0,0,1370.3,-906.3,-9,108.3);
	quest::spawn2(47226,0,0,1340.2,-900.9,-10.5,132);
	quest::spawn2(47226,0,0,1285.1,-918.4,-9.9,137.6);
	quest::spawn2(47226,0,0,1291.6,-954.1,-5.3,83.3);
	}
	elsif($signal == 394) {
	quest::spawn2(47227,0,0,1303.7,-905.2,-11,95.4);
	quest::spawn2(47228,0,0,1370.3,-906.3,-9,108.3);
	quest::spawn2(47228,0,0,1340.2,-900.9,-10.5,132);
	quest::spawn2(47228,0,0,1285.1,-918.4,-9.9,137.6);
	quest::spawn2(47228,0,0,1291.6,-954.1,-5.3,83.3);
	}
	elsif($signal == 395) {
	quest::spawn2(47229,0,0,1303.7,-905.2,-11,95.4);
	quest::spawn2(47230,0,0,1370.3,-906.3,-9,108.3);
	quest::spawn2(47230,0,0,1340.2,-900.9,-10.5,132);
	quest::spawn2(47230,0,0,1285.1,-918.4,-9.9,137.6);
	quest::spawn2(47230,0,0,1291.6,-954.1,-5.3,83.3);
	}
	elsif($signal == 396) {
	quest::spawn2(47231,0,0,1303.7,-905.2,-11,95.4);
	quest::spawn2(47232,0,0,1370.3,-906.3,-9,108.3);
	quest::spawn2(47232,0,0,1340.2,-900.9,-10.5,132);
	quest::spawn2(47232,0,0,1285.1,-918.4,-9.9,137.6);
	quest::spawn2(47232,0,0,1291.6,-954.1,-5.3,83.3);
	}
	else {
	#Do Nothing;
	}
	}