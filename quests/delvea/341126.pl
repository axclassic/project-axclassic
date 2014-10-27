sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
    }
sub EVENT_ENTER {
    $client->Message(14,"An inscription on the chest reads: 256 - 16 - 4 –.");
 	}
	sub EVENT_DEATH {
	quest::signalwith(341116,132,0);
	}