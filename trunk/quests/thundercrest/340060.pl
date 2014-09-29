sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    }
sub EVENT_ENTER {
    $client->Message(14,"You must connect the three secrets of Lir together so that their full potential can be realized. Look about you for that which will connect them, for it is almost assuredly already in your possession."); 
    quest::depop();
	}