# This is phase 3 trigger npcid - 223154
my $namedI;
my $namedII;
my $namedIII;
my $namedIV;
my $namedV;
my $namedVI;
my $namedVII;
my $namedVIII;
my $namedIX;

sub EVENT_SPAWN {
    $namedI = 0;
    $namedII = 0;
    $namedIII = 0;
    $namedIV = 0;
    $namedV = 0;
    $namedVI = 0;
    $namedVII = 0;
    $namedVIII = 0;
    $namedIX = 0;
    quest::signalwith(223111,1002,0); #flavor text
    quest::spawn2(223010,0,0,1280,1010,359.38,195); #16 non target nameds
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
	quest::spawn2(223005,0,0,1150.0,1135.0,351.7,192.5); #sametargetable NPC's A_Pig_of_War
	quest::spawn2(223005,0,0,1200.0,1185.0,352.2,192.5); #targetable NPC's A_Pig_of_War
	quest::spawn2(223005,0,0,1200.0,1135.0,351.0,192.5); #targetable NPC's A_Pig_of_War
	quest::spawn2(223005,0,0,1150.0,1085.0,351.0,192.5); #targetable NPC's A_Pig_of_War
	quest::spawn2(223006,0,0,1150.0,1035.0,352.0,192.5); #targetable NPC's A_Dark_Guardian_of_the_Warlord
	quest::spawn2(223006,0,0,1200.0,1035.0,351.5,192.5); #targetable NPC's A_Dark_Guardian_of_the_Warlord
	quest::spawn2(223006,0,0,1150.0,1195.0,351.6,192.5); #sametargetable NPC's A_Dark_Guardian_of_the_Warlord
	quest::spawn2(223006,0,0,1200.0,1085.0,351.0,192.5);
}

