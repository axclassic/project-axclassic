#This is an invisible controller which spawns the flame mephits
# #fire_event (223190)

sub EVENT_SPAWN {
    # #a_flame_mephit (223088)
    quest::spawn2(223088,0,0,68,573,504,185.5);
    quest::spawn2(223088,0,0,68,563,504,185.5);
    quest::spawn2(223088,0,0,68,583,504,185.5);
    quest::settimer("phase1_fire_mobs", 10);
    #quest::ze(15, "Congdar fire_event spawned 3 a_flame_mephit.");
}  

sub EVENT_TIMER {
    # #a_flame_mephit (223088)
    my $afm1 = $entity_list->GetMobByNpcTypeID(223088);
    # a_flame_mephit (223089)
    my $afm2 = $entity_list->GetMobByNpcTypeID(223089);
    # an_inferno_mephit (223095)
    my $aim = $entity_list->GetMobByNpcTypeID(223095);
    # Kazrok_of_Fire (223090)
    my $kof = $entity_list->GetMobByNpcTypeID(223090);

    if($timer eq "phase1_fire_mobs") {
        if($afm1 || $afm2 || $aim) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase1_fire_mobs");
            # Kazrok_of_Fire (223090)
            quest::spawn2(223090,0,0,68,573,504,185.5);
            # an_inferno_mephit (223095)
            quest::spawn2(223095,0,0,68+5,573,504,185.5);
            quest::spawn2(223095,0,0,68-5,573,504,185.5);
            quest::spawn2(223095,0,0,68,573+5,504,185.5);
            quest::spawn2(223095,0,0,68,573-5,504,185.5);
            quest::settimer("phase1_fire_boss", 10);
        }
    }

    if($timer eq "phase1_fire_boss") {
        if($kof || $aim) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase1_fire_boss");
            # Time_Companion
            quest::spawn2(223228,0,0,76.59,617.2,495.2,177.8);
            quest::depop();
        }
    }
}

