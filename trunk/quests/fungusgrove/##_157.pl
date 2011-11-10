# Zone to Twilight event
# Zone: Fungusgrove
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER
{
	quest::movepc(170,374,-1250,155);
}
