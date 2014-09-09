# Zone loop fix untill we open the remaining zones
# Zone: broodlands to nowhere it was a looping zone point
# Aardil

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER
{
	quest::movepc(337,-30.6,-148.1,12.1);
}
