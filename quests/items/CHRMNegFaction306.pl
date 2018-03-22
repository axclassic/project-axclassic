sub EVENT_SCALE_CALC {
   my $itemWearer = $entity_list->GetMobID($userid); #This can be player or bot
   my $scale = $itemWearer->GetModCharacterFactionLevel(279); # Sabertooths of Blackburrow

   # set the scale based on where faction is in the range [-1500, 0]
   if($scale > 0) {
      $scale = 0;
   }
   $questitem->SetScale($scale/-1500);
}

