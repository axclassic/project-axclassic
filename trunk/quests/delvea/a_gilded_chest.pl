sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
    }
sub EVENT_ENTER {
    $client->Message(14,"You find: I'm not the first nor the last, but I'm second to none.");
 	}
	sub EVENT_DEATH {
	quest::signalwith(341071,103,0);
	}