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
        my $the_X = 1;
        my $the_Y = 1;
        my $the_Z = 1;
        my $the_H = 1;

        $client->Message(14, "The portal, dim at first, begins to glow brighter.");
        $client->Message(14, "The portal flashes briefly, then glows steadily.");

        if(($doorid == 44) || ($d_id == 44)) {
            # Time B Air Trial
            $the_X = -36;
            $the_Y = 1352;
            $the_Z = 496;
            $the_H = 66;
        }
        if(($doorid == 49) || ($d_id == 49)) {
            # Time B Water Trial
            $the_X = -51;
            $the_Y = 857;
            $the_Z = 496;
            $the_H = 66;
        }
        if(($doorid == 54) || ($d_id == 54)) {
            # Time B Earth Trial
            $the_X = -35;
            $the_Y = 1636;
            $the_Z = 496;
            $the_H = 66;
        }
        elsif(($doorid == 59) || ($d_id == 59)) {
            # Time B Fire Trial
            $the_X = -55;
            $the_Y = 569;
            $the_Z = 496;
            $the_H = 66;
        }
        elsif(($doorid == 64) || ($d_id == 64)) {
            # Time B Undead Trial
            $the_X = -27;
            $the_Y = 1103;
            $the_Z = 496;
            $the_H = 66;
        }

        ##
        ## Start Instance Code
        ##
        ## Every player or group gets their own private zone.
        ## It can be re-entered if you die up to 7 hours.
        ## It can handle Solo players or a group with multiple Clients should some friend group with somebody
        ## by creating a unique name flag that matches with their instance so nobody enters the wrong instance
        ##
        my @clients;
        my $the_group = $client->GetGroup();
        if($the_group) {
            my $nMembers = $the_group->GroupCount();
            for($i=0; $i<$nMembers; $i++) {
                my $member = $the_group->GetMember($i);
                if($member && $the_group->IsClient($member)) {
                    push(@clients, $member);
                }
            }
        }
        my $arraySize = @clients;

        #quest::ze(15, "QGlobalValue1 = $QGlobalValue1");
        #quest::ze(15, "QGlobalValue2 = $QGlobalValue2");
        if($QGlobalValue1) {
            if($arraySize > 1) {
                quest::setgroupglobal($name.".potimeb_corpse", $QGlobalValue1, 7, "M1");
                quest::MoveGroupInstance(223, $QGlobalValue2, $the_X, $the_Y, $the_Z, $the_H);
            }
            else {
                quest::setglobal($name.".potimeb_corpse", $QGlobalValue1, 7, "M1");
                quest::MovePCInstance(223, $QGlobalValue2, $the_X, $the_Y, $the_Z, $the_H);
            }
        }
        elsif($QGlobalValue2) {
            if($arraySize > 1) {
               quest::MoveGroupInstance(223, $QGlobalValue2, $the_X, $the_Y, $the_Z, $the_H);
            }
            else {
                quest::MovePCInstance(223, $QGlobalValue2, $the_X, $the_Y, $the_Z, $the_H);
            }
        }
        else {
            my $PoTimeB_Instance_Counter = 1;
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
            if($arraySize > 1) {
                my $PoTimeB_Instance_ID_1 = quest::CreateInstance('potimeb', $PoTimeB_Instance_Counter, 25200);
                quest::setglobal("pop_potimeb_instances", $PoTimeB_Instance_Counter, 7, "H7");
                quest::AssignGroupToInstance($PoTimeB_Instance_ID_1);
                quest::setgroupglobal(".potimeB", $PoTimeB_Instance_ID_1, 7, "H7");
                quest::setgroupglobal(".potimeA", $QGlobalValue3, 7, "H7");
                quest::MoveGroupInstance(223, $PoTimeB_Instance_ID_1, $the_X, $the_Y, $the_Z, $the_H);
            }
            else {
                my $PoTimeB_Instance_ID_2 = quest::CreateInstance('potimeb', $PoTimeB_Instance_Counter, 25200);
                quest::setglobal("pop_potimeb_instances", $PoTimeB_Instance_Counter, 7, "H7");
                quest::AssignToInstance($PoTimeB_Instance_ID_2);
                quest::setglobal($name.".potimeB", $PoTimeB_Instance_ID_2, 7, "H7");
                quest::setglobal($name.".potimeA", $QGlobalValue3, 7, "H7");
                quest::MovePCInstance(223, $PoTimeB_Instance_ID_2, $the_X, $the_Y, $the_Z, $the_H);
            }
        }
        ##
        ## End Instance Code
        ##
    }
    else {
        $client->Message(14, "The Portal is locked.");
    }
}
#END sub EVENT_CLICKDOOR

# This is a boolean return method undef for false and 1 for true
sub Five_Bosses_Are_Dead {
    my $Elemental = $entity_list->GetMobByNpcTypeID(219059);
    my $Undead = $entity_list->GetMobByNpcTypeID(219060);
    my $Animated = $entity_list->GetMobByNpcTypeID(219061);
    my $Golem = $entity_list->GetMobByNpcTypeID(219062);
    my $Guardian = $entity_list->GetMobByNpcTypeID(219063);
    if($Elemental || $Undead || $Animated || $Golem || $Guardian) {
        quest::ze(15, "A booming echo bellows from across the sky, 'You have more to dispatch to appease the gods...'");
        return undef;
    }
    return 1;
}

sub EVENT_DISCONNECT {
    quest::setglobal("potimeaLD.".$name, "1", 7, "H7");
}

