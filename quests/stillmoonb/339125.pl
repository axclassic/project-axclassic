sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}
sub EVENT_ENTER {
    quest::spawn2(339124,0,0,1829.6,6575.1,657.7,118.9);
 }
 sub EVENT_SIGNAL {
    if($signal == 921) {
	quest::depop();
	}
 }