sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}
sub EVENT_ENTER {
$client->Message(14,"As you turn the corner, you bare witness to a frigid caretaker down the hall, waiting for you.");
quest::spawn2(128099,0,0,623.2,-1335.3,-445.8,4.5);
quest::depop();
}