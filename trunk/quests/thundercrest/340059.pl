sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    }
sub EVENT_ENTER {
    $client->Message(14,"At last, you are nearly through these great halls of knowledge. Destroy the guardian of the final secret and you will be victorious in your search.");
	quest::depop();
	}