##Zenurix_Porter 211155##
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
    quest::movepc(211,-1516.2,1977.1,1,65.4);
	quest::spawn2(211149,0,0,-1407.7,1970.2,1,193.1);
	quest::depop();
    }
    if(defined $qglobals{"Djinnsix"}){
    quest::ze(15, "You feel the world around you begin to spin as you blackout.");
    quest::movepc(211,-1516.2,1977.1,1,65.4);
	quest::spawn2(211149,0,0,-1407.7,1970.2,1,193.1);
	quest::depop();
    }
	if(defined $qglobals{"Djinnseven"}){
    quest::ze(15, "You feel the world around you begin to spin as you blackout.");
    quest::movepc(211,-1516.2,1977.1,1,65.4);
	quest::spawn2(211149,0,0,-1407.7,1970.2,1,193.1);
	quest::depop();
    }
	if(defined $qglobals{"Djinneight"}){
    quest::ze(15, "You feel the world around you begin to spin as you blackout.");
    quest::movepc(211,-1516.2,1977.1,1,65.4);
	quest::spawn2(211149,0,0,-1407.7,1970.2,1,193.1);
	quest::depop();
   }
   if(defined $qglobals{"Djinnnine"}){
    quest::ze(15, "You feel the world around you begin to spin as you blackout.");
    quest::movepc(211,-1516.2,1977.1,1,65.4);
	quest::spawn2(211149,0,0,-1407.7,1970.2,1,193.1);
	quest::depop();
   }
  } 