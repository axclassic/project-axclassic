sub EVENT_SPAWN {
     	quest::settimer("potstatus",900); #900
		
}

sub EVENT_TIMER {
	#quest::stoptimer("potstatus");
	if($timer eq "potstatus") {
		if(defined $qglobals{"blockout"}) {
      			quest::shout("Plane of Time B is currently occupied.");
		} else { 
      			quest::shout("Plane of Time B is currently empty and open for victims... Err ahem I meant visitors!");
  		}
 	}
		
       	$qglobals{potb_p1_start}=undef;
       	$qglobals{potb_p1_comp}=undef;
       	$qglobals{potb_p2_comp}=undef;
       	$qglobals{potb_p3_comp}=undef;
       	$qglobals{potb_p4_comp}=undef;
       	$qglobals{potb_p5_comp}=undef;
       	$qglobals{quarm_down}=undef;
}#END sub_EVENT_TIMER