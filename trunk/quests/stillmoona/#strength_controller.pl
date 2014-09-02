my $strength_event = 0;

 
  sub EVENT_SPAWN {
  $strength_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
  	if ($signal == 321) {
	 $strength_event += 1 # adds one to spawn variable # 
    }
    if ($signal == 322) {
	quest::spawn2(338164,0,0,-27.1,942.8,39.6,94.4);
	quest::spawn2(338164,0,0,7.5,942.8,39.6,165.1);
	quest::spawn2(338164,0,0,4.5,921.7,39.6,208.9);
	quest::spawn2(338164,0,0,-27.1,921.7,39.6,50.1);
	quest::spawn2(338164,0,0,-8.5,914.3,41.2,254.9);
	}
	if($signal == 323) { #signal 323 is from each of the An_Ancient_Protectors 
    $counter += 1;
      if($counter == 5) {
	quest::spawn2(338166,0,0,-8.5,936.5,39.6,130.6);
	quest::depop();
    } 
  }
 }
