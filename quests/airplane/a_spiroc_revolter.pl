sub EVENT_DEATH {
   if($entity_list->GetMobByNpcTypeID(71009)) {
      quest::spawn(71010,0,0,787.38,-568.88,458.5);
   }
}

