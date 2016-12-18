# #The_Fabled_Froglok_Pickler (89184)
# Depopper script after 10 min by Patrikpatrik
# Last updated 12/18/2016

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempb = $npc->GetNPCTypeID();
	
	if ($tempb == 89184) {
		quest::settimer("fharbing", 600);
	}
}

sub EVENT_TIMER {
	if($timer eq "fharbing") {
		quest::depop();
	}
}