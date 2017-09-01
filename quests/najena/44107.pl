# #The_Fabled_Najena (44107)
# Used npcid to differentiate lower level 44106 just in case!
# Depopper script patrikpatrik 9/1/2017

sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempa = $npc->GetNPCTypeID();
	
	if ($tempa == 44107) {
		quest::settimer("fablednaj", 600); #will remain for 10 minutes 600
	}
}

sub EVENT_COMBAT {
	if($npc->IsEngaged()) {
		quest::stoptimer($timer);
	} else {
		quest::settimer("fablednaj", 600);
	}
}

sub EVENT_TIMER {
	if($timer eq "fablednaj") {
		quest::depop();
	}
}