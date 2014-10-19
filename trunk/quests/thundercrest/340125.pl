##zoner from Thundercrest to Lavastorm##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 5, $x + 5, $y - 5, $y + 5);
	}
sub EVENT_ENTER {
    quest::movepc(27,-865.8,636.1,45.7,88);
 }