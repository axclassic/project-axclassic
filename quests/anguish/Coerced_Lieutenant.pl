## Coerced_Lieutenant (317114) ##

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
        if(!$npc->GetTarget()) {
            Get_Target();
        }
    }
}
sub EVENT_DEATH {
    quest::stoptimer("gettarget");
    my $death_x = $npc->GetX();
    my $death_y = $npc->GetY();
    my $death_z = $npc->GetZ();
    quest::spawn2(317114, 0, 0, $death_x, $death_y, $death_z, 0);
}

