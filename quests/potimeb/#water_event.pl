#This is an invisible controller which spawns the water mobs
# #water_event (223189)

my $phase1_water_npcevent = 1;

sub EVENT_SPAWN {
    $phase1_water_npcevent = 1;
    # a_regrua_defender (223192)
    quest::ze(15, "Congdar pawning 3 a_regrua_defender"); 
    quest::spawn2(223192,0,0,68,867,495,185.5);
    quest::spawn2(223192,0,0,68,877,495,185.5);
    quest::spawn2(223192,0,0,68,857,495,185.5);
}  

sub EVENT_SIGNAL {
	if($signal == 14039) {
        quest::ze(15, "Congdar water_event signaled phase1_water_npccounter is $phase1_water_npccounter out of 9."); 
		$phase1_water_npcevent = $phase1_water_npcevent + 1;
	}

    if($phase1_water_npcevent >= 10) {
        quest::ze(15, "Congdar $phase1_water_npccounter 9 of 9 so spawn Anar_of_Wate (223104) and a_regrua_defender.");
        #Anar_of_Water
		quest::spawn2(223104,0,0,68,867,495,185.5);
		quest::spawn2(223192,0,0,68,887,495,185.5);
		$phase1_water_npcevent = 1;
	}

    if($signal == 14038) {
        #if anar-of-water dies this triggers the counter
        #tell main about event success
        quest::ze(15, "Congdar signalling phase1 trigger, bye."); 
		quest::signalwith(223177, 14060, 2000);
        $phase1_water_npcevent = 1;
		quest::depop();
	}
}

