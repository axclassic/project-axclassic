##undead_trigger this is an invisible controller that triggers #undead_event.pl
# npcid - 223171 #undead2_trigger is 223175

my $unpccounter = 0;
my $undeadc = 0;

sub EVENT_SPAWN { # This spawns undead 2nd grp + boss phase 2
    $unpccounter = 0;
    $undeadc = 0;
	quest::spawn2(223138,0,0,232.0,1104.0,491.1,192.5);
	quest::spawn2(223107,0,0,232.0,1114.0,491.2,192.5);
	quest::spawn2(223107,0,0,242.0,1119.0,491.3,192.5);
	quest::spawn2(223138,0,0,252.0,1124.0,491.4,192.5);
	quest::spawn2(223138,0,0,252.0,1114.0,491.8,192.5);
	quest::spawn2(223107,0,0,242.0,1109.0,491.5,192.5);
	quest::spawn2(223107,0,0,252.0,1104.0,491.7,192.5);
	quest::spawn2(223107,0,0,242.0,1099.0,491.2,192.5);
	quest::spawn2(223107,0,0,252.0,1094.0,491.4,192.5);
	quest::spawn2(223127,0,0,262.0,1109.0,492.1,192.5); #Boss Ralthos_Enrok
}

sub EVENT_SIGNAL { #like undead_counter.pl starts a counter for when all are dead, then opens inner doors!
	if($signal == 14035) { #This signal are from these mobs upon death!
		$unpccounter = $unpccounter + 1;
		$undeadc = $unpccounter;
		#quest::ze(15, "okay i signaled and my counter is now $undeadc.");
	}	

    if($unpccounter >= 10) { # phase_trigger script npcid - 223191
		quest::signalwith(223191, 14035, 0);
		$unpccounter = 0;
		quest::depop();
	}
}

#sub EVENT_ENTER {
   # quest::settimer("undeadI",1); #1 sec after first player enters event starts
   # quest::clear_proximity();
#}

#sub EVENT_TIMER {
	# if ($timer eq "undeadI") {
		# quest::spawn2(223188,0,0,-129.6,1720,547,0); #spawn event script
		# quest::signalwith(223211,23,0); #send signal to main trigger to start hour time limit
		# quest::stoptimer("undeadI");
		# quest::depop();
	# }
#}

