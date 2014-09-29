sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    }
sub EVENT_ENTER {
    $client->Message(14,"There remain many secrets here that only you can reveal. Now, you must destroy the guardian protecting the second secret of Yar`Lir.");
	quest::depop();
	}