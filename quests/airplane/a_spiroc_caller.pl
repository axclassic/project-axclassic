sub EVENT_DEATH {
   if($entity_list->GetMobByNpcTypeID(71009)) {
      quest::spawn(71015,0,0,1125.88,-467.38,469.5);
   }
}

