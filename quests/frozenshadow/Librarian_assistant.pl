# Randomly spawn #an_angry_librarian (111161)

sub EVENT_DEATH {
	my $AngryLibrarian = $entity_list->GetMobByNpcTypeID(111161);
	if(!$AngryLibrarian) {
		my $random_result = int(rand(100));
		if($random_result >= 80) {
			quest::spawn2(111161, 0, 0, $x, $y, $z, 0);
		}
	}
}

#End of File Zone: Tower of Frozen Shadow

