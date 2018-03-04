##zonecontroller.pl ID 3086 in Surefall Glades qrg##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 176) {
	quest::depopall(3072); 
	quest::depopall(3073);
	quest::depopall(3074);
	quest::depopall(3075);
	quest::depopall(3076);
	quest::depopall(3077);
	quest::depopall(3078);
	quest::depopall(3079);
	quest::depopall(3080);
	quest::depopall(3081);
	quest::depopall(3082);
	quest::depopall(3083);
	quest::depopall(3084);
	quest::depopall(3085);
	quest::depopall(3066);
	quest::depopall(3067);
	quest::depopall(3068);
	quest::depopall(3069);
	quest::depopall(3070);
	quest::depopall(3071);
	}
	elsif($signal == 177) {
	quest::spawn2(3072,0,0,178.1,324.6,1,144.9);
	quest::spawn2(3073,0,0,182.9,288.8,1,141.4);
	quest::spawn2(3073,0,0,183.6,304,1,147.1);
	quest::spawn2(3073,0,0,163.3,315.2,1,157.5);
	quest::spawn2(3073,0,0,144.2,293.6,1,157.5);
	}
	elsif($signal == 178) {
	quest::spawn2(3074,0,0,178.1,324.6,1,144.9);
	quest::spawn2(3075,0,0,182.9,288.8,1,141.4);
	quest::spawn2(3075,0,0,183.6,304,1,147.1);
	quest::spawn2(3075,0,0,163.3,315.2,1,157.5);
	quest::spawn2(3075,0,0,144.2,293.6,1,157.5);
	}
	elsif($signal == 179) {
	quest::spawn2(3076,0,0,178.1,324.6,1,144.9);
	quest::spawn2(3077,0,0,182.9,288.8,1,141.4);
	quest::spawn2(3077,0,0,183.6,304,1,147.1);
	quest::spawn2(3077,0,0,163.3,315.2,1,157.5);
	quest::spawn2(3077,0,0,144.2,293.6,1,157.5);
	}
	elsif($signal == 180) {
	quest::spawn2(3078,0,0,178.1,324.6,1,144.9);
	quest::spawn2(3079,0,0,182.9,288.8,1,141.4);
	quest::spawn2(3079,0,0,183.6,304,1,147.1);
	quest::spawn2(3079,0,0,163.3,315.2,1,157.5);
	quest::spawn2(3079,0,0,144.2,293.6,1,157.5);
	}
	elsif($signal == 181) {
	quest::spawn2(3080,0,0,178.1,324.6,1,144.9);
	quest::spawn2(3081,0,0,182.9,288.8,1,141.4);
	quest::spawn2(3081,0,0,183.6,304,1,147.1);
	quest::spawn2(3081,0,0,163.3,315.2,1,157.5);
	quest::spawn2(3081,0,0,144.2,293.6,1,157.5);
	}
	elsif($signal == 182) {
	quest::spawn2(3082,0,0,178.1,324.6,1,144.9);
	quest::spawn2(3083,0,0,182.9,288.8,1,141.4);
	quest::spawn2(3083,0,0,183.6,304,1,147.1);
	quest::spawn2(3083,0,0,163.3,315.2,1,157.5);
	quest::spawn2(3083,0,0,144.2,293.6,1,157.5);
	}
	elsif($signal == 183) {
	quest::spawn2(3084,0,0,178.1,324.6,1,144.9);
	quest::spawn2(3085,0,0,182.9,288.8,1,141.4);
	quest::spawn2(3085,0,0,183.6,304,1,147.1);
	quest::spawn2(3085,0,0,163.3,315.2,1,157.5);
	quest::spawn2(3085,0,0,144.2,293.6,1,157.5);
	}
	elsif($signal == 184) {
	quest::spawn2(3066,0,0,178.1,324.6,1,144.9);
	quest::spawn2(3067,0,0,182.9,288.8,1,141.4);
	quest::spawn2(3067,0,0,183.6,304,1,147.1);
	quest::spawn2(3067,0,0,163.3,315.2,1,157.5);
	quest::spawn2(3067,0,0,144.2,293.6,1,157.5);
	}
	elsif($signal == 185) {
	quest::spawn2(3068,0,0,178.1,324.6,1,144.9);
	quest::spawn2(3069,0,0,182.9,288.8,1,141.4);
	quest::spawn2(3069,0,0,183.6,304,1,147.1);
	quest::spawn2(3069,0,0,163.3,315.2,1,157.5);
	quest::spawn2(3069,0,0,144.2,293.6,1,157.5);
	}
	elsif($signal == 186) {
	quest::spawn2(3070,0,0,178.1,324.6,1,144.9);
	quest::spawn2(3071,0,0,182.9,288.8,1,141.4);
	quest::spawn2(3071,0,0,183.6,304,1,147.1);
	quest::spawn2(3071,0,0,163.3,315.2,1,157.5);
	quest::spawn2(3071,0,0,144.2,293.6,1,157.5);
	}
	else {
	#Do Nothing;
	}
	}