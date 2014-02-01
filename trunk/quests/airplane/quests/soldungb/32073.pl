# Zone to soldunga event
# Zone: soldungb, Position D (Muse's Maps)
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x +10, $y - 10, $y + 10);
}

sub EVENT_ENTER
{
	quest::movepc(31,-555.4,-1066.3,-0.9);
}
