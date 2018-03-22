sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $str = $itemWearer->GetSTR();
    my $sta = $itemWearer->GetSTA();

    if($str < 0) {
        $str = 0;
    }
    if($sta < 0) {
        $sta = 0;
    }

    my $scale = $str + $sta;
    $questitem->SetScale($scale/610);
}