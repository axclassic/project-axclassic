# Move PC to a better spott
# Zone: Cabwest
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER
{
	quest::movepc(82,460.8,-756.2,3.1);
}
