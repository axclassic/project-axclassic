# Zone to wallofslaughter event
# Zone: anguish
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER
{
	quest::movepc(300,1319.2,1651.3,122.4,128.6);
}
