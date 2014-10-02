sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    }
sub EVENT_ENTER {
quest::spawn2(340105,0,0,1136.3,-507.2,139.5,199.8);
quest::spawn2(340105,0,0,1132.9,-437.2,140,181.5);
}