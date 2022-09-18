##fire_trigger this is an invisible controller that triggers #fire_event.pl
# #fire_trigger (223173)

my $afwb1_spawned = 1;
my $afwb2_spawned = 1;
my $afed_spawned = 1;
my $ase_spawned = 1;
my $gwb_spawned = 1;

# This spawns fire grp + boss forphase 2
sub EVENT_SPAWN {
    # A_Ferocious_War_Boar (223143)
    quest::spawn2(223143,0,0,252.0,589.0,491.0,192.5);
    quest::spawn2(223143,0,0,252.0,579.0,491.0,192.5);
    # A_Smoldering_Elemental (223109)
    quest::spawn2(223109,0,0,232.0,579.0,491.6,192.5);
    quest::spawn2(223109,0,0,242.0,584.0,491.2,192.5);
    quest::spawn2(223109,0,0,242.0,574.0,491.5,192.5);
    # A_Fire_Etched_Doombringer (223137)
    quest::spawn2(223137,0,0,252.0,569.0,491.3,192.5);
    quest::spawn2(223137,0,0,232.0,569.0,491.9,192.5);
    quest::spawn2(223137,0,0,252.0,559.0,491.0,192.5);
    # A_Ferocious_War_Boar (223117)
    quest::spawn2(223117,0,0,242.0,564.0,491.6,192.5);
    # Boss Gutripping_War_Beast
    quest::spawn2(223146,0,0,262.0,574.0,491.0,192.5);
    #quest::ze(15, "Congdar spawned 3 A_Ferocious_War_Boar, 3 A_Smoldering_Elemental, 3 A_Fire_Etched_Doombringer, and Gutripping_War_Beast.");
    quest::settimer("phase2_fire_trigger_mobs", 10);
}

sub EVENT_TIMER {
    if($timer eq "phase2_fire_trigger_mobs") {
        # A_Ferocious_War_Boar (223143)
        my $afwb1 = $entity_list->GetMobByNpcTypeID(223143);
        # A_Ferocious_War_Boar (223117)
        my $afwb2 = $entity_list->GetMobByNpcTypeID(223117);
        # A_Fire_Etched_Doombringer (223137)
        my $afed = $entity_list->GetMobByNpcTypeID(223137);
        # A_Smoldering_Elemental (223109)
        my $ase = $entity_list->GetMobByNpcTypeID(223109);
        # Gutripping_War_Beast (223146)
        my $gwb = $entity_list->GetMobByNpcTypeID(223146);
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
        if($gwb) {
            $gwb_spawned = undef;
        }
        if($afwb1_spawned || $afwb2_spawned || $afed_spawned || $ase_spawned || $gwb_spawned) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase2_fire_trigger_mobs");
            quest::depop();
        }
    }
}

