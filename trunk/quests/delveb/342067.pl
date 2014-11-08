my $tirranun_event = 0;

 
  sub EVENT_SPAWN {
  $tirranun_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
    if ($signal == 101) {
	$tirranun_event += 1; # adds one to spawn variable # 
	}
	if($signal == 102) { ##signal 102 is from each Whorl_of_searing_ashes##
    $counter += 1;
	   if($counter == 4) {
	quest::depop(342066); 
	quest::spawn2(342068,0,0,-747.6,2889.5,39.9,37.7); 
	quest::depop;
	}
   }
 }