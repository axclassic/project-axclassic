# #The_Fabled_Skeletal_Warlord (102132)
# Leaving fableds up unless otherwise
# by patrikpatrik 07/21/16
# UPDATE 12/8/2016 depops when and if spawned for length of time.

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempk = $npc->GetNPCTypeID();
	
	if ($tempk == 102132) {
		quest::settimer("fskelwarl", 300); #will remain for 5 minutes
	}
}

sub EVENT_TIMER {
	if($timer eq "fskelwarl") {
		quest::depop();
	}
}
