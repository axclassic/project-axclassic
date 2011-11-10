# Zone to CScar event
# Zone: mischiefplane
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER
{
	quest::movepc(117,895.8,-936.4,318.0);
}