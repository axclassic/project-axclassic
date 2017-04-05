##Falto_Control 210552 ##
my $falto_event = 0;

 sub EVENT_SPAWN {
  $falto_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
	if ($signal == 212) {
	 $falto_event += 1; # adds one to spawn variable # 
	}
    if($signal == 215) { ##signal 215 is from each a_fiery_mepheeka ##
	$counter += 1;
	   if($counter == 51) {
	quest::depopall(210547);
    quest::depopall(210548);
    quest::depopall(210549);	
	quest::spawn2(210546,0,0,-518.8,5393.2,-460.2,160.9);   
	quest::depop(); 
	}
   }
 }
 