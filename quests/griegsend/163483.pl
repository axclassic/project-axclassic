# a_shadow_master (163483)

sub EVENT_DEATH {
    my $shadow_master = $entity_list->GetMobByNpcTypeID(163483);
    if(!$shadow_master) {
        my $Grieg_Veneficus = $entity_list->GetMobByNpcTypeID(163075);
        if($Grieg_Veneficus) {
            $Grieg_Veneficus->Kill();
            quest::spawn2(163097, 0, 0, 2340, 503, 170, 130); #__Grieg_Veneficus__ (163097)
        }
    }
}

