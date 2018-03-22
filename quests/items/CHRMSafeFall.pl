# updates based on the wearers Safe Fall skill
sub EVENT_SCALE_CALC {
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $safefall = $itemWearer->GetSkill(39); # Skill: 39 == SAFE_FALL

    if($safefall < 0) {
        $safefall = 0;
    }

    $questitem->SetScale($safefall/330);
}