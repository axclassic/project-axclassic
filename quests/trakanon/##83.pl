# Zone to swampofnohope event
# Zone: trakanon
# AngeloX

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);}

sub EVENT_ENTER{
        quest::movepc(83,1735,-4542,90);}
