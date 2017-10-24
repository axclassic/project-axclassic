# Zone to Tox event
# Zone: Hollowshade
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 15, $x + 15, $y - 15, $y + 15);
	
	#resets the invaderw
	quest::spawn_condition("hollowshade",8,0); #owl invader are 8
	quest::spawn_condition("hollowshade",9,0); #wolf invader are 9
	quest::spawn_condition("hollowshade",8,0); #grimlin invader are 7
}

sub EVENT_ENTER
{
	quest::movepc(38,2474,-953,-6);
}
