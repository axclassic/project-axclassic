#phase3_trigger (223154)

my $namedI = 1;
my $namedII = 1;
my $namedIII = 1;
my $namedIV = 1;
my $namedV = 1;
my $namedVI = 1;
my $namedVII = 1;
my $namedVIII = 1;
my $namedIX = 1;
my $wave_one_npccounter = 1;
my $wave_two_npccounter = 1;
my $wave_three_npccounter = 1;
my $wave_four_npccounter = 1;
my $wave_five_npccounter = 1;
my $wave_six_npccounter = 1;
my $wave_seven_npccounter = 1;
my $wave_eight_npccounter = 1;
my $wave_nine_npccounter = 1;

sub EVENT_SPAWN {
    $namedI = 1;
    $namedII = 1;
    $namedIII = 1;
    $namedIV = 1;
    $namedV = 1;
    $namedVI = 1;
    $namedVII = 1;
    $namedVIII = 1;
    $namedIX = 1;
    $wave_one_npccounter = 1;
    $wave_two_npccounter = 1;
    $wave_three_npccounter = 1;
    $wave_four_npccounter = 1;
    $wave_five_npccounter = 1;
    $wave_six_npccounter = 1;
    $wave_seven_npccounter = 1;
    $wave_eight_npccounter = 1;
    $wave_nine_npccounter = 1;
    #flavor text
    quest::signalwith(223111, 1002, 2000);
    #16 non target nameds
    quest::ze(15, "Congdar Phase3 spawining 16 non-targetables.");
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
    quest::ze(15, "Congdar Phase3 spawining 8 targetables.");
    quest::spawn2(223005,0,0,1150.0,1135.0,351.7,192.5);
    quest::spawn2(223005,0,0,1200.0,1185.0,352.2,192.5);
    quest::spawn2(223005,0,0,1200.0,1135.0,351.0,192.5);
    quest::spawn2(223005,0,0,1150.0,1085.0,351.0,192.5);
    #targetable NPC's A_Dark_Guardian_of_the_Warlord
    quest::spawn2(223006,0,0,1150.0,1035.0,352.0,192.5);
    quest::spawn2(223006,0,0,1200.0,1035.0,351.5,192.5);
    quest::spawn2(223006,0,0,1150.0,1195.0,351.6,192.5);
    quest::spawn2(223006,0,0,1200.0,1085.0,351.0,192.5);
}

