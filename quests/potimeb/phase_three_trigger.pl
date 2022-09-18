# phase_three_trigger (223154)

sub EVENT_SPAWN {
    #flavor text
    quest::signalwith(223111, 1002, 2000);
    #16 non target nameds
    #quest::ze(15, "Congdar phase3_trigger spawning 16 non-targetables.");
    quest::spawn2(223010,0,0,1280,1010,359.38,195);
    quest::spawn2(223011,0,0,1280,1030,359.38,195);
    quest::spawn2(223012,0,0,1260,1250,359.38,195);
    quest::spawn2(223013,0,0,1260,1270,359.38,195);
    quest::spawn2(223014,0,0,1280,1210,359.38,195);
    quest::spawn2(223015,0,0,1280,1190,359.38,195);
    quest::spawn2(223016,0,0,1260,970,359.38,195);
    quest::spawn2(223017,0,0,1260,950,359.38,195);
    quest::spawn2(223018,0,0,1300,1070,359.38,195);
    quest::spawn2(223019,0,0,1300,1090,359.38,195);
    quest::spawn2(223020,0,0,1300,1130,359.38,195);
    quest::spawn2(223021,0,0,1300,1150,359.38,195);
    quest::spawn2(223022,0,0,1230,1330,359.38,175);
    quest::spawn2(223023,0,0,1230,1310,359.38,175);
    quest::spawn2(223155,0,0,1250,1135,359.5,192);
    quest::spawn2(223156,0,0,1250,1085,359.5,192);
    #8 targetable mobs
    #sametargetable NPC's A_Pig_of_War
    #quest::ze(15, "Congdar phase3_trigger spawned.");
    quest::spawn2(223005,0,0,1150.0,1135.0,351.7,192.5);
    quest::spawn2(223005,0,0,1200.0,1185.0,352.2,192.5);
    quest::spawn2(223005,0,0,1200.0,1135.0,351.0,192.5);
    quest::spawn2(223005,0,0,1150.0,1085.0,351.0,192.5);
    #targetable NPC's A_Dark_Guardian_of_the_Warlord
    quest::spawn2(223006,0,0,1150.0,1035.0,352.0,192.5);
    quest::spawn2(223006,0,0,1200.0,1035.0,351.5,192.5);
    quest::spawn2(223006,0,0,1150.0,1195.0,351.6,192.5);
    quest::spawn2(223006,0,0,1200.0,1085.0,351.0,192.5);
    quest::settimer("phase3_trigger_mobs1", 5);
}

