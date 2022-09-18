#This is an invisible controller which spawns the earth rubbles.
# #earth_event (223186)

sub EVENT_SPAWN {
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

