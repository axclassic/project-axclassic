#undead_counter.pl used as phase2 mobs instead!
# #undead_counter (223180)

my $aug1_spawned = 1;
my $aug2_spawned = 1;

sub EVENT_SPAWN {
    #This spawns 1st mob group for Phase 2
	#undead group
    # an_undead_guardian_ (223107)
	quest::spawn2(223107,0,0,242.0,1119.0,491.3,192.5);
	quest::spawn2(223107,0,0,232.0,1114.0,491.2,192.5);
	quest::spawn2(223107,0,0,252.0,1114.0,491.8,192.5);
	quest::spawn2(223107,0,0,242.0,1109.0,491.5,192.5);
    # an_undead_guardian_ (223138)
    quest::spawn2(223138,0,0,252.0,1124.0,491.4,192.5);
	quest::spawn2(223138,0,0,252.0,1104.0,491.7,192.5);
	quest::spawn2(223138,0,0,232.0,1104.0,491.1,192.5);
	quest::spawn2(223138,0,0,242.0,1099.0,491.2,192.5);
	quest::spawn2(223138,0,0,252.0,1094.0,491.4,192.5);
    #quest::ze(15, "Congdar undead_counter spawned 9 an_undead_guardian_.");
    quest::settimer("phase2_undead_counter_mobs1", 10);
}

sub EVENT_TIMER {
    if($timer eq "phase2_undead_counter_mobs1") {
        # an_undead_guardian_ (223107)
        my $aug1 = $entity_list->GetMobByNpcTypeID(223107);
        # an_undead_guardian_ (223138)
        my $aug2 = $entity_list->GetMobByNpcTypeID(223138);
        if($aug1) {
            $aug1_spawned = undef;
        }
        if($aug2) {
            $aug2_spawned = undef;
        }
        if($aug1_spawned || $aug2_spawned) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase2_undead_counter_mobs1");
            quest::settimer("phase2_undead_counter_mobs2", 10);
        }
        $aug1 = undef;
        $aug2 = undef;
    }
    if($timer eq "phase2_undead_counter_mobs2") {
        # an_undead_guardian_ (223107)
        my $aug1 = $entity_list->GetMobByNpcTypeID(223107);
        # an_undead_guardian_ (223138)
        my $aug2 = $entity_list->GetMobByNpcTypeID(223138);
        if($aug1 || $aug2) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase2_undead_counter_mobs2");
            # #undead_trigger (223171)
            quest::spawn2(223171,0,0,-129.6,1720,547,0);
            quest::depop();
        }
        $aug1 = undef;
        $aug2 = undef;
    }
}

