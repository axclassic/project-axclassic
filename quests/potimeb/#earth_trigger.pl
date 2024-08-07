##earth_trigger this is an invisible controller for phase 2 last mob+boss encounter
# #earth_trigger (223169)

my $aurf1_spawned = 1;
my $aurf2_spawned = 1;
my $aes1_spawned = 1;
my $aes2_spawned = 1;
my $eo_spawned = 1;

#This spawns 2nd grp + boss forphase 2
sub EVENT_SPAWN {
    # An_Unholy_Rock_Fiend (223125)
    quest::spawn2(223125,0,0,242.0,1654.0,491.6,192.5);
    quest::spawn2(223125,0,0,252.0,1649.0,491.3,192.5);
    quest::spawn2(223125,0,0,242.0,1644.0,491.5,192.5);
    quest::spawn2(223125,0,0,232.0,1639.0,491.6,192.5);
    # An_Elemental_Stonefist (223133)
    quest::spawn2(223133,0,0,252.0,1639.0,491.0,192.5);
    quest::spawn2(223133,0,0,242.0,1634.0,491.2,192.5);
    # #An_Unholy_Rock_Fiend (223110)
    quest::spawn2(223110,0,0,252.0,1659.0,491.0,192.5);
    # An_Elemental_Stonefist (223102)
    quest::spawn2(223102,0,0,232.0,1649.0,491.9,192.5);
    quest::spawn2(223102,0,0,252.0,1629.0,491.0,192.5);
    #Boss Earthen_Overseer (223134)
    quest::spawn2(223134,0,0,262.0,1644.0,491.0,192.5);
    #quest::ze(15, "Congdar spawned 5 An_Unholy_Rock_Fiend, 4 An_Elemental_Stonefist, and Earthen_Overseer.");
    quest::settimer("phase2_earth_trigger_mobs1", 10);
}

sub EVENT_TIMER {
    if($timer eq "phase2_earth_trigger_mobs1") {
        # An_Unholy_Rock_Fiend (223125)
        my $aurf1 = $entity_list->GetMobByNpcTypeID(223125);
        # #An_Unholy_Rock_Fiend (223110)
        my $aurf2 = $entity_list->GetMobByNpcTypeID(223110);
        # An_Elemental_Stonefist (223133)
        my $aes1 = $entity_list->GetMobByNpcTypeID(223133);
        # An_Elemental_Stonefist (223102)
        my $aes2 = $entity_list->GetMobByNpcTypeID(223102);
        # Earthen_Overseer (223134)
        my $eo = $entity_list->GetMobByNpcTypeID(223134);
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
        if($eo) {
            $eo_spawned = undef;
        }
        if($aurf1_spawned || $aurf2_spawned || $aes1_spawned || $aes2_spawned || $eo_spawned) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase2_earth_trigger_mobs1");
            quest::depop();
        }
        $aurf1 = undef;
        $aurf2 = undef;
        $aes1 = undef;
        $aes2 = undef;
        $eo = undef;
    }
}

