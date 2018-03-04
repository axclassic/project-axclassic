##zonecontroller.pl ID 33178 in Misty Thicket##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 430) {
	quest::depopall(33158); 
	quest::depopall(33159);
	quest::depopall(33160);
	quest::depopall(33161);
	quest::depopall(33162);
	quest::depopall(33163);
	quest::depopall(33164);
	quest::depopall(33165);
	quest::depopall(33166);
	quest::depopall(33167);
	quest::depopall(33168);
	quest::depopall(33169);
	quest::depopall(33170);
	quest::depopall(33171);
	quest::depopall(33172);
	quest::depopall(33173);
	quest::depopall(33174);
	quest::depopall(33175);
	quest::depopall(33176);
	quest::depopall(33177);
	}
	elsif($signal == 431) {
	quest::spawn2(33158,0,0,-2109.3,-1145.3,9.1,5);
	quest::spawn2(33159,0,0,-2143.7,-1143,21.3,3.5);
	quest::spawn2(33159,0,0,-2104.5,-1077.8,1.7,3.4);
	quest::spawn2(33159,0,0,-2057.3,-1146.5,15.3,1.1);
	quest::spawn2(33159,0,0,-2056.1,-1096.4,4.5,249.6);
	}
	elsif($signal == 432) {
	quest::spawn2(33160,0,0,-2109.3,-1145.3,9.1,5);
	quest::spawn2(33161,0,0,-2143.7,-1143,21.3,3.5);
	quest::spawn2(33161,0,0,-2104.5,-1077.8,1.7,3.4);
	quest::spawn2(33161,0,0,-2057.3,-1146.5,15.3,1.1);
	quest::spawn2(33161,0,0,-2056.1,-1096.4,4.5,249.6);
	}
	elsif($signal == 433) {
	quest::spawn2(33162,0,0,-2109.3,-1145.3,9.1,5);
	quest::spawn2(33163,0,0,-2143.7,-1143,21.3,3.5);
	quest::spawn2(33163,0,0,-2104.5,-1077.8,1.7,3.4);
	quest::spawn2(33163,0,0,-2057.3,-1146.5,15.3,1.1);
	quest::spawn2(33163,0,0,-2056.1,-1096.4,4.5,249.6);
	}
	elsif($signal == 434) {
	quest::spawn2(33164,0,0,-2109.3,-1145.3,9.1,5);
	quest::spawn2(33165,0,0,-2143.7,-1143,21.3,3.5);
	quest::spawn2(33165,0,0,-2104.5,-1077.8,1.7,3.4);
	quest::spawn2(33165,0,0,-2057.3,-1146.5,15.3,1.1);
	quest::spawn2(33165,0,0,-2056.1,-1096.4,4.5,249.6);
	}
	elsif($signal == 435) {
	quest::spawn2(33166,0,0,-2109.3,-1145.3,9.1,5);
	quest::spawn2(33167,0,0,-2143.7,-1143,21.3,3.5);
	quest::spawn2(33167,0,0,-2104.5,-1077.8,1.7,3.4);
	quest::spawn2(33167,0,0,-2057.3,-1146.5,15.3,1.1);
	quest::spawn2(33167,0,0,-2056.1,-1096.4,4.5,249.6);
	}
	elsif($signal == 436) {
	quest::spawn2(33168,0,0,-2109.3,-1145.3,9.1,5);
	quest::spawn2(33169,0,0,-2143.7,-1143,21.3,3.5);
	quest::spawn2(33169,0,0,-2104.5,-1077.8,1.7,3.4);
	quest::spawn2(33169,0,0,-2057.3,-1146.5,15.3,1.1);
	quest::spawn2(33169,0,0,-2056.1,-1096.4,4.5,249.6);
	}
	elsif($signal == 437) {
	quest::spawn2(33170,0,0,-2109.3,-1145.3,9.1,5);
	quest::spawn2(33171,0,0,-2143.7,-1143,21.3,3.5);
	quest::spawn2(33171,0,0,-2104.5,-1077.8,1.7,3.4);
	quest::spawn2(33171,0,0,-2057.3,-1146.5,15.3,1.1);
	quest::spawn2(33171,0,0,-2056.1,-1096.4,4.5,249.6);
	}
	elsif($signal == 438) {
	quest::spawn2(33172,0,0,-2109.3,-1145.3,9.1,5);
	quest::spawn2(33173,0,0,-2143.7,-1143,21.3,3.5);
	quest::spawn2(33173,0,0,-2104.5,-1077.8,1.7,3.4);
	quest::spawn2(33173,0,0,-2057.3,-1146.5,15.3,1.1);
	quest::spawn2(33173,0,0,-2056.1,-1096.4,4.5,249.6);
	}
	elsif($signal == 439) {
	quest::spawn2(33174,0,0,-2109.3,-1145.3,9.1,5);
	quest::spawn2(33175,0,0,-2143.7,-1143,21.3,3.5);
	quest::spawn2(33175,0,0,-2104.5,-1077.8,1.7,3.4);
	quest::spawn2(33175,0,0,-2057.3,-1146.5,15.3,1.1);
	quest::spawn2(33175,0,0,-2056.1,-1096.4,4.5,249.6);
	}
	elsif($signal == 440) {
	quest::spawn2(33176,0,0,-2109.3,-1145.3,9.1,5);
	quest::spawn2(33177,0,0,-2143.7,-1143,21.3,3.5);
	quest::spawn2(33177,0,0,-2104.5,-1077.8,1.7,3.4);
	quest::spawn2(33177,0,0,-2057.3,-1146.5,15.3,1.1);
	quest::spawn2(33177,0,0,-2056.1,-1096.4,4.5,249.6);
	}
	else {
	#Do Nothing;
	}
	}