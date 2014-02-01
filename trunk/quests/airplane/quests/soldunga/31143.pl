# Zone to soldungb event
# Zone: soldunga, position C (Muse's Maps)
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER
{
	quest::movepc(32,-413.0,-385.3,10.1);
}
