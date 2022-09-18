##air_trigger this is an invisible controller that triggers #air_event.pl
# #air_trigger (223170)

my $aapn_spawned = 1;
my $sox_spawned = 1;
my $wwoa_spawned = 1;

#This spawns air grp + boss for phase 2
sub EVENT_SPAWN {
    # #An_Air_Phoenix_Noble (223226)
    quest::spawn2(223226,0,0,242.0,1364.0,491.3,192.5);
    quest::spawn2(223226,0,0,252.0,1359.0,491.1,192.5);
    quest::spawn2(223226,0,0,232.0,1359.0,491.9,192.5);
    quest::spawn2(223226,0,0,242.0,1354.0,491.7,192.5);
    quest::spawn2(223226,0,0,242.0,1344.0,491.4,192.5);
    # Servitor_of_Xegony (223216)
    quest::spawn2(223216,0,0,252.0,1369.0,491.0,192.5);
    quest::spawn2(223216,0,0,232.0,1349.0,491.9,192.5);
    quest::spawn2(223216,0,0,252.0,1339.0,491.0,192.5);
    quest::spawn2(223216,0,0,252.0,1349.0,491.3,192.5);
    #Boss Windshapen_Warlord_of_Air
    quest::spawn2(223118,0,0,262.0,1354.0,491.0,192.5);
    #quest::ze(15, "Congdar spawned 5 An_Air_Phoenix_Noble, 4 Servitor_of_Xegony, and Windshapen_Warlord_of_Air.");
    quest::settimer("phase2_air_trigger_mobs1", 10);
}

sub EVENT_TIMER {
    if($timer eq "phase2_air_trigger_mobs1") {
        # #An_Air_Phoenix_Noble (223226)
        my $aapn = $entity_list->GetMobByNpcTypeID(223226);
        # Servitor_of_Xegony (223216)
        my $sox = $entity_list->GetMobByNpcTypeID(223216);
        # Windshapen_Warlord_of_Air (223118)
        my $wwoa = $entity_list->GetMobByNpcTypeID(223118);
        if($aapn) {
            $aapn_spawned = undef;
        }
        if($sox) {
            $sox_spawned = undef;
        }
        if($wwoa) {
            $wwoa_spawned = undef;
        }
        if($aapn_spawned || $sox_spawned || $wwoa_spawned) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase2_air_trigger_mobs1");
            quest::depop();
        }
        $aapn = undef;
        $sox = undef;
        $wwoa = undef;
    }
}

