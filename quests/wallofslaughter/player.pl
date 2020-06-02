# Zone from Wall of Slaughter to Anguish by clicking barred gate.

sub EVENT_CLICKDOOR {
    my $door_id = ($doorid % 256);
    if($door_id == 3) {
        my $QGlobalValue = $client->GetQGlobal(${name}."anguish");
        if($QGlobalValue) {
            $client->Message(14, "Sending you back to your instance.");
            quest::MovePCInstance(317, $QGlobalValue, -9, -2466, -79, 255);
        }
        else {
            my $flagged = 1;
            my @clients;
            if($client->IsGrouped()) {
                my $the_group = $client->GetGroup();
                my $nMembers = $the_group->GroupCount();
                for($i=0; $i<$nMembers; $i++) {
                    my $member = $the_group->GetMember($i);
                    if($the_group->IsClient($member)) {
                        my $ClientName = $member->GetCleanName();
                        my $QuestGlobalValue = $member->GetQGlobal("oow_rss_taromani_insignias");
                        if(!$QuestGlobalValue) {
                            $flagged = 0;
                            quest::echo(15, "$ClientName is not protected from the chaos magic in Mata Muram's citadel.");
                        }
                        $QuestGlobalValue = $member->GetQGlobal("oow_mpg_raids_complete");
                        if(!$QuestGlobalValue) {
                            $flagged = 0;
                            quest::echo(15, "$ClientName must complete the Muramite Proving Grounds raid trials.");
                        }
                        $QuestGlobalValue = $member->GetQGlobal("Anguish_augs");
                        if(!$QuestGlobalValue) {
                            $flagged = 0;
                        }
                        if($flagged == 1) {
                            push(@clients, $member);
                        }
                    }
                }
            }
            else {
                if(!defined($oow_rss_taromani_insignias)) {
                    $flagged = 0;
                    quest::echo(15, "$name is not protected from the chaos magic in Mata Muram's citadel.");
                }
                if(!defined($oow_mpg_raids_complete)) {
                    $flagged = 0;
                    quest::echo(15, "$name must complete the Muramite Proving Grounds raid trials.");
                }
                if(defined($Anguish_augs)) {
                    $flagged = 0;
                }
                $oow_rss_taromani_insignias = undef;
                $oow_mpg_raids_complete = undef;
                $Anguish_augs = undef;
            }
            if($flagged == 1) {
                quest::echo(15, "The door swings wide and allows you entrance to Anguish, the Fallen Palace.");
                my $instance_ID = quest::CreateInstance("anguish", 0, 28800);
                my $arraySize = @clients;
                if($arraySize > 1) {
                    quest::AssignGroupToInstance($instance_ID);
                    quest::setgroupglobal("anguish", $instance_ID, 7, "H8");
                    quest::MoveGroupInstance(317, $instance_ID, -9, -2466, -79, 255);
                }
                else {
                    quest::AssignToInstance($instance_ID);
                    quest::setglobal(${name}."anguish", $instance_ID, 7, "H8");
                    quest::MovePCInstance(317, $instance_ID, -9, -2466, -79, 255);
                }
            }
            else {
                quest::echo(15, "The way to Anguish is blocked at this time.");
            }
        }
    }
}

