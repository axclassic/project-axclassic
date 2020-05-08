# Overlord_Mata_Muram's Door

sub EVENT_CLICKDOOR {
    my $door_id = ($doorid % 256);
    if($doorid == 61) {
        my $Hanvar_spawn   = $entity_list->GetMobByNpcTypeID(317002);
        my $Ture_spawn     = $entity_list->GetMobByNpcTypeID(317003);
        my $Jelvan_spawn   = $entity_list->GetMobByNpcTypeID(317004);
        my $Keldovan_spawn = $entity_list->GetMobByNpcTypeID(317005);
        if($Hanvar_spawn || $Ture_spawn || $Jelvan_spawn || $Keldovan_spawn) {
            quest::ze(15, "The seal doesn't react to your presence.");
        }
        else {
            $client->SetEntityVariable(1, "clicked_up");
            quest::MovePCInstance(317, $instanceid, 504, 4734, 279, 0);
            # --signal OMM that a click up happened
            quest::signalwith(317100, 1);
        }
    }
	if(($doorid == 57) || ($doorid == 58) or ($doorid == 59) or ($doorid == 60)) {
        $Magus_spawn = $entity_list->GetMobByNpcTypeID(317001);
        if($Magus_spawn) {
            quest::ze(15, "The magic of the arch magus holds the shield firmly in place");
        }
    }
}

