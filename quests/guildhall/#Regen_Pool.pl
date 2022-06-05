#-- Guild Hall Regen Pool Script - NPC Portion

#-- Set the distance for the proximity here
my $ProxDist = 20;

sub EVENT_SPAWN {
	my $xloc = $npc->GetX();
	my $yloc = $npc->GetY();
	my $zloc = $npc->GetZ();
	quest::set_proximity($xloc - $ProxDist, $xloc + $ProxDist, $yloc - $ProxDist, $yloc + $ProxDist, $zloc - $ProxDist, $zloc + $ProxDist);
}

sub EVENT_ENTER {
	$client->EnableAreaRegens(2000);
	$client->Message(2, "You are filled with new energy as you near the healing pool.");
	$client->AddNimbusEffect(412);
}

sub EVENT_EXIT {
	$client->DisableAreaRegens();
	$client->Message(2, "The energy fades away as you leave the healing pool.");
	$client->RemoveNimbusEffect(412);
}

