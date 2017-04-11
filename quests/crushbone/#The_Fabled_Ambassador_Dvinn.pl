# #The_Fabled_Ambassador_Dvinn (58058)
# Depopper script by patrikpatrik 4/10/2017

sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempb = $npc->GetNPCTypeID();
	
	if ($tempb == 58058) {
		quest::settimer("fableddvinn", 600); #will remain for 10 minutes
	}
}

sub EVENT_TIMER {
	if($timer eq "fableddvinn") {
		quest::depop();
	}
}