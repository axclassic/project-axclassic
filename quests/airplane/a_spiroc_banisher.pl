sub EVENT_DEATH {
   if($entity_list->GetMobByNpcTypeID(71009)) {
      quest::spawn(71007,0,0,1051.0,-828.5,435.75);
   }
}

