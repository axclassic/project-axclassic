#This is an invisible controller which spawns the air phoneix
# #air_event (223187)

sub EVENT_SPAWN {
    # An_Air_Phoenix_Noble (223087)
	quest::spawn2(223087,0,0,67,1364,494.8,185.5);
	quest::spawn2(223087,0,0,67,1347,494.8,185.5);
	quest::spawn2(223087,0,0,62,1364,494.8,185.5);
	quest::spawn2(223087,0,0,62,1347,494.8,185.5);
    quest::settimer("phase1_air_mobs", 10);
    #quest::ze(15, "Congdar air_event spawned 4 An_Air_Phoenix_Noble.");
}

sub EVENT_TIMER {
    # An_Air_Phoenix_Noble (223087)
    my $aapn = $entity_list->GetMobByNpcTypeID(223087);
    # Servitor_of_Xegony (223995)
    my $sox = $entity_list->GetMobByNpcTypeID(223995);
    # Neimon_of_Air (223120)
    my $noa = $entity_list->GetMobByNpcTypeID(223120);

    if($timer eq "phase1_air_mobs") {
        if($aapn || $sox) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase1_air_mobs");
            # Neimon_of_Air (223120)
            quest::spawn2(223120,0,0,68,1355,494.8,185.5);
            # Servitor_of_Xegony (223995)
            quest::spawn2(223995,0,0,68+5,1365,494.8,185.5);
            quest::spawn2(223995,0,0,68-5,1375,494.8,185.5);
            quest::spawn2(223995,0,0,68,1345+5,494.8,185.5);
            quest::spawn2(223995,0,0,68,1335-5,494.8,185.5);
            quest::settimer("phase1_air_boss", 10);
        }
    }

    if($timer eq "phase1_air_boss") {
        if($sox || $noa) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase1_air_boss");
            # Time_Companion
            quest::spawn2(223228,0,0,75.4,1404.9,493.7,171.89);
            quest::depop();
        }
    }
}

