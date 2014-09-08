sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    }
sub EVENT_ENTER {
    quest::spawn2(338184,0,0,-430.1,1017.4,6.1,1.3);
	quest::signalwith(338184,621,0);
 	quest::depop();
}