sub EVENT_SIGNAL {
	if($signal == 1011) { #sets counter to start 1st wave upon all 8 dying
		$wonpccounter+= 1;
		$waveoc = $wonpccounter;
		#quest::ze(15, "okay i signaled and my 1st counter is now $waveoc.");
	}
	if ($wonpccounter == 8) { # triggers #wave1.pl
		$wonpccounter = 0;
		#quest::ze(15, "okay all 8 are dead now do something!");
	
		#start wave1
		quest::depopall(223155); # A_Ferocious_Warboar
		quest::depopall(223156); # Deathbringer_Blackheart 
		#quest::depopall(223217); # #wave1.pl
		quest::spawn2(223009,0,0,1250,1085,359.5,192); #Deathbringer_Blackheart
		quest::spawn2(223008,0,0,1250,1135,359.5,192); #A_Ferocious_Warboar
	}
	
  if ($signal == 11010) { #1st two names
    $namedI += 1;
	}
  if ($namedI == 2) {
    #quest::spawn_condition("potimeb",3,1); # wave 2
    #quest::spawn2(223218,0,0,0,0,0,0); # wave counter
    quest::depopall(223016); #depop untargetable nameds
    quest::depopall(223017);
    quest::spawn2(223016,0,0,1250,1085,359.5,192); #pop non - targetable nameds in new locations
    quest::spawn2(223017,0,0,1250,1135,359.5,192);
	#8 target mobs
	quest::spawn2(223027,0,0,1150.0,1185.0,352.7,192.5); #targetable NPC's Archon_of_the_Plaquebringer
	quest::spawn2(223027,0,0,1200.0,1185.0,352.2,192.5); #targetable NPC's Archon_of_the_Plaquebringer
	quest::spawn2(223027,0,0,1150.0,1135.0,351.0,192.5); #targetable NPC's Archon_of_the_Plaquebringer
	quest::spawn2(223029,0,0,1150.0,1085.0,351.0,192.5); #targetable NPC's Revenant_of_the_Plaquebringer
	quest::spawn2(223030,0,0,1150.0,1035.0,352.0,192.5); #targetable NPC's Revenant_of_the_Plaquebringer
	quest::spawn2(223030,0,0,1200.0,1035.0,351.5,192.5); #targetable NPC's Revenant_of_the_Plaquebringer
	quest::spawn2(223029,0,0,1200.0,1085.0,351.0,192.5); #targetable NPC's Revenant_of_the_Plaquebringer
	quest::spawn2(223026,0,0,1200.0,1135.0,351.6,192.5); #targetable NPC's Incantator_of_the_Plaquebringer
	
    $namedI = 0;
    $namedII = 0;
}

#starts counter of wave 2
	if($signal == 2022) { #sets counter to start 3rd wave upon all 8 dying
		$wtwnpccounter+= 1;
		$wavetwc = $wtwnpccounter;
		#quest::ze(15, "okay i signaled and my 2nd counter is now $wavetwc.");
	}
	
	if ($wtwnpccounter == 8) { # triggers #wave3.pl
		$wtwnpccounter = 0;
		#quest::ze(15, "okay all 8 are dead now do something!");
		#depopping
		quest::depopall(223017); #non target named Kraksmaal_Fir`Dethsin
		quest::depopall(223016); #non target named Xeroan_Xi`Geruonask
		quest::spawn2(223025,0,0,1250.0,1085.0,351.0,192.0); #targetable named Xeroan_Xi`Geruonask
		quest::spawn2(223024,0,0,1250.0,1135.0,351.0,192.0); #targetable named Kraksmaal_Fir`Dethsin
	}

	if ($signal == 11020) {
    $namedII += 1;
	}
	if ($namedII == 2) { #start of wave 3
	
    quest::depopall(223022); #non target named A_Deadly_Warboar
    quest::depopall(223023);  #non target named Deathbringer_Skullsmash
    quest::spawn2(223022,0,0,1250.0,1135.0,359.5,192.0); #non target named A_Deadly_Warboar
	quest::spawn2(223023,0,0,1230.0,1085.0,359.5,192.0); #non target named Deathbringer_Skullsmash
	quest::spawn2(223034,0,0,1150.0,1185.0,352.7,192.5); #targetable NPC's A_Dark_Guardian_of_the_Warlord
	quest::spawn2(223035,0,0,1150.0,1135.0,351.6,192.5); #targetable NPC's A_Zek_Bloodtusk
	quest::spawn2(223035,0,0,1200.0,1185.0,352.2,192.5); #targetable NPC's A_Zek_Bloodtusk
	quest::spawn2(223033,0,0,1200.0,1135.0,351.0,192.5); #targetable NPC's A_Warlord_Zek
	quest::spawn2(223034,0,0,1200.0,1085.0,351.0,192.5); #targetable NPC's A_Dark_Guardian_of_the_Warlord
	quest::spawn2(223035,0,0,1150.0,1085.0,352.0,192.5); #targetable NPC's A_Zek_Bloodtusk
	quest::spawn2(223034,0,0,1200.0,1035.0,351.5,192.5); #targetable NPC's A_Dark_Guardian_of_the_Warlord
	quest::spawn2(223034,0,0,1150.0,1035.0,352.0,192.5); #targetable NPC's A_Dark_Guardian_of_the_Warlord
	
    $namedI = 0;
    $namedII = 0;
	}
#starts counter of wave 3
	if($signal == 3033) { #sets counter to start 4th wave upon all 8 dying
		$wthnpccounter+= 1;
		$wavethc = $wthnpccounter;
		#quest::ze(15, "okay i signaled and my 3rd counter is now $wavethc.");
	}
	
	if ($wthnpccounter == 8) { # triggers #wave4.pl
		$wthnpccounter = 0;
		#quest::ze(15, "okay all 8 are dead now do something!");
		#depopping
		quest::depopall(223022); #non target named A_Deadly_Warboar
		quest::depopall(223023);  #non target named Deathbringer_Skullsmash
		quest::spawn2(223031,0,0,1250.0,1085.0,351.0,192.0); #targetable NPC's Deathbringer Skulls
		quest::spawn2(223032,0,0,1250.0,1135.0,351.0,192.0); #targetable NPC's A_Deadly_Warboar
	}
	if ($signal == 11030) { #start of wave 4
		$namedIII += 1;
	}
	if ($namedIII == 2) { #start of wave 3
    quest::depopall(223012); #non target named Sinrunal_Gorgedreal
	quest::depopall(223013); #non target named Herlsoakian
    quest::spawn2(223012,0,0,1250.0,1085.0,359.5,192.0); #non target named Sinrunal_Gorgedreal
	quest::spawn2(223013,0,0,1250.0,1135.0,359.5,192.0); #non target named Herlsoakian
	quest::spawn2(223043,0,0,1200.0,1185.0,352.2,192.5); #targetable NPC's A_Ferocious_Cube_Phantasmist
	quest::spawn2(223043,0,0,1200.0,1135.0,351.0,192.5); #targetable NPC's A_Ferocious_Cube_Phantasmist
	quest::spawn2(223043,0,0,1150.0,1185.0,351.0,192.5); #targetable NPC's A_Ferocious_Cube_Phantasmist
	quest::spawn2(223044,0,0,1150.0,1035.0,351.5,192.5); #targetable NPC's A_Ferocious_Cube_Phantasmist
	quest::spawn2(223042,0,0,1200.0,1035.0,351.0,192.5); #targetable NPC's A_Ferocious_Cube_Formation
	quest::spawn2(223040,0,0,1200.0,1085.0,351.6,192.5); #targetable NPC's Vanquisher_of_the_Faceless
	quest::spawn2(223040,0,0,1150.0,1135.0,351.6,192.5); #targetable NPC's Vanquisher_of_the_Faceless
	quest::spawn2(223039,0,0,1150.0,1085.0,352.0,192.5); #targetable NPC's Battlemaster_of_the_Faceless
    $namedIII = 0;
	}
	#starts counter of wave 4
	if($signal == 4044) { #sets counter to start 4th wave upon all 8 dying
		$wfourcounter+= 1;
		$wfourc = $wfourcounter;
		#quest::ze(15, "okay i signaled and my 4th counter is now $wfourc.");
	}
	if ($wfourcounter == 8) { # triggers 4th
		$wfourcounter = 0;
		#quest::ze(15, "okay all 8 are dead now do something!");
		#depopping
		quest::depopall(223012); #non target named Sinrunal_Gorgedreal
		quest::depopall(223013); #non target named Herlsoakian
		quest::spawn2(223038,0,0,1250.0,1085.0,351.0,192.0); #targetable NPC's Sinrunal_Gorgedreal
		quest::spawn2(223037,0,0,1250.0,1135.0,351.0,192.0); #targetable NPC's Herlsoakian
	}
	if ($signal == 11040) { #start of wave 5
		$namedIV += 1;
	}
	if ($namedIV == 2) { #start of wave 5
    quest::depopall(223012); #non target named Sinrunal_Gorgedreal
	quest::depopall(223013); #non target named Herlsoakian
    quest::spawn2(223010,0,0,1250.0,1085.0,359.9,192.0); #non target named A_Needletusk_Warboar
	quest::spawn2(223011,0,0,1250.0,1135.0,359.9,192.0); #non target named Deathbringer_Rianit
	quest::spawn2(223049,0,0,1150.0,1185.0,352.7,192.5); #targetable NPC's A_Warboar_of_Suffering
	quest::spawn2(223049,0,0,1200.0,1135.0,351.0,192.5); #targetable NPC's A_Warboar_of_Suffering
	quest::spawn2(223049,0,0,1150.0,1085.0,351.0,192.5); #targetable NPC's A_Warboar_of_Suffering
	quest::spawn2(223049,0,0,1200.0,1035.0,351.5,192.5); #targetable NPC's A_Warboar_of_Suffering
	quest::spawn2(223048,0,0,1150.0,1035.0,352.0,192.5); #targetable NPC's A_Minion_of_the_Warlord
	quest::spawn2(223048,0,0,1200.0,1085.0,351.0,192.5); #targetable NPC's A_Minion_of_the_Warlord
	quest::spawn2(223048,0,0,1150.0,1135.0,351.6,192.5); #targetable NPC's A_Minion_of_the_Warlord
	quest::spawn2(223048,0,0,1200.0,1185.0,352.2,192.5); #targetable NPC's A_Minion_of_the_Warlord
    $namedIV = 0;
	}
	
	if ($signal == 5055) { #sets counter to start 6th wave upon all 8 dying
		$wfivecounter+= 1;
		$wfivec = $wfivecounter;
		#quest::ze(15, "okay i signaled and my 5th counter is now $wfivec.");
	}
	if ($wfivecounter == 8) {
		$wfivecounter = 0;
		#quest::ze(15, "okay all 8 are dead now do something!");
		#depopping
		quest::depopall(223010); #non target named A_Needletusk_Warboar
		quest::depopall(223011); #non target named Deathbringer_Rianit
		quest::spawn2(223047,0,0,1250.0,1085.0,351.0,192.0); #targetable NPC's A_Needletusk_Warboar
		quest::spawn2(223046,0,0,1250.0,1135.0,351.0,192.0); #targetable NPC's Deathbringer_Rianit
	}
	if ($signal == 11050) { #start of wave 6
		$namedV += 1;
	}
	if ($namedV == 2) {
    quest::depopall(223015); #non target named Dersool_Fal`Giersnaol
	quest::depopall(223014); #non target named Xerskel_Gerodnsal
    quest::spawn2(223014,0,0,1250.0,1135.0,359.5,192.0); #non target named Xerskel_Gerodnsal
	quest::spawn2(223015,0,0,1250.0,1085.0,359.5,192.0); #non target named Dersool_Fal`Giersnaol
	quest::spawn2(223052,0,0,1145.0,1080.0,352.7,192.5); #targetable NPC's Assassin_of_Hate
	quest::spawn2(223055,0,0,1200.0,1185.0,352.2,192.5); #targetable NPC's Dark_Priest_of_Innoruuk
	quest::spawn2(223056,0,0,1150.0,1135.0,351.6,192.5); #targetable NPC's Dark_Priest_of_Innoruuk
	quest::spawn2(223055,0,0,1200.0,1135.0,351.0,192.5); #targetable NPC's Dark_Priest_of_Innoruuk
	quest::spawn2(223056,0,0,1150.0,1185.0,351.0,192.5); #targetable NPC's Dark_Priest_of_Innoruuk
	quest::spawn2(223055,0,0,1200.0,1085.0,351.0,192.5); #targetable NPC's Dark_Priest_of_Innoruuk
	quest::spawn2(223056,0,0,1150.0,1035.0,352.0,192.5); #targetable NPC's Dark_Priest_of_Innoruuk
	quest::spawn2(223052,0,0,1200.0,1035.0,351.5,192.5); #targetable NPC's Assassin_of_Hate
	$namedV = 0;
	}
	if ($signal == 6066) { #sets counter to start 6th wave upon all 8 dying
		$wsixcounter+= 1;
		$wsixc = $wsixcounter;
		#quest::ze(15, "okay i signaled and my 6th counter is now $wsixc.");
	}
	if ($wsixcounter == 8) {
		$wsixcounter = 0;
		#quest::ze(15, "okay all 8 are dead now do something!");
		#depopping
		quest::depopall(223014); #non target named Xerskel_Gerodnsal
		quest::depopall(223015); #non target named Dersool_Fal`Giersnaol
		quest::spawn2(223050,0,0,1250.0,1085.0,359.5,192.0); #targetable NPC's Dersool_Fal`Giersnaol
		quest::spawn2(223051,0,0,1250.0,1135.0,359.5,192.0); #targetable NPC's Xerskel_Gerodnsal
	}
	if ($signal == 11060) { #start of wave 7
		$namedVI += 1;
	}
	if ($namedVI == 2) {
    quest::depopall(223020); #non target named Dark_Knight_of_Terris
	quest::depopall(223021); #non target named Undead_Squad_Leader
    quest::spawn2(223020,0,0,1250.0,1085.0,359.5,192.0); #non target named Dark_Knight_of_Terris
	quest::spawn2(223021,0,0,1250.0,1135.0,359.5,192.0); #non target named Undead_Squad_Leader
	quest::spawn2(223059,0,0,1150.0,1185.0,352.7,192.5); #targetable NPC's Undead_Pawn_of_Terris
	quest::spawn2(223060,0,0,1200.0,1185.0,352.2,192.5); #targetable NPC's Undead_Pawn_of_Terris
	quest::spawn2(223059,0,0,1150.0,1035.0,352.0,192.5); #targetable NPC's Undead_Pawn_of_Terris
	quest::spawn2(223059,0,0,1200.0,1035.0,351.5,192.5); #targetable NPC's Undead_Pawn_of_Terris
	quest::spawn2(223062,0,0,1200.0,1085.0,351.0,192.5); #targetable NPC's A_Hobgoblin_Servant
	quest::spawn2(223063,0,0,1200.0,1135.0,351.0,192.5); #targetable NPC's Knight_of_Nightmare
	quest::spawn2(223064,0,0,1150.0,1135.0,351.6,192.5); #targetable NPC's Knight_of_Nightmare
	quest::spawn2(223064,0,0,1150.0,1085.0,351.0,192.5); #targetable NPC's Knight_of_Nightmare
    $namedVI = 0;
	}
	if ($signal == 7077) { #sets counter to start 7th wave upon all 8 dying
		$wsevcounter+= 1;
		$wsevc = $wsevcounter;
		#quest::ze(15, "okay i signaled and my 7th counter is now $wsevc.");
	}
	if ($wsevcounter == 8) {
		$wsevcounter = 0;
		#quest::ze(15, "okay all 8 are dead now do something!");
		#depopping
		quest::depopall(223020); #non target named Dark_Knight_of_Terris
		quest::depopall(223021); #non target named Undead_Squad_Leader
		quest::spawn2(223058,0,0,1250.0,1085.0,351.0,192.0); #targetable NPC's Dark_Knight_of_Terris
		quest::spawn2(223057,0,0,1250.0,1135.0,351.0,192.0); #targetable NPC's Undead_Squad_Leader
	}
	
	if ($signal == 11070) { #start of wave 7
		$namedVII += 1;
	}
	if ($namedVII == 2) {
    quest::depopall(223018); #non target named Dreamwarp
	quest::depopall(223019); #non target named Champion_of_Torment
    quest::spawn2(223018,0,0,1250.0,1085.0,359.5,192.0); #non target named Dreamwarp
	quest::spawn2(223019,0,0,1250.0,1135.0,359.5,192.0); #non target named Champion_of_Torment
	quest::spawn2(223068,0,0,1150.0,1185.0,352.7,192.5); #targetable NPC's Cutthtoat_of_Saryrn
	quest::spawn2(223069,0,0,1200.0,1185.0,352.2,192.5); #targetable NPC's Dark_Knight_of_Saryrn
	quest::spawn2(223072,0,0,1200.0,1135.0,351.0,192.5); #targetable NPC's Doombringer_of_Saryrn
	quest::spawn2(223072,0,0,1150.0,1135.0,351.6,192.5); #targetable NPC's Doombringer_of_Saryrn
	quest::spawn2(223071,0,0,1150.0,1035.0,352.0,192.5); #targetable NPC's Templar_of_Saryrn
	quest::spawn2(223068,0,0,1200.0,1035.0,351.5,192.5); #targetable NPC's Cutthtoat_of_Saryrn
	quest::spawn2(223069,0,0,1150.0,1085.0,351.0,192.5); #targetable NPC's Dark_Knight_of_Saryrn
	quest::spawn2(223067,0,0,1200.0,1085.0,351.0,192.5); #targetable NPC's Warbeast_of_Saryrn
    $namedVII = 0;
	}
	if ($signal == 8088) { #sets counter to start 8th wave upon all 8 dying
		$weigcounter+= 1;
		$weigc = $weigcounter;
		#quest::ze(15, "okay i signaled and my 8th counter is now $weigc.");
	}
	if ($weigcounter == 7) {
		$weigcounter = 0;
		#quest::ze(15, "okay all 7 are dead now do something!");
		#depopping
		quest::depopall(223018); #non target named Dreamwarp
		quest::depopall(223019); #non target named Champion_of_Torment
		quest::spawn2(223066,0,0,1250.0,1085.0,351.0,192.0); #targetable NPC's Dreamwarp
		quest::spawn2(223065,0,0,1250.0,1135.0,351.0,192.0); #targetable NPC's Champion_of_Torment
	}
	if ($signal == 11080) { #start of Last encounter with 2 guardians
		$namedVIII += 1;
	}
	if ($namedVIII == 2) {
	quest::spawn2(223073,0,0,1492.0,1110.0,369.0,195.5); #targetable NPC's Avatar_of_Elements
	quest::spawn2(223074,0,0,1563.0,1110.0,369.0,195.5); #targetable NPC's Supernatural_Guardian
	$namedVIII = 0;
	}
	if ($signal == 11090) { #counter to open portal to phase 4
		$wnincounter+= 1;
		$wninc = $wnincounter;
		#quest::ze(15, "okay counter is unlocked $wninc.");
	}
	if ($wnincounter == 2) {
		
		$npc->CameraEffect(3000, 6, 0, 1); #Worlwide camera shake
		quest::we(14, "Congratulations, phase 3 has been completed! Move through the portal to phase 4.");
		#depopping
		quest::setglobal("portal3", 1, 7, "H1");
		$wnincounter = 0;
		#quest::depop(); if you want to make it clean uncheck this when going live.
	}

}#END sub_EVENT_SIGNAL
	
 sub EVENT_CLICKDOOR {
}

sub EVENT_TIMER {
}