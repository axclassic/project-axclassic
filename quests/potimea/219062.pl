# #The_Golem_Construct (219062)

sub EVENT_DEATH {
    my $Elemental = $entity_list->GetMobByNpcTypeID(219059);
    my $Undead = $entity_list->GetMobByNpcTypeID(219060);
    my $Animated = $entity_list->GetMobByNpcTypeID(219061);
    my $Guardian = $entity_list->GetMobByNpcTypeID(219063);
    if(!$Elemental && !$Undead && !$Animated && !$Guardian) {
        quest::ze(14, "A booming echo bellows from across the sky, 'Congratulations! You feel an overwhelming urge to pass through the portals. Make haste before it's too late...'");
    }

    my @clickup_clients = $entity_list->GetClientList();
    foreach(@clickup_clients) {
        if($_) {
            my $potimea_name = $_->GetName();
            my $QuestGlobalValue = $_->GetQGlobal($potimea_name.".potimea_portal_event_timer");
            if(!$QuestGlobalValue) {
                quest::targlobal($potimea_name.".potimea_portal_event_timer", "1", "H1", 0, $_->CharacterID(), 0);
            }
            $QuestGlobalValue = undef;
        }
    }
}

