my $did_dt = 1;

sub EVENT_DEATH {
    quest::stoptimer("tsldt");
    if($entity_list->GetMobByNpcTypeID(71013)) {
        quest::spawn(71012,0,0,760.0,-243.0,416.25);
    }
    else {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        $did_dt = 1;
        $sirran = undef;
        quest::setglobal("sirran",5,3,"M10");
        quest::spawn(71058,0,0,$x-10,$y,$z+10);
    }
}

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
        if($did_dt < 2) {
            $did_dt = $did_dt + 1;
            my $targetmob1 = $npc->GetHateTop();
            my $targetid1 = $targetmob1->GetID();
            quest::castspell(982, $targetid1);
            quest::settimer("tsldt",45);
        }
    }
    else {
        quest::stoptimer("tsldt");
    }
}

sub EVENT_TIMER {
    if($timer eq "tsldt") {
        my $targetmob2 = $npc->GetHateTop();
        my $targetid2 = $targetmob2->GetID();
        quest::castspell(982, $targetid2);
    }
}
#The_Spiroc_Lord NPCID: 71012

