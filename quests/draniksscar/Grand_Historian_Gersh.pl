# Grand_Historian_Gersh (302051)

sub EVENT_SAY {
    my $knowledge = quest::saylink("knowledge", 1);
    my $passing = quest::saylink("passing", 1);
    my $caves = quest::saylink("caves", 1);
    my $others = quest::saylink("others", 1);
    my $access = quest::saylink("access", 1);
    my $worthy = quest::saylink("worthy", 1);
    my $back = quest::saylink("back", 1);
    my $Trials = quest::saylink("Trials", 1);
    my $Learning = quest::saylink("Learning", 1);
    my $Mastery = quest::saylink("Mastery", 1);
    my $remnants = quest::saylink("remnants", 1);
    my $kyv = quest::saylink("kyv", 1);
    my $murkglider = quest::saylink("murkglider", 1);
    my $girplan = quest::saylink("girplan", 1);

    if($text=~/Hail/i) {
        quest::say("Greetings traveler, are you here seeking $knowledge? or just $passing through?");
        quest::say("Greetings, traveler. I am Grand Historian Gersh and I can open your mind to the history of our people if you wish.  I can show you the [ $remnants ] of our caves where we hid from the raiding Muramite Army.");
    }
    if($text=~/knowledge/i && defined $qglobals{"EpicBox"} == 1) {
        quest::setglobal("EpicOne", 1, 5, "F");
        quest::say("I am Grand Historian Gersh and I can open your mind to the history of our people if you wish. I can show you the remnants of our $caves where we hid from the raiding Muramite Army.");
    }
    if($text=~/passing/i) {
        quest::say("Be Gone from this place! You have not reached sufficient skill to even attempt what I could show you.");
    }
    if($text=~/Hail/i && defined $qglobals{"DraniksAdead"} == 1){
        quest::say("Alas the monsters within have proven to be your undoing. I shall send you back to the Cave of Trials and your lessons can continue.");
        quest::delglobal("DraniksAdead");
        quest::setglobal("EpicTwo", 1, 5, "F");
        quest::say("Your corpse is outside the cave entrance");
    }
    if($text=~/Hail/i && defined $qglobals{"DraniksBdead"} == 1) {
        quest::say("Alas the monsters within have proven to be your undoing. I shall send you back to the Cave of Learning and your lessons can continue.");
        quest::delglobal("DraniksBdead");
        quest::setglobal("EpicThree", 1, 5, "F");
        quest::say("Your corpse is outside the cave entrance");
    }
    if($text=~/Hail/i && defined $qglobals{"DraniksCdead"} == 1) {
        quest::say("Alas the monsters within have proven to be your undoing. I shall send you back to the Cave of Mastery and your lessons can continue.");
        quest::delglobal("DraniksCdead");
        quest::setglobal("EpicFour", 1, 5, "F");
        quest::say("Your corpse is outside the cave entrance");
    }
    if($text=~/caves/i && defined $qglobals{"EpicOne"} == 1 && $ulevel >= 50) {
        quest::say("There are several caves in the area, some we used to hide in, this is true but there are $others also.");
    }
    if($text=~/others/i && defined $qglobals{"EpicOne"} == 1 && $ulevel >= 50) {
        quest::say("Special caves where only the best of the best are given $access.");
    }
    if($text=~/access/i && defined $qglobals{"EpicOne"} == 1 && $ulevel >= 50) {
        quest::say("Only those who have proven themselves $worthy may enter these special caves.");
        quest::delglobal("EpicOne");
        quest::setglobal("Passed", 1, 5, "F");
    }
    if($text=~/worthy/i && defined $qglobals{"Passed"} == 1 && $ulevel >= 50) {
        quest::say("You $name have passed the worthiness test. You shall be granted access to the special caves.");
        quest::say("Depending on how many seasons you have under your belt, I can send you to the Cave of $Trials, the Cave of $Learning or the Cave of $Mastery.");
        quest::delglobal("Passed");
        quest::setglobal("EpicChoice", 1, 5, "F");
    }
    if($text=~/Trials/i && defined $qglobals{"EpicChoice"} == 1 && $ulevel <= 55  && $ulevel >= 50) {
        quest::say("As you wish my friend you may enter the Cave of Trials.");
        quest::say("If you should happen to meet with an untimely death, I can assist you and return you to the cave where your body is.");
        quest::delglobal("EpicChoice");
        quest::setglobal("EpicTwo", 1, 5, "F");
        if(defined($qglobals{$name."dranikhollowsa9"})) {
            my $QGlobalValue = $qglobals{$name."dranikhollowsa9"};
            quest::MovePCInstance(318, $QGlobalValue, 0.0, 0.0, -11.1); # dranikhollowsa
        }
        else {
            my $instanceID = quest::CreateInstance("dranikhollowsa", 9, 28800);
            quest::AssignToInstance($instanceID);
            quest::setglobal($name."dranikhollowsa9", $instanceID, 7, "H6");
            quest::MovePCInstance(318, $instanceID, 0.0, 0.0, -11.1); # dranikhollowsa
        }
    }
    if($text=~/Learning/i && defined $qglobals{"EpicChoice"} == 1 && $ulevel <= 59  && $ulevel >= 56){
        quest::say("As you wish my friend you may enter the Cave of Learning.");
        quest::say("If you should happen to meet with an untimely death, I can assist you and return you to the cave where your body is.");
        quest::delglobal("EpicChoice");
        quest::setglobal("EpicThree", 1, 5, "F");
        if(defined($qglobals{$name."dranikhollowsb9"})) {
            my $QGlobalValue = $qglobals{$name."dranikhollowsb9"};
            quest::MovePCInstance(318, $QGlobalValue, 0.0, -447.0, -36.0);  #dranikhollowsb
        }
        else {
            my $instanceID = quest::CreateInstance("dranikhollowsb", 9, 28800);
            quest::AssignToInstance($instanceID);
            quest::setglobal($name."dranikhollowsb9", $instanceID, 7, "H6");
            quest::MovePCInstance(319, $instanceID, 0.0, -447.0, -36.0);  #dranikhollowsb
        }
    }
    if($text=~/Mastery/i && defined $qglobals{"EpicChoice"} == 1 && $ulevel >= 60) {
        quest::say("Well done my friend you may enter the Cave of Mastery.");
        quest::say("If you should happen to meet with an untimely death, I can assist you and return you to the cave where your body is.");
        quest::delglobal("EpicChoice");
        quest::setglobal("EpicFour", 1, 5, "F");
        if(defined($qglobals{$name."dranikhollowsc9"})) {
            my $QGlobalValue = $qglobals{$name."dranikhollowsc9"};
            quest::MovePCInstance(320, $QGlobalValue, 5.0, -51.0, -44.6); #dranikhollowsc
        }
        else {
            my $instanceID = quest::CreateInstance("dranikhollowsc", 9, 28800);
            quest::AssignToInstance($instanceID);
            quest::setglobal($name."dranikhollowsc9", $instanceID, 7, "H6");
            quest::MovePCInstance(320, $instanceID, 5.0, -51.0, -44.6); #dranikhollowsc
        }
    }
    if($text=~/remnants/i) {
        quest::say("You have chosen to explore the Caves of Dranik. The caves are home to some frightening creatures. The caves you will be exploring are home to a vicious pair of creatures known for their strength and cunning. Should you come across a [ $kyv ] known as the Kyv Bowkeeper, or an Ukun known as the Ukun Fleshrender, prepare yourself for a tough battle. The battle might be hard fought, but some would say the riches are well worth it.");
        quest::say("You have chosen to explore the Caves of Dranik. The caves are home to some frightening creatures. The caves you will be exploring are home to a vicious pair of creatures known for their strength and cunning. Should you come across a [ $murkglider ] known as the Inky Murkglider, or a rat known as Silentpaw, prepare yourself for a tough battle. The battle might be hard fought, but some would say the riches are well worth it.");
        quest::say("You have chosen to explore the Caves of Dranik. The caves are home to some frightening creatures. The caves you will be exploring are home to a vicious pair of creatures known for their strength and cunning. Should you come across a [ $girplan ] known as the Girplan Pathmaker, or a discordling known as the Discordling Hollower, prepare yourself for a tough battle. The battle might be hard fought, but some would say the riches are well worth it.");
        quest::say("Be safe in your travels through the caves, $name");
    }
    if($text=~/kyv/i) {
        quest::say("This expedition is not yet available. Send all complaints to The Rathe Management.");
        return;
        my $QGlobalValue1 = $client->GetQGlobal($name.".dranikhollowsb1");
        if($QGlobalValue1) {
            $client->Message(15, "You are already assigned to this expedition.");
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
                my $instance_ID = quest::CreateInstance('dranikhollowsb', 1, 21600);
                my $arraySize = @groupclients;
                if($arraySize > 1) {
                    quest::AssignGroupToInstance($instance_ID);
                }
                elsif($arraySize >= 1) {
                    quest::AssignBotGroupToInstance($instance_ID);
                }
                quest::setgroupglobal("dranikhollowsb1", $instance_ID, 5, "H6");
                $client->MarkCompassLoc(-2066.6, 395, 147);
                quest::say("Dranik's Hollows: Fire Pit is now available to you.");
            }
        }
        else {
            if($client->GetGM()) {
                my $GM_instance_ID = quest::CreateInstance('dranikhollowsb', 1, 21600);
                quest::AssignToInstance($GM_instance_ID);
                quest::MovePCInstance(319, $GM_instance_ID, 0.0, -447.0, -36.0);
            }
            else {
                $client->Message(15, "You must have a group of up to 6 members for this expedition.");
            }
        }
    }
    if($text=~/murkglider/i) {
        my $QGlobalValue1 = $client->GetQGlobal($name.".dranikhollowsc1");
        if($QGlobalValue1) {
            $client->Message(15, "You are already assigned to this expedition.");
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
                my $instance_ID = quest::CreateInstance('dranikhollowsc', 1, 21600);
                my $arraySize = @groupclients;
                if($arraySize > 1) {
                    quest::AssignGroupToInstance($instance_ID);
                }
                elsif($arraySize >= 1) {
                    quest::AssignBotGroupToInstance($instance_ID);
                }
                quest::setgroupglobal("dranikhollowsc1", $instance_ID, 5, "H6");
                $client->MarkCompassLoc(-2050, 581, 211);
                quest::say("Dranik's Hollows: Murkglider Hive is now available to you.");
            }
        }
        else {
            if($client->GetGM()) {
                my $GM_instance_ID = quest::CreateInstance('dranikhollowsc', 1, 21600);
                quest::AssignToInstance($GM_instance_ID);
                quest::MovePCInstance(319, $GM_instance_ID, 0.0, -447.0, -36.0);
            }
            else {
                $client->Message(15, "You must have a group of up to 6 members for this expedition.");
            }
        }
    }
    if($text=~/girplan/i) {
        quest::say("This expedition is not yet available. Send all complaints to The Rathe Management.");
        return;
        my $QGlobalValue1 = $client->GetQGlobal($name.".dranikhollowsa1");
        if($QGlobalValue1) {
            $client->Message(15, "You are already assigned to this expedition.");
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
                my $instance_ID = quest::CreateInstance('dranikhollowsa', 1, 21600);
                my $arraySize = @groupclients;
                if($arraySize > 1) {
                    quest::AssignGroupToInstance($instance_ID);
                }
                elsif($arraySize >= 1) {
                    quest::AssignBotGroupToInstance($instance_ID);
                }
                quest::setgroupglobal("dranikhollowsa1", $instance_ID, 5, "H6");
                $client->MarkCompassLoc(-2027, 17.6, 207);
                quest::say("Dranik's Hollows: Watering Hole is now available to you.");
            }
        }
        else {
            if($client->GetGM()) {
                my $GM_instance_ID = quest::CreateInstance('dranikhollowsa', 1, 21600);
                quest::AssignToInstance($GM_instance_ID);
                quest::MovePCInstance(318, $GM_instance_ID, 0.0, 0.0, -11.1);
            }
            else {
                $client->Message(15, "You must have a group of up to 6 members for this expedition.");
            }
        }
    }
}

