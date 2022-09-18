#water_counter.pl used as phase2 mobs instead!
# #water_counter (223181)

my $awh1_spawned = 1;
my $awh2_spawned = 1;
my $cok1_spawned = 1;
my $cok2_spawned = 1;
my $ada1_spawned = 1;
my $ada2_spawned = 1;

sub EVENT_SPAWN { #This spawns 1st mob group for Phase 2
    #water group
    # A_Watercrafted_Hunter (223148)
	quest::spawn2(223148,0,0,252.0,884.0,491.0,192.5);
    quest::spawn2(223148,0,0,252.0,864.0,491.3,192.5);
	quest::spawn2(223148,0,0,242.0,879.0,491.3,192.5);
    # Champion_of_Korascian (223123)
    quest::spawn2(223123,0,0,232.0,864.0,492.0,192.5);
    quest::spawn2(223123,0,0,242.0,859.0,491.5,192.5);
    # Champion_of_Korascian (223099)
	quest::spawn2(223099,0,0,232.0,874.0,491.7,192.5);
    # A_Deepwater_Assassin (223141)
	quest::spawn2(223141,0,0,252.0,874.0,491.1,192.5);
    # A_Deepwater_Assassin (223126)
	quest::spawn2(223126,0,0,242.0,869.0,491.6,192.5);
    # A_Watercrafted_Hunter (223153)
	quest::spawn2(223153,0,0,252.0,854.0,491.0,192.5);
    #quest::ze(15, "Congdar water_counter pawning 3 A_Watercrafted_Hunter, 3 Champion_of_Korascian, 2 A_Deepwater_Assassin and A_Watercrafted_Hunter."); 
    quest::settimer("phase2_water_counter_mobs1", 10);
}

sub EVENT_TIMER {
    if($timer eq "phase2_water_counter_mobs1") {
        # A_Watercrafted_Hunter (223148)
        my $awh1 = $entity_list->GetMobByNpcTypeID(223148);
        # A_Watercrafted_Hunter (223153)
        my $awh2 = $entity_list->GetMobByNpcTypeID(223153);
        # Champion_of_Korascian (223123)
        my $cok1 = $entity_list->GetMobByNpcTypeID(223123);
        # Champion_of_Korascian (223099)
        my $cok2 = $entity_list->GetMobByNpcTypeID(223099);
        # A_Deepwater_Assassin (223141)
        my $ada1 = $entity_list->GetMobByNpcTypeID(223141);
        # A_Deepwater_Assassin (223126)
        my $ada2 = $entity_list->GetMobByNpcTypeID(223126);
        if($awh1) {
            $awh1_spawned = undef;
        }
        if($awh2) {
            $awh2_spawned = undef;
        }
        if($cok1) {
            $cok1_spawned = undef;
        }
        if($cok2) {
            $cok2_spawned = undef;
        }
        if($ada1) {
            $ada1_spawned = undef;
        }
        if($ada2) {
            $ada2_spawned = undef;
        }
        if($awh1_spawned || $awh2_spawned || $cok1_spawned || $cok2_spawned || $ada1_spawned || $ada2_spawned) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase2_water_counter_mobs1");
            quest::settimer("phase2_water_counter_mobs2", 10);
        }
        $awh1 = undef;
        $awh2 = undef;
        $cok1 = undef;
        $cok2 = undef;
        $ada1 = undef;
        $ada2 = undef;
    }
    if($timer eq "phase2_water_counter_mobs2") {
        # A_Watercrafted_Hunter (223148)
        my $awh1 = $entity_list->GetMobByNpcTypeID(223148);
        # A_Watercrafted_Hunter (223153)
        my $awh2 = $entity_list->GetMobByNpcTypeID(223153);
        # Champion_of_Korascian (223123)
        my $cok1 = $entity_list->GetMobByNpcTypeID(223123);
        # Champion_of_Korascian (223099)
        my $cok2 = $entity_list->GetMobByNpcTypeID(223099);
        # A_Deepwater_Assassin (223141)
        my $ada1 = $entity_list->GetMobByNpcTypeID(223141);
        # A_Deepwater_Assassin (223126)
        my $ada2 = $entity_list->GetMobByNpcTypeID(223126);
        if($awh1 || $awh2 || $cok1 || $cok2 || $ada1 || $ada2) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase2_water_counter_mobs2");
            # #water_trigger (223172)
            quest::spawn2(223172,0,0,-129.6,1720,547,0);
            quest::depop();
        }
        $awh1 = undef;
        $awh2 = undef;
        $cok1 = undef;
        $cok2 = undef;
        $ada1 = undef;
        $ada2 = undef;
    }
}

