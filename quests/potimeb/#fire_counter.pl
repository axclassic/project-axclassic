#fire_counter.pl used as phase2 mobs instead!
# #fire_counter (223182)

my $phase2_fire_npccounter = 1;

sub EVENT_SPAWN { #This spawns 1st mob group for Phase 2
    $phase2_fire_npccounter = 1;
    #fire group
    # A_Ferocious_War_Boar (223143)
	quest::spawn2(223143,0,0,232.0,579.0,491.6,192.5);
	quest::spawn2(223143,0,0,252.0,559.0,491.0,192.5);
	quest::spawn2(223143,0,0,252.0,569.0,491.3,192.5);
    # A_Ferocious_War_Boar (223117)
    quest::spawn2(223117,0,0,252.0,579.0,491.0,192.5);
    quest::spawn2(223117,0,0,232.0,569.0,491.9,192.5);
    # A_Fire_Etched_Doombringer (223114)
    quest::spawn2(223114,0,0,242.0,564.0,491.6,192.5);
	quest::spawn2(223114,0,0,242.0,584.0,491.2,192.5);
	quest::spawn2(223114,0,0,252.0,589.0,491.0,192.5);
    #  A_Smoldering_Elemental (223124)
    quest::spawn2(223124,0,0,242.0,574.0,491.5,192.5);
    quest::ze(15, "Congdar fire_counter spawned 5 A_Ferocious_War_Boar, 3 A_Fire_Etched_Doombringer, and A_Smoldering_Elemental.");
}

sub EVENT_SIGNAL {
    #like fire_event.pl starts a counter for when all are dead, spawns the next group!
	if($signal == 14068) {
        quest::ze(15, "Congdar fire_counter received signal phase2_fire_npccounter $phase2_fire_npccounter of 8.");
        #This signal are from these mobs upon death!
		$phase2_fire_npccounter = $phase2_fire_npccounter + 1;
        if($phase2_fire_npccounter == 9) {
            quest::ze(15, "Congdar fire_counter phase2_fire_npccounter 9 of 9 so signal phase2_trigger, bye.");
            quest::signalwith(223191, 14034, 2000);
            $phase2_fire_npccounter = 11;
            quest::depop();
        }
	}	
}

