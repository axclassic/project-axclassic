sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $itemLevel = $itemWearer->GetLevel();
    my $scaledValue = (15 * $itemLevel) + 25;
    $questitem->SetScale($scaledValue/1000);
}