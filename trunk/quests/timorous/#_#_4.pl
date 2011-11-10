# Zone to Oasis event
# Zone: timorous
# AngeloX
sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 65, $x + 65, $y - 65, $y + 65);
}

sub EVENT_ENTER
{
	quest::movepc(37,-847.8,883.6,-0.5);
}
