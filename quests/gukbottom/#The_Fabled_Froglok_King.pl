# #The_Fabled_Froglok_King (66159)
# depopper script by patrikpatrik 05/05/2017
# Update 8/30/17 Timer stops if engaged and restarts on exit.

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempc = $npc->GetNPCTypeID();
	
	if ($tempc == 66159) {
		quest::settimer("fking", 600); #will remain for 10 minutes
	}
}

sub EVENT_COMBAT {
	if($npc->IsEngaged()) {
		quest::stoptimer($timer);
	} else {
		quest::settimer("fking", 600);
	}
}

sub EVENT_TIMER {
	if($timer eq "fking") {
		quest::depop();
	}
}