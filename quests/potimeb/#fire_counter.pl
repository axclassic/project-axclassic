#fire_counter.pl used as phase2 mobs instead!
#npcid - 223182

my $fnpccounter = 0;
my $firec = 0;

sub EVENT_SPAWN { #This spawns 1st mob group for Phase 2
    #fire group
	quest::spawn2(223143,0,0,232.0,579.0,491.6,192.5);
	quest::spawn2(223117,0,0,252.0,579.0,491.0,192.5);
	quest::spawn2(223117,0,0,232.0,569.0,491.9,192.5);
	quest::spawn2(223143,0,0,252.0,559.0,491.0,192.5);
	quest::spawn2(223143,0,0,252.0,569.0,491.3,192.5);
	quest::spawn2(223114,0,0,242.0,564.0,491.6,192.5);
	quest::spawn2(223124,0,0,242.0,574.0,491.5,192.5);
	quest::spawn2(223114,0,0,242.0,584.0,491.2,192.5);
	quest::spawn2(223114,0,0,252.0,589.0,491.0,192.5);
}

sub EVENT_SIGNAL { #like fire_event.pl starts a counter for when all are dead, spawns the next group!
	if($signal == 14068) { #This signal are from these mobs upon death!
		$fnpccounter+= 1;
		$firec = $fnpccounter;
		#quest::ze(15, "okay i signaled and my counter is now $firec.");
	}	
	if($fnpccounter == 9) { 
		quest::signalwith(223191, 14034, 0);
		$fnpccounter = 0;
		quest::depop();
	}
}

#sub EVENT_ENTER {
   # $fcounter += 1;
#}

#sub EVENT_EXIT {
   # $fcounter -= 1;
#}

