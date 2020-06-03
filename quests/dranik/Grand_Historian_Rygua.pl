# Grand_Historian_Gersh (302051)

sub EVENT_SAY {
    my $dragornforeman = quest::saylink("Dragorn Foreman", 1);
    my $silaniajanaid = quest::saylink("Silania Janaid", 1);
    my $stonefoot = quest::saylink("Stonefoot", 1);
    my $masterofthewatch = quest::saylink("Master of the Watch", 1);
    my $highsorceressvitara = quest::saylink("High Sorceress Vi'Tara", 1);
    my $dragornmarshalgreshka = quest::saylink("Dragorn Marshal Greshka", 1);
    my $catacombs = quest::saylink("Catacombs", 1);
    my $sewers = quest::saylink("Sewers", 1);

    if($text=~/Hail/i) {
        quest::say("Greetings, traveler. I am Grand Historian Rygua and I can open your mind to the history of our people if you wish.  I can show you the [ $catacombs ] or the [ $sewers ].");
    }
    if($text=~/Catacombs/i) {
        quest::say("You have chosen to explore the Catacombs of Dranik. I have heard tales of frightening creatures of great power that lurk in the darkest shadows of the catacombs. Should you come across a dragorn known as $dragornmarshalgreshka, or an ikaav enchantress known as High Enchantress Zy'chia, prepare yourself for a tough battle. The battle might be hard fought, but some would say the riches are well worth it.");
        quest::say("You have chosen to explore the Catacombs of Dranik. I have heard tales of frightening creatures of great power that lurk in the darkest shadows of the catacombs. Should you come across a noc known as Elite Overlord Vijaz, or an ikaav wizard known as $highsorceressvitara, prepare yourself for a tough battle. The battle might be hard fought, but some would say the riches are well worth it.");
        quest::say("You have chosen to explore the Catacombs of Dranik. I have heard tales of frightening creatures of great power that lurk in the darkest shadows of the catacombs. Should you come across a noc known as the $masterofthewatch, or an ikaav mage named, Elite Pixxt K'illiga, prepare yourself for a tough battle. The battle might be hard fought, but some would say the riches are well worth it.");
        quest::say("Be safe in your travels through the Catacombs.");
    }
    if($text=~/Sewers/i) {
        quest::say("You have chosen to explore the Sewers of Dranik. Beware during your travels there should you come across discordling named Craftsman Ferinio, or a golem known as $stonefoot. Both are rare and powerful adversaries. Should they come out of hiding, you will have a tough battle on your hands. However, some would say the riches are well worth it.");
        quest::say("You have chosen to explore the Sewers of Dranik. Beware during your travels there should you come across an ikaav mage named $silaniajanaid, or a bat known as the Nightfang Glider. Both are rare and powerful adversaries. Should they come out of hiding, you will have a tough battle on your hands. However, some would say the riches are well worth it.");
        quest::say("You have chosen to explore the Sewers of Dranik. Beware during your travels there should you come across a dragorn known as the $dragornforeman, or an ukun known as the Ukun Sentinel. Both are rare and powerful adversaries. Should they come out of hiding, you will have a tough battle on your hands. However, some would say the riches are well worth it.");
        quest::say("Be safe in your travels through the Sewers.");
    }
    if($text=~/Dragorn Marshal Greshka/i) {
        quest::say("This adventure is not yet available. Send all complaints to The Rathe Management.");
        return;
    }
    if($text=~/High Sorceress Vi'Tara/i) {
        quest::say("This adventure is not yet available. Send all complaints to The Rathe Management.");
        return;
    }
    if($text=~/Silania Janaid/i) {
        quest::say("This adventure is not yet available. Send all complaints to The Rathe Management.");
        return;
    }
    if($text=~/Stonefoot/i) {
        quest::say("This adventure is not yet available. Send all complaints to The Rathe Management.");
        return;
    }
    if($text=~/Master of the Watch/i) {
        my $QGlobalValue1 = $client->GetQGlobal($name.".dranikcatacombsc1");
        if($QGlobalValue1) {
            $client->Message(15, "You are already assigned to this adventure.");
            return;
        }
        my @groupclients;
        if($client->IsGrouped()) {
            my $bot_raid_count = $entity_list->GetBotRaidCount($client);
            if($bot_raid_count > 0) {
                quest::say("This is a group only adventure, no raiding.");
                return;
            }
            my $the_group = $client->GetGroup();
            my $nMembers = $the_group->GroupCount();
            if(($nMembers >=2) && ($nMembers <= 6)) {
                for($i=0; $i<$nMembers; $i++) {
                    my $member = $the_group->GetMember($i);
                    if($the_group->IsClient($member)) {
                        push(@groupclients, $member);
                    }
                }
                my $instance_ID = quest::CreateInstance('dranikcatacombsc', 1, 21600);
                my $arraySize = @groupclients;
                if($arraySize > 1) {
                    quest::AssignGroupToInstance($instance_ID);
                }
                elsif($arraySize >= 1) {
                    quest::AssignBotGroupToInstance($instance_ID);
                }
                quest::setgroupglobal("dranikcatacombsc1", $instance_ID, 5, "H6");
                $client->MarkCompassLoc(-292.52, 1031.42, -75.75);
                quest::say("Catacombs of Dranik is now available to you.");
            }
        }
        else {
            if($client->GetGM()) {
                my $GM_instance_ID = quest::CreateInstance('dranikcatacombsc', 1, 21600);
                quest::AssignToInstance($GM_instance_ID);
                quest::MovePCInstance(330, $GM_instance_ID, -10, -214, -3, 114);
            }
            else {
                $client->Message(15, "You must have a group of up to 6 members for this expedition.");
            }
        }
    }
    if($text=~/Dragorn Foreman/i) {
        my $QGlobalValue1 = $client->GetQGlobal($name.".draniksewersc1");
        if($QGlobalValue1) {
            $client->Message(15, "You are already assigned to this adventure.");
            return;
        }
        my @groupclients;
        if($client->IsGrouped()) {
            my $bot_raid_count = $entity_list->GetBotRaidCount($client);
            if($bot_raid_count > 0) {
                quest::say("This is a group only adventure, no raiding.");
                return;
            }
            my $the_group = $client->GetGroup();
            my $nMembers = $the_group->GroupCount();
            if(($nMembers >=2) && ($nMembers <= 6)) {
                for($i=0; $i<$nMembers; $i++) {
                    my $member = $the_group->GetMember($i);
                    if($the_group->IsClient($member)) {
                        push(@groupclients, $member);
                    }
                }
                my $instance_ID = quest::CreateInstance('draniksewersc', 1, 21600);
                my $arraySize = @groupclients;
                if($arraySize > 1) {
                    quest::AssignGroupToInstance($instance_ID);
                }
                elsif($arraySize >= 1) {
                    quest::AssignBotGroupToInstance($instance_ID);
                }
                quest::setgroupglobal("draniksewersc1", $instance_ID, 5, "H6");
                $client->MarkCompassLoc(-140.37, -1243.2, -236.43);
                quest::say("Sewers of Dranik is now available to you.");
            }
        }
        else {
            if($client->GetGM()) {
                my $GM_instance_ID = quest::CreateInstance('draniksewersc', 1, 21600);
                quest::AssignToInstance($GM_instance_ID);
                quest::MovePCInstance(333, $GM_instance_ID, -2.5, 4, -6, 0);
            }
            else {
                $client->Message(15, "You must have a group of up to 6 members for this expedition.");
            }
        }
    }
}

