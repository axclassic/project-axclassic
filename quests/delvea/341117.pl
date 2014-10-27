sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
    }
sub EVENT_ENTER {
    $client->Message(14,"After gold is platinum, then silver after both.");
 	}
	sub EVENT_DEATH {
	quest::signalwith(341114,111,0);
	}