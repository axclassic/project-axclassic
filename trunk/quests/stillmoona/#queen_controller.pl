sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}
sub EVENT_ENTER {
    quest::spawn2(338214,0,0,-672,1257.5,4.3,194);
 }
 sub EVENT_SIGNAL {
    if($signal == 850) {
	quest::depop();
	}
 }