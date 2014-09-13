my $scales_of_justice_event = 0;

sub EVENT_SPAWN { 
    $scales_of_justice_event = 0;
    $counter = undef;
	}
sub EVENT_SIGNAL {
  	if ($signal == 821) {
	 $scales_of_justice_event += 1 # adds one to spawn variable # 
	 }
	 if ($signal == 825) {
	quest::depop();
    }
	if($signal == 822) { #signal 822 is from each of the dead npc's
    $counter += 1;
      if($counter == 2) {	
	quest::signalwith(338216,823,0);
	quest::signalwith(338203,827.0);
    }
 }
}