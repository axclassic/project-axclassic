# Projection_of_Tactics (316038)

sub EVENT_SPAWN {
    quest::set_proximity($x-50, $x+50, $y-50, $y+50);
}

sub EVENT_ENTER {
    quest::say("Perception and split-second reactions are not something you can acquire in training.  It's a gift learned on the battlefield, and the penalty for being a slow learner is a quick and decisive death. Can you see the arrow as it sails toward your heart and sidestep out of the way? If you have this ability, now is the opportunity to prove your worth!");
}

sub EVENT_SAY {
    my $smallscale = quest::saylink("small-scale", 1);
    my $largescale = quest::saylink("large-scale", 1);
    my $subversion = quest::saylink("Subversion", 1);
    my $foresight = quest::saylink("Foresight", 1);
    my $progress = quest::saylink("progress", 1);

    if($text=~/hail/i) {
        quest::say("Halt, $race, and hear my words. Your background and your status are of no consequence. All are welcome to participate in the trials to prove their worth, or die trying. Whosoever approaches me has addressed the embodiment of Tactics, keeper of the trials of Subversion and Foresight. The former is a small-scale test, while the latter is large-scale. My task is to explain the rules and usher hopefuls into the battle arena. Would you like to hear the rules for [ $smallscale ] or [ $largescale ] trials, or do you wish to enroll in [ $subversion ] or [ $foresight ]?");
    }
    elsif($text=~/subversion/i) {
        quest::say("The group trials are not yet available. Send all complaints to The Rathe Management.");
        return;
        my $flagged = 2;
        my @groupclients;
        if($client->IsGrouped()) {
            my $the_group = $client->GetGroup();
            my $nMembers = $the_group->GroupCount();
            for($i=0; $i<$nMembers; $i++) {
                my $member = $the_group->GetMember($i);
                if($the_group->IsClient($member)) {
                    my $ClientName = $member->GetCleanName();
                    my $QuestGlobalValue = $member->GetQGlobal("mpg_group_subversion_lockout");
                    if($QuestGlobalValue) {
                        $flagged = 1;
                        my $qgduration = $member->GetQGlobalDuration("mpg_group_subversion_lockout");
                        my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
                        $member->Message(15, "$name is locked out of the Subversion trial for $timeleft.");
                    }
                    if($flagged == 2) {
                        push(@groupclients, $member);
                        $flagged = 3;
                    }
                }
            }
        }
        else {
            my $QuestGlobalValue = $client->GetQGlobal("mpg_group_subversion_lockout");
            if($QuestGlobalValue) {
                $flagged = 1;
                my $qgduration = $client->GetQGlobalDuration("mpg_group_subversion_lockout");
                my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
                $client->Message(15, "$name is locked out of the Subversion trial for $timeleft.");
            }
        }
        if($flagged == 3) {
            my $QGlobalValue1 = $client->GetQGlobal(${name}."chambersc1");
            if($QGlobalValue1) {
                $client->Message(15, "You are already assigned to this trial.");
                return;
            }
            my $instance_ID = quest::CreateInstance('chambersc', 1, 3600);
            my $arraySize = @groupclients;
            if($arraySize > 1) {
                quest::AssignGroupToInstance($instance_ID);
                quest::setgroupglobal("chambersc1", $instance_ID, 7, "H1");
            }
            else {
                quest::AssignToInstance($instance_ID);
                quest::setglobal(${name}."chambersc1", $instance_ID, 7, "H1");
            }
            quest::say("Knowing when to thwart your opponents using guile and subversion instead of brute force is critical to attaining true power. Wealth can be amassed without ever unsheathing a blade. The most ambitious rulers are overthrown not by their enemies on the battlefield, but by their 'allies' in the throne room. If you understand my meaning, now is the opportunity to prove your worth!");
        }
    }
    elsif($text=~/foresight/i) {
        my $flagged = 2;
        my @clients;
        if($client->IsGrouped()) {
            my $the_group = $client->GetGroup();
            my $nMembers = $the_group->GroupCount();
            for($i=0; $i<$nMembers; $i++) {
                my $member = $the_group->GetMember($i);
                if($the_group->IsClient($member)) {
                    my $ClientName = $member->GetCleanName();
                    my $QuestGlobalValue = $member->GetQGlobal("mpg_raid_foresight_lockout");
                    if($QuestGlobalValue) {
                        $flagged = 1;
                        my $qgduration = $member->GetQGlobalDuration("mpg_raid_foresight_lockout");
                        my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
                        $member->Message(15, "$name is currently locked out of the Foresight trial for $timeleft.");
                    }
                    if($flagged == 2) {
                        push(@clients, $member);
                        $flagged = 3;
                    }
                }
            }
        }
        else {
            my $QuestGlobalValue = $client->GetQGlobal("mpg_raid_foresight_lockout");
            if($QuestGlobalValue) {
                $flagged = 1;
                my $qgduration = $client->GetQGlobalDuration("mpg_raid_foresight_lockout");
                my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
                $client->Message(15, "$name is currently locked out of the Foresight trial for $timeleft.");
            }
        }
        if($flagged == 3) {
            my $QGlobalValue2 = $client->GetQGlobal(${name}."chambersc2");
            if($QGlobalValue2) {
                $client->Message(15, "You are already assigned to this trial.");
                return;
            }
            my $instance_ID = quest::CreateInstance('chambersc', 2, 10800);
            my $arraySize = @clients;
            if($arraySize > 1) {
                quest::AssignGroupToInstance($instance_ID);
                quest::setgroupglobal("chambersc2", $instance_ID, 7, "H3");
            }
            else {
                quest::AssignToInstance($instance_ID);
                quest::setglobal(${name}."chambersc2", $instance_ID, 7, "H3");
            }
            quest::say("Can you modify your strategy in the heat of battle? In an unpredictable and chaotic environment will you be able to adapt quickly to whatever adversities you face? If you have this ability now is the opportunity to prove your worth.");
        }
    }
    elsif($text=~/small-scale/i) {
        quest::say("Every test has its rules and these trials are no exception. The following guidelines must be followed to the letter, or else you stand to forfeit or perish. You are allowed no more than SIX participants in the battle. Once the trial has begun, you must remain in the combat area. Violators of this rule will be warned and then destroyed. Your [ $progress ] will be carefully monitored. If you take too long, you will fail. These are the rules and they are not negotiable.");
    }
    elsif($text=~/large-scale/i) {
        quest::say("Every test has its rules and these trials are no exception. The following guidelines must be followed to the letter, or else you stand to forfeit or perish. You are allowed no more than FIFTY-FOUR participants in the battle. Once the trial has begun, you must remain in the combat area. Violators of this rule will be warned and then destroyed. Your [ $progress ] will be carefully monitored. If you take too long, you will fail. These are the rules and they are not negotiable.");
    }
    elsif($text=~/progress/i) {
        Display_Completed_Trials();
    }
}

