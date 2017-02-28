# phase5_trigger.pl npcid - 223158

my $godcounterII;

sub EVENT_SPAWN {
    $godcounterII = 0;
    quest::signalwith(223111,1004,0); #flavor
	
    quest::spawn2(223098,0,0,-299,-297,23.3,31); #Fake Bertoxxulous
    quest::spawn2(223165,0,0,-257,255,6,101.5); #Fake Cazic
    quest::spawn2(223000,0,0,303.3,306,13.3,161.5); #Fake Innoruuk
    quest::spawn2(223001,0,0,264,-279,18.75,217.5); #Fake Rallos
    #real mobs
	quest::spawn2(223196,0,0,-92.6,-153.0,1.0,0.0); #targetable NPC's Guardian_Knight_of_Pestilence
	quest::spawn2(223196,0,0,-92.6,-173.0,1.0,0.0); #targetable NPC's Guardian_Knight_of_Pestilence
	quest::spawn2(223196,0,0,-92.6,-213.0,1.0,0.0); #targetable NPC's Guardian_Knight_of_Pestilence
	quest::spawn2(223196,0,0,-92.6,-233.0,1.0,0.0); #targetable NPC's Guardian_Knight_of_Pestilence
	quest::spawn2(223195,0,0,-111.6,-153.0,1.0,0.0); #targetable NPC's A_Firebone_Caster
	quest::spawn2(223195,0,0,-111.6,-173.0,1.0,0.0); #targetable NPC's A_Firebone_Caster
	quest::spawn2(223195,0,0,-111.6,-213.0,1.0,0.0); #targetable NPC's A_Firebone_Caster
	quest::spawn2(223195,0,0,-111.6,-233.0,1.0,0.0); #targetable NPC's A_Firebone_Caster
	quest::spawn2(223195,0,0,-130.6,-173.0,1.0,0.0); #targetable NPC's A_Firebone_Caster
	quest::spawn2(223195,0,0,-130.6,-213.0,1.0,0.0); #targetable NPC's A_Firebone_Caster
	quest::spawn2(223194,0,0,-111.6,-192.0,1.0,0.0); #targetable NPC's Guardian_of_the_Crypt
	quest::spawn2(223003,0,0,82.6,-153.0,1.0,0.0); #targetable NPC's a_summoned_boar
	quest::spawn2(223003,0,0,82.6,-173.0,1.0,0.0); #targetable NPC's a_summoned_boar
	quest::spawn2(223003,0,0,82.6,-193.0,1.0,0.0); #targetable NPC's a_summoned_boar
	quest::spawn2(223003,0,0,101.6,-153.0,1.0,0.0); #targetable NPC's a_summoned_boar
	quest::spawn2(223003,0,0,101.6,-173.0,1.0,0.0); #targetable NPC's a_summoned_boar
	quest::spawn2(223003,0,0,120.6,-173.0,1.0,0.0); #targetable NPC's a_summoned_boar
	quest::spawn2(223002,0,0,82.6,-213.0,1.0,0.0); #targetable NPC's a_summoned_minion
	quest::spawn2(223002,0,0,82.6,-233.0,1.0,0.0); #targetable NPC's a_summoned_minion
	quest::spawn2(223002,0,0,106.6,-193.0,1.0,0.0); #targetable NPC's a_summoned_minion
	quest::spawn2(223002,0,0,82.6,-213.0,1.0,0.0); #targetable NPC's a_summoned_minion
	quest::spawn2(223002,0,0,106.6,-213.0,1.0,0.0); #targetable NPC's a_summoned_minion
	quest::spawn2(223002,0,0,101.6,-233.0,1.0,0.0); #targetable NPC's a_summoned_minion
	quest::spawn2(223002,0,0,120.6,-213.0,1.0,0.0); #targetable NPC's a_summoned_minion
	quest::spawn2(223197,0,0,145.6,103.5,1.0,185.5); #targetable NPC's Cleric_of_Innoruuk
	quest::spawn2(223197,0,0,165.6,103.5,1.0,185.5); #targetable NPC's Cleric_of_Innoruuk
	quest::spawn2(223197,0,0,185.6,103.5,1.0,185.5); #targetable NPC's Cleric_of_Innoruuk
	quest::spawn2(223197,0,0,205.6,103.5,1.0,185.5); #targetable NPC's Cleric_of_Innoruuk
	quest::spawn2(223197,0,0,145.6,122.5,1.0,185.5); #targetable NPC's Cleric_of_Innoruuk
	quest::spawn2(223197,0,0,165.6,122.5,1.0,185.5); #targetable NPC's Cleric_of_Innoruuk
	quest::spawn2(223197,0,0,165.6,141.5,1.0,185.5); #targetable NPC's Cleric_of_Innoruuk
	quest::spawn2(223198,0,0,145.6,141.5,1.0,185.5); #targetable NPC's an_abhorrent
	quest::spawn2(223198,0,0,225.6,103.5,1.0,185.5); #targetable NPC's an_abhorrent
	quest::spawn2(223198,0,0,185.6,122.5,1.0,185.5); #targetable NPC's an_abhorrent
	quest::spawn2(223198,0,0,205.6,122.5,1.0,185.5); #targetable NPC's an_abhorrent
	quest::spawn2(223198,0,0,225.6,122.5,1.0,185.5); #targetable NPC's an_abhorrent
	quest::spawn2(223198,0,0,205.6,141.5,1.0,185.5); #targetable NPC's an_abhorrent
	quest::spawn2(223199,0,0,-122.6,148.5,1.0,128.0); #targetable NPC's Amygdalan knight
	quest::spawn2(223199,0,0,-122.6,168.5,1.0,128.0); #targetable NPC's Amygdalan knight
	quest::spawn2(223199,0,0,-122.6,188.5,1.0,128.0); #targetable NPC's Amygdalan knight
	quest::spawn2(223199,0,0,-141.6,148.5,1.0,128.0); #targetable NPC's Amygdalan knight
	quest::spawn2(223199,0,0,-122.6,168.5,1.0,128.0); #targetable NPC's Amygdalan knight
	quest::spawn2(223199,0,0,-160.6,168.5,1.0,128.0); #targetable NPC's Amygdalan knight
	quest::spawn2(223200,0,0,-122.6,208.5,1.0,128.0); #targetable NPC's phoboplasm
	quest::spawn2(223200,0,0,-122.6,228.5,1.0,128.0); #targetable NPC's phoboplasm
	quest::spawn2(223200,0,0,-141.6,188.5,1.0,128.0); #targetable NPC's phoboplasm
	quest::spawn2(223200,0,0,-141.6,208.5,1.0,128.0); #targetable NPC's phoboplasm
	quest::spawn2(223200,0,0,-141.6,228.5,1.0,128.0); #targetable NPC's phoboplasm
	quest::spawn2(223200,0,0,-160.6,208.5,1.0,128.0); #targetable NPC's phoboplasm
}

