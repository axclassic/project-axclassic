sub EVENT_CLICKDOOR {
    my $d_id = ($doorid % 256);
    if((($doorid == 3) || ($d_id == 3)) && ($entity_list->IsMobSpawnedByNpcTypeID(228119) || $entity_list->IsMobSpawnedByNpcTypeID(228120))) {
        $client->Message(0,"You got the door open.");
        quest::movepc(228,-1066,-48,-284,380); # Zone: hatesfury
    }
    if((($doorid == 4) || ($d_id == 4)) && ($entity_list->IsMobSpawnedByNpcTypeID(228119) || $entity_list->IsMobSpawnedByNpcTypeID(228120))) {
        $client->Message(0,"You got the door open.");
        quest::movepc(228,-1360,-290,74,128); # Zone: hatesfury
    }
}

