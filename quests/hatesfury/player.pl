sub EVENT_CLICKDOOR {
    my $d_id = ($doorid % 256);
    my $enter = $entity_list->GetMobByNpcTypeID(228119);
    my $exit = $entity_list->GetMobByNpcTypeID(228120);
    #$client->Message(13, "doorid = $doorid");
    #$client->Message(13, "d_id = $d_id");
    #if($enter) {
    #    $client->Message(13, "$enter = True");
    #}
    #if($exit) {
    #    $client->Message(13, "$exit = True");
    #}
    if((($doorid == 3) || ($d_id == 3)) && ($enter || $exit)) {
        $client->Message(0,"You got the door open.");
        quest::movepc(228,-1066,-48,-284,380); # Zone: hatesfury
    }
    if((($doorid == 4) || ($d_id == 4)) && ($enter || $exit)) {
        $client->Message(0,"You got the door open.");
        quest::movepc(228,-1360,-290,74,128); # Zone: hatesfury
    }
}

