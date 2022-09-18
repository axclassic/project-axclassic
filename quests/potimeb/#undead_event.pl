#This is an invisible controller which spawns the undead guardians
# #undead_event (223188)

sub EVENT_SPAWN {
    # #an_undead_guardian (223105)
	quest::spawn2(223105,0,0,65.2,1109.7,494.8,185.5);
	quest::spawn2(223105,0,0,65.2,1119.7,494.8,185.5);
	quest::spawn2(223105,0,0,65.2,1099.7,494.8,185.5);
    quest::settimer("phase1_undead_mobs", 10);
    #quest::ze(15, "Congdar undead_event spawned 3 an_undead_guardian.");
}

sub EVENT_TIMER {
    # #an_undead_guardian (223105)
    my $aug1 = $entity_list->GetMobByNpcTypeID(223105);
    # an_undead_guardian (223116)
    my $aug2 = $entity_list->GetMobByNpcTypeID(223116);
    # an_undead_protector (223150)
    my $aup = $entity_list->GetMobByNpcTypeID(223150);
    # Rythor_of_the_Undead (223129)
    my $rotu = $entity_list->GetMobByNpcTypeID(223129);

    if($timer eq "phase1_undead_mobs") {
        if($aug1 || $aug2) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase1_undead_mobs");
            # Rythor_of_the_Undead (223129)
            quest::spawn2(223129,0,0,65.25,1109.7,494.8,185.5);
            # an_undead_protector (223150)
            quest::spawn2(223150,0,0,65.2+5,1119.7,494.8,185.5);
            quest::spawn2(223150,0,0,65.2-5,1099.7,494.8,185.5);
            quest::spawn2(223150,0,0,65.2,1099.7+5,494.8,185.5);
            quest::spawn2(223150,0,0,65.2,1099.7-5,494.8,185.5);
            quest::settimer("phase1_undead_boss", 10);
        }
    }

    if($timer eq "phase1_undead_boss") {
        if($rotu || $aup) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase1_undead_boss");
            # Time_Companion
            quest::spawn2(223228,0,0,75.9,1156.4,494.39,160.8);
            quest::depop();
        }
    }
}

