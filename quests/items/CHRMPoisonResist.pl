sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $poison = $itemWearer->GetPR();
    my $disease = $itemWearer->GetDR();
    my $scale = $poison + $disease;

    if($scale < 0) {
        $scale = 0;
    }
    if($scale > 575) {
        $scale = 575;
    }

    $questitem->SetScale($scale/575);
}