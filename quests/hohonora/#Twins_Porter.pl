##Twins_Porter 211140##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
    }
sub EVENT_ENTER {
    if(defined $qglobals{"Djinnone"}) {
    quest::ze(14, "You are not skilled enough to venture under the Temple.");
	}
	if(defined $qglobals{"Djinntwo"}) {
    quest::ze(14, "You are not skilled enough to venture under the Temple.");
	}
	if(defined $qglobals{"Djinnthree"}) {
    quest::ze(14, "You are not skilled enough to venture under the Temple.");
	}
	if(defined $qglobals{"Djinnfour"}) {
    quest::ze(14, "You are not skilled enough to venture under the Temple.");
	}
    if(defined $qglobals{"Djinnfive"}){
    quest::ze(15, "You feel the world around you begin to spin as you blackout.");
    quest::movepc(211,-783.4,1305.5,1,164.9);
	quest::depop();
    }
	if(defined $qglobals{"Djinnsix"}){
    quest::ze(15, "You feel the world around you begin to spin as you blackout.");
    quest::movepc(211,-783.4,1305.5,1,164.9);
	quest::depop();
    }
	if(defined $qglobals{"Djinnseven"}){
    quest::ze(15, "You feel the world around you begin to spin as you blackout.");
    quest::movepc(211,-783.4,1305.5,1,164.9);
	quest::depop();
    }
	if(defined $qglobals{"Djinneight"}){
    quest::ze(15, "You feel the world around you begin to spin as you blackout.");
    quest::movepc(211,-783.4,1305.5,1,164.9);
	quest::depop();
    }
	if(defined $qglobals{"Djinnnine"}){
    quest::ze(15, "You feel the world around you begin to spin as you blackout.");
    quest::movepc(211,-783.4,1305.5,1,164.9);
	quest::depop();
    }
  }