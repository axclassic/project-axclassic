#####################################
##Logic for opening sundial portals
##into Plane of Time B
##zone: Plane of Time A
##alternate method for entry by patrikpatrik
## 3rd revision 08/19/2022 - Congdar
#####################################

sub EVENT_ZONE {
    @corpse = $entity_list->GetCorpseList();
    if(@corpse) {
        foreach $ent (@corpse) {
            $corpseName = $ent->GetOwnerName();
            if($corpseName eq $name) {
                #randomize corpse loc in graveyard area
                my $ex = int(rand(40));
                my $yy = int(rand(45));
                $ent->GMMove((-0.2)+$ex, 145.6+$yy, 10.9);
            }
        }
    }
    quest::delglobal("potimeaLD.".$name);
}
#END sub EVENT_ZONE

sub EVENT_ENTERZONE {
	$client->Message(15, "Welcome to Plane of Time $name! If you're here to access The Plane of Time, the portals are protected by five Portal Guardians. The portals will activate when the Portal Guardians are cleared. Once you begin, you only have 60 minutes.");
}

sub EVENT_CLICKDOOR {
    my $d_id = ($doorid % 256);
    #$client->Message(14, "Door Clicked doorid = $doorid");
    #$client->Message(14, "Door Clicked d_id = $d_id");
    my $PortalEventPassed = $client->GetQGlobal($name.".potimea_portal_event_timer");
    my $QGlobalValue1 = $client->GetQGlobal($name.".potimeb_corpse");
    my $QGlobalValue2 = $client->GetQGlobal($name.".potimeB");
    my $QGlobalValue3 = $client->GetQGlobal($name.".potimeA");
    if(Five_Bosses_Are_Dead() && ($PortalEventPassed || $QGlobalValue2)) {
        if((($doorid == 64) || ($d_id == 64)) ||
            (($doorid == 44) || ($d_id == 44)) ||
            (($doorid == 49) || ($d_id == 49)) ||
            (($doorid == 54) || ($d_id == 54)) ||
            (($doorid == 59) || ($d_id == 59))) {
            $client->Message(14, "The portal, dim at first, begins to glow brighter.");
            $client->Message(14, "The portal flashes briefly, then glows steadily.");

            ##
            ## Instance Code
            ##
            ## Every player or group gets their own private zone.
            ## It can be re-entered if you die up to 3 hours.
            ## It can handle Solo players or a group with multiple Clients should some friend group with somebody
            ## by creating a unique name flag that matches with their instance so nobody enters the wrong instance
            ##
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

            #quest::ze(15, "QGlobalValue1 = $QGlobalValue1");
            #quest::ze(15, "QGlobalValue2 = $QGlobalValue2");
            if($QGlobalValue1) {
                if($client->GetGroup()) {
                    quest::setgroupglobal($name.".potimeb_corpse", $QGlobalValue1, 7, "M1");
                    quest::MoveGroupInstance(223, $QGlobalValue2, 851, -141, 395);
                }
                else {
                    quest::setglobal($name.".potimeb_corpse", $QGlobalValue1, 7, "M1");
                    quest::MovePCInstance(223, $QGlobalValue2, 851, -141, 395);
                }
                return;
            }
            elsif($QGlobalValue2) {
                if($client->GetGroup()) {
                    quest::MoveGroupInstance(223, $QGlobalValue2, -36, 1352, 496);
                }
                else {
                    quest::MovePCInstance(223, $QGlobalValue2, -36, 1352, 496);
                }
                return;
            }
            else {
                my $PoTimeB_Instance_Counter = 0;
                if(defined $qglobals{pop_potimeb_instances}) {
                    #quest::ze(15, "pop_potimeb_instances = $qglobals{pop_potimeb_instances}");
                    $PoTimeB_Instance_Counter = $qglobals{pop_potimeb_instances};
                    if($PoTimeB_Instance_Counter >= 5) {
                        $client->Message(14, "There are no available instances for The Plane of Time.");
                        return;
                    }
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                    $PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter + 1;
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                }
                else {
                    $PoTimeB_Instance_Counter = 1;
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                }
                my $arraySize = @clients;
                if($arraySize > 1) {
                    my $instance_ID = quest::CreateInstance('potimeB', $PoTimeB_Instance_Counter, 25200);
                    quest::setglobal("pop_potimeb_instances", $PoTimeB_Instance_Counter, 7, "H7");
                    quest::AssignGroupToInstance($instance_ID);
                    quest::setgroupglobal(".potimeB", $instance_ID, 7, "H7");
                    quest::setgroupglobal(".potimeA", $QGlobalValue3, 7, "H7");
                    quest::MoveGroupInstance(223, $instance_ID, -36, 1352, 496);
                }
                else {
                    my $instance_ID = quest::CreateInstance('potimeB', $PoTimeB_Instance_Counter, 3600);
                    quest::setglobal("pop_potimeb_instances", $PoTimeB_Instance_Counter, 7, "H7");
                    quest::AssignToInstance($instance_ID);
                    quest::setglobal($name.".potimeB", $instance_ID, 7, "H7");
                    quest::setglobal($name.".potimeA", $QGlobalValue3, 7, "H7");
                    #quest::ze(15, "Congdar short test.");
                    quest::MovePCInstance(223, $instance_ID, -36, 1352, 496);
                }
            }
            ##
            ## End Instance Code
            ##
        }
        elsif((($doorid == 65) || ($d_id == 65)) ||
              (($doorid == 45) || ($d_id == 45)) ||
              (($doorid == 50) || ($d_id == 50)) ||
              (($doorid == 55) || ($d_id == 55)) ||
              (($doorid == 60) || ($d_id == 60))) {
            $client->Message(14, "The portal, dim at first, begins to glow brighter.");
            $client->Message(14, "The portal flashes briefly, then glows steadily.");

            ##
            ## Instance Code
            ##
            ## Every player or group gets their own private zone.
            ## It can be re-entered if you die up to 3 hours.
            ## It can handle Solo players or a group with multiple Clients should some friend group with somebody
            ## by creating a unique name flag that matches with their instance so nobody enters the wrong instance
            ##
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

            #quest::ze(15, "QGlobalValue1 = $QGlobalValue1");
            #quest::ze(15, "QGlobalValue2 = $QGlobalValue2");
            if($QGlobalValue1) {
                if($client->GetGroup()) {
                    quest::setgroupglobal($name.".potimeb_corpse", $QGlobalValue1, 7, "M1");
                    quest::AssignGroupToInstance($QGlobalValue2);
                    quest::MoveGroupInstance(223, $QGlobalValue2, 851, -141, 395);
                }
                else {
                    quest::setglobal($name.".potimeb_corpse", $QGlobalValue1, 7, "M1");
                    quest::MovePCInstance(223, $QGlobalValue2, 851, -141, 395);
                }
                return;
            }
            elsif($QGlobalValue2) {
                if($client->GetGroup()) {
                    quest::MoveGroupInstance(223, $QGlobalValue2, -36, 1352, 496);
                }
                else {
                    quest::MovePCInstance(223, $QGlobalValue2, -36, 1352, 496);
                }
                return;
            }
            else {
                my $PoTimeB_Instance_Counter = 0;
                if(defined $qglobals{pop_potimeb_instances}) {
                    #quest::ze(15, "pop_potimeb_instances = $qglobals{pop_potimeb_instances}");
                    $PoTimeB_Instance_Counter = $qglobals{pop_potimeb_instances};
                    if($PoTimeB_Instance_Counter >= 5) {
                        $client->Message(14, "There are no available instances for The Plane of Time.");
                        return;
                    }
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                    $PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter + 1;
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                }
                else {
                    $PoTimeB_Instance_Counter = 1;
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                }
                my $arraySize = @clients;
                if($arraySize > 1) {
                    my $instance_ID = quest::CreateInstance('potimeB', $PoTimeB_Instance_Counter, 25200);
                    quest::setglobal("pop_potimeb_instances", $PoTimeB_Instance_Counter, 7, "H7");
                    quest::AssignGroupToInstance($instance_ID);
                    quest::setgroupglobal(".potimeB", $instance_ID, 7, "H7");
                    quest::setgroupglobal(".potimeA", $QGlobalValue3, 7, "H7");
                    quest::MoveGroupInstance(223, $instance_ID, -35, 1636, 496);
                }
                else {
                    my $instance_ID = quest::CreateInstance('potimeB', $PoTimeB_Instance_Counter, 25200);
                    quest::setglobal("pop_potimeb_instances", $PoTimeB_Instance_Counter, 7, "H7");
                    quest::AssignToInstance($instance_ID);
                    quest::setglobal($name.".potimeB", $instance_ID, 7, "H7");
                    quest::setglobal($name.".potimeA", $QGlobalValue3, 7, "H7");
                    quest::MovePCInstance(223, $instance_ID, -35, 1636, 496);
                }
            }
            ##
            ## End Instance Code
            ##
        }
        elsif((($doorid == 66) || ($d_id == 66)) ||
              (($doorid == 46) || ($d_id == 46)) ||
              (($doorid == 51) || ($d_id == 51)) ||
              (($doorid == 56) || ($d_id == 56)) ||
              (($doorid == 61) || ($d_id == 61))) {
            $client->Message(14, "The portal, dim at first, begins to glow brighter.");
            $client->Message(14, "The portal flashes briefly, then glows steadily.");

            ##
            ## Instance Code
            ##
            ## Every player or group gets their own private zone.
            ## It can be re-entered if you die up to 3 hours.
            ## It can handle Solo players or a group with multiple Clients should some friend group with somebody
            ## by creating a unique name flag that matches with their instance so nobody enters the wrong instance
            ##
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

            #quest::ze(15, "QGlobalValue1 = $QGlobalValue1");
            #quest::ze(15, "QGlobalValue2 = $QGlobalValue2");
            if($QGlobalValue1) {
                if($client->GetGroup()) {
                    quest::setgroupglobal($name.".potimeb_corpse", $QGlobalValue1, 7, "M1");
                    quest::MoveGroupInstance(223, $QGlobalValue2, 851, -141, 395);
                }
                else {
                    quest::setglobal($name.".potimeb_corpse", $QGlobalValue1, 7, "M1");
                    quest::MovePCInstance(223, $QGlobalValue2, 851, -141, 395);
                }
                return;
            }
            elsif($QGlobalValue2) {
                if($client->GetGroup()) {
                    quest::MoveGroupInstance(223, $QGlobalValue2, -36, 1352, 496);
                }
                else {
                    quest::MovePCInstance(223, $QGlobalValue2, -36, 1352, 496);
                }
                return;
            }
            else {
                my $PoTimeB_Instance_Counter = 0;
                if(defined $qglobals{pop_potimeb_instances}) {
                    quest::ze(15, "pop_potimeb_instances = $qglobals{pop_potimeb_instances}");
                    $PoTimeB_Instance_Counter = $qglobals{pop_potimeb_instances};
                    if($PoTimeB_Instance_Counter >= 5) {
                        $client->Message(14, "There are no available instances for The Plane of Time.");
                        return;
                    }
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                    $PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter + 1;
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                }
                else {
                    $PoTimeB_Instance_Counter = 1;
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                }
                my $arraySize = @clients;
                if($arraySize > 1) {
                    my $instance_ID = quest::CreateInstance('potimeB', $PoTimeB_Instance_Counter, 25200);
                    quest::setglobal("pop_potimeb_instances", $PoTimeB_Instance_Counter, 7, "H7");
                    quest::AssignGroupToInstance($instance_ID);
                    quest::setgroupglobal(".potimeB", $instance_ID, 7, "H7");
                    quest::setgroupglobal(".potimeA", $QGlobalValue3, 7, "H7");
                    quest::MoveGroupInstance(223, $instance_ID, -35, 1636, 496);
                }
                else {
                    my $instance_ID = quest::CreateInstance('potimeB', $PoTimeB_Instance_Counter, 25200);
                    quest::setglobal("pop_potimeb_instances", $PoTimeB_Instance_Counter, 7, "H7");
                    quest::AssignToInstance($instance_ID);
                    quest::setglobal($name.".potimeB", $instance_ID, 7, "H7");
                    quest::setglobal($name.".potimeA", $QGlobalValue3, 7, "H7");
                    quest::MovePCInstance(223, $instance_ID, -35, 1636, 496);
                }
            }
            ##
            ## End Instance Code
            ##
        }
        elsif((($doorid == 67) || ($d_id == 67)) ||
              (($doorid == 47) || ($d_id == 47)) ||
              (($doorid == 52) || ($d_id == 52)) ||
              (($doorid == 57) || ($d_id == 57)) ||
              (($doorid == 62) || ($d_id == 62))) {
            $client->Message(14, "The portal, dim at first, begins to glow brighter.");
            $client->Message(14, "The portal flashes briefly, then glows steadily.");

            ##
            ## Instance Code
            ##
            ## Every player or group gets their own private zone.
            ## It can be re-entered if you die up to 3 hours.
            ## It can handle Solo players or a group with multiple Clients should some friend group with somebody
            ## by creating a unique name flag that matches with their instance so nobody enters the wrong instance
            ##
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

            #quest::ze(15, "QGlobalValue1 = $QGlobalValue1");
            #quest::ze(15, "QGlobalValue2 = $QGlobalValue2");
            if($QGlobalValue1) {
                if($client->GetGroup()) {
                    quest::setgroupglobal($name.".potimeb_corpse", $QGlobalValue1, 7, "M1");
                    quest::MoveGroupInstance(223, $QGlobalValue2, 851, -141, 395);
                }
                else {
                    quest::setglobal($name.".potimeb_corpse", $QGlobalValue1, 7, "M1");
                    quest::MovePCInstance(223, $QGlobalValue2, 851, -141, 395);
                }
                return;
            }
            elsif($QGlobalValue2) {
                if($client->GetGroup()) {
                    quest::MoveGroupInstance(223, $QGlobalValue2, -36, 1352, 496);
                }
                else {
                    quest::MovePCInstance(223, $QGlobalValue2, -36, 1352, 496);
                }
                return;
            }
            else {
                my $PoTimeB_Instance_Counter = 0;
                if(defined $qglobals{pop_potimeb_instances}) {
                    quest::ze(15, "pop_potimeb_instances = $qglobals{pop_potimeb_instances}");
                    $PoTimeB_Instance_Counter = $qglobals{pop_potimeb_instances};
                    if($PoTimeB_Instance_Counter >= 5) {
                        $client->Message(14, "There are no available instances for The Plane of Time.");
                        return;
                    }
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                    $PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter + 1;
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                }
                else {
                    $PoTimeB_Instance_Counter = 1;
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                }
                my $arraySize = @clients;
                if($arraySize > 1) {
                    my $instance_ID = quest::CreateInstance('potimeB', $PoTimeB_Instance_Counter, 25200);
                    quest::setglobal("pop_potimeb_instances", $PoTimeB_Instance_Counter, 7, "H7");
                    quest::AssignGroupToInstance($instance_ID);
                    quest::setgroupglobal(".potimeB", $instance_ID, 7, "H7");
                    quest::setgroupglobal(".potimeA", $QGlobalValue3, 7, "H7");
                    quest::MoveGroupInstance(223, $instance_ID, -55, 569, 496);
                }
                else {
                    my $instance_ID = quest::CreateInstance('potimeB', $PoTimeB_Instance_Counter, 25200);
                    quest::setglobal("pop_potimeb_instances", $PoTimeB_Instance_Counter, 7, "H7");
                    quest::AssignToInstance($instance_ID);
                    quest::setglobal($name.".potimeB", $instance_ID, 7, "H7");
                    quest::setglobal($name.".potimeA", $QGlobalValue3, 7, "H7");
                    quest::MovePCInstance(223, $instance_ID, -55, 569, 496);
                }
            }
            ##
            ## End Instance Code
            ##
        }
        elsif((($doorid == 68) || ($d_id == 68)) ||
              (($doorid == 48) || ($d_id == 48)) ||
              (($doorid == 53) || ($d_id == 53)) ||
              (($doorid == 58) || ($d_id == 58)) ||
              (($doorid == 63) || ($d_id == 63))) {
            $client->Message(14, "The portal, dim at first, begins to glow brighter.");
            $client->Message(14, "The portal flashes briefly, then glows steadily.");

            ##
            ## Instance Code
            ##
            ## Every player or group gets their own private zone.
            ## It can be re-entered if you die up to 3 hours.
            ## It can handle Solo players or a group with multiple Clients should some friend group with somebody
            ## by creating a unique name flag that matches with their instance so nobody enters the wrong instance
            ##
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

            #quest::ze(15, "QGlobalValue1 = $QGlobalValue1");
            #quest::ze(15, "QGlobalValue2 = $QGlobalValue2");
            if($QGlobalValue1) {
                if($client->GetGroup()) {
                    quest::setgroupglobal($name.".potimeb_corpse", $QGlobalValue1, 7, "M1");
                    quest::MoveGroupInstance(223, $QGlobalValue2, 851, -141, 395);
                }
                else {
                    quest::setglobal($name.".potimeb_corpse", $QGlobalValue1, 7, "M1");
                    quest::MovePCInstance(223, $QGlobalValue2, 851, -141, 395);
                }
                return;
            }
            elsif($QGlobalValue2) {
                if($client->GetGroup()) {
                    quest::MoveGroupInstance(223, $QGlobalValue2, -36, 1352, 496);
                }
                else {
                    quest::MovePCInstance(223, $QGlobalValue2, -36, 1352, 496);
                }
                return;
            }
            else {
                my $PoTimeB_Instance_Counter = 0;
                if(defined $qglobals{pop_potimeb_instances}) {
                    quest::ze(15, "pop_potimeb_instances = $qglobals{pop_potimeb_instances}");
                    $PoTimeB_Instance_Counter = $qglobals{pop_potimeb_instances};
                    if($PoTimeB_Instance_Counter >= 5) {
                        $client->Message(14, "There are no available instances for The Plane of Time.");
                        return;
                    }
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                    $PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter + 1;
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                }
                else {
                    $PoTimeB_Instance_Counter = 1;
                    #quest::ze(15, "PoTimeB_Instance_Counter = $PoTimeB_Instance_Counter");
                }
                my $arraySize = @clients;
                if($arraySize > 1) {
                    my $instance_ID = quest::CreateInstance('potimeB', $PoTimeB_Instance_Counter, 25200);
                    quest::setglobal("pop_potimeb_instances", $PoTimeB_Instance_Counter, 7, "H7");
                    quest::AssignGroupToInstance($instance_ID);
                    quest::setgroupglobal(".potimeB", $instance_ID, 7, "H7");
                    quest::setgroupglobal(".potimeA", $QGlobalValue3, 7, "H7");
                    quest::MoveGroupInstance(223, $instance_ID, -27, 1103, 496);
                }
                else {
                    my $instance_ID = quest::CreateInstance('potimeB', $PoTimeB_Instance_Counter, 25200);
                    quest::setglobal("pop_potimeb_instances", $PoTimeB_Instance_Counter, 7, "H7");
                    quest::AssignToInstance($instance_ID);
                    quest::setglobal($name.".potimeB", $instance_ID, 7, "H7");
                    quest::setglobal($name.".potimeA", $QGlobalValue3, 7, "H7");
                    quest::MovePCInstance(223, $instance_ID, -27, 1103, 496);
                }
            }
            ##
            ## End Instance Code
            ##
        }
    }
    else {
        $client->Message(14, "The Portal is locked.");
    }
    $qglobals{pop_potimea_instances}=undef;
    $qglobals{pop_potimeb_instances}=undef;
    $PoTimeA_Instance_Counter=undef;
    $PoTimeB_Instance_Counter=undef;
    $QGlobalValue1=undef;
    $QGlobalValue2=undef;
    $QGlobalValue3=undef;
}
#END sub EVENT_CLICKDOOR

# This is a boolean return method undef for false and 1 for true
sub Five_Bosses_Are_Dead {
    my $Elemental = $entity_list->GetMobByNpcTypeID(219059);
    my $Undead = $entity_list->GetMobByNpcTypeID(219060);
    my $Animated = $entity_list->GetMobByNpcTypeID(219061);
    my $Golem = $entity_list->GetMobByNpcTypeID(219062);
    my $Guardian = $entity_list->GetMobByNpcTypeID(219063);
    if($Elemenal || $Undead || $Animated || $Golem || $Guardian) {
        quest::ze(15, "A booming echo bellows from across the sky, 'You have more to dispatch to appease the gods...'");
        return undef;
    }
    return 1;
}

sub EVENT_DISCONNECT {
    # S20  20 seconds qglobal
    quest::setglobal("potimeaLD.".$name, "1", 7, "H7");
}

