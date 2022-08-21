# The Plane of Time player.pl

sub EVENT_ZONE {
    @corpse = $entity_list->GetCorpseList();
    if(@corpse) {
        foreach $ent (@corpse) {
            $corpseName = $ent->GetOwnerName();
            if($corpseName eq $name) {
                quest::setglobal($name."potimeb_corpse", "1", 7, "D7");
            }
        }
    }
}
#END sub EVENT_ZONE

sub EVENT_ENTERZONE {
    quest::ze(15, "Congdar enter potimeb signaling 223111 with 1000.");
    quest::signalwith(223111, 1000, 10000);
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
}
#END sub_EVENT_CLICKDOOR

sub EVENT_CONNECT {
    quest::delglobal("aLD$name");
}

sub EVENT_DISCONNECT {
    # S20  20 seconds qglobal
    quest::setglobal("aLD$name", "1", 7, "F");
}

