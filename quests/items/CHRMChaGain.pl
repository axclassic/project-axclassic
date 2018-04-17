sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $cha = $itemWearer->GetCHA();

    if($cha < 0) {
        $cha = 0;
    }

    $questitem->SetScale($cha/300);
}