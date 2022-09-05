# #The_Guardian_Construct (219063)

sub EVENT_DEATH {
    my $Elemental = $entity_list->GetMobByNpcTypeID(219059);
    my $Undead = $entity_list->GetMobByNpcTypeID(219060);
    my $Animated = $entity_list->GetMobByNpcTypeID(219061);
    my $Golem = $entity_list->GetMobByNpcTypeID(219062);
    if(!$Elemenal && !$Undead && !$Animated && !$Golem) {
        quest::ze(14, "A booming echo bellows from across the sky, 'Congratulations! You feel an overwhelming urge to pass through the portals. Make haste before it's too late...'");
    }
}

