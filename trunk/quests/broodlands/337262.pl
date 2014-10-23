# Zoner from Broodlands to Lavaspinners lair delvea
# Aardil

sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}
sub EVENT_ENTER {
    quest::movepc(341,-246,-1578,68,0);
 }

