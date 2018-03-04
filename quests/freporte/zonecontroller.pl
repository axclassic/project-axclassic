##zonecontroller.pl ID 10233 in Freporte##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 22) {
	quest::depopall(10213); 
	quest::depopall(10214);
	quest::depopall(10215);
	quest::depopall(10216);
	quest::depopall(10217);
	quest::depopall(10218);
	quest::depopall(10219);
	quest::depopall(10220);
	quest::depopall(10221);
	quest::depopall(10222);
	quest::depopall(10223);
	quest::depopall(10224);
	quest::depopall(10225);
	quest::depopall(10226);
	quest::depopall(10227);
	quest::depopall(10228);
	quest::depopall(10229);
	quest::depopall(10230);
	quest::depopall(10231);
	quest::depopall(10232);
	}
	elsif($signal == 12) {
	quest::spawn2(10213,0,0,-122.5,-915.8,-55,191);
	quest::spawn2(10214,0,0,-120.8,-943.1,-55,201.3);
	quest::spawn2(10214,0,0,-150.2,-923.9,-55,199.4);
	quest::spawn2(10214,0,0,-147.8,-892.1,-55,190.5);
	quest::spawn2(10214,0,0,-123.8,-870.5,-55,180.5);
	}
	elsif($signal == 13) {
	quest::spawn2(10215,0,0,-122.5,-915.8,-55,191);
	quest::spawn2(10216,0,0,-120.8,-943.1,-55,201.3);
	quest::spawn2(10216,0,0,-150.2,-923.9,-55,199.4);
	quest::spawn2(10216,0,0,-147.8,-892.1,-55,190.5);
	quest::spawn2(10216,0,0,-123.8,-870.5,-55,180.5);
	}
	elsif($signal == 14) {
	quest::spawn2(10217,0,0,-122.5,-915.8,-55,191);
	quest::spawn2(10218,0,0,-120.8,-943.1,-55,201.3);
	quest::spawn2(10218,0,0,-150.2,-923.9,-55,199.4);
	quest::spawn2(10218,0,0,-147.8,-892.1,-55,190.5);
	quest::spawn2(10218,0,0,-123.8,-870.5,-55,180.5);
	}
	elsif($signal == 15) {
	quest::spawn2(10219,0,0,-122.5,-915.8,-55,191);
	quest::spawn2(10220,0,0,-120.8,-943.1,-55,201.3);
	quest::spawn2(10220,0,0,-150.2,-923.9,-55,199.4);
	quest::spawn2(10220,0,0,-147.8,-892.1,-55,190.5);
	quest::spawn2(10220,0,0,-123.8,-870.5,-55,180.5);
	}
	elsif($signal == 16) {
	quest::spawn2(10221,0,0,-122.5,-915.8,-55,191);
	quest::spawn2(10222,0,0,-120.8,-943.1,-55,201.3);
	quest::spawn2(10222,0,0,-150.2,-923.9,-55,199.4);
	quest::spawn2(10222,0,0,-147.8,-892.1,-55,190.5);
	quest::spawn2(10222,0,0,-123.8,-870.5,-55,180.5);
	}
	elsif($signal == 17) {
	quest::spawn2(10223,0,0,-122.5,-915.8,-55,191);
	quest::spawn2(10224,0,0,-120.8,-943.1,-55,201.3);
	quest::spawn2(10224,0,0,-150.2,-923.9,-55,199.4);
	quest::spawn2(10224,0,0,-147.8,-892.1,-55,190.5);
	quest::spawn2(10224,0,0,-123.8,-870.5,-55,180.5);
	}
	elsif($signal == 18) {
	quest::spawn2(10225,0,0,-122.5,-915.8,-55,191);
	quest::spawn2(10226,0,0,-120.8,-943.1,-55,201.3);
	quest::spawn2(10226,0,0,-150.2,-923.9,-55,199.4);
	quest::spawn2(10226,0,0,-147.8,-892.1,-55,190.5);
	quest::spawn2(10226,0,0,-123.8,-870.5,-55,180.5);
	}
	elsif($signal == 19) {
	quest::spawn2(10227,0,0,-122.5,-915.8,-55,191);
	quest::spawn2(10228,0,0,-120.8,-943.1,-55,201.3);
	quest::spawn2(10228,0,0,-150.2,-923.9,-55,199.4);
	quest::spawn2(10228,0,0,-147.8,-892.1,-55,190.5);
	quest::spawn2(10228,0,0,-123.8,-870.5,-55,180.5);
	}
	elsif($signal == 20) {
	quest::spawn2(10229,0,0,-122.5,-915.8,-55,191);
	quest::spawn2(10230,0,0,-120.8,-943.1,-55,201.3);
	quest::spawn2(10230,0,0,-150.2,-923.9,-55,199.4);
	quest::spawn2(10230,0,0,-147.8,-892.1,-55,190.5);
	quest::spawn2(10230,0,0,-123.8,-870.5,-55,180.5);
	}
	elsif($signal == 21) {
	quest::spawn2(10231,0,0,-122.5,-915.8,-55,191);
	quest::spawn2(10232,0,0,-120.8,-943.1,-55,201.3);
	quest::spawn2(10232,0,0,-150.2,-923.9,-55,199.4);
	quest::spawn2(10232,0,0,-147.8,-892.1,-55,190.5);
	quest::spawn2(10232,0,0,-123.8,-870.5,-55,180.5);
	}
	else {
	#Do Nothing;
	}
	}