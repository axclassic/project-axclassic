# Queen_Dracnia (121072)
# testing
# by patrikpatrik 11/22/16

sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempa = $npc->GetNPCTypeID();
	quest::shout("Behold! I am Queen Dracnia.");
}