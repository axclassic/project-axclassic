# #The_Undead_Construct (219060)

sub EVENT_DEATH {
    my $Elemental = $entity_list->GetMobByNpcTypeID(219059);
    my $Animated = $entity_list->GetMobByNpcTypeID(219061);
    my $Golem = $entity_list->GetMobByNpcTypeID(219062);
    my $Guardian = $entity_list->GetMobByNpcTypeID(219063);
    if(!$Elemenal && !$Animated && !$Golem && !$Guardian) {
        quest::ze(14, "A booming echo bellows from across the sky, 'Congratulations! You feel an overwhelming urge to pass through the portals. Make haste before it's too late...'");
    }
    my $QuestGlobalValue = $client->GetQGlobal($name.".potimea_portal_event_timer");
    if(!$QuestGlobalValue) {
        quest::targlobal($name.".potimea_portal_event_timer", "1", "H1", 0, $client->CharacterID(), 0);
    }
}

