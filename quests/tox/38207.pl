# Zone to Hollowshade event
# Zone: Tox
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 15, $x + 15, $y - 15, $y + 15);
}

sub EVENT_ENTER
{
	quest::movepc(166,2739,381,165);
}
