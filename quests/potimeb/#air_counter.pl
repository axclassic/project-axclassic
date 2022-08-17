#air_counter.pl used as phase2 mobs instead!
#npcid - 223179

my $anpccounter = 0;
my $airc = 0;

sub EVENT_SPAWN { #This spawns 1st mob group for Phase 2
    $anpccounter = 0;
    $airc = 0;

   #air group
	quest::spawn2(223226,0,0,232.0,1359.0,491.9,192.5); # #air_phoenix instead of air_phoenix
	quest::spawn2(223216,0,0,232.0,1349.0,491.9,192.5);
	quest::spawn2(223226,0,0,242.0,1364.0,491.3,192.5);
	quest::spawn2(223226,0,0,252.0,1369.0,491.0,192.5);
	quest::spawn2(223216,0,0,252.0,1359.0,491.1,192.5);
	quest::spawn2(223216,0,0,242.0,1354.0,491.7,192.5);
	quest::spawn2(223226,0,0,252.0,1349.0,491.3,192.5);
	quest::spawn2(223216,0,0,242.0,1344.0,491.4,192.5);
	quest::spawn2(223216,0,0,252.0,1339.0,491.0,192.5);
}

sub EVENT_SIGNAL { #like air_event.pl starts a counter for when all are dead, spawns the next group!
	if($signal == 14038) { #This signal are from these mobs upon death!
		$anpccounter = $anpccounter + 1;
		$airc = $anpccounter;
		#quest::ze(15, "okay i signaled and my counter is now $airc.");
	}	
	if($anpccounter >= 9) { # phase_trigger script npcid - 223191
		quest::signalwith(223191, 14034, 4000);
		$anpccounter = 0;
		quest::depop();
	}
}

#sub EVENT_ENTER {
   # $acounter += 1;
#}

#sub EVENT_EXIT {
   # $acounter -= 1;
#}


