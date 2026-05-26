# #a_stonemite_corpseburrower (297207)
# Stonemite adds during Bloodfeaster event

sub EVENT_SPAWN {
	if ($entity_list->GetMobByNpcTypeID(297082)) {
		my $BF = $entity_list->GetMobByNpcTypeID(297082);
		my $TopHate = $BF->GetHateTop();
		my $attack_name = $entity_list->GetClientByName($TopHate->GetName());
		quest::attack($attack_name->GetName());
	}
	quest::settimer("depop", 1200);
}

sub EVENT_TIMER {
	quest::depop();
}