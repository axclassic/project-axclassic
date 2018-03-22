sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $money = $itemWearer->GetCarriedMoney();

    if($money < 0) {
        $money = 0;
    }
    if($money > 64425000) {
        $money = 64425000;
    }

    $questitem->SetScale($money/64425000);
}