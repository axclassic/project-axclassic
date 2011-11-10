# Zone to draniksscar event
# Zone: bloodfields
# AngeloX

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);}

sub EVENT_ENTER{
        quest::movepc(302,-1917.3,1497.5,389.6);}
