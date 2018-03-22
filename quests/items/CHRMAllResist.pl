sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $poison = $itemWearer->GetPR();
    my $disease = $itemWearer->GetDR();
    my $magic = $itemWearer->GetMR();
    my $fire = $itemWearer->GetFR();
    my $cold = $itemWearer->GetCR();

    my $scale = $poison + $disease + $magic + $fire + $cold;

    if($scale < 0) {
        $scale = 0;
    }
    if($scale > 1430) {
        $scale = 1430;
    }

    $questitem->SetScale($scale/1430);
}