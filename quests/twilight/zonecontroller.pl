##zonecontroller.pl ID 170576 in Twilight Sea##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel >= 50 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(170570); 
		quest::depopall(170571);
		quest::depopall(170572);
		quest::depopall(170573);
		quest::depopall(170574);
		quest::depopall(170575);
	if($signal >= 50 && $signal <= 55) {
		quest::spawn2(170570,0,0,1932.1,621.3,28.4,183.6);
		quest::spawn2(170571,0,0,1904.4,666.1,33.6,159.1);
		quest::spawn2(170571,0,0,1871.3,647.8,23.7,171.1);
		quest::spawn2(170571,0,0,1893.3,571.9,24.7,199.3);
		quest::spawn2(170571,0,0,1938.6,574.3,34,202.9);
		}
	if($signal >= 56 && $signal <= 60) {
		quest::spawn2(170572,0,0,1932.1,621.3,28.4,183.6);
		quest::spawn2(170573,0,0,1904.4,666.1,33.6,159.1);
		quest::spawn2(170573,0,0,1871.3,647.8,23.7,171.1);
		quest::spawn2(170573,0,0,1893.3,571.9,24.7,199.3);
		quest::spawn2(170573,0,0,1938.6,574.3,34,202.9);
		}
	if($signal >= 61 && $signal <= 65) {
		quest::spawn2(170574,0,0,1932.1,621.3,28.4,183.6);
		quest::spawn2(170575,0,0,1904.4,666.1,33.6,159.1);
		quest::spawn2(170575,0,0,1871.3,647.8,23.7,171.1);
		quest::spawn2(170575,0,0,1893.3,571.9,24.7,199.3);
		quest::spawn2(170575,0,0,1938.6,574.3,34,202.9);
		}
	}
	else {
		#Do Nothing;
	}
} # EVENT_SIGNAL End