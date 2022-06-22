# a_shadow_master (163483)

sub EVENT_DEATH {
    my $Grieg_Veneficus = $entity_list->GetMobByNpcTypeID(163075);
    if($Grieg_Veneficus) {
        quest::signalwith(163075, 163483);
    }
    $Grieg_Veneficus=undef;
}

