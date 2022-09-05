#undead_counter.pl used as phase2 mobs instead!
# #undead_counter (223180)

my $phase2_undead_npccounter = 1;

sub EVENT_SPAWN {
    #This spawns 1st mob group for Phase 2
    $phase2_undead_npccounter = 1;
	#undead group
    # an_undead_guardian_ (223107)
	quest::spawn2(223107,0,0,242.0,1119.0,491.3,192.5);
	quest::spawn2(223107,0,0,232.0,1114.0,491.2,192.5);
	quest::spawn2(223107,0,0,252.0,1114.0,491.8,192.5);
	quest::spawn2(223107,0,0,242.0,1109.0,491.5,192.5);
    # an_undead_guardian_ (223138)
    quest::spawn2(223138,0,0,252.0,1124.0,491.4,192.5);
	quest::spawn2(223138,0,0,252.0,1104.0,491.7,192.5);
	quest::spawn2(223138,0,0,232.0,1104.0,491.1,192.5);
	quest::spawn2(223138,0,0,242.0,1099.0,491.2,192.5);
	quest::spawn2(223138,0,0,252.0,1094.0,491.4,192.5);
    #quest::ze(15, "Congdar undead_counter spawned 9 an_undead_guardian_.");
}

sub EVENT_SIGNAL {
    #like air_event.pl starts a counter for when all are dead, spawns the next group!
	if($signal == 14048) {
        #quest::ze(15, "Congdar undead_counter received signal phase2_undead_npccounter $phase2_undead_npccounter of 8.");
        #This signal are from these mobs upon death!
		$phase2_undead_npccounter = $phase2_undead_npccounter + 1;
        if($phase2_undead_npccounter == 9) {
            #quest::ze(15, "Congdar undead_counter phase2_undead_npccounter 9 of 9 so signal phase2_trigger, bye.");
            # phase_trigger script npcid - 223191
            quest::signalwith(223191, 14034, 2000);
            $phase2_undead_npccounter = 11;
            quest::depop();
        }
	}	
}

