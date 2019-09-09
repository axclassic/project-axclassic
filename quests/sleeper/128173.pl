sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	$z = $npc->GetZ();
	quest::set_proximity($x - 130, $x + 130, $y - 130, $y + 130, $z - 30, $z + 30);
}
sub EVENT_ENTER {
$client->Message(14,"As you turn the corner, you bare witness to a frigid caretaker down the hall, waiting for you to come closer so that it might show you misery.");
quest::spawn2(128099,0,0,623.2,-1335.3,-445.8,4.5);
quest::depop();
}