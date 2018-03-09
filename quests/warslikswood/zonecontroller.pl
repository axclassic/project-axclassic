##zonecontroller.pl ID 79141 in Warsliks Woods##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel >= 50 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(79135); 
		quest::depopall(79136);
		quest::depopall(79137);
		quest::depopall(79138);
		quest::depopall(79139);
		quest::depopall(79140);
	if($signal >= 50 && $signal <= 55) {
		quest::spawn2(79135,0,0,2882.8,-1878.1,100.7,196.9);
		quest::spawn2(79136,0,0,2882.3,-1933.1,102,199.5);
		quest::spawn2(79136,0,0,2839,-1909.5,82.7,188.9);
		quest::spawn2(79136,0,0,2883.3,-1836.9,109.8,193.1);
		quest::spawn2(79136,0,0,2842.4,-1841.5,90.7,178.5);
		}
	if($signal >= 56 && $signal <= 60) {
		quest::spawn2(79137,0,0,2882.8,-1878.1,100.7,196.9);
		quest::spawn2(79138,0,0,2882.3,-1933.1,102,199.5);
		quest::spawn2(79138,0,0,2839,-1909.5,82.7,188.9);
		quest::spawn2(79138,0,0,2883.3,-1836.9,109.8,193.1);
		quest::spawn2(79138,0,0,2842.4,-1841.5,90.7,178.5);
		}
	if($signal >= 61 && $signal <= 65) {
		quest::spawn2(79139,0,0,2882.8,-1878.1,100.7,196.9);
		quest::spawn2(79140,0,0,2882.3,-1933.1,102,199.5);
		quest::spawn2(79140,0,0,2839,-1909.5,82.7,188.9);
		quest::spawn2(79140,0,0,2883.3,-1836.9,109.8,193.1);
		quest::spawn2(79140,0,0,2842.4,-1841.5,90.7,178.5);
		}
	}
	else {
		#Do Nothing;
	}
} # EVENT_SIGNAL End