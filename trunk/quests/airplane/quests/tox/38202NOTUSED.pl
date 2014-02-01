# Zone to kerraridge event
# Zone: tox
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 30, $x + 30, $y - 30, $y + 30);
}

sub EVENT_ENTER
{
	quest::movepc(74,-919.2,499.8,23.1);
}