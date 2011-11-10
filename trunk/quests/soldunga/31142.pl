# Zone to soldungb event
# Zone: soldunga, position B (Muse's Maps)
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 15, $x + 15, $y - 15, $y + 15);
}

sub EVENT_ENTER
{
	quest::movepc(32,-537.5,-259.6,24.1);
}
