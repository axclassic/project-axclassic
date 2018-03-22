sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $int = $itemWearer->GetINT();

    if($int < 0) {
        $int = 0;
    }

    $questitem->SetScale($int/300);
}