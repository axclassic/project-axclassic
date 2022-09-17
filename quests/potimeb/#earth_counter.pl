#earth_counter.pl used as phase2 mobs instead!
# #earth_counter (223178)

#my $phase2_earth_npccounter = 1;
my $aurf1_spawned = 1;
my $aurf2_spawned = 1;
my $aes1_spawned = 1;
my $aes2_spawned = 1;

sub EVENT_SPAWN {
    #This spawns 1st mob group for Phase 2
    #$phase2_earth_npccounter = 1;
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
    quest::settimer("phase2_earth_counter_mobs1", 10);
}

sub EVENT_TIMER {
    if($timer eq "phase2_earth_counter_mobs1") {
        # An_Unholy_Rock_Fiend (223125)
        my $aurf1 = $entity_list->GetMobByNpcTypeID(223125);
        # #An_Unholy_Rock_Fiend (223110)
        my $aurf2 = $entity_list->GetMobByNpcTypeID(223110);
        # An_Elemental_Stonefist (223133)
        my $aes1 = $entity_list->GetMobByNpcTypeID(223133);
        # An_Elemental_Stonefist (223102)
        my $aes2 = $entity_list->GetMobByNpcTypeID(223102);
        if($aurf1) {
            $aurf1_spawned = undef;
        }
        if($aurf2) {
            $aurf2_spawned = undef;
        }
        if($aes1) {
            $aes1_spawned = undef;
        }
        if($aes2) {
            $aes2_spawned = undef;
        }
        if($aurf1_spawned || $aurf2_spawned || $aes1_spawned || $aes2_spawned) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase2_earth_counter_mobs1");
            quest::settimer("phase2_earth_counter_mobs2", 10);
        }
        $aurf1 = undef;
        $aurf2 = undef;
        $aes1 = undef;
        $aes2 = undef;
    }
    if($timer eq "phase2_earth_counter_mobs2") {
        # An_Unholy_Rock_Fiend (223125)
        my $aurf1 = $entity_list->GetMobByNpcTypeID(223125);
        # #An_Unholy_Rock_Fiend (223110)
        my $aurf2 = $entity_list->GetMobByNpcTypeID(223110);
        # An_Elemental_Stonefist (223133)
        my $aes1 = $entity_list->GetMobByNpcTypeID(223133);
        # An_Elemental_Stonefist (223102)
        my $aes2 = $entity_list->GetMobByNpcTypeID(223102);
        if($aurf1 || $aurf2 || $aes1 || $aes2) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase2_earth_counter_mobs2");
            # #earth_trigger (223169)
            quest::spawn2(223169,0,0,-129.6,1720,547,0);
            quest::depop();
        }
        $aurf1 = undef;
        $aurf2 = undef;
        $aes1 = undef;
        $aes2 = undef;
    }
}

#sub EVENT_SIGNAL {
    #like earth_event.pl starts a counter for when all are dead, spawns the next group!
	#if($signal == 14028) {
        #quest::ze(15, "Congdar earth_counter received signal phase2_earth_npccounter $phase2_earth_npccounter of 9.");
        #This signal are from these mobs upon death!
		#$phase2_earth_npccounter = $phase2_earth_npccounter + 1;
		#quest::ze(15, "okay i signaled and my counter is now $earthc.");
        #if($phase2_earth_npccounter == 9) {
            #quest::ze(15, "Congdar earth_counter phase2_earth_npccounter 9 of 9 so signal phase2_trigger, bye.");
            # phase_trigger script npcid - 223191
            #quest::signalwith(223191, 14034, 2000);
            #$phase2_earth_npccounter = 111;
            #quest::depop();
        #}
	#}	
#}

