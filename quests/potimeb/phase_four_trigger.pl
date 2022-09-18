# phase_four_trigger (223157)


sub EVENT_SPAWN {
    #flavor
    quest::signalwith(223111, 1003, 2000);
    #Terris Thule
    quest::spawn2(223075,0,0,-310,307,365,95);
    #Saryrn
    quest::spawn2(223076,0,0,-320,-316,358,32.5);
    #Tallon Zek
    quest::spawn2(223077,0,0,405,-84,358,192);
    #Vallon Zek
    quest::spawn2(223078,0,0,405,75,358,192);
    quest::settimer("phase4_trigger_mobs", 5);
}    

sub EVENT_TIMER {
    if($timer eq "phase4_trigger_mobs") {
        # Terris_Thule (223075)
        my $tt = $entity_list->GetMobByNpcTypeID(223075);
        # Saryrn (223076)
        my $s = $entity_list->GetMobByNpcTypeID(223076);
        # Tallon_Zek (223077)
        my $tz = $entity_list->GetMobByNpcTypeID(223077);
        # Vallon_Zek (223078)
        my $vz = $entity_list->GetMobByNpcTypeID(223078);
        if($tt || $s || $tz || $vz) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase4_trigger_mobs");
            quest::ze(15, "You are halfway through this phase. Click on the fountain to continue.");
            #sets flag to portal through fountain
            quest::setglobal("portal4", "1", 7, "H1");
            quest::depop();
        }
    }
}

