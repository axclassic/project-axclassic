##zoner from the nest to Broodlands##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 1, $x + 1, $y - 1, $y + 1);
	}
sub EVENT_ENTER {
    quest::movepc(337,-1613,-1016,99,0.0);
 }