my $tirranun_event = 0;

 
  sub EVENT_SPAWN {
  $tirranun_event = 0;
  $counter = undef;
  quest::spawn2(342065,0,0,-337.6,2879.8,102.6,127.1);
  quest::spawn2(342065,0,0,-266.3,3013.1,93.1,147.1);
  quest::spawn2(342065,0,0,-412.1,3206.2,29.3,107);
  quest::spawn2(342065,0,0,-733.1,3126.1,33.2,44.6);
  }
sub EVENT_SIGNAL {
    if($signal == 102) { ##signal 102 is from each Whorl_of_searing_ashes##
    $counter += 1;
	   if($counter == 4) {
	quest::depop(342063); 
	quest::spawn2(342068,0,0,-747.6,2889.5,39.9,37.7); 
	quest::depop();
	}
	
  }
 } 