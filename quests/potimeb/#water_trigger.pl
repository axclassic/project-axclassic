##water_trigger this is an invisible controller that triggers #water_event.pl
# npcid - 223172

my $wnpccounter = 0;
my $waterc = 0;

sub EVENT_SPAWN { # This spawns water 2nd grp + boss for phase 2
	quest::spawn2(223123,0,0,252.0,884.0,491.0,192.5);
	quest::spawn2(223126,0,0,242.0,879.0,491.3,192.5);
	quest::spawn2(223153,0,0,232.0,874.0,491.7,192.5);
	quest::spawn2(223148,0,0,252.0,874.0,491.1,192.5);
	quest::spawn2(223148,0,0,242.0,869.0,491.6,192.5); # Not triggering for some reason
	quest::spawn2(223132,0,0,252.0,864.0,491.3,192.5);
	quest::spawn2(223153,0,0,232.0,864.0,492.0,192.5);
	quest::spawn2(223148,0,0,242.0,859.0,491.5,192.5);
	quest::spawn2(223148,0,0,252.0,854.0,491.0,192.5);
	quest::spawn2(223096,0,0,262.0,869.0,491.0,192.5); # Boss War_Shapen_Emissary
}

sub EVENT_SIGNAL { #like water_counter.pl starts a counter for when all are dead, then opens inner doors!
	if($signal == 14035) { #This signal are from these mobs upon death!
		$wnpccounter += 1;
		$waterc = $wnpccounter;
		#quest::ze(15, "okay i signaled and my counter is now $waterc.");
	}	

    if($wnpccounter == 10) { # phase_trigger script npcid - 223191
		quest::signalwith(223191, 14035, 0);
		$wnpccounter = 0;
		quest::depop();
	}
}

#sub EVENT_ENTER {
   # quest::settimer("water",1); #1 sec after first player enters event starts
   # quest::clear_proximity();
#}

#sub EVENT_TIMER {
	# if($timer eq "water") {
		# quest::spawn2(223189,0,0,-129.6,1720,547,0); #spawn event script
		# quest::signalwith(223211,23,0); #send signal to main trigger to start hour time limit
		# quest::stoptimer("water");
		# quest::depop();
	# }
#}

