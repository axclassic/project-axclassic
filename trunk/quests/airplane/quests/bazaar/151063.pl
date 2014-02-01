# Move to red event
# Zone: bazaar
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER
{
	quest::movepc(151,-890.0,1217.0,1.7);
}
