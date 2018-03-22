sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $agi = $itemWearer->GetAGI();
    my $dex = $itemWearer->GetDEX();

    if($agi < 0) {
        $agi = 0;
    }
    if($dex < 0) {
        $dex = 0;
    }

    my $scale = $agi + $dex;
    $questitem->SetScale($scale/610);
}
