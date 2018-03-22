sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $abj = $itemWearer->GetSkill(4);
    my $alt = $itemWearer->GetSkill(5);
    my $con = $itemWearer->GetSkill(14);
    my $div = $itemWearer->GetSkill(18);
    my $evo = $itemWearer->GetSkill(24);

    if($abj < 0) {
        $abj = 0;
    }
    if($alt < 0) {
        $alt = 0;
    }
    if($con < 0) {
        $con = 0;
    }
    if($div < 0) {
        $div = 0;
    }
    if($evo < 0) {
        $evo = 0;
    }

    my $scale = $abj + $alt + $con + $div + $evo;

    $questitem->SetScale($scale/1175);
}