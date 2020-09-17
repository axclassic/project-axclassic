#water_counter.pl used as phase2 mobs instead!
#npcid - 223181

sub EVENT_SPAWN { #This spawns 1st mob group for Phase 2
    #water group
	quest::spawn2(223148,0,0,252.0,884.0,491.0,192.5);
	quest::spawn2(223148,0,0,242.0,879.0,491.3,192.5);
	quest::spawn2(223099,0,0,232.0,874.0,491.7,192.5);
	quest::spawn2(223141,0,0,252.0,874.0,491.1,192.5);
	quest::spawn2(223126,0,0,242.0,869.0,491.6,192.5);
	quest::spawn2(223123,0,0,232.0,864.0,492.0,192.5); #This is the missing one
	quest::spawn2(223123,0,0,242.0,859.0,491.5,192.5);
	quest::spawn2(223148,0,0,252.0,864.0,491.3,192.5);
	quest::spawn2(223153,0,0,252.0,854.0,491.0,192.5);
}

sub EVENT_SIGNAL { #like water_event.pl starts a counter for when all are dead, spawns the next group!
	if($signal == 14058) { #This signal are from these mobs upon death!
		$wnpccounter+= 1;
		$waterc = $wnpccounter;
		#quest::ze(15, "okay i signaled and my counter is now $waterc.");
	}	

    if($wnpccounter == 9) { # phase_trigger script npcid - 223191
		quest::signalwith(223191, 14034, 0);
		$wnpccounter = 0;
		quest::depop();
	}
}

