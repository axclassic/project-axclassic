#phase_five_trigger.pl npcid - 223158

sub EVENT_SPAWN {
    #flavor
    quest::signalwith(223111, 1004, 2000);
    #Fake Bertoxxulous
    quest::spawn2(223098,0,0,-299,-297,23.3,31);
    #Fake Cazic
    quest::spawn2(223165,0,0,-257,255,6,101.5);
    #Fake Innoruuk
    quest::spawn2(223000,0,0,303.3,306,13.3,161.5);
    #Fake Rallos
    quest::spawn2(223001,0,0,264,-279,18.75,217.5);
    #real mobs
    #targetable NPC's Guardian_Knight_of_Pestilence
    quest::spawn2(223196,0,0,-92.6,-153.0,1.0,0.0);
    quest::spawn2(223196,0,0,-92.6,-173.0,1.0,0.0);
    quest::spawn2(223196,0,0,-92.6,-213.0,1.0,0.0);
    quest::spawn2(223196,0,0,-92.6,-233.0,1.0,0.0);
    #targetable NPC's A_Firebone_Caster
    quest::spawn2(223195,0,0,-111.6,-153.0,1.0,0.0);
    quest::spawn2(223195,0,0,-111.6,-173.0,1.0,0.0);
    quest::spawn2(223195,0,0,-111.6,-213.0,1.0,0.0);
    quest::spawn2(223195,0,0,-111.6,-233.0,1.0,0.0);
    quest::spawn2(223195,0,0,-130.6,-173.0,1.0,0.0);
    quest::spawn2(223195,0,0,-130.6,-213.0,1.0,0.0);
    #targetable NPC's Guardian_of_the_Crypt
    quest::spawn2(223194,0,0,-111.6,-192.0,1.0,0.0);
    #targetable NPC's a_summoned_boar
    quest::spawn2(223003,0,0,82.6,-153.0,1.0,0.0);
    quest::spawn2(223003,0,0,82.6,-173.0,1.0,0.0);
    quest::spawn2(223003,0,0,82.6,-193.0,1.0,0.0);
    quest::spawn2(223003,0,0,101.6,-153.0,1.0,0.0);
    quest::spawn2(223003,0,0,101.6,-173.0,1.0,0.0);
    quest::spawn2(223003,0,0,120.6,-173.0,1.0,0.0);
    #targetable NPC's a_summoned_minion
    quest::spawn2(223002,0,0,82.6,-213.0,1.0,0.0);
    quest::spawn2(223002,0,0,82.6,-233.0,1.0,0.0);
    quest::spawn2(223002,0,0,106.6,-193.0,1.0,0.0);
    quest::spawn2(223002,0,0,82.6,-213.0,1.0,0.0);
    quest::spawn2(223002,0,0,106.6,-213.0,1.0,0.0);
    quest::spawn2(223002,0,0,101.6,-233.0,1.0,0.0);
    quest::spawn2(223002,0,0,120.6,-213.0,1.0,0.0);
    #targetable NPC's Cleric_of_Innoruuk
    quest::spawn2(223197,0,0,145.6,103.5,1.0,185.5);
    quest::spawn2(223197,0,0,165.6,103.5,1.0,185.5);
    quest::spawn2(223197,0,0,185.6,103.5,1.0,185.5);
    quest::spawn2(223197,0,0,205.6,103.5,1.0,185.5);
    quest::spawn2(223197,0,0,145.6,122.5,1.0,185.5);
    quest::spawn2(223197,0,0,165.6,122.5,1.0,185.5);
    quest::spawn2(223197,0,0,165.6,141.5,1.0,185.5);
    #targetable NPC's an_abhorrent
    quest::spawn2(223198,0,0,145.6,141.5,1.0,185.5);
    quest::spawn2(223198,0,0,225.6,103.5,1.0,185.5);
    quest::spawn2(223198,0,0,185.6,122.5,1.0,185.5);
    quest::spawn2(223198,0,0,205.6,122.5,1.0,185.5);
    quest::spawn2(223198,0,0,225.6,122.5,1.0,185.5);
    quest::spawn2(223198,0,0,205.6,141.5,1.0,185.5);
    #targetable NPC's Amygdalan knight
    quest::spawn2(223199,0,0,-122.6,148.5,1.0,128.0);
    quest::spawn2(223199,0,0,-122.6,168.5,1.0,128.0);
    quest::spawn2(223199,0,0,-122.6,188.5,1.0,128.0);
    quest::spawn2(223199,0,0,-141.6,148.5,1.0,128.0);
    quest::spawn2(223199,0,0,-122.6,168.5,1.0,128.0);
    quest::spawn2(223199,0,0,-160.6,168.5,1.0,128.0);
    #targetable NPC's phoboplasm
    quest::spawn2(223200,0,0,-122.6,208.5,1.0,128.0);
    quest::spawn2(223200,0,0,-122.6,228.5,1.0,128.0);
    quest::spawn2(223200,0,0,-141.6,188.5,1.0,128.0);
    quest::spawn2(223200,0,0,-141.6,208.5,1.0,128.0);
    quest::spawn2(223200,0,0,-141.6,228.5,1.0,128.0);
    quest::spawn2(223200,0,0,-160.6,208.5,1.0,128.0);
    quest::settimer("phase5_trigger_mobs1", 5);
}

