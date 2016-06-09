#undead_counter.pl used as phase2 mobs instead!
#npcid - 223180

sub EVENT_SPAWN { #This spawns 1st mob group for Phase 2
	#undead group
	quest::spawn2(223138,0,0,252.0,1124.0,491.4,192.5); #223138.pl is an_undead_guardian_
	quest::spawn2(223107,0,0,242.0,1119.0,491.3,192.5);
	quest::spawn2(223107,0,0,232.0,1114.0,491.2,192.5);
	quest::spawn2(223107,0,0,252.0,1114.0,491.8,192.5);
	quest::spawn2(223107,0,0,242.0,1109.0,491.5,192.5);
	quest::spawn2(223138,0,0,252.0,1104.0,491.7,192.5);
	quest::spawn2(223138,0,0,232.0,1104.0,491.1,192.5);
	quest::spawn2(223138,0,0,242.0,1099.0,491.2,192.5);
	quest::spawn2(223138,0,0,252.0,1094.0,491.4,192.5);
}

sub EVENT_SIGNAL { #like air_event.pl starts a counter for when all are dead, spawns the next group!
	if ($signal == 14048) { #This signal are from these mobs upon death!
		$unpccounter+= 1;
		$undeadc = $unpccounter;
		#quest::ze(15, "okay i signaled and my counter is now $undeadc.");
	}	
	if ($unpccounter == 9) { # phase_trigger script npcid - 223191
		quest::signalwith(223191, 14034, 0);
		$unpccounter = 0;
		quest::depop();
	}
	
}


sub EVENT_ENTER {
   # $ucounter += 1;
}

sub EVENT_EXIT {
   # $ucounter -= 1;
} 
