##earth_trigger this is an invisible controller for phase 2 last mob+boss encounter
# npcid - 223169

sub EVENT_SPAWN { #This spawns 2nd grp + boss for phase 2
    quest::spawn2(223110,0,0,252.0,1659.0,491.0,192.5);
	quest::spawn2(233125,0,0,242.0,1654.0,491.6,192.5); #Doesnt spawn for some reason
	quest::spawn2(223102,0,0,232.0,1649.0,491.9,192.5);
	quest::spawn2(223125,0,0,252.0,1649.0,491.3,192.5);
	quest::spawn2(223125,0,0,242.0,1644.0,491.5,192.5);
	quest::spawn2(223125,0,0,232.0,1639.0,491.6,192.5);
	quest::spawn2(223133,0,0,252.0,1639.0,491.0,192.5);
	quest::spawn2(223133,0,0,242.0,1634.0,491.2,192.5);
	quest::spawn2(223102,0,0,252.0,1629.0,491.0,192.5);
	quest::spawn2(223134,0,0,262.0,1644.0,491.0,192.5); # Boss Earthen_overseer
}

sub EVENT_SIGNAL { #like earth_counter.pl starts a counter for when all are dead, then opens inner doors!
	if ($signal == 14035) { #This signal are from these mobs upon death!
		$enpccounter+= 1;
		$earthc = $enpccounter;
		#quest::ze(15, "okay i signaled and my counter is now $earthc.");
	}	
	if ($enpccounter == 9) { # phase_trigger script npcid - 223191
		quest::signalwith(223191, 14035, 0);
		$enpccounter = 0;
		quest::depop();
	}
	
}

sub EVENT_ENTER {
   # quest::settimer("earth", 1); #1 sec after first player enters event starts
   # quest::clear_proximity();
}

sub EVENT_TIMER {
	# if ($timer eq "earth") {
		# quest::spawn2(223186,0,0,-129.6,1720,547,0); #spawn event script
		# quest::signalwith(223211,23,0); #send signal to start_trial signal 23 trigger to start hour time limit
		# quest::stoptimer("earth");
		# quest::depop();
	# }
}
