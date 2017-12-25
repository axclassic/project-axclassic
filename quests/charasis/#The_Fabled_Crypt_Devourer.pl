# #The_Fabled_Crypt_Devourer (105282)
# Fabled Depopper script
# by patrikpatrik 12/24/17
# Timer stops if engaged and restarts on exit.

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempk = $npc->GetNPCTypeID();
	
	if ($tempk == 105282) {
		quest::settimer("fcryptdev", 600); #will remain for 10 minutes
	}
}

sub EVENT_COMBAT {
	if($npc->IsEngaged()) {
		quest::stoptimer($timer);
	} else {
		quest::settimer("fcryptdev", 600);
	}
}

sub EVENT_TIMER {
	if($timer eq "fcryptdev") {
		quest::depop();
	}
}