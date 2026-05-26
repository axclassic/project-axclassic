## Frenzied_Lasher (317133) ##

sub EVENT_SIGNAL {
    Get_Target();
}

sub Get_Target {
    my $omm = $entity_list->GetMobByNpcTypeID(317000);
    if($omm) {
        my $HateTarget = $omm->GetHateRandom();
        if($HateTarget) {
            $npc->AddToHateList($HateTarget, 100);
            quest::settimer("gettarget", 5);
        }
    }
}

sub EVENT_TIMER {
    if($timer eq "gettarget") {
        quest::stoptimer("gettarget");
        if(!$npc->GetTarget()) {
            Get_Target();
        }
    }
}

