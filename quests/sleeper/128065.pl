sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	$z = $npc->GetZ();
	quest::set_proximity($x - 130, $x + 130, $y - 130, $y + 130, $z - 30, $z + 30);
}
sub EVENT_ENTER {
$client->Message(14,"As you turn the corner, you catch a glimpse of a beast beyond mangled and twisted by decades of decay.");
quest::spawn2(128097,0,0,1298,-1808,-127,129);
quest::depop();
}