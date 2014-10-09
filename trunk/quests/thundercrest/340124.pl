##zoner from Thundercrest to Broodlands##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25);
	}
sub EVENT_ENTER {
    quest::movepc(337,1192.5,1555.5,24.4,161.5);
 }