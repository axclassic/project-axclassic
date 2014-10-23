sub EVENT_SPAWN {
$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
    }
sub EVENT_ENTER {
     $client->Message(14,"There are others in the area search them out and destroy them."); 
	 quest::spawn2(340001,0,0,2260.7,-206.9,125.5,199.1);
	quest::depop();
	}
