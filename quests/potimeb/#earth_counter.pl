#earth_counter.pl used as phase2 mobs instead!
# #earth_counter (223178)

my $phase2_earth_npccounter = 1;

sub EVENT_SPAWN {
    #This spawns 1st mob group for Phase 2
    $phase2_earth_npccounter = 1;
    #Earth
    # An_Unholy_Rock_Fiend (223125)
	quest::spawn2(223125,0,0,252.0+5,1659.0-5,491.0,192.5);
	quest::spawn2(223125,0,0,232.0-5,1649.0+5,491.9,192.5);
    quest::spawn2(223125,0,0,252.0+8,1639.0-8,491.0,192.5);
    quest::spawn2(223125,0,0,252.0-8,1629.0+8,491.0,192.5);
    # An_Elemental_Stonefist (223133)
	quest::spawn2(223133,0,0,252.0+11,1649.0-11,491.3,192.5);
	quest::spawn2(223133,0,0,232.0-11,1639.0+11,491.6,192.5);
    # #An_Unholy_Rock_Fiend (223110)
    quest::spawn2(223110,0,0,242.0+5,1654.0,491.6,192.5);
	quest::spawn2(223110,0,0,242.0,1634.0-5,491.2,192.5);
    # An_Elemental_Stonefist (223102)
    quest::spawn2(223102,0,0,242.0+8,1644.0,491.5,192.5);
    #quest::ze(15, "Congdar earth_counter spawned 6 An_Unholy_Rock_Fiend, 3 An_Elemental_Stonefist.");
}

sub EVENT_SIGNAL {
    #like earth_event.pl starts a counter for when all are dead, spawns the next group!
	if($signal == 14028) {
        #quest::ze(15, "Congdar earth_counter received signal phase2_earth_npccounter $phase2_earth_npccounter of 9.");
        #This signal are from these mobs upon death!
		$phase2_earth_npccounter = $phase2_earth_npccounter + 1;
		#quest::ze(15, "okay i signaled and my counter is now $earthc.");
        if($phase2_earth_npccounter == 9) {
            #quest::ze(15, "Congdar earth_counter phase2_earth_npccounter 9 of 9 so signal phase2_trigger, bye.");
            # phase_trigger script npcid - 223191
            quest::signalwith(223191, 14034, 2000);
            $phase2_earth_npccounter = 111;
            quest::depop();
        }
	}	
}

