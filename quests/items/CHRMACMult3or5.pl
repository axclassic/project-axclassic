sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $itemLevel = $itemWearer->GetRawItemAC3or5();
    $questitem->SetScale($itemLevel/13);
}
