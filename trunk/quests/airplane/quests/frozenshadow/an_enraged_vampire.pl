
 sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
}

sub EVENT_ENTER
{
	quest::attack("$name");
}
# EOF zone: frozenshadow

