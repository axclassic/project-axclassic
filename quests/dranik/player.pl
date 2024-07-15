# The Ruined City of Dranik (dranik)

sub EVENT_CLICKDOOR {
    my $d_id = ($doorid % 256);
    $client->Message(14, "Door Clicked doorid = $doorid");
    $client->Message(14, "Door Clicked d_id = $d_id");
    if($doorid == 2) {
    }
    if($doorid == 3) {
    }
    if($doorid == 4) {
    }
    if($doorid == 5) {
    }
    if($doorid == 6) {
    }
    if($doorid == 7) {
        # Catacombs of Dranik
        my $QuestGlobalValue = $client->GetQGlobal("dranikcatacombsc_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("dranikcatacombsc_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is currently locked out of this expedition for $timeleft.");
            return;
        }
        my $group_instance = 0;
        my $QGlobalValue1 = $client->GetQGlobal(${name}.".dranikcatacombsc1");
        $group_instance = quest::GetInstanceID("dranikcatacombsc", 1);
        if($group_instance && ($group_instance == $QGlobalValue1)) {
            $client->ClearCompassMark();
            quest::targlobal("dranikcatacombsc_lockout", "1", "H6", 0, $client->CharacterID(), 0);
            quest::MovePCInstance(330, $group_instance, -10, -214, -3, 114);
        }
        else {
            $client->Message(13, "You are not part of an expedition.");
        }
    }
    if($doorid == 8) {
        # Sewers of Dranik
        $QuestGlobalValue = $client->GetQGlobal("draniksewersc_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("draniksewersc_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is locked out of this expedition for $timeleft.");
            return;
        }
        my $group_instance = 0;
        my $QGlobalValue1 = $client->GetQGlobal($name.".draniksewersc1");
        $group_instance = quest::GetInstanceID("draniksewersc", 1);
        if($group_instance && ($group_instance == $QGlobalValue1)) {
            $client->ClearCompassMark();
            quest::targlobal("draniksewersc_lockout", "1", "H6", 0, $client->CharacterID(), 0);
            quest::MovePCInstance(333, $group_instance, -2.5, 4, -6, 0);
        }
        else {
            $client->Message(13, "You are not part of an expedition.");
        }
    }
}

