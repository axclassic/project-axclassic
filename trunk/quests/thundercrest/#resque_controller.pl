sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
    }
sub EVENT_ENTER {
quest::spawn2(340105,0,0,1136.3,-507.2,139.5,199.8);
quest::spawn2(340105,0,0,1132.9,-437.2,140,181.5);
quest::spawn2(340105,0,0,-39.9,-513.2,294.7,184.4); 
quest::spawn2(340105,0,0,-38,-464.8,294.7,203.6);
$client->Message(14,"You knew it was too good to be true! Two more of the Captors showed up just as you were about to leave. You let the other two know how powerful you really were, maybe it's time to do so again. But watch out, you don't want them to hurt the girl.");
}
