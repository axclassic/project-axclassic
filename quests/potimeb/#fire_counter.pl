#fire_counter.pl used as phase2 mobs instead!
# #fire_counter (223182)

my $afwb1_spawned = 1;
my $afwb2_spawned = 1;
my $afed_spawned = 1;
my $ase_spawned = 1;

sub EVENT_SPAWN {
    #This spawns 1st mob group for Phase 2
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
    #quest::ze(15, "Congdar fire_counter spawned 5 A_Ferocious_War_Boar, 3 A_Fire_Etched_Doombringer, and A_Smoldering_Elemental.");
    quest::settimer("phase2_fire_counter_mobs", 10);
}

sub EVENT_TIMER {
    if($timer eq "phase2_fire_counter_mobs") {
        # A_Ferocious_War_Boar (223143)
        my $afwb1 = $entity_list->GetMobByNpcTypeID(223143);
        # A_Ferocious_War_Boar (223117)
        my $afwb2 = $entity_list->GetMobByNpcTypeID(223117);
        # A_Fire_Etched_Doombringer (223114)
        my $afed = $entity_list->GetMobByNpcTypeID(223114);
        #  A_Smoldering_Elemental (223124)
        my $ase = $entity_list->GetMobByNpcTypeID(223124);
        if($afwb1) {
            $afwb1_spawned = undef;
        }
        if($afwb2) {
            $afwb2_spawned = undef;
        }
        if($afed) {
            $afed_spawned = undef;
        }
        if($ase) {
            $ase_spawned = undef;
        }
        if($afwb1_spawned || $afwb2_spawned || $afed_spawned || $ase_spawned) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase2_fire_counter_mobs");
            # #fire_trigger (223173)
            quest::spawn2(223173,0,0,-129.6,1720,547,0);
            quest::depop();
        }
    }
}

