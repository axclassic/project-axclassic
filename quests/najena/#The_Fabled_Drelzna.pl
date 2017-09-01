# #The_Fabled_Drelzna (44105)
# Depopper script patrikpatrik 9/1/2017

sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempa = $npc->GetNPCTypeID();
	
	if ($tempa == 44105) {
		quest::settimer("fableddrel", 600); #will remain for 10 minutes 600
	}
}

sub EVENT_COMBAT {
	if($npc->IsEngaged()) {
		quest::stoptimer($timer);
	} else {
		quest::settimer("fableddrel", 600);
	}
}

sub EVENT_TIMER {
	if($timer eq "fableddrel") {
		quest::depop();
	}
}