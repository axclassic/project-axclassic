sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50 $x + 50 $y - 50 $y + 50;
}
sub EVENT_ENTER {
$client->Message(14,"As you turn the corner, you catch a glimpse of a beast beyond mangled and twisted by decades of decay.");
quest::spawn2(128097,0,0,1298,-1808,-127,129);
}