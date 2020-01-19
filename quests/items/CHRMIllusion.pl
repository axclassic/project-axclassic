sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $baseRace = $itemWearer->GetBaseRace();
    my $currentRace = $itemWearer->GetRace();

    if($baseRace != $currentRace) {
        $questitem->SetScale(1);
    }
    else {
       $questitem->SetScale(0);
    }
}