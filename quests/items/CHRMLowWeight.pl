sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $weight = ($itemWearer->GetWeight()/10.0);

    if($weight < 16) {
        $weight = 16;
    }

    $questitem->SetScale(35/$weight);
}