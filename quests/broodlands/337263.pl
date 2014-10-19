##zoner from Broodlands to Thundercrest##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 5, $x + 5, $y - 5, $y + 5);
	}
sub EVENT_ENTER {
    quest::movepc(340,1641,-646,114,0);
 }