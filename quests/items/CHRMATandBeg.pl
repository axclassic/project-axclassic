sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $alcohol = $itemWearer->GetSkill(66);
    my $begging = $itemWearer->GetSkill(67);

    if($alcohol < 0) {
        $alcohol = 0;
    }
    if($begging < 0) {
        $begging = 0;
    }

    my $scale = $alcohol + $begging;

    $questitem->SetScale($scale/675);
}
