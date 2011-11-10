# Zone to soldunga event
# Zone: soldungb, Position C (Muse's Maps)
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x +10, $y - 10, $y + 10);
}

sub EVENT_ENTER
{
	quest::movepc(31,-377.0,-391.2,-13.1);
}
