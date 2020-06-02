# Muramite Proving Grounds

sub EVENT_CLICKDOOR {
    if($doorid == 2) {
        # The Mastery of Hate (Projection of Mind): Fear(Group) / Hatred(Raid)
        my $QuestGlobalValue = $client->GetQGlobal("mpg_raid_hatred_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("mpg_raid_hatred_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is currently locked out of the Hatred trial for $timeleft.");
            return;
        }
        $QuestGlobalValue = $client->GetQGlobal("mpg_group_fear_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("mpg_group_fear_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is locked out of the Fear trial for $timeleft.");
            return;
        }
        my $group_instance = 0;
        my $raid_instance = 0;
        my $QGlobalValue1 = $client->GetQGlobal(${name}."chambersa1");
        my $QGlobalValue2 = $client->GetQGlobal(${name}."chambersa2");
        $raid_instance = quest::GetInstanceID("chambersa", 2);
        $group_instance = quest::GetInstanceID("chambersa", 1);
        if($raid_instance && ($raid_instance == $QGlobalValue2)) {
            quest::MovePCInstance(304, $raid_instance, 0, -37, 1, 508);
        }
        elsif($group_instance && ($group_instance == $QGlobalValue1)) {
            quest::MovePCInstance(304, $group_instance, 0, -37, 1, 508);
        }
        else {
            $client->Message(13, "You are not part of a trial.");
        }
    }
    if($doorid == 3) {
        # The Mastery of Corruption (Projection of Power): Destruction(Group) / Corruption(Raid)
        my $QuestGlobalValue = $client->GetQGlobal("mpg_raid_corruption_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("mpg_raid_corruption_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is currently locked out of the Corruption trial for $timeleft.");
            return;
        }
        $QuestGlobalValue = $client->GetQGlobal("mpg_group_destruction_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("mpg_group_destruction_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is locked out of the Destruction trial for $timeleft.");
            return;
        }
        my $group_instance = 0;
        my $raid_instance = 0;
        my $QGlobalValue1 = $client->GetQGlobal(${name}."chambersf1");
        my $QGlobalValue2 = $client->GetQGlobal(${name}."chambersf2");
        $raid_instance = quest::GetInstanceID("chambersf", 2);
        $group_instance = quest::GetInstanceID("chambersf", 1);
        if($raid_instance && ($raid_instance == $QGlobalValue2)) {
            quest::MovePCInstance(309, $raid_instance, 0, -37, 1, 508);
        }
        elsif($group_instance && ($group_instance == $QGlobalValue1)) {
            quest::MovePCInstance(309, $group_instance, 0, -37, 1, 508);
        }
        else {
            $client->Message(13, "You are not part of a trial.");
        }
    }
    if($doorid == 4) {
        # The Mastery of Specialization (Projection of Arcana): Efficiency(Group) / Specialization(Raid)
        my $QuestGlobalValue = $client->GetQGlobal("mpg_raid_specialization_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("mpg_raid_specialization_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is currently locked out of the Specialization trial for $timeleft.");
            return;
        }
        $QuestGlobalValue = $client->GetQGlobal("mpg_group_efficiency_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("mpg_group_efficiency_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is locked out of the Efficiency trial for $timeleft.");
            return;
        }
        my $group_instance = 0;
        my $raid_instance = 0;
        my $QGlobalValue1 = $client->GetQGlobal(${name}."chambersd1");
        my $QGlobalValue2 = $client->GetQGlobal(${name}."chambersd2");
        $raid_instance = quest::GetInstanceID("chambersd", 2);
        $group_instance = quest::GetInstanceID("chambersd", 1);
        if($raid_instance && ($raid_instance == $QGlobalValue2)) {
            quest::MovePCInstance(307, $raid_instance, 0, -37, 1, 508);
        }
        elsif($group_instance && ($group_instance == $QGlobalValue1)) {
            quest::MovePCInstance(307, $group_instance, 0, -37, 1, 508);
        }
        else {
            $client->Message(13, "You are not part of a trial.");
        }
    }
    if($doorid == 5) {
        # The Mastery of Endurance (Projection of Body): Weaponry(Group) / Endurance(Raid)
        my $QuestGlobalValue = $client->GetQGlobal("mpg_raid_endurance_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("mpg_raid_endurance_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is currently locked out of the Endurance trial for $timeleft.");
            return;
        }
        $QuestGlobalValue = $client->GetQGlobal("mpg_group_weaponry_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("mpg_group_weaponry_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is locked out of the Weaponry trial for $timeleft.");
            return;
        }
        my $group_instance = 0;
        my $raid_instance = 0;
        my $QGlobalValue1 = $client->GetQGlobal(${name}."chambersb1");
        my $QGlobalValue2 = $client->GetQGlobal(${name}."chambersb2");
        $raid_instance = quest::GetInstanceID("chambersb", 2);
        $group_instance = quest::GetInstanceID("chambersb", 1);
        if($raid_instance && ($raid_instance == $QGlobalValue2)) {
            quest::MovePCInstance(305, $raid_instance, 0, -37, 1, 508);
        }
        elsif($group_instance && ($group_instance == $QGlobalValue1)) {
            quest::MovePCInstance(305, $group_instance, 0, -37, 1, 508);
        }
        else {
            $client->Message(13, "You are not part of a trial.");
        }
    }
    if($doorid == 6) {
        # The Mastery of Adaptation (Projection of Realms): Ingenuity(Group) / Adaptation(Raid)
        my $QuestGlobalValue = $client->GetQGlobal("mpg_raid_adaptation_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("mpg_raid_adaptation_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is currently locked out of the Adaptation trial for $timeleft.");
            return;
        }
        $QuestGlobalValue = $client->GetQGlobal("mpg_group_ingenuity_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("mpg_group_ingenuity_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is locked out of the Ingenuity trial for $timeleft.");
            return;
        }
        my $group_instance = 0;
        my $raid_instance = 0;
        my $QGlobalValue1 = $client->GetQGlobal(${name}."chamberse1");
        my $QGlobalValue2 = $client->GetQGlobal(${name}."chamberse2");
        $raid_instance = quest::GetInstanceID("chamberse", 2);
        $group_instance = quest::GetInstanceID("chamberse", 1);
        if($raid_instance && ($raid_instance == $QGlobalValue2)) {
            quest::MovePCInstance(308, $raid_instance, 0, -37, 1, 508);
        }
        elsif($group_instance && ($group_instance == $QGlobalValue1)) {
            quest::MovePCInstance(308, $group_instance, 0, -37, 1, 508);
        }
        else {
            $client->Message(13, "You are not part of a trial.");
        }
    }
    if($doorid == 7) {
        # The Mastery of Foresight (Projection of Tactics): Subversion(Group) / Foresight(Raid)
        my $QuestGlobalValue = $client->GetQGlobal("mpg_raid_foresight_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("mpg_raid_foresight_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is currently locked out of the Foresight trial for $timeleft.");
            return;
        }
        $QuestGlobalValue = $client->GetQGlobal("mpg_group_subversion_lockout");
        if($QuestGlobalValue) {
            my $qgduration = $client->GetQGlobalDuration("mpg_group_subversion_lockout");
            my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
            $client->Message(15, "$name is locked out of the Subversion trial for $timeleft.");
            return;
        }
        my $group_instance = 0;
        my $raid_instance = 0;
        my $QGlobalValue1 = $client->GetQGlobal(${name}."chambersc1");
        my $QGlobalValue2 = $client->GetQGlobal(${name}."chambersc2");
        $raid_instance = quest::GetInstanceID("chambersc", 2);
        $group_instance = quest::GetInstanceID("chambersc", 1);
        if($raid_instance && ($raid_instance == $QGlobalValue2)) {
            quest::MovePCInstance(306, $raid_instance, 0, -37, 1, 508);
        }
        elsif($group_instance && ($group_instance == $QGlobalValue1)) {
            quest::MovePCInstance(306, $group_instance, 0, -37, 1, 508);
        }
        else {
            $client->Message(13, "You are not part of a trial.");
        }
    }
}

