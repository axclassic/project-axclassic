# The_Fabled_Undead_Barkeep (63095)
# Depopper script by patrikpatrik 4/13/2017
# Update 8/30/17 Timer stops if engaged and restarts on exit.

sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempd = $npc->GetNPCTypeID();
	
	if ($tempd == 63095) {
		quest::settimer("fabledbark", 600); #will remain for 10 minutes
	}
}

sub EVENT_COMBAT {
	if($npc->IsEngaged()) {
		quest::stoptimer("fabledbark");
	} else {
		quest::settimer("fabledbark", 600);
	}
}

sub EVENT_TIMER {
	if($timer eq "fabledbark") {
		quest::depop();
	}
}