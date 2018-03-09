##zonecontroller.pl ID 59185 in Mistmoore##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(59165); 
		quest::depopall(59166);
		quest::depopall(59167);
		quest::depopall(59168);
		quest::depopall(59169);
		quest::depopall(59170);
		quest::depopall(59171);
		quest::depopall(59172);
		quest::depopall(59173);
		quest::depopall(59174);
		quest::depopall(59175);
		quest::depopall(59176);
		quest::depopall(59177);
		quest::depopall(59178);
		quest::depopall(59179);
		quest::depopall(59180);
		quest::depopall(59181);
		quest::depopall(59182);
		quest::depopall(59183);
		quest::depopall(59184);
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(59165,0,0,205.8,-304.5,-196.4,196.4);
		quest::spawn2(59166,0,0,192.7,-282.8,-191.3,184.5);
		quest::spawn2(59166,0,0,183,-312.6,-187.5,221.9);
		quest::spawn2(59166,0,0,150.8,-307,-180.9,209);
		quest::spawn2(59166,0,0,170.6,-282.3,-182.6,169.9);
		}
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(59167,0,0,205.8,-304.5,-196.4,196.4);
		quest::spawn2(59168,0,0,192.7,-282.8,-191.3,184.5);
		quest::spawn2(59168,0,0,183,-312.6,-187.5,221.9);
		quest::spawn2(59168,0,0,150.8,-307,-180.9,209);
		quest::spawn2(59168,0,0,170.6,-282.3,-182.6,169.9);
		}
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(59169,0,0,205.8,-304.5,-196.4,196.4);
		quest::spawn2(59170,0,0,192.7,-282.8,-191.3,184.5);
		quest::spawn2(59170,0,0,183,-312.6,-187.5,221.9);
		quest::spawn2(59170,0,0,150.8,-307,-180.9,209);
		quest::spawn2(59170,0,0,170.6,-282.3,-182.6,169.9);
		}
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(59171,0,0,205.8,-304.5,-196.4,196.4);
		quest::spawn2(59172,0,0,192.7,-282.8,-191.3,184.5);
		quest::spawn2(59172,0,0,183,-312.6,-187.5,221.9);
		quest::spawn2(59172,0,0,150.8,-307,-180.9,209);
		quest::spawn2(59172,0,0,170.6,-282.3,-182.6,169.9);
		}
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(59173,0,0,205.8,-304.5,-196.4,196.4);
		quest::spawn2(59174,0,0,192.7,-282.8,-191.3,184.5);
		quest::spawn2(59174,0,0,183,-312.6,-187.5,221.9);
		quest::spawn2(59174,0,0,150.8,-307,-180.9,209);
		quest::spawn2(59174,0,0,170.6,-282.3,-182.6,169.9);
		}
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(59175,0,0,205.8,-304.5,-196.4,196.4);
		quest::spawn2(59176,0,0,192.7,-282.8,-191.3,184.5);
		quest::spawn2(59176,0,0,183,-312.6,-187.5,221.9);
		quest::spawn2(59176,0,0,150.8,-307,-180.9,209);
		quest::spawn2(59176,0,0,170.6,-282.3,-182.6,169.9);
		}
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(59177,0,0,205.8,-304.5,-196.4,196.4);
		quest::spawn2(59178,0,0,192.7,-282.8,-191.3,184.5);
		quest::spawn2(59178,0,0,183,-312.6,-187.5,221.9);
		quest::spawn2(59178,0,0,150.8,-307,-180.9,209);
		quest::spawn2(59178,0,0,170.6,-282.3,-182.6,169.9);
		}
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(59179,0,0,205.8,-304.5,-196.4,196.4);
		quest::spawn2(59180,0,0,192.7,-282.8,-191.3,184.5);
		quest::spawn2(59180,0,0,183,-312.6,-187.5,221.9);
		quest::spawn2(59180,0,0,150.8,-307,-180.9,209);
		quest::spawn2(59180,0,0,170.6,-282.3,-182.6,169.9);
		}
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(59181,0,0,205.8,-304.5,-196.4,196.4);
		quest::spawn2(59182,0,0,192.7,-282.8,-191.3,184.5);
		quest::spawn2(59182,0,0,183,-312.6,-187.5,221.9);
		quest::spawn2(59182,0,0,150.8,-307,-180.9,209);
		quest::spawn2(59182,0,0,170.6,-282.3,-182.6,169.9);
		}
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(59183,0,0,205.8,-304.5,-196.4,196.4);
		quest::spawn2(59184,0,0,192.7,-282.8,-191.3,184.5);
		quest::spawn2(59184,0,0,183,-312.6,-187.5,221.9);
		quest::spawn2(59184,0,0,150.8,-307,-180.9,209);
		quest::spawn2(59184,0,0,170.6,-282.3,-182.6,169.9);
		}
		else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End