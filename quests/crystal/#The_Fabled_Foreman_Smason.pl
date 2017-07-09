# #The Fabled Foreman Smason (121092)
# Experimental depopper script only when Fabled SPAWNS
# by patrikpatrik 11/22/16

sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempa = $npc->GetNPCTypeID();
	
	if ($tempa == 121092) {
		quest::settimer("fabledsmason", 600); #will remain for 10 minutes
	}
}

sub EVENT_TIMER {
	if($timer eq "fabledsmason") {
		quest::depop();
	}
}