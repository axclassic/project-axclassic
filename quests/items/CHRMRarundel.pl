sub EVENT_SCALE_CALC {
   # Rarundels Broken Memories: scales with Nihil faction 
   # get faction level with the Nihil
    my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
    my $scale = $itemWearer->GetModCharacterFactionLevel(231);

    # set the scale based on where faction is in the range [0, 1500]
    if($scale < 0) {
        $scale = 0;
    }

    $questitem->SetScale($scale/1500);
}