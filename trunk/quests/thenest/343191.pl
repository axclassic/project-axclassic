##succor point from Big pit to zone in##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 1, $x + 1, $y - 1, $y + 1);
	}
sub EVENT_ENTER {
    quest::movepc(343,21.3,133.6,-41,149.6);
 }