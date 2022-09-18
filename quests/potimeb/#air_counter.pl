#air_counter.pl used as phase2 mobs instead!
# #air_counter (223179)

my $aapn_spawned = 1;
my $sox_spawned = 1;

#This spawns 1st mob group for Phase 2
sub EVENT_SPAWN {
    #air group
    # #An_Air_Phoenix_Noble (223226)
	quest::spawn2(223226,0,0,232.0,1359.0,491.9,192.5);
	quest::spawn2(223226,0,0,242.0,1364.0,491.3,192.5);
	quest::spawn2(223226,0,0,252.0,1369.0,491.0,192.5);
    quest::spawn2(223226,0,0,252.0,1349.0,491.3,192.5);
    # Servitor_of_Xegony (223216)
	quest::spawn2(223216,0,0,252.0,1359.0,491.1,192.5);
	quest::spawn2(223216,0,0,242.0,1354.0,491.7,192.5);
    quest::spawn2(223216,0,0,232.0,1349.0,491.9,192.5);
	quest::spawn2(223216,0,0,242.0,1344.0,491.4,192.5);
	quest::spawn2(223216,0,0,252.0,1339.0,491.0,192.5);
    #quest::ze(15, "Congdar air_counter spawned 4 An_Air_Phoenix_Noble, 5 Servitor_of_Xegony.");
    quest::settimer("phase2_air_counter_mobs1", 10);
}

sub EVENT_TIMER {
    if($timer eq "phase2_air_counter_mobs1") {
        # #An_Air_Phoenix_Noble (223226)
        my $aapn = $entity_list->GetMobByNpcTypeID(223226);
        # Servitor_of_Xegony (223216)
        my $sox = $entity_list->GetMobByNpcTypeID(223216);
        if($aapn) {
            $aapn_spawned = undef;
        }
        if($sox) {
            $sox_spawned = undef;
        }
        if($aapn_spawned || $sox_spawned) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase2_air_counter_mobs1");
            quest::settimer("phase2_air_counter_mobs2", 10);
        }
        $aapn = undef;
        $sox = undef;
    }
    if($timer eq "phase2_air_counter_mobs2") {
        # #An_Air_Phoenix_Noble (223226)
        my $aapn = $entity_list->GetMobByNpcTypeID(223226);
        # Servitor_of_Xegony (223216)
        my $sox = $entity_list->GetMobByNpcTypeID(223216);
        if($aapn || $sox) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase2_air_counter_mobs2");
            # #air_trigger (223170)
            quest::spawn2(223170,0,0,-129.6,1720,547,0);
            quest::depop();
        }
        $aapn = undef;
        $sox = undef;
    }
}

