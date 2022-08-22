sub EVENT_CLICKDOOR {
    my $d_id = ($doorid % 256);
    $client->Message(14, "doorid = $doorid");
    $client->Message(14, "d_id = $d_id");
    if($doorid == 7) {
        if(defined $qglobals{pop_poi_dragon}) {
            $client->Message(15,"You remember Nitram's words - 'three small turns to the right on the bottommost rivet should open the door'.");
            quest::forcedooropen(7);
        }
    }
    if($doorid == 145) {
        if(defined $qglobals{pop_time_maelin}) {
            $client->SetZoneFlag(219);
            $client->SetZoneFlag(223);
            $client->Message(14,"You have received a character flag!");
            $client->Message(15,"The ages begin to tear through your body. You wake to find yourself in another time.");

            ##
            ## Instance Code
            ##
            ## Every player or group gets their own private zone.
            ## It can be re-entered if you die up to 3 hours.
            ## It can handle Solo players or a group with multiple Clients should some friend group with somebody
            ## by creating a unique name flag that matches with their instance so nobody enters the wrong instance
            ##
            my $PoTimeA_Instance_Counter = 0;
            if(defined $qglobals{pop_potimea_instances}) {
                $PoTimeA_Instance_Counter = $qglobals{pop_potimea_instances};
            }
            else {
                $PoTimeA_Instance_Counter = 1;
            }
            if($PoTimeA_Instance_Counter >= 5) {
                $client->Message(14, "There are no available instances for The Plane of Time.");
                return;
            }
            $PoTimeA_Instance_Counter = $PoTimeA_Instance_Counter + 1;
            quest::setglobal("pop_potimea_instances", $PoTimeA_Instance_Counter, 7, "H20");
            my @clients;
            my $the_group = $client->GetGroup();
            if($the_group) {
                my $nMembers = $the_group->GroupCount();
                for($i=0; $i<$nMembers; $i++) {
                    my $member = $the_group->GetMember($i);
                    if($the_group->IsClient($member)) {
                        push(@clients, $member);
                    }
                }
            }
            my $QGlobalValue2 = $client->GetQGlobal(${name}."potimeA");
            if($QGlobalValue2) {
                quest::MoveGroupInstance(219, $QGlobalValue2, 1, 6, 8);
                return;
            }
            else {
                my $instance_ID = quest::CreateInstance('potimeA', $PoTimeA_Instance_Counter, 25200);
                $PoTimeA_Instance_Counter = $PoTimeA_Instance_Counter + 1;
                my $arraySize = @clients;
                if($arraySize > 1) {
                    quest::AssignGroupToInstance($instance_ID);
                    quest::setgroupglobal("potimeA", $instance_ID, 7, "H7");
                }
                else {
                    quest::AssignToInstance($instance_ID);
                    quest::setglobal(${name}."potimeA", $instance_ID, 7, "H7");
                }
            }
            ##
            ## End Instance Code
            ##
        }
    }
    $qglobals{pop_poi_dragon}=undef;
    $qgloabls{pop_time_maelin}=undef;
}

