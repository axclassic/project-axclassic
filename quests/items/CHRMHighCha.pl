sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $scale = $itemWearer->GetCHA();

    if($scale < 0) {
        $scale = 0;
    }

    $questitem->SetScale($scale/300);
}

