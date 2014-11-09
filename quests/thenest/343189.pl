##succor point from trap 2 to zone in##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 5, $x + 5, $y - 5, $y + 5);
	}
sub EVENT_ENTER {
    quest::movepc(343,21.3,133.6,-41,149.6);
 }