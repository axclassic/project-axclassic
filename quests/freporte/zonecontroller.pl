##zonecontroller.pl ID 10233 in Freporte##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
     if($ulevel <= 49 && !defined($glogals{'EasterInProgress'}) ) {
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
		quest::depopall(10212); 
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(10212,0,0,-638.7,-244.1,-55,208.8); ##Peter Cottontail
		quest::spawn2(10213,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10214,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10214,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10214,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10214,0,0,-123.8,-870.5,-55,180.5);
		}
	if($signal >= 6 && $signal <= 10) {
		quest::spawn2(10212,0,0,-638.7,-244.1,-55,208.8); ##Peter Cottontail
		quest::spawn2(10215,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10216,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10216,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10216,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10216,0,0,-123.8,-870.5,-55,180.5);
		}
	if($signal >= 11 && $signal <= 15) {
		quest::spawn2(10212,0,0,-638.7,-244.1,-55,208.8); ##Peter Cottontail
		quest::spawn2(10217,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10218,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10218,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10218,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10218,0,0,-123.8,-870.5,-55,180.5);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(10212,0,0,-638.7,-244.1,-55,208.8); ##Peter Cottontail
		quest::spawn2(10219,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10220,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10220,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10220,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10220,0,0,-123.8,-870.5,-55,180.5);
	}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(10212,0,0,-638.7,-244.1,-55,208.8); ##Peter Cottontail
		quest::spawn2(10221,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10222,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10222,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10222,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10222,0,0,-123.8,-870.5,-55,180.5);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(10212,0,0,-638.7,-244.1,-55,208.8); ##Peter Cottontail
		quest::spawn2(10223,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10224,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10224,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10224,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10224,0,0,-123.8,-870.5,-55,180.5);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(10212,0,0,-638.7,-244.1,-55,208.8); ##Peter Cottontail
		quest::spawn2(10225,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10226,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10226,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10226,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10226,0,0,-123.8,-870.5,-55,180.5);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(10212,0,0,-638.7,-244.1,-55,208.8); ##Peter Cottontail
		quest::spawn2(10227,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10228,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10228,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10228,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10228,0,0,-123.8,-870.5,-55,180.5);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(10212,0,0,-638.7,-244.1,-55,208.8); ##Peter Cottontail
		quest::spawn2(10229,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10230,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10230,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10230,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10230,0,0,-123.8,-870.5,-55,180.5);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(10212,0,0,-638.7,-244.1,-55,208.8); ##Peter Cottontail
		quest::spawn2(10231,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10232,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10232,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10232,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10232,0,0,-123.8,-870.5,-55,180.5);
		}
	if($signal >= 50 && $signal <= 65) {
		quest::spawn2(10212,0,0,-638.7,-244.1,-55,208.8); ##Peter Cottontail
		quest::depopall(54310); 
		quest::depopall(54311);
		quest::depopall(68312);
		quest::depopall(68313);
		quest::depopall(68314);
		quest::depopall(68315);
		quest::depopall(68316);
		quest::depopall(68317);
		quest::depopall(68318);
		quest::depopall(68319);
		quest::depopall(68320);
		quest::depopall(68321);
		quest::depopall(68322);
		quest::depopall(68323);
		quest::depopall(68324);
		quest::depopall(68325);
		quest::depopall(68326);
		quest::depopall(68327);
		quest::depopall(68328);
		quest::depopall(68329);
		}
     else {
	#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End