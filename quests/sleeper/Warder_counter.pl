sub EVENT_SIGNAL {
    if ($signal == 1281) {
	 $Warder_event += 1; # adds one to spawn variable # 
	 }
	if($signal == 1282) { ##signal 1282 is from each Warder##
    $counter += 1;
	quest::shout("signal recieved!");
	   if($counter == 1) {
	quest::depop(128114);
	quest::spawn2(128089,1,0,-1499,-2344.8,-1052.8,0);
	quest::depop();
	}
	}
	}