sub EVENT_TIMER {
    if($timer eq "phase3_trigger_mobs1") {
        # A_Pig_of_War (223005)
        my $apow = $entity_list->GetMobByNpcTypeID(223005);
        # A_Dark_Guardian_of_the_Warlord (223006)
        my $adgotw = $entity_list->GetMobByNpcTypeID(223006);
        if($apow || $adgotw) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs1");
            #A_Ferocious_Warboar
            quest::depopall(223155);
            #Deathbringer_Blackheart 
            quest::depopall(223156);
            # Deathbringer_Blackheart (223009)
            quest::spawn2(223009,0,0,1250,1085,359.5,192);
            # A_Ferocious_Warboar (223008)
            quest::spawn2(223008,0,0,1250,1135,359.5,192);
            quest::settimer("phase3_trigger_mobs2", 5);
        }
    }
    if($timer eq "phase3_trigger_mobs2") {
        # Deathbringer_Blackheart (223009)
        my $db = $entity_list->GetMobByNpcTypeID(223009);
        # A_Ferocious_Warboar (223008)
        my $afw = $entity_list->GetMobByNpcTypeID(223008);
        if($db || $afw) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs2");
            #depop untargetable nameds
            quest::depopall(223016);
            quest::depopall(223017);
            #pop non - targetable nameds in new locations
            quest::spawn2(223016,0,0,1250,1085,359.5,192);
            quest::spawn2(223017,0,0,1250,1135,359.5,192);
            #8 target mobs
            #targetable NPC's Archon_of_the_Plaquebringer
            quest::spawn2(223027,0,0,1150.0,1185.0,352.7,192.5);
            quest::spawn2(223027,0,0,1200.0,1185.0,352.2,192.5);
            quest::spawn2(223027,0,0,1150.0,1135.0,351.0,192.5);
            #targetable NPC's Revenant_of_the_Plaquebringer
            quest::spawn2(223029,0,0,1150.0,1085.0,351.0,192.5);
            #targetable NPC's Revenant_of_the_Plaquebringer
            quest::spawn2(223030,0,0,1150.0,1035.0,352.0,192.5);
            quest::spawn2(223030,0,0,1200.0,1035.0,351.5,192.5);
            #targetable NPC's Revenant_of_the_Plaquebringer
            quest::spawn2(223029,0,0,1200.0,1085.0,351.0,192.5);
            #targetable NPC's Incantator_of_the_Plaquebringer
            quest::spawn2(223026,0,0,1200.0,1135.0,351.6,192.5);
            quest::settimer("phase3_trigger_mobs3", 5);
        }
        $db = undef;
        $afw = undef;
    }
    if($timer eq "phase3_trigger_mobs3") {
        # Archon_of_the_Plaguebringer (223027)
        my $aotp = $entity_list->GetMobByNpcTypeID(223027);
        # Revenant_of_the_Plaguebringer (223029)
        my $rotp1 = $entity_list->GetMobByNpcTypeID(223029);
        # Revenant_of_the_Plaguebringer (223030)
        my $rotp2 = $entity_list->GetMobByNpcTypeID(223030);
        # Incantator_of_the_Plaguebringer (223026)
        my $iotp = $entity_list->GetMobByNpcTypeID(223026);
        if($aotp || $rotp1 || $rotp2 || $iotp) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs3");
            #depopping
            #non target named Kraksmaal_Fir`Dethsin
            quest::depopall(223017);
            #non target named Xeroan_Xi`Geruonask
            quest::depopall(223016);
            #targetable named Xeroan_Xi`Geruonask
            quest::spawn2(223025,0,0,1250.0,1085.0,351.0,192.0);
            #targetable named Kraksmaal_Fir`Dethsin
            quest::spawn2(223024,0,0,1250.0,1135.0,351.0,192.0);
            quest::settimer("phase3_trigger_mobs4", 5);
        }
        $aotp = undef;
        $rotp1 = undef;
        $rotp2 = undef;
        $iotp = undef;
    }
    if($timer eq "phase3_trigger_mobs4") {
        # Xeroan_XiGeruonask (223025)
        my $xxg = $entity_list->GetMobByNpcTypeID(223025);
        # Kraksmaal_FirDethsin (223024)
        my $kfd = $entity_list->GetMobByNpcTypeID(223024);
        if($xxg || $kfd) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs4");
            #start of wave 3
            #non target named A_Deadly_Warboar
            quest::depopall(223022);
            #non target named Deathbringer_Skullsmash
            quest::depopall(223023);
            #non target named A_Deadly_Warboar
            quest::spawn2(223022,0,0,1250.0,1135.0,359.5,192.0);
            #non target named Deathbringer_Skullsmash
            quest::spawn2(223023,0,0,1230.0,1085.0,359.5,192.0);
            #targetable NPC's A_Zek_Bloodtusk
            quest::spawn2(223035,0,0,1150.0,1135.0,351.6,192.5);
            quest::spawn2(223035,0,0,1200.0,1185.0,352.2,192.5);
            #targetable NPC's A_Warlord_Zek
            quest::spawn2(223033,0,0,1200.0,1135.0,351.0,192.5);
            #targetable NPC's A_Dark_Guardian_of_the_Warlord
            quest::spawn2(223034,0,0,1150.0,1185.0,352.7,192.5);
            quest::spawn2(223034,0,0,1200.0,1085.0,351.0,192.5);
            quest::spawn2(223034,0,0,1200.0,1035.0,351.5,192.5);
            quest::spawn2(223034,0,0,1150.0,1035.0,352.0,192.5);
            #targetable NPC's A_Zek_Bloodtusk
            quest::spawn2(223035,0,0,1150.0,1085.0,352.0,192.5);
            quest::settimer("phase3_trigger_mobs5", 5);
        }
        $xxg = undef;
        $kfd = undef;
    }
    if($timer eq "phase3_trigger_mobs5") {
        # A_Zek_Bloodtusk (223035)
        my $azb = $entity_list->GetMobByNpcTypeID(223035);
        # A_Warlord_of_Zek (223033)
        my $awoz = $entity_list->GetMobByNpcTypeID(223033);
        # A_Dark_Guardian_of_the_Warlord (223034)
        my $adgotw2 = $entity_list->GetMobByNpcTypeID(223034);
        if($xxg || $awoz || $adgotw2) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs5");
            #depopping
            #non target named A_Deadly_Warboar
            quest::depopall(223022);
            #non target named Deathbringer_Skullsmash
            quest::depopall(223023);
            #targetable NPC's Deathbringer Skulls
            quest::spawn2(223031,0,0,1250.0,1085.0,351.0,192.0);
            #targetable NPC's A_Deadly_Warboar
            quest::spawn2(223032,0,0,1250.0,1135.0,351.0,192.0);
            quest::settimer("phase3_trigger_mobs6", 5);
        }
        $azb = undef;
        $awoz = undef;
        $adgotw2 = undef;
    }
    if($timer eq "phase3_trigger_mobs6") {
        # Deathbringer_Skullsmash (223031)
        my $ds = $entity_list->GetMobByNpcTypeID(223031);
        # A_Deadly_Warboar (223032)
        my $adw = $entity_list->GetMobByNpcTypeID(223032);
        if($ds || $adw) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs6");
            #start of wave 3
            #non target named Sinrunal_Gorgedreal
            quest::depopall(223012);
            #non target named Herlsoakian
            quest::depopall(223013);
            #non target named Sinrunal_Gorgedreal
            quest::spawn2(223012,0,0,1250.0,1085.0,359.5,192.0);
            #non target named Herlsoakian
            quest::spawn2(223013,0,0,1250.0,1135.0,359.5,192.0);
            #targetable NPC's A_Ferocious_Cube_Phantasmist
            quest::spawn2(223043,0,0,1200.0,1185.0,352.2,192.5);
            quest::spawn2(223043,0,0,1200.0,1135.0,351.0,192.5);
            quest::spawn2(223043,0,0,1150.0,1185.0,351.0,192.5);
            quest::spawn2(223044,0,0,1150.0,1035.0,351.5,192.5);
            #targetable NPC's A_Ferocious_Cube_Formation
            quest::spawn2(223042,0,0,1200.0,1035.0,351.0,192.5);
            #targetable NPC's Vanquisher_of_the_Faceless
            quest::spawn2(223040,0,0,1200.0,1085.0,351.6,192.5);
            quest::spawn2(223040,0,0,1150.0,1135.0,351.6,192.5);
            #targetable NPC's Battlemaster_of_the_Faceless
            quest::spawn2(223039,0,0,1150.0,1085.0,352.0,192.5);
            quest::settimer("phase3_trigger_mobs7", 5);
        }
        $ds = undef;
        $adw = undef;
    }
    if($timer eq "phase3_trigger_mobs7") {
        # A_Ferocious_Cube_Phantasmist (223043)
        my $afcp = $entity_list->GetMobByNpcTypeID(223043);
        # A_Ferocious_Cube_Formation (223042)
        my $afcf = $entity_list->GetMobByNpcTypeID(223042);
        # Vanquisher_of_the_Faceless (223040)
        my $votf = $entity_list->GetMobByNpcTypeID(223040);
        # Battlemaster_of_the_Faceless (223039)
        my $botf = $entity_list->GetMobByNpcTypeID(223039);
        if($afcp || $afcf || $votf || $botf) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs7");
            #depopping
            #non target named Sinrunal_Gorgedreal
            quest::depopall(223012);
            #non target named Herlsoakian
            quest::depopall(223013);
            #targetable NPC's Sinrunal_Gorgedreal
            quest::spawn2(223038,0,0,1250.0,1085.0,351.0,192.0);
            #targetable NPC's Herlsoakian
            quest::spawn2(223037,0,0,1250.0,1135.0,351.0,192.0);
            quest::settimer("phase3_trigger_mobs8", 5);
        }
        $afcp = undef;
        $afcf = undef;
        $votf = undef;
        $botf = undef;
    }
    if($timer eq "phase3_trigger_mobs8") {
        # Sinrunal_Gorgedreal (223038)
        my $sg1 = $entity_list->GetMobByNpcTypeID(223038);
        # Herlsoakian (223037)
        my $herlsoakian = $entity_list->GetMobByNpcTypeID(223037);
        if($sg1 || $herlsoakian) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs8");
            #start of wave 5
            #non target named Sinrunal_Gorgedreal
            quest::depopall(223012);
            #non target named Herlsoakian
            quest::depopall(223013);
            #non target named A_Needletusk_Warboar
            quest::spawn2(223010,0,0,1250.0,1085.0,359.9,192.0);
            #non target named Deathbringer_Rianit
            quest::spawn2(223011,0,0,1250.0,1135.0,359.9,192.0);
            #targetable NPC's A_Warboar_of_Suffering
            quest::spawn2(223049,0,0,1150.0,1185.0,352.7,192.5);
            quest::spawn2(223049,0,0,1200.0,1135.0,351.0,192.5);
            quest::spawn2(223049,0,0,1150.0,1085.0,351.0,192.5);
            quest::spawn2(223049,0,0,1200.0,1035.0,351.5,192.5);
            #targetable NPC's A_Minion_of_the_Warlord
            quest::spawn2(223048,0,0,1150.0,1035.0,352.0,192.5);
            quest::spawn2(223048,0,0,1200.0,1085.0,351.0,192.5);
            quest::spawn2(223048,0,0,1150.0,1135.0,351.6,192.5);
            quest::spawn2(223048,0,0,1200.0,1185.0,352.2,192.5);
            quest::settimer("phase3_trigger_mobs9", 5);
        }
        $sg1 = undef;
        $herlsoakian = undef;
    }
    if($timer eq "phase3_trigger_mobs9") {
        # A_warboar_of_suffering (223049)
        my $awos = $entity_list->GetMobByNpcTypeID(223049);
        # A_Minion_of_the_Warlord (223048)
        my $amotw = $entity_list->GetMobByNpcTypeID(223048);
        if($awos || $amotw) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs9");
            #depopping
            #non target named A_Needletusk_Warboar
            quest::depopall(223010);
            #non target named Deathbringer_Rianit
            quest::depopall(223011);
            #targetable NPC's A_Needletusk_Warboar
            quest::spawn2(223047,0,0,1250.0,1085.0,351.0,192.0);
            #targetable NPC's Deathbringer_Rianit
            quest::spawn2(223046,0,0,1250.0,1135.0,351.0,192.0);
            quest::settimer("phase3_trigger_mobs10", 5);
        }
        $awos = undef;
        $amotw = undef;
    }
    if($timer eq "phase3_trigger_mobs10") {
        # A_Needletusk_Warboar (223047)
        my $awos = $entity_list->GetMobByNpcTypeID(223047);
        # Deathbringer_Rianit (223046)
        my $amotw = $entity_list->GetMobByNpcTypeID(223046);
        if($awos || $amotw) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs10");
            #non target named Dersool_Fal`Giersnaol
            quest::depopall(223015);
            #non target named Xerskel_Gerodnsal
            quest::depopall(223014);
            #non target named Xerskel_Gerodnsal
            quest::spawn2(223014,0,0,1250.0,1135.0,359.5,192.0);
            #non target named Dersool_Fal`Giersnaol
            quest::spawn2(223015,0,0,1250.0,1085.0,359.5,192.0);
            #targetable NPC's Assassin_of_Hate
            quest::spawn2(223052,0,0,1145.0,1080.0,352.7,192.5);
            #targetable NPC's Dark_Priest_of_Innoruuk
            quest::spawn2(223055,0,0,1200.0,1185.0,352.2,192.5);
            #targetable NPC's Dark_Priest_of_Innoruuk
            quest::spawn2(223056,0,0,1150.0,1135.0,351.6,192.5);
            #targetable NPC's Dark_Priest_of_Innoruuk
            quest::spawn2(223055,0,0,1200.0,1135.0,351.0,192.5);
            #targetable NPC's Dark_Priest_of_Innoruuk
            quest::spawn2(223056,0,0,1150.0,1185.0,351.0,192.5);
            #targetable NPC's Dark_Priest_of_Innoruuk
            quest::spawn2(223055,0,0,1200.0,1085.0,351.0,192.5);
            #targetable NPC's Dark_Priest_of_Innoruuk
            quest::spawn2(223056,0,0,1150.0,1035.0,352.0,192.5);
            #targetable NPC's Assassin_of_Hate
            quest::spawn2(223052,0,0,1200.0,1035.0,351.5,192.5);
            quest::settimer("phase3_trigger_mobs11", 5);
        }
        $awos = undef;
        $amotw = undef;
    }
    if($timer eq "phase3_trigger_mobs11") {
        # Assassin_of_Hate (223052)
        my $aoh = $entity_list->GetMobByNpcTypeID(223052);
        # Dark_Priest_of_Innoruuk (223055)
        my $dpoi1 = $entity_list->GetMobByNpcTypeID(223055);
        # Dark_Priest_of_Innoruuk (223056)
        my $dpoi2 = $entity_list->GetMobByNpcTypeID(223056);
        if($aoh || $dpoi1 || $dpoi2) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs11");
            #depopping
            #non target named Xerskel_Gerodnsal
            quest::depopall(223014);
            #non target named Dersool_FalGiersnaol
            quest::depopall(223015);
            #targetable NPC's Dersool_FalGiersnaol
            quest::spawn2(223050,0,0,1250.0,1085.0,359.5,192.0);
            #targetable NPC's Xerskel_Gerodnsal
            quest::spawn2(223051,0,0,1250.0,1135.0,359.5,192.0);
            quest::settimer("phase3_trigger_mobs12", 5);
        }
        $aoh = undef;
        $dpoi1 = undef;
        $dpoi2 = undef;
    }
    if($timer eq "phase3_trigger_mobs12") {
        # Dersool_FalGiersnaol (223050)
        my $dfg = $entity_list->GetMobByNpcTypeID(223050);
        # Xerskel_Gerodnsal (223051)
        my $xg = $entity_list->GetMobByNpcTypeID(223051);
        if($dfg || $xg) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs12");
            #non target named Dark_Knight_of_Terris
            quest::depopall(223020);
            #non target named Undead_Squad_Leader
            quest::depopall(223021);
            #non target named Dark_Knight_of_Terris
            quest::spawn2(223020,0,0,1250.0,1085.0,359.5,192.0);
            #non target named Undead_Squad_Leader
            quest::spawn2(223021,0,0,1250.0,1135.0,359.5,192.0);
            #targetable NPC's Undead_Pawn_of_Terris
            quest::spawn2(223059,0,0,1150.0,1185.0,352.7,192.5);
            quest::spawn2(223060,0,0,1200.0,1185.0,352.2,192.5);
            quest::spawn2(223059,0,0,1150.0,1035.0,352.0,192.5);
            quest::spawn2(223059,0,0,1200.0,1035.0,351.5,192.5);
            #targetable NPC's A_Hobgoblin_Servant
            quest::spawn2(223062,0,0,1200.0,1085.0,351.0,192.5);
            #targetable NPC's Knight_of_Nightmare
            quest::spawn2(223063,0,0,1200.0,1135.0,351.0,192.5);
            quest::spawn2(223064,0,0,1150.0,1135.0,351.6,192.5);
            quest::spawn2(223064,0,0,1150.0,1085.0,351.0,192.5);
            quest::settimer("phase3_trigger_mobs13", 5);
        }
        $dfg = undef;
        $xg = undef;
    }
    if($timer eq "phase3_trigger_mobs13") {
        # Undead_Pawn_of_Terris (223059)
        my $upot1 = $entity_list->GetMobByNpcTypeID(223059);
        # Undead_Pawn_of_Terris (223060)
        my $upot2 = $entity_list->GetMobByNpcTypeID(223060);
        # A_Hobgoblin_Servant (223062)
        my $ahs = $entity_list->GetMobByNpcTypeID(223062);
        # Knight_of_Nightmare (223063)
        my $kon1 = $entity_list->GetMobByNpcTypeID(223063);
        # Knight_of_Nightmare (223064)
        my $kon2 = $entity_list->GetMobByNpcTypeID(223064);
        if($upot1 || $upot2 || $ahs || $kon1 || $kon2) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs13");
            #depopping
            #non target named Dark_Knight_of_Terris
            quest::depopall(223020);
            #non target named Undead_Squad_Leader
            quest::depopall(223021);
            #targetable NPC's Dark_Knight_of_Terris
            quest::spawn2(223058,0,0,1250.0,1085.0,351.0,192.0);
            #targetable NPC's Undead_Squad_Leader
            quest::spawn2(223057,0,0,1250.0,1135.0,351.0,192.0);
            quest::settimer("phase3_trigger_mobs14", 5);
        }
        $upot1 = undef;
        $upot2 = undef;
        $ahs = undef;
        $kon1 = undef;
        $kon2 = undef;
    }
    if($timer eq "phase3_trigger_mobs14") {
        # Dark_Knight_of_Terris (223058)
        my $dkot = $entity_list->GetMobByNpcTypeID(223058);
        # Undead_Squad_Leader (223057)
        my $usl = $entity_list->GetMobByNpcTypeID(223057);
        if($dkot || $usl) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs14");
            #non target named Dreamwarp
            quest::depopall(223018);
            #non target named Champion_of_Torment
            quest::depopall(223019);
            #non target named Dreamwarp
            quest::spawn2(223018,0,0,1250.0,1085.0,359.5,192.0);
            #non target named Champion_of_Torment
            quest::spawn2(223019,0,0,1250.0,1135.0,359.5,192.0);
            #targetable NPC's Doombringer_of_Saryrn
            quest::spawn2(223072,0,0,1200.0,1135.0,351.0,192.5);
            quest::spawn2(223072,0,0,1150.0,1135.0,351.6,192.5);
            #targetable NPC's Templar_of_Saryrn
            quest::spawn2(223071,0,0,1150.0,1035.0,352.0,192.5);
            #targetable NPC's Cutthtoat_of_Saryrn
            quest::spawn2(223068,0,0,1200.0,1035.0,351.5,192.5);
            quest::spawn2(223068,0,0,1150.0,1185.0,352.7,192.5);
            #targetable NPC's Dark_Knight_of_Saryrn
            quest::spawn2(223069,0,0,1150.0,1085.0,351.0,192.5);
            quest::spawn2(223069,0,0,1200.0,1185.0,352.2,192.5);
            #targetable NPC's Warbeast_of_Saryrn
            quest::spawn2(223067,0,0,1200.0,1085.0,351.0,192.5);
            quest::settimer("phase3_trigger_mobs15", 5);
        }
        $dkot = undef;
        $usl = undef;
    }
    if($timer eq "phase3_trigger_mobs15") {
        # Doombringer_of_Saryrn (223072)
        my $dos = $entity_list->GetMobByNpcTypeID(223072);
        # Templar_of_Saryrn (223071)
        my $tos = $entity_list->GetMobByNpcTypeID(223071);
        # Cutthroat_of_Saryrn (223068)
        my $cos = $entity_list->GetMobByNpcTypeID(223068);
        # Dark_Knight_of_Saryrn (223069)
        my $dkos = $entity_list->GetMobByNpcTypeID(223069);
        # Warbeast_of_Saryrn (223067)
        my $wos = $entity_list->GetMobByNpcTypeID(223067);
        if($dos || $tos || $cos || $dkos || $wos) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs15");
            #depopping
            #non target named Dreamwarp
            quest::depopall(223018);
            #non target named Champion_of_Torment
            quest::depopall(223019);
            #targetable NPC's Dreamwarp
            quest::spawn2(223066,0,0,1250.0,1085.0,351.0,192.0);
            #targetable NPC's Champion_of_Torment
            quest::spawn2(223065,0,0,1250.0,1135.0,351.0,192.0);
            quest::settimer("phase3_trigger_mobs16", 5);
        }
        $dos = undef;
        $tos = undef;
        $cos = undef;
        $dkos = undef;
        $wos = undef;
    }
    if($timer eq "phase3_trigger_mobs16") {
        # Dreamwarp (223066)
        my $d = $entity_list->GetMobByNpcTypeID(223066);
        # Champion_of_Torment (223065)
        my $cot = $entity_list->GetMobByNpcTypeID(223065);
        if($d || $cot) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs16");
            #targetable NPC's Avatar_of_Elements
            quest::spawn2(223073,0,0,1492.0,1110.0,369.0,195.5);
            #targetable NPC's Supernatural_Guardian
            quest::spawn2(223074,0,0,1563.0,1110.0,369.0,195.5);
            quest::settimer("phase3_trigger_mobs17", 5);
        }
        $d = undef;
        $cot = undef;
    }
    if($timer eq "phase3_trigger_mobs17") {
        # Avatar_of_the_Elements (223073)
        my $aote = $entity_list->GetMobByNpcTypeID(223073);
        # Supernatural_Guardian (223074)
        my $sg2 = $entity_list->GetMobByNpcTypeID(223074);
        if($aote || $sg2) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase3_trigger_mobs17");
            $npc->CameraEffect(3000, 6, 0, 1);
            #depopping
            quest::setglobal("portal3", "1", 7, "H1");
            quest::depop();
        }
        $aote = undef;
        $sg2 = undef;
    }
}

