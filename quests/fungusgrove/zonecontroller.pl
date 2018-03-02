##zonecontroller.pl ID 157425 in Fungus Grove##
sub EVENT_SIGNAL {
     if($signal == 485) {
	quest::depopall(157419); 
	quest::depopall(157420);
	quest::depopall(157421);
	quest::depopall(157422);
	quest::depopall(157423);
	quest::depopall(157424);
	}
	elsif($signal == 486) {
	quest::spawn2(157419,0,0,-55.9,638.8,-263,124);
	quest::spawn2(157420,0,0,-25,626.5,-263,126.5);
	quest::spawn2(157420,0,0,-13.6,597.2,-263,107.8);
	quest::spawn2(157420,0,0,-45.3,589.3,-263,99.1);
	quest::spawn2(157420,0,0,-82.5,607.6,-263,83.8);
	}
	elsif($signal == 487) {
	quest::spawn2(157421,0,0,-55.9,638.8,-263,124);
	quest::spawn2(157422,0,0,-25,626.5,-263,126.5);
	quest::spawn2(157422,0,0,-13.6,597.2,-263,107.8);
	quest::spawn2(157422,0,0,-45.3,589.3,-263,99.1);
	quest::spawn2(157422,0,0,-82.5,607.6,-263,83.8);
	}
	elsif($signal == 488) {
	quest::spawn2(157423,0,0,-55.9,638.8,-263,124);
	quest::spawn2(157424,0,0,-25,626.5,-263,126.5);
	quest::spawn2(157424,0,0,-13.6,597.2,-263,107.8);
	quest::spawn2(157424,0,0,-45.3,589.3,-263,99.1);
	quest::spawn2(157424,0,0,-82.5,607.6,-263,83.8);
	}
	  else {
	#Do Nothing;
	}
	}