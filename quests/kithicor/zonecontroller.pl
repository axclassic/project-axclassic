##zonecontroller.pl ID 20276 in kithicor##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##

sub EVENT_SIGNAL {
	if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(20256); 
		quest::depopall(20257);
		quest::depopall(20258);
		quest::depopall(20259);
		quest::depopall(20260);
		quest::depopall(20261);
		quest::depopall(20262);
		quest::depopall(20263);
		quest::depopall(20264);
		quest::depopall(20265);
		quest::depopall(20266);
		quest::depopall(20267);
		quest::depopall(20268);
		quest::depopall(20269);
		quest::depopall(20270);
		quest::depopall(20271);
		quest::depopall(20272);
		quest::depopall(20273);
		quest::depopall(20274);
		quest::depopall(20275);
	if($signal >= 1 && $signal <= 5) {
	    quest::spawn2(20256,0,0,4843.4,435.9,673.2,199.4);
		quest::spawn2(20257,0,0,4773.7,476.6,666.7,180.5);
		quest::spawn2(20257,0,0,4826.5,472,671.9,185.5);
		quest::spawn2(20257,0,0,4841.9,393.7,673,190.6);
		quest::spawn2(20257,0,0,4778.3,371.2,667,186.6);
		}
		if($signal >= 6 && $signal <= 10) {
	    quest::spawn2(20258,0,0,4843.4,435.9,673.2,199.4);
		quest::spawn2(20259,0,0,4773.7,476.6,666.7,180.5);
		quest::spawn2(20259,0,0,4826.5,472,671.9,185.5);
		quest::spawn2(20259,0,0,4841.9,393.7,673,190.6);
		quest::spawn2(20259,0,0,4778.3,371.2,667,186.6);
		}
		if($signal >= 11 && $signal <= 15) {
	    quest::spawn2(20260,0,0,4843.4,435.9,673.2,199.4);
		quest::spawn2(20261,0,0,4773.7,476.6,666.7,180.5);
		quest::spawn2(20261,0,0,4826.5,472,671.9,185.5);
		quest::spawn2(20261,0,0,4841.9,393.7,673,190.6);
		quest::spawn2(20261,0,0,4778.3,371.2,667,186.6);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(20262,0,0,4843.4,435.9,673.2,199.4);
		quest::spawn2(20263,0,0,4773.7,476.6,666.7,180.5);
		quest::spawn2(20263,0,0,4826.5,472,671.9,185.5);
		quest::spawn2(20263,0,0,4841.9,393.7,673,190.6);
		quest::spawn2(20263,0,0,4778.3,371.2,667,186.6);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(20264,0,0,4843.4,435.9,673.2,199.4);
		quest::spawn2(20265,0,0,4773.7,476.6,666.7,180.5);
		quest::spawn2(20265,0,0,4826.5,472,671.9,185.5);
		quest::spawn2(20265,0,0,4841.9,393.7,673,190.6);
		quest::spawn2(20265,0,0,4778.3,371.2,667,186.6);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(20266,0,0,4843.4,435.9,673.2,199.4);
		quest::spawn2(20267,0,0,4773.7,476.6,666.7,180.5);
		quest::spawn2(20267,0,0,4826.5,472,671.9,185.5);
		quest::spawn2(20267,0,0,4841.9,393.7,673,190.6);
		quest::spawn2(20267,0,0,4778.3,371.2,667,186.6);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(20268,0,0,4843.4,435.9,673.2,199.4);
		quest::spawn2(20269,0,0,4773.7,476.6,666.7,180.5);
		quest::spawn2(20269,0,0,4826.5,472,671.9,185.5);
		quest::spawn2(20269,0,0,4841.9,393.7,673,190.6);
		quest::spawn2(20269,0,0,4778.3,371.2,667,186.6);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(20270,0,0,4843.4,435.9,673.2,199.4);
		quest::spawn2(20271,0,0,4773.7,476.6,666.7,180.5);
		quest::spawn2(20271,0,0,4826.5,472,671.9,185.5);
		quest::spawn2(20271,0,0,4841.9,393.7,673,190.6);
		quest::spawn2(20271,0,0,4778.3,371.2,667,186.6);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(20272,0,0,4843.4,435.9,673.2,199.4);
		quest::spawn2(20273,0,0,4773.7,476.6,666.7,180.5);
		quest::spawn2(20273,0,0,4826.5,472,671.9,185.5);
		quest::spawn2(20273,0,0,4841.9,393.7,673,190.6);
		quest::spawn2(20273,0,0,4778.3,371.2,667,186.6);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(20274,0,0,4843.4,435.9,673.2,199.4);
		quest::spawn2(20275,0,0,4773.7,476.6,666.7,180.5);
		quest::spawn2(20275,0,0,4826.5,472,671.9,185.5);
		quest::spawn2(20275,0,0,4841.9,393.7,673,190.6);
		quest::spawn2(20275,0,0,4778.3,371.2,667,186.6);
		}
	if($signal >= 50 && $signal <= 65) {
		quest::depopall(20256); 
		quest::depopall(20257);
		quest::depopall(20258);
		quest::depopall(20259);
		quest::depopall(20260);
		quest::depopall(20261);
		quest::depopall(20262);
		quest::depopall(20263);
		quest::depopall(20264);
		quest::depopall(20265);
		quest::depopall(20266);
		quest::depopall(20267);
		quest::depopall(20268);
		quest::depopall(20269);
		quest::depopall(20270);
		quest::depopall(20271);
		quest::depopall(20272);
		quest::depopall(20273);
		quest::depopall(20274);
		quest::depopall(20275);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End