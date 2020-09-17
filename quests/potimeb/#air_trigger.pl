##air_trigger this is an invisible controller that triggers #air_event.pl
# npcid - 223170

sub EVENT_SPAWN { #This spawns air grp + boss for phase 2
	quest::spawn2(223216,0,0,252.0,1369.0,491.0,192.5);
	quest::spawn2(223226,0,0,242.0,1364.0,491.3,192.5);
	quest::spawn2(223226,0,0,232.0,1359.0,491.9,192.5);
	quest::spawn2(223226,0,0,242.0,1354.0,491.7,192.5);
	quest::spawn2(223216,0,0,232.0,1349.0,491.9,192.5);
	quest::spawn2(223226,0,0,242.0,1344.0,491.4,192.5);
	quest::spawn2(223216,0,0,252.0,1339.0,491.0,192.5);
	quest::spawn2(223216,0,0,252.0,1349.0,491.3,192.5);
	quest::spawn2(223226,0,0,252.0,1359.0,491.1,192.5);
	quest::spawn2(223118,0,0,262.0,1354.0,491.0,192.5); #Boss Windshapen_Warlord_of_Air
}

sub EVENT_SIGNAL { #like air_counter.pl starts a counter for when all are dead, then opens inner doors!
	if($signal == 14035) { #This signal are from these mobs upon death!
		$anpccounter+= 1;
		$airc = $anpccounter;
		#quest::ze(15, "okay i signaled and my counter is now $airc.");
	}	
	if($anpccounter == 10) { # phase_trigger script npcid - 223191
		quest::signalwith(223191, 14035, 0);
		$anpccounter = 0;
		quest::depop();
	}
}

#sub EVENT_ENTER { #looks like we need a timer here or else zone crashes.
   # quest::settimer("air",1); #1 second after first player enters event starts
   # quest::clear_proximity();
#}

#sub EVENT_TIMER {
	# if ($timer eq "air") {
		# quest::spawn2(223187,0,0,-129.6,1720,547,0); #spawn event script
		# quest::signalwith(223211,23,0); #send signal to main trigger to start hour time limit
		# quest::stoptimer("air");
		# quest::depop();
	# }
#}

