#This is an invisible controller which spawns the earth rubbles.
# #earth_event (223186)

#my $phase1_earth_npcevent = 1;

sub EVENT_SPAWN {
#    $phase1_earth_npcevent = 1;
    # a_pile_of_living_rubble
    quest::spawn2(223106,0,0,70.3,1644.5,493.7,185.5);
    quest::spawn2(223106,0,0,70.3,1654.5,493.7,185.5);
    quest::spawn2(223106,0,0,70.3,1634.5,493.7,185.5);
    quest::settimer("phase1_earth_event_mobs", 10);
    #quest::ze(15, "Congdar earth_event spawned 3 a_pile_of_living_rubble.");
}  

sub EVENT_TIMER {
    # a_pile_of_living_rubble (223106)
    my $apolr = $entity_list->GetMobByNpcTypeID(223106);
    # a_rock_shaped_assassin (223147)
    my $arsa = $entity_list->GetMobByNpcTypeID(223147);
    # Terlok_of_Earth (223119)
    my $toe = $entity_list->GetMobByNpcTypeID(223119);

    if($timer eq "phase1_earth_event_mobs") {
        if($apolr || $arsa) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase1_earth_event_mobs");
            # Terlok_of_Earth (223119)
            quest::spawn2(223119,0,0,70.3,1644.5,493.7,185.5);
            # a_rock_shaped_assassin (223147)
            quest::spawn2(223147,0,0,70.3+5,1644.5,493.7,185.5);
            quest::spawn2(223147,0,0,70.3-5,1644.5,493.7,185.5);
            quest::spawn2(223147,0,0,70.3,1644.5+5,493.7,185.5);
            quest::spawn2(223147,0,0,70.3,1644.5-5,493.7,185.5);
            quest::settimer("phase1_earth_event_boss", 10);
        }
    }

    if($timer eq "phase1_earth_event_boss") {
        if($toe || $arsa) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase1_earth_event_boss");
            # Time_Companion
            quest::spawn2(223228,0,0,74.4,1688.59,493.89,169.89);
            quest::depop();
        }
    }
}

#sub EVENT_SIGNAL {
#	if($signal == 14018) {
        #quest::ze(15, "Congdar earth_event received signal $phase1_earth_npcevent of 8.");
#		$phase1_earth_npcevent = $phase1_earth_npcevent + 1;
#        if($phase1_earth_npcevent == 9 ) {
            #quest::ze(15, "Congdar phase1_earth_npcevent 9 of 9 so spawn Terlok_of_Earth.");
            #Terlok_of_Earth
#            quest::spawn2(223119,0,0,70.3,1644.5,493.7,185.5);
#            $phase1_earth_npcevent = 11;
#        }
#	}
#	if($signal == 14010) {
        # Time_Companion
#        quest::spawn2(223228,0,0,74.4,1688.59,493.89,169.89);
        #tell phase_trigger about event success (earth boss is dead)
        #quest::ze(15, "Congdar earth_event Terlok_of_Earth dead signalling phase_trigger, bye.");
#		quest::signalwith(223177, 14060, 2000);
#		quest::depop();
#	}
#}

