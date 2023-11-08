my $xvalue = 0;
my $yvalue = 0;
my $itemWearer = 0;
my $scaledValueA = 0;
my $scaledValueB = 0;
my $valueGreater = 0;
my $valueNewA = 0;

sub EVENT_ITEM_ENTERZONE {
    $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    if($itemWearer) {
        $xvalue = $itemWearer->GetX();
        $yvalue = $itemWearer->GetY();
    }
}

sub EVENT_SCALE_CALC {
    if($itemWearer) {
        $xdiff = $xvalue - $itemWearer->GetX();
        $ydiff = $yvalue - $itemWearer->GetY();
        $scaledValueB = (($xdiff * $xdiff) + ($ydiff * $ydiff));
        if($scaledValueB > $scaledValueA) {
            if(($valueGreater < 125) && ($scaledValueB > ($valueNewA + 500))) {
                $valueGreater = $valueGreater + 25;
                $valueNewA = $scaledValueB;
            }
            $questitem->SetScale($valueGreater/100);
        }
        else {
            if($valueGreater > 0) {
                $valueGreater = $valueGreater - 25;
            }
            if($valueGreater <= 0) {
                $valueGreater = 25;
            }
            $questitem->SetScale($valueGreater/100);
        }
    }
}