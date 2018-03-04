##zonecontroller.pl ID 58081 in Crushbone##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 77) {
	quest::depopall(58061); 
	quest::depopall(58062);
	quest::depopall(58063);
	quest::depopall(58064);
	quest::depopall(58065);
	quest::depopall(58066);
	quest::depopall(58067);
	quest::depopall(58068);
	quest::depopall(58069);
	quest::depopall(58070);
	quest::depopall(58071);
	quest::depopall(58072);
	quest::depopall(58073);
	quest::depopall(58074);
	quest::depopall(58075);
	quest::depopall(58076);
	quest::depopall(58077);
	quest::depopall(58078);
	quest::depopall(58079);
	quest::depopall(58080);
	}
	elsif($signal == 67) {
	quest::spawn2(58061,0,0,514.2,-50.2,-18,77.1);
	quest::spawn2(58062,0,0,586.1,-41.1,-29,97.8);
	quest::spawn2(58062,0,0,533.6,-39.4,-22.7,67.9);
	quest::spawn2(58062,0,0,533.2,-74.4,-24.4,85.3);
	quest::spawn2(58062,0,0,565.1,-87,-28.2,7.9);
	}
	elsif($signal == 68) {
	quest::spawn2(58063,0,0,514.2,-50.2,-18,77.1);
	quest::spawn2(58064,0,0,586.1,-41.1,-29,97.8);
	quest::spawn2(58064,0,0,533.6,-39.4,-22.7,67.9);
	quest::spawn2(58064,0,0,533.2,-74.4,-24.4,85.3);
	quest::spawn2(58064,0,0,565.1,-87,-28.2,7.9);
	}
	elsif($signal == 69) {
	quest::spawn2(58065,0,0,514.2,-50.2,-18,77.1);
	quest::spawn2(58066,0,0,586.1,-41.1,-29,97.8);
	quest::spawn2(58066,0,0,533.6,-39.4,-22.7,67.9);
	quest::spawn2(58066,0,0,533.2,-74.4,-24.4,85.3);
	quest::spawn2(58066,0,0,565.1,-87,-28.2,7.9);
	}
	elsif($signal == 70) {
	quest::spawn2(58067,0,0,514.2,-50.2,-18,77.1);
	quest::spawn2(58068,0,0,586.1,-41.1,-29,97.8);
	quest::spawn2(58068,0,0,533.6,-39.4,-22.7,67.9);
	quest::spawn2(58068,0,0,533.2,-74.4,-24.4,85.3);
	quest::spawn2(58068,0,0,565.1,-87,-28.2,7.9);
	}
	elsif($signal == 71) {
	quest::spawn2(58069,0,0,514.2,-50.2,-18,77.1);
	quest::spawn2(58070,0,0,586.1,-41.1,-29,97.8);
	quest::spawn2(58070,0,0,533.6,-39.4,-22.7,67.9);
	quest::spawn2(58070,0,0,533.2,-74.4,-24.4,85.3);
	quest::spawn2(58070,0,0,565.1,-87,-28.2,7.9);
	}
	elsif($signal == 72) {
	quest::spawn2(58071,0,0,514.2,-50.2,-18,77.1);
	quest::spawn2(58072,0,0,586.1,-41.1,-29,97.8);
	quest::spawn2(58072,0,0,533.6,-39.4,-22.7,67.9);
	quest::spawn2(58072,0,0,533.2,-74.4,-24.4,85.3);
	quest::spawn2(58072,0,0,565.1,-87,-28.2,7.9);
	}
	elsif($signal == 73) {
	quest::spawn2(58073,0,0,514.2,-50.2,-18,77.1);
	quest::spawn2(58074,0,0,586.1,-41.1,-29,97.8);
	quest::spawn2(58074,0,0,533.6,-39.4,-22.7,67.9);
	quest::spawn2(58074,0,0,533.2,-74.4,-24.4,85.3);
	quest::spawn2(58074,0,0,565.1,-87,-28.2,7.9);
	}
	elsif($signal == 74) {
	quest::spawn2(58075,0,0,514.2,-50.2,-18,77.1);
	quest::spawn2(58076,0,0,586.1,-41.1,-29,97.8);
	quest::spawn2(58076,0,0,533.6,-39.4,-22.7,67.9);
	quest::spawn2(58076,0,0,533.2,-74.4,-24.4,85.3);
	quest::spawn2(58076,0,0,565.1,-87,-28.2,7.9);
	}
	elsif($signal == 75) {
	quest::spawn2(58077,0,0,514.2,-50.2,-18,77.1);
	quest::spawn2(58078,0,0,586.1,-41.1,-29,97.8);
	quest::spawn2(58078,0,0,533.6,-39.4,-22.7,67.9);
	quest::spawn2(58078,0,0,533.2,-74.4,-24.4,85.3);
	quest::spawn2(58078,0,0,565.1,-87,-28.2,7.9);
	}
	elsif($signal == 76) {
	quest::spawn2(58079,0,0,514.2,-50.2,-18,77.1);
	quest::spawn2(58080,0,0,586.1,-41.1,-29,97.8);
	quest::spawn2(58080,0,0,533.6,-39.4,-22.7,67.9);
	quest::spawn2(58080,0,0,533.2,-74.4,-24.4,85.3);
	quest::spawn2(58080,0,0,565.1,-87,-28.2,7.9);
	}
	else {
	#Do Nothing;
	}
	}