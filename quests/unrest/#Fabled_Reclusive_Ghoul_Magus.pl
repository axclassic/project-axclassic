# #Fabled_Reclusive_Ghoul_Magus (63097)
# Depopper script by patrikpatrik 4/13/2017

sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempa = $npc->GetNPCTypeID();
	
	if ($tempa == 63097) {
		quest::settimer("fabledmagus", 600); #will remain for 10 minutes
	}
}

sub EVENT_TIMER {
	if($timer eq "fabledmagus") {
		quest::depop();
	}
}