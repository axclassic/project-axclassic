sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
}
sub EVENT_ENTER {
$client->Message(14,"As you turn the corner, you catch a glimpse of a beast beyond mangled and twisted by decades of decay.");
quest::spawn2(128097,0,0,1298,-1808,-127,129);
}