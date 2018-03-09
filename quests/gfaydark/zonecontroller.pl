##zonecontroller.pl ID 54330 in Gfaydark##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel <= 49 && !defined($glogals{'EasterInProgress'}) ) {
		quest::depopall(54310); 
		quest::depopall(54311);
		quest::depopall(54312);
		quest::depopall(54313);
		quest::depopall(54314);
		quest::depopall(54315);
		quest::depopall(54316);
		quest::depopall(54317);
		quest::depopall(54318);
		quest::depopall(54319);
		quest::depopall(54320);
		quest::depopall(54321);
		quest::depopall(54322);
		quest::depopall(54323);
		quest::depopall(54324);
		quest::depopall(54325);
		quest::depopall(54326);
		quest::depopall(54327);
		quest::depopall(54328);
		quest::depopall(54329);
		quest::depopall(54309);
	if($signal >= 1 && $signal <= 5) {
	    quest::spawn2(54309,0,0,210.6,81.2,-2.8,237.9);
		quest::spawn2(54310,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54311,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54311,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54311,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54311,0,0,-1908.2,2160.9,-42.5,117.9);
	    }
	if($signal >= 6 && $signal <= 10) {
	    quest::spawn2(54309,0,0,210.6,81.2,-2.8,237.9);
		quest::spawn2(54312,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54313,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54313,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54313,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54313,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	if($signal >= 11&& $signal <= 15) {
		quest::spawn2(54309,0,0,210.6,81.2,-2.8,237.9);
		quest::spawn2(54314,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54315,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54315,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54315,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54315,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(54309,0,0,210.6,81.2,-2.8,237.9);
		quest::spawn2(54316,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54317,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54317,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54317,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54317,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(54309,0,0,210.6,81.2,-2.8,237.9);
		quest::spawn2(54318,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54319,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54319,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54319,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54319,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(54309,0,0,210.6,81.2,-2.8,237.9);
		quest::spawn2(54320,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54321,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54321,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54321,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54321,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(54309,0,0,210.6,81.2,-2.8,237.9);
		quest::spawn2(54322,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54323,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54323,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54323,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54323,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(54309,0,0,210.6,81.2,-2.8,237.9);
		quest::spawn2(54324,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54325,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54325,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54325,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54325,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(54309,0,0,210.6,81.2,-2.8,237.9);
		quest::spawn2(54326,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54327,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54327,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54327,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54327,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(54309,0,0,210.6,81.2,-2.8,237.9);
		quest::spawn2(54328,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54329,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54329,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54329,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54329,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	if($signal >= 50 && $signal <= 65) {
		quest::spawn2(54309,0,0,210.6,81.2,-2.8,237.9); ##Peter Cottontail
		quest::depopall(54310); 
		quest::depopall(54311);
		quest::depopall(54312);
		quest::depopall(54313);
		quest::depopall(54314);
		quest::depopall(54315);
		quest::depopall(54316);
		quest::depopall(54317);
		quest::depopall(54318);
		quest::depopall(54319);
		quest::depopall(54320);
		quest::depopall(54321);
		quest::depopall(54322);
		quest::depopall(54323);
		quest::depopall(54324);
		quest::depopall(54325);
		quest::depopall(54326);
		quest::depopall(54327);
		quest::depopall(54328);
		quest::depopall(54329);
		quest::depopall(54309);
		}
			else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End