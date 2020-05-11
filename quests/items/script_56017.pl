# Mirrored Mask

sub EVENT_SCALE_CALC {
    if($zoneid == 317) {
        $questitem->SetScale(1.0);
    }
    else {
        $questitem->SetScale(0.01);
    }
}

