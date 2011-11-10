# Call Dread, Fright & Terror to aid Cazic Thule if they're still alive
# code by mystic414

sub EVENT_AGGRO {
  quest::shout("Denizens of Fear, your master commands you to come forth to his aid!!");
  quest::shout("Beware all infidels who dare to taint my plane, for I shall rend your minds with fright, dread, and terror!");
  my $dread_mob = $entity_list->GetMobByNpcTypeID(72000);
  my $fright_mob = $entity_list->GetMobByNpcTypeID(72004);
  my $terror_mob = $entity_list->GetMobByNpcTypeID(72002);
  if ($dread_mob) {
    my $dread_mobnpc = $dread_mob->CastToNPC();
    $dread_mobnpc->AddToHateList($client, 1);
  }
  if ($fright_mob) {
    my $fright_mobnpc = $fright_mob->CastToNPC();
    $fright_mobnpc->AddToHateList($client, 1);
  }
  if ($terror_mob) {
    my $terror_mobnpc = $terror_mob->CastToNPC();
    $terror_mobnpc->AddToHateList($client, 1);
  }
}

# EOF zone: fearplane ID: 72003 NPC: Cazic_Thule

