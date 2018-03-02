##zonecontroller.pl ID 87168 in Burning Woods##
sub EVENT_SIGNAL {
     if($signal == 463) {
	quest::depopall(87162); 
	quest::depopall(87163);
	quest::depopall(87164);
	quest::depopall(87165);
	quest::depopall(87166);
	quest::depopall(87167);
	}
	elsif($signal == 464) {
	quest::spawn2(87162,0,0,-3020.7,2228.3,-375.3,137.9);
	quest::spawn2(87163,0,0,-2964.4,2211.1,-376.4,150.8);
	quest::spawn2(87163,0,0,-2976.3,2168,-378.9,151.3);
	quest::spawn2(87163,0,0,-3061.8,2233.2,-375.1,112);
	quest::spawn2(87163,0,0,-3050.6,2185.6,-377.9,103.6);
	}
	elsif($signal == 465) {
	quest::spawn2(87164,0,0,-3020.7,2228.3,-375.3,137.9);
	quest::spawn2(87165,0,0,-2964.4,2211.1,-376.4,150.8);
	quest::spawn2(87165,0,0,-2976.3,2168,-378.9,151.3);
	quest::spawn2(87165,0,0,-3061.8,2233.2,-375.1,112);
	quest::spawn2(87165,0,0,-3050.6,2185.6,-377.9,103.6);
	}
	elsif($signal == 466) {
	quest::spawn2(87166,0,0,-3020.7,2228.3,-375.3,137.9);
	quest::spawn2(87167,0,0,-2964.4,2211.1,-376.4,150.8);
	quest::spawn2(87167,0,0,-2976.3,2168,-378.9,151.3);
	quest::spawn2(87167,0,0,-3061.8,2233.2,-375.1,112);
	quest::spawn2(87167,0,0,-3050.6,2185.6,-377.9,103.6);
	}
	 else {
	#Do Nothing;
	}
	}