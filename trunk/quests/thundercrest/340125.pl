##zoner from Thundercrest to Lavastorm##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}
sub EVENT_ENTER {
    quest::movepc(337,-813.4,559.9,11.9,59);
 }