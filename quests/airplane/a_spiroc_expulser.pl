sub EVENT_DEATH {
   if($entity_list->GetMobByNpcTypeID(71009)) {
      quest::spawn(71011,0,0,683.13,-491.75,442.25);
   }
}

