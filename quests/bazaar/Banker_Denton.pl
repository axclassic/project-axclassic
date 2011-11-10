sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
	quest::signal(151074,5); #Smoochy
	quest::signal(151075,5); #Poren
	quest::signal(151078,5); #Lestoil
	quest::signal(151070,5); #Lastor
}
