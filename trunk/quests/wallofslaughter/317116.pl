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
	quest::movepc(300,1322.0,1705.9,123.0);
}