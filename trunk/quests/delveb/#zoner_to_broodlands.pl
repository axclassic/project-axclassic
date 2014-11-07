##zoner from delveb to Broodlands##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
	}
sub EVENT_ENTER {
    quest::movepc(337,-1372.6,-1734.7,136,9.1);
 }