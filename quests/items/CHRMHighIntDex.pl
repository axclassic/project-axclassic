sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $int = $itemWearer->GetINT();
    my $dex = $itemWearer->GetDEX();

    if($int < 0) {
        $int = 0;
    }
    if($dex < 0) {
        $dex = 0;
    }

    my $scale = $int + $dex;
    $questitem->SetScale($scale/610);
}
