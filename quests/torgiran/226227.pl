sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
	}
sub EVENT_ENTER {
        quest::spawn(226213,0,0,-1240.7,1042,-133.9,229.6);
        quest::signalwith(226205,44,0);
        quest::depop();
	}
