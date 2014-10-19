##zoner from Thundercrest to Broodlands##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 5, $x + 5, $y - 5, $y + 5);
	}
sub EVENT_ENTER {
    quest::movepc(337,1192.5,1555.5,24.4,161.5);
 }