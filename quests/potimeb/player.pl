# The Plane of Time player.pl

sub EVENT_ZONE {
    @corpse = $entity_list->GetCorpseList();
    if(@corpse) {
        foreach $ent (@corpse) {
            $corpseName = $ent->GetOwnerName();
            if($corpseName eq $name) {
                quest::setglobal($name.".potimeb_corpse", "1", 7, "D7");
                #randomize corpse loc in graveyard area
                my $ex = int(rand(40));
                my $yy = int(rand(45));
                $ent->GMMove(854.8+$ex, -246.2+$yy, 395.8);
            }
        }
    }
}
#END sub EVENT_ZONE

sub EVENT_ENTERZONE {
    quest::ze(15, "Congdar enter potimeb signaling 223111 with 1000.");
    quest::signalwith(223111, 1000, 10000);
    my $QGlobalValue1 = $client->GetQGlobal($name.".potimeb_corpse");
    if($QGlobalValue1) {
        quest::setglobal($name.".potimeb_corpse", "1", 7, "S5");
    }
}
#END sub_EVENT_ENTERZONE

sub EVENT_CLICKDOOR {
    my $d_id = ($doorid % 256);
    quest::ze(15, "doorid is $doorid and d_id is $d_id.");
    if(($d_id == 62) && (defined $qglobals{portal3})) {
        #moves to portal 4 spot upon phase 3 completion
        quest::movepc(223, -401, 0, 347);
        #spawn phase4_trigger.pl
        quest::spawn2(223157,0,0,-410,-69,348,0);
    }

    if(($d_id == 24) && (defined $qglobals{portal4})) {
        #semi last phase
        quest::movepc(223, -419, 0, 4);
        # phase5_trigger.pl
        quest::spawn2(223158,0,0,-415.5,-68.8,3.3,0);
    }

    if(($d_id == 51) && (defined $qglobals{portal5})) {
        #To Quarm the end in front!
        quest::movepc(223, 268, -1121, -2);
        #spawn quarm_trigger
        quest::spawn2(223159,0,0,166,-938,9.7,0);
    }

    if($d_id == 236) {
        my $QGlobalValue2 = $client->GetQGlobal($name.".potimeA");
        quest::ze(15, "QGlobalValue2 = $QGlobalValue2");
        if($QGlobalValue2) {
            if($client->GetGroup()) {
                quest::AssignGroupToInstance($QGlobalValue2);
                quest::MoveGroupInstance(219, $QGlobalValue2, 1, 6, 8);
            }
            else {
                quest::AssignToInstance($QGlobalValue2);
                quest::MovePCInstance(219, $QGlobalValue2, 1, 6, 8);
            }
            return;
        }
    }
}
#END sub_EVENT_CLICKDOOR

sub EVENT_CONNECT {
    quest::delglobal("potimebLD$name");
}

sub EVENT_DISCONNECT {
    # S20  20 seconds qglobal
    quest::setglobal("potimebLD$name", "1", 7, "F");
}

