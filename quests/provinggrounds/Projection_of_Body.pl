# Projection_of_Body (316040)

sub EVENT_SPAWN {
    quest::set_proximity($x-50, $x+50, $y-50, $y+50);
}

sub EVENT_ENTER {
    quest::say("Perception and split-second reactions are not something you can acquire in training.  It's a gift learned on the battlefield, and the penalty for being a slow learner is a quick and decisive death. Can you see the arrow as it sails toward your heart and sidestep out of the way? If you have this ability, now is the opportunity to prove your worth!");
}

sub EVENT_SAY {
    my $smallscale = quest::saylink("small-scale", 1);
    my $largescale = quest::saylink("large-scale", 1);
    my $endurance = quest::saylink("Endurance", 1);
    my $weaponry = quest::saylink("Weaponry", 1);
    my $progress = quest::saylink("progress", 1);

    if($text=~/hail/i) {
        quest::say("Halt, $name, and hear my words. Your background and your status are of no consequence. All are welcome to participate in the trials to prove their worth, or die trying. Whosoever approaches me has addressed the embodiment of Body, keeper of the trials of Weaponry and Endurance. The former is a small-scale test, while the latter is large-scale. My task is to explain the rules and usher hopefuls into the battle arena. Would you like to hear the rules for [ $smallscale ] or [ $largescale ] trials, or do you wish to enroll in [ $weaponry ] or [ $endurance ]?");
    }
    elsif($text=~/weaponry/i) {
        quest::say("The group trials are not yet available. Send all complaints to The Rathe Management.");
        return;
        my $flagged = 3;
        my @groupclients;
        if($client->IsGrouped()) {
            my $the_group = $client->GetGroup();
            my $nMembers = $the_group->GroupCount();
            for($i=0; $i<$nMembers; $i++) {
                my $member = $the_group->GetMember($i);
                if($the_group->IsClient($member)) {
                    my $ClientName = $member->GetCleanName();
                    my $QuestGlobalValue = $member->GetQGlobal("mpg_group_weaponry_lockout");
                    if($QuestGlobalValue) {
                        $flagged = 1;
                        my $qgduration = $member->GetQGlobalDuration("mpg_group_weaponry_lockout");
                        my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
                        $member->Message(15, "$name is locked out of the Weaponry trial for $timeleft.");
                    }
                    if($flagged == 2) {
                        push(@groupclients, $member);
                        $flagged = 3;
                    }
                }
            }
        }
        else {
            my $QuestGlobalValue = $client->GetQGlobal("mpg_group_weaponry_lockout");
            if($QuestGlobalValue) {
                $flagged = 1;
                my $qgduration = $client->GetQGlobalDuration("mpg_group_weaponry_lockout");
                my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
                $client->Message(15, "$name is locked out of the Weaponry trial for $timeleft.");
            }
        }
        if($flagged == 3) {
            my $QGlobalValue1 = $client->GetQGlobal(${name}."chambersb1");
            if($QGlobalValue1) {
                $client->Message(15, "You are already assigned to this trial.");
                return;
            }
            my $instance_ID = quest::CreateInstance('chambersb', 1, 3600);
            my $arraySize = @groupclients;
            if($arraySize > 1) {
                quest::AssignGroupToInstance($instance_ID);
                quest::setgroupglobal("chambersb1", $instance_ID, 7, "H1");
            }
            else {
                quest::AssignToInstance($instance_ID);
                quest::setglobal(${name}."chambersb1", $instance_ID, 7, "H1");
            }
            quest::say("Mastery of a single armament of choice is not enough. The time will come when the flexibility gained from proficiency in multiple weapon styles will turn the tide of a battle and the alternative is failure. You must come to understand the value of weaponry. If you have this ability, now is the opportunity to prove your worth!");
        }
    }
    elsif($text=~/endurance/i) {
        my $flagged = 2;
        my @clients;
        if($client->IsGrouped()) {
            my $the_group = $client->GetGroup();
            my $nMembers = $the_group->GroupCount();
            for($i=0; $i<$nMembers; $i++) {
                my $member = $the_group->GetMember($i);
                if($the_group->IsClient($member)) {
                    my $ClientName = $member->GetCleanName();
                    my $QuestGlobalValue = $member->GetQGlobal("mpg_raid_endurance_lockout");
                    if($QuestGlobalValue) {
                        $flagged = 1;
                        my $qgduration = $member->GetQGlobalDuration("mpg_raid_endurance_lockout");
                        my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
                        $member->Message(15, "$name is currently locked out of the Endurance trial for $timeleft.");
                    }
                    if($flagged == 2) {
                        push(@clients, $member);
                        $flagged = 3;
                    }
                }
            }
        }
        else {
            my $QuestGlobalValue = $client->GetQGlobal("mpg_raid_endurance_lockout");
            if($QuestGlobalValue) {
                $flagged = 1;
                my $qgduration = $client->GetQGlobalDuration("mpg_raid_endurance_lockout");
                my $timeleft = plugin::GetTimeLeft($qgduration, "DHM");
                $client->Message(15, "$name is currently locked out of the Endurance trial for $timeleft.");
            }
        }
        if($flagged == 3) {
            my $QGlobalValue2 = $client->GetQGlobal(${name}."chambersb2");
            if($QGlobalValue2) {
                $client->Message(15, "You are already assigned to this trial.");
                return;
            }
            my $instance_ID = quest::CreateInstance('chambersb', 2, 10800);
            my $arraySize = @clients;
            if($arraySize > 1) {
                quest::AssignGroupToInstance($instance_ID);
                quest::setgroupglobal("chambersb2", $instance_ID, 7, "H3");
            }
            else {
                quest::AssignToInstance($instance_ID);
                quest::setglobal(${name}."chambersb2", $instance_ID, 7, "H3");
            }
            quest::say("In a battle of attrition, an extended engagement, you must have the endurance to outlast your opposition. When the defense is inpenetrable, your tenacity is more important than your offensive prowess. If you have this ability, now is the oppurtunity to prove your worth.");
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

