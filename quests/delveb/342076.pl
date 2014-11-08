sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
    }
sub EVENT_ENTER {
    quest::spawn2(342046,0,0,-148.7,1863,-4.3,124.4);
    $client->Message(14,"As the Delvian falls to the ground you can hear a siren going off. Your presence has been made known. Quickly find the Goblin Task Master for the information you seek.");
    }