sub EVENT_SIGNAL {
    if($signal == 1011) {
        quest::ze(15, "Congdar Phase3 signal is wave_one_npccounter $wave_one_npccounter of 8.");
        #sets counter to start 1st wave upon all 8 dying
        $wave_one_npccounter = $wave_one_npccounter + 1;
    }

    if($wave_one_npccounter >= 9) {
        quest::ze(15, "Congdar Phase3 wave_one_npccounter is 8 of 8, spawn Deathbringer_Blackheart and A_Ferocious_Warboar.");
        #triggers #wave1.pl
        $wave_one_npccounter = 1;
        #start wave1
        #A_Ferocious_Warboar
        quest::depopall(223155);
        #Deathbringer_Blackheart 
        quest::depopall(223156);
        #quest::depopall(223217); # #wave1.pl
        #Deathbringer_Blackheart
        quest::spawn2(223009,0,0,1250,1085,359.5,192);
        #A_Ferocious_Warboar
        quest::spawn2(223008,0,0,1250,1135,359.5,192);
    }

    if($signal == 11010) {
        quest::ze(15, "Congdar Phase3 signal is namedI $namedI of 2.");
        #1st two names
        $namedI = $namedI + 1;
    }

    if($namedI >= 3) {
        quest::ze(15, "Congdar Phase3 namedI is 2 of 2, depop some untargetables, spawn different untargetables, 3 Archon_of_the_Plaquebringer, 4 Revenant_of_the_Plaquebringer and Incantator_of_the_Plaquebringer.");
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
        $namedI = 1;
        $namedII = 1;
    }

    #starts counter of wave 2
    if($signal == 2022) {
        quest::ze(15, "Congdar Phase3 signal is wave_two_npccounter $wave_two_npccounter of 8.");
        #sets counter to start 3rd wave upon all 8 dying
        $wave_two_npccounter = $wave_two_npccounter + 1;
    }

    if($wave_two_npccounter >= 9) {
        quest::ze(15, "Congdar Phase3 wave_two_npccounter is 8 of 8, depop some untargetables, spawn Xeroan_XiGeruonask and Kraksmaal_FirDethsin.");
        #triggers #wave3.pl
        $wave_two_npccounter = 1;
        #depopping
        #non target named Kraksmaal_Fir`Dethsin
        quest::depopall(223017);
        #non target named Xeroan_Xi`Geruonask
        quest::depopall(223016);
        #targetable named Xeroan_Xi`Geruonask
        quest::spawn2(223025,0,0,1250.0,1085.0,351.0,192.0);
        #targetable named Kraksmaal_Fir`Dethsin
        quest::spawn2(223024,0,0,1250.0,1135.0,351.0,192.0);
    }

    if($signal == 11020) {
        quest::ze(15, "Congdar Phase3 signal is namedII $namedII of 2.");
        $namedII = $namedII + 1;
    }

    if($namedII >= 3) {
        quest::ze(15, "Congdar Phase3 namedI is 2 of 2, depop some untargetables, spawn different untargetables, 2 A_Zek_Bloodtusk, 4 A_Dark_Guardian_of_the_Warlord, A_Deadly_Warboar, A_Zek_Bloodtusk and Deathbringer_Skullsmash.");
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
        $namedI = 1;
        $namedII = 1;
    }

    #starts counter of wave 3
    if($signal == 3033) {
        quest::ze(15, "Congdar Phase3 signal is wave_three_npccounter $wave_three_npccounter of 8.");
        #sets counter to start 4th wave upon all 8 dying
        $wave_three_npccounter = $wave_three_npccounter + 1;
    }

    if($wave_three_npccounter >= 9) {
        quest::ze(15, "Congdar Phase3 wave_three_npccounter is 8 of 8, depop some untargetables, spawn Deathbringer_Skulls and A_Deadly_Warboar.");
        #triggers #wave4.pl
        $wave_three_npccounter = 1;
        #depopping
        #non target named A_Deadly_Warboar
        quest::depopall(223022);
        #non target named Deathbringer_Skullsmash
        quest::depopall(223023);
        #targetable NPC's Deathbringer Skulls
        quest::spawn2(223031,0,0,1250.0,1085.0,351.0,192.0);
        #targetable NPC's A_Deadly_Warboar
        quest::spawn2(223032,0,0,1250.0,1135.0,351.0,192.0);
    }

    if($signal == 11030) {
        quest::ze(15, "Congdar Phase3 signal is namedIII $namedIII of 2.");
        #start of wave 4
        $namedIII = $namedIII + 1;
    }

    if($namedIII >= 3) {
        quest::ze(15, "Congdar Phase3 namedIII is 2 of 2, depop some untargetables, spawn different untargetables, 4 A_Ferocious_Cube_Phantasmist, 2 Vanquisher_of_the_Faceless, A_Ferocious_Cube_Formation and Battlemaster_of_the_Faceless.");
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
        $namedIII = 1;
    }

    #starts counter of wave 4
    if($signal == 4044) {
        quest::ze(15, "Congdar Phase3 signal is wave_four_npccounter $wave_four_npccounter of 8.");
        #sets counter to start 4th wave upon all 8 dying
        $wave_four_npccounter = $wave_four_npccounter + 1;
    }
    if($wave_four_counter >= 9) {
        quest::ze(15, "Congdar Phase3 wave_four_npccounter is 8 of 8, depop some untargetables, spawn Sinrunal_Gorgedreal and Herlsoakian.");
        #triggers 4th
        $wave_four_npccounter = 1;
        #depopping
        #non target named Sinrunal_Gorgedreal
        quest::depopall(223012);
        #non target named Herlsoakian
        quest::depopall(223013);
        #targetable NPC's Sinrunal_Gorgedreal
        quest::spawn2(223038,0,0,1250.0,1085.0,351.0,192.0);
        #targetable NPC's Herlsoakian
        quest::spawn2(223037,0,0,1250.0,1135.0,351.0,192.0);
    }

    if($signal == 11040) {
        quest::ze(15, "Congdar Phase3 signal is namedIV $namedIV of 2.");
        #start of wave 5
        $namedIV = $namedIV + 1;
    }

    if($namedIV >= 3) {
        quest::ze(15, "Congdar Phase3 namedIV is 8 of 8, depop some untargetables, spawn different untargetables, 4 A_Warboar_of_Suffering and 4 A_Minion_of_the_Warlord.");
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
        $namedIV = 0;
    }

    if($signal == 5055) {
        quest::ze(15, "Congdar Phase3 signal is wave_five_npccounter $wave_five_npccounter of 8.");
        #sets counter to start 6th wave upon all 8 dying
        $wave_five_npccounter = $wave_five_npccounter + 1;
    }

    if($wave_five_npccounter >= 9) {
        quest::ze(15, "Congdar Phase3 wave_five_npccounter is 8 of 8, depop some untargetables, spawn A_Needletusk_Warboar and Deathbringer_Rianit.");
        $wave_five_npccounter = 1;
        #depopping
        #non target named A_Needletusk_Warboar
        quest::depopall(223010);
        #non target named Deathbringer_Rianit
        quest::depopall(223011);
        #targetable NPC's A_Needletusk_Warboar
        quest::spawn2(223047,0,0,1250.0,1085.0,351.0,192.0);
        #targetable NPC's Deathbringer_Rianit
        quest::spawn2(223046,0,0,1250.0,1135.0,351.0,192.0);
    }

    if($signal == 11050) {
        quest::ze(15, "Congdar Phase3 signal is namedV $namedV of 2.");
        #start of wave 6
        $namedV = $namedV + 1;
    }

    if($namedV >= 3) {
        quest::ze(15, "Congdar Phase3 namedV is 2 of 2, depop some untargetables, spawn different untargetables, 4 A_Warboar_of_Suffering and 4 A_Minion_of_the_Warlord.");
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
        $namedV = 1;
    }

    if($signal == 6066) {
        quest::ze(15, "Congdar Phase3 signal is wave_six_npccounter $wave_six_npccounter of 8.");
        #sets counter to start 6th wave upon all 8 dying
        $wave_six_npccounter = $wave_six_npccounter + 1;
    }

    if($wave_six_npccounter >= 9) {
        quest::ze(15, "Congdar Phase3 wave_six_npccounter is 8 of 8, depop some untargetables, spawn Dersool_FalGiersnaol and Xerskel_Gerodnsal.");
        $wave_six_npccounter = 1;
        #depopping
        #non target named Xerskel_Gerodnsal
        quest::depopall(223014);
        #non target named Dersool_Fal`Giersnaol
        quest::depopall(223015);
        #targetable NPC's Dersool_Fal`Giersnaol
        quest::spawn2(223050,0,0,1250.0,1085.0,359.5,192.0);
        #targetable NPC's Xerskel_Gerodnsal
        quest::spawn2(223051,0,0,1250.0,1135.0,359.5,192.0);
    }

    if($signal == 11060) {
        quest::ze(15, "Congdar Phase3 signal is namedVI $namedVI of 2.");
        #start of wave 7
        $namedVI = $namedVI + 1;
    }

    if($namedVI >= 3) {
        quest::ze(15, "Congdar Phase3 namedVI is 2 of 2, depop some untargetables, spawn different untargetables, 4 Undead_Pawn_of_Terris, 3 Knight_of_Nightmare and A_Hobgoblin_Servant.");
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
        $namedVI = 1;
    }

    if($signal == 7077) {
        quest::ze(15, "Congdar Phase3 signal is wave_seven_npccounter $wave_seven_npccounter of 8.");
        #sets counter to start 7th wave upon all 8 dying
        $wave_seven_npccounter = $wave_seven_npccounter + 1;
    }

    if($wave_seven_npccounter >= 9) {
        quest::ze(15, "Congdar Phase3 wave_seven_npccounter is 8 of 8, depop some untargetables, spawn Dark_Knight_of_Terris and Undead_Squad_Leader.");
        $wave_seven_npccounter = 1;
        #quest::ze(15, "okay all 8 are dead now do something!");
        #depopping
        #non target named Dark_Knight_of_Terris
        quest::depopall(223020);
        #non target named Undead_Squad_Leader
        quest::depopall(223021);
        #targetable NPC's Dark_Knight_of_Terris
        quest::spawn2(223058,0,0,1250.0,1085.0,351.0,192.0);
        #targetable NPC's Undead_Squad_Leader
        quest::spawn2(223057,0,0,1250.0,1135.0,351.0,192.0);
    }

    if($signal == 11070) {
        quest::ze(15, "Congdar Phase3 signal is namedVII $namedVII of 2.");
        #start of wave 7
        $namedVII = $namedVII + 1;
    }

    if($namedVII >= 3) {
        quest::ze(15, "Congdar Phase3 namedVII is 2 of 2, depop some untargetables, spawn different untargetables, 2 Doombringer_of_Saryrn, 2 Cutthtoat_of_Saryrn , 2 Dark_Knight_of_Saryrn, Templar_of_Saryrn and Warbeast_of_Saryrn.");
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
        $namedVII = 1;
    }

    if($signal == 8088) {
        quest::ze(15, "Congdar Phase3 signal is wave_eight_npccounter $wave_eight_npccounter of 8.");
        #sets counter to start 8th wave upon all 8 dying
        $wave_eight_npccounter = $wave_eight_npccounter + 1;
    }

    if($wave_eight_npccounter >= 9) {
        quest::ze(15, "Congdar Phase3 wave_eight_npccounter is 8 of 8, depop some untargetables, spawn Dreamwarp and Champion_of_Torment.");
        $wave_eight_npccounter = 1;
        #depopping
        #non target named Dreamwarp
        quest::depopall(223018);
        #non target named Champion_of_Torment
        quest::depopall(223019);
        #targetable NPC's Dreamwarp
        quest::spawn2(223066,0,0,1250.0,1085.0,351.0,192.0);
        #targetable NPC's Champion_of_Torment
        quest::spawn2(223065,0,0,1250.0,1135.0,351.0,192.0);
    }

    if($signal == 11080) {
        quest::ze(15, "Congdar Phase3 signal is namedVIII $namedVIII of 2.");
        #start of Last encounter with 2 guardians
        $namedVIII = $namedVIII + 1;
    }

    if($namedVIII >= 3) {
        quest::ze(15, "Congdar Phase3 signal is namedVIII $namedVIII of 2.");
        #targetable NPC's Avatar_of_Elements
        quest::spawn2(223073,0,0,1492.0,1110.0,369.0,195.5);
        #targetable NPC's Supernatural_Guardian
        quest::spawn2(223074,0,0,1563.0,1110.0,369.0,195.5);
        $namedVIII = 1;
    }

    if($signal == 11090) {
        quest::ze(15, "Congdar Phase3 signal is wave_nine_npccounter $wave_nine_npccounter of 8.");
        #counter to open portal to phase 4
        $wave_nine_npccounter = $wave_nine_npccounter + 1;
    }

    if($wave_nine_npccounter >= 3) {
        quest::ze(15, "Congdar Phase3 wave_nine_npccounter is 2 of 2 set portal3 flag for 1 hour, bye.");
        #Worlwide camera shake
        $npc->CameraEffect(3000, 6, 0, 1);
        #depopping
        quest::setglobal("portal3", "1", 7, "H1");
        $wave_nine_npccounter = 1;
        quest::depop();
    }
}
#END sub_EVENT_SIGNAL

