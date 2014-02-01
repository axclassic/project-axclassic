# TP to Stonebrunt event
# Zone: Gunthak

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER
{
	quest::movepc(100,-1514.9,-4166.8,-377.6);
}