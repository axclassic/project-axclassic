sub EVENT_SCALE_CALC {
    #Charm of the Brotherhood: improves when group members are same race or class
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot 
    my $playerrace = $itemWearer->GetRace();
    my $playerclass = $itemWearer->GetClass();
    my $group = $entity_list->GetGroupByMob($itemWearer);
    my $member;
    my $matchcount = 0;

    # cycle through all group members
    if($group) {
        for(my $i = 0; $i < 6; $i++) {
            $member = $group->GetMember($i);
            if($member) {
                # look for race/class that matches the player
                if(($member->GetClass() == $playerclass) || ($member->GetRace() == $playerrace)) {
                    $matchcount++;
                }
            }
        }
    }
    $questitem->SetScale($matchcount/6);
}