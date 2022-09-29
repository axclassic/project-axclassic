# The Plane of Time player.pl

sub EVENT_ZONE {
    quest::delglobal("potimebLD.".$name);
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
    #phase5_flagquest::ze(15, "Congdar enter potimeb signaling 223111 with 1000.");
    quest::signalwith(223111, 1000, 10000);
    my $QGlobalValue1 = $client->GetQGlobal($name.".potimeb_corpse");
    if($QGlobalValue1) {
        quest::delglobal($name.".potimeb_corpse");
    }
}
#END sub_EVENT_ENTERZONE

sub EVENT_CLICKDOOR {
    my $d_id = ($doorid % 256);
    #phase5_flagquest::ze(15, "doorid is $doorid and d_id is $d_id.");
    if((($d_id == 62) || ($d_id == 241) || ($d_id == 242) || ($d_id == 243) || ($d_id == 244)) && (defined $qglobals{portal3})) {
        #moves to portal 4 spot upon phase 3 completion
        my $QGlobalValue2 = $client->GetQGlobal($name.".potimeB");
        #phase5_flagquest::ze(15, "QGlobalValue2 = $QGlobalValue2");
        if($QGlobalValue2) {
            if($client->GetGroup()) {
                quest::AssignGroupToInstance($QGlobalValue2);
                quest::MoveGroupInstance(223, $QGlobalValue2, -401, 0, 347, 64.6);
            }
            else {
                quest::AssignToInstance($QGlobalValue2);
                quest::MovePCInstance(223, $QGlobalValue2, -401, 0, 347, 64.6);
            }
        }
        #spawn phase4_trigger.pl
        quest::spawn2(223157,0,0,-410,-69,348,0);
    }

    if((($d_id == 24) || ($d_id == 245) || ($d_id == 246) || ($d_id == 247) || ($d_id == 248)) && (defined $qglobals{portal4})) {
        #semi last phase
        my $QGlobalValue2 = $client->GetQGlobal($name.".potimeB");
        #phase5_flagquest::ze(15, "QGlobalValue2 = $QGlobalValue2");
        if($QGlobalValue2) {
            if($client->GetGroup()) {
                quest::AssignGroupToInstance($QGlobalValue2);
                quest::MoveGroupInstance(223, $QGlobalValue2, -419, 0, 4, 64.6);
            }
            else {
                quest::AssignToInstance($QGlobalValue2);
                quest::MovePCInstance(223, $QGlobalValue2, -419, 0, 4, 64.6);
            }
        }
        # phase5_trigger.pl
        quest::spawn2(223158,0,0,-415.5,-68.8,3.3,0);
    }

    if((($d_id == 51) || ($d_id == 249) || ($d_id == 250) || ($d_id == 251) || ($d_id == 252)) && (defined $qglobals{portal5})) {
        #To Quarm the end in front!
        my $QGlobalValue2 = $client->GetQGlobal($name.".potimeB");
        #phase5_flagquest::ze(15, "QGlobalValue2 = $QGlobalValue2");
        if($QGlobalValue2) {
            if($client->GetGroup()) {
                quest::AssignGroupToInstance($QGlobalValue2);
                quest::MoveGroupInstance(223, $QGlobalValue2, 268, -1121, -2, 64.6);
            }
            else {
                quest::AssignToInstance($QGlobalValue2);
                quest::MovePCInstance(223, $QGlobalValue2, 268, -1121, -2, 64.6);
            }
        }
        #spawn quarm_trigger
        quest::spawn2(223159,0,0,166,-938,9.7,0);
    }

    if(($d_id == 236) || ($d_id == 237) || ($d_id == 238) || ($d_id == 239) || ($d_id == 240)) {
        # Corpse recovery in potimeb sends you back to potimea
        my $QGlobalValue2 = $client->GetQGlobal($name.".potimeA");
        #phase5_flagquest::ze(15, "QGlobalValue2 = $QGlobalValue2");
        if($QGlobalValue2) {
            if($client->GetGroup()) {
                quest::AssignGroupToInstance($QGlobalValue2);
                quest::MoveGroupInstance(219, $QGlobalValue2, 1, 6, 8);
            }
            else {
                quest::AssignToInstance($QGlobalValue2);
                quest::MovePCInstance(219, $QGlobalValue2, 1, 6, 8);
            }
        }
    }
}
#END sub_EVENT_CLICKDOOR

sub EVENT_DISCONNECT {
    # S20  20 seconds qglobal
    quest::setglobal("potimebLD.".$name, "1", 7, "H7");
}

