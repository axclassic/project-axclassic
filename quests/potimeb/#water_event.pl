#This is an invisible controller which spawns the water mobs
#npcid - 223189

sub EVENT_SPAWN {
    $wnpccounter = 0;
    quest::spawn2(223192,0,0,68,867,495,185.5); #a_regrua_defender
    quest::spawn2(223192,0,0,68,877,495,185.5); #a_regrua_defender
    quest::spawn2(223192,0,0,68,857,495,185.5);
}  

sub EVENT_SIGNAL {
	if($signal == 14039) {
		$wnpccounter += 1;
		$waterc = $wnpccounter;
		#quest::ze(15, "okay i signaled and my counte ris now $waterc.");
	}

    if($wnpccounter == 3) {
		quest::spawn2(223104,0,0,68,867,495,185.5); #Anar_of_Water
		quest::spawn2(223192,0,0,68,887,495,185.5);
		$wnpccounter = 0;
	}

    if($signal == 14038) { #if anar-of-water dies this triggers the counter
		quest::signalwith(223177,14060,0); #tell main about event success
		quest::depop();
	}
}

