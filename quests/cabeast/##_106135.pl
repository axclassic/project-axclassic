# Ladder fix by necros
# Zone: Cabeast
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 1, $x + 1, $y - 1, $y + 1);
}

sub EVENT_ENTER
{
	quest::movepc(106,-188.0,1039.1,59.1);
}
