# Zone to draniksscar event
# Zone: causeway
# AngeloX
sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}
sub EVENT_ENTER
{
	quest::movepc(302,-612.4,1916.7,-255.5);
}