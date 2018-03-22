sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $money = $itemWearer->GetAllMoney();

    if($money < 0) {
        $money = 0;
    }
    if($money > 100000000) {
        $money = 100000000;
    }
    $questitem->SetScale($money/100000000);
}