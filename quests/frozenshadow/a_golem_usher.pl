# give 5th floor mobs a chance to spawn the enraged relative on death
#
sub EVENT_DEATH {
	$relative = int(rand(100));
	if($relative <= 5) {
		quest::spawn2(111143, 0, 0, $x, $y, $z, 0);
	}
}

# EOF zone: frozenshadow

