# Zone to dranik event
# Zone: bloodfields
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x +50, $y - 50, $y + 50);
}

sub EVENT_ENTER
{
	quest::movepc(336,-1102.4,-1943.6,-369.6);
}