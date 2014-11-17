sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
    }
sub EVENT_ENTER {
$client->Message(14,"Nera leans forward and speaks to the ancient goblin in a voice too quiet for you to understand her words.");
quest::depop();
}