sub Display_Completed_Trials {
    if(defined($mpg_raid_corruption_flag)) {
        $client->Message(14, "You have completed The Mastery of Corruption (Raid)");
    }
    else {
        $client->Message(15, "You have not completed The Mastery of Corruption (Raid)");
    }
    if(defined($mpg_raid_adaptation_flag)) {
        $client->Message(14, "You have completed The Mastery of Adaptation (Raid)");
    }
    else {
        $client->Message(15, "You have not completed The Mastery of Adaptation (Raid)");
    }
    if(defined($mpg_raid_endurance_flag)) {
        $client->Message(14, "You have completed The Mastery of Endurance (Raid)");
    }
    else {
        $client->Message(15, "You have not completed The Mastery of Endurance (Raid)");
    }
    if(defined($mpg_raid_foresight_flag)) {
        $client->Message(14, "You have completed The Mastery of Foresight (Raid)");
    }
    else {
        $client->Message(15, "You have not completed The Mastery of Foresight (Raid)");
    }
    if(defined($mpg_raid_hatred_flag)) {
        $client->Message(14, "You have completed The Mastery of Hatred (Raid)");
    }
    else {
        $client->Message(15, "You have not completed The Mastery of Hatred (Raid)");
    }
    if(defined($mpg_raid_specialization_flag)) {
        $client->Message(14, "You have completed The Mastery of Specialization (Raid)");
    }
    else {
        $client->Message(15, "You have not completed The Mastery of Specialization (Raid)");
    }
    if(defined($mpg_group_destruction_flag)) {
        $client->Message(14, "You have completed The Mastery of Destruction (Group)");
    }
    else {
        $client->Message(15, "You have not completed The Mastery of Destruction (Group)");
    }
    if(defined($mpg_group_ingenuity_flag)) {
        $client->Message(14, "You have completed The Mastery of Ingenuity (Group)");
    }
    else {
        $client->Message(15, "You have not completed The Mastery of Ingenuity (Group)");
    }
    if(defined($mpg_group_weaponry_flag)) {
        $client->Message(14, "You have completed The Mastery of Weaponry (Group)");
    }
    else {
        $client->Message(15, "You have not completed The Mastery of Weaponry (Group)");
    }
    if(defined($mpg_group_subversion_flag)) {
        $client->Message(14, "You have completed The Mastery of Subversion (Group)");
    }
    else {
        $client->Message(15, "You have not completed The Mastery of Subversion (Group)");
    }
    if(defined($mpg_group_fear_flag)) {
        $client->Message(14, "You have completed The Mastery of Fear (Group)");
    }
    else {
        $client->Message(15, "You have not completed The Mastery of Fear (Group)");
    }
    if(defined($mpg_group_efficiency_flag)) {
        $client->Message(14, "You have completed The Mastery of Efficiency (Group)");
    }
    else {
        $client->Message(15, "You have not completed The Mastery of Efficiency (Group)");
    }
}

