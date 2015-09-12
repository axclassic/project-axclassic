# Zone to Anguish
# Zone: wallofslaughter
# Aardil

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER
{
	quest::movepc(317,-9.5,-2413.5,-80.9,3.9);
}
