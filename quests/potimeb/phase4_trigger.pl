# phase4_trigger.pl npcid - 223157

my $godcounterI;

sub EVENT_SPAWN {
    $godcounterI = 0;

    quest::signalwith(223111,1003,0); #flavor
    quest::spawn2(223075,0,0,-310,307,365,95); #Terris Thule
    quest::spawn2(223076,0,0,-320,-316,358,32.5); #Saryrn
    quest::spawn2(223077,0,0,405,-84,358,192); #Tallon Zek
    quest::spawn2(223078,0,0,405,75,358,192); #Vallon Zek
	#quest::spawn2(223997, 0, 0, 1633, 1108, 371, 192);#phase3_flag
}    
    
sub EVENT_SIGNAL {
	if ($signal == 12010) {
	$godcounterI += 1;
	}
	if ($signal == 12011) { #depop Vallons crew after his death
	$godcounterI += 1;
	#quest::settimer("vallon",300);
	}
	if ($signal == 12012) { #depop Saryrns crew after her death
	$godcounterI += 1;
	#quest::settimer("saryrn",1800);
	}
	if ($signal == 12013) { #depop Terris crew after her death
	$godcounterI += 1;
	#quest::settimer("terris",1800);
	}
	if ($godcounterI == 4) { #event success
	quest::ze(15, "You are halfway through this phase. Click on the fountain to continue.");
	quest::setglobal("portal4",1, 7, "H1"); #sets flag to portal through fountain
	$godcounterI = 0;
	}

}

sub EVENT_TIMER {
}
