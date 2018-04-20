sub EVENT_ENTERZONE {
    if($client->GetBindZoneID() == 158) {
        $client->Message(3, "You cannot have a bind point in Vex Thal");
        $client->MovePC(69,840,70,0,0);
    }
}

