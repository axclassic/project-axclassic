##succor point from Jurek pit to zone in##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 5, $x + 5, $y - 5, $y + 5);
	}
sub EVENT_ENTER {
    quest::movepc(343,-246.2,-14.8,-84.7,72.6);
 }