# Zone to soldunga event
# Zone: soldungb, Position A (Muse's Maps)
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 15, $x +15, $y - 15, $y + 15);
}

sub EVENT_ENTER
{
	quest::movepc(31,-547.5,-189.0,-30.1);
}
