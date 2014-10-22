my $storm_chaser_event = 0;

 
  sub EVENT_SPAWN {
  $storm_chaser_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
  if($signal == 2005) {
  $storm_chaser_event += 1; # adds one to spawn variable # 
  }
  if($signal == 2010) { ##signal 2010 is from each of the storm chasers killed##
    $counter += 1;
	   if($counter == 2) {
	quest::spawn2(340135,340077,0,199.2,1279.1,-23.9,126.1);
    quest::spawn2(340135,340078,0,218.8,1281.4,-20.7,111);
    quest::spawn2(340135,340079,0,240.3,1280.4,-16.3,131.9);
    }	
	if($signal == 2010) { ##signal 2015 is from Thunderheads killed##
      if($counter == 6) {
	quest::spawn2(340136,340078,0,218.8,1281.4,-20.7,111); ##spawn Raging Thunderhead##
	quest::depop(340137);
	quest::depop();
	}