sub EVENT_SIGNAL {
	if($signal == 1234) { #sets counter before last 4 gods up
		$lastcounter += 1;
		$lastlast = $lastcounter;
		#quest::ze(15, "okay i signaled last counter it is $lastlast.");
	}
	if($lastcounter == 49) {
	$lastcounter = 0;
	quest::depopall(223098);
    quest::depopall(223165);
    quest::depopall(223000);
    quest::depopall(223001);
	quest::spawn2(223142,0,0,-299,-297,23.3,31); #Real Bertoxxulous
    quest::spawn2(223166,0,0,-257,255,6,101.5); #Real Cazic
    quest::spawn2(223167,0,0,303.3,306,13.3,161.5); #Real Innoruuk
    quest::spawn2(223168,0,0,264,-279,18.75,217.5); #Real Rallos
	}
	
	if ($signal == 13010) {
    $godcounterII += 1;
	}
	if ($godcounterII == 4) { #event success
	$npc->CameraEffect(3000, 6, 0, 1); #Worlwide camera shake
	##quest::we is bugged
    ##quest::we(14, "Congratulations to $name with the completion of phase 4. The 5th and final phase is in the next room through the fountain.");
    quest::setglobal("portal5",1,7,"H1"); #sets flag for final phase to Quarm
    $godcounterII = 0;
	}
}

sub EVENT_TIMER {
}