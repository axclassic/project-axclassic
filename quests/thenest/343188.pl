##succor point from trap 1 to zone in##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}
sub EVENT_ENTER {
    quest::movepc(343,-246.2,-14.8,-84.7,72.6);
 }