# Dranik's Scar (draniksscar)

sub EVENT_CLICKDOOR {
    #quest::ze(15, "doorid = $doorid");
    if($doorid == 2) {
        # Dranik's Hollows: Watering Hole
        return;
        $QuestGlobalValue = $client->GetQGlobal("dranikhollowsa_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("dranikhollowsa_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is locked out of the Dranik's Hollows: Watering Hole for $timeleft.");
            return;
        }
        my $group_instance = 0;
        my $QGlobalValue1 = $client->GetQGlobal($name.".dranikhollowsa1");
        $group_instance = quest::GetInstanceID("dranikhollowsa", 1);
        if($group_instance && ($group_instance == $QGlobalValue1)) {
            $client->ClearCompassMark();
            quest::targlobal("dranikhollowsa_lockout", "1", "H6", 0, $client->CharacterID(), 0);
            quest::MovePCInstance(318, $group_instance, 0.0, 0.0, -11.1);
        }
        else {
            $client->Message(13, "You are not part of an adventure.");
        }
    }
    if($doorid == 3) {
        # Dranik's Hollows: Fire Pit
        return;
        $QuestGlobalValue = $client->GetQGlobal("dranikhollowsb_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("dranikhollowsb_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is locked out of the Dranik's Hollows: Fire Pit for $timeleft.");
            return;
        }
        my $group_instance = 0;
        my $QGlobalValue1 = $client->GetQGlobal($name.".dranikhollowsb1");
        $group_instance = quest::GetInstanceID("dranikhollowsb", 1);
        if($group_instance && ($group_instance == $QGlobalValue1)) {
            $client->ClearCompassMark();
            quest::targlobal("dranikhollowsb_lockout", "1", "H6", 0, $client->CharacterID(), 0);
            quest::MovePCInstance(319, $group_instance, 0.0, -447.0, -36.0);
        }
        else {
            $client->Message(13, "You are not part of an adventure.");
        }
    }
    if($doorid == 4) {
        # Dranik's Hollows: Murkglider Hive
        $QuestGlobalValue = $client->GetQGlobal("dranikhollowsc_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("dranikhollowsc_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is locked out of the Dranik's Hollows: Murkglider Hive for $timeleft.");
            return;
        }
        my $group_instance = 0;
        my $QGlobalValue1 = $client->GetQGlobal($name.".dranikhollowsc1");
        $group_instance = quest::GetInstanceID("dranikhollowsc", 1);
        if($group_instance && ($group_instance == $QGlobalValue1)) {
            $client->ClearCompassMark();
            quest::targlobal("dranikhollowsc_lockout", "1", "H6", 0, $client->CharacterID(), 0);
            quest::MovePCInstance(320, $group_instance, 5.0, -51.0, -43.7, 254.5);
        }
        else {
            $client->Message(13, "You are not part of an adventure.");
        }
    }
    if($doorid == 5) {
    }
}

