sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $haste = $itemWearer->FindType(11);

    if($haste) {
        $questitem->SetScale(0);
    }
    else {
        $questitem->SetScale(1);
    }
}