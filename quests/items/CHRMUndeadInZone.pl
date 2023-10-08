sub EVENT_SCALE_CALC {
    my @moblist = $entity_list->GetMobList();
    my $scaledValue = 60;
    foreach $tempmob (@moblist) {
        if($tempmob->GetBodyType() == 3) {
            $scaledValue = 100;
            last;
        }
    }
    $questitem->SetScale($scaledValue/100);
}
