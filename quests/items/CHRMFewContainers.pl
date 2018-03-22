sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $value = 0;
    my $item = undef;
    for($for_x = 22; $for_x < 30; $for_x++) {
        $item = $itemWearer->GetItemAt($for_x);
        if($item) {
            if($item->IsType(1)) {
                $value++;
                $item = undef;
            }
        }
    }

    if($value == 0) {
        $questitem->SetScale(1.0);
    }
    elsif($value == 1) {
        $questitem->SetScale(0.875);
    }
    elsif($value == 2) {
        $questitem->SetScale(0.750);
    }
    elsif($value == 3) {
        $questitem->SetScale(0.625);
    }
    elsif($value == 4) {
        $questitem->SetScale(0.5);
    }
    elsif($value == 5) {
        $questitem->SetScale(0.375);
    }
    elsif($value == 6) {
        $questitem->SetScale(0.250);
    }
    elsif($value == 7) {
        $questitem->SetScale(0.125);
    }
    elsif($value == 8) {
        $questitem->SetScale(0.0);
    }
}