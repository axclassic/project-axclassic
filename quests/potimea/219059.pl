# #The_Elemental_Construct (219059)

sub EVENT_DEATH {
    my $Undead = $entity_list->GetMobByNpcTypeID(219060);
    my $Animated = $entity_list->GetMobByNpcTypeID(219061);
    my $Golem = $entity_list->GetMobByNpcTypeID(219062);
    my $Guardian = $entity_list->GetMobByNpcTypeID(219063);
    if(!$Undead && !$Animated && !$Golem && !$Guardian) {
        quest::ze(14, "A booming echo bellows from across the sky, 'Congratulations! You feel an overwhelming urge to pass through the portals. Make haste before it's too late...'");
    }

    my @now_raid = $npc->GetHateList();
    foreach(@now_raid) {
        if($_->GetEnt()->IsClient()) {
            my $potimea_name = $_->GetEnt()->GetName();
            my $QuestGlobalValue = $_->GetEnt()->GetQGlobal($potimea_name.".potimea_portal_event_timer");
            if(!$QuestGlobalValue) {
                quest::targlobal($name.".potimea_portal_event_timer", "1", "H1", 0, $client->CharacterID(), 0);
                $QuestGlobalValue = undef;
            }
        }
    }
}

