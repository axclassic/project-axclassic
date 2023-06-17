sub EVENT_SCALE_CALC {
    my $silver = "Silver";
    my $electrum = "Electrum";
    my $gold = "Gold";
    my $platinum = "Platinum";
    my $velium = "Velium";
    my $palladium = "Palladium";
    my $luclinite = "Luclinite";
    my $dwerium = "Dwerium";
    if($parentitemid > 0) {
        $parentItemName = quest::getItemName($parentitemid);
        if(index($parentItemName, $silver) != -1) {
            $questitem->SetScale(13/100);
        }
        if(index($parentItemName, $electrum) != -1) {
            $questitem->SetScale(26/100);
        }
        if(index($parentItemName, $gold) != -1) {
            $questitem->SetScale(39/100);
        }
        if(index($parentItemName, $platinum) != -1) {
            $questitem->SetScale(52/100);
        }
        if(index($parentItemName, $velium) != -1) {
            $questitem->SetScale(65/100);
        }
        if(index($parentItemName, $palladium) != -1) {
            $questitem->SetScale(73/100);
        }
        if(index($parentItemName, $luclinite) != -1) {
            $questitem->SetScale(86/100);
        }
        if(index($parentItemName, $dwerium) != -1) {
            $questitem->SetScale(1);
        }
    }
}
