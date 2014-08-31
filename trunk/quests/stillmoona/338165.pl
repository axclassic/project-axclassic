my $strength_event = 0;
 
  sub EVENT_SPAWN {
  $strength_event = 0;
  }
sub_EVENT_SIGNAL {
    if ($signal == 321) {
   	quest::spawn2(338164,0,0,-27.1,942.8,39.6,94.4);
	quest::spawn2(338164,0,0,7.5,942.8,39.6,165.1);
	quest::spawn2(338164,0,0,4.5,921.7,39.6,208.9);
	quest::spawn2(338164,0,0,-27.1,921.7,39.6,50.1);
	quest::spawn2(338164,0,0,-808,944.8,39.6,124.2);
	}
	if ($signal == 322) {
	 $strength_event += 1 # adds one to spawn variable # 
	 }
	if ($signal == 323) {
    if ($strength_event == 5){ # looks for 5 dead#
    quest::spawn2(338166,0,0,-8.5,936.5,39.6,130.6);
    } 
  }
 } 