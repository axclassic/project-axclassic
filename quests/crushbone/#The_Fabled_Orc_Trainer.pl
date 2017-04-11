# #The_Fabled_Orc_Trainer (58013)
# Depopper script by patrikpatrik 4/10/2017

sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempd = $npc->GetNPCTypeID();
	
	if ($tempd == 58013) {
		quest::settimer("fabledtrain", 600); #will remain for 10 minutes
	}
}

sub EVENT_TIMER {
	if($timer eq "fabledtrain") {
		quest::depop();
	}
}