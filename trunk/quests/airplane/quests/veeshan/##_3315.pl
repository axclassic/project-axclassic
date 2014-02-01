# Zone to SwampOfNoHope event
# Zone: Veeshan
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}

sub EVENT_ENTER
{
	quest::movepc(83,-3978,661,198);
}
