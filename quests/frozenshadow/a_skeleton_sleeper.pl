# give some 3rd  floor mobs a chance to spawn #an_enraged_shadow_beast on death
#
#Angelox
sub EVENT_DEATH {
	$enrag2 = int(rand(100));
	if($enrag2 <= 5) {
		quest::spawn2(111141, 0, 0, $x, $y, $z, 0);
	}
}

# EOF zone: frozenshadow