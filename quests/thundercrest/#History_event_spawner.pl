sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    }
sub EVENT_ENTER {
    quest::spawn2(340056,0,0,2093,2186.7,-53.4,208.1);
	quest::signalwith(340056,312,0);
 	quest::depop();
}