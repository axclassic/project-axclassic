# #The_Fabled_Evil_Eye (66176)
# depopper script by patrikpatrik 05/05/2017

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempa = $npc->GetNPCTypeID();
	
	if ($tempa == 66176) {
		quest::settimer("fevil", 600); #will remain for 10 minutes
	}
}

sub EVENT_TIMER {
	if($timer eq "fevil") {
		quest::depop();
	}
}