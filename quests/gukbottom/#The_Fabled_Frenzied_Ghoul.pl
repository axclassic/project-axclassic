# #The_Fabled_Frenzied_Ghoul (66177)
# depopper script by patrikpatrik 05/05/2017

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempb = $npc->GetNPCTypeID();
	
	if ($tempb == 66177) {
		quest::settimer("fghoul", 600); #will remain for 10 minutes
	}
}

sub EVENT_TIMER {
	if($timer eq "fghoul") {
		quest::depop();
	}
}