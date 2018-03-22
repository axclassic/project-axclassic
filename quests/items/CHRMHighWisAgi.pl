sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $wis = $itemWearer->GetWIS();
    my $agi = $itemWearer->GetAGI();

    if($wis < 0) {
        $wis = 0;
    }
    if($agi < 0) {
        $agi = 0;
    }

    my $scale = $wis + $agi;

    $questitem->SetScale($scale/610);
}