sub EVENT_TIMER {
    if($timer eq "phase5_trigger_mobs1") {
        # Guardian_Knight_of_Pestilence (223196)
        my $gkop = $entity_list->GetMobByNpcTypeID(223196);
        # A_Firebone_Caster (223195)
        my $afc = $entity_list->GetMobByNpcTypeID(223195);
        # Guardian_of_the_Crypt (223194)
        my $gotc = $entity_list->GetMobByNpcTypeID(223194);
        # a_summoned_boar (223003)
        my $asb = $entity_list->GetMobByNpcTypeID(223003);
        # a_summoned_minion (223002)
        my $asm = $entity_list->GetMobByNpcTypeID(223002);
        # Cleric_of_Innoruuk (223197)
        my $coi = $entity_list->GetMobByNpcTypeID(223197);
        # an_abhorrent (223198)
        my $aa = $entity_list->GetMobByNpcTypeID(223198);
        # Amygdalan_knight (223199)
        my $ak = $entity_list->GetMobByNpcTypeID(223199);
        # phoboplasm (223200)
        my $p = $entity_list->GetMobByNpcTypeID(223200);
        if($gkop || $afc || $gotc || $asb || $asm || $coi || $aa || $ak || $p) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase5_trigger_mobs1");
            quest::depopall(223098);
            quest::depopall(223165);
            quest::depopall(223000);
            quest::depopall(223001);
            #Real Bertoxxulous
            quest::spawn2(223142,0,0,-299,-297,23.3,31);
            #Real Cazic
            quest::spawn2(223166,0,0,-257,255,6,101.5);
            #Real Innoruuk
            quest::spawn2(223167,0,0,303.3,306,13.3,161.5);
            #Real Rallos
            quest::spawn2(223168,0,0,264,-279,18.75,217.5);
            quest::settimer("phase5_trigger_mobs2", 5);
        }
    }
    if($timer eq "phase5_trigger_mobs2") {
        # #Bertoxxulous (223142)
        my $b = $entity_list->GetMobByNpcTypeID(223142);
        # #Cazic_Thule (223166)
        my $ct = $entity_list->GetMobByNpcTypeID(223166);
        # #Innoruuk (223167)
        my $i = $entity_list->GetMobByNpcTypeID(223167);
        # #Rallos_Zek (223168)
        my $rz = $entity_list->GetMobByNpcTypeID(223168);
        if($b || $ct || $i || $rz) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase5_trigger_mobs2");
            #event success
            $npc->CameraEffect(3000, 6, 0, 1); #Worlwide camera shake
            #sets flag for final phase to Quarm
            quest::setglobal("portal5","1",7,"H1");
            quest::depop();
        }
    }
}

