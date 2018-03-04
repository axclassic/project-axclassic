##zonecontroller.pl ID 92205 in Frontier Mountains##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 529) {
	quest::depopall(92199); 
	quest::depopall(92200);
	quest::depopall(92201);
	quest::depopall(92202);
	quest::depopall(92203);
	quest::depopall(92204);
	}
	elsif($signal == 530) {
	quest::spawn2(92199,0,0,-2072.4,742.6,21.9,74.5);
	quest::spawn2(92200,0,0,-2058,777.7,26.2,99.9);
	quest::spawn2(92200,0,0,-2020.8,747.4,13.1,105.6);
	quest::spawn2(92200,0,0,-2094.9,707.8,18.2,69);
	quest::spawn2(92200,0,0,-2049.2,690.9,2.2,28.5);
	}
	elsif($signal == 531) {
	quest::spawn2(92201,0,0,-2072.4,742.6,21.9,74.5);
	quest::spawn2(92202,0,0,-2058,777.7,26.2,99.9);
	quest::spawn2(92202,0,0,-2020.8,747.4,13.1,105.6);
	quest::spawn2(92202,0,0,-2094.9,707.8,18.2,69);
	quest::spawn2(92202,0,0,-2049.2,690.9,2.2,28.5);
	}
	elsif($signal == 532) {
	quest::spawn2(92203,0,0,-2072.4,742.6,21.9,74.5);
	quest::spawn2(92204,0,0,-2058,777.7,26.2,99.9);
	quest::spawn2(92204,0,0,-2020.8,747.4,13.1,105.6);
	quest::spawn2(92204,0,0,-2094.9,707.8,18.2,69);
	quest::spawn2(92204,0,0,-2049.2,690.9,2.2,28.5);
	}
	  else {
	#Do Nothing;
	}
	}