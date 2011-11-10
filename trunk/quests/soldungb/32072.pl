# Zone to soldunga event
# Zone: soldungb, Position B (Muse's Maps)
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 30, $x +30, $y - 30, $y + 30);
}

sub EVENT_ENTER
{
	quest::movepc(31,-532.7,-289.3,-27.1);
}
