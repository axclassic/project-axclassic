# This is an invisible controller which spawns the water mobs
# #water_event (223189)

sub EVENT_SPAWN {
    #quest::ze(15, "Congdar water_event pawning 3 a_regrua_defender"); 
    # a_regrua_defender (223192)
    quest::spawn2(223192,0,0,68,867,495,185.5);
    quest::spawn2(223192,0,0,68,877,495,185.5);
    quest::spawn2(223192,0,0,68,857,495,185.5);
    quest::settimer("phase1_water_mobs", 10);
}

sub EVENT_TIMER {
    # a_regrua_defender (223192)
    my $ard = $entity_list->GetMobByNpcTypeID(223192);
    # a_deepwater_triloun (223115)
    my $adt = $entity_list->GetMobByNpcTypeID(223115);
    # Anar_of_Water (223104)
    my $aow = $entity_list->GetMobByNpcTypeID(223104);

    if($timer eq "phase1_water_mobs") {
        if($ard || $adt) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase1_water_mobs");
            # Anar_of_Water (223104)
            quest::spawn2(223104,0,0,68,867,495,185.5);
            # a_regrua_defender (223192)
            quest::spawn2(223115,0,0,68+5,887,495,185.5);
            quest::spawn2(223115,0,0,68-5,887,495,185.5);
            quest::spawn2(223115,0,0,68,887,495+5,185.5);
            quest::spawn2(223115,0,0,68,887,495-5,185.5);
            quest::settimer("phase1_water_boss", 10);
        }
    }

    if($timer eq "phase1_water_boss") {
        if($adt || $aow) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase1_water_boss");
            # Time_Companion
            quest::spawn2(223228,0,0,74.19,908.29,493.39,172.8);
            quest::depop();
        }
    }
}

