# This is an invisible controller which spawns the water mobs
# #water_event (223189)

#my $phase1_water_npcevent = 1;

sub EVENT_SPAWN {
    #$phase1_water_npcevent = 1;
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

#sub EVENT_SIGNAL {
#    if($signal == 14039) {
        #quest::ze(15, "Congdar water_event signaled phase1_water_npcevent is $phase1_water_npcevent out of 8.");
#        $phase1_water_npcevent = $phase1_water_npcevent + 1;
#        if($phase1_water_npcevent == 9) {
            #quest::ze(15, "Congdar phase1_water_npcevent 9 of 9 so spawn Anar_of_Wate and a_regrua_defender.");
            #Anar_of_Water
#            quest::spawn2(223104,0,0,68,867,495,185.5);
#            quest::spawn2(223192,0,0,68,887,495,185.5);
#            $phase1_water_npcevent = 11;
#        }
#    }
#    if($signal == 14038) {
        # Time_Companion
#        quest::spawn2(223228,0,0,74.19,908.29,493.39,172.8);
        #if anar-of-water dies this triggers the counter
        #tell main about event success
        #quest::ze(15, "Congdar water_event Anar_of_Water died signalling phase_trigger, bye.");
#        quest::signalwith(223177, 14060, 2000);
#        quest::depop();
#    }
#}

