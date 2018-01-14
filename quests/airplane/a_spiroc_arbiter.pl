sub EVENT_DEATH {
   if($entity_list->GetMobByNpcTypeID(71009)) {
      quest::spawn(71008,0,0,1072.25,-750.38,447.79);
   }
}

