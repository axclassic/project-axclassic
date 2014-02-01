# Zone to soldungb event
# Zone: soldunga, position D (Muse's Maps)
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}

sub EVENT_ENTER
{
	quest::movepc(32,-487.1,-1039.8,-14.9);
}
