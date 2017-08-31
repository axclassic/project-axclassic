# #The_Fabled_Queen_Dracnia (121094)
# Experimental depopper script only when Fabled SPAWNS
# by patrikpatrik 11/22/16
# Update 8/30/17 Timer stops if engaged and restarts on exit.

sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempa = $npc->GetNPCTypeID();
	
	if ($tempa == 121094) {
		quest::settimer("fabledqueen", 600); #will remain for 10 minutes
	}
}

sub EVENT_COMBAT {
	if($npc->IsEngaged()) {
		quest::stoptimer($timer);
	} else {
		quest::settimer("fabledqueen", 600);
	}
}

sub EVENT_TIMER {
	if($timer eq "fabledqueen") {
		quest::depop();
	}
}
