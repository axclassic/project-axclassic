my $scales_of_justice_event = 0;

sub EVENT_SPAWN { 
    $scales_of_justice = 0;
    $counter = undef;
	}
sub EVENT_SIGNAL {
  	if ($signal == 821) {
	 $scales_of_justice_event += 1; # adds one to spawn variable # 
	}
	if ($signal == 825) {
	quest::depop();
    }
	if($signal == 822) { #signal 822 is from each of the dead npc's
    $counter += 1;
      if($counter == 2) {	
	quest::spawn2(338207,0,0,257.7,865.3,6.1,92.3); #a_drake_usurper
	quest::signalwith(338202,823,0);
    }
 }
}