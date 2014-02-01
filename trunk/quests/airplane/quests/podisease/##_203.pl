# Zone to POT event
# Zone: PODISEASE
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25);
}

sub EVENT_ENTER
{
	quest::movepc(203,-1452.4,1773.5,-771.2);
}