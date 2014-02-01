# Zone to Tutorialb event
# Zone: ToX
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 15, $x + 15, $y - 15, $y + 15);
}

sub EVENT_ENTER
{
	quest::movepc(189,-98.8,108.6,5.0);
}
