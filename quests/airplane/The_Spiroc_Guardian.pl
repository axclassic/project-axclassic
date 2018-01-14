sub EVENT_DEATH {
   if($entity_list->GetMobByNpcTypeID(71009)) {
      quest::spawn(71013,0,0,766.63,-868.63,423.5);
   }
}

