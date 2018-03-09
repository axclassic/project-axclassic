##zonecontroller.pl ID 88116 in Kaesora##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {Event8} ##
sub EVENT_SIGNAL {
    if($ulevel <= 49 && !defined($qglobals{'EasterInProgress'}) ) {
		quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(88096); 
		quest::depopall(88097);
		quest::depopall(88098);
		quest::depopall(88099);
		quest::depopall(88100);
		quest::depopall(88101);
		quest::depopall(88102);
		quest::depopall(88103);
		quest::depopall(88104);
		quest::depopall(88105);
		quest::depopall(88106);
		quest::depopall(88107);
		quest::depopall(88108);
		quest::depopall(88109);
		quest::depopall(88110);
		quest::depopall(88111);
		quest::depopall(88112);
		quest::depopall(88113);
		quest::depopall(88114);
		quest::depopall(88115);
	if($signal >= 1 && $signal <= 5) {
		quest::spawn2(88096,0,0,139.6,200.8,49,189.9);
		quest::spawn2(88097,0,0,53.3,184.4,49,251.8);
		quest::spawn2(88097,0,0,84,194.2,49,195.3);
		quest::spawn2(88097,0,0,65,207,49,195.1);
		quest::spawn2(88097,0,0,106.8,206.6,49,193);
		}
	if($signal >= 6 && $signal <= 10) {
		quest::spawn2(88098,0,0,139.6,200.8,49,189.9);
		quest::spawn2(88099,0,0,53.3,184.4,49,251.8);
		quest::spawn2(88099,0,0,84,194.2,49,195.3);
		quest::spawn2(88099,0,0,65,207,49,195.1);
		quest::spawn2(88099,0,0,106.8,206.6,49,193);
		}
	if($signal >= 11 && $signal <= 15) {
		quest::spawn2(88100,0,0,139.6,200.8,49,189.9);
		quest::spawn2(88101,0,0,53.3,184.4,49,251.8);
		quest::spawn2(88101,0,0,84,194.2,49,195.3);
		quest::spawn2(88101,0,0,65,207,49,195.1);
		quest::spawn2(88101,0,0,106.8,206.6,49,193);
		}
	if($signal >= 16 && $signal <= 20) {
		quest::spawn2(88102,0,0,139.6,200.8,49,189.9);
		quest::spawn2(88103,0,0,53.3,184.4,49,251.8);
		quest::spawn2(88103,0,0,84,194.2,49,195.3);
		quest::spawn2(88103,0,0,65,207,49,195.1);
		quest::spawn2(88103,0,0,106.8,206.6,49,193);
		}
	if($signal >= 21 && $signal <= 25) {
		quest::spawn2(88104,0,0,139.6,200.8,49,189.9);
		quest::spawn2(88105,0,0,53.3,184.4,49,251.8);
		quest::spawn2(88105,0,0,84,194.2,49,195.3);
		quest::spawn2(88105,0,0,65,207,49,195.1);
		quest::spawn2(88105,0,0,106.8,206.6,49,193);
		}
	if($signal >= 26 && $signal <= 30) {
		quest::spawn2(88106,0,0,139.6,200.8,49,189.9);
		quest::spawn2(88107,0,0,53.3,184.4,49,251.8);
		quest::spawn2(88107,0,0,84,194.2,49,195.3);
		quest::spawn2(88107,0,0,65,207,49,195.1);
		quest::spawn2(88107,0,0,106.8,206.6,49,193);
		}
	if($signal >= 31 && $signal <= 35) {
		quest::spawn2(88108,0,0,139.6,200.8,49,189.9);
		quest::spawn2(88109,0,0,53.3,184.4,49,251.8);
		quest::spawn2(88109,0,0,84,194.2,49,195.3);
		quest::spawn2(88109,0,0,65,207,49,195.1);
		quest::spawn2(88109,0,0,106.8,206.6,49,193);
		}
	if($signal >= 36 && $signal <= 40) {
		quest::spawn2(88110,0,0,139.6,200.8,49,189.9);
		quest::spawn2(88111,0,0,53.3,184.4,49,251.8);
		quest::spawn2(88111,0,0,84,194.2,49,195.3);
		quest::spawn2(88111,0,0,65,207,49,195.1);
		quest::spawn2(88111,0,0,106.8,206.6,49,193);
		}
	if($signal >= 41 && $signal <= 45) {
		quest::spawn2(88112,0,0,139.6,200.8,49,189.9);
		quest::spawn2(88113,0,0,53.3,184.4,49,251.8);
		quest::spawn2(88113,0,0,84,194.2,49,195.3);
		quest::spawn2(88113,0,0,65,207,49,195.1);
		quest::spawn2(88113,0,0,106.8,206.6,49,193);
		}
	if($signal >= 46 && $signal <= 49) {
		quest::spawn2(88114,0,0,139.6,200.8,49,189.9);
		quest::spawn2(88115,0,0,53.3,184.4,49,251.8);
		quest::spawn2(88115,0,0,84,194.2,49,195.3);
		quest::spawn2(88115,0,0,65,207,49,195.1);
		quest::spawn2(88115,0,0,106.8,206.6,49,193);
		}
	else {
		#Do Nothing;
	   }
	}
} # EVENT_SIGNAL End