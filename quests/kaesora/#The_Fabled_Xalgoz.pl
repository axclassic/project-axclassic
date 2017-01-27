# #The_Fabled_Xalgoz (88094)
# Depopper script
# By patrikpatrik
#############################

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempk = $npc->GetNPCTypeID();
	
	if ($tempk == 88094) {
		quest::settimer("fxalgoz", 300); #will remain for 5 minutes
	}
}

sub EVENT_TIMER {
	if($timer eq "fxalgoz") {
		quest::depop();
	}
}