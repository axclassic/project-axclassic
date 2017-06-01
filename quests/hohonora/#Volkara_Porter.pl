##Volkara_Porter 211161## 
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
	if(defined $qglobals{"Djinnfive"}) {
    quest::ze(15, "You the feel the ground begin to tremble as you are pulled underneath the temple.");
    quest::movepc(211,-2062,-524.5,1);
	quest::spawn2(211162,0,0,-2528,-91.7,1,113.9);
	quest::signalwith(211151,255,0);
	quest::depop();
	}
	if(defined $qglobals{"Djinnsix"}) {
    quest::ze(15, "You the feel the ground begin to tremble as you are pulled underneath the temple.");
    quest::movepc(211,-2062,-524.5,1);
	quest::spawn2(211162,0,0,-2528,-91.7,1,113.9);
	quest::signalwith(211151,255,0);
	quest::depop();
	}
	if(defined $qglobals{"Djinnseven"}) {
    quest::ze(15, "You the feel the ground begin to tremble as you are pulled underneath the temple.");
    quest::movepc(211,-2062,-524.5,1);
	quest::spawn2(211162,0,0,-2528,-91.7,1,113.9);
	quest::signalwith(211151,255,0);
	quest::depop();
	}
	if(defined $qglobals{"Djinneight"}) {
    quest::ze(15, "You the feel the ground begin to tremble as you are pulled underneath the temple.");
    quest::movepc(211,-2062,-524.5,1);
	quest::spawn2(211162,0,0,-2528,-91.7,1,113.9);
	quest::signalwith(211151,255,0);
	quest::depop();
	}
    if(defined $qglobals{"Djinnnine"}) {
    quest::ze(15, "You the feel the ground begin to tremble as you are pulled underneath the temple.");
    quest::movepc(211,-2062,-524.5,1);
	quest::spawn2(211162,0,0,-2528,-91.7,1,113.9);
	quest::signalwith(211151,255,0);
	quest::depop();
	}
   }