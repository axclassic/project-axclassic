##zonecontroller.pl ID 97104 in Kurns Tower##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(97084); 
		quest::depopall(97085);
		quest::depopall(97086);
		quest::depopall(97087);
		quest::depopall(97088);
		quest::depopall(97089);
		quest::depopall(97090);
		quest::depopall(97091);
		quest::depopall(97092);
		quest::depopall(97093);
		quest::depopall(97094);
		quest::depopall(97095);
		quest::depopall(97096);
		quest::depopall(97097);
		quest::depopall(97098);
		quest::depopall(97099);
		quest::depopall(97100);
		quest::depopall(97101);
		quest::depopall(97102);
		quest::depopall(97103);
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(97084,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97085,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97085,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97085,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97085,0,0,167,-137.1,1,198);
		}
	if($signal >= 6 && $signal <= 10) {
		quest::spawn2(97086,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97087,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97087,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97087,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97087,0,0,167,-137.1,1,198);
		}
	if($signal >= 11 && $signal <= 15) {
		quest::spawn2(97088,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97089,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97089,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97089,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97089,0,0,167,-137.1,1,198);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(97090,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97091,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97091,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97091,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97091,0,0,167,-137.1,1,198);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(97092,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97093,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97093,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97093,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97093,0,0,167,-137.1,1,198);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(97094,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97095,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97095,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97095,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97095,0,0,167,-137.1,1,198);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(97096,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97097,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97097,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97097,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97097,0,0,167,-137.1,1,198);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(97098,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97099,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97099,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97099,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97099,0,0,167,-137.1,1,198);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(97100,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97101,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97101,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97101,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97101,0,0,167,-137.1,1,198);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(97102,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97103,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97103,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97103,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97103,0,0,167,-137.1,1,198);
		}
	  else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End