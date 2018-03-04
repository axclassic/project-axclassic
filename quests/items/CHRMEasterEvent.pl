sub EVENT_SCALE_CALC {
    my $itemLevel = $client->GetLevel();
    my $scaledValue = (15 * $itemLevel) + 25;
    $questitem->SetScale($scaledValue/1000);
}
