sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
    }
sub EVENT_ENTER {
    $client->Message(14,"You find: One step forward, and two steps back. Two steps brings you ahead, but farther back.");
 	}
	sub EVENT_DEATH {
	quest::signalwith(341116,134,0);
	}