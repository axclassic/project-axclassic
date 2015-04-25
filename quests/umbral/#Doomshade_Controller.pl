#Doomshade_Controller#
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
	}
sub EVENT_ENTER {
    quest::spawn2(176105,0,0,124,2872,410,252);
    quest::spawn2(176087,0,0,124,2872,410,252);
    quest::signalwith(176165,299,0);
 }