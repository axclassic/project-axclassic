my $autum_rose_event = 0;

 
  sub EVENT_SPAWN {
  $autum_rose_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
    if($signal == 872) { ##signal 872 is that Sensei Gnarlshadow has spawned##
    quest::depop(); 
    }	
    if ($signal == 870) {
	 $autum_rose_event += 1; # adds one to spawn variable # 
	}
	if($signal == 871) { ##signal 871 is from each of the assassins killed##
    $counter += 1;
	   if($counter == 10) {
	quest::spawn2(340089,0,0,2475.2,-258.5,175.4,204.9);
    }	
	if($signal == 871) { ##signal 871 is from Poison Brewer Ishi killed##
      if($counter == 11) {
	quest::spawn2(340088,0,0,1013.1,-472.3,148.1,66.5); 
	}
 }
 }
 }

 