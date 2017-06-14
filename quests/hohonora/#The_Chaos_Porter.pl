##The_Chaos_Porter 211169##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
    }
sub EVENT_ENTER {
    if(defined $qglobals{"Djinnone"}) {
    quest::ze(14, "You are not skilled enough to enter the final Chamber of Chaos.");
	}
	if(defined $qglobals{"Djinntwo"}) {
    quest::ze(14, "You are not skilled enough to enter the final Chamber of Chaos.");
	}
	if(defined $qglobals{"Djinnthree"}) {
    quest::ze(14, "You are not skilled enough to enter the final Chamber of Chaos.");
	}
	if(defined $qglobals{"Djinnfour"}) {
    quest::ze(14, "You are not skilled enough to enter the final Chamber of Chaos.");
	}
	if(defined $qglobals{"Djinnfive"}) {
    quest::ze(14, "You are not skilled enough to enter the final Chamber of Chaos.");
	}
	if(defined $qglobals{"Djinnsix"}) {
    quest::ze(14, "You are not skilled enough to enter the final Chamber of Chaos.");
	}
	if(defined $qglobals{"Djinnseven"}) {
    quest::ze(14, "You are not skilled enough to enter the final Chamber of Chaos.");
	}
	if(defined $qglobals{"Djinneight"}) {
    quest::ze(14, "You are not skilled enough to enter the final Chamber of Chaos.");
	}
    if(defined $qglobals{"Djinnnine"}) {
    quest::ze(15, "The world begins to spin as you blackout.");
	quest::ze(14, "You feel your body move across space and time.");
    quest::movepc(211,-1377.2,-2100,1,125);
	quest::spawn2(211142,0,0,-1374.8,-2265.3,1,254.5);
	quest::spawn2(211176,0,0,-1371.7,-2314,1,1.4);
	quest::spawn2(211174,0,0,-1403.9,-2302.6,1,27);
	quest::spawn2(211175,0,0,-1412.7,-2255.7,1,71.4);
	quest::spawn2(211173,0,0,-1394.7,-2220.6,1,106.5);
	quest::spawn2(211179,0,0,-1366.8,-2211.7,1,131.6);
	quest::spawn2(211178,0,0,-1337.9,-2226.7,1,153.3);
	quest::spawn2(211177,0,0,-1339.9,-2293.4,1,217.4);
	#quest::signalwith(211142,300,10000);
	quest::depop();
	}
  }