# Zone to Anguish
# Zone: wallofslaughter
# Aardil

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25);
}

sub EVENT_ENTER
{
	quest::movepc(317,-12.7,-2376.2,-80.6,0.5);
}
