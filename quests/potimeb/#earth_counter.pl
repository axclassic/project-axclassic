#earth_counter.pl used as phase2 mobs instead!
#npcid - 223178

sub EVENT_SPAWN { #This spawns 1st mob group for Phase 2
   #Earth
	quest::spawn2(223125,0,0,252.0,1659.0,491.0,192.5);
	quest::spawn2(223110,0,0,242.0,1654.0,491.6,192.5);
	quest::spawn2(223125,0,0,232.0,1649.0,491.9,192.5);
	quest::spawn2(223102,0,0,242.0,1644.0,491.5,192.5);
	quest::spawn2(223133,0,0,252.0,1649.0,491.3,192.5);
	quest::spawn2(223125,0,0,252.0,1639.0,491.0,192.5);
	#quest::spawn2(233133,0,0,232.0,1639.0,491.6,192.5); #This is the problem! try 133
	quest::spawn2(223110,0,0,242.0,1634.0,491.2,192.5);
	quest::spawn2(223125,0,0,252.0,1629.0,491.0,192.5);
}
sub EVENT_SIGNAL { #like earth_event.pl starts a counter for when all are dead, spawns the next group!
	if ($signal == 14028) { #This signal are from these mobs upon death!
		$enpccounter+= 1;
		$earthc = $enpccounter;
		#quest::ze(15, "okay i signaled and my counter is now $earthc.");
	}	
	if ($enpccounter == 8) { # phase_trigger script npcid - 223191
		quest::signalwith(223191, 14028, 0);
		$enpccounter = 0;
		quest::depop();
	}
	
}


sub EVENT_ENTER {
      # $ecounter += 1;
   }

sub EVENT_EXIT {
   # $ecounter -= 1;
} 


